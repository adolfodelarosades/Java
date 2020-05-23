# UNIDAD 3 JAVA STRUTS 2.0 AVANZADO PARTE 1

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

1. Introducción a Struts 2
2. Patrón MVC y beneficios
3. Introducción a las acciones
4. Controlador con Servlets (crear vista)
5. Controlador con Servlets (crear acción)
6. Controlador con Servlets (crear Servlets)
7. Controlador con filtro (crear filterdispatcher)
8. Fichero Struts.xml
   * 8.1 Detalles de struts.xml
   * 8.2 El Tag Include
   * 8.3 El Tag Bean
   * 8.4 El Tag Constant
9. Añadir librerías struts y crear vista
10. Crear acción y fichero struts.xml
11. Añadir resultado a la acción
12. Clase ActionSupport
13. Creación de la acción con ActionSupport
14. Implementación de interfaces de contexto
15. Resultados de las acciones
16. Cambiar resultados de las acciones
17. Struts tags
   * 17.1 La sintaxis de las etiquetas Struts 2
   * 17.2 Sintaxis de JSP
   * 17.3 Categorías de etiquetas
18. Object Graph Navigation Language (OGNL)
   * 18.1 Lenguaje de expresión
   * 18.2 Convertidores de tipo
   * 18.3 Cómo engrana OGNL en el marco
19. Crear formulario con form tags
20. Crear acciones
21. Acceder a la pila de valores
22. Creación de acciones para form tags
23. Atributos list, listKey y listValue
24. Generic tags
25. Crear acción para listado
26. Utilizar generic tags
27. Programar ordenación
28. Validación de entrada
29. Crear el formulario
30. Crear primeras validaciones
31. Tipos de validación
32. Etiquetas set y push
33. Validación personalizada


### Introducción

Struts es uno de los frameworks más difundidos en Java. Concretamente, podemos decir que es el marco de trabajo MVC más utilizado en las aplicaciones empresariales.  

Además, en el caso de Struts 2, se superan las limitaciones del primer enfoque de Struts, dando respuesta a muchas de las necesidades de diseño a la hora de desarrollar aplicaciones profesionales en Java.  

Como iremos viendo en los siguientes apartados, Struts está conformado por un conjunto de clases que nos facilitan la resolución de problemas bajo el patrón MVC. Algunos de ellos son, por ejemplo, a nivel de visualización, la creación y validación de formularios.  

Al ser un framework MVC, queda claro que la arquitectura de las aplicaciones desarrolladas se dividirán en esas tres capas: modelo, vista y controlador. 

Como también iremos comprobando, en Struts existe un fichero crítico, llamado struts-config.xml, en el cual se establece la lógica de presentación y de navegación de la aplicación.   

En este fichero se identifican elementos como: 

* Los beans de formulario o, lo que es lo mismo, los datos enviados por cada acción del usuario al controlador. 
* Las acciones de formulario, es decir, aquellas en las que las acciones desde las páginas del cliente han recibido información por medio de los beans del formulario y generan diversas visitas en respuesta al usuario, apoyándose en páginas JSP. 
* Las reglas de navegación por las diferentes páginas utilizando, para ello, mapeos de acciones. 
* Las reglas de validación en los formularios (en el cliente o en el servidor). 
* Las reglas de filtrado de peticiones.  

Desde el punto de vista de la aplicación y uso práctico de Struts, sin duda ha sido el crecimiento de la demanda de aplicaciones web lo que ha disparado el interés en este entorno de trabajo. 

### Mapa conceptual

<img src="images/c3/3-mapa-1.png">

<img src="images/c3/3-mapa-2.png">

<img src="images/c3/3-mapa-3.png">

### 1. Introducción a Struts 2

En la actualidad, el MVC (Modelo-Vista-Controlador) se emplea de forma generalizada para el desarrollo de aplicaciones web. No obstante, existen una serie de desventajas, las cuales presentamos a continuación: 

1. El nivel de conocimiento que se requiere del modelo y lo difícil que se hace entenderlo inicialmente.
2. La cantidad de ficheros que se precisan (tres veces más que los desarrollos convencionales).
3. El repetir muchas veces las actividades.

Debido a estas desventajas, en 1999, Craig McClanahan diseñó un framework para acelerar los desarrollos de Java EE. Posteriormente, en 2000, cedió a la fundación Apache, que llamó Struts 1.0 y que fue el framework de diseño más popular de Java EE.  

Luego se creó otro framework, llamado WeBWorK, que presentaba una serie de ventajas distintas a las de Struts 1.0. Viendo este panorama, a finales del 2005, estos framework se fusionaron e hicieron que, gracias sus funcionalidades, se formara Struts TI (Titanium) que, poco después, pasó a llamarse Struts 2.0.   

Entonces, los creadores de Struts 1.0 y Jason Carreira, encargado de WeBWorK, plantean reagrupar las ventajas de ambos framework para producir Struts 2, que no es una extensión de Struts, debido a que el 2 tiene un diseño completamente nuevo. Es importante señalar que, por este motivo, los desarrolladores deben aprender muchos de los nuevos comandos y funcionalidades de Struts 2.   

Struts 2 es un framework fundamentado en una arquitectura, en forma de archivos XML, junto con funcionalidades Java, que se encuentran localizadas en los archivos de clases de acciones. Este framework se caracteriza porque está orientado a acciones y éstas, a su vez, se componen en tres funciones. 

* **Primera función**: Primeramente, las acciones son la parte más importante del framework, al encapsular el procesamiento y el trabajo que se deberá realizar.
* **Segunda función**: En segundo lugar, las acciones permiten manipular los datos de las consultas durante sus transferencias.
* **Tercera función**: Tercero, es el framework quien determina qué resultado debe ser devuelto y la vista presentada en respuesta a cada procesamiento.

Struts 2 implementa, en sus acciones, los llamados objetos JavaBeans para cada conjunto de datos enviados en la selección. Cada parámetro de selección se enuncia en la clase de acción, con una propiedad idéntica, para así realizar las asignaciones de valores automáticamente. La función principal de una acción es devolver una cadena de caracteres, pudiendo definir el resultado que se va a presentar.  

En síntesis, Struts 2 se centra en un modelo de diseño de tipo MVC II, el cual, permite un desarrollo más rápido, más flexible y resuelve varias situaciones de diseño, ofreciendo los siguientes servicios: 

* Un sistema evolucionado de gestión del enrutamiento o de navegación. Un sistema de validación de formularios y de entradas, fácil de aplicar. 
* Un potente sistema de complementos o de extensiones (para gráficos y fuentes de datos). Desarrollo de sitios web en múltiples lenguajes. 
* Concurrencia asistida por AJAX. 
* Proceso de depuración añadido al framework. 
* Una biblioteca potente de etiquetas. 

<img src="images/c3/3-Introduccion-a-Struts2.png">

*Arquitectura del framework Struts 2*

La elección del framework Struts 2 se argumenta en base a los siguientes beneficios: 

**Fiabilidad**:

Desde la creación del proyecto (año 2000) ha tenido un seguimiento continuo. Este framework tiene una excelente reputación y un continuo depurado de los errores. 

**Flexibilidad**:

Cada acción se puede adaptar a las necesidades del desarrollador. Los archivos de configuración son muy flexibles y todas sus validaciones son sencillas de aplicar. 

**Rendimiento**:

Posee un rendimiento alto y cuenta con un sencillo mantenimiento, debido a que está separado por capas. 

<img src="images/c3/3-Struts-1.png">

<img src="images/c3/3-Struts-2.png">

<img src="images/c3/3-Struts-3.png">

<img src="images/c3/3-Struts-4.png">

<img src="images/c3/3-Struts-5.png">

<img src="images/c3/3-Struts-6.png">

### 2. Patrón MVC y beneficios

Respecto a la arquitectura MVC II, Struts 2 requiere de pocas normas de diseño y que no son del todo obligatorias: 

* No emplea 100% código Java en las páginas JSP. Toda la lógica de control se apoya en las clases de acciones (Servlets). * Emplea librerías de etiquetas para llegar a los objetos y navegar por sus colecciones. 
* Se programa un minúsculo código repetitivo y se recurre a las herramientas que contiene el framework.  

Como ya se ha mencionado anteriormente, es aconsejable emplear la arquitectura MVC para programar aplicaciones web en Java.    
La función del patrón MVC y su principal ventaja es dividir el desarrollo en tres elementos principales. A continuación, vemos la explicación introductoria de estos elementos: 

**Modelo**:

Corre por cuenta del desarrollador y está representado por los objetos JavaBeans, o los EJB, o los sistemas de persistencia. 

**Vista**:

Se implementa en las páginas JSP.

**Controlador**:

Es una clase de Struts representada por los Servlets o clases de Java.

<img src="images/c3/3-modelo-2.png">

El principio de funcionamiento de la arquitectura MVC se explica de la siguiente manera: 

* Un cliente realiza una petición HTTP al servidor, siendo un Servlet quien ejecuta esa solicitud. 
* El Servlet retoma la información suministrada por el usuario y pasa la ejecución a un módulo adaptado para tal fin. 
* Los módulos del modelo manejan, o no, los datos de la información. 
* Una vez culminada la ejecución, los módulos retornan la respuesta al Servlet. 
* El Servlet solicita la página JSP apropiada. 
* La página JSP se procesa, empleando los datos enviados por el Servlet y traslada el resultado al cliente.  

Esta arquitectura MVC separa la lógica empresarial de la visualización. En este modelo, un componente se encarga de recibir las consultas (Servlets), otro procesa los datos (Clases), y un tercero administra la visualización (JSP). Si la interfaz entre estos componentes está muy bien definida, será más sencillo modificar un componente sin afectar a los otros dos. 

<img src="images/c3/3-ciclo.png">

*Arquitectura MVC, Servlets y JSP*

La lógica MVC para una aplicación web más actualizada sería la que el cliente envía consultas al servidor; cada acción corresponde a un Servlet que dirige la consulta a una página JSP adecuada y realiza un procesamiento o ingresa a los datos, y en este caso, inicia otro programa que se encargará de responder a la solicitud del usuario actual.  

Los llamados Servlets, que tienen la responsabilidad de ser el controlador de una aplicación MVC, deben tener un espacio para encaminar las sentencias a los módulos que se encargan de la visualización. Este espacio lo proporciona el objeto RequestDispatcher. Este módulo nos proporciona la posibilidad de pasar una sentencia de un módulo a otro.  

Obtenemos un objeto `RequestDispatcher` con el método getServletContext().  Desde este objeto es posible conseguir un `RequestDispatcher` con la ayuda de los siguientes métodos: `getNameDispatcher(nombre)` o `getRequestDispatcher(ruta)`. Este método `getRequestDispacher(…)` funciona con una ruta que comienza por la barra y que es relativa al contexto de la aplicación.  

<img src="images/c3/3-video-1.png">

[Video MVC](https://www.youtube.com/watch?time_continue=5&v=H5A5eXbyPxM&feature=emb_logo)

<img src="images/c3/3-crusi-1.png">

<img src="images/c3/3-crusi-2.png">

### 3. Introducción a las acciones

<img src="images/c3/3-acciones.png">

Para esclarecer el escenario de Struts 2, comenzaremos con un bosquejo del papel que juegan las acciones en este marco de trabajo.   

Explicaremos el propósito y las diversas funciones del componente de acción, así como las obligaciones que tiene un objeto en el papel de una acción hacia el marco, en general, teniendo en cuenta que cualquier clase puede ser una acción, siempre y cuando cumpla sus obligaciones con el marco.   

Con respecto a las acciones, estas hacen tres cosas:  

**Primero**: Primero, la acción juega un papel importante, desde la perspectiva de la arquitectura del marco, porque se trata de encapsular el trabajo real a realizar para una solicitud dada.

**Segundo**: El segundo rol es servir como soporte de los datos en la transferencia automática de datos del marco desde la solicitud a la vista.

**Tercero**: Finalmente, la acción debe ayudar al marco de trabajo a determinar qué resultado debe devolver a la vista en respuesta a la solicitud.

##### Para saber más ...

*Las acciones de Struts 2 no tienen que implementar la interfaz Acción. Cualquier objeto puede cumplir, informalmente, el contrato con el marco implementando un método execute () que devuelve una cadena de control.*

Las funciones de las acciones, en este marco de trabajo, son de gran utilidad. Destacamos las siguientes: 

**Administración de los recursos**

Los Servlet de Java son los recursos a los que se puede tener acceso desde las clases de acción de Struts 2; esto permite acceder a ellas a través de la herencia de clases, o también por medio de la implementación de interfaces. 

**Administración dinámica del mapping**

Para evitar que el archivo de configuración de Struts tenga muchas líneas de código y declaraciones repetitivas e idénticas, se ha tratado de resolver este problema declarando acciones en modo de expresiones regulares o bien por medio de modelos denominados wildcard.  

**Invocación dinámica de los métodos**

Para la invocación dinámica de métodos, Struts utiliza un carácter (!), que es llamado o conocido como notación *bang*. La invocación dinámica está siempre habilitada por la configuración en el archivo *default.properties*. 

**Administración de los resultados**

Los resultados que devuelve la clase acción de Struts son cadenas de caracteres que guardan relación con la gestión de esa acción. 

**Administración de las excepciones**

Para cualquier proyecto, el gestionar las excepciones es fundamental, ya que aporta seguridad al procesamiento del código. Struts proporciona la etiqueta `<exception-mapping>` para administrar dichas excepciones, permitiendo obtener las excepciones no procesadas en las acciones. En este caso, es de forma local en la acción, pero si se desea hacer de forma global, se deberá cambiar la etiqueta por `<globals-results>`. `</globals-results></exception-mapping>`

##### Artículo de interés

En este artículo podrás profundizar en el tratamiento de errores y excepciones. 

[Artículo de interés](pdfs/sesion01-struts-apuntes.pdf)

<img src="images/c3/3-video-2.png">

[Video](https://www.youtube.com/watch?v=QSohwTY04Go&feature=emb_logo)

### 4. Controlador con Servlets (crear vista)

Crearemos una vista sencilla que será un formulario, que permitirá insertar, en un cuadro de texto, un nombre, que podrá ser buscado en la aplicación a desarrollar y también tendrá un botón para enviar dicho nombre. 

<img src="images/c3/3-agenda.png">

<img src="images/c3/3-Controlador-conServlets-2.png">

Para comprender un poco más el código anterior, explicaremos sus partes a continuación: 

**Parte 1**:

Para comenzar, diremos que el script anterior corresponde a una página .jsp.

**Parte 2*:

En la primera sección del código, obtenemos una serie de etiquetas de la biblioteca de etiquetas de tipo **taglibs**.

**Parte 3*:

También observamos la etiqueta `html:html`, que le señala a Struts que estamos en presencia de una página HTML.

**Parte 4*:

Además, tenemos `html:form`, que es la etiqueta que señala a Struts que la página posee un formulario. La etiqueta mostrada también le indica una acción de envío de los datos, que contiene el formulario y la validación que hará el cliente previo al envío de los mismos.

**Parte 5*:

Para poder añadir un botón en el mencionado formulario, se utiliza la etiqueta `html:text`. Con esta etiqueta, observamos que se puede incluir una propiedad, que es un bean que se enlaza al formulario creado.

**Parte 6*:

Como vemos en el código, existe una etiqueta `html:submit` que representa al botón de búsqueda, y es enlazada al formulario que se creó de Struts.

<img src="images/c3/3-video-3.png">

[Video](https://www.youtube.com/watch?v=zqvkdC1iiU4&feature=emb_logo)

<img src="images/c3/3-crusi-3.png">

<img src="images/c3/3-crusi-4.png">

### 5. Controlador con Servlets (crear acción)

Al formulario creado en el punto anterior, hay que añadirle una acción para que pueda funcionar con Struts. Para ello, debemos incluir el código que aparece en la imagen. 

<img src="images/c3/3-codigo-2.png">

Por ello, vamos a detallar este código, del cual podemos que la clase Action posee un procedimiento llamado execute que utiliza Struts para ejecutar la acción como tal. A esa clase le llegan 4 parámetros: 

**Mapping**

Struts los emplea para señalar a la acción donde ir. Se enlazarán a páginas .jsp. y mostrarán la vista que el usuario observará, posteriormente, a la ejecución de dicha acción.

**Request**

Son los datos de la solicitud enviados por el usuario.

**Form**

Es donde Struts almacena los datos que son enviados por medio del formulario.

**Response**

Será la respuesta que recibirá el usuario.

Después de hacer el código anterior, el paso a seguir es insertar la acción al Struts-config de la siguiente manera: 

<img src="images/c3/3-codigo-3.png">

Para que Struts reconozca cuál es la acción que se tiene que ejecutar en el momento que se solicite buscar, es necesario insertar la acción en el código de struts-config. Para ello, el código anterior se incrustará en las etiquetas `<actionmapping></actionmapping>` de struts-config.xml. 

### 6. Controlador con Servlets (crear Servlets)

Por lo general, los formularios utilizados en Struts llevan enlazados un bean, que almacena la información de los argumentos del formulario y, de esta manera, las acciones tienen la posibilidad de acceder a dicha información. 

**Bean 1**

Supongamos que tenemos una carpeta en nuestro directorio, llamada formularios. En esa carpeta añadimos el siguiente script:

<img src="images/c3/3-codigo-4.png">

**Bean 2**

A continuación, habrá que crear el archivo inicial de configuración de Struts. Aquí su código:

<img src="images/c3/3-codigo-5.png">

**Bean 3**

Ahora hay que incluir el bean en el formulario creado en el punto anterior, mediante el siguiente código:

<img src="images/c3/3-codigo-6.png">

Con este código indicamos a Struts el tipo de datos del bean que tendrá el formulario buscar. 

##### Enlaces de Interés

Ejemplo tomado y modificado en el siguiente enlace.

[Enlaces de Interés](https://www.adictosaltrabajo.com/2006/07/31/mi-primera-web-struts/)

### 7. Controlador con filtro (crear filterdispatcher)

El filtro FilterDispatcher es la clase “corazón”, por llamarla de alguna manera, y muy importante en Struts 2. Este filtro es el encargado de arrancar al framework, como tal, lo que quiere decir que es el foco de partida de la ejecución de todos los request y respuestas. Podemos mencionar sus funciones más destacadas: 

**Función 1**

Tiene la función de invocar a la clase Action para procesar una petición.

**Función 2**

Además, tiene la misión de iniciar el procesamiento de los interceptores (componentes indispensables de Struts).

**Función 3**

También debe prevenir la fuga de memoria, limpiando el ActionContext.:

**Función 4**

Esta clase FilterDispatcher fue reemplazada por otra clase llamada StrutsPrepareAndExecuteFilter a partir de la versión 2.1.3.

<img src="images/c3/3-arrastrar-1.png">

<img src="images/c3/3-arrastrar-2.png">

### 8. Fichero Struts.xml

El framework Struts 2 emplea un archivo de configuración (struts.xml) para arrancar sus servicios, entre los cuales encontramos: Interceptors, Actions y Results.  

Cuando se realiza la carga de struts.xml, la aplicación web solicita una sola vez la configuración. Esto no quiere decir que haya un sólo archivo .xml de configuración, ya que podemos añadir los xml que deseemos para especificar los objetos de Struts. Sin embargo, todos son leídos para crear la configuración.  Es importante señalar que un handicap de lo explicado es que una caída en alguno de ellos puede causar que la aplicación web no cargue adecuadamente. 

<img src="images/c3/3-strutsxml.png">

El archivo struts.xml es el archivo de configuración, por defecto, para el marco de trabajo y siempre estará vigente en el classpath de la aplicación web. Las características de este archivo las podemos enumerar a continuación: 

**Característica 1**

Admite su desintegración en pequeños archivos de configuración xml, que se añadirán en el central. Un ejemplo es lo siguiente:

<img src="images/c3/3-strutsxml-2.png">

**Característica 2**

Así mismo, se puede colocar un struts-plugin.xml en el JAR, que puede incluirse indistintamente en la aplicación. De esta manera, podremos establecer los componentes de una forma más fácil.

**Característica 3**

Si queremos emplear marcos de trabajo, como Freemarket o Velocity, las plantillas se obtienen cargándolas desde el classpath. Esto hará al programador encapsular el bloque completo como un sencillo archivo .JAR.

#### 8.1 Detalles de struts.xml

El tag `<struts>` es la base del archivo, y contiene los siguientes tags: packages, includes, beans y constants. Por ello, es importante que hablemos de la tag package, en la cual, los paquetes se emplean para apilar resultados, acciones, interceptores, tipos de resultados y pilas de interceptores en un bloque lógico de configuración. En definitiva, los paquetes son parecidos a los objetos, de forma que se extienden y pueden poseer divisiones que logren ser “sobreescritas” en “sub” paquetes.  

El tag `<package/>` se utiliza para apilar las configuraciones que posean propiedades afines, como la pila de interceptores o namespaces.  Además, es de gran utilidad para organizar las funciones que, a su vez, pueden dividirse en distintos archivos de configuración.  

El package muestra las propiedades siguientes: 

**Name**

Identifica de forma unitaria a un paquete. Este atributo es obligatorio.

**Extends**

Es la propiedad que identifica la herencia de la información de configuración, incluyendo la configuración de los actions. De esta forma, la herencia de la configuración del paquete estará a disposición de un paquete nuevo, con un nombre nuevo. 

**Namespace**

Suministra una ruta de las URL que van al paquete.  Por ejemplo, si se tienen dos paquetes diferentes, con nombres “paquete1” y “paquete2”, la URL se escribirá de esta forma `“/webApp/paquete1/mi.action”` y   `“/webApp/paquete2/mi.action”`. 

**Abstract**

Si tenemos que el valor de esta propiedad es verdadero “true”, el paquete será una agrupación de configuraciones y actions que no serán accedidos desde la ruta del nombre del paquete.  Es de suma importancia estar seguros de que se está heredando del paquete correcto para que su configuración sea la adecuada. 
 
#### 8.2 El Tag Include

El tag `<include/>` se emplea para dividir una aplicación de Struts 2 que requiera añadir otro archivo de configuración. Únicamente posee un parámetro “file”, con el nombre del archivo que debe ser añadido.  Los archivos que se insertan, muestran una estructura idéntica a struts.xml.  

El orden de inserción de los archivos es de suma importancia porque, ya sea cuando los actions u otros recursos se presentan con el mismo nombre, se tienen que sustituir los valores antiguos con los recién creados.  

Existen varios archivos que son añadidos de forma tácita, como es el caso del archivo strutsdefault.xml y struts-plugins.xml. Los dos archivos poseen las configuraciones que vienen por defecto para la clase interceptor, resultados, pila de interceptores, paquetes y también información de configuración para el ámbito de ejecución. En el caso de struts-defauls.xml, posee la configuración del core de Struts 2, y struts-config.xml posee la configuración específica de los plugins. 

##### Ejemplo práctico

Para modular un archivo de configuración en una aplicación sobre contabilidad que deba contener: facturas, administración, informes, etc., debemos pensar en la forma correcta de hacerlo.  SOLUCIÓN:  

```java
<struts>
   ...
   ...
   <include file="”facturas-config.xml”/">
    		<include file="”admin-config.xml”/"> 		
        <include file="”informes-config.xml”/">
        ...
</struts>
```

#### 8.3 El Tag Bean

Esta tag puede especificar los llamados beans globales. Sin embargo, no es requerida necesariamente en las aplicaciones. El componente bean necesita de la propiedad class para que pueda ser definido que, también, es la clase que lo implementa.  

El tag bean presenta las siguientes propiedades: 

**Class**

Identifica, de forma unitaria, la clase que implementa al Bean.

**Type**

Es la interfaz, no obligatoria, que implementa el bean.

**Name**

Es el nombre del bean que permite su recuperación en las distintas páginas.

**Scope**

Ámbito del bean, que puede ser default, singleton, request, session o thread.

##### Ejemplo práctico

A continuación encontrarás un ejemplo práctico sobre el tag bean.  

```java
<struts> 	
   <bean type="”net.ObjectFactory”" name="”factory”" class="”ejemplo.MyObjectFactory”/"> 		       
   ..... 
   </bean>
</struts>
```

#### 8.4 El Tag Constant

Los dos aspectos que caracterizan a las funciones del tag constant son, por una parte, que se emplean para simular datos, como el máximo tamaño del archivo a cargar, y, por otra parte, detallan el bean que podrá ser seleccionado entre las implementaciones disponibles.  

Las constantes son declaradas en muchos archivos. De esta manera, se localizan en el orden siguiente, lo que permite sustituir los valores más antiguos: struts-default.xml, struts-plugin.xml, struts.xml, struts.properties y web.xml.  

El archivo de configuración de Struts es semejante con WeBWorK. En el archivo struts.properties, cada valor de entrada se manipula como una constante. En el fichero web.xml, los atributos de inicialización de cada FilterDispatcher se suben como constantes.  

En diversas variables de XML, las constantes poseen dos atributos necesarios: name y value. 

##### Ejemplo práctico

A continuación encontrarás un ejemplo práctico sobre el tag constant.  

```java
<struts>
    <constant name="struts.devMode" value="true" /> 		
    ..... 
</struts>
```

##### Enlace de interés

En este enlace podrás encontrar un manual de Struts muy detallado y centrado en todos los tipos de tag. 

[Struts2](https://www.sicrea.com.mx/media/archivos/ManualStruts2Espanol.pdf)

<img src="images/c3/3-arrastrarysoltar-1.png">

<img src="images/c3/3-arrastrarysoltar-2.png">

### 9. Añadir librerías struts y crear vista

Para poder desarrollar este punto, vamos a crear una página HolaMundo.jsp en el directorio llamado pages, que será una página jsp, en la que se nos presente un mensaje de bienvenida. Esta jsp tiene que ser dinámica para mostrarla desde el servidor. 

#### Explicación 1

La librería tags llamada struts-tags es incluida en la primera línea de nuestro código y nos permite acceder a ella por medio del prefijo s:. Esta es una librería de distribución que nos proporciona Struts 2.

#### Explicación 2

En otras líneas `>s: property value=”mensaje”` y `s: property value=”currentTime”` hacen una llamada a `getMessage()` y `getCurrentTime()`, que son métodos del `action Struts2HolaMundo action class` y serán incluidos en la página. Como vemos, la inserción de los atributos se hace empleando las etiquetas de la librería struts-tag.

<img src="images/c3/3-codigo-7.png">

### 10. Crear acción y fichero struts.xml

A continuación, crearemos el archivo Struts2HolaMundo.java, que va a ser el action de la aplicación.  

<img src="images/c3/3-codigo-8.png">

El script anterior define una clase principal con dos getters, uno denominado mensaje, otro llamado currentTime y también un método execute. 

El archivo struts.xml, que es el de configuración de la aplicación en Struts 2, se insertará en la carpeta classes de nuestro proyecto y estará formado por este código: 

<img src="images/c3/3-codigo-9.png">

### 11. Añadir resultado a la acción

La aplicación “HolaMundo” funciona de la siguiente forma:

1. El servidor comienza buscando el recurso “HolaMundo.action”. Struts 2 configura el archivo web.xml, de manera que mande las peticiones a un filtro de org.apache.struts2.dispacher.FilterDispatcher. El archivo web.xml posee la siguiente codificación: 

<img src="images/c3/3-codigo-10.png">

2. A continuación, el marco de trabajo localiza el action “HolaMundo” empleando el archivo struts.xml. En lo que encuentra un action que identifica al modelo de la url, incluye una instancia de la clase que se muestra en la propiedad class. 

3. Seguidamente, el método execute ejecuta el mensaje y devuelve SUCCESS.

4. El marco de trabajo marca qué página se va a cargar, en caso de que sea devuelto el SUCCESS. En el ejemplo, el servidor cargará la página HolaMundo.jsp y devuelve la salida. 

Los actions, en el método execute de Struts 2, podrán devolver SUCCESS, ERROR o INPUT. Así mismo, podrán restituir alguna cadena de caracteres que deseemos, puesto que el método execute devuelve un String.  

La manera empleada para especificar la salida dependerá del número de entidades `<result>` que tenga la entidad `<action>` en el archivo struts.xml.

<img src="images/c3/3-crusi-5.png">

<img src="images/c3/3-crusi-6.png">

### 12. Clase ActionSupport

<img src="images/c3/3-action-support.png">

En este apartado vamos a presentar la clase ActionSupport, una clase de conveniencia que proporciona implementaciones predeterminadas de la interfaz Action, así como otras varias interfaces interesantes, aportándonos cuestiones tales como validación de datos y localización de mensajes de error.   

Esta clase de conveniencia es un ejemplo perfecto de Struts 2. El marco no obliga a usar esta clase, pero es una buena idea usarla, sobre todo cuando estamos aprendiendo.  

**Implementaciones**

Siguiendo la tradición de las clases de "soporte", ActionSupport proporciona valores predeterminados, así como implementaciones de varias interfaces importantes. Si nuestras acciones extienden esta clase, ganan automáticamente el uso de dichas implementaciones. Solo por eso, ya hace que esta clase valga la pena.

Además, las implementaciones proporcionadas por esta clase también proporcionan un excelente estudio de casos sobre cómo realizar una acción para cooperar con interceptores y lograr poderosas soluciones reutilizables para tareas comunes.

**Interceptores**

En este caso, servicios de validación y localización de texto que se proporcionan a través de una combinación de interceptores e interfaces. Los interceptores controlan la ejecución de los servicios, mientras las acciones implementan interfaces con métodos que son invocados por los interceptores.

ActionSupport proporciona una forma rápida de validación básica, y eso nos irá bien en muchos casos. Además, es un gran caso de estudio de cómo las tareas transversales -como la validación- se pueden factorizar a partir de la lógica de ejecución de la acción mediante el uso de interceptores e interfaces. El patrón típico es que el interceptor, mientras controla la ejecución de una tarea determinada, puede coordinarse con la acción invocando los métodos que presenta.   

Por lo general, estos métodos son parte de una interfaz implementada por esa acción. En nuestro caso, ActionSupport implementa dos interfaces que se coordinan con uno de los interceptores de la pila predeterminada, el DefaultWorkflowInterceptor, para proporcionar validación básica. Si tu paquete extiende el paquete struts-default, heredando la pila de interceptor predeterminada, y la acción extiende ActionSupport, legando así la implementación de las dos interfaces necesarias, entonces ya tenemos todo lo que necesitamos para una validación limpia de los datos. 

##### Artículos de interés

Si quieres conocer algunas de las vulnerabilidades de seguridad de Struts aquí las puedes conocer. 

[Vulnerabilidad de Struts](https://www.ccn-cert.cni.es/informes/informes-ccn-cert-publicos/2082-ccn-cert-ia-09-17-medidas-seguridad-vulnerabilidad-struts-1/file.html)

### 13. Creación de la acción con ActionSupport

A continuación, presentaremos un ejemplo de la creación de la acción de Struts, implementando ActionSupport. 

**Paso 1**

Primero, hay que tener en cuenta que nuestra acción, efectivamente, extiende ActionSupport

**Paso 2**

Además, fijarse que proporcionamos un método execute (), que contiene la lógica de negocio, registrando un usuario en este caso. Después de eso, vemos un conjunto de propiedades JavaBeans

**Paso 3**

Estas son características comunes de las acciones; sirven para recibir los datos de la transferencia automática del marco y luego llevar esos datos a través del marco.

**Paso 4**

Como podemos ver, nuestra acción proporciona un método validate (), que contiene toda nuestra lógica para verificar la validez de los datos recibidos por las propiedades de nuestros JavaBeans. Esto deja el método execute () de esta acción centrado en la lógica empresarial

**Paso 5**

Esta prueba requiere entender muy bien nuestra lógica de negocio y los niveles de datos. La aplicación utiliza una simple encapsulación de lógica y persistencia de datos. El objeto ServicioPortafolio es capaz de realizar nuestras peticiones bajo el escenario presentado. En caso de que interese, contiene todas las reglas del negocio, y hace que los datos persistan solo en la memoria. Nuestra acción solo instancia un objeto ServicioPortafolio cuando lo necesita.

**Paso 6**

La lógica de validación que proporcionamos es simple. Probamos cada uno de los tres campos para asegurarnos que no estén vacíos, midiendo la longitud de cada propiedad de cadena.

**Paso 7**

Si un fragmento de los datos no se valida, creamos y almacenamos un error a través de los métodos proporcionados por la superclase ActionSupport, como addFieldError ().

**Paso 8**

También comprobamos que el usuario no existe en el sistema.

<img src="images/c3/3-codigo-11.jpg">

*Creación de la acción con ActionSupport*

Tras la creación de la acción, nos deben surgir varias cuestiones, que son:

**Pregunta 1**

¿Qué sucede si falla la validación? Si alguno de los campos está vacío, o si el nombre de usuario ya existe en el sistema, llamamos a un método que añade un mensaje de error. Después de toda la validación lógica que se ha ejecutado, el control vuelve al interceptor de flujo de trabajo. Tengamos en cuenta que no hay valor de retorno en el método validate (). El secreto, como veremos, está en los mensajes que genera nuestra validación. Aunque el control ha regresado al interceptor de flujo de trabajo, no ha terminado.

**Pregunta 2**

¿Qué hace el interceptor de flujo de trabajo ahora? Después de llamar al método validate (), para permitir que se ejecute la lógica de validación de la acción, el interceptor de flujo de trabajo verificará si se generó algún mensaje de error por la lógica de validación. Si encuentra errores, entonces el interceptor de flujo de trabajo altera el flujo de trabajo de la solicitud. Inmediatamente, abortará el procesamiento de la solicitud y devolverá al usuario al formulario de entrada, donde se mostrarán los mensajes de error apropiados.

### 14. Implementación de interfaces de contexto

Las acciones de Struts 2 no tienen que implementar la interfaz acción. Cualquier objeto puede cumplir informalmente el contrato con el marco simplemente al implementar un método execute () que devuelve una cadena de control.  

Aunque el marco no impone demasiados requisitos formales a sus acciones, proporciona una interfaz opcional que se puede implementar, la cual cuesta poco e introduce algunos beneficios. La mayoría de los desarrolladores implementan la interfaz de Action cuando desarrollan sus acciones, incluso aunque no tengan por qué hacerlo.  

**Lo que ofrece**

Struts 2 ofrece a los desarrolladores una vía de desarrollo rápido basada en la inteligencia de valores predeterminados y un grado extremadamente alto de flexibilidad para resolver elegantemente la mayoría de los casos de uso. Al aprender el marco, es de ayuda enfocarse en las soluciones sencillas respaldadas por los valores predeterminados inteligentes.  

**Flexibilidad**

Una vez que estemos más cómodos con la forma normal de manejar las cosas, el marco da una flexibilidad que nos resultará muy natural y potente.  La mayoría de las acciones implementarán la interfaz com.opensymphony.xwork2.Action. Lo que define solo un método: 

`String execute throws Exception`

**Constantes**

Dado que el marco no establece ningún tipo de requisito, podemos simplemente poner el método en nuestra clase sin que la clase implemente esta interfaz. Esto está bien, pero la interfaz de Action también proporciona algunas constantes de cadena útiles que se pueden usar como valores de retorno para seleccionar el resultado apropiado. Las constantes definidas por la interfaz Action son: 

<img src="images/c3/3-codigo-12.png">

##### Bibliografía recomendada

Husted, T., Dumoulin, C., Franciscus, G., Winterfeldt, D. y McClanahan, C. (2002). Struts in Action: Building Web Applications with the Leading Java Framework. Manning Publications. 

<img src="images/c3/3-crusi-7.png">

<img src="images/c3/3-crusi-8.png">

### 15. Resultados de las acciones

Los resultados de las acciones de Struts 2 son cadenas de caracteres que tienen que ver con la ejecución de la acción. Podemos tomar el ejemplo de la acción del archivo struts.xml, cuyos resultados son input, error y success, estos resultados deben poseer las propiedades name.  La representación del resultado se da a través de la etiqueta `<result/>` y de las propiedades que ella posee. Estas son los atributos type y name.

**Propiedad 1**

La propiedad name da la posibilidad de asignar un nombre a la respuesta, que devuelva el valor de retorno return que envíe la acción.

**Propiedad 2**

Success es el valor de esta propiedad que se asigna por defecto. Sin embargo, la propiedad type da la posibilidad de especificar el tipo de respuesta de la acción. Dispatcher es el valor predeterminado del atributo type.

**Propiedad 3**

El tipo más empleado es el dispatcher, que pertenece a una redirección que apunta a una JSP, y esto se da en gran parte de los casos.

##### Enlace de interes

En este enlace podrás ver un ejemplo adaptado de lo que hemos visto previamente sobre la administración de los resultados. 

[Administración de los resultados](https://www.ediciones-eni.com/open/mediabook.aspx?idR=bdd3ad8a73ceee0ba794697c028da6c7)

### 16. Cambiar resultados de las acciones

El resultado de redirectAction hace lo mismo que el resultado de redirección simple. Esta versión del redireccionamiento puede entender la lógica de los nombres de las acciones de Struts 2, definidas en la arquitectura declarativa. Esto significa que no tenemos que incrustar URL reales en las declaraciones de resultados.   

En su lugar, podemos alimentar el redirectAction con los nombres y espacios de nombres de las acciones y declaraciones de paquetes. Esto hace que las declaraciones sean más robustas ante los cambios en los patrones de URL. 

**Cambio de Extensión**

Como ejemplo de dicho cambio de patrón de URL, supongamos que deseamos cambiar la extensión de la acción de .action a .go. Si hemos utilizado el resultado del redireccionamiento simple de forma generalizada para orientar las acciones de Struts 2, tendríamos que ajustar una gran cantidad de URLs.

**Asignación de acciones**

Hay que ver la asignación de acciones de inicio de sesión de una aplicación Struts 2. Este mapeo, como se ve en el siguiente fragmento, utiliza el resultado del redireccionamiento simple.

<img src="images/c3/3-codigo-13.png">

**RedirectAction**

Utilizando redirectAction quedaría el programa:

<img src="images/c3/3-codigo-14.png">

La diferencia es que el resultado de redirectAction resistiría a una variedad de cambios en el manejo del patrón de URL. 

### 17. Struts tags

Struts 2 viene con muchos tipos diferentes de etiquetas. Para entendernos mejor, se pueden dividir en cuatro categorías: etiquetas de datos, de control de flujo, de UI-interfaz de usuario y misceláneas.  

La librería de etiquetas de Struts 2 proporciona la funcionalidad para generar dinámicamente páginas web robustas, así como facilita la integración con los datos del modelo de dominio de nuestra aplicación que se encuentra en ValueStack. Primeramente, explicaremos tres categorías: 

**Categoría 1**

Las etiquetas de datos se centran en las formas de extraer datos de ValueStack y/o establecer valores en el ValueStack.

**Categoría 2**

Las etiquetas de control de flujo proporcionan las herramientas para alterar condicionalmente el flujo del proceso de renderizado a la hora de generar el resultado en la web.

**Categoría 3**

Las etiquetas misceláneas son un conjunto de etiquetas que no encajan en las otras categorías. Este conjunto de etiquetas incluye funcionalidades útiles como la gestión de la representación de la URL y la internacionalización.

#### 17.1 La sintaxis de las etiquetas Struts 2

Las etiquetas de Struts 2 se definen a un nivel más alto que cualquier otra capa de vista. Usar las etiquetas es tan simple como consultar la API. La librería de etiquetas especifica los atributos y parámetros expuestos por la etiqueta.  

Una vez que identificamos una etiqueta que deseamos usar, simplemente, elegimos la tecnología de visualización que quisiéramos: JSP, Velocity o FreeMarker, porque se han implementado interfaces con las tres tecnologías.  

#### 17.2 Sintaxis de JSP

Las versiones JSP de las etiquetas Struts 2 son como cualquier otra etiqueta JSP.  

**Ejemplo1**

La sintaxis de la etiqueta -por ejemplo- “property” es muy simple.

<img src="images/c3/3-codigo-15.png">

**Ejemplo2**

Otra cosa a tener en cuenta es que debemos tener la declaración de propiedad taglib en la parte superior de nuestra página antes de usar las etiquetas Struts 2. Esto es algo común en JSP. En la segunda línea, la directiva taglib, declara la biblioteca de etiquetas Struts 2 y asigna el prefijo "s" por el cual serán identificadas.

<img src="images/c3/3-codigo-16.png">

#### 17.3 Categorías de etiquetas

Las **etiquetas de datos** nos permiten obtener datos del ValueStack, o colocar variables y objetos en ValueStack. En esta sección, vamos a ver las diferentes etiquetas, las cuales, muchas de ellas tienen más funcionalidades para casos especiales. 

**Tag property**

La etiqueta de propiedad proporciona una forma rápida de escribir una propiedad en el renderizado HTML. Por lo general, estas propiedades estarán en ValueStack o en algún otro objeto en el ActionContext. Como estas propiedades pueden ser de cualquier tipo Java, deben ser convertidas a cadenas para renderizar la página de resultados. Esta conversión es manejada por el convertidor de tipos del framework. Si un tipo específico no tiene convertidor, normalmente se tratará como una cadena. En estos casos, un método toString () debe exponerse en la clase.

<img src="images/c3/3-tag-property.png">

**Tag set**

En el contexto de esta etiqueta, setting significa asignar una propiedad a otro nombre. Existen varias razones para hacerlo. Un caso de uso obvio sería tomar una propiedad que necesita una expresión OGNL profunda y complicada para hacer referencia a ella, y reasignarla, a un nombre de nivel superior para un acceso más fácil y rápido. Esto puede hacer que las JSP sean más rápidas y más fáciles de leer.

<img src="images/c3/3-tag-set.png">

**Tag push**

Mientras que la etiqueta set permite crear nuevas referencias a valores, la etiqueta push permite insertar propiedades en ValueStack. Esto es útil cuando queremos hacer mucho trabajo entorno a un solo objeto. Con el objeto en la parte superior de la ValueStack, sus propiedades se vuelven accesibles con expresiones OGNL (Object Graph Navigation Language) de primer nivel. Cuando accedemos a las propiedades de un objeto más de una o dos veces, probablemente ahorraremos mucho trabajo, si empujamos ese objeto a la pila.

<img src="images/c3/3-tag-push.png">

**Tag bean**

La etiqueta bean es como un híbrido de las etiquetas set y las etiquetas push. La principal diferencia es que no necesitamos trabajar con un objeto existente. Podemos crear una instancia de un objeto y empujarlo a ValueStack, o establecer una referencia de nivel superior a él en ActionContext. Por defecto, el objeto será empujado a ValueStack y permanecerá allí durante la duración de la etiqueta. En otras palabras, el bean estará en ValueStack durante la ejecución de todas las etiquetas entre las etiquetas de apertura y cierre de la etiqueta de bean. Si deseamos conservar el bean más tiempo que el cuerpo de la etiqueta, podemos especificar un nombre de referencia para el bean con el atributo var. Esta referencia existirá en el ActionContext como un parámetro con nombre accesible mediante el operador # durante la solicitud. Hay algunos requisitos sobre el objeto que se puede usar como un bean. Como es de esperar, el objeto en cuestión debe cumplir con los estándares de JavaBeans, de esta manera, tendrá un constructor que posea un argumento cero.

<img src="images/c3/3-tag-bean.png">

**Tag action**

Esta etiqueta nos permite invocar otra acción desde nuestra capa de vista. Los casos de uso para esto puede que no sean obvios al principio, pero es probable que deseemos invocar acciones secundarias del resultado en algún momento. Tales escenarios pueden variar, desde la integración de los componentes de acción, hasta refactorizar alguna lógica de la acción. La aplicación práctica de la etiqueta de acción es simple: especificar otra acción que debe ser invocada. Algunos de los atributos más importantes de esta etiqueta incluyen el atributo executeResult, que permite indicar si el resultado de la acción secundaria debe escribirse en la página de visualización actual, y los atributos nombre y espacio de nombres, mediante los cuales identificamos la acción secundaria que debe activarse. De forma predeterminada, se utiliza el espacio de nombres de la acción actual.

<img src="images/c3/3-tag-action.png">

##### Para saber más ...

En este enlace podrás leer más sobre las etiquetas de datos.

[Etiquetas de datos](https://www.javatutoriales.com/2013/11/struts-2-parte-7-tags.html#datos)

Las **etiquetas de control** nos permiten manipular los datos. Dado que la mayoría de las páginas web se crean sobre la marcha, será interesante aprender cómo manipular y mostrar sus datos. Struts 2 tiene un conjunto de etiquetas que hacen fácil controlar el flujo de la ejecución de la página. Usando la etiqueta iterator, para recorrer los datos, y las etiquetas if / else / elseif para tomar decisiones, puede aprovecharse la potencia del renderizado condicional de las páginas. 

**Tag iterator**

Además de la etiqueta de propiedad, la otra etiqueta más utilizada en Struts 2 es la etiqueta de iterador, que permite recorrer fácilmente colecciones de objetos. Está diseñada para saber cómo recorrer cualquier Colección, Mapa, Enumeración, Iterador o matriz. También proporciona la capacidad de definir una variable en el ActionContext, el estado iterador, que deja determinar cierta información básica sobre el estado actual del bucle como, por ejemplo, si estás recorriendo una fila impar o par.

<img src="images/c3/3-tag-iterator.png">

**Tags if y else**

Pocos lenguajes de programación no cuentan con la lógica de control if, then, else. Aquí también disponemos de las etiquetas if y else para llevarlos a cabo y desarrollarlos en Struts 2.

<img src="images/c3/3-tag-iterator-if.png">

##### Para saber más ...

En este enlace podrás leer más sobre las etiquetas de control.

[Etiquetas de control](https://www.javatutoriales.com/2013/11/struts-2-parte-7-tags.html#control) 

Las **etiquetas misceláneas** son otro tipo de etiquetas. Aunque son útiles, no se pueden clasificar fácilmente. Ahora veremos las siguientes etiquetas: 

**Tag include**

Mientras que JSP tiene su propia etiqueta de inclusión, , Struts 2 proporciona una versión que se integra mejor en el marco y proporciona funciones más avanzadas. En resumen, esta etiqueta permite ejecutar un “Servlet API-style include”. Esto significa que se puede incluir la salida de otro recurso web en la página de presentación actual. Una cosa buena, acerca de la etiqueta de inclusión de Struts 2, es que permite pasar los parámetros de solicitud al recurso incluido. Esto difiere de la etiqueta de acción, en que la etiqueta de inclusión puede hacer referencia a cualquier recurso del servlet, mientras que la etiqueta de acción puede incluir solo otra acción de Struts 2 dentro de la misma aplicación. La inclusión de una acción se mantiene completamente dentro de la arquitectura Struts 2. Sin embargo, la etiqueta de inclusión puede salir de la arquitectura para recuperar cualquier recurso disponible para la aplicación web. Esto generalmente significa tomar de otros servlets o JSP.

<img src="images/c3/3-tag-include.png">

**Tag URL**

Cuando creamos aplicaciones web, la administración de la URL es una tarea central. Struts 2 proporciona una etiqueta de URL para ayudarnos a hacer esto. La etiqueta admite todo lo que quieras hacer con una URL, desde controlar los parámetros, hasta sesiones que persisten automáticamente en la ausencia de cookies.

<img src="images/c3/3-tag-url.png">

**Tag i18n y text**

Muchas aplicaciones necesitan trabajar en varios idiomas. El proceso de hacer esto se llama internacionalización o i18n para abreviar (hay 18 letras entre I y N en la palabra internacionalización). La etiqueta de texto se usa para mostrar texto específico del idioma, como inglés o español, en base a un conjunto de textos disponibles. Esta etiqueta recupera un valor para cada mensaje desde los ResourceBundles expuestos a través de los propios mecanismos de internacionalización del marco. Toma un atributo nombre que especifica cómo recuperar el mensaje. La configuración regional predeterminada del marco determinará la configuración regional bajo la cual se resolverá.

<img src="images/c3/3-tag-i18n.png">

**Tag param**

La etiqueta param no hace nada por sí misma, pero al mismo tiempo, es una de las etiquetas más importantes. No solo cumple una función importante en el uso de muchas de las etiquetas vistas hasta ahora, sino que también desempeña un papel en muchas de las etiquetas de componentes de la interfaz de usuario.

<img src="images/c3/3-tag-param.png">

<img src="images/c3/3-arrastrarysoltar-3.png">

<img src="images/c3/3-arrastrarysoltar-4.png">

### 18. Object Graph Navigation Language (OGNL)

OGNL es actualmente el lenguaje de expresiones predeterminado, utilizado para hacer referencia a datos de las distintas regiones del marco de trabajo de una manera consistente.  

Este apartado se centrará en cómo OGNL se ajusta al framework Struts 2 y el papel que desempeña en cuanto a los datos que están presentes en las distintas partes del marco.  

#### OGNL

OGNL es una tecnología poderosa que se ha integrado en el marco de Struts 2 para ayudar con la transferencia de datos y la conversión de tipos. Se trata del enlace entre el marco entrada y la salida HTTP basada en cadenas y el procesamiento interno basado en Java. Puedes usar el framework de Struts 2 sin saber mucho sobre OGNL, ya que su integración transparente con el marco de trabajo permite que el desarrollador trabaje con él sin traumas, ni grandes esfuerzos de aprendizaje. 

Desde el punto de vista de un desarrollador que crea aplicaciones en el marco Struts 2, OGNL consta de dos planos que veremos a continuación. 

#### 18.1 Lenguaje de expresión

Hemos usado el lenguaje de expresión de OGNL en nuestro formulario, donde tenemos nombres de campos y etiquetas JSP. En ambos casos, hemos empleado expresiones OGNL para, de esta forma, vincular las propiedades de los datos del lado de Java a cadenas en las capas de vista. Normalmente, estas expresiones se encuentran en los atributos de nombre de los campos de entrada de formulario o en atributos de las etiquetas Struts 2. La simplicidad del lenguaje de expresión implica una curva de aprendizaje realmente baja.   

El siguiente fragmento de código del registro de nuestra aplicación Struts 2 muestra una etiqueta Struts 2 usando el lenguaje de expresión OGNL: 

<img src="images/c3/3-codigo-17.png">

El lenguaje de expresión OGNL es el valor dentro de las comillas dobles del atributo. Esta etiqueta de propiedad Struts 2 toma el valor de una propiedad en uno de nuestros objetos Java, y lo escribe en el HTML sustituyendo la etiqueta. Nos permite usar una sintaxis simplificada para hacer referencia a objetos que residen en el entorno Java. El lenguaje de expresiones OGNL puede ser mucho más complejo que esta expresión de elemento único pero, en general, el lenguaje siempre está orientado a simplificar el acceso a los datos. 

El papel de la expresión OGNL es proporcionar una sintaxis simple para vincular etiquetas Struts 2 a propiedades específicas del lado de Java, para mover datos, tanto dentro como fuera de marco de referencia. OGNL crea las vías para que los datos fluyan a través del marco. Eso ayuda a mover datos de los parámetros de solicitud a las propiedades JavaBeans de nuestra acción, además de a mover datos de esas propiedades a páginas HTML de presentación. Pero debemos investigar cómo se produce la conversión de tipos al mover datos entre los mundos basados en cadenas de HTML y los tipos nativos de Java del marco. 

#### 18.2 Convertidores de tipo

Además del lenguaje de expresión, también hemos estado usando convertidores de tipo OGNL. Incluso, en el caso sencillo que hemos visto de la etiqueta de propiedad Struts 2, se debe realizar una conversión del tipo de datos de Java que posee la propiedad a la que hace referencia el lenguaje de expresión OGNL a un formato de cadena para salida HTML.   

Por supuesto, en el caso de nombrePortafolio, el tipo Java también es una cadena. Pero esto solo significa que la conversión es fácil. Cada vez que los datos se mueven desde el entorno Java, debe producirse una conversión entre la versión cadena del HTML y el tipo de datos Java. Hasta ahora hemos estado utilizando tipos de datos simples para los cuales el marco Struts 2 proporciona una adecuada conversión de tipo OGNL. De hecho, el marco proporciona convertidores integrados para manejar gran parte de las conversiones.  

#### 18.3 Cómo engrana OGNL en el marco

Comprender el papel de OGNL en el marco, desde una perspectiva arquitectónica, hace que trabajar con él sea mucho más fácil.  Todo comienza con el formulario HTML en la página EntrarForm.html, desde el cual el usuario enviará una solicitud, y termina con la respuesta que vuelve al usuario, representada como ResPagina.html. 

<img src="images/c3/3-ognl-1.png">

*OGNL proporciona el mecanismo del marco para transferir y convertir datos*

##### Para saber más

En este enlace podrás leer información adicional sobre OGNL y lo importante que es dentro de las aplicaciones. 

[Struts 2 - Parte 2: OGNL](https://www.javatutoriales.com/2011/06/struts-2-parte-2-ognl.html)

<img src="images/c3/3-crusi-9.png">

<img src="images/c3/3-crusi-10.png">

### 19. Crear formulario con form tags

La lista de atributos comunes a todas las etiquetas de componentes de la interfaz de usuario de Struts 2 es grande. Esto es, principalmente, un reflejo de los numerosos atributos expuestos por los elementos HTML subyacentes.  

Además de estos atributos, los componentes también admiten atributos JavaScript del controlador de eventos, como onclick y onchange. Básicamente, los componentes admiten cualquier atributo HTML que se desee establecer. En el uso común de etiquetas, sólo usaremos algunos de estos atributos, como nombre, clave, etiqueta y valor. 

[Crear formulario con form tags](pdfs/19_Crear_formulario_con_form_tags_1.pdf)

En cuanto al componente formulario, este es probablemente el más importante de todos. Este componente crítico de la interfaz de usuario proporciona el punto de conexión central a la aplicación Struts 2, porque apunta a las acciones de Struts 2. Además de los atributos comunes definidos al comienzo de esta sección, el componente de formulario también utiliza una serie de atributos.  

Por lo que respecta a las etiquetas de componentes de la interfaz de usuario, estas generan marcas adicionales para manejar el diseño. Por defecto, los componentes se representan bajo el tema XHTML. Este tema genera una tabla HTML para formatear los elementos del formulario. 

<img src="images/c3/3-form-tags.png">

Ahora veremos cómo insertar elementos en el formulario con sus respectivas etiquetas y atributos.  

**Etiqueta textfield**

La etiqueta textfield es una etiqueta de uso común. Este componente genera el texto de campo de entrada. Y, como de costumbre, los aspectos más comunes son fáciles en Struts 2. La cuestión básica en la etiqueta de campo de texto es cómo el atributo de name y el de value, que están vinculados al marco. Además de los atributos comunes del componente UI resumidos anteriormente, textfield hace uso frecuente de otros atributos propios.

<img src="images/c3/3-form-tags-1.png">

El siguiente fragmento muestra el formulario de un inicio de sesión, Login.jsp:

<img src="images/c3/3-form-tags-2.png">

**Etiqueta de contraseña**

La etiqueta de contraseña es esencialmente como la etiqueta de campo de texto pero, en este caso, el valor de entrada está enmascarado. Como con todos los campos de entrada, el nombre, el valor y los atributos clave son los más importantes.

<img src="images/c3/3-form-tags-3.png">

El fragmento de esta página Login.jsp, define un campo de contraseña:

<img src="images/c3/3-form-tags-4.png">

**Etiqueta textarea**

La etiqueta textarea genera un componente construido sobre el elemento HTML textarea. Como con todos los campos de formulario, el nombre, el valor y los atributos clave, insistimos, son los más importantes.

<img src="images/c3/3-form-tags-5.png">

**Componente de casilla de verificación**

El componente de casilla de verificación se utiliza en una única casilla de verificación HTML para crear un componente booleano. Hay que tener en cuenta que este componente no es equivalente a una casilla de verificación HTML, porque es solo para valores booleanos. Por tanto, la propiedad a la que lo vincula, en el lado de Java, debería ser una propiedad booleana. Hay otro componente, la lista de casillas de verificación, que permiten al usuario enviar múltiples valores con ese nombre único. El componente de casilla de verificación se centra en una elección verdadera o falsa.

<img src="images/c3/3-form-tags-6.png">

Veamos un ejemplo:

<img src="images/c3/3-form-tags-7.png">

**Componente de selección**

El componente de selección es quizás el componente de la interfaz de usuario basado en colecciones más común, como el cuadro de selección HTML, que permite al usuario seleccionar un valor de una lista de opciones. En una aplicación web Java, es común construir estas listas de opciones de colecciones, mapas o matrices de datos. El componente seleccionado ofrece una interfaz rica y flexible para generar cuadros seleccionables a partir de una amplia variedad de conjuntos de datos del back end.

El atributo de lista apunta al conjunto de datos que respaldan al componente. Hemos proporcionado una lista literal OGNL para este valor. Normalmente, usaremos una expresión OGNL para apuntar a una lista de datos en ValueStack, en lugar de generar una lista de literales. Generalmente, el atributo de nombre es una expresión OGNL, que se dirigirá a una propiedad de destino en el ValueStack.

Ahora veremos cómo el componente de selección admite el uso de una amplia gama de conjuntos de datos y ofrece un control flexible sobre los diversos atributos.

<img src="images/c3/3-form-tags-8.png">

**Componente de radio**

El componente de radio ofrece la misma funcionalidad que el componente select, pero presentado de una manera diferente. El uso del componente de radio es similar al componente select, excepto que tiene menos atributos. Por ejemplo, el componente de radio no permite múltiples selecciones. También puede usar colecciones, mapas, matrices e iteradores. Como de costumbre, la etiqueta del componente de radio utiliza los atributos comunes del componente de la interfaz de usuario.

<img src="images/c3/3-form-tags-9.png">

**Componente checkboxlist**

El componente checkboxlist también es similar al componente select. Presenta las mismas opciones de select, pero usando casillas de verificación, por lo que permite múltiples selecciones. Usar la lista de verificación es como utilizar el componente select con la opción de selección múltiple.

<img src="images/c3/3-form-tags-10.png">

**Componente de etiqueta**

El componente de etiqueta es muy simple. Básicamente, es como un campo de texto, pero de solo lectura.

<img src="images/c3/3-form-tags-11.png">

**Componente oculto**

El componente oculto tiene un caso de uso muy específico. Con frecuencia, necesitamos incrustar parámetros ocultos en un formulario sin mostrarlos al usuario. A veces, los valores de estos campos ocultos se establecen con valores del servidor.

<img src="images/c3/3-form-tags-12.png">

Y aquí está el campo de entrada oculto, como aparece escrito en el HTML:

<img src="images/c3/3-form-tags-13.png">

### 20. Crear acciones

El siguiente fragmento muestra el formulario de inicio de sesión, que llamaremos Login.jsp: 

<img src="images/c3/3-codigo-18.png">

**Atributo de acción**

El atributo de acción es el más importante. Simplemente especificamos el nombre de la acción, sin extensión .action, a la que queremos enviar el formulario. El nombre es el nombre lógico dado a la acción en la arquitectura declarativa (en un archivo ejemplo.xml en este caso). Hay que tener en cuenta que si especificamos el atributo de acción sin especificar el atributo del espacio de nombres, estamos asumiendo el espacio de nombres actual.

<img src="images/c3/3-codigo-19.png">

**Componente de la interfaz**

Los componentes de la interfaz de usuario generan marcas relacionadas con el diseño. Esto lo hemos suprimido en este código para no confundir aspectos mientras estamos tratando de entender las partes funcionales de las etiquetas. Y recordamos que, funcionalmente hablando, lo más importante es el atributo action.

**Etiqueta de formulario**

La etiqueta de formulario también crea valores para otros atributos, en particular, los atributos de id y método. La ID generada es única y se basa en el nombre de la acción.

### 21. Acceder a la pila de valores

Sabemos que el marco de trabajo de Struts 2 va a manejar la transferencia y la conversión de tipos de datos de los parámetros de solicitud. La primera pregunta es: ¿a dónde deben ir los datos? La respuesta es que OGNL señalará el camino. Pero, primero, OGNL necesita un contexto, en el cual, buscar sus objetivos. La acción se encuentra en ValueStack (Pila de Valores).  

Estamos exponiendo nuestro objeto Usuario como una propiedad JavaBeans en nuestro objeto de acción. Con nuestro objeto de acción en la pila de valores, estamos listos para que OGNL haga su trabajo de navegación. El interceptor de parámetros moverá los datos del objeto de solicitud a la pila de valores.  

La parte difícil del trabajo es el mapeo del nombre del parámetro a una propiedad real en ValueStack. Aquí es donde OGNL entra en juego. El interceptor de parámetros interpreta el nombre del parámetro de solicitud como una expresión OGNL para localizar la propiedad de destino correcta en ValueStack.   

Si esto lo visualizamos, podemos esperar que la expresión deba ser algo como miAccion.usuario.nombreUsuario. Por lo contrario, solo el usuario.nombreUsuario será necesario. Esto se debe a que la pila de valores es una especie de objeto virtual que expone las propiedades de sus objetos contenidos como propios. 

Respecto a la pila de valores, es importante conocer su definición, la cual, se trata de una construcción de Struts 2 que presenta una agregación de las propiedades de una pila de objetos como propiedades de un único objeto virtual. Si existen propiedades duplicadas, dos objetos en la pila tienen un mismo nombre de propiedad: entonces la propiedad del objeto más alto en la pila será el que sea expuesto en el objeto virtual representado por ValueStack. Los ValueStack representan el modelo de datos expuesto a la solicitud actual, y es el objeto predeterminado contra el que se resuelven todas las expresiones OGNL. 

**¿Es ValueStack un objeto virtual?**

Suena complicado, pero no lo es. La pila de valores contiene una pila de objetos. Todos estos objetos tienen propiedades. La magia de la ValueStack es que todas las propiedades de estos objetos aparecen como propiedades en sí misma. En nuestro caso, dado que el objeto de acción está en ValueStack, todas sus propiedades pertenecen a esta.

**¿Cómo resolvemos las propiedades de dos objetos en ValueStack?**

La parte difícil viene cuando más de un objeto se coloca en ValueStack. Cuando esto sucede, podemos tener una confusión de tipo entre las propiedades de esos dos objetos. Digamos que dos objetos en la pila tienen una propiedad de nombre de usuario. Simplemente: el nombre de usuario expuesto por ValueStack siempre será el del objeto más alto en la pila. Las propiedades de los objetos superiores en la pila cubren propiedades con nombres similares de objetos más abajo en la pila.

### 22. Creación de acciones para form tags

Para empezar, explicaremos un poco el proceso que llamaremos preselección, tomando un ejemplo de la etiqueta select de los form tags, ya que esto describe con mayor precisión lo que queremos ver.   

Funciona similar a la preselección de las etiquetas de componentes simples; el atributo de valor apunta a una propiedad en ValueStack, que se usará como el valor actual al preseleccionar una de las opciones. Recuerda que con frecuencia el atributo de valor no estará definido, permitiendo que el marco lo infiera del atributo de nombre.   

Con componentes más simples, como el campo de texto, el valor llenará directamente el campo de entrada. Con los componentes select, no tenemos un campo de entrada simple, sino que tenemos una selección de opciones. Cada una de estas opciones HTML tiene un atributo de valor, que representa el valor del componente, si esa opción es seleccionada. El truco es usar el atributo de valor de la etiqueta Struts 2 para que coincida con uno de esos valores de opción.  

**Ejemplo parte 1**

Para hacerlo, veremos un ejemplo donde seleccionaremos automáticamente un artista como opción por defecto. Imaginemos que, cada semana, se presenta el trabajo de un artista, haciendo que ese artista sea la opción predeterminada. Para tener una de las opciones preseleccionadas, debemos proporcionar una propiedad en ValueStack que contiene el nombre de usuario (nuestra clave) del artista predeterminado.

**Ejemplo parte 2**

Hemos implementado un método en nuestro ejemplo que devuelve el nombre de usuario del artista destacado de la semana. Lo recuperaremos y lo configuraremos en una propiedad de nombre usuario predeterminado en la acción. Para hacer todo más claro, especificaremos el atributo de valor del componente por separado del atributo nombre, en lugar de dejar que el marco lo infiera. El siguiente fragmento muestra el código del método execute () de la acción del ejemplo:

<img src="images/c3/3-codigo-20.png">


<img src="images/c3/3-crusi-11.png">

<img src="images/c3/3-crusi-12.png">

### 23. Atributos list, listKey y listValue

Para entender estos elementos list, listKey y listValue, completaremos el ejemplo del apartado anterior para explicarlo de una manera más clara y precisa.   Aplicaremos el ejemplo al funcionamiento de un componente de radio. 

<img src="images/c3/3-codigo-21.png">

**listKey y listValue**

Utilizamos listKey y listValue y se generará lo siguiente:

<img src="images/c3/3-codigo-22.png">

### 24. Generic tags

Las etiquetas genéricas se utilizan para controlar la ejecución cuando se está renderizando una página. Encontraremos dos tipos de etiquetas, las de control, que se utilizan para controlar los flujos, como hemos visto anteriormente, y las de manipulación de datos.   De entre las etiquetas genéricas, podemos encontrar las siguientes: 

**Tag append**

La etiqueta append se utiliza para generar un iterador por medio de múltiples iteradores. De esta manera, permitirá unir listas o colecciones de éstas en una sola lista o en una colección.

[Ejemplo Tag append](pdfs/24_tag_append.pdf)

**Tag generator**

Se utiliza para crear iteradores a partir de distintos atributos que son pasados como argumentos. El ejemplo que vamos a presentar solo será con la página jsp, empleando la etiqueta generator. Vemos cómo se presentaría el resultado si estuviéramos haciendo la correspondiente llamada.

[Ejemplo Tag generator](pdfs/24_tag_generator.pdf)

**Tag merge**

Se utiliza para unir iteradores. La manera correcta de hacer esta unión es ir fusionando, de manera continua, cada elemento de las listas. Entonces, en la llamada número uno se recupera el elemento número uno de la lista número uno, la llamada dos sería el número uno de la segunda, y así, sucesivamente. En el siguiente ejemplo fusionaremos dos listas: la número uno, posee cinco entradas, y la número dos también. Lo primero será mostrar el action que especifica ambas listas.

[Ejemplo Tag merge](pdfs/24_tag_merge.pdf)

**Tag subset**

Esta etiqueta toma como argumento un iterador y crea un subconjunto de éste empleando la clase org.apache.struts2.util.SubsetIteratorFilter.

[Ejemplo Tag subset](pdfs/24_tag_subset.pdf)

### 25. Crear acción para listado

Se puede emplear el tag action, el cual da la posibilidad de ejecutar una acción a partir de una vista, señalando el nombre de la acción y, como opción, el espacio de nombres. Es posible pasar argumentos empleando el tag param.  

##### Ejemplo práctico

A continuación podrás ver un ejemplo de cómo crear una acción para listado.

[Ejemplo práctico](pdfs/25_Ejemplo_practico.pdf)

### 26. Utilizar generic tags

Las etiquetas genéricas se pueden utilizar en gran parte de los elementos de Struts 2.   A continuación veremos varios ejemplos de cómo utilizar este tipo de etiquetas: 

**Ejemplo 1**

El action es la clase Java que sigue:

<img src="images/c3/3-codigo-23.png">

Observemos que hemos definido una clase que posee una lista de frutas. Esta lista la recuperaremos en una página jsp, ya que se ha especificado un método getMiLista. La página jsp que sigue, hace uso de este action.

<img src="images/c3/3-codigo-24.png">

**Ejemplo 2**

También podremos hacer otro ejemplo, utilizando los tags bean, que a continuación presentamos:

<img src="images/c3/3-codigo-25.png">

La vista es la siguiente página jsp:

<img src="images/c3/3-codigo-26.png">

**Ejemplo 3**

A continuación, mostraremos el uso de los tags genéricos utilizando la etiqueta Date. Definimos la clase dateTag.java que presentamos a continuación:

<img src="images/c3/3-codigo-27.png">

Como observamos, este action especifica un atributo de tipo date, fechaActual. Esto se visualizará en la página jsp fecha.jsp:

[Ejemplo 3](pdfs/26_Ejemplo_3.pdf)

### 27. Programar ordenación

El elemento *inputtransferselect* genera un componente que consiste en un select múltiple, además de un campo de texto y varios botones, que dan la posibilidad de insertar, ordenar valores y eliminarlos.  

Este elemento se incluye en la librería de Struts2 org.apache.struts2.views.jsp.ui.InputTransferSelectTag. A continuación, mostramos sus elementos:  

**AllowRemoveAll**

Establece si se podrá visualizar el botón que eliminará los valores.

**AllowUpDown**

Establece si se podrán visualizar los botones de subir y bajar los valores en la lista.

**DownLabel**

Es la etiqueta del botón que hace que los valores bajen.

**List(requerido)**

Esta es la lista con los valores que posee el select al iniciar.

**RemoveAllLabel**

Se trata de la etiqueta del botón que hace que se eliminen los valores.

**RemoveLabel**

Esta es la etiqueta del botón que elimina un valor.

**UpLabel**

Es la etiqueta del botón que sube los valores.

##### Enlace de interés

En este enlace podrás ver un ejemplo adaptado sobre como programar la ordenación. 

[Etiquetas Struts 2](http://www.marcosf.es/docs/despliegue/etiquetasStruts2.pdf)


<img src="images/c3/3-arrastrarysoltar-5.png">

<img src="images/c3/3-arrastrarysoltar-6.png">

### 28. Validación de entrada

Struts 2 tiene la opción de validar los datos de usuario de forma declarativa.  Dicho de otra forma, el framework posee una serie de validadores predefinidos que dan la posibilidad de ejecutar esta actividad sin que el desarrollador teclee ni una línea.  

El marco de trabajo Struts 2 se encuentra inmersos en el fichero xwork-2.0.4.jar (los números que se muestran en el nombre del fichero serán diferentes dependiendo del número de versión).  

Para que un desarrollo tenga la posibilidad de utilizar estos validadores, es requerido que sean declarados en un documento XML (que se llamará validation.xml), donde su ubicación esté accesible desde el classpath del desarrollo. 

[Código](pdfs/28_Validacion_de_entrada_0.pdf)

##### Enlace de interés

En el siguiente enlace podrás aprender más sobre los errores de validación.

[Errores de validación](https://danielme.com/tip-struts-2-16-errores-de-validacion/)

El fichero xwork-2.0.4.jar incluye también el documento XML que se muestra, que no será necesario generarlo de forma manual. Por otra parte, al estar inserto en la carpeta WEB-INFlib del desarrollo, no hay que realizar ningún tipo de operación extra en la variable de entorno classpath.   

Adicionalmente a la declaración de los validadores, es necesario activar el interceptor Struts, que se encarga de poner en marcha el proceso de validación automática.   

Este código es una operación que tampoco tenemos que hacerla explícitamente en el archivo struts.xml, porque el documento de configuración predeterminado ya tiene incluido el registro del validador, así como también la opción de añadirlo al stack de validadores predeterminados. 

<img src="images/c3/3-codigo-28.png">

### 29. Crear el formulario

Si deseamos que la validación la ejecute el cliente, únicamente será necesario añadir la propiedad validate con el valor true (verdadero) al elemento `<s:form>`, en el que se incluirán los elementos gráficos para la captura de los datos.  

Al incluir esta propiedad en el formulario, se generará todo el JavaScript requerido para efectuar la comprobación de los datos en el cliente, añadiendo los cuadros de diálogo que se visualizarán por el usuario con los mensajes que indican error en el momento que la respuesta de la validación no sea positiva.

<img src="images/c3/3-codigo-29.png">

### 30. Crear primeras validaciones

El empleo de los validadores, en un desarrollo Struts, es una actividad bastante fácil: solo crearemos un fichero XML en el que se tendrán que unir las normas de validación con los atributos del objeto Action a los archivos que las quisiéramos aplicar.  

El fichero XML en cuestión deberá nombrarse siguiendo el formato que sigue:  

**Claseaccion-validation.xml**

Aquí la claseaccion se asociará con el nombre de la clase que posee el objeto Action, cuyos atributos se desean validar.  

**Ejemplo práctico**

Ejemplo práctico sobre claseaccion-validation.xml

[Ejemplo práctico](pdfs/30_Ejemplo_practico.pdf)


<img src="images/c3/3-crusi-13.png">

<img src="images/c3/3-crusi-14.png">

### 31. Tipos de validación

Existen otros tipos de validadores que permiten la especificación en field-validator, aparte de requiredstring. Estos son:  

**Email**

Verifica que el valor añadido en el campo pertenezca a una dirección válida de correo. 

**Int**

Corrobora que el valor añadido en el campo sea un número entero incluido entre dos valores dados. Estos valores deberán ser proporcionados como argumentos de field-validator por medio del elemento param. Por ejemplo, para verificar que el valor de un atributo denominado “número” está incluido entre el número 25 y el número 50, especificaríamos el siguiente validador en el atributo:  

<img src="images/c3/3-codigo-30.png">

### 32. Etiquetas set y push

En este punto de la unidad hablaremos concretamente de las siguientes etiquetas: 

**Set**

Como hemos visto previamente, esta etiqueta fija un valor a una variable y, de manera opcional, indica el ámbito de la variable. Este valor se podrá utilizar con la propiedad value, o limitando el valor en la propia etiqueta. La manera de identificar el nombre de la variable, a la cual se enlaza, es empleando el argumento name.

Tras establecer la variable, esta queda alojada en el stack de objetos. En el ejemplo siguiente se fija una cadena tipo String a una variable y posteriormente presenta su valor. Nótese cómo el valor de la variable está inserto dentro de una sentencia:

<img src="images/c3/3-codigo-31.png">

**Push**

Esta etiqueta agrega un objeto determinado al stack. Por medio de su propiedad value, se señala el objeto a incluir.

En el ejemplo siguiente observamos el valor de la propiedad “origen” del objeto “pais” en la página:

<img src="images/c3/3-codigo-32.png">

### 33. Validación personalizada

Una excelente novedad que fue incluida en Struts 2 es que se pueden emplear anotaciones para reducir las tareas de configuración en un desarrollo, eliminando el requerimiento de emplear archivos de configuración XML para ejecutar esas funciones.   

Podemos considerar un ejemplo donde los desarrollos que utilizan validadores, que son los ficheros de configuración de tipo ClaseAccion-validation.xml, podrán ser reemplazados por anotaciones que se podrán incluir en la propia clase de acción.   

En este caso específico, de desarrollos basados en validadores, el empleo de anotaciones necesita de la ejecución de dos instrucciones previas mientras se desarrolla la implementación de la clase Action:  

* La clase heredará de ActionSupport. 
* Que se importe el paquete `com.opensymphony.xwork2.validator.annotations`. Proporciona las anotaciones conectadas a cada uno de los validadores, por defecto, de Struts 2.  

Ya ejecutadas las acciones mencionadas, será necesario añadir la anotación @Validation previamente a la declaración de la clase, y así Struts 2 se dé cuenta de las anotaciones que añadiremos para la validación de los datos:  

<img src="images/c3/3-codigo-33.png">

A continuación, para ejecutar una validación de un campo específico, bastará con señalar la anotación conectada al validador de modo previo al método getXxx, que retornará el dato a validar señalando, entre paréntesis, el mensaje de error que se desea mostrar al usuario una vez que falle la validación del dato.  

##### Ejemplo práctico

Ejemplo práctico mostrando el validador RequiredStringValidator.

[Ejemplo práctico](pdfs/33_Ejemplo_practico.pdf)

### BIBLIOGRAFÍA

* Brown, D., Michael Davis, C. y Stanlick, S. (2008). Struts 2 in action. Manning Publications.

* Deitel, H. M. y Deitel, P. J. (2004). Cómo Programar en C/C++ y Java. (4a edición). Ed. Pearson Educación.

* Deitel, H. M. y Deitel, P. J. (2004). Cómo programar en Java (5a edición). Pearson Prentice-Hall.

* Eckel. B. (2002). Piensa en Java (2a edición). Prentice Hall.

* Egido García, R. y Martín Sierra, A. (2017). Curso avanzado de programación en Java EE: Struts, JSF, Ajax, EJB. Syncron.

* Arquitectura java. Recuperado de: https://www.arquitecturajava.com

* Desarrollo web. Recuperado de: https://desarrolloweb.com/directorio/ programacion/java/

* La Web del programador: Comunidad de Programadores. Recuperado de: https://www.lawebdelprogramador.com/

* PROGRAMACIÓN ORIENTADA A OBJETOS (POO). Recuperado de: https://compu2poo.wordpress.com/

