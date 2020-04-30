# 1. Introducción 40:13

* Instalación de las Herramientas de Desarollo 06:45
* Creación del primer Servlet 13:12
* Añadiendo contenido dinámico con JSP 07:47
* Diferencia en la ejecución de una página HTML y una JSP 04:37
* El Modelo 1 VS el Modelo Vista Controlador (MVC) 07:52

## Instalación de las Herramientas de Desarollo 06:45

En este curso vamos a desarrollar una aplicación web dinámica basada en *JSP* y *Servlets* implementando una arquitectura conocida como MVC Modelo Vista Controlador.

Al final de este curso vamos a desplegar nuestra aplicación en un servidor web gratuito para que conozcas cómo se configura y cómo desplegarlo con una URL real.

![1-herramientas](images/1-herramientas.png)

Vamos a instalar nuestras herramientas de desarrollo para nuestra aplicación web las cuales van a ser:

* [Eclipse](http://www.eclipse.org) 
* [MySQL](https://dev.mysql.com/downloads/mysql/)
* [Workbench](https://dev.mysql.com/downloads/workbench/)
* [Apache Tomcat](http://tomcat.apache.org/)

**NOTA**: El el video origina se instala todo en un Mac y *se ven todos los detallos para cada herramienta*.

## Creación del primer Servlet 13:12

Vamos a crear nuestro primer Servlet.

![1-new](images/1-new.png)

![1-dynamic](images/1-dynamic.png)

![1-dynamic-2](images/1-dynamic-2.png)

 Asegúrate de tener seleccionada la versión 2.5. Si no seleccionas la versión 2.5 no nos va a generar el archivo descriptor **web.xml** y va a usar anotaciones, para efectos de este curso usaremos el archivo **web.xml** así que vamos a usar la versión 2.5 en nombre del proyecto.

![1-dynamic-3](images/1-dynamic-3.png)

![1-estructura](images/1-estructura.png)

*Estructura del proyecto 01-JSPServlets*

En la carpeta **Java Resources** se almacenan todos los *Servlets* que almacenan la lógica o reglas de negocios de nuestra aplicación. 

En la carpeta **WebContent** se almacena toda la parte web es decir *JSPs*, *css*, *javascript*, etc. 

Vamos a crear un nuevo Servlet:

![1-new-servlet](images/1-new-servlet.png)


servlets y demás lógica horrela de negocios en nuestra aplicación web en web content.

Toda la parte web que vendría siendo JSP es CSS es archivos JavaScript etc..

Aquí en la carpeta Source voy a darle click derecho Eneo y servlet.

El paquete por va a poner como com nobeles y en servlets para llamar servlet lo va a definir.

Ahora tal vez muchos me preguntan bueno y qué es un servlet.

Vamos a ver un Servlet es un objeto IAVA.

Por supuesto que reside en un servidor web.

Si tú estás trabajando o has trabajado con PHP o tecnologías Microsoft para el desarrollo web entiendes

perfectamente lo que está hablando con un objeto que reside en un servidor web.

En este caso el servlet no sirve para atender procesar y preparar una respuesta para un cliente en primer

lugar tenemos que sus funciones primarias son recibir peticiones de Internet y a qué se refiere esto

de recibir peticiones etc..

Por ejemplo si yo entro en Google Google y hallo simple hecho de teclear www.youtube.com y darle enter

estoy enviando una petición a un servidor web el cual como respuesta me genera esta interfaz de Google

para iniciar búsquedas etc. Esa petición la va a tener el servlet va a procesar la petición que es la

página por defecto o Index y me la retornã esa es la respuesta que me genera.

Prepara la lógica para responder a dichas peticiones.

Por ejemplo si yo aquí en la misma página de Google me voy al apartado de Gmail y elijo mi cuenta de

Gmail y aquí pongo una contraseña que no es correcta ayudar a iniciar sesión una petición fue enviada

a por ejemplo un Servlet que no necesariamente debe ser un Servlet y ese servlet lo que hizo fue preparar

el mensaje de error a dicha petición cuando yo creé una contraseña que no era correcta.

El servlet debe conocer la contraseña correcta y debe comparar esta contraseña de este formulario con

la que tiene en su base de datos cuando detecta que no es correcta.

Debe preparar esta respuesta que por ahí estuvo mal y que la contraseña es incorrecta.

Por supuesto también puede accesar a recursos como bases de datos en el mismo ejemplo si la contraseña

fuera correcta y el servlet debe tener alguna forma de conocer esa contraseña que está almacenada en

la base de datos.

Conocer que es correcta y darle acceso a mi cuenta de Gmail

es básicamente lo que hace servlet.

Ahora vamos a programar uno muy sencillo que está aquí en cogno bellos y que se llama serme.

Cómo ves.

Eclipse me genera todo este código por defecto si no tienes ni idea de qué significa este código te

recomiendo que busques en Google

servlet Life Saiko y por aquí en la documentación oficial de Oracle puedes buscar los métodos que genera

y cuál es su ciclo de vida y etcétera etc..

Si ya tienes conocimiento de los métodos Get post y demás puedes seguir este sin problema ejecutoriada

zerbait.

Por supuesto como toda clase Java tiene un constructor y cómo ves hereda algunos métodos de HTTP servlet

que por defecto haya importado bocarriba.

Si tú eres desarrollador web de otras tecnologías como PHP o S-Pen perfectamente conoces que es un método

y un método post si no no te preocupes más adelante vamos a detallarlo en una aplicación.

Ahora en el servlet vamos a tener alguna petición y generar como respuesta código HTML que va a ser

desplegado en nuestro navegador web.

Por lo tanto en el método Duguech que atiende peticiones que vemos que tiene dos objetos un recuestan

que significa petición y un responsable de respuestas de tipo HTTPS retro y cuestiones Ponts respectivamente.

Estos dos sirven para o tienen más bien métodos para atender peticiones y hacer ciertas operaciones

y todos los que vemos que son servlet y preparar nuestras respuestas entonces voy a eliminar esto que

está aquí y voy a escribir mi objeto respondés y veo que tienen un método Brighter que me genera o más

bien me devuelve un objeto de tipo print right entonces voy a crear un objeto

Reiter Ritter puedes completar en Eclipse con cuanto la barra espaciadora y que se llame Alt y a través

de este objeto yo puedo escribir código HTML por ejemplo al punto Frontline

y aquí voy a escribir etiquetas HTML.

Si no tienes conocimiento de las etiquetas HTML te recomiendo que visites

Google y escribas Downing Street Skulls HTML y puedes ver sin costo alguno el curso que está aquí para

conocer todas las etiquetas de HTML

ok cómo abriste etiquetas HTML la tengo que cerrar aquí abajo y aquí puedo escribir

otras etiquetas que pueden ser Jaider o no y escribir mensaje desde mi primer servlet

foma y puedo ejecutar directamente yo este servlet desde mi servidor web para ver los resultados.

Voy a revisar el servlet y dar clic derecho y ejecutar cómo ejecutar un servidor lo ejecuta en el servidor

Tomcat 6.0 que acabamos de crear y lo voy a decir que siempre lo ejecuta el siguiente.

Esto si está bien y Finnish

ok cómo vemos ya se ejecutó el servlet y como respuesta a la petición me imprimió el mensaje mensaje

desde mi primer servlet en el siguiente tutorial vamos a ver JSP y posteriormente cómo integrar TCP

## Añadiendo contenido dinámico con JSP 07:47
## Diferencia en la ejecución de una página HTML y una JSP 04:37
## El Modelo 1 VS el Modelo Vista Controlador (MVC) 07:52
