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

