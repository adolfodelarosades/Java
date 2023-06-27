# Capítulo 6. Generación de la Response del Servidor: HTTP Status Codes

Temas de este capítulo

* El propósito de los HTTP status codes
* La forma de especificar status codes de servlets
* El significado de cada uno de los valores del status codes HTTP 1.1
* Un servlet que utiliza status codes para redirigir a los usuarios a otros sitios y para informar errores.

Cuando un servidor web responde a una solicitud de un navegador u otro cliente web, la respuesta generalmente consta de una status line, algunos response headers, una línea en blanco y el documento. Aquí hay un ejemplo mínimo:

```sh
HTTP/1.1 200 OK
Content-Type: text/plain

Hello World
```

La status line consta de la versión HTTP ( **`HTTP/1.1`** en el ejemplo anterior), un status code (un número entero; 200 en el ejemplo anterior) y un mensaje muy breve correspondiente al status code ( **`OK`** en el ejemplo). En la mayoría de los casos, todos los headers son opcionales, excepto **`Content-Type`**, que especifica el MIME type del documento que sigue. Aunque la mayoría de las responses contienen un documento, algunas no. Por ejemplo, las responses a las requests **`HEAD`** nunca deben incluir un documento, y hay una variedad de status code que esencialmente indican una falla y no incluyen un documento o incluyen solo un breve documento de mensaje de error.

Los servlets pueden realizar una variedad de tareas importantes manipulando la status line y los response headers. Por ejemplo, pueden reenviar(forward) al usuario a otros sitios; indicar que el documento adjunto es una imagen, un archivo de Adobe Acrobat o un archivo HTML; decirle al usuario que se requiere una contraseña para acceder al documento; etc. Este capítulo analiza los diversos status code y lo que se puede lograr con ellos, y el siguiente capítulo analiza los response headers.

## 6.1. Especificación de Status Codes

Como se acaba de describir, la status line de HTTP response consta de una HTTP version, un status code y un mensaje asociado. Dado que el mensaje está directamente asociado con el status code y la HTTP version está determinada por el servidor, todo lo que necesita hacer un servlet es establecer el status code. La forma de hacerlo es mediante el método **`setStatus`** de **`HttpServletResponse`**. Si su respuesta incluye un status code especial y un documento, asegúrese de llamar a **`setStatus`** antes de devolver el contenido a través de **`PrintWriter`**. Esto se debe a que una HTTP response consta de la status line, uno o más headers, una línea en blanco y el documento actual, en ese orden. Los headers pueden aparecer en cualquier orden, y los servlets almacenan los headers y los envían todos a la vez, por lo que es legal configurar el status code (parte de la primera línea devuelta) incluso después de configurar los headers. Pero los servlets no necesariamente almacenan en búfer el documento en sí, ya que los usuarios pueden querer ver resultados parciales para páginas largas. En la versión 2.1 de la especificación del servlet, la salida de **`PrintWriter`** no se almacena en búfer, por lo que la primera vez que usa **`PrintWriter`**, es demasiado tarde para volver atrás y establecer headers. En la versión 2.2, los motores de servlet pueden almacenar en búfer parcialmente la salida, pero el tamaño del búfer no se especifica. Puede usar el método **`getBufferSize`** de **`HttpServletResponse`** para determinar el tamaño o usar **`setBufferSize`** para especificarlo. En la versión 2.2 con el almacenamiento en búfer habilitado, puede establecer status codes hasta que el búfer se llene y se envíe realmente al cliente. Si no está seguro de si se envió el búfer, puede usar el método **`isCommitted`** para verificar.

**Core Approach**
	
   :atom: Asegúrese de configurar los status codes antes de enviar el contenido de cualquier documento al cliente.


El método **`setStatus`** toma un **`int`** (el status code) como argumento, pero en lugar de usar números explícitos, es más claro y confiable usar las constantes definidas en **`HttpServletResponse`**. El nombre de cada constante se deriva del mensaje HTTP 1.1 estándar para cada constante, todo en mayúsculas con un prefijo **`SC`** (para Status Code ) y los espacios cambiados a guiones bajos. Por lo tanto, dado que el mensaje para 404 es "Not Found", la constante equivalente en **`HttpServletResponse`** es **`SC_NOT_FOUND`**. En la versión 2.1 de la especificación del servlet, hay tres excepciones. La constante para el código 302 se deriva del mensaje HTTP 1.0 (Moved Temporarily), no del mensaje HTTP 1.1 (Found), y las constantes para los códigos 307 (Temporary Redirect) y 416 (Requested Range Not Satisfiable) faltan por completo. La versión 2.2 agregó la constante para 416, pero las inconsistencias para 307 y 302 permanecen.

Aunque el método general para establecer códigos de estado es simplemente llamar a **`response.setStatus(int)`**, existen dos casos comunes en los que se proporciona un método abreviado en **`HttpServletResponse`**. Solo tenga en cuenta que ambos métodos arrojan **`IOException`**, mientras que **`setStatus`** no lo hace.

* **`public void sendError(int code, String message)`**

   El método **`sendError`** envía un status code (generalmente 404) junto con un mensaje corto que se formatea automáticamente dentro de un documento HTML y se envía al cliente.

* **`public void sendRedirect(String url)`**

   El método **`sendRedirect`** genera una respuesta 302 junto con un header **`Location`** que proporciona la URL del nuevo documento. Con la versión 2.1 de los servlets, debe ser una URL absoluta. En la versión 2.2, se permite una URL absoluta o relativa y el sistema traduce automáticamente las URL relativas en absolutas antes de colocarlas en el header **`Location`**.

Establecer un código de estado no significa necesariamente que no necesite devolver un documento. Por ejemplo, aunque la mayoría de los servidores generan automáticamente un pequeño mensaje de "File Not Found" para las responses 404, es posible que un servlet desee personalizar esta respuesta. Recuerde que si envía una salida, primero debe llamar a **`setStatus`** o **`sendError`**.

## 6.2. HTTP 1.1 Status Codes y su Propósito

Las siguientes secciones describen cada uno de los status codes disponibles para usar en servlets que hablan con clientes HTTP 1.1, junto con el mensaje estándar asociado con cada código. Una buena comprensión de estos códigos puede aumentar drásticamente las capacidades de sus servlets, por lo que al menos debería hojear las descripciones para ver qué opciones tiene a su disposición. Puede volver para obtener detalles cuando esté listo para hacer uso de algunas de las capacidades. Tenga en cuenta que el Apéndice A (Servlet and JSP Quick Reference) presenta un breve resumen de estos códigos en formato tabular.

La especificación completa de HTTP 1.1 se proporciona en RFC 2616, a la que puede acceder en línea yendo a http://www.rfc-editor.org/ y siguiendo los enlaces a los últimos sitios de archivo de RFC. Se indican los códigos que son nuevos en HTTP 1.1, ya que muchos navegadores solo admiten HTTP 1.0. Solo debe enviar los nuevos códigos a clientes que admitan HTTP 1.1, como se verifica al verificar **`request.getRequestProtocol`**.

El resto de esta sección describe los códigos de estado específicos disponibles en HTTP 1.1. Estos códigos se dividen en cinco categorías generales:

* **100-199**

   Los códigos entre 100 y 100 son informativos, lo que indica que el cliente debe responder con alguna otra acción.

* **200-299**

   Los valores en los 200 significan que la request fue exitosa.

* **300-399**

   Los valores en los 300 se usan para archivos que se han movido y generalmente incluyen un header **`Location`** que indica la nueva dirección.

* **400-499**

   Los valores en los 400 indican un error del cliente.

* **500-599**

   Los códigos en los 500 significan un error del servidor.

Las constantes en **`HttpServletResponse`** que representan los diversos códigos se derivan de los mensajes estándar asociados con los códigos. En los servlets, generalmente se hace referencia a los códigos de estado solo por medio de estas constantes. Por ejemplo, usaría **`response.setStatus(response.SC_NO_CONTENT)`** en lugar de **`response.setStatus(204)`**, ya que este último no es claro para los lectores y es propenso a errores tipográficos. Sin embargo, debe tener en cuenta que los servidores pueden variar ligeramente los mensajes y los clientes solo prestan atención al valor numérico. Entonces, por ejemplo, es posible que vea que un servidor devuelve una status line de **`HTTP/1.1 200 Document Follows`** en lugar de **`HTTP/1.1 200 OK`**.

* ***100 (Continue)***

   *Si el servidor recibe un request header **`Expect`** con un valor de **`100-continue`**, significa que el cliente pregunta si puede enviar un attached document en una follow-up request. En tal caso, el servidor debería responder con el status 100 (**`SC_CONTINUE`**) para decirle al cliente que continúe o usar 417 ( **`Expectation Failed`** ) para decirle al navegador que no aceptará el documento. Este código de estado es nuevo en HTTP 1.1.*

* ***101 (Switching Protocols)***

   *Un estado 101 (**`SC_SWITCHING_PROTOCOLS`**) indica que el servidor cumplirá con el header **`Upgrade`**  y cambiará a un protocolo diferente. Este status code es nuevo en HTTP 1.1.*

* ***200 (OK)***

   *Un valor de 200 ( **`SC_OK`** ) significa que todo está bien. El documento sigue para las requests **`GET`** y **`POST`**. Este estado es el predeterminado para los servlets; si no usa **`setStatus`**, obtendrá 200.*

* ***201 (Created)***

   *Un  status code de 201 ( **`SC_CREATED`** ) significa que el servidor creó un nuevo documento en response a la request; el header **`Location`** debe proporcionar su URL.*

* ***202 (Accepted)***

   *Un valor de 202 ( **`SC_ACCEPTED`** ) le dice al cliente que se está actuando sobre la request, pero que el procesamiento aún no se ha completado.*

* ***203 (Non-Authoritative Information)***

   *Un estado 203 ( **`SC_NON_AUTHORITATIVE_INFORMATION`** ) significa que el documento se devuelve normalmente, pero algunos de los headers de response pueden ser incorrectos ya que se está utilizando una copia del documento. Este status code es nuevo en HTTP 1.1.*

* ***204 (No Content)***

   *Un status code 204 ( **`SC_NO_CONTENT`** ) estipula que el navegador debe continuar mostrando el documento anterior porque no hay ningún documento nuevo disponible. Este comportamiento es útil si el usuario recarga periódicamente una página presionando el botón "Reload", y puede determinar que la página anterior ya está actualizada. Por ejemplo, un servlet podría hacer algo como esto:*

   ```java
   int pageVersion =
     Integer.parseInt(request.getParameter("pageVersion"));
   if (pageVersion >= currentVersion) {
     response.setStatus(response.SC_NO_CONTENT);
   } else {
     // Create regular page
   }
   ```


   *Sin embargo, este enfoque no funciona para las páginas que se recargan automáticamente a través del **`Refresh`** response header o la entrada **`<META HTTP-EQUIV="Refresh" ...>`** equivalente, ya que devolver un status code 204 detiene la recarga futura. Sin embargo, la recarga automática basada en JavaScript aún podría funcionar en tal caso. Consulte la discusión sobre **`Refresh`** en la Sección 7.2 (HTTP 1.1 Response Headers and Their Meaning) para obtener más información.*

* ***205 (Reset Content)***

   *Un valor de 205 ( **`SC_RESET_CONTENT`** ) significa que no hay ningún documento nuevo, pero el navegador debería restablecer la vista del documento. Este código de estado se utiliza para obligar a los navegadores a borrar los campos del formulario. Es nuevo en HTTP 1.1.*

* ***206 (Partial Content)***

   *Se envía un status code de 206 ( **`SC_PARTIAL_CONTENT`** ) cuando el servidor cumple con una request parcial que incluye un header **`Range`**. Este valor es nuevo en HTTP 1.1.*

* ***300 (Multiple Choices)***

   *Un valor de 300 ( **`SC_MULTIPLE_CHOICES`** ) significa que el documento solicitado se puede encontrar en varios lugares, que se enumerarán en el documento devuelto. Si el servidor tiene una opción preferida, debe aparecer en el **`Location`** response header.*

* ***301 (Moved Permanently)***
  
   *El estado 301 ( **`SC_MOVED_PERMANENTLY`** ) indica que el documento solicitado está en otro lugar; la nueva URL para el documento se proporciona en el **`Location`** response header. Los navegadores deben seguir automáticamente el enlace a la nueva URL.

* ***302 (Found)***

   *Este valor es similar a 301, excepto que la URL proporcionada por el header **`Location`** debe interpretarse como un reemplazo temporal, no permanente. Nota: en HTTP 1.0, el mensaje se movió temporalmente en lugar de **`Found`** y la constante en **`HttpServletResponse`** es **`SC_MOVED_TEMPORARILY`**, no el **`SC_FOUND`** esperado .*

   **Core Note**

      :atom: La constante que representa 302 es **`SC_MOVED_TEMPORARILY`**, no **`SC_FOUND`** .


   *El código de estado 302 es muy útil porque los navegadores siguen automáticamente la referencia a la nueva URL proporcionada en el **`Location`** response header. Es tan útil, de hecho, que existe un método especial para ello, **`sendRedirect`**. El uso de **`response.sendRedirect(url)`** tiene un par de ventajas sobre el uso de **`response.setStatus(response.SC_MOVED_TEMPORARILY)`** y **`response.setHeader("Location", url)`**. En primer lugar, es más corto y más fácil. En segundo lugar, con **`sendRedirect`**, el servlet crea automáticamente una página que contiene el enlace para mostrar a los navegadores más antiguos que no siguen automáticamente los redireccionamientos. Finalmente, con la versión 2.2 de servlets (la versión en J2EE), **`sendRedirect`** puede manejar URL relativas, traduciéndolas automáticamente a absolutas. Sin embargo, debe usar una URL absoluta en la versión 2.1.*

   *Si redirige al usuario a otra página dentro de su propio sitio, debe pasar la URL a través del método **`encodeURL`** de **`HttpServletResponse`**. Hacerlo es una simple precaución en caso de que alguna vez utilice el seguimiento de sesiones basado en la reescritura de URL. La reescritura de URL es una forma de rastrear a los usuarios que tienen las cookies deshabilitadas mientras están en su sitio. Se implementa agregando información de ruta adicional al final de cada URL, pero la API de seguimiento de sesiones de servlet se encarga de los detalles automáticamente. El seguimiento de sesiones se analiza en el Capítulo 9, y es una buena idea usar **`encodeURL`** de forma rutinaria para que pueda agregar el seguimiento de sesiones en un momento posterior con cambios mínimos en el código.*

   **Core Approach**

   * Si redirige a los usuarios a una página dentro de su sitio, planifique con anticipación el seguimiento de la sesión utilizando

   ```java
   response.sendRedirect(response.encodeURL(url)),
   ```

   en lugar de solo

   ```java
   response.sendRedirect(url).
   ```

   *Este status code a veces se usa indistintamente con 301. Por ejemplo, si solicita por error **`http://host/~user`** (falta la barra diagonal), algunos servidores responderán con un código 301 mientras que otros usarán 302.*

   *Técnicamente, se supone que los navegadores solo deben seguir automáticamente la redirección si la request original fue **`GET`** . Para obtener más información, consulte la discusión sobre el código de estado 307.*

* ***303 (See Other)***

   *El estado 303 ( **`SC_SEE_OTHER`** ) es similar a 301 y 302, excepto que si la request original fue **`POST`**, el nuevo documento (dado en el header **`Location`**) debe recuperarse con **`GET`**. Este código es nuevo en HTTP 1.1.*

* ***304 (Not Modified)***

   *Cuando un cliente tiene un documento en caché, puede realizar una request condicional proporcionando un header **`If-Modified-Since`** para indicar que solo quiere el documento si se ha cambiado desde la fecha especificada. Un valor de 304 ( **`SC_NOT_MODIFIED`** ) significa que la versión almacenada en caché está actualizada y el cliente debe usarla. De lo contrario, el servidor debe devolver el documento solicitado con el status code normal (200). Los servlets normalmente no deberían establecer este código de estado directamente. En su lugar, deben implementar el método **`getLastModified`** y dejar que el método **`service`** predeterminado maneje las requests condicionales en función de esta fecha de modificación. Un ejemplo de este enfoque se da en la Sección 2.8(An Example Using Servlet Initialization and Page Modification Dates).*

* ***305 (Use Proxy)***

   *Un valor de 305 ( **`SC_USE_PROXY`** ) significa que el documento solicitado debe recuperarse a través del proxy que figura en el header **`Location`**. Este código de estado es nuevo en HTTP 1.1.*

* ***307 (Temporary Redirect)***

   *Las reglas sobre cómo un navegador debe manejar un estado 307 son idénticas a las de 302. El valor 307 se agregó a HTTP 1.1 ya que muchos navegadores siguen erróneamente la redirección en una respuesta 302, incluso si el mensaje original es un **`POST`**. Se supone que los navegadores deben seguir la redirección de una request **`POST`** solo cuando reciben un estado de respuesta 303. Este nuevo estado pretende ser inequívocamente claro: siga las requests **`GET`** y **`POST`** redirigidas en el caso de las respuestas 303; siga las solicitudes **`GET`** redirigidas pero no **`POST`** en el caso de las responses 307. Nota: Por alguna razón, no hay una constante en **`HttpServletResponse`** correspondiente a este código de estado. Este código de estado es nuevo en HTTP 1.1.*

**Core Note**

:atom: No hay una constante **`SC_TEMPORARY_REDIRECT`** en **`HttpServletResponse`**, por lo que debe usar 307 explícitamente.


* ***400 (Bad Request)***

   *Un estado 400 ( **`SC_BAD_REQUEST`** ) indica una sintaxis incorrecta en la request del cliente.

* ***401 (Unauthorized)***

   *Un valor de 401 ( **`SC_UNAUTHORIZED`** ) significa que el cliente intentó acceder a una página protegida con contraseña sin la información de identificación adecuada en el header **`Authorization`**. La response debe incluir un header **`WWW-Authenticate`**. Para ver un ejemplo, consulte la Sección 4.5 , “Restricting Access to Web Pages”.*

* ***403 (Forbidden)***

   *Un código de estado de 403 ( **`SC_FORBIDDEN`** ) significa que el servidor se niega a suministrar el recurso, independientemente de la autorización. Este estado suele ser el resultado de permisos de archivo o directorio incorrectos en el servidor.*

* ***404 (Not Found)***

El infame estado 404 ( **`SC_NOT_FOUND`** ) le dice al cliente que no se pudo encontrar ningún recurso en esa dirección. Este valor es la response estándar "no existe tal página". Es una response tan común y útil que existe un método especial en la **`HttpServletResponse`** clase: **`sendError("message")`**. La ventaja de **`sendError`** sobre **`setStatus`** es que, con **`sendError`**, el servidor genera automáticamente una página de error que muestra el mensaje de error. Desafortunadamente, sin embargo, el comportamiento predeterminado de Internet Explorer 5 es ignorar la página de error que envía y muestra la suya propia, aunque hacerlo contradiga la especificación HTTP. Para desactivar esta configuración, vaya al menú Tools, seleccione Internet Options, elija la pestaña Advanced y asegúrese de que la casilla "Show friendly HTTP error messages" no esté marcada. Desafortunadamente, sin embargo, pocos usuarios conocen esta configuración, por lo que esta "característica" evita que la mayoría de los usuarios de Internet Explorer versión 5 vean los mensajes informativos que usted devuelve. Otros navegadores principales y la versión 4 de Internet Explorer muestran correctamente las páginas de error generadas por el servidor. Consulte las Figuras 6-3 y 6-4 para ver un ejemplo.

**Figura 6-3. Resultado del servlet `SearchEngines` cuando no se especificó una cadena de búsqueda. Internet Explorer 5 muestra su propia página de error, aunque el servlet genera una.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/1fb471da-22b8-4fb5-a8cb-da9a3fb75cf0)


**Figura 6-4. Resultado del servlet de `SearchEngines` cuando no se especificó una cadena de búsqueda. Netscape muestra correctamente la página de error generada por el servlet.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8917eaeb-47ba-4d35-8d9c-677b0cde642d)

**Core Warning**

   :atom: De forma predeterminada, la versión 5 de Internet Explorer ignora las páginas de error generadas por el servidor.


* ***405 (Method Not Allowed)***

   *Un valor 405 ( **`SC_METHOD_NOT_ALLOWED`** ) indica que el método de request ( **`GET`**, **`POST`**, **`HEAD`**, **`PUT`**, **`DELETE`**, etc.) no estaba permitido para este recurso en particular. Este status code es nuevo en HTTP 1.1.*

* ***406 (Not Acceptable)***

   *Un valor de 406 ( **`SC_NOT_ACCEPTABLE`** ) significa que el recurso solicitado tiene un MIME type incompatible con los tipos especificados por el cliente en su header **`Accept`**. Consulte la Tabla 7.1 en la Sección 7.2 (HTTP 1.1 Response Headers and Their Meaning) para conocer los nombres y significados de los MIME types comunes. El valor 406 es nuevo en HTTP 1.1.*

* ***407 (Proxy Authentication Required)***

   *El valor 407 ( **`SC_PROXY_AUTHENTICATION_REQUIRED`** ) es similar al 401, pero lo usan los servidores proxy. Indica que el cliente debe autenticarse con el servidor proxy. El servidor proxy devuelve un **`Proxy-Authenticate`** response header al cliente, lo que hace que el navegador se vuelva a conectar con un **`Proxy-Authenticate`** request header.. Este código de estado es nuevo en HTTP 1.1.*

* ***408 (Request Timeout)***

   *El código 408 ( **`SC_REQUEST_TIMEOUT`** ) significa que el cliente tardó demasiado en terminar de enviar la request. Es nuevo en HTTP 1.1.*

* ***409 (Conflict)***

   *Generalmente asociado con requests **`PUT`**, el estado 409 ( **`SC_CONFLICT`** ) se usa para situaciones como un intento de cargar una versión incorrecta de un archivo. Este código de estado es nuevo en HTTP 1.1.*

* ***410 (Gone)***

   *Un valor de 410 ( **`SC_GONE`** ) le dice al cliente que el documento solicitado ya no está y no se conoce la dirección de reenvío. El estado 410 se diferencia del 404 en que se sabe que el documento ha desaparecido de forma permanente, no solo que no está disponible por motivos desconocidos, como ocurre con el 404. Este status code es nuevo en HTTP 1.1.*

* ***411 (Length Required)***

   *Un estado de 411 ( **`SC_LENGTH_REQUIRED`** ) significa que el servidor no puede procesar la request (supuestamente una request **`POST`** con un documento adjunto) a menos que el cliente envíe un header de **`Content-Length`** que indique la cantidad de datos que se envían al servidor. Este valor es nuevo en HTTP 1.1.*

* ***412 (Precondition Failed)***

   *El estado 412 ( **`SC_PRECONDITION_FAILED`** ) indica que alguna condición previa especificada en los request headers era falsa. Es nuevo en HTTP 1.1.*

* ***413 (Request Entity Too Large)***

  *Un código de estado de 413 ( **`SC_REQUEST_ENTITY_TOO_LARGE`** ) le dice al cliente que el documento solicitado es más grande de lo que el servidor quiere manejar ahora. Si el servidor cree que puede manejarlo más tarde, debe incluir un **`Retry-After`** response header. Este valor es nuevo en HTTP 1.1.

* ***414 (Request URI Too Long)***

   *El estado 414 ( **`SC_REQUEST_URI_TOO_LONG`** ) se usa cuando el URI es demasiado largo. En este contexto, "URI" significa la parte de la URL que viene después del host y el puerto en la URL. Por ejemplo, en http://www.y2k-disaster.com:8080/we/look/silly/now/, el URI es **`/we/look/silly/now/`**. Este código de estado es nuevo en HTTP 1.1.*

*  ***415 (Unsupported Media Type)***

   *Un valor de 415 ( **`SC_UNSUPPORTED_MEDIA_TYPE`** ) significa que la request tenía un documento adjunto de un tipo que el servidor no sabe cómo manejar. Este código de estado es nuevo en HTTP 1.1.*

*  ***416 (Requested Range Not Satisfiable)***

   *Un status code de 416 significa que el cliente incluyó un header **`Range`** insatisfactorio en la request. Este valor es nuevo en HTTP 1.1. Sorprendentemente, la constante que corresponde a este valor se omitió de **`HttpServletResponse`** en la versión 2.1 de la API de servlet.*

**Core Note**

   En la versión 2.1 de la especificación del servlet, no hay una constante **`SC_REQUESTED_RANGE_NOT_SATISFIABLE`** en **`HttpServletResponse`**, por lo que debe usar 416 explícitamente. La constante está disponible en la versión 2.2 y posteriores.


* ***417 (Expectation Failed)***

   *Si el servidor recibe un **`Expect`** request header con un valor de **`100-continue`**, significa que el cliente pregunta si puede enviar un documento adjunto en una request de seguimiento. En tal caso, el servidor debería responder con este estado (417) para decirle al navegador que no aceptará el documento o usar 100 ( **`SC_CONTINUE`** ) para decirle al cliente que continúe. Este status code es nuevo en HTTP 1.1.*

* ***500 (Internal Server Error)***

   *500 ( **`SC_INTERNAL_SERVER_ERROR`** ) es el status code genérico "server is confused". A menudo es el resultado de programas CGI o (¡Dios no lo quiera!) servlets que fallan o devuelven headers con formato incorrecto.

* ***501 (Not Implemented)***

   *El estado 501 ( **`SC_NOT_IMPLEMENTED`** ) notifica al cliente que el servidor no admite la funcionalidad para cumplir con la request. Se utiliza, por ejemplo, cuando el cliente emite un comando como **`PUT`** que el servidor no admite.*

* ***502 (Bad Gateway)***

   *Los servidores que actúan como servidores proxies o gateways; utilizan un valor de 502 ( **`SC_BAD_GATEWAY`** ); indica que el servidor inicial obtuvo una bad response del servidor remoto.

* ***503 (Service Unavailable)***

   *Un  status code de 503 ( **`SC_SERVICE_UNAVAILABLE`** ) significa que el servidor no puede responder debido a mantenimiento o sobrecarga. Por ejemplo, un servlet podría devolver este header si algún subproceso o grupo de conexiones de base de datos está actualmente lleno. El servidor puede proporcionar un header **`Retry-After`** para indicarle al cliente cuándo volver a intentarlo.*

* ***504 (Gateway Timeout)***

   *Los servidores que actúan como servidores proxies o gateways; utilizan un valor de 504 ( **`SC_GATEWAY_TIMEOUT`** ); indica que el servidor inicial no obtuvo una respuesta oportuna del servidor remoto. Este código de estado es nuevo en HTTP 1.1.

* ***505 (HTTP Version Not Supported)***

El código 505 ( **`SC_HTTP_VERSION_NOT_SUPPORTED`** ) significa que el servidor no admite la versión de HTTP mencionada en la línea de request. Este status code es nuevo en HTTP 1.1.

## 6.3. Una interfaz para varios motores de búsqueda

El listado 6.1 presenta un ejemplo que utiliza los dos status codes más comunes además de 200 (OK): 302 (Found) y 404 (Not Found). El código 302 lo establece el método abreviado **`sendRedirect`** de **`HttpServletResponse`**, y el 404 lo especifica **`sendError`**.

En esta aplicación, un formulario HTML (consulte la Figura 6-1 y el código fuente en el Listado 6.3 ) primero muestra una página que le permite al usuario elegir una cadena de búsqueda, la cantidad de resultados que se mostrarán por página y el motor de búsqueda que se usará. Cuando se envía el formulario, el servlet extrae esos tres parámetros, construye una URL con los parámetros incrustados de manera apropiada para el motor de búsqueda seleccionado (vea la clase **`SearchSpec`** del Listado 6.2 ) y redirige al usuario a esa URL (vea la Figura 6-2). Si el usuario no elige un motor de búsqueda o no especifica los términos de búsqueda, una página de error informa al cliente de este hecho (ver Figuras 6-3 y 6-4 ).

**Figura 6-1. Front-end del servlet `SearchEngines`. Vea el Listado 6.3 para el código fuente HTML.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/25dbafb4-e847-4eb0-b624-fb8ffbfcce7f)


**Figura 6-2. Resultado del servlet `SearchEngines` cuando se envía el formulario de la Figura 6-1.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/5138424c-eb47-415a-9bdb-9a79b12c6036)


**Listado 6.1. `SearchEngines.java`**

```java
package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;

/** Servlet that takes a search string, number of results per
 *  page, and a search engine name, sending the query to
 *  that search engine. Illustrates manipulating
 *  the response status line. It sends a 302 response
 *  (via sendRedirect) if it gets a known search engine,
 *  and sends a 404 response (via sendError) otherwise.
 */

public class SearchEngines extends HttpServlet {
   public void doGet(HttpServletRequest request,
                     HttpServletResponse response)
       throws ServletException, IOException {
     String searchString = request.getParameter("searchString");
     if ((searchString == null) ||
         (searchString.length() == 0)) {
       reportProblem(response, "Missing search string.");
       return;

     }
     // The URLEncoder changes spaces to "+" signs and other
     // non-alphanumeric characters to "%XY", where XY is the
     // hex value of the ASCII (or ISO Latin-1) character.
     // Browsers always URL-encode form values, so the
     // getParameter method decodes automatically. But since
     // we're just passing this on to another server, we need to
     // re-encode it.
     searchString = URLEncoder.encode(searchString);
     String numResults =
       request.getParameter("numResults");
     if ((numResults == null) ||
         (numResults.equals("0")) ||
         (numResults.length() == 0)) {
       numResults = "10";
     }
     String searchEngine =
       request.getParameter("searchEngine");
     if (searchEngine == null) {
       reportProblem(response, "Missing search engine name.");
       return;
     }
     SearchSpec[] commonSpecs = SearchSpec.getCommonSpecs();
     for(int i=0; i<commonSpecs.length; i++) {
       SearchSpec searchSpec = commonSpecs[i];
       if (searchSpec.getName().equals(searchEngine)) {
         String url =
           searchSpec.makeURL(searchString, numResults);
         response.sendRedirect(url);
        return;
       }
     }
     reportProblem(response, "Unrecognized search engine.");
   }

   private void reportProblem(HttpServletResponse response,
                              String message)
       throws IOException {
     response.sendError(response.SC_NOT_FOUND,
						"<H2>" + message + "</H2>");
   }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
```


**Listado 6.2. `SearchSpec.java`**

```java
package coreservlets;

/** Small class that encapsulates how to construct a
 *  search string for a particular search engine.
 */

class SearchSpec {
  private String name, baseURL, numResultsSuffix;

  private static SearchSpec[] commonSpecs =
    { new SearchSpec("google",
                     "http://www.google.com/search?q=",
                     "&num="),
      new SearchSpec("infoseek",
                     "http://infoseek.go.com/Titles?qt=",
                     "&nh="),
      new SearchSpec("lycos",
                     "http://lycospro.lycos.com/cgi-bin/" +
                        "pursuit?query=",
                     "&maxhits="),
      new SearchSpec("hotbot",
                     "http://www.hotbot.com/?MT=",
                     "&DC=")
    };

  public SearchSpec(String name,
                    String baseURL,
                    String numResultsSuffix) {
    this.name = name;
    this.baseURL = baseURL;
    this.numResultsSuffix = numResultsSuffix;
  }

  public String makeURL(String searchString,
                        String numResults) {
    return(baseURL + searchString +
           numResultsSuffix + numResults);
  }

  public String getName() {
    return(name);
  }

  public static SearchSpec[] getCommonSpecs() {
    return(commonSpecs);
  }
}
```


**Listado 6.3. `SearchEngines.html`**

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <TITLE>Searching the Web</TITLE>
</HEAD>

<BODY BGCOLOR="#FDF5E6">
<H1 ALIGN="CENTER">Searching the Web</H1>

<FORM ACTION="/servlet/coreservlets.SearchEngines">
  <CENTER>
    Search String:
    <INPUT TYPE="TEXT" NAME="searchString"><BR>
    Results to Show Per Page:
    <INPUT TYPE="TEXT" NAME="numResults"
                       VALUE=10 SIZE=3><BR>
    <INPUT TYPE="RADIO" NAME="searchEngine"
                        VALUE="google">
    Google |
    <INPUT TYPE="RADIO" NAME="searchEngine"
                        VALUE="infoseek">
    Infoseek |
    <INPUT TYPE="RADIO" NAME="searchEngine"
                        VALUE="lycos">
    Lycos |
    <INPUT TYPE="RADIO" NAME="searchEngine"
                        VALUE="hotbot">
    HotBot
    <BR>
    <INPUT TYPE="SUBMIT" VALUE="Search">
  </CENTER>
</FORM>

</BODY>
</HTML>
```

