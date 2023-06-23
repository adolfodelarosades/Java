# Capítulo 4. MANEJO DE LA REQUEST DEL CLIENTE: HTTP REQUEST HEADERS

Temas de este capítulo

* Lectura de HTTP request headers desde servlets
* Creación de una tabla de todos los request headers
* El propósito de cada uno de los HTTP 1.1 request headers
* Reducir los tiempos de descarga mediante la compresión de páginas
* Restricción del acceso con servlets protegidos por contraseña(password)


Una de las claves para crear servlets efectivos es comprender cómo manipular el **HyperText Transfer Protocol (HTTP)**. Obtener una comprensión completa de este protocolo no es un tema teórico esotérico, sino más bien un problema práctico que puede tener un impacto inmediato en el rendimiento y la usabilidad de sus servlets. Este capítulo analiza la información HTTP que se envía desde el navegador al servidor en forma de request headers. Explica cada uno de los HTTP 1.1 request headers, resumiendo cómo y por qué se usarían en un servlet. El capítulo también incluye tres ejemplos detallados: enumerar todos los request headers enviados por el navegador, reducir el tiempo de descarga al codificar la página web con gzip cuando corresponda y establecer un control de acceso basado en contraseña para servlets.

Tenga en cuenta que los HTTP request headers son distintos de los datos del formulario discutidos en el capítulo anterior. Los Form data resultan directamente de la entrada del usuario y se envían como parte de la URL para las **`GET`** requests y en una línea separada para las **`POST`** requests. Los request headers, por otro lado, los establece indirectamente el navegador y se envían inmediatamente después de la línea de requests **`GET`** o **`POST`** inicial. Por ejemplo, el siguiente ejemplo muestra una HTTP request que podría resultar del envío de una request de búsqueda de libros a un servlet en http://www.somebookstore.com/search. La request incluye los headers **`Accept`**, **`Accept-Encoding`**, **`Connection`**, **`Cookie`**, **`Host`**, **`Referer`** y **`User-Agent`**, lo cual puede ser importante para el funcionamiento del servlet, pero ninguno de los cuales puede derivarse de los datos del formulario o deducirse automáticamente: el servlet necesita leer explícitamente los request headers para hacer uso de esta información.

```sh
GET /search?keywords=servlets+jsp HTTP/1.1
Accept: image/gif, image/jpg, */*
Accept-Encoding: gzip
Connection: Keep-Alive
Cookie: userID=id456578
Host: www.somebookstore.com
Referer: http://www.somebookstore.com/findbooks.html
User-Agent: Mozilla/4.7 [en] (Win98; U)
```

## 4.1. Lectura de Request Headers de Servlets

La lectura de headers es sencilla; simplemente llame al método **`getHeader`** de **`HttpServletRequest`**, que devuelve un **`String`** si el header especificado se proporcionó en esta request, **`null`** de lo contrario. Los Header names no distinguen entre mayúsculas y minúsculas. Entonces, por ejemplo, **`request.getHeader("Connection")`** y **`request.getHeader("connection")`** son intercambiables.

Aunque **`getHeader`** es la forma general de leer headers entrantes, hay un par de headers que se usan con tanta frecuencia que tienen métodos de acceso especiales en **`HttpServletRequest`**. Los enumeraré aquí, y recuerde que el Apéndice A (Servlet and JSP Quick Reference) brinda un resumen de sintaxis por separado.

* **`getCookies`**

   El método **`getCookies`** devuelve el contenido del **`Cookie`** header, analizado y almacenado en una array de objetos **`Cookie`**. Este método se analiza más en el Capítulo 8 (Handling Cookies).

* **`getAuthType`** y **`getRemoteUser`**

Los métodos **`getAuthType`** y **`getRemoteUser`** dividen el header **`Authorization`** en sus componentes. El uso del header **`Authorization`** se ilustra en la Sección 4.5 (Restricting Access to Web Pages).

* **`getContentLength`**

   El método **`getContentLength`** devuelve el valor del header **` Content-Length`** (como un **`int`** ).

* **`getContentType`**

   El método **`getContentType`** devuelve el valor del encabezado **`Content-Type`** (como una **`String`** ).

* **`getDateHeader`** y **`getIntHeader`**

   Los métodos **`getDateHeader`** y **`getIntHeader`** leen el header especificado y luego los convierten a valores de **`Date`** e **`int`**, respectivamente.

* **`getHeaderNames`**

   En lugar de buscar un header en particular, puede usar el método **`getHeaderNames`** para obtener una **`Enumeration`** de todos los nombres de header recibidos en esta request en particular. Esta capacidad se ilustra en la Sección 4.2 (Printing All Headers).

* **`getHeaders`**

   En la mayoría de los casos, cada nombre de header aparece solo una vez en la request. De vez en cuando, sin embargo, un header puede aparecer varias veces, y cada aparición enumera un valor separado. **`Accept-Language`** es uno de esos ejemplos. Si se repite un nombre de header en la request, ***los servlets de la versión 2.1 no pueden acceder a los valores posteriores sin leer el flujo de entrada sin procesar***, ya que **`getHeader`** devuelve el valor de la primera aparición del encabezado únicamente. Sin embargo, en la versión 2.2, **`getHeaders`** devuelve una **`Enumeration`** de los valores de todas las apariciones del header.

Finalmente, además de buscar los request headers, puede obtener información sobre la línea principal de la request, también por medio de métodos en **`HttpServletRequest`**.

* **`getMethod`**

   El método **`getMethod`** devuelve el método request principal (normalmente **`GET`** o **`POST`**, pero son posibles cosas como **`HEAD`**, **`PUT`** y **`DELETE`** ).

* **`getRequestURI`**

   El método **`getRequestURI`** devuelve la parte de la URL que viene después del host y el puerto, pero antes de los datos del formulario. Por ejemplo, para una URL de http://randomhost.com/servlet/search.BookSearch, **`getRequestURI`** devolvería **`/servlet/search.BookSearch`**.

* **`getProtocol`**

   Por último, el método **`getProtocol`** devuelve la tercera parte de la línea de request, que generalmente es **`HTTP/1.0`** o **`HTTP/1.1`**. Los servlets generalmente deben verificar **`getProtocol`** antes de especificar los response headers ( Capítulo 7 ) que son específicos de **`HTTP/1.1`**.

## 4.2. Impresión de Todos los Headers

El Listado 4.1 muestra un servlet que simplemente crea una tabla de todos los headers que recibe, junto con sus valores asociados. También imprime los tres componentes de la línea de request principal (method, URI y protocol). Las Figuras 4-1 y 4-2 muestran resultados típicos con Netscape e Internet Explorer.

**Figura 4-1. Request headers enviados por Netscape 4.7 en Windows 98.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/f18fd32a-b76e-4a93-83d7-0db456f03da6)


**Figura 4-2. Request headers enviados por Internet Explorer 5 en Windows 98.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/f356b0bf-58a6-4406-aa37-67bd27d442d7)


**Listado 4.1. `ShowRequestHeaders.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/** Shows all the request headers sent on this
 *  particular request.
 */

public class ShowRequestHeaders extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Servlet Example: Showing Request Headers";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=CENTER>" + title + "</H1>\n" +
                "<B>Request Method: </B>" +
                request.getMethod() + "<BR>\n" +
                "<B>Request URI: </B>" +
                request.getRequestURI() + "<BR>\n" +
                "<B>Request Protocol: </B>" +
                request.getProtocol() + "<BR><BR>\n" +
                "<TABLE BORDER=1 ALIGN=CENTER>\n" +
                "<TR BGCOLOR=\"#FFAD00\">\n" +
                "<TH>Header Name<TH>Header Value");
    Enumeration headerNames = request.getHeaderNames();
    while(headerNames.hasMoreElements()) {
      String headerName = (String)headerNames.nextElement();
      out.println("<TR><TD>" + headerName);
      out.println("    <TD>" + request.getHeader(headerName));
    }
    out.println("</TABLE>\n</BODY></HTML>");
  }

  /** Let the same servlet handle both GET and POST. */

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
```

## 4.3. HTTP 1.1 Request Headers
  
El acceso a los Request Headers permite que los servlets realicen una serie de optimizaciones y proporcionen una serie de características que de otro modo no serían posibles. Esta sección presenta cada uno de los posibles Request Headers HTTP 1.1 junto con un breve resumen de cómo los servlets pueden usarlos. Las siguientes secciones dan ejemplos más detallados.

Tenga en cuenta que HTTP 1.1 admite un superconjunto de headers permitidos en HTTP 1.0. Para obtener detalles adicionales sobre estos headers, consulte la especificación HTTP 1.1, proporcionada en RFC 2616. Hay varios lugares donde los RFC oficiales se archivan en línea; su mejor opción es comenzar en http://www.rfc-editor.org/ para obtener una lista actualizada de los sitios de archivo.

***Accept***

*Este header especifica los MIME types que el navegador u otro cliente puede manejar. Un servlet que puede devolver un recurso en más de un formato puede examinar el header **`Accept`** para decidir qué formato usar. Por ejemplo, las imágenes en formato PNG tienen algunas ventajas de compresión sobre las de formato GIF, pero solo unos pocos navegadores admiten PNG. Si tuviera imágenes en ambos formatos, un servlet podría llamar a **`request.getHeader("Accept")`**, verificar **`image/png`** y, si lo encuentra, usar nombres de archivo **`xxx.png`** en todos los elementos **`IMG`** que genera. De lo contrario, solo usaría **`xxx.gif`**.*

*Consulte la Tabla 7.1 en la Sección 7.2 (HTTP 1.1 Response Headers and Their Meaning) para conocer los nombres y significados de los MIME types comunes.*

***Accept-Charset***

*Este header indica los juegos de caracteres (p. ej., ISO-8859-1) que puede usar el navegador.*

***Accept-Encoding***

*Este header designa los tipos de codificaciones que el cliente sabe manejar. Si recibe este header, el servidor es libre de codificar la página utilizando el formato especificado (generalmente para reducir el tiempo de transmisión), enviando el **`Content-Encoding`** response header para indicar que lo ha hecho. Este tipo de codificación es completamente distinto del MIME type del documento real ( tal como se especifica en el **`Content-Type`** response header ), ya que esta codificación se invierte antes de que el navegador decida qué hacer con el contenido. Por otro lado, usar una codificación que el navegador no entiende da como resultado páginas totalmente incomprensibles. En consecuencia, es fundamental que marque explícitamente la codificación de **`Accept-Encoding`** header antes de usar cualquier tipo de codificación de contenido. Los valores de **`gzip`** o **`compress`** son las dos posibilidades estándar.*

*Comprimir páginas antes de devolverlas es un servicio muy valioso porque es probable que el tiempo de decodificación sea pequeño en comparación con el ahorro en el tiempo de transmisión. Consulte la Sección 4.4 (Sending Compressed Web Pages) para ver un ejemplo en el que la compresión reduce los tiempos de descarga en un factor de 10.*

***Accept-Language***

*Este header especifica los languages preferidos del cliente, en caso de que el servlet pueda producir resultados en más de un idioma. El valor del header debe ser uno de los códigos de idioma estándar, como **`en`**, **`en-us`**, **`da`** etc. Consulte RFC 1766 para obtener más información.*

***Authorization***

*Los clientes utilizan este header para identificarse cuando acceden a páginas web protegidas con contraseña. Consulte la Sección 4.5 (Restricting Access to Web Pages) para ver un ejemplo.*

***Cache-Control***

*El cliente puede usar este header para especificar una serie de opciones sobre cómo los servidores proxy deben almacenar en caché las páginas. Los servlets suelen ignorar el request header, pero el **`Cache-Control`** response header puede ser valioso para indicar que una página cambia constantemente y no debe almacenarse en caché. Consulte el Capítulo 7 (Generating the Server Response: HTTP Response Headers) para obtener más información.*

***Connection***

*Este encabezado indica si el cliente puede o no manejar conexiones HTTP persistentes. Estos permiten que el cliente u otro navegador recupere varios archivos (por ejemplo, un archivo HTML y varias imágenes asociadas) con una sola conexión de socket, ahorrando la sobrecarga de negociar varias conexiones independientes. Con una HTTP 1.1 request, las conexiones persistentes son las predeterminadas y el cliente debe especificar un valor **`close`** para que este encabezado use conexiones de estilo antiguo. En HTTP 1.0, un valor **`keep-alive`** significa que se deben usar conexiones persistentes.*

*Cada HTTP request da como resultado una nueva invocación de un servlet, independientemente de si la request es una conexión separada. Es decir, el servidor invoca el servlet solo después de que el servidor ya haya leído la  HTTP request. Esto significa que los servlets necesitan ayuda del servidor para manejar conexiones persistentes. En consecuencia, el trabajo del servlet es solo hacer posible que el servidor use conexiones persistentes, lo que se hace enviando un **`Content-Length`** response header. La Sección 7.4 (Using Persistent HTTP Connections) tiene un ejemplo detallado.*

***Content-Length***

*Este encabezado solo se aplica a las requests **`POST`** y proporciona el tamaño de los datos **`POST`** en bytes. En lugar de llamar a **`request.getIntHeader("Content-Length")`**, simplemente puede usar **`request.getContentLength()`**. Sin embargo, dado que los servlets se encargan de leer los datos del formulario por usted (consulte el Capítulo 3, "Handling the Client Request: Form Data"), es poco probable que use este header explícitamente.*

***Content-Type***

*Aunque este header generalmente se usa en las responses del servidor, también puede ser parte de las requests del cliente cuando el cliente adjunta un documento como datos **`POST`** o cuando realiza requests **`PUT`**. Puede acceder a este header con el método abreviado **`getContentType`** de **`HttpServletRequest`**.*

***Cookie***

*Este header se utiliza para devolver las cookies a los servidores que las enviaron previamente al navegador. Para obtener más información, consulte el Capítulo 8 (Handling Cookies). Técnicamente, **`Cookie`** no es parte de HTTP 1.1. Originalmente era una extensión de Netscape, pero ahora es ampliamente compatible, tanto en Netscape como en Internet Explorer.*

***Expect***

*Este header que rara vez se usa le permite al cliente decirle al servidor qué tipo de comportamientos espera. El único valor estándar para este header, **`100-continue`**, lo envía un navegador que enviará un documento adjunto y quiere saber si el servidor lo aceptará. El servidor debe enviar un código de estado de 100 ( **`Continue`** ) o 417 ( **`Expectation Failed`** ) en tal caso. Para obtener más detalles sobre los HTTP status codes, consulte el Capítulo 6 (Generating the Server Response: HTTP Status Codes).*

***From***

*Este header proporciona la dirección de correo electrónico de la persona responsable de la HTTP request. Los navegadores no envían este header, pero las Web spiders (robots) a menudo lo configuran como cortesía para ayudar a identificar la fuente de la sobrecarga del servidor o de requests incorrectas repetidas.*

***Host***

*Los navegadores deben especificar este header, que indica el host y el port(puerto) tal como se indica en la URL original. Debido al request forwarding(reenvío de solicitudes) y las máquinas que tienen varios nombres de host, es muy posible que el servidor no pueda determinar esta información de otra manera. Este header no es nuevo en HTTP 1.1, pero en HTTP 1.0 era opcional, no obligatorio.*

***If-Match***

*Este header de uso poco frecuente se aplica principalmente a las requests **`PUT`**. El cliente puede proporcionar una lista de etiquetas de entidad tal como las devuelve el response header **`ETag`**, y la operación se realiza solo si una de ellas coincide.*

***If-Modified-Since***

*Este header indica que el cliente quiere la página solo si se ha cambiado después de la fecha especificada. Esta opción es muy útil porque permite que los navegadores almacenen en caché los documentos y los vuelvan a cargar a través de la red solo cuando hayan cambiado. Sin embargo, los servlets no necesitan tratar directamente con este header. En su lugar, deberían simplemente implementar el método **`getLastModified`** para que el sistema maneje las fechas de modificación automáticamente. Se proporciona una ilustración en la Sección 2.8 (An Example Using Servlet Initialization and Page Modification Dates).*

***If-None-Match***

*Este header es como **`If-Match`**, excepto que la operación debe realizarse solo si ninguna tags de entidad coincide.*

***If-Range***

*Este header, que rara vez se usa, permite que un cliente que tiene una copia parcial de un documento solicite las partes que faltan (si no se modificaron) o un documento nuevo completo (si se modificó desde una fecha específica).*

***If-Unmodified-Since***

*Este header es como **`If-Modified-Since`** al revés, lo que indica que la operación debería tener éxito solo si el documento es anterior a la fecha especificada. Típicamente, **`If-Modified-Since`** se usa para requests **`GET`** ("dame el documento solo si es más nuevo que mi versión en caché"), mientras que **`If-Unmodified-Since`** se usa para requests **`PUT`** ("actualice este documento solo si nadie más lo ha cambiado desde que lo generé”).*

***Pragma***

*Un header **`Pragma`** con un valor **`no-cache`** indica que un servlet que actúa como proxy debe reenviar la request incluso si tiene una copia local. El único valor estándar para este header es **`no-cache`**.*

***Proxy-Authorization***

*Este header permite que los clientes se identifiquen ante los proxies que lo requieran. Los servlets normalmente ignoran este header y usan **`Authorization`** en su lugar.*

***Range***

*Este header de uso poco frecuente permite que un cliente que tiene una copia parcial de un documento solicite solo las partes que faltan.*

***Referer***

*Este header indica la URL de la página web de referencia. Por ejemplo, si está en la página web 1 y hace clic en un enlace a la página web 2, la URL de la página web 1 se incluye en el header **`Referer`** cuando el navegador solicita la página web 2. Todos los principales navegadores configuran este header, por lo que es una forma útil de rastrear de dónde provienen las requests. Esta capacidad es útil para realizar un seguimiento de los anunciantes que remiten a las personas a su sitio, para cambiar ligeramente el contenido según el sitio de referencia o simplemente para realizar un seguimiento de dónde proviene su tráfico. En el último caso, la mayoría de las personas simplemente confían en loslog files del servidor web, ya que **`Referer`** generalmente se registra allí. Aunque es útil, no confíe demasiado en el header **`Referer`**, ya que puede ser falsificado fácilmente por un cliente personalizado. Finalmente, tenga en cuenta que este header es **`Referer`**, no el **`Referrer`** esperado, debido a un error de ortografía de uno de los autores originales de HTTP.*

***Upgrade***

*El header **`Upgrade`** permite que el navegador u otro cliente especifique un protocolo de comunicación que prefiera sobre HTTP 1.1. Si el servidor también admite ese protocolo, tanto el cliente como el servidor pueden cambiar de protocolo. Este tipo de negociación de protocolo casi siempre se realiza antes de invocar el servlet. Por lo tanto, los servlets rara vez se preocupan por este header.*

***User-Agent***

*Este header identifica el navegador u otro cliente que realiza la request y se puede usar para devolver contenido diferente a diferentes tipos de navegadores. Sin embargo, tenga cuidado con este uso; Confiar en una lista codificada de versiones de navegador y funciones asociadas puede generar un código de servlet poco confiable y difícil de modificar. Siempre que sea posible, utilice algo específico en los encabezados HTTP. Por ejemplo, en lugar de tratar de recordar qué navegadores admiten gzip en qué plataformas, simplemente marque el header **`Accept-Encoding`**. Es cierto que esto no siempre es posible, pero cuando no lo es, debe preguntarse si la función específica del navegador que está utilizando realmente agrega valor suficiente para que valga la pena el costo de mantenimiento.*

*La mayoría de las versiones de Internet Explorer enumeran una versión de "Mozilla" (Netscape) primero en su línea de **`User-Agent`**, con la versión real del navegador entre paréntesis. Esto se hace por compatibilidad con JavaScript, donde el header **`User-Agent`** a veces se usa para determinar qué características de JavaScript son compatibles. También tenga en cuenta que este header puede falsificarse fácilmente, un hecho que pone en duda la confiabilidad de los sitios que usan este header para "mostrar" la penetración en el mercado de varias versiones de navegador. Hmm, millones de dólares en dinero de marketing que se basan en estadísticas que podrían ser sesgadas por un cliente personalizado escrito en menos de una hora, ¿y debería tomar esos números como precisos?*

***Via***

*Este header lo establecen los gateways y proxies para mostrar los sitios intermedios por los que pasó la request.*

***Warning***

*Este header general que rara vez se usa permite a los clientes advertir sobre errores de almacenamiento en caché o transformación de contenido.*

## 4.4. Envío de Páginas Web Comprimidas

Varios navegadores recientes saben cómo manejar el contenido comprimido con gzip, descomprimen automáticamente los documentos que están marcados con el header de **`Content-Encoding`** y luego tratan el resultado como si fuera el documento original. El envío de este tipo de contenido comprimido puede ser un verdadero ahorro de tiempo, ya que el tiempo necesario para comprimir el documento en el servidor y luego descomprimirlo en el cliente suele ser eclipsado por los ahorros en el tiempo de descarga, especialmente cuando se utilizan conexiones de acceso telefónico.

Los navegadores que admiten la codificación de contenido incluyen la mayoría de las versiones de Netscape para Unix, la mayoría de las versiones de Internet Explorer para Windows y Netscape 4.7 y posteriores para Windows. Las versiones anteriores de Netscape en Windows e Internet Explorer en plataformas que no son de Windows generalmente no admiten la codificación de contenido. Afortunadamente, los navegadores que admiten esta función indican que lo hacen configurando el **`Accept-Encoding`** request header. El listado 4.2 muestra un servlet que verifica este header, enviando una página web comprimida a los clientes que admiten la codificación gzip y enviando una página web normal a aquellos que no la admiten. El resultado mostró una aceleración de diez veces de la página comprimida cuando se utilizó una conexión de acceso telefónico. En pruebas repetidas con Netscape 4.7 e Internet Explorer 5.0 en una conexión de módem de 28,8 K, ***la página comprimida promedió menos de 5 segundos para descargarse por completo, mientras que la página sin comprimir tardó más de 50 segundos***.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/150b4cce-cb7c-434d-ae50-98389b7d836b)

**Core Tip**

   :atom: La compresión Gzip puede reducir drásticamente el tiempo de descarga de páginas de texto largas.

La implementación de la compresión es sencilla, ya que el formato gzip está integrado en los lenguajes de programación Java a través de clases en **`java.util.zip`**. El servlet primero verifica el header **`Accept-Encoding`** para ver si contiene una entrada para gzip. Si es así, usa un **`GZIPOutputStream`** para generar la página, especificando gzip como el valor del header **`Content-Encoding`**. Debe llamar explícitamente a cerrar cuando use un **`GZIPOutputStream`**. Si no se admite gzip, el servlet utiliza el **`PrintWriter`** normal para enviar la página. Para facilitar la creación de puntos de referencia(benchmarks) con un solo navegador, también agregué una función mediante la cual se podía suprimir la compresión al incluir **`?encoding=none`** al final de la URL.

**Listado 4.2. `EncodedPage.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.zip.*;

/** Example showing benefits of gzipping pages to browsers
 *  that can handle gzip.
 */

public class EncodedPage extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    String encodings = request.getHeader("Accept-Encoding");
    String encodeFlag = request.getParameter("encoding");

    PrintWriter out;
    String title;
    if ((encodings != null) &&
        (encodings.indexOf("gzip") != -1) &&
        !"none".equals(encodeFlag)) {
      title = "Page Encoded with GZip";
      OutputStream out1 = response.getOutputStream();
      out = new PrintWriter(new GZIPOutputStream(out1), false);
      response.setHeader("Content-Encoding", "gzip");
   } else {
      title = "Unencoded Page";
      out = response.getWriter();
   }
   out.println(ServletUtilities.headWithTitle(title) +
               "<BODY BGCOLOR=\"#FDF5E6\">\n" +
               "<H1 ALIGN=CENTER>" + title + "</H1>\n");
   String line = "Blah, blah, blah, blah, blah. " +
                 "Yadda, yadda, yadda, yadda.";
   for(int i=0; i<10000; i++) {
      out.println(line);
   }
   out.println("</BODY></HTML>");
   out.close();
  }
}
```

**Figura 4-3. Dado que la versión de Windows de Internet Explorer 5.0 es compatible con gzip, esta página se envió con gzip a través de la red y el navegador la reconstituyó, lo que resultó en un gran ahorro en el tiempo de descarga.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/29e32417-2e87-41e6-a44e-da1bb4a2bcfc)

## 4.5. Restricción del Acceso a las Páginas Web

Muchos servidores web admiten mecanismos estándar para limitar el acceso a páginas web designadas. Estos mecanismos pueden aplicarse tanto a páginas estáticas como a las generadas por servlets, por lo que muchos autores utilizan sus mecanismos específicos del servidor para restringir el acceso a los servlets. Además, la mayoría de los usuarios de los sitios de comercio electrónico prefieren utilizar formularios HTML normales para proporcionar información de autorización, ya que estos formularios son más familiares, pueden proporcionar más información explicativa y pueden solicitar información adicional además de un nombre de usuario y una contraseña. Una vez que un servlet que usa acceso basado en formularios otorga acceso inicial a un usuario, usaría el seguimiento de sesión para darle acceso al usuario a otras páginas que requieren el mismo nivel de autorización. Consulte el Capítulo 9 (Session Tracking - Seguimiento de sesión) para obtener más información.

No obstante, el control de acceso basado en formularios requiere más esfuerzo por parte del desarrollador del servlet, y la autorización basada en HTTP es suficiente para muchas aplicaciones simples. Aquí hay un resumen de los pasos involucrados para la autorización "básica-basic". También hay una variación ligeramente mejor llamada autorización "digest-resumida", pero entre los principales navegadores, solo Internet Explorer la admite.

1. Compruebe si hay un header **`Authorization`**. Si no hay tal header, vaya al Paso 2. Si lo hay, omita la palabra "basic" e invierta la codificación base64 de la parte restante. Esto da como resultado una cadena de la forma **`username:password`**. Verifique el username y la password con algún conjunto almacenado. Si coincide, devuelve la página. Si no, vaya al Paso 2.

2. Devuelve un código de respuesta 401 ( **`Unauthorized`** ) y un header con el siguiente formato:

   ```sh
   WWW-Authenticate: BASIC realm="some-name"
   ```

   Esta response le indica al navegador que abra un cuadro de diálogo emergente que le indica al usuario que ingrese un name y password para **`some-name`**, luego que vuelva a conectarse con ese name y password incrustados en una single base64 string dentro del header **`Authorization`**.

Si le interesan los detalles, la codificación base64 se explica en RFC 1521 (recuerde, para recuperar RFC, comience en http://www.rfc-editor.org/ para obtener una lista actualizada de los sitios de archivo de RFC). Sin embargo, probablemente solo hay dos cosas que debe saber al respecto. En primer lugar, no pretende proporcionar seguridad, ya que la codificación se puede revertir fácilmente. Por lo tanto, no elimina la necesidad de **SSL** para frustrar a los atacantes que podrían espiar su conexión de red (una tarea nada fácil a menos que estén en su subred local). **SSL**, o **Secure Sockets Layer**, ***es una variación de HTTP en la que se cifra todo el flujo***. Es compatible con muchos servidores comerciales y generalmente se invoca usando **`https`** en la URL en lugar de **`http`**. Los servlets pueden ejecutarse en **servidores SSL** con la misma facilidad que en servidores estándar, y el cifrado y el descifrado se gestionan de forma transparente antes de que se invoquen los servlets. El segundo punto que debe saber sobre la codificación en base64 es que **Sun** proporciona la clase **`sun.misc.BASE64Decoder`**, distribuida con JDK 1.1 y 1.2, para decodificar cadenas codificadas con base64. Solo tenga en cuenta que las clases en la jerarquía de paquetes de Sun no forman parte de la especificación oficial del lenguage y, por lo tanto, no se garantiza que aparezcan en todas las implementaciones. Por lo tanto, si usa esta clase de decodificador, asegúrese de incluir explícitamente el archivo de clase cuando distribuya su aplicación.

El listado 4.3 presenta un servlet protegido por contraseña. Está registrado explícitamente con el servidor Web bajo el nombre **`SecretServlet`**. El proceso para registrar servlets varía de un servidor a otro, pero la Sección 2.7 (An Example Using Initialization Parameters) brinda detalles sobre el proceso para Tomcat, JSWDK y Java Web Server. La razón por la que se registra el servlet es para que los parámetros de inicialización puedan asociarse con él, ya que la mayoría de los servidores no le permiten establecer parámetros de inicialización para servlets que están disponibles simplemente por estar en el directorio de servlets (o equivalente ). El parámetro de inicialización da la ubicación de un archivo **`Properties`** que almacena nombres de usuario y contraseñas. Si la seguridad de la página fuera muy importante, desearía cifrar las contraseñas para que el acceso al archivo de propiedades no equivalga al conocimiento de las contraseñas.

Además de leer el header **`Authorization`**, el servlet especifica un status code 401 y establece el header **`WWW-Authenticate`** saliente. Los status codes se analizan en detalle en el Capítulo 6 (Generating the Server Response: HTTP Status Codes), pero por ahora, solo tenga en cuenta que transmiten información de alto nivel al navegador y, por lo general, deben configurarse siempre que la response sea distinta de el documento solicitado. La forma más común de establecer status codes es mediante el uso del método **`setStatus`** de **`HttpServletResponse`** y, por lo general, proporciona una constante en lugar de un número entero explícito para que el código sea más claro y evitar errores tipográficos.

**`WWW-Authenticate`** y otros HTTP response headers se analizan en el Capítulo 7 (Generating the Server Response: HTTP Response Headers), pero por ahora tenga en cuenta que transmiten información auxiliar para respaldar la response especificada por el status code, y se configuran comúnmente a través del uso del método **`setHeader`** de **`HttpServletResponse`**.

Las Figuras 4-4 , 4-5 y 4-6 muestran el resultado cuando un usuario intenta acceder a la página por primera vez, después de que el usuario ingresa una contraseña desconocida y después de que el usuario ingresa una contraseña conocida. El listado 4.4 proporciona el programa que creó el archivo de contraseña simple.

**Figura 4-4. Resultado inicial al acceder a `SecretServlet` (el nombre registrado para el servlet `ProtectedPage `).**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/28dfd97a-a3e4-4a74-a8f2-332af168c4e3)


**Figura 4-5. Resultado después de ingresar un nombre o contraseña incorrectos.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/5827b8e6-a1e2-4645-a455-3ab3944a6272)


**Figura 4-6. Resultado después de ingresar nombre y contraseña conocidos.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/bb912f46-6aa1-416f-ab8e-2aa308a267b7)


**Listado 4.3. `ProtectedPage.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Properties;
import sun.misc.BASE64Decoder;

/** Example of password-protected pages handled directly
 *  by servlets.
 */

public class ProtectedPage extends HttpServlet {
  private Properties passwords;
  private String passwordFile;

  /** Read the password file from the location specified
   *  by the passwordFile initialization parameter.
   */

  public void init(ServletConfig config)
      throws ServletException {
    super.init(config);
    try {
      passwordFile = config.getInitParameter("passwordFile");
      passwords = new Properties();
      passwords.load(new FileInputStream(passwordFile));
    } catch(IOException ioe) {}
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String authorization = request.getHeader("Authorization");
    if (authorization == null) {
      askForPassword(response);
    } else {
      String userInfo = authorization.substring(6).trim();
      BASE64Decoder decoder = new BASE64Decoder();
      String nameAndPassword =
        new String(decoder.decodeBuffer(userInfo));
      int index = nameAndPassword.indexOf(":");
      String user = nameAndPassword.substring(0, index);
      String password = nameAndPassword.substring(index+1);
      String realPassword = passwords.getProperty(user);
      if ((realPassword != null) &&
          (realPassword.equals(password))) {
        String title = "Welcome to the Protected Page";
        out.println(ServletUtilities.headWithTitle(title) +
                    "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                    "<H1 ALIGN=CENTER>" + title + "</H1>\n" +
                    "Congratulations. You have accessed a\n" +
                    "highly proprietary company document.\n" +
                    "Shred or eat all hardcopies before\n" +
                    "going to bed tonight.\n" +
                    "</BODY></HTML>");
      } else {
        askForPassword(response);
      }
    }
  }

  // If no Authorization header was supplied in the request.

  private void askForPassword(HttpServletResponse response) {
    response.setStatus(response.SC_UNAUTHORIZED); // Ie 401
						response.setHeader("WWW-Authenticate",
						"BASIC realm=\"privileged-few\"");
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
```

**Listado 4.4. Generador de `PasswordBuilder.java`**

```java
import java.util.*;
import java.io.*;

/** Application that writes a simple Java properties file
 *  containing usernames and associated passwords.
 */

public class PasswordBuilder {
  public static void main(String[] args) throws Exception {
    Properties passwords = new Properties();
    passwords.put("marty", "martypw");
    passwords.put("bj", "bjpw");
    passwords.put("lindsay", "lindsaypw");
    passwords.put("nathan", "nathanpw");
    // This location should *not* be Web-accessible.
    String passwordFile =
      "C:\\JavaWebServer2.0\\data\\passwords.properties";
    FileOutputStream out = new FileOutputStream(passwordFile);
    // Using JDK 1.1 for portability among all servlet
    // engines. In JDK 1.2, use "store" instead of "save"
    // to avoid deprecation warnings.
    passwords.save(out, "Passwords");
  }
}
```
