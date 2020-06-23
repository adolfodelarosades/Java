# 7. Configuraciones JPA y uso de Hibernate 01:30:31

* 28 Ajuste de relaciones 06:54
* 29 Claves compuestas 07:41
* 30 Utilización de motor hibernate 12:39
* 31 Carga de datos en modo lazy con Hibernate 04:57
* 32 Utilización del framework de hibernate 13:54
* 33 El API de Hibernate 06:21
* 34 Utilización del API de Hibernate en una aplicación 18:29
* 35 Ell API Criteria 03:44
* 36 Ejercicio práctico VI 07:27
* Autoevaluación VI 01:00
* Resumen final 07:25

# 28 Ajuste de relaciones 06:54

<img src="images/28-01.png">

<img src="images/28-02.png">

<img src="images/28-03.png">

Después de estudiar la creación y manipulación de entidades relacionadas.

Vamos a ver cómo realizar algunos ajustes en las relaciones de manera que nos permitan optimizar el trabajo sobre la capa de persistencia.

La primera de esas operaciones de ajuste que vamos a realizar vamos a ver cómo realizar es la carga de datos relacionados.

Y es que en una relación podemos configurar la manera en la que se van a cargar los datos relacionados.

La manera en la que lo vamos a hacer es a través de un atributo llamado fets que vamos a poder indicar en las anotaciones arroba o humani arroba Manitú Juan y arroba monitoreen.

Cuáles son los posibles valores que puede tomar este atributo pues son estos dos posibles valores que ves aquí que corresponden a unas constantes definidas en la notación Feldstein está el valor Hiller y el valor Leuzzi qué significa que el atributo Fetch tenga el valor higher significa que a la hora de por ejemplo hacer una búsqueda en una entidad los objetos relacionados se van a cargar dentro de la colección o dentro del atributo de la clase dependiendo si en cuanto medio sitúan en el mismo momento en el que se carga la entidad principal de la entidad localizada en el caso de la acción Lasi.

Entonces cuando se hace una carga de una entidad de la entidad principal los datos relacionados no se van a cargar en memoria en ese momento solamente se cargarán cuando vayan a ser utilizados es decir a la hora de llamar al método que el nombre del atributo de la entidad que vamos a recuperar.

Eso nos va a permitir hacer esos ajustes de manera que dependiendo de si queremos tenerlo todo desde el principio o si no queremos queremos optimizar el consumo de memoria y no queremos tenerlos todos los datos cargados hasta que van a ser utilizados.

Podemos jugar con los valores Hiller o Leuzzi si no indicamos nada pues cada motor de persistencia definirá su propio valor y dependiendo del tipo de relación definirán su propio valor predeterminado.

Pero si queremos establecer uno concreto si tenemos esos atributos como vamos a ver ahora en uno de los ejercicios que hicimos en las lecciones anteriores el otro tipo de ajuste que podemos realizar son

las actualizaciones en cascada.

Si nosotros hacemos una operación sobre una entidad una eliminación un refresco o una actualización qué pasa con los objetos de las entidades relacionadas se van a actualizar también se van a eliminar.

En principio no va a pasar nada con ellos a no ser que queramos nosotros propagar alguna o todas las operaciones sobre la identidad principal.

También en las entidades relacionadas.

Eso lo vamos a indicar a través del atributo Cascade también de las mismas anotaciones.

Cuánto Meini reditúan Toumani utilizando alguna de las constantes definidas en la notación Qashqai.

Por ejemplo si a la hora de eliminar una entidad queremos que también se eliminen los objetos relacionados puesto que no tendría sentido lo mejor que quedarán esos objetos en la base de datos las filas correspondientes en la base de datos.

Una vez que se ha eliminado la actividad principal podríamos propagar la operación de eliminación utilizando este valor en el atributo casque.

Vamos a ver el atributo Qashqai y Ramu dentro del atributo Qashqai.

Bueno lo mejor vamos a verlo como decía sobre uno de los ejercicios el último que hicimos el ejercicio práctico número 5 lo teníamos también la gestión de ventas y tal aunque bueno ahora vamos a centrarnos concretamente en las entidades setiene y producto por ejemplo ya sabemos que hay una relación uno a muchos y muchos a uno en sentido contrario pero hay uno una relación muchos entre sección y producto.

Queremos que se carguen todos los productos dentro del atributo de colección de la entidad sección cuando se haga la localización o la búsqueda de una determinada sección o dependiendo si queremos que sea así o no sea así.

Utilizaremos y configuramos el atributo Fetch que hemos comentado anteriormente dentro de la notación de la que define la relación.

Por ejemplo aquí nosotros no queremos que al cargar un objeto sección al hacer un fino objeto sección o QWERTY no queremos que se carguen todos los objetos productos relacionados de cada sección.

En esa variable solamente cuando se llame al método Ogueta a diez productos.

Bueno pues entonces si no os queremos que se carguen inmediatamente había que hacer lo que se conoce como una carga perezosa y eso se indica como decía antes a través del atributo Fetch indicando una de las dos posibles constantes que hemos hemos dicho antes.

En nuestro caso queremos que sea la carga perezosa para que no se ha encargado inmediatamente queremos lo contrario que se cargue todo el mismo momento en el que se carga también la sección pues que vengan también sus productos.

Sería como si no se dice nada pues lo dejaríamos al valor por defecto que tenga cada motor de persistencia y según cada relación mixups habría que consultar la documentación de dicho motor o proveedor de persistencia.

Esto por un lado sobre el tema de las actualizaciones las actualizaciones en cascada.

Por ejemplo si nosotros queremos tenemos una relación uno a muchos entre producto y venta queremos que al ser eliminado un producto por ejemplo se eliminen todos sus ventas relacionadas.

Podría tener sentido porque si ya no existe un producto qué sentido tiene que estén registran sus ventas en la base de datos también pues entonces lo que podríamos hacer en la relación uno a muchos entre producto y venta en cuanto Beni definiríamos el atributo Qashqai en el atributo Qashqai indicaremos.

Pues que queremos propagar la operación de eliminación atravez.

Como decíamos antes de la anotación Qashqai Toit que tiene una serie de constantes entre las cuales está remó si quisiéramos propagar más de una operación entonces deberíamos indicar la lista de constantes entre llaves Qashqai terremoto como por ejemplo pues también la actualización rasqueta y de esta manera pues estaríamos propagando estas dos operaciones si quisiéramos propagar las todas.

Eso ya depende de cada caso si tiene sentido o no en este caso pues no tendría mucho sentido a lo mejor es que si se da de alta un producto se den de alta sus ventas porque a lo mejor no existen todavía ese tipo de operación igual no tiene mucho sentido pero en cualquier caso que por lo que sea queremos propagar todas las operaciones no hace falta que pongamos todas las constantes posibles está la constante que significa propagar todas las operaciones a la entidad relacionada.

Bueno pues ya he visto de qué manera se puede ajustar y optimizar las relaciones entre entidades.

# 29 Claves compuestas 07:41

En los ejemplos de entidades que hemos visto hasta el momento siempre hemos trabajado con claves primarias simples es decir los atributos de esas clases pues estaban asociados a una única columna de la tabla en la base de datos puesto que es la propia base de datos en la tabla.

La clave primaria era una única columna.

Pero qué ocurre si nos encontramos con tablas cuya clave primaria es la combinación de dos o más columnas.

Bueno pues cómo proceder vamos a nivel de capa de persistencia a nivel de capa de persistencia.

Tendríamos que definir una clase en tipo Java brinquen Capsule los datos de dicha prima Key dicha clave primaria compuesta es decir en caso Lauría las dos o más columnas que formarán la primaria que después a nivel de la entidad en vez de definir un atributo por cada una de las columnas definiríamos un único atributo asociado a dicha clase.

Este Jabari encapsula la primeroque además habría que incluir unas anotaciones que vamos a ver ahora.

El ejemplo que vamos a proponer a continuación supongamos por ejemplo que tenemos nuestra tabla de almacén como la que hemos trabajado ya en otros ejercicios y en ella añadimos una nueva tabla sucursales que representa o que contienen los datos de las diferentes sucursales en las que se van a realizar las ventas del almacén.

La verdad es que eso es lo de menos lo importante es que pasamos a tener cuatro campos cuatro columnas nombre calle presupuesto inauguración.

Y lo interesante por el motivo que sea hemos decidido que la primera ICAI de esta tabla es la combinación de las columnas nombre y calle tiempos qué tendríamos que hacer a nivel de capa de persistencia. 

Tendríamos primero que crear una clase tipo Abadín a la que llamaríamos habitualmente como el nombre de la entidad que vamos a crear después terminaba en la sucursal p.k en este caso que en Capsule como veis en este caso las dos columnas nombre y calle aquí tendríamos entonces dos atributos los campos asociados a estas dos columnas.

Por supuesto se Perimeter para acceder a ellos y muy importante esta clase Java debe sobrescribir los métodos e hija Xcode puesto que son métodos son en los que se basa el motor de persistencia para determinar la igualdad de las entidades y por lo tanto también la igualdad de las primera y qué decir.

Una primera y se distingue de otras no porque mire los valores de los atributos sino en función de lo que determinen los métodos e hijas con bien.

Otra cosa importante tendrá que estar anotada en esa clase con esta notación arroba en védico esto en cuanto a la clase primero y qué pasa con la clase entidad sucursal se definirá como una entidad como otra cualquiera pero eso sí en vez de definir un atributo por cada una de las columnas define un único atributo del tipo de la primera.

Como veis aquí definimos un atributo de tipo sucursal PK.

El resto de los atributos igual con sus métodos setter getter y muy importante en vez de la notación arroba IDIC en la que hemos utilizado las primarias simples se utilizaría la notación arroba en vez de Goyri para anotar la primera compuesta.

Vamos a ver eso sobre un ejemplo ya tenemos aquí creado vamos a Eclipse tengo aquí a una aplicación web creada se ha creado sobre el servidor Donka se ha activado el proyecto faites JPA tenemos ya que persiste en XML con los datos de conexión a la base de datos almacén.

El nombre de la Unidad de persistencia y tengo aquí una clase que la analizaremos que encapsula una serie de operaciones con esa entidad para que el tratamiento de la entidad una vez que ya se ha creado es exactamente igual que con las entidades que tienen clase primaria simples y lo único que queda es crear precisamente la entidad para que veas que lo vamos a hacer con el asistente de Eclipse y verás cómo es exactamente igual que con el caso de las entidades que hemos creado hasta el momento todo se va a generar de forma automática incluido la clase que encapsula la Primary el proceso es el mismo con el botón derecho JPA Tools generar entidades desde tablas elegimos la conexión con la base de datos que ya la tenemos creada de ejercicios anteriores almacén y SQL.

Acuérdate del truco que te enseñé si no te aparece la lista de tablas pues entonces te vas a la lista Database Deployment hacer la conexión por si acaso a la de cerrar el eclipse o se cierran esas conexiones entonces no te aparecen pero bueno ya la tengo yo aquí.

Sucursales selecciono me voy al siguiente paso no hay asociaciones porque sólo vamos a generar una entidad con una única tabla.

Evidentemente si esa tabla estuviera relacionada con otras pues igual que hemos hecho caso de las entidades de clave primaria simple pues se añadirían aquí se indicarían cuáles son los campos de relación entre cada tabla y sería exactamente igual.

Proceso es el mismo.

Bueno vamos al siguiente paso.

Aquí ya le indicamos que queremos en el paquete entidades que genere la entidad en ese paquete y en el último paso decir que la clase de entidad se va a llamar sucursal y evidentemente no vamos a ser de tipo entidad porque ser compuesta pues está formada por la combinación de dos columnas con valores específicos como él no me pregunta nada sobre la clase Primary que la va a generar automáticamente al darse cuenta que la tabla o sucursales tiene una primaría formada por dos columnas.

Al finalizar lo vamos a ver automáticamente.

Aquí tenemos sucursal p.k pues como veis una clase con arroba en béisbol los métodos se periquete y l Xcode sobre escritos de modo no se ha hecho una implementación por defecto son métodos con la que nos podemos quedar por supuesto y estar seguros de que cuando sean distintos nombres distinta calle los objetos van a ser diferentes y cuando sea el mismo nombre la misma calle van a ser iguales es la implementación que se ha hecho.

Y bueno lo que es la entidad aquí la tenemos en la entidad sucursal igual con sus anotaciones de siempre es una Mercuri y eso sí el atributo del tipo sucursal peca con en vez de Arroba Heydi arroba en vez de Goyri.

Por lo demás a partir de ahora la manipulación de esa entidad exactamente igual que como las entidades de clave primaria simple por ejemplo lo vamos a ver aquí.

Aquí he creado esta clase pues no es una pareja es una clase normal Timaná.

Vamos a centrarnos en nuestros métodos.

Por ejemplo un método que para buscar una sucursal una búsqueda en clave primaria.

Pues claro lo que va a recibir no va a ser un único valor sino recibir dos con la clave primaria está formado por dos valores string crearíamos un objeto de la clave primaria como lo tenemos constructor con los dos parámetros por los asignaremos con los setter y a la hora de hacer el filme como si vamos a buscar un objeto sucursal y la clave primaria según string un entero etcétera es un objeto de esta clase.

Por lo demás exactamente igual.

Por ejemplo si tuviéramos que montar una cuerito imaginaros por ejemplo que queremos localizar todas las sucursales a partir de un determinado valor que además es un valor de la prima y que parte de la primera y solamente la calle podríamos montar la J.P. QL como veis aquí devuélveme todas las sucursales cuyo calle ves del atributo de que es como se llama el atributo de la primary key.

Pues es igual al parámetro asignarían el parámetro Rasul Lis es decir el tratamiento de la entidad.

Una vez que ya se ha creado es exactamente igual que si tuviera una Primary simple.

# 30 Utilización del Motor Hibernate 12:39

En las aplicaciones que hemos estado desarrollando hasta el momento hemos empleado siempre el motor de Eclipse Link como motor de persistencia dentro de una aplicación.

Sin embargo una de las implementaciones clásicas de persistencia es la combinación del motor de Hibernate con el API JPA.

Vamos a ver cómo realizar esto básicamente se trata de modificar la configuración básicamente porque lo que es el código JPA es exactamente igual al que hemos estado utilizando hasta el momento.

Lo primero que tendríamos que hacer si estamos utilizando Maven es incluir la referencia en las librerías del motor de Hibernate que es el Hibernate Core en el XML.

Esto haría que se cargasen todos los Jar asociados a dicho motor.

Por otro lado en el persiste en XML en vez de dejarlo vacío como hemos hecho hasta el momento para que cogiera el motor por defecto tendríamos que indicar a través de esta elemento de Provider que queremos utilizar el motor Hibernate persisten Robayna y nada más el resto ya es código JPEG.

Con eso quedaría configurada la capa de persistencia.

Por supuesto se crearían las entidades igual exactamente igual que hemos estado haciendo hasta ahora.

Y por supuesto JPA ningún cambio en cuanto a las instrucciones a utilizar puesto que el motor de Hibernate es compatible con JPA.

Esa es la idea.

Bueno pues vamos a ver si partimos de uno de los ejercicios que tenemos hecho en él por ejemplo el ejercicio práctico número 2 donde trabajábamos habíamos creado una aplicación web como recordaras que se ejecutaba sobre Tomcat y teníamos aquí la capa de lógica de negocio implementada con clases estándares y estábamos utilizando el motor Eclipse.

Bueno pues vamos a ver vamos a migrar esa aplicación a Hibernate vamos a utilizar el motor DuVernay entonces  vamos a crear una copia del proyecto no pegamos y lo vamos a renombrar vamos a llamar pues agenda que era la aplicación de la agenda de contactos motor Hibernate bien vamos a quedarnos con ese mismo nombre para utilizarlo como conté RUT o dirección de la aplicación web.

Vale nos vamos a las propiedades y employer settings modificamos el Conde-Ruiz de la aplicación aplicamos.

No le voy a dar OC porque ya que estamos aquí las propiedades del proyecto voy a cambiar otra cosa es la propiedad JPA.

En su momento pues claro utilizamos el eclipse Elim pero ahora ya no queremos utilizar ese motor.

Vale entonces no queremos que se incorporen esas librerías simplemente entonces si no vamos a utilizar ni el eclipse Link ni tampoco digamos las librerías del motor de glacis no lo vamos a ejecutar sobre Graphic desactivamos la Library configuration y gastã pulsamos el botón OK y ahora ya vamos a seguir los pasos que hemos visto en la presentación.

Primero en el XML pues aquí añadiremos una entrada correspondiente a la librería del motor Hibernate teníamos JSTL el trailer de mayo se cuele.

Bueno pues vamos a añadir tenemos por aquí esta dependencia la incluimos aquí y esto ya hará que se incorpore el motor de Hibernate que son varios dentro de nuestro proyecto al guardar.

Vamos a ver nos vamos a ir a la pestaña dependencias para que veas.

Se ha creado a partir de los que ya teníamos la dependencia Liver no te Kore y si te fijas en esta pestaña dependencias aquí no es que este a su vez depende de otros muchos.

Realmente son todos librerías las que se han incluido y gracias a MAVEN no hemos tenido que incluyéndola a nosotros una por una.

Bien lo siguiente era registrar el motor de Ibermedia persiste en XML es decir esta etiqueta Provider nos vamos a ir aquí a nuestro persiste en XML.

No podemos saber más desde aquí a la pestaña Source código fuente y vamos a incluir como primera entrada de la Unidad de persistencia el Hibernate persisten proteinas los datos de conexión a la base de datos no cambia es decir a pesar de que estemos utilizando este motor hay que proporcionarle igualmente las propiedades de conexión a la base de datos y esas propiedades los nombres de esas propiedades.

Sí es cierto que el motor Giverny tiene unos nombres de propiedades que son equivalentes a estas.

Evidentemente la arregle el usuario por el driver pero estos son también nombres estandarizados de JPA que podremos utilizarlos igual puesto que como te digo el motor de Hibernate es compatible con JPA.

Bueno pues nada más vamos a cambiar el nombre de la Unidad de persistencia le vamos a llamar su agenda el mismo nombre del proyecto MEIC y entonces ese mismo nombre lo utilizaremos.

Vamos a ver aquí guardando en la lógica de negocio a la hora de cargar la unidad de persistencia.

Esta sería la unidad de persistencia y por aquí lo mismo.

Por nada guardamos todo y si ejecutamos la aplicación pues tiene que seguir funcionando exactamente igual que funcionaba antes puesto que es el motor compatible con JPA.

Aquí son unos errores pero realmente esos errores no existen como tal simplemente que la clase no tiene errores no aparecen por aquí eso el editor de Eclipse que hay veces que se queda esa información ahí una vez que la volvamos a abrir.

Bueno parece que seguir dando como si no reconociera pero realmente están aquí ya esas librerías de JPA persistencia JPA puesto que están incluidos dentro de el motor de Hibernate aquí tendríamos que tener las dependencias de Mabe me estoy dando cuenta de que no aparecen las independencias y que se esté dando este error.

Vamos a ver el POM está todo guardado.

Hay veces que si esto ocurre sí ocurre en este tipo de cosas que no ha registrado la dependencia a las librerías y no aparecen aquí.

Pues vamos a hacer una no vamos a ir al menú del botón derecho del proyecto y vamos a ver en una opción que por aquí propiedades Maven efectivamente actualiza el proyecto a ver si actualizando el proyecto carga las librerías dentro de las dependencias del proyecto.

Ahora si lo ha hecho.

Bueno ahora ya sí que ha incluido alojar y probablemente todos esos errores pues desaparecen automáticamente.

Por qué no lo ha incluido directamente al haber copiado la dependencia dentro del POM y haberlo guardado.

Normalmente lo tiene que hacer así pero hay veces que el eclipse simplemente se hace esa actualización es el truco.

Vuelvo a repetir.

Botón derecho sobre el proyecto Maven un tipo de proyecto y si no se ve que no se han incluido antes ahora al hacer esta actualización ya las habrá tenido que incluir.

Bien pues nada vamos a probarlo y vas a ver que el funcionamiento es exactamente el mismo que tenía antes y que permitirá realizar las mismas tareas.

Lógicamente vamos a ver que dice que era un error de publicación si es que no me ha cambiado el ruta en la propiedad de vuestro settings.

Pues efectivamente no me lo ha cambiado con Carruth que solo vea como hay otra aplicación con la misma dirección pues eso no lo permite entonces ponerlo en la Motor y Bernet es el terror de la aplicación aplicábamos que hay y bueno pues vamos a hacer una limpieza del proyecto también en el proyecto Clean reflex que todo y bueno vamos a volver a probar de nuevo probablemente se habrá quedado publicada vamos a descubrir todas las aplicaciones que tenemos hoy en Tomcat.

Bueno realmente sería esta la agenda motor en la nuestra vamos a quitarla para que la vuelva republicar con la dirección correcta y bueno vamos a probar de nuevo observed las tareas que a veces es el eclipse parece que se pone duro y que hay veces que cuesta arrancar los proyectos con este tipo de cosas.

Bueno ya por fin hemos entrado levamos un usuario que se ha valido de la tabla de usuarios bueno por saber ahora lo que ha ocurrido 3 1 3 1 parece que no ha cogido sabia decisión.

Vamos a ver lo que le pasa ahora vamos a parar el Tomcat a ver si cuando un servidor consigue Bueno hay otra cosa que me estoy dando cuenta ahora esto ya que parece ser que Eclipse se ha querido poner ahora dudo ya en las últimas fases del curso y hay una cosa como te decía que me estoy dando cuenta ahora y la verdad que me alegro que haya ocurrido porque puede ser que en algún momento te ocurra a ti fíjate aquí abajo eso ocurre con completamente con la versión de Marte puede ser que con alguna otra también pero yo lo he sufrido ya con esta versión y es que hay veces que se queda ahí como pues actualizando espacio se queda colgado entonces cualquier cambio que hagas pues por ejemplo el publicado esta aplicación y no reconoce que la haya publicado porque realmente el hecho de que haya un error 404 es que como si no lo hubiera publicado vamos a ver ahora es que ya ni siquiera ni siquiera entra.

Bueno pues eso es porque se queda haciendo tareas en segundo plano y se queda el juego.

Aquí se ha quedado totalmente colgado si fuéramos capaces de ver aquí al hacer doble click en ese Incognito intermitente vemos deconstruyendo con los países que se han quedado ahí colgado qué hay que hacer cuando ocurre eso.

Pues tan simple como cerrarlo y volverlo a abrir.

Así que lo vamos a cerrar y lo voy a volver a abrir después a ver si con esto pues ya verás cómo se soluciona Bueno pues ya reinicia el eclipse y como veis ya no tenemos aquí ese Incognito de estar constantemente construyendo workspace.

Por lo tanto no he tocado nada no hemos tocado nada como lo que habíamos hecho la configuración del sistema XML el XML.

No hemos tocado nada en la lógica de negocio que sigue siendo la misma que teníamos en el ejercicio 2 puesto que el motor Hibernate como ya he dicho varias veces es compatible con JPA y vamos a comprobar que el funcionamiento es exactamente el mismo.

Ejecutamos sobre Tomcat el proyecto 1 1 y de momento nos está cargando Akiko Sadi Verneuil etc. tarda un poquito más.

Bueno pues vamos al menú es decir nos autenticado vemos nuestra lista de contactos veremos que podemos añadir un nuevo contacto arroba gmail.com por ejemplo al ver los contactos pues ahi lo tenemos y por supuesto nos dejará eliminar tambien es decir que independientemente del motor utilizado pues JPA Es el mismo en todos los casos y esta combinación JPA y Bernays motor y Hibernate es muy utilizada en muchos de los desarrollos de aplicaciones empresariales.

# 31 Carga de datos en modo lazy con Hibernate 04:57

Después de ver cómo utilizar el motor de Internet en una aplicación JPA en la que hemos utilizado una única entidad vamos a ver qué ocurriría cuando trabajamos con entidades relacionadas.

Dónde.

Pues como sabes al cargar una entidad se cargan también los datos relacionados de las entidades relacionadas que pueden ser en modo Leuzzi o bien cuando el modo es el modo predeterminado de cargar datos.

Es ley si se produce un problema que vamos a analizar a continuación vamos a centrarnos por ejemplo en uno de los casos de ejemplos que hemos estado viendo donde teníamos una aplicación en la que se trabajaba con secciones a las que se les relacionaba productos.

Entonces al recuperar un objeto su sección de secciones como las entidades estaban relacionadas.

Recuperábamos también la lista de productos asociados.

Por ejemplo aquí tenemos la instrucción a través de la intuitiva Ayer llamamos al método Fain le indicamos por ejemplo Rahim para localizarlo por identificador de sección pero podría ser utilizado también con quereís.

El caso es que obtenemos el objeto sección y con él los objetos relacionados.

Pero cuando la carga sí pues sabemos que esos datos no se obtienen en la misma consulta sino que para ganar eficiencia y menor consumo de memoria solamente se obtiene el objeto principal.

Esa es la carga de datos que es la carga predeterminada además de los motores de persistencia y concretamente en el caso de Hibernate es así.

Pero qué ocurre con Hibernate.

Pues que al hacer la búsqueda de objetos se cierra una sesión interna que utiliza Hibernate para manejar los datos de la base de datos de modo que al intentar después a través de ese objeto sección obtener los productos como la sesión se ha cerrado.

Se produce una clásica sección llamada Leuzzi inicialización exception.

Cómo se soluciona eso.

Pues añadir.

Muy simple el problema.

La solución del problema en el sistema XML simplemente tenemos que añadir esta propiedad la propiedad tiene nombre y Bernadet en abril Silvano Tremps valor True para que la sesión no se cierre durante la carga de la entidad principal.

Vamos a ver esto con el ejemplo concretamente hemos estado analizando ahora se el ejemplo de que teníamos una aplicación donde le pedíamos al usuario seleccionar una sección y al elegir la sección se mostrasen los productos relacionados.

El aspecto de la aplicación es éste.

Consultamos las secciones y por ejemplo seleccionamos la sección ferretería vamos a pulsar el botón Ver productos aquí donde vamos a obtener esa excepción de la que estábamos hablando por utilizar el motor de Internet volvemos al eclipse y aquí lo vemos podemos comprobar es una versión del ejercicio número 5 donde hemos utilizado el motor de hibernan simplemente el único cambio que se ha hecho ha sido indicar como proveedor y Bernet existen Robayna.

Qué ocurre.

Pues que claro al utilizar este proveedor Hibernate pues al realizar esta operación recuperación de los productos recuperamos la sección con el método Fain y luego llamamos a productos para recuperar los productos asociados a la carga Leuzzi cuando se ha encargado esos productos al recuperar la sección sino que se hace o se intenta hacer mejor dicho en este momento la sesión ya se ha cerrado y se produce la inicialización excepción que hemos visto la solución como digo es irnos al persiste en XML y añadir esta propiedad menos vamos a recuperarla de la presentación en la que la hemos visto.

Aquí vamos a recuperar al copiar este texto no lo llevamos al que existe en XML mientras pegamos y ya con esto habilitamos y Bernet para que no cierre las sesiones cuando tiene la entidad principal.

Guardamos y si volvemos a ejecutar veremos que el problema ya se ha solucionado.

Vamos a volver a desplegar la aplicación observes y una vez que ya quede republicado veremos como vamos a ver donde ya está desplegada.

Si volvemos otra vez al navegador volvemos a recargar la aplicación seleccionamos la sección porque era de ellas productos.

Ahora ya el problema ha quedado resuelto.

# 32 Utilización del framework de hibernate 13:54

Ya hemos visto cómo utilizar el motor de Hibernate dentro de una capa de persistencia gestionada con JPA.

Sin embargo Hibernate es un framework completo que proporciona todo lo necesario para utilizarlo por sí solo para la gestión y la utilización de una capa de persistencia en una aplicación esos componentes son además del motor de Hibernate un sistema de configuración podríamos decir hay un archivo de configuración general que se llama Hibernate CFG XML donde es similar al persiste en XML pues se establecen todos los datos de conexión a la base de datos lista de entidades.

En cuanto a la configuración de las entidades se puede hacer de dos maneras bien mediante XML o anotaciones.

Si bien la primera opción es la clásica utilización de Hibernate desde las primeras versiones está ya bastante obsoleta y se tiende a utilizar anotaciones como he visto en JPA y por supuesto cuenta también con un API en de y el internet CFG XML como decíamos antes es similar pero en XML y ahí vamos a incluir los datos de conexión a la base de datos propiedades que necesite el motor para poder acceder a esa base de datos y gestionarla así como la lista de entidades lo que no vamos a incluir aquí obviamente es el motor de persistencia porque sólo puede ser el motor de Internet.

Aquí tenemos un ejemplo de cómo sería una Hibernate CFG XML.

Como veis va a poder definir una unidad de persistencia como hace JPA.

Aquí lo que se define es una factoría de sesión en sesión Factory que el concepto similar y dentro de esa sesión Factory establece las propiedades como nombre de propiedad del Beverley y los respectivos valores qué propiedades van a ser River que vamos a utilizar mezcladas contraseña o arreglo cadena de conexión usuario y ésta que no es obligatorio pero sí es conveniente que es el tipo de base datos Hibernate Dialnet y podemos xatos con la que vamos a trabajar para que el motor optimice optimice de alguna manera las consultas contradicha tipo de base de datos y a continuación en la etiqueta mapping la lista de entidades que van a formar parte de esa factoría de sesión.

Todo ello en un Bernays configuración en vez de utilizar dotado de conexión se podría utilizar también una tasa del servidor como se ha hecho con JPA una propiedad de éstas sería una propiedad que la propiedad del Data Ashur contra la que pudiéramos tener configurado un servidor de base de datos.

La configuración de entidades como hemos dicho se puede hacer mediante archivos XML uno por entidad es decir cada entidad debería llevar su archivo XML de configuración o mediante anotaciones que es la tendencia Hibernate pues es un framework que es realmente además de sufrir una implementación de JPA qué quiere decir esto.

Pues que las anotaciones que hemos visto JPA son están incorporadas también Hibernate y podemos utilizarlas para configurar las entidades y Bernays tiene también sus propias anotaciones pero digamos están la mayor parte de ellas obsoletas tiene otras que no lo están y servirían para otras tareas pero todas las anotaciones de JPA todas están incluidos también en Hibernate porque es una implementación de la especificación JPA.

Aunque insisto tiene otras propias para otras tareas que busque JPA No se pueden realizar como acceder a base de datos no SQL o alguna otra tarea que pueda realizarse también con internet.

Bien pues vamos a ver a continuación uno de los ejemplos que tenemos desarrollados de otros relaciones anteriores por ejemplo teníamos un ejercicio ejercicio práctico número 3 donde puedes accedíamos mediante JPA a una base de datos de contactos.

Pues lo que vamos a hacer es vamos a intentar migrar esa aplicación a Internet totalmente.

En lugar de utilizar JPA utilizar Internet que es realmente como vamos a ver la configuración de las entidades en la misma va a ser muy parecida.

Entonces nos vamos a centrar en lo que es en este vídeo concretamente la configuración el uso de la API lo dejamos para la posterior para la elección posterior.

He creado aquí una copia del proyecto renombrado como ejercicio práctico 3 y Verneuil.

Ahora mismo es exactamente igual que lo que tienes arriba que es lo son los pasos que tendríamos que hacer para poder utilizar Internet.

En primer lugar antes de empezar a configurar nada ni XML es lo que llamaríamos el setup del proyecto es decir que librerías tengo que incorporar a través de Maven.

Bueno pues lógicamente si vamos a utilizar conexiones directas con la base datos el droide.

Pero por supuesto el propio Hibernate aquí del ejercicio 5 donde utilizamos Hibernate como motor pues recordarás que en el POM tuvimos que añadir una entrada para Internet.

Esta dependencia pues esa misma vamos a copiar no hace falta que nos vayamos a buscarlo porque ya la tenemos ahí de otro proyecto y en este nuevo proyecto que hemos creado copia de ejercicio 3 veces nos vamos a supón y ahí o es pegamos esa dependencia para que incorpore toda la librería de Internet.

No sólo va el motor aquí la API todo lo que es la implementación de internet.

Bien vale eso por un lado.

Por otro lado como este proyecto estaba creado para JPA en su momento pues está activada la característica JPA está por ahí de hecho el persiste en XML está esto de Eclipse Link que es el motor de implicito que llevaba el servidor de aplicaciones de la física nosotros ya no vamos a ser porque vamos a auriverdes pero lo que vamos a hacer es desactivar esas opciones que nos vamos a ir a las propiedades del proyecto y aquí en Java vuelva.

De momento el Library de Eclipso Olimpos lo vamos a quitar no necesitamos esa librería para nada y en Provías Faces vamos aplicando desactivamos la opción JPA o simplemente el persiste en XML.

No se ha borrado sí pero no es que moleste pero lo vamos a quitar para que no pensemos que es que tendríamos que tener ese archivo de JPA y la idea es usar únicamente Internet aunque la mayor parte de las cosas que tiene Internet ya son adquiridas de JPA como por ejemplo y es por donde vamos a empezar ya la configuración.

Las entidades lasentidades ya en su momento las creábamos y las configuramos como JPA.

Bueno pues tal cual están las vamos a seguir utilizando porque insisto lo que hemos comentado antes las entidades se configuran con anotaciones y esas anotaciones de JPA en su momento también están incluidos ya en Internet y son de hecho las que se recomienda utilizar no las nativas de internet que están obsoletas sólo se han mantenido como no obsoletas aquellas otras anotaciones que siguen para cosas que JPA No llega como ya te he comentado antes pues hacer basaltos no se cuele o algún otro tipo de tarea bien.

Pues entonces qué significa eso.

Que toda la configuración que vimos entidades de entidades con estas anotaciones incluso las name Kuric diciendo todo es perfectamente válido y así se va a mantener nos falta el archivo de configuración y CFG XML.

Cómo añadimos ese archivo al proyecto o podemos crear un XML.

No podemos buscarlo por internet porque hay algunas plantillas o digamos una cosa también bastante cómoda es instalarnos en Eclipse un plugin que hay que sirve para muchas más cosas no solamente para Internet pero entre otras cosas incorpora una opción de menú para poder generar el archivo de configuración de internet de una forma mucho más cómoda.

Cómo instalaremos ese plugin en el eclipse marketplaces aquí buscamos ahora Hibernate no van a aparecer varias entradas vamos a buscar Internet y una de esas entradas va a ser las J Ra's Tools JBoss tus pasos.

Entre otras cosas pues tiene unos asistentes para trabajar con Internet.

Yo ya lo tengo instalado entonces como lo tengo instalado ya pero si no lo tienes instalado Talat aparecería aquí el botón Install.

Y bueno pues dentro de las opciones a ver si lo tengo yo por aquí por lo menos que aparezca la lista de opciones y que las podamos ver lo digo aquí por ejemplo Cheung que aparecería para cambiar esto es lo que te aparecería aquí toda la lista de opciones de en su momento en las que están marcadas o las que instalé y algunas malas quiero actualizar.

Evidentemente no tienes que instalar todo esto.

Lo único importante son las Hibernate y ahí ya con esto sales esta parte de las JBoss Tool es suficiente para que te parezca el menú que vamos a comentar a continuación en fin vamos a ver nos ponemos encima el proyecto y el botón derecho.

New poder dentro de joder pero es que cuando hayas instalado ese plugin que te acabo de comentar aparecerá una opción y Bernheim aquí la tenemos dentro de la cual aparecen varias opciones.

Estos son HCM XML son los archivos de mapeo que se llaman identidades para configurar entidades no como lo tenemos nosotros sino con XML lo cual eso ya también está bastante desfasado y no os recomiendo que se haga así sino con anotaciones.

Y bueno la que os interesa es el Hibernate configuración Feil nos vamos al paso siguiente y ahí nos va dedicado donde donde lo va a crear pues no hay config se va a crear y debe estar la carpeta donde están las clases se pueden meter en algún paquete o directamente en el paquete por defecto es decir en ese PC y el nombre es Bernays CFG XML en el siguiente paso pues ya nos va pidiendo incluso algunas propiedades básicas como las que hemos visto antes.

Vamos a coger la versión de Internet realmente todas son muy parecidas por lo menos acogerla 5 2 5 3 no está todavía a estas alturas un poquito sin depurar.

Bueno vamos a ir dándole algunas propiedades ya.

Realmente las que necesitamos son los datos de conexión y la lista de entidades eso habrá que dárselo después a posteriori.

Primero Factory session Factory que equivale equivale al nombre de la Unidad de persistencia o la llamamos Factory esto son contactos contactos y contactos tipo de base de datos para optimizar las consultas por mail SQL Drive el driver de la base de datos SQL.

Aquí tenemos un dato si no te apetece escribir lo puedes copiar de Combayo SQL JDBC trãiler mucho pero bueno cadena de conexión con lo mismo.

La cadena de conexión es la cadena de conexión clásica de Marie se huele y lo único que tendremos que cambiar es el nombre de la base de datos.

Al final me parece que es agendas de tema de fábula esquema de catálogo nada bueno.

Su uso es Nein Good y Ruth.

En nuestro caso o en tu caso los usuarios contraseña que tengas para conectar con se.

Bueno pues pulsamos el botón finish y ahora verás inyectarme y confi te lo muestra en más de una forma más amigable de pestañas vale.

Y bueno si quiero ver lo que es el código XML como tal como lo que teníamos antiecológico piénsese en Factory Factory contactos y las propiedades que acaba de editar nos faltaría que listarse las entidades que forman parte de esa factoría de sesión.

Esto se puede hacer también pues vamos a ver aquí más cómodamente o bien te vas al XML y los escribes directamente o donde está vista más amigable en la sección mapping con nosotros ahí añadimos a DD Class vamos a buscarla con el asistente y la primera de las entidades es contacto con stop en ese ejercicio práctico.

Esas firmas y aquí la tenemos siguiente mapping son dos clases contacto y usuario.

Añadimos también igual la misma manera buscamos un usuario aparece el proyecto donde está el finalizarlos y aquí tenemos configurado lo que sería la capa de persistencia utilizando Hibernate nativo archivo de configuración y Hibernate CFG XML y entidades configuradas con anotaciones al el siguiente vídeo por lo que vamos a ver es cómo acceder a la capa de persistencia del modelo usando el propio API de Hibernate.

Como veis es prácticamente el mismo de JPA de hecho ha adquirido ya en las últimas versiones todos los métodos todas las características de JPA.

Aparte de tener ya los suyos propios y clásicos antes.

# 33 El API de Hibernate 06:21

En esta elección vamos a ver cómo utilizar el de Bernet para manipular la capa de persistencia de una aplicación rápida y Hibernate.

Es un conjunto de clases e interfaces lo mismo que en el caso de JPA que se utilizan para acceder desde el modelo de la capa de la lógica de negocio de una aplicación a la capa de persistencia los datos.

Estas clases y interfaces encuentran un paquete o punto Hibernate que forma parte de ese conjunto de librerías deseable.

La realización de las operaciones básicas Club Creación recuperación de entidades actualización o eliminación de las mismas se va a realizar a través de un objeto una interfaz llamada sesión que en vista de lo que ya conocemos de JPA podríamos decir que Obsession es el equivalente al Entity manager de JPA también para operaciones no Klub es decir más complejas pues actualización de un conjunto de entidades o recuperación de conjunto entidades o entidades que no dependan de la Primary Coyle es decir que la condición sea diferente a obtenerla primero y que podemos personalizar las consultas a través de un lenguaje similar al que utilizamos o similar prácticamente podríamos decir que es el mismo en JPA que se llama HCl y Mermaid huele muy parecido a J.P. QL que utilizamos como digo en JPA.

Bien lo primero para poder operar contra esa capa de persistencia necesitaríamos obtener una implementación de sesión para obtener una implementación de sesión necesitamos un sesión fácil muy similares como Entity manager facto ni en el caso de JPA lo que pasa es que obsesión Factory es un objeto bastante digamos pesado que solamente debería ser utilizado una única instancia del mismo para todos los clientes que acceden a la aplicación.

Por lo tanto deberías se recomienda que se cree como Shingen es decir una única instancia compartida por todos los clientes para crear un factor modo Singleton habría que seguir una serie de pautas otra serie de elementos que habría que utilizar de la Hibernate y habitualmente encapsular todo ese conjunto de instrucciones de extensión de sesión Factory en un archivo Hibernate.

útil antojaban obviamente lo podemos llamar como queramos pero desde las primeras versiones de Hibernate la costumbre es encapsular esas instrucciones de extensión de sesión Factory en un hiberna ITU-T en un punto Java.

De hecho incluso existen ya varias versiones de este archivo que podemos encontrar por internet.

Además bueno han ido evolucionando con la evolución también de las versiones de este framework y hay bastantes ya estandarizados que podemos encontrar y no necesitamos tenernos que crear nosotros nuestro propio Hibernate.

Cómo va a ver después en el siguiente vídeo la siguiente elección.

Pues vamos a utilizar ni Bernays butil clásico ya ya creamos.

Bien pues una vez que ya tenemos el objeto sesión podemos recurrir a estos métodos básicos para realizar las operaciones de primero.

Si existir una entidad a partir de la actividad pasada como parámetro a actualizar la base de datos con los datos de una entidad que le pasamos como parámetro para recuperar una entidad a partir de su primary key pasándole como primer parámetro el tipo de entidad y como segundo parámetro la Primary y Delete para limitar o eliminar la entidad que se le pasa como parámetro.

Como ves son métodos muy parecidos a los correspondientes Identity Manager Soib como práxis Hunter como Helmer como elfin y Delete como el remo.

De hecho las últimas versiones de Hibernate incluyen también los mismos métodos que vimos en timãn ayer en JPA Es decir que además de estos tenemos el persiste en ver el cine y el remo.

De todas formas después veremos un ejemplo donde utilizaremos los métodos clásicos de Hibernate que son los que te estoy presentando aquí.

Además por supuesto de las consultas para realizar operaciones complejas como recuperaciónde un conjunto de entidades o recuperación de alguna entidad a partir de una condición que no involucra la primera eliminación o actualización de conjunto entidades.

Para ello bueno igual que en JPA utilizaremos un lenguaje una variante del SQL llamada en este caso vuelo y Bernays cueles que es casi idéntico a J.P. cuelo.

Una vez que tenemos Concepció confeccionado la consulta la gestionaremos a través de igual nombre que la correspondiente interfaz de JPA.

De hecho aquí no tenemos un cuerpo y un Taipe directamente QWERTY con tipo de modo que podemos crear una cuerito a partir de una la selección indicando el tipo de entidad que queremos recuperar.

Los métodos pues como veis son los mismos que tenía la interfaz qwerty de JPA su para devolver una lista entidades sin que el resto cuando solamente es un único resultado una única entidad y si se trata de una consulta de acción execute o es un proceso va a ser el mismo en JPA de hecho también tenemos la posibilidad de crear las consultas haches huele como una mezcla gris en las correspondientes entidades hecho en el ejemplo que he visto anteriormente cuando estuvimos configurando la capa de persistencia vimos que había ya una n Mercuri creados que también podremos utilizar desde Internet y por supuesto pueden tener parámetros.

Por último comentar el tema de la transaccionalidad que también lo teníamos en esta situación en JPA y es que si queremos realizar alguna operación que requiere acción sobre la base de datos consulta añadir una nueva entidad modificar una entidad o eliminar entidad.

Esas operaciones tienen que estar en global dentro de una transacción.

Las transacciones vienen gestionadas por el objeto transaction de Internet.

Para crearlo utilizaremos el objeto Obsession su método de transacción que ya crea el objeto de transacción y además da comienzo la transacción aquí y cubríamos la operación.

Operación anulación y para confirmar la transacción sería el método commit de transacción.

# 34 Utilización del API de Hibernate en una aplicación 18:29

En la lección anterior hemos estado viendo la Hibernate y presentando algunos de los métodos más importantes

de objetos.

Ahora en esta elección vamos a ver ya su aplicación directa en el ejercicio que estamos hemos comenzado

a hacer ya sólo en la configuración de Hibernate de la gestión de los contactos.

Bueno volvamos a él.

Vamos a ver aquí ya teníamos una de las lecciones anteriores donde empezamos ya con Jiguaní Hibernate

que creamos el hiberna y CFG XML.

Partíamos ya de las entidades configuradas con anotaciones que teníamos originariamente en el ejercicio

práctico número 3 y ahora lo que vamos a meter ya es lo que sería el código del modelo pero utilizando

Hibernate en lugar de JPA.

Lo primero ya lo he comentado en la lección anterior necesitamos encapsular todas las operaciones de

obtención de sesión Factory que es con el que obtendremos el objeto sesión en un archivo y Bernet útil

que normalmente se suele conocer así desde las primeras versiones de que se lleva utilizando Internet.

Aquí tienes una clase me he creado Hibernate útil y este sería el código donde como puedes ver en método

estático sesión Factory nos devuelve una implementación de sesión Factory y claro tensada preguntando

de dónde has sacado todo esto.

Estas implementaciones están ya estandarizadas yo por ejemplo esa implementación la he sacado de aquí

de esta página de Java jits ASP.NET y la tienes en muchos otros sitios porque es una implementación

clásica de Hibernate útil para la versión de hiberna y 5 en adelante.

Esto luego en versiones han ido evolucionando distintas formas de obtener el session Factory que parece

que cada vez es más complejo pero bueno es una forma de hacerlo de la manera más eficiente posible.

Tampoco tenemos que meternos al detalle de esto porque ya esto es un código ya bastante estandarizado

y directamente cuando se llame este método es sesión Factory estatico de esta clase y vamos a obtener

una implementación de assessor Factory sin decir muchos clientes que llamen a este método todos sostendrían

la misma instancia y trabajaríamos sobre el mismo.

Sesión Factory.

De todas formas yo te dejaré el archivo para que te lo pueda descargar directamente los recursos de

la lección.

Bueno vamos a volver al código y bueno suponiendo que ya tenemos esta clase que ha creado dentro del

paquete modelo donde están los JBS con la lógica de negocio con el código que ya he visto ahí pues vamos

a ver si hacemos uso de ella para implementar todas las funcionalidades del modelo entonces.

Bueno pues aquí tenemos como la implementación que originariamente teníamos con JPA pues lógicamente

esto ya no ya no ya no es así sino que ahora pues a nivel de cada método tendremos que tener la posesión

Yamal a los métodos que hemos comentado en la lección anterior y cuando haya que aplicar transaccionalidad

pues habrá que probarlo dentro de una transacción y así va a ser como por ejemplo pues vamos empezando

ya por este método alta contacto vale entonces aquí lo que tendremos que obtener pues es un objeto sesión

vamos a ir mezclando la variable y claro que qué necesitamos y Bernadet útil vamos a ir importando para

que me aparezca la ayuda los todos los métodos con mayúsculas y vamos importando de accesión Factory

y a partir de la opción Factory obtenemos el cesio vamos a ver qué haces en un factor de escurran sesión

aquí la que nos devolvería una implementación del objeto sesión.

Vamos como digo de importar para que podamos importar adecuadamente las clases que sean por sesión.

Pues como veis puedes encontrar muchas clases de referencias que tengas en tu proyecto que hagan referencia

a un tipo sesión.

En nuestro caso obviamente es jaibas.

Pues a partir del sesión ya podríamos realizar la persistencia del contacto muy importante que el objeto

sesión.

Pues aquí tenemos que preocuparnos también nosotros como JPA que es más automático de la obtención y

de su cierre entonces lo vamos a meter en un traje con recursos y con recursos es una versión de El

troikas de Java que te permite pues cierre automático de los recursos como indica su nombre es decir

que automáticamente cuando se abandona el Troy el objeto que has creado dentro de los paréntesis se

cierra y no tenemos que estar preocupándonos de cerrarlo o de meter el cierre dentro suvez del total

Catch.

Es más el recurso ni siquiera necesita un catch porque su misión podríamos tenerlo pero no es el objetivo

captura ninguna sección sino que realizar el aprovecharnos del auto cierre de los recursos.

Bueno pues entonces aquí tenemos el objeto contacto vamos a una extracción aquí porque lo vamos a necesitar

y otra cosa importante necesitamos englobar esto dentro de una transacción.

Como ya dijimos a partir del objeto sesión podemos crear una transacción comenzarla es decir obtendríamos

el objeto transaction y ya se comenzaría esa transacción.

Importamos importamos o Bernet transaction que es el tipo que a nosotros nos interesa y a partir de

ahí creamos el objeto contacto y hacemos la persistencia que era el método si recuerdo recuerdas el

método 6 del objeto Cs.

Vale que es el que hemos creado a ella le pasamos el objeto con que queremos coexistir con ella lo tenemos

es esto si la podemos borrar que es la antigua que teníamos y ya tenemos una parte ya de la implementación

de Verneuil pues en esa línea vamos a ir todo.

Aquí teníamos otra versión de alta contacto donde en vez de recibir los datos por separado ya recibíamos

el objeto contacto por bueno vamos a copiar esto o incluso desde aquí podríamos llamar también a este

método es decir podremos hacer aquí un alto contacto

y pasar directamente los parámetros punto del nombre ya que tenemos el código para no volver a repetirlo.

Punto y mail punto de teléfono

pues ahí lo tenemos.

Bueno seguimos avanzando y bueno ahora tenemos un método para recuperar contactos donde tenemos una

J.P. cuele que como ya te he dicho Hibernate tiene HCl que es lo mismo la misma sintaxis.

Por lo tanto vamos a poder seguir utilizando esas mismas J.P. cueles las mismas instituciones así como

la andarme arcoiris que tengamos ya creadas en las entidades bien como siempre hay que obtener esto

digamos el bloque troikas la estructura troikas vamos a tener que utilizarla siempre es independiente

ya ya de lo que pongamos aquí lo voy a dejar vacío pero la estructura para obtener el objeto Obsession

siempre bases aquí no necesitamos transaccion porque es una instrucción de recuperación de entidades

lo que necesitamos es crear un cuadri.

Voy a aprovecharme de esta instrucción que ya teníamos pero en vez de Tacuarí vamos a utilizar Cury

que es una interfaz de Hibernate que ya es tipado con tipo y lancemos la llamada Create QWERTY del objeto

cesion como es es el mismo método Recovery de sesión que tiene el Entity maneira.

Cuidado al importar Cuadri porque no van a salir aquí también.

A ver cuando vamos en el control mayusculo varias importaciones a ver qué es lo que nos ha importado

esto como ya venía importado de antes tenemos ha importado el cuerno de Java y que persisten en ese

no es que importar el cuadri de internet lo he borrado a propósito para que me pregunte cualquier importar

ahora si es el cuadri Estado o como dice uno de es que aquí tenemos un cuerina en Java X persistes ni

otro.

Bueno este no es obviamente no es el de JPA pero si aquí tenemos un qwerty en el BNG Hibernate y otro

en el Bergère Bernadet QWERTY si su paquete y dentro de Rajoy Bernet cómo es este cuatrista de precarga

es que tenemos que utilizar Balay el objeto QWERTY un tipo interfaz quali que está en el paquete qwerty

de ivermectina vale ya lo tenemos y entonces ya hemos creado la QWERTY y devolveremos la lista de resultados.

Cogemos esa instrucción que nos sirve tal cual porque es el mismo método de resultas como hemos explicado

en el capítulo anterior.

Esta anotación aquí como aquí no hay transaccionalidad esto no nos va a hacer falta.

Vamos a borrar tenemos una tarea de gestión automática de transacciones y eso hoy no lo necesitamos.

Además no nos va a hacer nada porque al utilizar Internet las transacciones lo vamos a tener que gestionar

nosotros manualmente y solamente la vamos a aplicar cuando sean instrucciones de acción como Yakumo.

Bueno pues venga vamos a seguir copiamos esta estructura para el siguiente buscar contactos.

Bueno pues aquí tenemos lo mismo tenemos que crear un acuerdo con la J.P. cuele desde el sur.

Esta instrucción la pueden meter incluso en el tema de los parámetros normales.

Si cogemos tal o cual no lo copiamos etc..

Fuera entonces bueno pues fíjate creamos la web y establecemos el parámetro de igual método el mismo

método para meter el cual es muy parecido.

Prácticamente igual al Pasquali de KPA y bueno de la lista de resultados nos quedamos con el primero

en buscar contacto eliminar contacto.

Una vez más vamos a copiar la estructura lo que pasa que debía copiar la estructura del alta puesto

que la instrucción para inicio de transacción aquí la voy a necesitar ya que estas instrucciones como

es una eliminación deben de venir dentro de una transacción.

Cuando hacemos una búsqueda del contacto por primary key

en este caso será el objeto sesión método Geeta que es el equivalente al fin.

Ya he visto que si dejaba el Fain también funcionaba porque como ya te comenté en el capítulo anterior

se puede utilizar los métodos de JPA porque llevan incorporados también dentro de las nuevas versiones

de la interfaz sesión de Internet.

Pero bueno estamos trabajando con los originales.

Vale y entonces.

Pues aquí lo que vamos a hacer para eliminar la instancia de contacto es un método de llamada método

de alerta pasamos el todo contacto en la librería bajo la pregunta.

Efectivamente cierto que esto había que hacerlo poquito más y para preguntar si existe la estancia o

si no existe la estancia no tenemos nada que eliminar.

Vale entonces la recuperamos y si existe la eliminamos compramos por su clave primaria y ya por último

nos quedaría dentro de esta clase de JB pues la eliminación de contactos por email en este caso figote

estamos utilizando una name equally pero es una name Kourí de acción.

Por lo tanto también tenemos que estar dentro de una transacción así que vamos a ver porque hay una

cosita aquí no sé si taladrado cuenta pero se me ha olvidado realizar también en el primer ejemplo en

el primer método donde salvamos la entidad y es confirmar la transacción.

Saito confirma y confirma los explicitamente entonces vamos a empezar por aquí por el alta contacto.

Cuando se me había olvidado hacer la operación commit porque si no no se confirmaría no quedaría reflejada

en la base de datos aquí.

Pues lo mismo con el L.T X punto com vale.

Bueno pues nos quedaba esta eliminación de contactos por email.

Vamos a copiar toda esta estructura que nos puede servir porque en este caso si lo que necesitamos es

una Mercury llamada Executiu.

Todo esto lo cortamos y vamos a sustituir por la que teníamos antes de recuperación eliminación.

Y como es creatinina name Kairi repasarla name Cuadri.

Este es el nombre original que tiene la entidad porque las entidades no las hemos cambiado mismo métodos

actitude y confirmar.

Como vemos es bastante similar a como hemos trabajado con JPA sólo que aquí bueno gestionando manualmente

digamos las transacciones gestión usuarios pues también teníamos aquí un método que el método autenticar.

Bueno lo mismo esto Identity Manager lo vamos a quitar y aquí tenemos que crear una Tacuri a partir

de una nave Juriquilla teníamos proporcionan los parámetros.

Bueno pues esto mismo.

Venga vamos a traducirlo a Internet.

Entonces como siempre la estructura el trade con recursos lo vamos a llevar aquí no podemos poner después

a continuación la declaración de la variable Pullen.

Y bueno primero la acuerdo sí que vamos a ir copiando cosas bueno mejor cortando Cory Monteith Mercuri

usuario y el objeto sesione al importar QWERTY como sabes.

Pues tiene que ser el cuadri de Rajoy ni te.

Todo esto es lo mismo que la forma de crearla es la misma.

Establecimiento de los parámetros captura de una sesión si no hay un resultado bueno esto es exactamente

igual así que me lo voy a llevar también.

Aquí dentro bueno exactamente igual con la salvedad de que no hay ninguna salvedad la variable la llamada

también QR o sea tal cual está.

Por lo tanto.

Bueno pues ya hemos reimplantado la lógica de negocio que teníamos hecha con JPA dentro de JB.

Pues sí con el JB es manteniendo la misma lógica forma de la lógica de negocio pero utilizando la pide

y Bernays.

Pues nada ahora sería cuestión de probar el ejercicio y verificar que funciona exactamente igual que

antes.

Vamos a ello nos colocamos encima la página Lubin botón derecho runas observase

seleccionamos algunas feeds y esperamos a que se inicie el servidor y nos lance la página

una vez que hayas arrancado aquí tenemos la página del Lovin para que nos adentraremos bien.

Pues venga vamos a meter las credenciales que supuestamente están en la base de datos 3 1 2 1 y al pulsar

el botón Enviar.

Pues vamos a obtener un error 500.

Vamos a ver cuál es.

Ahora ya te explican en qué va a consistir el error y por qué nos dice que si vamos PJD es exception

si vamos bajando llega un momento que nos dice que no hay una sesión abierta no ocurren sesión contes.

Por qué ha sido eso.

Bueno volvemos otra vez al modelo a los métodos que hemos ido creando y bueno el problema aquí reside

básicamente en que al llamar al Guez ocurre sesión nos devolvería digamos la sesión actual si es que

se hubiera abierto alguna como las hemos ido abriendo y cerrando no hay ninguna abierta.

Entonces served current Session es un método que si lo podemos tener un contexto donde hay una sesión

ya creada y que se esté compartiendo.

Pero si lo que queremos es ir abriendo y cerrando nuestras sesiones para ganar en eso cierta eficiencia

pues en vez de que curren sesión utilizaríamos Open session vale bueno o vamos a ir sustituyendo en

todos los sitios donde tenemos a ver aquí

sesión también aquí también

y aquí tan Bale y en el otro no tenemos nada más que 1 lo tenemos guardamos todos los cambios y volvemos

a probar de nuevo recuperamos la página del Odin

vamos a ver 3 1 3 1 que son los usuarios que tenemos en la tabla de usuarios.

Tramos tardado un poquito lo cual significa una buena señal.

Vamos a ver la lista de contactos aquí tenemos la lista de contactos donde nos aparecen todos los contactos

que teníamos en la base de datos.

Bueno por ejemplo vamos a ver si es capaz de eliminar efectivamente Limina o vamos al menú y vamos ya

crear la última prueba.

1 contacto

contar a

junto con un número de teléfono guardamos aquí debería aparecer efectivamente el nuevo contacto o la

lista.

Como veis funciona exactamente igual que el otro difrencia en el ejercicio 3 utilizamos JPA en todos

los ámbitos de lo que es creación y utilización de capa persistencia y aquí hemos utilizado Internet.


# 35 Ell API Criteria 03:44
# 36 Ejercicio práctico VI 07:27
# Autoevaluación VI 01:00
# Resumen final 07:25
