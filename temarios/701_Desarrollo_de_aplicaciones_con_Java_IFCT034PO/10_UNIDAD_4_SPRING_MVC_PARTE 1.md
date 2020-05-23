# UNIDAD 4: SPRING MVC [PARTE 1]

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

1. ntroducción a Spring
   * 1.1 Historia de Spring Framework
   * 1.2 Spring MVC
   * 1.3 Estructura de Spring Web MVC
   * 1.4 Estructura de Spring Web MVC
      * 1.4.1 Preparación del entorno
      * 1.4.2 Lo primero sería Instalar JAVA
      * 1.4.3 Instalando el JDK
      * 1.4.4 Instalando Maven
      * 1.4.5 Instalando un Servidor Web
      * 1.4.6 Instalando el Spring Tool Suite (STS)

2. Spring MVC

3. Acceso a datos
   * 3.1 Spring MVC más a fondo
      * 3.1.1 El contexto de una aplicación web
   * 3.2 Acceso a los Datos

4. Programación orientada a aspectos
   * 4.1 Programación Orientada a Aspectos (POA)
      * 4.1.1 Llamada a método en servicio
      
## Introducción

Al igual que ocurre con otros frameworks de los que ya hemos hablado a lo largo de este curso, Spring también busca dar una respuesta a la complejidad creciente del desarrollo de aplicaciones web.

En este caso, los retos que Spring busca resolver son aquellos que tienen que ver con las cuestiones de seguridad del software, la funcionalidad del mismo y, también, aspectos relativos a la visualización e interfaz.

El modo en cómo Spring responde a esto también es análogo a cómo lo hacen otros marcos de trabajo: empaquetando determinado código y definiendo buenas prácticas y experiencias previas a modo de patrones de diseño.

El beneficio obtenido por los programadores igualmente es coherente con el aportado por otros frameworks: menor repetición de código, reducción de los tiempos y costes de la programación del software, mitigación de errores, alto rendimiento, código ligero, más fácil portabilidad y reusabilidad, etc.

Aunque los datos son cambiantes a medida que se alteran las condiciones del mercado, la realidad es que Spring está en la cumbre de frameworks para Java. Incluso, en el momento actual, se puede decir que es el número uno del mercado, por delante de Java Server Faces, de Hibernate, de Google Web Toolkit, de Grails y de Struts.

Por este motivo es recomendable tener unos buenos conocimientos de Spring, puesto que es muy probable que en nuestro día a día como ingenieros de software o desarrolladores nos encontremos dentro de nuestro entorno profesional a mucha gente trabajando con Spring.

Spring empezó a crearse y ganarse su prestigio hace más de quince años, por lo que muchos expertos en ingeniería del software lo consideran el alma mater de otros marcos de trabajo, como el propio Hibernate o Struts que comparten espacio dentro de este mismo curso.

Cada informático encontrará en Spring unos u otros beneficios, pero, probablemente, aquel en el que más coinciden los expertos es en que ofrece el soporte de la infraestructura necesaria a nivel de aplicación. De este modo, se simplifican con Spring tanto los aspectos de configuración como de programación, con independencia de cuál sea la plataforma tecnológica sobre la cual se va a realizar el despliegue del sistema de información construido.

Decimos que este beneficio es probablemente el más importante de Spring porque de él derivan otros muchos que, en general, redundan en que el equipo de programación que utiliza Spring tiene más fácil el centrarse en el desarrollo de la lógica empresarial del software abstrayéndose de cuestiones de más bajo nivel técnico.

## Mapa Conceptual

<img src="images/c4/4-1-mapa-1.png">

## 1. Introducción a Spring

Durante muchos años se ha buscado la forma de hacer herramientas más productivas para los desarrolladores y programadores del mundo para, de ese modo, hacer código de fácil mantenimiento y con bastante escalabilidad, además de acortar los tiempos de desarrollo.   

Por estas necesidades nacen los frameworks, ya que un framework no es más que un conjunto de herramientas y metodologías ya probadas como mejores prácticas por un grupo de programadores o una organización, diseñados con el propósito de mejorar la calidad del código, los tiempos de desarrollo y facilitar el trabajo de los ingenieros de software.

<img src="images/c4/4-1-video-1.png">

[Video](https://www.youtube.com/watch?v=75PyjEfX3ws&feature=emb_logo)

### 1.1 Historia de Spring Framework

En el año 2002 Rod Johnson lanzó la primera versión de Spring, junto con la publicación de su libro Expert One-on-One J2EE Design and Development (Wrox Press, octubre 2002). Fue lanzado bajo la licencia Apache 2.0.   

Ahora nos podemos preguntar ¿Spring?, pero ¿cuándo nace Spring MVC? Dado que en la época estaban muy en auge los Frameworks MVC (Modelo Vista Controlador), parece lógico el surgimiento de Spring MVC.   

El patrón MVC nace en los años 80 y lo que busca es organizar el código mediante tres capas básicas: modelo, vista y controlador (ver botones).  

En esa época Spring -entre sus características- contaba con un Framework MVC, que estaba basado en peticiones HTTP y Servlets. 

**Modelo**

Modelo  Se encargaría del acceso a los datos y de cómo se representan estos.

**Vista**

Vista  Viene a encargarse de la parte visual y de la interacción con el usuario. 

**Controlador**

Controlador  Se encarga de la gestión de las peticiones entre Modelo y Vista.

##### Enlace de interés

Comparativa de los mejores frameworks para Java:

[Los 7 mejores frameworks de Java de 2018](https://openwebinars.net/blog/los-7-mejores-frameworks-de-java/)

<img src="images/c4/4-1-video-2.png">

[Video](https://www.youtube.com/watch?v=T_DOdKInZNk&feature=emb_logo)

### 1.2 Spring MVC

Spring MVC es un framework de desarrollo en Java perteneciente al proyecto desarrollado por Rod Johnson. Está basado en el patrón de diseño Modelo Vista Controlador, donde el proceso de la información se hace a través de Servlets y nos permite la creación de aplicaciones bastante robustas y complejas haciendo uso de la Programación Orientada a Aspectos. 

##### Enlace de interés

Página Oficial del Proyecto Spring:

[Proyecto Spring](https://spring.io/)

### 1.3 Estructura de Spring Web MVC

Spring MVC cuenta con una estructura centralizada en el Dispatcher Servlet.  

Esta estructura centralizada en un servlet inicial o de boostraping, hace que el jsp quede encapsulado dentro de controladores FrontController, todo basado en peticiones HTTP. A lo largo de los siguientes apartados de la unidad veremos esto más en profundidad y con ejemplos. 

<img src="images/c4/4-1-dispacher.png">

### 1.4 Estructura de Spring Web MVC

Para empezar a trabajar con Spring debemos preparar nuestro entorno de desarrollo instalando todas las herramientas necesarias para ejecutar y configurar nuestro ordenador. Para poder trabajar con Spring tendremos que instalar:  

* JAVA jdk (Java SE development Kit) 
* Spring  
* Maven 
* Apache Tomcat 

#### 1.4.1 Preparación del entorno

Los ejemplos que vamos a ver están basados en Windows 10, aunque realmente no hay mucha diferencia para el resto de sistemas operativos. Intentaremos mencionar cualquier cambio importante, pero dada la gran variedad de sistemas operativos existentes y sus respectivas versiones, en muchas ocasiones será necesario consultar la documentación específica disponible. 

<img src="images/c4/4-1-video-3.png">

[Video](https://www.youtube.com/watch?v=rryn1Hs6qHI&feature=emb_logo)

#### 1.4.2 Lo primero sería Instalar JAVA

Toda nuestra arquitectura estará basada en JAVA, que es el pilar fundamental del Spring Framework. Usaremos el JDK (Java Development Kit), que incluye el compilador, la máquina virtual y otra gran cantidad de herramientas que utilizaremos más adelante. 

#### 1.4.3 Instalando el JDK

Para instalar el JDK lo primero que hay que hacer es descargarlo desde la página oficial, donde encontraremos la ultima versión según nuestro sistema operativo, ya sea Linux, Windows u otros. También, debemos estar atentos a si la arquitectura es de 64 o 32 bits dependiendo del tipo de ordenador que estemos utilizando.  

Aceptamos la licencia y los términos, y luego damos click en descargar y guardamos el archivo en la ubicación que deseemos. 


<img src="images/c4/4-1-guardar.png">

*Descarga para la instalación de JDK*

##### Enlace de interés

Página de descarga de JAVA:

[Descarga Java](https://www.oracle.com/java/technologies/javase-downloads.html)

Abrimos el instalador y seguimos los pasos para instalar el JDK en nuestro sistema.  

Una vez finalizado el asistente, podremos ver nuestro jdk instalado en la ruta especificada c:/program files/java/jdk-120.02. 

<img src="images/c4/4-1-jdk.jpg">

*Instalación de JDK*

Una vez finalizado el asistente, podremos ver nuestro jdk instalado en la ruta especificada c:/program files/java/jdk-120.02.  

Ahora, debemos configurar las variables de entorno de la siguiente manera: 

**Propiedades**

Buscamos mi PC y le damos click derecho y accedemos a propiedades.

**Opciones avanzadas**

Luego opciones avanzadas de sistema 

<img src="images/c4/4-1-opciones.jpg">

**Editar variables**

Y ahí vemos la opción de editar variables de entorno. 

<img src="images/c4/4-1-editar-variables.png">

*Edición de variables del entorno*

**Variables JAVA_HOME**

Aquí crearemos la variable JAVA_HOME, cuyo valor será la ruta donde está instalado nuestro jdk. 

**Variable path**

También modificaremos la variable path con el siguiente valor: %JAVA_HOME%\bin. 

#### 1.4.4 Instalando Maven

Maven será la herramienta encargada de compilar y empaquetar nuestros archivos fuente de una manera eficaz y sin errores, ya que hacer todo esto de manera manual conlleva mucho tiempo y no es óptimo sobre todo una vez que nos metemos a desarrollar proyectos de gran complejidad.  

Lo primero será ir a la página oficial y descargarlo en binario.  

Una vez descargado, comprobamos que Maven viene en un archivo zip, por lo que lo extraemos en el lugar donde mejor nos parezca. 

##### Enlace de interés

Página de descarga de Maven

[Descarga Maven](http://maven.apache.org/download.cgi)

Ahora debemos configurar la variable de entorno M2_HOME, de igual manera que en la ocasión anterior hicimos con el JAVA_HOME. Nos dirigimos a las variables de entorno y creamos una variable llamada M2_HOME, cuyo valor será la ruta donde extrajimos el archivo zip de Maven, luego modificaremos la variable Path y agregaremos %M2_MAVEN%/bin igual que con el JAVA_HOME. 

<img src="images/c4/4-1-instalacion-maven.jpg">

*Instalación de Maven*

Ahora, para verificar que todo funciona bien, abriremos una consola de comandos y escribiremos lo siguiente:  

`mvn -version`  

Si todo es correcto obtendremos una salida similar a esta: 

<img src="images/c4/4-1-instalacion-maven-2.jpg">

*Continuación de la instalación de Maven.*

#### 1.4.5 Instalando un Servidor Web

Ya tenemos instalado JAVA y Maven, ahora necesitamos un servidor web donde correrá todo el contenido que desarrollemos en nuestra aplicación, para esto usaremos el conocido Tomcat.  

Primero vamos a su página oficial y descargamos el instalador para nuestro sistema operativo de preferencia.  

Descargamos y seguimos las instrucciones de instalación, dejamos los valores por defecto, con esto tendremos instalado nuestro servidor web Apache Tomcat. 

##### Enlace de interés

Página de descarga de Apache Tomcat

[Apache Tomcat](http://tomcat.apache.org/)

#### 1.4.6 Instalando el Spring Tool Suite (STS)

Ya tenemos instalado gran parte de las herramientas que necesitaremos. Ahora nos toca instalar una IDE que nos facilite trabajar con Spring. Para ello el equipo de Spring ha desarrollado STS, basado en uno de los grandes IDE’s de todos los tiempos que es ECLIPSE. Esta herramienta nos permitirá trabajar de manera más fluida en el momento de programar con Spring. 

##### Enlace de interés

Página de descarga de STS

[Descarga STS](https://spring.io/tools#suite-three)

Tras descargar STS debemos configurarlo para que trabaje correctamente con nuestro Maven y nuestro servidor web Apache Tomcat. 

**Selección de ruta**

Al iniciar STS nos saldrá una pantalla que nos pide que indiquemos cual será nuestra carpeta de trabajo o workspace. La ruta que elijamos será el directorio padre para nuestros proyectos y, como es indiferente, elegimos la que mejor nos convenga.


<img src="images/c4/4-1-instalacion-sts-1.jpg">

*Instalación de STS*

**Configuración de Maven**

Tras realizar esto navegamos a ventanas -> preferencias y buscamos el apartado de Maven. Lo abrimos y vamos a la opción de instalaciones. Después, agregamos una nueva configurando el Maven que habíamos instalado con anterioridad. A continuación pulsamos aplicar y cerrar.

<img src="images/c4/4-1-instalacion-sts-2.png">

*Configuración de Maven*

**Configuración de Tomcat**

Como siguiente paso a seguir, configuraremos nuestro Tomcat, para lo que iremos nuevamente a ventana->preferencias, donde esta vez buscamos el apartado de servidor. Ahí encontraremos una opción de entorno de tiempo de ejecución donde añadiremos un nuevo servidor.

<img src="images/c4/4-1-instalacion-sts-3.png">

*Configuración del servidor*

**Selección de la versión**

Elegimos la versión de nuestro Tomcat (en este caso la versión 9) y luego procedemos a buscar la ruta de instalación del server.

Después ya tendremos listo nuestro ambiente de trabajo para Spring MVC.

<img src="images/c4/4-1-instalacion-sts-4.png">

*Elección de la versión de nuestro Tomcat*


<img src="images/c4/4-1-crusi-1.png">

<img src="images/c4/4-1-crusi-2.png">

## 2. Spring MVC

Ya hemos instalado nuestro entorno de trabajo, así que ahora es el momento de comenzar a codificar. En los siguientes apartados crearemos una aplicación y estudiaremos todos los componentes que la conforman. También veremos, paso a paso, como crearla haciendo uso de STS.   

STS cuenta con una serie de plantillas que nos facilitarán el proceso de creación de nuestra primera aplicación. 

##### Enlace de interés

A continuación, tienes un manual muy completo sobre Srping:

[Manual Spring](http://www.jtech.ua.es/j2ee/publico/spring-2012-13/wholesite.pdf)

**Creación de la aplicación**

Empezamos abriendo STS, y creamos un nuevo proyecto de tipo Maven.

<img src="images/c4/4-1-proyecto-maven.jpg">

*Creación de un proyecto tipo Maven.*

Posteriormente se despliega una ventana con las opciones y marcamos crear proyecto simple (obviando arquetipos).

<img src="images/c4/4-1-proyecto-maven-2.png">

*Creación de un proyecto.*

A continuación nos solicita información relativa al proyecto y simplemente colocamos en grupo id com.curso y en artefacto id unidad 1, como se observa en la imagen y pulsamos finalizar.

<img src="images/c4/4-1-proyecto-maven-3.jpg">

*Indicamos la información del proyecto*

Ahora debemos configurar la versión de java en el archivo pom.xml. Este archivo lo podemos encontrar en la raíz del proyecto y lo abrimos para editarlo.

<img src="images/c4/4-1-proyecto-maven-4.jpg">

*Configuración de la versión de Java*

Después, en la ventana que se abre en la parte inferior podremos ver una pestaña que se llama overview o visión general.

<img src="images/c4/4-1-proyecto-maven-5.jpg">

*Visión general*

Ahora añadiremos en la seccion de propiedades un nuevo item que se llamará maven.compiler.source y su valor será 1.8

<img src="images/c4/4-1-proyecto-maven-6.jpg">

*Añadimos la sección de propiedades*

A continuación creamos otra propiedad llamada maven.compiler.target, igualmente con valor 1.8 y hacemos un cambio más en la sección de empaquetado (packaging) cambiando de jar a war. Esto es porque deseamos que nuestro proyecto pueda ser ejecutado en cualquier servidor basado en servlets. 

<img src="images/c4/4-1-proyecto-maven-7.jpg">

*Añadimos otra propiedad*

Es el momento de añadir las dependencias de Spring a nuestro proyecto. Para ello nos vamos nuevamente al pom.xml y en las pestañas inferiores nos situamos en la que dice dependencias y agregamos lo siguiente: en Group Id colocamos org.springframework y en artifact colocamos id spring-webmvc. La versión con la que trabajaremos será la 4.3.0.RELEASE.  

De igual manera lo haremos con las siguientes dependencias: 

<img src="images/c4/4-1-proyecto-maven-8.png">

*Dependencias de propiedades*

**JSTL (Java Server Pages Tag Library)**

Group id javax.servlet y el artifact id jstl, version 1.2 scope compile. 

**Servlet-api**

Group id javax.servlet, artifact id javax.servlet-api, version 3.1.0 (aquí el scope sera provided). 

Ahora, tras guardar el archivo pom.xml, Maven empezará a descargar todas las dependencias que hemos especificado. Seguidamente en el árbol del directorio podremos ver un elemento que se llama maven dependecies, donde estarán listadas después de ser descargadas.  

Ya hemos realizado toda la configuración de nuestro proyecto y ahora estamos listos para empezar a programar nuestra aplicación. 

<img src="images/c4/4-1-proyecto-maven-9.jpg">

*Árbol del directorio*

##### ¿Sabías que...?

Maven resuelve todas las dependencias, a pesar de solo haber añadido tres dependencias, él descargará todas las otras sub-dependencias relacionadas. 

**Crear la carpeta webapp/WEB-INF/jsp**

Crear la carpeta *webapp/WEB-INF/jsp* en nuestro proyecto dentro de la ruta src/main, luego creamos un archivo llamado bienvenida.jsp en el cual colocaremos el siguiente código:

[Ver código](pdfs/Codigo_bienvenida.pdf)

**Crear el controlador**

Crearemos el controlador con el siguiente código dentro del paquete unidad1.bienvenida.controller

[Ver código](https://eu.workplace.datto.com/filelink/408ad-3b22bafa-b71fc7d1f8-2)

**Configurar el DispatcherServlet**

Ahora debemos configurar el DispatcherServlet que será el encargado de revisar la petición HTTP y hacer la llamada al controlador, en nuestro caso, “bienvenida”. Agregamos la siguiente clase WebApplicationContextConfig bajo el paquete unidad1.bienvenida.config

[Ver código](pdfs/package_unidad1_bienvenida_config.pdf)

**Crear la clase DispatcherServletInitializer**

También debemos crear la clase DispatcherServletInitializer dentro del mismo paquete anterior y su contenido sería el siguiente:

[Ver código](pdfs/package_unidad1_bienvenida_config_2.pdf)

##### Enlace de interés

Si te interesa profundizar en los detalles de configuración de Tomcat puedes hacerlo en el siguiente enlace: 

[Configuración del servidor de aplicaciones Tomcat](http://www.juntadeandalucia.es/servicios/madeja/contenido/recurso/111)

Si todos los pasos se han realizado correctamente, ahora podemos darle click derecho sobre nuestro proyecto e ir al menú Run as -&gt; Run on Server y elegir nuestro servidor Tomcat, y después de unos segundos deberíamos tener nuestro primer proyecto en Spring MVC.  

Veamos que ocurre exactamente aquí para entender mejor como funciona todo esto. El servlet DispatcherServlet (gracias al paquete de Spring org.springframework.web.servlet.DispatcherServlet) recibe la petición http y este sabe a qué método debe llamar. A su vez, el controlador resuelve la vista que se debe llamar. Si en este momento todavía no tienes el proceso claro, no te preocupes. Poco a poco nos adentraremos en la configuración de Spring MVC.

<img src="images/c4/4-1-bienvenido.jpg">

*Nuestro primer proyecto con Spring MVC*

<img src="images/c4/4-1-video-4.png">

[Video](https://www.youtube.com/watch?v=yWDxgzDZzwo&feature=emb_logo)

<img src="images/c4/4-1-autoevaluacion-1.png">

## 3. Acceso a datos

Anteriormente vimos como hacer un sencillo hola mundo con Spring MVC. Ahora, veremos cómo hacer uso de una API REST para almacenar nuestros datos y hacer nuestra aplicación más compleja.  

También aclararemos cómo manejar servicios web con Ajax para hacer peticiones asíncronas. 

Veremos cómo hacer uso de las etiquetas para nuestras vistas y entenderemos cómo funciona en más detalle Spring MVC, los controladores y el Dispatcher servlet.   

Igualmente, estudiaremos como dar forma a nuestra aplicación de ejemplo y usaremos el View Resolver. 

### 3.1 Spring MVC más a fondo

Anteriormente realizamos una simple aplicación en la cual escribíamos en la url de nuestro navegador `http://localhost:8080/unidad1/` y esta nos llevaba a la home que habíamos configurado. Ahora, revisemos que pasaría si cambiásemos la url o le agregáramos algo, por ejemplo:

<img src="images/c4/4-1-ejemplo-1.jpg">

*Ejemplo de qué pasaría si cambiamos la url.*

¿Qué sucede aquí?, el Dispatcher servlet con ayuda de la anotación @RequestMapping (org.springframework.web.bind.annotation.RequestMapping) lee e intenta buscar un controlador que coincida con “ejemplo”, pero al no encontrarlo nos manda un error 404 de no encontrado. Ahora, si cambiáramos el atributo de la anotación @RequestMapping a ejemplo, tal que algo así:

@RequestMapping("/ejemplo") en BienvenidaController.java

Veríamos nuevamente nuestra pantalla de bienvenida.

En Spring MVC podríamos decir que nuestra URL está divida en 5 partes

<img src="images/c4/4-1-ejemplo-2.png">

*Partes de una URL*

El mapeo de la petición solo tomará en cuenta la ruta petición y la anotación @RequestMapping también acepta otro parámetro -el tipo de petición-, estos pueden ser GET, POST, HEAD, OPTION, PUT, DELETE y TRACE. Por defecto, si no especificamos nada, en este parámetro el método es de tipo GET.

En este momento ya tenemos una idea de cómo el DispatcherServlet funciona, recibiendo la petición y redireccionando a su controlador respectivo. Ahora, la pregunta es, ¿cómo sabe que trato debe dar a cada petición?. Pues la respuesta a esto está en el DispatcherServletInitializer.java, en el método getServletsMappings, cuando devolvemos un array de string con “/” le indicamos al DispatcherServlet que se encargue él de todas las peticiones.

<img src="images/c4/4-1-video-5.png">

[Video](https://www.youtube.com/watch?v=8LkJV3XVbc8&feature=emb_logo)

¿Cómo podríamos cambiar esta configuración por defecto?

Podríamos cambiar el array String de retorno de “/” a por ejemplo “/app/*” ¿qué pasaría si hiciéramos esto? Veamos que si colocamos este tipo de mapeo nuestra página principal `http://localhost:8080/unidad1/ejemplo`, nos mostraría un error 404 not found y ahora la url correcta seria `http://localhost:8080/unidad1/app/ejemplo`

<img src="images/c4/4-1-app.jpg">

*Añadimos "/app/"*

¿Qué ha pasado?  Pues al cambiar esta configuración hemos hecho que ahora los mapeos válidos deban llevar el prefijo “/app/”, así es como la clase DispatcherServletInitializer gestiona las configuraciones del dispatcher servlet. Además, como podemos ver, este tiene: 

**getRootConfigClasses**

Especifica las clases de configuración para la raíz de la aplicación, ya que podríamos tener más de un Dispatcher Servlet.

**getServletConfigClasses**

Especifica la clase de configuración para el Dispatcher Servlet en contexto de aplicación.

**getServletMappings**

Especifica los mapeos para el Dispatcher Servlet.

#### 3.1.1 El contexto de una aplicación web

Las aplicaciones hechas con Spring son objetos que estarán dentro de otro objeto contenedor y a su vez este contenedor creará más objetos y asociaciones entre los mismos para manejar así su ciclo de vida.   

Estos objetos son llamados beans y su contenedor viene a ser el contexto de nuestra aplicación.  

Estos contenedores usan ID (Inyección de dependencias) para manejar los beans que forman parte de nuestra aplicación. 

<img src="images/c4/4-1-video-6.png">

[Video](https://www.youtube.com/watch?v=BghyeYN34a4&feature=emb_logo)

Los beans creados dentro de un contexto de aplicación (org.springframework.context.ApplicationContext), asocia los beans entre sí según la configuración que le demos, la cual puede ser definida a través de un archivo XML, por anotaciones o incluso configurándolos mediante sus clases JAVA.  

El contexto de una aplicación web es una extensión del contexto normal de una aplicación Spring y está diseñado para trabajar con el contexto estándar de servlets (javax.servlet.ServletContext). Por lo general, este contexto contiene los beans para la vista y el resolver de la vista. Nosotros en nuestro ejemplo creamos la clase WebApplicationContextConfig, que usamos para configurar nuestra aplicación web.  

En resumen, WebApplicationContextConfig.class es un bean que nos sirve para configurar los otros beans que interactuaran en nuestra aplicación. Para que Spring MVC funcione necesitamos, al menos, un bean que implemente org.springframework.web.servlet.ViewResolver, este bean debe estar también marcado con la anotación @Bean. 

Ahora ajustaremos un poco nuestro WebApplicationContextConfig.class, cambiando nuestro prefijo para tener nuestras vistas más organizadas (*ver imagen*)

Si refrescamos, nos debería salir un error 404. Para corregir debemos renombrar la carpeta jsp a vistas, luego vamos a la ruta `http://localhost:8080/unidad1/app/ejemplo`  y veremos nuestra pantalla de bienvenida. Ahora démosle un poco más de forma y hagamos que esa vista sea la home de nuestra aplicación, entonces cambiemos ese nombre ejemplo a home.

[Código](pdfs/package_unidad1_config_3-1-1.pdf)

##### Ejemplo práctico

En nuestro ejemplo hagamos que ahora la ruta a mapear sea `http://localhost:8080/unidad1/app/home` 

Solución

Debemos ir a la clase BienvenidaController.class luego buscar la anotación @RequestMapping(“/ejemplo”)  y cambiaremos el parámetro a “/home”.

Entendiendo un poco mejor la configuración del WebApplicationContextConfig.class revisemos estos tres elementos:  

1. El prefijo del resolver “/WEB-INF/vistas/”. 
2. El valor de retorno del método bienvenida en el BienvenidaController.class es un string “bienvenida” 
3. El sufijo en el bean InternalViewResolver que es “.jsp”  

Si unimos esos tres elementos obtenemos la ruta de nuestro archivo de la vista a mapear para nuestra página de home:  “/WEB-INF/vistas/bienvenida.jsp”. 

Teniendo esto en cuenta, ahora veamos las otras tres anotaciones que están en la declaración de la clase WebApplicationContextConfig: 

**@Configuration**

Esta anotación indica que en la clase se van a declarar al menos un @Bean. 

**@EnableWebMvc**

Donde le indicamos que importe la configuración específica para Spring MVC. Activa otras anotaciones útiles como @NumberFormat, @DateTimeFormat, etc. 

**@ComponentScan**

Aquí indicamos los paquetes que van a contener las anotaciones @Bean. Es necesaria para autodirección de @Controller. 

Ahora que ya sabemos un poco más crearemos otra clase cuyo nombre será Contacto dentro de nuestro proyecto bajo el paquete unidad1.domain la cual tendrá el siguiente código: 

[Código](pdfs/package_unidad1_domain_3-1-1-2.pdf)

También, crearemos un controlador llamado ContactoController.java Este estará bajo el paquete unidad1.controllers y su contenido será el siguiente: 

Finalmente crearemos una vista llamada contactos.jsp la cual estará dentro de nuestro directorio de vistas y tendrá el siguiente código:

[Ver código](pdfs/vista_contactos.pdf)

Si ejecutamos esto nos dará como resultado lo que se muestra en la siguiente imagen:

<img src="images/c4/4-1-pagina.jpg">

¿Qué hemos realizado en los pasos anteriores?  

* Hemos creado un objeto tipo Contacto bajo el paquete domain. La capa domain vendrá a ser la representacion de los datos requeridos para la lógica de negocio de nuestra aplicación. Esta tendrá los atributos y las relaciones con cualquier otro tipo de entidad de esta capa. 
* Tambien creamos un controlador que manejará las peticiones de contactos. 
* Y, finalmente, creamos una vista que nos mostrará un listado de contactos. 

### 3.2 Acceso a los Datos

Ya hemos creado una nueva interfaz para nuestra aplicación de ejemplo. Ahora debemos hacer que la información en esta sea dinámica, es decir, se pueda traer desde una base de datos. Para ello debemos implementar la capa de persistencia. 

La capa de persistencia, por lo general, está conformada por objetos tipo repositorio, los cuales envían consultas a la fuente de los datos, luego la reciben y la mapean a objetos tipo domain, o reciben los objetos tipo domain para luego guardarlos en la base de datos, es decir, el objeto de tipo repositorio es el responsable del CRUD (create, read, update y delete) en español, crear, leer, actualizar y eliminar. Para señalar que un objeto será un repositorio, tenemos la anotación @Repository. 

Ahora crearemos un repositorio para manejar la información de nuestro objeto Contacto.  

Lo primero es actualizar nuestras dependencias, ya que requerimos la librería spring-jdbc (Group Id org.springframework, Artifact Id spring-jdbc, Version 4.3.0.Release, con scope Compile) y HyperSQL DB (Group Id org.hsqldb, Artifact Id hsqldb ,Version 2.3.2, con scope Compile).  

Después, crearemos una clase que se llamará RootApplicationContextConfig dentro del paquete config con el siguiente contenido: 

Creamos una carpeta llamada db/sql dentro de src/main/resources, luego dentro de la misma crearemos un archivo llamado create-table.sql con el siguiente contenido:

<img src="images/c4/4-1-tabla-x.jpeg">

*Create-table.sql*

También, crearemos el archivo insert-data.sql que tendrá lo siguiente:

<img src="images/c4/4-1-tabla-x-2.jpeg">

*Insert-data.sql*

Posteriormente tenemos que crear la interface ContactoRepository dentro de domain.repository y debe quedar así: 

Ahora editamos el ContactoController y agregamos el siguiente atributo a la clase: 

<img src="images/c4/4-1-contacto.jpeg">

Después, remplazamos el contenido de contacto.jsp por:

[Ver código](pdfs/Reemplazo_contacto.pdf)

Si ejecutamos este código tendremos el siguiente resultado:

<img src="images/c4/4-1-contacto-2.jpg">

Con los pasos que hemos explicado, hemos logrado que nuestra aplicación cree una base de datos, se conecte y almacene la información. Además de esto, también la hemos traído de vuelta para listarla luego en contactos.jsp.   

Todo esto gracias al framework Spring MVC, implementando la capa Domain, creando un objeto para almacenar los datos, a su vez creamos la capa Repository, que se encarga de gestionar las conexiones con la base de datos.   

HyperSQL es una de las bases de datos en memoria más usadas. Para configurarla creamos el bean dataSource, en el cual configuramos los scripts de creación y de inserción, para que nuestra aplicación funcione correctamente. Además en la vista contactos.jsp hemos usado un tag nuevo 

##### Enlace de interés

En el siguiente enlace puedes aprender más sobre HyperSQL:

[HyperSQL](http://datojava.blogspot.com/2015/11/TutorialJavaHSQLDB.html)

##### ¿Sabías que...?

JSTL es una librería que contiene una colección de etiquetas JSP y nos serán de mucha utilidad para nuestras vistas. 

<img src="images/c4/4-1-crusi-3.png">

<img src="images/c4/4-1-crusi-4.png">

## 4. Programación orientada a aspectos

Anteriormente vimos cómo acceder a los datos de nuestra base de datos, así como también le dimos forma a varias capas de nuestra aplicación: domain, repository, controller y todo esto gracias a Spring MVC.  

¿Cuál es el fundamento de abstraer las funcionalidades de nuestra aplicación en distintas capas basadas en su función? La respuesta es AOP (Aspect Oriented Programing), en español POA (Programación Orientada a Aspectos).  

Spring es un framework POA y por ello en este apartado veremos más en profundidad este concepto de POA y como Spring MVC lo implementa. 

### 4.1 Programación Orientada a Aspectos (POA)

La AOP o POA tiene como prioridad separar las funcionalidades dentro de nuestro sistema de modo que cada funcionalidad se encapsulará en una entidad y buscará evitar la repetición de código.   

En paradigmas como POO (Programación Orientada a Objetos), a veces es necesario el sacrificio del diseño óptimo para cumplir los requerimientos del mismo. En nuestro caso la POA no viene a remplazar a la POO, sino más bien a enriquecerla. 

##### Enlace de interés

En el siguiente enlace encontrarás un tutorial sobre la programación orientada a aspectos: 

[Tutorial sobre la programación orientada a aspectos](http://www.jtech.ua.es/j2ee/publico/spring-2012-13/apendice_AOP-apuntes.html)

En AOP se manejan los siguientes conceptos básicos:

**Aspecto (Aspect)**

Son las funcionalidades transversales del sistema. Es decir, esas que ocurren siempre y afectan a todo el sistema. Un ejemplo de esto es el login o registro de sucesos.

**Punto de cruce o unión (Join Point)**

Es un punto de ejecución en el sistema donde un aspecto puede ser conectado, como una llamada a un método.
 
**Consejo (Advice)**

Es la implementación de un aspecto.
 
**Punto de corte (Pointcut)**

Define los consejos que se aplicarán en cada punto de cruce (por lo general se especifican mediante expresiones regulares)
 
**Introducción (Introduction)**

Consiste en agregar métodos reusables a distintas clases.
 
**Objeto Destino (Target Object)**

Son los objetos donde los consejos serán aplicados.
 
**AOP Proxy**

La implementación POA de Spring usa proxys dinámicos para la creación de las clases donde se implementarán los advices. A estas clases se les llama AOP proxy.
 
**Tejido (Weaving)**

Es el proceso de ir aplicando aspectos a los objetos.

Podemos  usar la POA en Spring MVC puesto que Spring nos provee de herramientas para hacer esto de manera cómoda.  Tipos de Advices POA en Spring MVC: 

**Before Advice**

Este advice corre antes de la ejecución de los métodos de join point y podemos usar la anotación @Before para definirlo.

**After (final) Advice**

Un advice puede ser ejecutado después del join point. Se usa la anotación @After para usarlo.

**After Retorno Advice**

Muchas veces queremos ejecutar un advice después de que el método se ejecute normalmente y para ello usamos la siguiente anotación @AfterReturnig.

**After Throwing Advice**

Para ejecutar una anotación tras un error se usa @AfterThrowing, es muy útil para hacer rollback cuando las cosas no salen como se esperaba.

**Around Advice**

Esta anotación es una de las importantes y poderosas, ya que nos permite apagar el join point, es decir, nos permite decidir si el método se ejecuta o no y la anotación que se usa es @Around.

Spring nos aporta la capacidad de hacer uso de todas las anotaciones anteriormente mencionadas a través de la implementación de la librería AspectJ. Todas estas anotaciones están definidas en el paquete org.aspectj.lang.annotation. Ahora veamos cómo implementarla en nuestra aplicación de ejemplo. 

Lo primero que tenemos que hacer es implementar una capa de servicios y para ello seguiremos los siguientes pasos: 

**Método createContacto**

En el archivo de la interface ContactoRepository.java agregaremos un nuevo método llamado createContacto, que tendrá como parámetro un objeto de tipo contacto

<img src="images/c4/4-1-poa-1.png">

*Código createContacto*

**Clase InMemoryContactoRepository.java**

Luego haremos la implementación de dicho método en la clase InMemoryContactoRepository.java:

<img src="images/c4/4-1-poa-2.jpeg">

*Código InMemoryContactoRepository.java*

**Interface ContactoService.java**

Ahora debemos crear una interface llamada ContactoService.java dentro del paquete unidad1.service en la carpeta src/main/java y añadiremos la declaración del método:

<img src="images/c4/4-1-poa-3.png">

*Código ContactoService.java*

**Interface ContactoServiceImpl.java**

Creamos también la implementación de esa interface ContactoServiceImpl.java en el paquete unidad1.service.impl

<img src="images/c4/4-1-poa-4.png">

*Código ContactoServiceImpl.java*

**Archivo ContactoController.java**

Abrimos el archivo ContactoController.java y colocamos una referencia al servicio que acabamos de crear y reemplazamos la referencia al repositorio y el archivo quedara así:

<img src="images/c4/4-1-poa-5.jpeg">

*Código ContactoController.java*

**Ejecución del proyecto**

Ahora ejecutamos el proyecto por lo que vamos a la url `http://localhost:8080/unidad1/app/contactos`:

<img src="images/c4/4-1-poa-6.jpg">

*Resultado de la ejecución del código.*

¿Qué ha pasado?  Tenemos nuevamente nuestro listado y hemos implementado satisfactoriamente la capa de servicios para completar nuestra arquitectura de Spring MVC. Aquí vemos un gráfico de cómo queda el flujo de la aplicación: 

<img src="images/c4/4-1-flujo.png">

*Flujo de la aplicación*

Hemos dejado preparado el terreno para implementar el método createContacto, pero antes de eso implementaremos AOP.  

Lo primero que haremos será agregar las dependencias en el archivo de pom.xml org.aspectj para el Group Id y el Artifact aspectjrt versión 1.7.4 scope runtime. 

<img src="images/c4/4-1-dependencias.jpg">

*Agregación de dependencias*

También añadimos aspectjtools (Artifact id) y Group Id (org.aspectj, versión 1.7.4 y scope compile) tal y como se muestra en la siguiente imagen: 

<img src="images/c4/4-1-dependencias-2.jpg">

*Añadimos aspectjtools (Artifact id) y Group Id*

Posteriormente, añadimos un aspecto, en el paquete unidad1.aspect agregamos la clase ContactoAspect con el siguiente contenido:

[Ver código](pdfs/clase_ContactoAspect_4-1.pdf)

Después, debemos activar el soporte para aspectj y eso lo hacemos con la anotación @EnableAspectJAutoProxy, en el archivo WebApplicationContextConfig.java, además declararemos un @Bean con la implementación del aspecto que acabamos de crear y el archivo debería quedar así:

[Ver código](pdfs/archivo_WebApplicationContextConfig_java_4-1.pdf)

Ahora, si ejecutamos todo esto y vamos a la url `http://localhost:8080/unidad1/app/contactos` debería cargarnos nuestro listado y además de eso en la consola vemos algo nuevo: un mensaje. 

#### 4.1.1 Llamada a método en servicio      

Hemos implementado satisfactoriamente un aspecto y si revisamos más arriba el aspecto definido. 

<img src="images/c4/4-1-llamada.jpeg">

Vemos como todo esto ocurre antes (@Before) y esto lo aplicamos a todos los servicios que tenemos en nuestra carpeta usando el comodin ‘*’. De este modo indicamos que puede ser cualquier servicio, con cualquier metodo get. Ahora veamos nuestro servicio:

[Ver código](pdfs/codigo_servicio.pdf)

El metodo getAllContactos cumple con este criterio por eso se ejecuta nuestro aspecto. 

<img src="images/c4/4-1-contacto-100.jpg">

<img src="images/c4/4-1-auto-4.png">

### BIBLIOGRAFÍA

* Pérez Martínez, Eugenia. (2015). Desarrollo de aplicaciones mediante el framework de Spring. Ra-Ma Editorial.
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill.
* Pérez Martínez, Eugenia (2018). Spring 5. Anaya Multimedia.
* Walls, Craig. (2015) Spring. Anaya Multimedia
* Spring. Recuperado de: https://spring.io/
* Java EE. Recuperado de: https://www.arquitecturajava.com/
* Programación orientada a objetos (POO). Recuperado de: https://compu2poo.wordpress.com/
* La web del programador. Recuperado de: https://www.lawebdelprogramador.com/
