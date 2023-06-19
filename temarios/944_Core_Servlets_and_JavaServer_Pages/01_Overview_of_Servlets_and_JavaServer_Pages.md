# Capítulo 1. DESCRIPCIÓN GENERAL DE LAS PÁGINAS DE SERVLETS Y JAVASERVER

Temas de este capítulo

* ¿Qué son los servlets?
* Cuándo y por qué usaría servlets
* Qué son las páginas JavaServer
* Cuándo y por qué usaría JSP
* Obteniendo el servlet y el software JSP
* Instalación y configuración de software

Este capítulo ofrece una descripción general rápida de los servlets y JavaServer Pages (JSP), destacando las principales ventajas de cada uno. Luego resume cómo obtener y configurar el software que necesita para escribir servlets y desarrollar documentos JSP.

## 1.1. Servlets

Los servlets son la respuesta de la tecnología Java a la programación de **Common Gateway Interface (CGI)**. Son programas que se ejecutan en un servidor web y ***actúan como una capa intermedia entre una solicitud proveniente de un navegador web u otro cliente HTTP y las bases de datos o aplicaciones en el servidor HTTP***. Su trabajo es:

1. Leer cualquier dato enviado por el usuario.

   Estos datos generalmente se ingresan en un formulario en una página web, pero también pueden provenir de un Java applet o de un programa de cliente HTTP personalizado.

2. Busque cualquier otra información sobre la request que esté incrustada en la HTTP request.

   Esta información incluye detalles sobre las capacidades del navegador, las cookies, el nombre de host del cliente solicitante, etc.

3. Generar los resultados.

   Este proceso puede requerir hablar con una base de datos, ejecutar una llamada **RMI** o **CORBA**, invocar una aplicación heredada o calcular la response directamente.

4. Formatee los resultados dentro de un documento.

   En la mayoría de los casos, esto implica incrustar la información dentro de una página HTML.

5. Establezca los parámetros de HTTP response apropiados.

   Esto significa decirle al navegador qué tipo de documento se está devolviendo (por ejemplo, HTML), establecer cookies y parámetros de almacenamiento en caché, y otras tareas similares.

6. Envíe el documento de vuelta al cliente.

   Este documento se puede enviar en formato de texto (HTML), formato binario (imágenes GIF) o incluso en un formato comprimido como **gzip** que se superpone a algún otro formato subyacente.

Muchas solicitudes de clientes se pueden satisfacer devolviendo documentos preconstruidos, y estas requests serían manejadas por el servidor sin invocar servlets. En muchos casos, sin embargo, un resultado estático no es suficiente y se debe generar una página para cada request. Hay una serie de razones por las que las páginas web deben construirse sobre la marcha de esta manera:

* La página Web se basa en los datos enviados por el usuario.

   Por ejemplo, la página de resultados de los motores de búsqueda y las páginas de confirmación de pedidos en las tiendas en línea son específicas para solicitudes de usuarios particulares.

* La página web se deriva de datos que cambian con frecuencia.

   Por ejemplo, una página de informes meteorológicos o titulares de noticias podría crear la página dinámicamente, tal vez devolviendo una página creada previamente si todavía está actualizada.

* La página web utiliza información de bases de datos corporativas u otras fuentes del lado del servidor.

   Por ejemplo, un sitio de comercio electrónico podría usar un servlet para crear una página web que enumere el precio actual y la disponibilidad de cada artículo que está a la venta.

En principio, los servlets no están restringidos a servidores web o de aplicaciones que manejan solicitudes HTTP, sino que también pueden usarse para otros tipos de servidores. Por ejemplo, los servlets podrían integrarse en servidores de correo o FTP para ampliar su funcionalidad. En la práctica, sin embargo, este uso de servlets no se ha popularizado, y solo hablaré de los HTTP servlets.

## 1.2. Las ventajas de los Servlets sobre el "tradicional" CGI 

Los Java servlets son más eficientes, más fáciles de usar, más potentes, más portátiles, más seguros y más baratos que el CGI tradicional y muchas tecnologías alternativas similares a CGI.

### Eficiente

Con CGI tradicional, se inicia un nuevo proceso para cada solicitud HTTP. Si el programa CGI en sí es relativamente corto, la sobrecarga de iniciar el proceso puede dominar el tiempo de ejecución. Con los servlets, la máquina virtual de Java permanece en ejecución y maneja cada solicitud mediante un subproceso de Java liviano, no un proceso pesado del sistema operativo. De manera similar, en CGI tradicional, si hay N solicitudes simultáneas al mismo programa CGI, el código para el programa CGI se carga en la memoria N veces. Con servlets, sin embargo, habría N subprocesos, pero solo una copia de la clase de servlet. Finalmente, cuando un programa CGI termina de manejar una solicitud, el programa termina. Esto dificulta el almacenamiento en caché de los cálculos, mantener abiertas las conexiones de la base de datos y realizar otras optimizaciones que se basan en datos persistentes. Sin embargo, los servlets permanecen en la memoria incluso después de completar una respuesta, por lo que es sencillo almacenar datos arbitrariamente complejos entre solicitudes.

### Conveniente

Los servlets tienen una infraestructura extensa para analizar y decodificar automáticamente datos de formularios HTML, leer y configurar encabezados HTTP, manejar cookies, rastrear sesiones y muchas otras utilidades de alto nivel. Además, ya conoces el lenguaje de programación Java. ¿Por qué aprender Perl también? Ya está convencido de que la tecnología Java genera un código más fiable y reutilizable que C++. ¿Por qué volver a C++ para la programación del lado del servidor?

### Poderoso

Los servlets admiten varias capacidades que son difíciles o imposibles de lograr con CGI normal. Los servlets pueden comunicarse directamente con el servidor web, mientras que los programas CGI normales no pueden hacerlo, al menos no sin utilizar una API específica del servidor. La comunicación con el servidor web facilita la traducción de direcciones URL relativas en nombres de ruta concretos, por ejemplo. Múltiples servlets también pueden compartir datos, lo que facilita la implementación de la agrupación de conexiones de bases de datos y optimizaciones similares para compartir recursos. Los servlets también pueden mantener información de una solicitud a otra, lo que simplifica técnicas como el seguimiento de sesiones y el almacenamiento en caché de cálculos anteriores.

### Portátil

Los servlets están escritos en el lenguaje de programación Java y siguen una API estándar. En consecuencia, los servlets escritos para, por ejemplo, **I-Planet Enterprise Server** pueden ejecutarse prácticamente sin cambios en **Apache**, **Microsoft Internet Information Server (IIS)**, **IBM WebSphere** o **StarNine WebStar**. Por ejemplo, prácticamente todos los servlets y las páginas JSP de este libro se ejecutaron en el **Java Web Server de Sun**, **Apache Tomcat** y el **JavaServer Web Development Kit (JSWDK) de Sun** sin ningún cambio en el código . Muchos también se probaron en **BEA WebLogic** e **IBM WebSphere**. De hecho, los servlets son compatibles directamente o mediante un complemento en prácticamente todos los principales servidores web. Ahora forman parte de **Java 2 Platform, Enterprise Edition** (**J2EE**; consulte http://java.sun.com/j2ee/), por lo que el apoyo de la industria a los servlets se está volviendo aún más generalizado.

### Seguro

Una de las principales fuentes de vulnerabilidades en los programas CGI tradicionales proviene del hecho de que a menudo son ejecutados por shells de sistemas operativos de propósito general. Por lo tanto, el programador de CGI debe tener mucho cuidado para filtrar caracteres como comillas inversas y punto y coma que son tratados de manera especial por el shell. Esto es más difícil de lo que uno podría pensar, y las debilidades derivadas de este problema se descubren constantemente en las bibliotecas CGI ampliamente utilizadas. Una segunda fuente de problemas es el hecho de que algunos programas CGI son procesados por lenguajes que no comprueban automáticamente los límites de cadenas o matrices. Por ejemplo, en C y C++ es perfectamente legal asignar una matriz de 100 elementos y luego escribir en el "elemento" 999, que en realidad es una parte aleatoria de la memoria del programa. Entonces, los programadores que se olvidan de hacer esta verificación ellos mismos abren su sistema a ataques de desbordamiento de búfer deliberados o accidentales. Los servlets no sufren ninguno de estos problemas. Incluso si un servlet ejecuta una llamada a un sistema remoto para invocar un programa en el sistema operativo local, no utiliza un shell para hacerlo. Y, por supuesto, la comprobación de los límites de la matriz y otras características de protección de la memoria son una parte central del lenguaje de programación Java.

### Barato

Hay varios servidores web gratuitos o muy económicos disponibles que son buenos para uso “personal” o para sitios web de bajo volumen. Sin embargo, con la gran excepción de Apache, que es gratuito, la mayoría de los servidores web de calidad comercial son relativamente caros. Sin embargo, una vez que tenga un servidor web, sin importar su costo, agregarle soporte para servlets (si no viene preconfigurado para admitir servlets) cuesta muy poco más. Esto contrasta con muchas de las otras alternativas CGI, que requieren una inversión inicial significativa para comprar un paquete propietario.

## 1.3. JavaServer Pages

La tecnología **JavaServer Pages (JSP)** le permite mezclar HTML estático normal con contenido generado dinámicamente a partir de servlets. Muchas páginas web creadas por programas CGI son principalmente estáticas, con las partes que cambian limitadas a unas pocas ubicaciones pequeñas. Por ejemplo, la página inicial en la mayoría de las tiendas en línea es la misma para todos los visitantes, excepto por un pequeño mensaje de bienvenida que da el nombre del visitante si se conoce. Pero la mayoría de las variaciones CGI, incluidos los servlets, hacen que genere la página completa a través de su programa, aunque la mayor parte es siempre la misma. JSP le permite crear las dos partes por separado. El listado 1.1 da un ejemplo. La mayor parte de la página consta de HTML normal, que se pasa al visitante sin cambios. Las partes que se generan dinámicamente se marcan con etiquetas especiales similares a HTML y se mezclan directamente en la página.

**Listado 1.1. Una página JSP de muestra**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD><TITLE>Welcome to Our Store</TITLE></HEAD>
<BODY>
<H1>Welcome to Our Store</H1>
<SMALL>Welcome,
<!-- User name is "New User" for first-time visitors -->
<%= Utils.getUserNameFromCookie(request) %>
To access your account settings, click
<A HREF="Account-Settings.html">here.</A></SMALL>
<P>
Regular HTML for all the rest of the on-line store's web page.
</BODY>
</HTML>
```

## 1.4. Las ventajas de JSP

JSP tiene una serie de ventajas sobre muchas de sus alternativas. Éstos son algunos de ellos.

### Versus Active Server Pages (ASP)

***ASP es una tecnología competidora de Microsoft***. Las ventajas de JSP son dos. En primer lugar, la parte dinámica está escrita en Java, no en VBScript ni en ningún otro lenguaje específico de ASP, por lo que es más potente y se adapta mejor a aplicaciones complejas que requieren componentes reutilizables. En segundo lugar, JSP es portátil para otros sistemas operativos y servidores web; no está bloqueado en **Windows NT/2000 e IIS**. Podría presentar el mismo argumento al comparar JSP con **ColdFusion**; con JSP puede usar Java y no está vinculado a un producto de servidor en particular.

### Versus PHP

***PHP es un lenguaje de secuencias de comandos integrado en HTML gratuito y de código abierto que es algo similar a ASP y JSP***. La ventaja de JSP es que la parte dinámica está escrita en Java, que probablemente ya conozca, que ya tiene una API extensa para redes, acceso a bases de datos, objetos distribuidos y similares, mientras que PHP requiere aprender un lenguaje completamente nuevo.

### Versus Servlets Puros

JSP no proporciona ninguna capacidad que, en principio, no se pueda lograr con un servlet. De hecho, los documentos JSP se traducen automáticamente en servlets en segundo plano. Pero es más conveniente escribir (¡y modificar!) HTML regular que tener un millón de sentencias println que generan el HTML. Además, al separar la presentación del contenido, puede poner a diferentes personas en diferentes tareas: sus expertos en diseño de páginas web pueden construir el HTML usando herramientas familiares y dejar lugares para que sus programadores de servlets inserten el contenido dinámico.

### Versus Server-Side Includes (SSI)

SSI es una tecnología ampliamente compatible para insertar piezas definidas externamente en una página web estática. JSP es mejor porque tiene un conjunto más rico de herramientas para construir esa pieza externa y tiene más opciones con respecto a la etapa de la respuesta HTTP en la que realmente se inserta la pieza. Además, SSI realmente está diseñado solo para inclusiones simples, no para programas "reales" que usan datos de formularios, hacen conexiones a bases de datos y cosas por el estilo.

### Versus JavaScript

JavaScript, que es completamente distinto del lenguaje de programación Java, normalmente se usa para generar HTML dinámicamente en el cliente, creando partes de la página web a medida que el navegador carga el documento. Esta es una capacidad útil, pero solo maneja situaciones en las que la información dinámica se basa en el entorno del cliente. Con la excepción de las cookies, los datos de la solicitud HTTP no están disponibles para las rutinas de JavaScript del lado del cliente. Y, dado que JavaScript carece de rutinas para la programación de redes, el código JavaScript en el cliente no puede acceder a los recursos del lado del servidor, como bases de datos, catálogos, información de precios y similares. JavaScript también se puede utilizar en el servidor, sobre todo en ***servidores Netscape*** y como lenguaje de secuencias de comandos para **IIS**. Java es mucho más poderoso, flexible, confiable y portátil.

### Versus Static HTML

El HTML normal, por supuesto, no puede contener información dinámica, por lo que las páginas HTML estáticas no pueden basarse en la entrada del usuario o fuentes de datos del lado del servidor. JSP es tan fácil y conveniente que es bastante razonable aumentar las páginas HTML que solo se benefician ligeramente de la inserción de datos dinámicos. Anteriormente, la dificultad de usar datos dinámicos impedía su uso en todos los casos excepto en los más valiosos.

## 1.5. Instalación y Configuración

Antes de que pueda comenzar, debe descargar el software que necesita y configurar su sistema para aprovecharlo. Aquí hay un resumen de los pasos involucrados. Tenga en cuenta, sin embargo, que aunque su código de servlet seguirá una API estándar, no existe un estándar para descargar y configurar servidores web o de aplicaciones. Por lo tanto, a diferencia de la mayoría de las secciones de este libro, los métodos descritos aquí varían significativamente de un servidor a otro, y los ejemplos de esta sección deben tomarse solo como muestras representativas. Consulte la documentación de su servidor para obtener instrucciones autorizadas.

### Obtenga el software Servlet y JSP

Su primer paso es descargar software que implemente ***las especificaciones Java Servlet 2.1 o 2.2 y JavaServer Pages 1.0 o 1.1***. Si está utilizando un servidor web o de aplicaciones actualizado, es muy probable que ya tenga todo lo que necesita. Consulte la documentación de su servidor o consulte la lista más reciente de servidores que admiten servlets en http://java.sun.com/products/servlet/industry.html. Aunque eventualmente querrá implementar en un servidor de calidad comercial, cuando aprende por primera vez, es útil tener un sistema gratuito que pueda instalar en su máquina de escritorio para fines de desarrollo y prueba. Estas son algunas de las opciones más populares:

* **Apache Tomcat**.

   Tomcat es la implementación de referencia oficial de las especificaciones servlet 2.2 y JSP 1.1. Se puede utilizar como un pequeño servidor independiente para probar servlets y páginas JSP, o se puede integrar en el servidor web Apache. Sin embargo, muchos otros servidores han anunciado soporte próximo, por lo que estas especificaciones se tratarán en detalle a lo largo de este libro. Tomcat, como el propio Apache, es gratuito. Sin embargo, al igual que Apache (que es muy rápido, altamente confiable, pero un poco difícil de configurar e instalar), Tomcat requiere mucho más esfuerzo para configurarlo que los motores de servlets comerciales. Para obtener más información, consulte http://jakarta.apache.org/ .

* **JavaServer Web Development Kit (JSWDK)**.

   El JSWDK es la implementación de referencia oficial de las especificaciones servlet 2.1 y JSP 1.0. Se utiliza como un pequeño servidor independiente para probar servlets y páginas JSP antes de que se implementen en un servidor web completo que admita estas tecnologías. Es gratuito y confiable, pero requiere un poco de esfuerzo para instalarlo y configurarlo. Para obtener más información, consulte http://java.sun.com/products/servlet/download.html .

* **Allaire JRun**.

   JRun es un motor de servlet y JSP que se puede conectar a servidores Netscape Enterprise o FastTrack, IIS, Microsoft Personal Web Server, versiones anteriores de Apache, O'Reilly's WebSite o StarNine WebSTAR. Una versión limitada que admite hasta cinco conexiones simultáneas está disponible de forma gratuita; la versión comercial elimina esta restricción y agrega capacidades como una consola de administración remota. Para obtener más información, consulte http://www.allaire.com/products/jrun/ .

* **New Atlanta's ServletExec**.

   ServletExec es un motor de servlet y JSP que se puede conectar a los servidores web más populares para Solaris, Windows, MacOS, HP-UX y Linux. Puede descargarlo y usarlo de forma gratuita, pero muchas de las funciones avanzadas y las utilidades de administración están deshabilitadas hasta que compre una licencia. Para obtener más información, consulte http://newatlanta.com/ .

* **LiteWebServer (LWS) from Gefion Software**.

   LWS es un pequeño servidor web gratuito derivado de Tomcat que admite servlets versión 2.2 y JSP 1.1. Gefion también tiene un complemento gratuito llamado WAICoolRunner que agrega compatibilidad con servlet 2.2 y JSP 1.1 a los servidores Netscape FastTrack y Enterprise. Para obtener más información, consulte http://www.gefionsoftware.com/ .

* **Sun's Java Web Server**.

   Este servidor está escrito completamente en Java y fue uno de los primeros servidores web en admitir completamente las especificaciones de servlet 2.1 y JSP 1.0. Aunque ya no está en desarrollo activo porque Sun se está concentrando en el servidor Netscape/I-Planet, sigue siendo una opción popular para aprender servlets y JSP. Para obtener una versión de prueba gratuita, consulte http://www.sun.com/software/jwebserver/try/ . Para obtener una versión gratuita que no caduca para fines de enseñanza en instituciones académicas, consulte http://freeware.thesphere.com/ .

**Agregar a favoritos o instalar la documentación de la API de Servlet y JSP**

Así como ningún programador serio debería desarrollar aplicaciones Java de uso general sin acceso a la documentación de la API JDK 1.1 o 1.2, ningún programador serio debería desarrollar servlets o páginas JSP sin acceso a la API para clases en los paquetes **`javax.servlet`**. Aquí hay un resumen de dónde encontrar la API:

* http://java.sun.com/products/jsp/download.html

   Este sitio le permite descargar la API 2.1/1.0 o la API 2.2/1.1 a su sistema local. Es posible que deba descargar la implementación de referencia completa y luego extraer la documentación.

* http://java.sun.com/products/servlet/2.2/javadoc/

   Este sitio le permite explorar la API servlet 2.2 en línea.

* http://www.java.sun.com/j2ee/j2sdkee/techdocs/api/

   Esta dirección le permite navegar por la API completa de Java 2 Platform, Enterprise Edition (J2EE), que incluye los paquetes servlet 2.2 y JSP 1.1.

Si Sun o Apache colocan nuevas adiciones en línea (por ejemplo, un lugar para explorar la API 2.1/1.0), se enumerarán en el Capítulo 1 en el archivo fuente del libro en http://www.coreservlets.com/ .

#### Identificar las clases para el compilador de Java

Una vez que haya obtenido el software necesario, debe decirle al compilador de Java ( **`javac`** ) dónde encontrar los archivos de clase servlet y JSP cuando compila sus servlets. Consulte la documentación de su paquete particular para obtener detalles definitivos, pero los archivos de clase necesarios generalmente se encuentran en el subdirectorio **`lib`** del directorio de instalación del servidor, con las clases de servlet en **`servlet.jar`** y las clases JSP en **`jsp.jar`**, **`jspengine.jar`** o **`jasper.jar`**. Hay un par de formas diferentes de informar a javac sobre estas clases, la más fácil de las cuales es colocar los archivos JAR en su **`CLASSPATH`**. Si nunca ha tratado con **`CLASSPATH`** antes, es la variable que especifica dónde busca **`javac`** las clases al compilar. Si no se especifica la variable, **`javac`** busca en el directorio actual y en las bibliotecas estándar del sistema. Si configura **`CLASSPATH`** usted mismo, asegúrese de incluir **“ . ”**, que significa el directorio actual.
A continuación se muestra un breve resumen de cómo configurar la variable de entorno en un par de plataformas diferentes. Supongamos que 
**`dir`** es el directorio en el que se encuentran las clases de servlet y JSP.

#### Unix (C Shell)

```sh
setenv CLASSPATH .:dir/servlet.jar:dir/jspengine.jar
```

Agregue **`:$CLASSPATH`** al final de la línea **`setenv`** si su **`:$CLASSPATH`** ya está configurado y desea agregarle más, no reemplazarlo. Tenga en cuenta que en los sistemas Unix se utilizan barras inclinadas para separar directorios dentro de una entrada y dos puntos para separar entradas, mientras que en Windows se utilizan barras inclinadas hacia atrás y punto y coma. Para que esta configuración sea permanente, normalmente colocaría esta declaración en su archivo **`.cshrc`**.

#### Windows

```sh
set CLASSPATH=.;dir\servlet.jar;dir\jspengine.jar
```

Agregue **`%CLASSPATH%`**; al final de la línea anterior si su **`CLASSPATH`** ya está configurado y desea agregarle más, no reemplazarlo. Tenga en cuenta que en Windows usa barras diagonales hacia atrás para separar directorios dentro de una entrada y punto y coma para separar entradas, mientras que usa barras diagonales y dos puntos en Unix. Para que esta configuración sea permanente en Windows 95/98, normalmente colocaría esta declaración en su archivo **`autoexec.bat`**. En Windows NT o 2000, debe ir al menú Inicio, seleccionar Configuración, seleccionar Panel de control, seleccionar Sistema, seleccionar Entorno, luego ingresar la variable y el valor.

#### Package the Classes

Como verá en el próximo capítulo, probablemente desee colocar sus servlets en paquetes para evitar conflictos de nombres con servlets que otras personas escriben para el mismo servidor web o de aplicaciones. En ese caso, puede que le resulte conveniente agregar también el directorio de nivel superior de la jerarquía de su paquete a **`CLASSPATH`**. Consulte la Sección 2.4 (Packaging Servlets) para obtener más detalles.

#### Configurar el servidor

Antes de iniciar el servidor, es posible que desee designar parámetros como el puerto en el que escucha, los directorios en los que busca archivos HTML, etc. Este proceso es totalmente específico del servidor y, para los servidores web de calidad comercial, debe documentarse claramente en las notas de instalación. Sin embargo, con los pequeños servidores autónomos que Apache y Sun proporcionan como implementaciones de referencia de las especificaciones servlet 2.2/JSP 1.1 (Apache Tomcat) o 2.1/1.0 (Sun JSWDK), hay una serie de configuraciones importantes pero mal documentadas que Voy a describir aquí.

Port Number
Tanto Tomcat como JSWDK utilizan un puerto no estándar de forma predeterminada para evitar conflictos con los servidores web existentes. Si utiliza uno de estos productos para el desarrollo y las pruebas iniciales, y no tiene otro servidor web en ejecución, probablemente le resultará conveniente cambiar a 80, el número de puerto HTTP estándar. Con Tomcat 3.0, hágalo editando **`install_dir/server.xml`**, cambiando 8080 a 80 en la línea


```xml
<ContextManager port="8080" hostName="" inet="">
```

#### Configuración JAVA_HOME

Si usa **JDK 1.2 o 1.3** con Tomcat o JSWDK, debe configurar la variable de entorno **`JAVA_HOME`** para hacer referencia al directorio de instalación de JDK. Esta configuración no es necesaria con JDK 1.1. La forma más fácil de especificar esta variable es insertar una línea que la establezca en la **`startup`** de la secuencia de comandos de inicio (Tomcat) o servidor de inicio (JSWDK). Por ejemplo, aquí está la versión modificada de **`startup.bat`** y **`startserver.bat`** que uso:

```xml
rem Marty Hall: added JAVA_HOME setting below
set JAVA_HOME=C:\jdk1.2.2
```

#### DOS Memory Setting

Si inicia Tomcat o el servidor JSWDK desde Windows 95 o 98, probablemente tenga que modificar la cantidad de memoria que DOS asigna para las variables de entorno. Para hacer esto, inicie una nueva ventana de DOS, haga clic en el icono de MS-DOS en la esquina superior izquierda de la ventana y seleccione **`Properties`**. Desde allí, elija la pestaña **`Memory `**, vaya a la **`Initial Environment`** y cambie el valor de **`Auto `** a **`2816`**. Esta configuración solo debe realizarse una vez.

#### Tomcat 3.0 CR/LF Settings

Las primeras versiones de Tomcat sufrieron un problema grave: los archivos de texto se guardaban en formato Unix (donde el final de línea se marca con un salto de línea), no en formato Windows (donde el final de línea se marca con un carriage return/linefeed pair). Como resultado, los scripts de inicio y apagado fallaron en Windows. Puede determinar si su versión sufre este problema abriendo **`install_dir/startup.bat`** en el Bloc de notas; si parece normal tienes una versión parcheada. Si el archivo parece ser una línea larga y confusa, salga del Bloc de notas y abra e inmediatamente guarde los siguientes archivos usando Wordpad ( no el Bloc de notas):

* **install_dir/startup.bat**
* **install_dir/tomcat.bat**
* **install_dir/shutdown.bat**
* **install_dir/tomcatEnv.bat**
* **install_dir/webpages/WEB-INF/web.xml**
* **install_dir/examples/WEB-INF/web.xml** 

#### Start the Server

Para iniciar uno de los servidores web "reales", consulte su documentación. En muchos casos, iniciarlo implica ejecutar un comando llamado **`httpd`** ya sea desde la línea de comando o instruyendo al sistema operativo para que lo haga automáticamente cuando el sistema se inicia por primera vez.

Con **Tomcat 3.0**, inicia el servidor ejecutando un script llamado **`startup`** en el directorio de instalación principal. 

#### Compile e instale sus servlets

Una vez que haya configurado correctamente su **`CLASSPATH`**, como se describe anteriormente en esta sección, simplemente use **`javac ServletName.java`** para compilar un servlet. El archivo de clase resultante debe ir a una ubicación que el servidor sepa verificar durante la ejecución. Como era de esperar, esta ubicación varía de un servidor a otro. A continuación se incluye un breve resumen de las ubicaciones utilizadas por las últimas versiones de Tomcat, JSWDK y Java Web Server. En los tres casos, suponga que **`install_dir`** es el directorio de instalación principal del servidor.

#### Tomcat

* **`install_dir/webpages/WEB-INF/classes`**

   Ubicación estándar para clases de servlet..

* **`install_dir/classes`**

   Ubicación alternativa para las clases de servlet.

* **`install_dir/lib`**

   Ubicación de los archivos JAR que contienen clases.

#### Tomcat 3.1

Justo antes de que este libro fuera a la imprenta, Apache lanzó una versión beta de Tomcat 3.1. Si hay una versión final de esta versión disponible cuando vaya a descargar Tomcat, debe usarla. Aquí está la nueva organización de directorios que usa Tomcat 3.1:

* **`install_dir/webapps/ROOT/WEB-INF/classes`**

   Ubicación estándar para clases de servlet.

* **`install_dir/classes

   Ubicación alternativa para las clases de servlet.
   
* **`install_dir/lib

   Ubicación de los archivos JAR que contienen clases.

Me doy cuenta de que esto suena un poco abrumador. No se preocupe, lo guiaré a través del proceso con un par de servidores diferentes cuando presente un código de servlet real en el próximo capítulo.
