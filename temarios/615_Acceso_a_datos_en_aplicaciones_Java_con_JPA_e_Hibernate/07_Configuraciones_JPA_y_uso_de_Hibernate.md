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

Después de estudiar la creación y manipulación de entidades relacionadas vamos a ver cómo realizar algunos ajustes en las relaciones, de manera que nos permitan optimizar el trabajo sobre la capa de persistencia.

<img src="images/28-02.png">

La primera de esas operaciones de ajuste que vamos a realizar vamos a ver cómo realizar es,  la Carga de Datos Relacionados, y es que en una relación podemos configurar la manera en la que se van a cargar los datos relacionados.

La manera en la que lo vamos a hacer es a través de un atributo llamado `Fetch` que vamos a poder indicar en las anotaciones `@OneToMany`, `@ManyToOne` y `@ManyToMany`.

Cuáles son los posibles valores que puede tomar este atributo:

* `FechType.EAGER` 
* `FechType.LAZY`

Son estos dos posibles valores que ves aquí, que corresponden a unas constantes definidas en la anotación `FetchType` está el valor `EAGER` y el valor `LAZY`.

Qué significa que el atributo `Fetch` tenga el valor `EAGER`, significa que a la hora de por ejemplo hacer una búsqueda en una entidad los objetos relacionados se van a cargar dentro de la colección o dentro del atributo de la clase dependiendo si OneToMany o ManyToOne en el mismo momento en el que se carga la entidad principal, la entidad localizada.

En el caso de que eligamos la acción `LAZY` entonces cuando se hace una carga de una entidad, de la entidad principal, los datos relacionados no se van a cargar en memoria en ese momento, solamente se cargarán cuando vayan a ser utilizados, es decir a la hora de llamar al método `getNombreDelAtributo()` de la entidad que vamos a recuperar.

Eso nos va a permitir hacer esos ajustes de manera que dependiendo de si queremos tenerlo todo desde el principio o si queremos optimizar el consumo de memoria y no queremos tener todos los datos cargados hasta que van a ser utilizados podemos jugar con los valores `EAGER` o `LAZY`, si no indicamos nada cada motor de persistencia definirá su propio valor y dependiendo del tipo de relación definirán su propio valor predeterminado, pero si queremos establecer uno concreto tenemos estos atributos, como vamos a ver ahora en uno de los ejercicios que hicimos en las lecciones anteriores.

<img src="images/28-03.png">

El otro tipo de ajuste que podemos realizar son las *Actualizaciones en Cascada*. Si nosotros hacemos una operación sobre una entidad, una eliminación, un refresco o una actualización qué pasa con los objetos de las entidades relacionadas, se van a actualizar también, se van a eliminar, en principio no va a pasar nada con ellos a no ser que queramos nosotros propagar alguna o todas las operaciones sobre la identidad principal también en las entidades relacionadas. Eso lo vamos a indicar a través del atributo `cascade` también de las mismas anotaciones `@OneToMany`, `@ManyToOne` y `@ManyToMany` utilizando alguna de las constantes definidas en la anotación `CascadeType`:

* `CascadeType.PERSIST`
* `CascadeType.MERGE`
* `CascadeType.REMOVE`
* `CascadeType.REFRESH`
* `CascadeType.ALL`

Por ejemplo si a la hora de eliminar una entidad queremos que también se eliminen los objetos relacionados puesto que no tendría sentido a lo mejor que quedarán esos objetos en la base de datos, las filas correspondientes en la base de datos, una vez que se ha eliminado la actividad principal, podríamos propagar la operación de eliminación utilizando el valor `CascadeType.REMOVE` en el atributo `cascade`.

Bueno lo mejor es que lo vamos a ver sobre uno de los ejercicios el último que hicimos el ejercicio práctico `615-09_proyecto_relacion_almacen` lo vamos a copiar a uno llamado `615-10_proyecto_relacion_almacen`, debemos cambiar el nombre en:

* Web Project Settings
* `pom.xml`
* `persistence.xml`
* `GestionProductosEjb`

Vamos a centrarnos concretamente en las entidades `Seccion` y `Producto` por ejemplo ya sabemos que hay una relación Uno a Muchos y Muchos a Uno en sentido contrario pero hay una relación Uno a Muchos entre `Seccion` y `Producto`. Queremos que se carguen todos los productos dentro del atributo de colección de la entidad `Seccion` cuando se haga la localización o la búsqueda de una determinada `Seccion`, dependiendo si queremos que sea así o no sea así utilizaremos y configuramos el atributo `Fetch` que hemos comentado anteriormente dentro de la anotación de la que define la relación.

Por ejemplo en `Seccion` nosotros tenemos actualmente esto:

```java
// bi-directional many-to-one association to Producto
@OneToMany(mappedBy = "seccione")
private List<Producto> productos;
```

Por ejemplo aquí no queremos que al cargar un objeto `Seccion` al hacer un `find` al objeto `Seccion` o un `Query` no queremos que se carguen todos los objetos `Producto` relacionados de cada `Seccion` en la variable `productos`, solamente cuando se llame al método `getProductos()`. Bueno pues entonces si no queremos que se carguen inmediatamente había que hacer lo que se conoce como una carga perezosa `LAZY` y eso se indica como decía antes a través del atributo `Fetch`, indicando una de las dos posibles constantes que hemos hemos dicho antes. En nuestro caso queremos que sea `LAZY`, carga perezosa para que no sean encargado inmediatamente.

```java
// bi-directional many-to-one association to Producto
@OneToMany(mappedBy = "seccione", fetch=FetchType.LAZY)
private List<Producto> productos;
```

Si queremos lo contrario, que se cargue todo al mismo momento en el que se carga también la sección, que vengan también sus productos, sería `EAGER`. Si no se dice nada, lo dejaríamos al valor por defecto que tenga cada motor de persistencia y cada relación, habría que consultar la documentación de dicho motor o proveedor de persistencia para ver cual es.

Esto por un lado, sobre el tema de las actualizaciones en cascada. Por ejemplo tenemos una relación Uno a Muchos entre `Producto` y `Venta`, queremos que al ser eliminado un producto por ejemplo se eliminen todos sus ventas relacionadas. Podría tener sentido, porque si ya no existe un producto qué sentido tiene que estén registran sus ventas en la base de datos también. Entonces lo que podríamos hacer en la relación Uno a Muchos entre `Producto` y `Venta` que actualmente esta así en `Producto`:

```java
//bi-directional many-to-one association to Venta
@OneToMany(mappedBy="producto")
private List<Venta> ventas;
```
Entonces definiríamos el atributo `cascade` indicaremos que queremos propagar la operación de eliminación atravez de `CascadeType` que tiene una serie de constantes entre las cuales está `REMOVE` si quisiéramos propagar más de una operación entonces deberíamos indicar la lista de constantes entre llaves y separar los valores por comas por ejemplo para incluir también la actualización `MERGE`. 

```java
//bi-directional many-to-one association to Venta
@OneToMany(mappedBy="producto",cascade={CascadeType.REMOVE,CascadeType.MERGE})
private List<Venta> ventas;
```

y de esta manera estaríamos propagando estas dos operaciones, si quisiéramos propagar las todas, eso ya depende de cada caso si tiene sentido o no, en este caso pues no tendría mucho sentido, a lo mejor es que si se da de alta un producto se den de alta sus ventas, porque a lo mejor no existen todavía, ese tipo de operación igual no tiene mucho sentido, pero en cualquier caso que por lo que sea queremos propagar todas las operaciones, no hace falta que pongamos todas las constantes posibles, está la constante `ALL` que significa propagar todas las operaciones a la entidad relacionada.

Bueno pues ya he visto de qué manera se puede ajustar y optimizar las relaciones entre entidades.

### :computer: Código Completo - 615-10_proyecto_relacion_almacen

Este proyecto es exactamente igaul que el proyecto `615-09_proyecto_relacion_almacen`, solo con los cambios que se mencionarón en las entidades `Seccion` y `Producto`.

# 29 Claves compuestas 07:41

<img src="images/29-01.png">

<img src="images/29-02.png">

<img src="images/29-03.png">

<img src="images/29-04.png">

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

En la lección anterior hemos estado viendo la Hibernate y presentando algunos de los métodos más importantes de objetos.

Ahora en esta elección vamos a ver ya su aplicación directa en el ejercicio que estamos hemos comenzado a hacer ya sólo en la configuración de Hibernate de la gestión de los contactos.

Bueno volvamos a él.

Vamos a ver aquí ya teníamos una de las lecciones anteriores donde empezamos ya con Jiguaní Hibernate que creamos el hiberna y CFG XML.

Partíamos ya de las entidades configuradas con anotaciones que teníamos originariamente en el ejercicio práctico número 3 y ahora lo que vamos a meter ya es lo que sería el código del modelo pero utilizando Hibernate en lugar de JPA.

Lo primero ya lo he comentado en la lección anterior necesitamos encapsular todas las operaciones de obtención de sesión Factory que es con el que obtendremos el objeto sesión en un archivo y Bernet útil que normalmente se suele conocer así desde las primeras versiones de que se lleva utilizando Internet.

Aquí tienes una clase me he creado Hibernate útil y este sería el código donde como puedes ver en método estático sesión Factory nos devuelve una implementación de sesión Factory y claro tensada preguntando de dónde has sacado todo esto.

Estas implementaciones están ya estandarizadas yo por ejemplo esa implementación la he sacado de aquí de esta página de Java jits ASP.NET y la tienes en muchos otros sitios porque es una implementación clásica de Hibernate útil para la versión de hiberna y 5 en adelante.

Esto luego en versiones han ido evolucionando distintas formas de obtener el session Factory que parece que cada vez es más complejo pero bueno es una forma de hacerlo de la manera más eficiente posible.

Tampoco tenemos que meternos al detalle de esto porque ya esto es un código ya bastante estandarizado y directamente cuando se llame este método es sesión Factory estatico de esta clase y vamos a obtener una implementación de assessor Factory sin decir muchos clientes que llamen a este método todos sostendrían la misma instancia y trabajaríamos sobre el mismo.

Sesión Factory.

De todas formas yo te dejaré el archivo para que te lo pueda descargar directamente los recursos de la lección.

Bueno vamos a volver al código y bueno suponiendo que ya tenemos esta clase que ha creado dentro del paquete modelo donde están los JBS con la lógica de negocio con el código que ya he visto ahí pues vamos a ver si hacemos uso de ella para implementar todas las funcionalidades del modelo entonces.

Bueno pues aquí tenemos como la implementación que originariamente teníamos con JPA pues lógicamente esto ya no ya no ya no es así sino que ahora pues a nivel de cada método tendremos que tener la posesión Yamal a los métodos que hemos comentado en la lección anterior y cuando haya que aplicar transaccionalidad pues habrá que probarlo dentro de una transacción y así va a ser como por ejemplo pues vamos empezando ya por este método alta contacto vale entonces aquí lo que tendremos que obtener pues es un objeto sesión vamos a ir mezclando la variable y claro que qué necesitamos y Bernadet útil vamos a ir importando para que me aparezca la ayuda los todos los métodos con mayúsculas y vamos importando de accesión Factory y a partir de la opción Factory obtenemos el cesio vamos a ver qué haces en un factor de escurran sesión aquí la que nos devolvería una implementación del objeto sesión.

Vamos como digo de importar para que podamos importar adecuadamente las clases que sean por sesión.

Pues como veis puedes encontrar muchas clases de referencias que tengas en tu proyecto que hagan referencia a un tipo sesión.

En nuestro caso obviamente es jaibas.

Pues a partir del sesión ya podríamos realizar la persistencia del contacto muy importante que el objeto sesión.

Pues aquí tenemos que preocuparnos también nosotros como JPA que es más automático de la obtención y de su cierre entonces lo vamos a meter en un traje con recursos y con recursos es una versión de El troikas de Java que te permite pues cierre automático de los recursos como indica su nombre es decir que automáticamente cuando se abandona el Troy el objeto que has creado dentro de los paréntesis se cierra y no tenemos que estar preocupándonos de cerrarlo o de meter el cierre dentro suvez del total Catch.

Es más el recurso ni siquiera necesita un catch porque su misión podríamos tenerlo pero no es el objetivo captura ninguna sección sino que realizar el aprovecharnos del auto cierre de los recursos.

Bueno pues entonces aquí tenemos el objeto contacto vamos a una extracción aquí porque lo vamos a necesitar y otra cosa importante necesitamos englobar esto dentro de una transacción.

Como ya dijimos a partir del objeto sesión podemos crear una transacción comenzarla es decir obtendríamos el objeto transaction y ya se comenzaría esa transacción.

Importamos importamos o Bernet transaction que es el tipo que a nosotros nos interesa y a partir de ahí creamos el objeto contacto y hacemos la persistencia que era el método si recuerdo recuerdas el método 6 del objeto Cs.

Vale que es el que hemos creado a ella le pasamos el objeto con que queremos coexistir con ella lo tenemos es esto si la podemos borrar que es la antigua que teníamos y ya tenemos una parte ya de la implementación de Verneuil pues en esa línea vamos a ir todo.

Aquí teníamos otra versión de alta contacto donde en vez de recibir los datos por separado ya recibíamos el objeto contacto por bueno vamos a copiar esto o incluso desde aquí podríamos llamar también a este método es decir podremos hacer aquí un alto contacto y pasar directamente los parámetros punto del nombre ya que tenemos el código para no volver a repetirlo.

Punto y mail punto de teléfono pues ahí lo tenemos.

Bueno seguimos avanzando y bueno ahora tenemos un método para recuperar contactos donde tenemos una J.P. cuele que como ya te he dicho Hibernate tiene HCl que es lo mismo la misma sintaxis. 

Por lo tanto vamos a poder seguir utilizando esas mismas J.P. cueles las mismas instituciones así como la andarme arcoiris que tengamos ya creadas en las entidades bien como siempre hay que obtener esto digamos el bloque troikas la estructura troikas vamos a tener que utilizarla siempre es independiente ya ya de lo que pongamos aquí lo voy a dejar vacío pero la estructura para obtener el objeto Obsession siempre bases aquí no necesitamos transaccion porque es una instrucción de recuperación de entidades lo que necesitamos es crear un cuadri.

Voy a aprovecharme de esta instrucción que ya teníamos pero en vez de Tacuarí vamos a utilizar Cury que es una interfaz de Hibernate que ya es tipado con tipo y lancemos la llamada Create QWERTY del objeto cesion como es es el mismo método Recovery de sesión que tiene el Entity maneira.

Cuidado al importar Cuadri porque no van a salir aquí también.

A ver cuando vamos en el control mayusculo varias importaciones a ver qué es lo que nos ha importado esto como ya venía importado de antes tenemos ha importado el cuerno de Java y que persisten en ese no es que importar el cuadri de internet lo he borrado a propósito para que me pregunte cualquier importar ahora si es el cuadri Estado o como dice uno de es que aquí tenemos un cuerina en Java X persistes ni otro.

Bueno este no es obviamente no es el de JPA pero si aquí tenemos un qwerty en el BNG Hibernate y otro en el Bergère Bernadet QWERTY si su paquete y dentro de Rajoy Bernet cómo es este cuatrista de precarga es que tenemos que utilizar Balay el objeto QWERTY un tipo interfaz quali que está en el paquete qwerty de ivermectina vale ya lo tenemos y entonces ya hemos creado la QWERTY y devolveremos la lista de resultados.

Cogemos esa instrucción que nos sirve tal cual porque es el mismo método de resultas como hemos explicado en el capítulo anterior.

Esta anotación aquí como aquí no hay transaccionalidad esto no nos va a hacer falta.

Vamos a borrar tenemos una tarea de gestión automática de transacciones y eso hoy no lo necesitamos.

Además no nos va a hacer nada porque al utilizar Internet las transacciones lo vamos a tener que gestionar nosotros manualmente y solamente la vamos a aplicar cuando sean instrucciones de acción como Yakumo.

Bueno pues venga vamos a seguir copiamos esta estructura para el siguiente buscar contactos.

Bueno pues aquí tenemos lo mismo tenemos que crear un acuerdo con la J.P. cuele desde el sur.

Esta instrucción la pueden meter incluso en el tema de los parámetros normales.

Si cogemos tal o cual no lo copiamos etc..

Fuera entonces bueno pues fíjate creamos la web y establecemos el parámetro de igual método el mismo método para meter el cual es muy parecido.

Prácticamente igual al Pasquali de KPA y bueno de la lista de resultados nos quedamos con el primero en buscar contacto eliminar contacto.

Una vez más vamos a copiar la estructura lo que pasa que debía copiar la estructura del alta puesto que la instrucción para inicio de transacción aquí la voy a necesitar ya que estas instrucciones como es una eliminación deben de venir dentro de una transacción.

Cuando hacemos una búsqueda del contacto por primary key en este caso será el objeto sesión método Geeta que es el equivalente al fin.

Ya he visto que si dejaba el Fain también funcionaba porque como ya te comenté en el capítulo anterior se puede utilizar los métodos de JPA porque llevan incorporados también dentro de las nuevas versiones de la interfaz sesión de Internet.

Pero bueno estamos trabajando con los originales.

Vale y entonces.

Pues aquí lo que vamos a hacer para eliminar la instancia de contacto es un método de llamada método de alerta pasamos el todo contacto en la librería bajo la pregunta.

Efectivamente cierto que esto había que hacerlo poquito más y para preguntar si existe la estancia o si no existe la estancia no tenemos nada que eliminar.

Vale entonces la recuperamos y si existe la eliminamos compramos por su clave primaria y ya por último nos quedaría dentro de esta clase de JB pues la eliminación de contactos por email en este caso figote estamos utilizando una name equally pero es una name Kourí de acción.

Por lo tanto también tenemos que estar dentro de una transacción así que vamos a ver porque hay una cosita aquí no sé si taladrado cuenta pero se me ha olvidado realizar también en el primer ejemplo en el primer método donde salvamos la entidad y es confirmar la transacción.

Saito confirma y confirma los explicitamente entonces vamos a empezar por aquí por el alta contacto.

Cuando se me había olvidado hacer la operación commit porque si no no se confirmaría no quedaría reflejada en la base de datos aquí.

Pues lo mismo con el L.T X punto com vale.

Bueno pues nos quedaba esta eliminación de contactos por email.

Vamos a copiar toda esta estructura que nos puede servir porque en este caso si lo que necesitamos es una Mercury llamada Executiu.

Todo esto lo cortamos y vamos a sustituir por la que teníamos antes de recuperación eliminación.

Y como es creatinina name Kairi repasarla name Cuadri.

Este es el nombre original que tiene la entidad porque las entidades no las hemos cambiado mismo métodos actitude y confirmar.

Como vemos es bastante similar a como hemos trabajado con JPA sólo que aquí bueno gestionando manualmente digamos las transacciones gestión usuarios pues también teníamos aquí un método que el método autenticar.

Bueno lo mismo esto Identity Manager lo vamos a quitar y aquí tenemos que crear una Tacuri a partir de una nave Juriquilla teníamos proporcionan los parámetros.

Bueno pues esto mismo.

Venga vamos a traducirlo a Internet.

Entonces como siempre la estructura el trade con recursos lo vamos a llevar aquí no podemos poner después a continuación la declaración de la variable Pullen.

Y bueno primero la acuerdo sí que vamos a ir copiando cosas bueno mejor cortando Cory Monteith Mercuri usuario y el objeto sesione al importar QWERTY como sabes.

Pues tiene que ser el cuadri de Rajoy ni te. 

Todo esto es lo mismo que la forma de crearla es la misma.

Establecimiento de los parámetros captura de una sesión si no hay un resultado bueno esto es exactamente igual así que me lo voy a llevar también.

Aquí dentro bueno exactamente igual con la salvedad de que no hay ninguna salvedad la variable la llamada también QR o sea tal cual está.

Por lo tanto.

Bueno pues ya hemos reimplantado la lógica de negocio que teníamos hecha con JPA dentro de JB.

Pues sí con el JB es manteniendo la misma lógica forma de la lógica de negocio pero utilizando la pide y Bernays.

Pues nada ahora sería cuestión de probar el ejercicio y verificar que funciona exactamente igual que antes.

Vamos a ello nos colocamos encima la página Lubin botón derecho runas observase seleccionamos algunas feeds y esperamos a que se inicie el servidor y nos lance la página 
una vez que hayas arrancado aquí tenemos la página del Lovin para que nos adentraremos bien.

Pues venga vamos a meter las credenciales que supuestamente están en la base de datos 3 1 2 1 y al pulsar el botón Enviar.

Pues vamos a obtener un error 500.

Vamos a ver cuál es.

Ahora ya te explican en qué va a consistir el error y por qué nos dice que si vamos PJD es exception si vamos bajando llega un momento que nos dice que no hay una sesión abierta no ocurren sesión contes.

Por qué ha sido eso.

Bueno volvemos otra vez al modelo a los métodos que hemos ido creando y bueno el problema aquí reside básicamente en que al llamar al Guez ocurre sesión nos devolvería digamos la sesión actual si es que se hubiera abierto alguna como las hemos ido abriendo y cerrando no hay ninguna abierta.

Entonces served current Session es un método que si lo podemos tener un contexto donde hay una sesión ya creada y que se esté compartiendo.

Pero si lo que queremos es ir abriendo y cerrando nuestras sesiones para ganar en eso cierta eficiencia pues en vez de que curren sesión utilizaríamos Open session vale bueno o vamos a ir sustituyendo en todos los sitios donde tenemos a ver aquí sesión también aquí también y aquí tan Bale y en el otro no tenemos nada más que 1 lo tenemos guardamos todos los cambios y volvemos a probar de nuevo recuperamos la página del Odin vamos a ver 3 1 3 1 que son los usuarios que tenemos en la tabla de usuarios.

Tramos tardado un poquito lo cual significa una buena señal.

Vamos a ver la lista de contactos aquí tenemos la lista de contactos donde nos aparecen todos los contactos que teníamos en la base de datos.

Bueno por ejemplo vamos a ver si es capaz de eliminar efectivamente Limina o vamos al menú y vamos ya crear la última prueba.

1 contacto contar a junto con un número de teléfono guardamos aquí debería aparecer efectivamente el nuevo contacto o la lista.

Como veis funciona exactamente igual que el otro difrencia en el ejercicio 3 utilizamos JPA en todos los ámbitos de lo que es creación y utilización de capa persistencia y aquí hemos utilizado Internet.

# 35 Ell API Criteria 03:44

El API criteria de JPA es una alternativa al uso de Query/JPQL de cara a realizar consultas sobre la capa de persistencia. La diferencia fundamental entre uno y otro método de consulta es que mediante el API criteria construimos las consultas de forma dinámica a través de objetos, sin necesidad de predefinir las instrucciones con un lenguaje especial de consulta como JPQL.

El API criteria está formado por una serie de interfaces que podemos encontrar en el paquete javax.persistence.criteria.

### CriteriaBuilder

Para realizar cualquier operación con el API criteria necesitamos un objeto CriteriaBuilder, el cual puede obtenerse a partir del objeto EntityManager a través del método `getCriteriaBuilder()`:

`CriteriaBuilder cb=em.getCriteriaBuilder();`

Una vez que disponemos del CriteriaBuilder podemos crear objetos CriteriaQuery, que son los que nos permitirán realizar las consultas sobre la capa de persistencia

### CriteriaQuery

Como te acabo de indicar, el objeto CriteriaQuery es quién nos permitirá realizar las consultas de selección de entidades sobre la capa de persistencia. Para crearlo, recurriremos al siguiente método de CriteriaBuilder:

`CriteriaQuery<T> createQuery(Class<T> claseResultado)`

El parámetro claseResultado es el objeto Class correspondiente al tipo de entidad que vamos a tratar en la consulta.

Por ejemplo, para consultar sobre la capa de persistencia formada por objetos Contacto tendríamos que crear el objeto CriteriaQuery de la siguiente manera:

```java
CriteriaQuery<Contacto> 
cq=cb.createQuery(Contacto.class);
```

La interfaz CriteriaQuery proporciona una serie de métodos para construir la consulta. Estos métodos corresponden con las cláusulas utilizadas para crear una instrucción JPQL , así tenemos los métodos `select(), from(), where()`, etc.

### Raíz de una consulta. La interfaz Root

Para poder realizar una consulta a través de los métodos de CriteriaQuery, necesitamos primeramente disponer de la raíz u origen de la consulta, que está representado en criteria mediante un objeto Root.

Root es el punto de partida de una consulta al igual que lo es el elemento indicado en las cláusulas From de JPQL, de ahí que para obtener un objeto Root tengamos que recurrir al método `from()` de CriteriaQuery:

`Root<Contacto> raiz=cq.from(Contacto.class);`

### Ejecución de la consulta básica

A partir de aquí, ya podríamos lanzar una instrucción select simple de recuperación de todas las entidades. Para ello, utilizaremos el método `select()` de CriteriaQuery, al que tendremos que pasarle el objeto Root. La llamada a este método nos devuelve un nuevo objeto CriteriaQuery, configurado como una consulta Select básica:

`cq=cq.select(raiz);`

Lo anterior equivale a la instrucción JPQL:

`Select c From Contacto c`

Para manipular las entidades resultantes de la consulta, utilizaremos como en JPQL el objeto Query o TypedQuery, pues podemos crear uno de estos objetos a partir del método createQuery(`CriteriaQuery<T> cquery`) de EntityManager.

Para mostrar los nombres de todos los contactos sería:

```java
TypedQuery<Contacto> q=em.createQuery(cq);
List<Contacto> contactos=q.getResultList();
for(Contacto c:contactos){
   System.out.println(c.getNombre();
}
```

### Condiciones de selección

Para establecer una condición a la hora de seleccionar las entidades, emplearemos el método `where()` sobre el CriteriaQuery obtenido de la selección, al igual que en JPQL empleamos la cláusula where.

Sin embargo el uso del método where no es tan simple como el de la cláusula where, a la que le pasamos un String de la forma "columna operador valor". El método `where()` que utilizaremos en criteria tiene uno de estos formatos:

```java
CriteriaQuery<T> where(Expression<Boolean> restriction)
CriteriaQuery<T> where(Predicate... restrictions)
```


En el primer caso, se pasa como parámetro al método un objeto **Expression** de tipo boolean con la condición de selección, mientras que en la segunda versión del método se pasaría como parámetro un número variable de objetos **Predicate**.

Tanto en un caso como en otro, deberíamos recurrir a métodos de la clase CriteriaBuilder que nos proporcionarán objetos *Expression y Predicate* para formar las condiciones de selección.

Vamos a ver un ejemplo que nos sirva para aclarar el funcionamiento de este método `where()`. Supongamos que queremos recuperar un objeto Contacto a partir de su email. Utilizaremos en este ejemplo la segunda versión de `where()`, al que pasaremos como parámetro un objeto Predicate que defina la condición.

Ese objeto Predicate representa  una condición de igualdad que podemos generar a partir del método `equals()` de QueryBuilder:

`Predicate equal(Expression<?> x, Object y)`

El objeto Expression representaría el atributo al que le aplicaremos la condición de igualdad y podemos obtenerlo a partir del objeto Root, aplicando su método `get()` con el nombre del atributo. El segundo parámetro de `equals()` es el valor con el que se va a realizar la comparación.

Asi pues, el CriteriaQuery que definiría la consulta de selección de entidades Contacto cuyo email sea `"test@gmail.com"` sería:

`cq=cq.where(cb.equal(raiz.get("email"), "test@gmail.com"));`

Si lo que queremos es recuperar todos los contactos cuyo nombre comience por "pru", utilizaríamos el método `like()` de CriteriaBuilder:

`cq=cq.where(cb.like(raiz.get("nombre"), "pru%"));`

Estoy bastante de acuerdo contigo en que la utilización del API criteria resulta mucho más farragoso que JPQL, sin embargo, debes considerar una ventaja el poder definir las condiciones de selección de forma dinámica, sin usar ninguna cadena JPQL.

### Unión de condiciones

La interfaz CriteriaBuilder también dispone de los métodos `and()` y `or()` para unir varias condiciones con estos operadores lógicos. Por ejemplo, si queremos recuperar los contactos cuyo email sea `"test@gmail.com"` y su nombre comience por "Luis", sería:

```java
cq=cq.where(cb.and(cb.equal(raiz.get("email"), "test@gmail.com"),
                                cb.like(raiz.get("nombre"), "Luis%")));
```                                

### Operaciones Delete y Update

Además de la interfaz CriteriaQuery para consultas de selección, tenemos CriteriaDelete y CriteriaUpdate para realizar consultas de acción. Estos objetos son creados, respectivamente, con los métodos `createCriteriaDelete()` y `createCriteriaUpdate()` de CriteriaBuilder.

Por ejemplo, si quisiéramos eliminar los contactos cuyo telefono sea 5555 sería:

```java
CriteriaDelete<Contacto> cd=cb.createCriteriaDelete(Contacto.class);
Root<Contacto> raiz=cd.from(Contacto.class);
cd.where(cb.equal(raiz.get("telefono"), 5555));
Query qr=em.createQuery(cd);
EntityTransaction tx=em.getTransaction();
tx.begin();
qr.executeUpdate();
tx.commit();
```

# 36 Ejercicio práctico VI 07:27

Después de haber estudiado la gritería he visto que es un poquito más complejo que la utilización de J.P. cuele para realización de consultas.

Por tanto vamos a ver si en este ejercicio práctico lo aclaramos todo su funcionamiento se trata de realizar una nueva versión más de la aplicación web de la agenda de contactos.

Pero la consulta la vamos a implementar con la Criteria en lugar de JRE en el ejercicio pues vamos a ver ya lo tengo yo hecho aquí vamos a analizarlo es el 07 quiroprácticos 6 que podrás encontrar en la zona de recursos para que te lo descargues y en principio lo que he hecho es crear una copia del ejercicio práctico 2 que ya teníamos creado e implementando una aplicación web con moda arquitectura Modelo Vista Controlador donde la lógica de negocio la teníamos en gestión contactos y gestión a usuarios.

Bueno pues todos lo teníamos hecho con JPA y ahora vamos a ver cómo sería esas mismas operaciones.

Concretamente en la parte de las consultas claramente pero utilizando la API Criteria en lugar de JPQL.

Entonces nos vamos a centrar en el único cambio a las únicas clases donde hay que hacer cambios son en contactos es decir usuarios el resto tanto entidades como servlet como páginas JSP.

Obviamente permanece igual puesto que lo único que cambia es la lógica de acceso a la capa de persistencia concretamente la manera en la que vamos a enviar las consultas.

Vamos a empezar por gestión contactos contactos teníamos una serie de métodos teníamos el método privado que nos devuelven Timaná ayer.

Lógicamente eso se mantiene.

He visto que hemos cambiado el nombre de la Unidad de persistencia.

También existen en XML lógicamente para adaptarlo al nuevo ejercicio.

Y bueno pues las dos métodos los dos métodos que teníamos de alta de contactos lo dejamos igual porque para hacer una operación básica Crook con los métodos en este caso pero si eso no lo vamos a hacer con API Criteria petitorias para hacer consultas enviar consultas en lugar de JPEG suele hacerlo con este app.

Entonces el primer método donde vamos a aplicar Criteria es recuperar contactos que se recuperan todos los contactos de la base de datos.

Aquí creamos construimos el Criteria Builder el criterio de QWERTY a partir de la clase contacto el objeto RUV también utilizando el método from de Criteria.

Y bueno pues una vez que tenemos ya el Criteria Cury configurado o lanzamos un Select con el Roiz y esto sería el equivalente pues al Seele de todos los contactos a partidos seguiría Ueli y creamos Twitter QWERTY y sulkys.

Esto lo teníamos lo habrás visto en el ejemplo que teníamos puesto en la documentación en el documento donde se explicaba la pequeña historia en la lección anterior en cuanto a buscar un contacto a partir de un determinado email aquí ya tenemos que proponer una condición.

Por lo tanto después de hacer el Select del criterio injury todas estas situaciones como son las mismas que antes pues aplicamos el método huera donde aplicamos una condición llamada método Equal de Criteria Builder donde el email tenga que ser igual al valor de la variable email que se pasa como parámetro.

A partir de ahí cuando ya tenemos el Quiteria Kuric confeccionado creamos el Taipe QWERTY y de nuevo GAD3 un Liss en este caso nos quedamos con el primer resultado por si acaso hubiera más de uno que correspondería con el contacto primero que cumplan la condición que tenga cuyo valor de email sea igual al de esa variable.

En cuanto a eliminar contactos eliminar contacto a partir de líder sigue siendo una operación básica del City Manager Remus.

Hay que hacer cambios pero teníamos un eliminar contactos por email que luego no se utilizaba desde la capa de controlador y la vista.

Pero bueno lo teníamos implementado.

Bueno pues aquí sí teníamos que crear una consulta para eliminar por email.

Bueno pues igualmente lo vamos a hacer con Criteria.

Hasta aquí sería lo mismo hasta la creación del root pero en este caso no sería lo mismo porque en vez de crear un criterio evidentemente vamos a crear un criterio del experto si tenemos el criterio Wílder.

Y como ves aquí creamos un Criteria delete de la entidad al contacto que nos devuelve un objeto Criteria delete a partir de él con el método from creamos el robot y luego aplicamos la condición de eliminación.

Igual que tenía un método web el criterio también lo tenía Criteria delete para establecer la condición de eliminación.

En este caso es llamada el método de Criteria Builder donde le vamos a indicar que la columna mail es igual a este valor de la variable.

Una vez que tenemos ya el Criteria delete configurado de esa manera pues llamamos a Criteria Juri y en este caso una llamada a Execute porque no se trata de seleccionar sino de una actualización.

Eso en cuanto a gestión de contactos teníamos otra clase que es gestión usuarios donde se hacía el lock in.

Sin embargo este método autenticar donde recibamos un usuario una contraseña y tendríamos que devolver si el usuario existía o no entonces lanzábamos en su momento en estos días JP QL vamos a verlo con Criteria Criteria aquí sería crear de nuevo un Criteria Cueli porque se trata de una selecta lanzamos una serie de raíz de decir esto serían las cuatro mismas instrucciones que en el caso de la gestión en contacto donde se hacía una búsqueda de los contactos y bueno a la hora de establecer la condición método web.

Pues en este caso ya no se trata de que cumpla una única condición que tal columna sea igual al valor que cumplir dos.

Por lo tanto deben estar dentro de una llamada al método de Criteria Builder donde le vamos a pasar las dos condiciones que usuarios e igual a la variable usuario y que sea igual a la variable PWR que tenemos el método al or si la condición fuera que cumpla una u otra podremos pasarle varias condiciones método al método y así podemos confeccionar una consulta más compleja. 

Bueno pues una vez que tenemos el criterio Aquaris pues como siempre el PP adquiere a partir de ahí una llamada Persinger Rasul para ver si se obtiene un resultado de un usuario que cumpla esa condición.

Si devuelve un resultado entonces esta instrucción se ejecutará normalmente se devuelve true bueno esto sería realmente lo mismo que ya teníamos hecho en la versión anterior puesto que a partir de inserta y pecarí todo es igual e independientemente de que es utilizado JPQL o Quiteria.

Bueno pues esto sería esas funcionalidades implementadas a través de la victoria como es pues bueno pues es un poquito más complejo que J.P. QL pero permite construir dinámicamente y no depender de una cadena corta huele que en algunos casos esto ofrece esa ventaja de poder como digo con modificar y confeccionar dinámicamente la consulta.

# Autoevaluación VI 01:00

1. Si queremos al cargar una entidad queremos que su objeto u objetos relacionados se carguen también en ese momento, habrá que indicar en la anotación de relación:
   * `load=LAZY`
   * `fetch=FetchType.LAZY`
   * `load=EAGER`
   * `fetch=FetchType.EAGER` :+1:

2. Si no se indica nada en la anotación de relación
   * Todas las operaciones que se realicen en la entidad son propagadas a los objetos relacionados
   * Ninguna de las operaciones sobre la entidad es propagada a los objetos relacionados :+1:
   * Solo la operación de actualización es propagada a los objetos relacionados
   * Solo la operación de eliminación es propagada a los objetos relacionados

3. Indica cual de las siguientes afirmaciones sobre el API Criteria es verdadera
   * Se emplea para realizar las mismas operaciones de eliminación, actualización, inserción y recuperación que se hacen con los métodos de EntityManager
   * Requiere que toda la configuración de las consultas se realice en XML
   * Es una alternativa al uso de Query y TyperQuery :+1:
   * Se basa en definir operaciones mediante anotaciones

4. La carga de datos relacionados en una relación muchos a muchos
   * Es siempre de tipo Lazy
   * Es siempre de tipo Eager
   * Es aleatoria
   * Se configura igual que en el resto de relaciones :+1:

5. Para establecer las condiciones en una consulta de selección de entidades, generada por el API Criteria
   * Utilizaremos el método select de CriteriaBuilder
   * Utilizaremos el método where de CriteriaBuilder
   * Utilizaremos el método where de CriteriaQuery :+1:
   * Utilizaremos el método where de Root
 


SOLUCIONES:

1.-D

2.- B

3.- C

4.- D

5.- C


# Resumen final 07:25

Bueno pues ya hemos llegado al final de este curso a modo de resumen si te parece vamos a repasar un poquito los conceptos que hemos visto a lo largo del mismo.

Empezamos hablando de lo que era una capa de persistencia que nos permitía exponer los datos a la aplicación en forma de objetos los que llamamos entidades y esa capa de persistencia puede ser creada y también manipulada desde la aplicación utilizando el estándar de Java Java persistan API que forma parte de la especificación Java.

Java persiste en API pues dispone de un objeto principal conocido como Timaná ayer que nos proporciona una serie de métodos para realizar las llamadas operaciones básicas Cruzat de crear recuperar actualizar y eliminar entidades que se traduce en hacer esas operaciones por detrás que las lleva a cabo el motor de persistencia.

La base de datos estos métodos serán el percibís para hacer la persistencia o añadir nuevas entidades actualizar entidades eliminar entidades y localizar entidades recuerda que estas tres operaciones que implican una acción en la base de datos están englobadas dentro de una transacción que en caso de utilizó en Enterprise Java Bin como vimos esas transacciones serán gestionadas automáticamente por el contenedor JB no tendríamos que preocuparnos del código de iniciar confirmar transacciones por supuesto también hemos visto las consultas como una parte muy importante de JPA ya que aparte de esas operaciones.

Si queremos hacer operaciones más complejas que impliquen por ejemplo recuperar entidades en base a criterios diferentes a la primera íQué y eliminar conjuntos de entidades etcétera pues tenemos que recurrir como digo a las consultas que se ejecutan a través de o bien el objeto qwerty o Taipe.

Esas consultas se definen utilizando un lenguaje basado en SQL conocido como J.P. cuelen Java persista en qn a la hora de generar las consultas que da las consultas.

Podemos utilizar consultas estándares que se definen dentro de la propia el propio código.

Como ves aquí en este ejemplo las consultas pueden ser parametrizada es decir determinados valores pueden no conocerse en el momento de crear la instrucción y proporcionarse después como parámetros en vez de andar concatenando valores y demás en la propia instrucción se pronuncian como parámetros que pueden ser parámetros definidos o bien por posición o bien por un nombre y también vimos que otra variante a la hora de crear las consultas es en lugar de definirlas como en estos casos en el propio código.

La definíamos en la entidad las llamadas equally o consultas nominadas a la hora de trabajar con ellas.

Luego en el código creábamos creamos el objeto qualia asociado a la consulta utilizando creatinina Mercuri en lugar de create QWERTY indicando el nombre de la consulta que se le había asignado al crearla dentro de la entidad como es el lenguaje JPQL es la parte esencial a la hora de crear una consulta y hemos visto que existen realmente tres tipos de instrucciones JPQL la Sele cuyos formatos ves aquí tres ejemplos de cada una.

SELECT UPDATE DELETE.

Tres ejemplos de clásicos de utilización de dichas instrucciones que una vez definidas se proporcionan al objeto a la hora de crear el objeto KERI o Taipe.

Si bien si vienen directamente o ya se han especificado Mercuri y ya una vez que ya las tenemos podemos ejecutarlas vimos también cómo podíamos relacionar entidades a fin de facilitar las operaciones.

Cuando trabajamos con un conjunto de entidades que tienen alguna relación entre ellas es decir a nivel de tabla tienen un campo común pero a nivel de entidad eso se traduce en que un objeto de una entidad incluye en su interior todos los objetos relacionados.

Entonces qué ocurre.

Que por ejemplo vas a obtener recuperar una entidad.

Por ejemplo hacer un fin o una consulta de un conjunto de entidades.

Recuperamos también los objetos relacionados con lo cual las operaciones en el código luego se simplifican bastante las relaciones podrían ser uno a muchos una entidad le corresponden muchos objetos de otra muchos a uno es decir a varias entidades estas tienen asociado el mismo objeto de otra de otra entidad o muchos a muchos a la hora de configurarlas pues aquí vemos unos ejemplos de las anotaciones que culturizar en cada caso y también de las anotaciones a nivel de definición de lo que son las columnas de relación o relaciones a nivel de tabla de la base de datos.

No todo se podía resolver con relaciones y con instrucciones J.P. cueles simples es decir hay algunas consultas complejas que solamente se pueden resolver uniendo entidades dentro de la consulta a través de una cláusula que también se dispone de ella en el lenguaje SQL estándar que la cláusula Yeung nos permite como ves aquí pues a la hora de seleccionar una entidad que es una relación del tipo de lado no mucho del lado uno por ejemplo a la hora de seleccionar producto pues esa entidad a la hora de relacionarla conventos para establecer la condición a través de ventas pues no se podría hacer directamente en una instrucción habría que recuperar todos los todos los productos y sumando lo bueno sería algo bastante complejo como ya vimos en un ejercicio que te presente entonces a través de la cláusula Yeung.

Se puede indicar cuál es ser la entidad de relación a quién sería SELECT FROM productode Yeung la palabra reservada y luego indicas cuál es el atributo muchos que contiene la colección de ventas al que se le asocia un alias para después poder establecer la condición sobre esa entidad venta sobre todo cuando tenemos varias.

Aparte de este caso sí hay varias entidades implicadas a utilizar yo y no es una cosa que simplifica enormemente lo que sería la creación de las instrucciones una vez que ya tiene la instrucción completa o con se construyen los objetos que nos van a permitir ejecutarlas.

Y por último también estuvimos hablando de la API Criteria aparte de otros elementos que vimos como por ejemplo actualizaciones en cascada la carga de datos rápida o carga perezosa.

También vimos cómo crear primero X compuestos y finalmente hablamos de la API Criteria que nos permite definir consultas dinámicamente sin utilizar JPQL.

Esto ofrece cierta flexibilidad a la hora de crear las consultas.

Vimos que también creaba o generaba cierta complejidad puesto que como veis están implicadas nuevas clases aparte de lo que son más clásicas las interfaces QWERTY el ayer evidentemente para construir las consultas en vez de utilizar una cadena instruccion J.P. suele empleábamos el Criteria Builder que es el creador de consultas el objeto root para hacer referencias a las entidades sobre las que se va a trabajar y luego ya depende de la consulta utilizar si es de selección 7 eliminación de actualización pues tienes Criteria Couric Criteria Deloitte Criterium respectivamente pues esto es todólogo lo que hemos visto en el curso espero que hayan disfrutado con él y que haya sido de tu agrado.

En cualquier caso ya sabes que estoy aquí para responder a cualquiera de tus dudas y para atenderte en todo lo que pueda necesitar.

Un saludo y gracias.
