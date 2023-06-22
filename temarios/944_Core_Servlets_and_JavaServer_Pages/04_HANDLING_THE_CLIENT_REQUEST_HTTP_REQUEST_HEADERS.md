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

*El cliente puede usar este header para especificar una serie de opciones sobre cómo los servidores proxy deben almacenar en caché las páginas. Los servlets suelen ignorar el request header, pero el **`Cache-Control`** response header puede ser valioso para indicar que una página cambia constantemente y no debe almacenarse en caché. Consulte el Capítulo 7 (Generación de la respuesta del servidor: encabezados de respuesta HTTP) para obtener más información.*

***Connection***

*Este encabezado indica si el cliente puede o no manejar conexiones HTTP persistentes. Estos permiten que el cliente u otro navegador recupere varios archivos (por ejemplo, un archivo HTML y varias imágenes asociadas) con una sola conexión de socket, ahorrando la sobrecarga de negociar varias conexiones independientes. Con una solicitud HTTP 1.1, las conexiones persistentes son las predeterminadas y el cliente debe especificar un valor de cierre para que este encabezado use conexiones de estilo antiguo. En HTTP 1.0, un valor de keep-alive significa que se deben usar conexiones persistentes.*

*Cada solicitud HTTP da como resultado una nueva invocación de un servlet, independientemente de si la solicitud es una conexión separada. Es decir, el servidor invoca el servlet solo después de que el servidor ya haya leído la solicitud HTTP. Esto significa que los servlets necesitan ayuda del servidor para manejar conexiones persistentes. En consecuencia, el trabajo del servlet es solo hacer posible que el servidor use conexiones persistentes, lo que se hace enviando un encabezado de respuesta de longitud de contenido . La Sección 7.4 (Uso de conexiones HTTP persistentes) tiene un ejemplo detallado.*

***Content-Length***

*Este encabezado solo se aplica a las solicitudes POST y proporciona el tamaño de los datos POST en bytes. En lugar de llamar a request.getIntHeader("Content-Length") , simplemente puede usar request.getContentLength() . Sin embargo, dado que los servlets se encargan de leer los datos del formulario por usted (consulte el Capítulo 3 , "Manejo de la solicitud del cliente: datos del formulario"), es poco probable que use este encabezado explícitamente.*

***Content-Type***

*Aunque este encabezado generalmente se usa en las respuestas del servidor, también puede ser parte de las solicitudes del cliente cuando el cliente adjunta un documento como datos POST o cuando realiza solicitudes PUT . Puede acceder a este encabezado con el método abreviado getContentType de HttpServletRequest.*

***Cookie***

*Este encabezado se utiliza para devolver las cookies a los servidores que las enviaron previamente al navegador. Para obtener más información, consulte el Capítulo 8 (Manejo de cookies). Técnicamente, Cookie no es parte de HTTP 1.1. Originalmente era una extensión de Netscape, pero ahora es ampliamente compatible, tanto en Netscape como en Internet Explorer.*

***Expect***

*Este encabezado que rara vez se usa le permite al cliente decirle al servidor qué tipo de comportamientos espera. El único valor estándar para este encabezado, 100-continuar , lo envía un navegador que enviará un documento adjunto y quiere saber si el servidor lo aceptará. El servidor debe enviar un código de estado de 100 ( Continuar ) o 417 ( Expectativa fallida ) en tal caso. Para obtener más detalles sobre los códigos de estado HTTP, consulte el Capítulo 6 (Generación de la respuesta del servidor: códigos de estado HTTP).*

***From***

*Este encabezado proporciona la dirección de correo electrónico de la persona responsable de la solicitud HTTP. Los navegadores no envían este encabezado, pero las arañas web (robots) a menudo lo configuran como cortesía para ayudar a identificar la fuente de la sobrecarga del servidor o de solicitudes incorrectas repetidas.*

***Host***

*Los navegadores deben especificar este encabezado, que indica el host y el puerto tal como se indica en la URL original . Debido al reenvío de solicitudes y las máquinas que tienen varios nombres de host, es muy posible que el servidor no pueda determinar esta información de otra manera. Este encabezado no es nuevo en HTTP 1.1, pero en HTTP 1.0 era opcional, no obligatorio.*

***If-Match***

*Este encabezado de uso poco frecuente se aplica principalmente a las solicitudes PUT . El cliente puede proporcionar una lista de etiquetas de entidad tal como las devuelve el encabezado de respuesta de ETag , y la operación se realiza solo si una de ellas coincide.*

***If-Modified-Since***

*Este encabezado indica que el cliente quiere la página solo si se ha cambiado después de la fecha especificada. Esta opción es muy útil porque permite que los navegadores almacenen en caché los documentos y los vuelvan a cargar a través de la red solo cuando hayan cambiado. Sin embargo, los servlets no necesitan tratar directamente con este encabezado. En su lugar, deberían simplemente implementar el método getLastModified para que el sistema maneje las fechas de modificación automáticamente. Se proporciona una ilustración en la Sección 2.8 (Un ejemplo usando fechas de inicialización de servlet y modificación de página).*

***If-None-Match***

*Este encabezado es como If-Match, excepto que la operación debe realizarse solo si ninguna etiqueta de entidad coincide.*

***If-Range***

*Este encabezado, que rara vez se usa, permite que un cliente que tiene una copia parcial de un documento solicite las partes que faltan (si no se modificaron) o un documento nuevo completo (si se modificó desde una fecha específica).*

***If-Unmodified-Since***

*Este encabezado es como If-Modified-Since al revés, lo que indica que la operación debería tener éxito solo si el documento es anterior a la fecha especificada. Típicamente, Si-Modificado-Desdese usa para solicitudes GET ("dame el documento solo si es más nuevo que mi versión en caché"), mientras que If-Unmodified-Since se usa para solicitudes PUT ("actualice este documento solo si nadie más lo ha cambiado desde que lo generé ”).*

***Pragma***

*Un encabezado de Pragma con un valor de no caché indica que un servlet que actúa como proxy debe reenviar la solicitud incluso si tiene una copia local. El único valor estándar para este encabezado es no-cache.*

***Proxy-Authorization***

*Este encabezado permite que los clientes se identifiquen ante los proxies que lo requieran. Los servlets normalmente ignoran este encabezado y usan Autorización en su lugar.*

***Range***

*Este encabezado de uso poco frecuente permite que un cliente que tiene una copia parcial de un documento solicite solo las partes que faltan.*

***Referer***

*Este encabezado indica la URL de la página web de referencia. Por ejemplo, si está en la página web 1 y hace clic en un enlace a la página web 2, la URL de la página web 1 se incluye en el encabezado de referencia cuando el navegador solicita la página web 2. Todos los principales navegadores configuran este encabezado, por lo que es una forma útil de rastrear de dónde provienen las solicitudes. Esta capacidad es útil para realizar un seguimiento de los anunciantes que remiten a las personas a su sitio, para cambiar ligeramente el contenido según el sitio de referencia o simplemente para realizar un seguimiento de dónde proviene su tráfico. En el último caso, la mayoría de las personas simplemente confían en los archivos de registro del servidor web, ya que el Referer generalmente se registra allí. Aunque es útil, no confíe demasiado en el Recomendadorencabezado, ya que puede ser falsificado fácilmente por un cliente personalizado. Finalmente, tenga en cuenta que este encabezado es Referer , no el Referrer esperado , debido a un error de ortografía de uno de los autores originales de HTTP.*

***Upgrade***

*El encabezado Actualizar permite que el navegador u otro cliente especifique un protocolo de comunicación que prefiera sobre HTTP 1.1. Si el servidor también admite ese protocolo, tanto el cliente como el servidor pueden cambiar de protocolo. Este tipo de negociación de protocolo casi siempre se realiza antes de invocar el servlet. Por lo tanto, los servlets rara vez se preocupan por este encabezado.*

***User-Agent***

*Este encabezado identifica el navegador u otro cliente que realiza la solicitud y se puede usar para devolver contenido diferente a diferentes tipos de navegadores. Sin embargo, tenga cuidado con este uso; Confiar en una lista codificada de versiones de navegador y funciones asociadas puede generar un código de servlet poco confiable y difícil de modificar. Siempre que sea posible, utilice algo específico en los encabezados HTTP. Por ejemplo, en lugar de tratar de recordar qué navegadores admiten gzip en qué plataformas, simplemente marque el encabezado Aceptar codificación . Es cierto que esto no siempre es posible, pero cuando no lo es, debe preguntarse si la función específica del navegador que está utilizando realmente agrega valor suficiente para que valga la pena el costo de mantenimiento.*

*La mayoría de las versiones de Internet Explorer enumeran una versión de "Mozilla" (Netscape) primero en su línea de agente de usuario , con la versión real del navegador entre paréntesis. Esto se hace por compatibilidad con JavaScript, donde el encabezado User-Agent a veces se usa para determinar qué características de JavaScript son compatibles. También tenga en cuenta que este encabezado puede falsificarse fácilmente, un hecho que pone en duda la confiabilidad de los sitios que usan este encabezado para "mostrar" la penetración en el mercado de varias versiones de navegador. Hmm, millones de dólares en dinero de marketing que se basan en estadísticas que podrían ser sesgadas por un cliente personalizado escrito en menos de una hora, ¿y debería tomar esos números como precisos?*

***Via***

*Este encabezado lo establecen las puertas de enlace y los proxies para mostrar los sitios intermedios por los que pasó la solicitud.*

***Warning***

*Este encabezado general que rara vez se usa permite a los clientes advertir sobre errores de almacenamiento en caché o transformación de contenido.*
