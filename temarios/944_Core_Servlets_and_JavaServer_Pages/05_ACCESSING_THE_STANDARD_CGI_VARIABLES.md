# Capítulo 5. Acceso a las Variables CGI Estándar

Temas de este capítulo

* La idea de las “variables CGI”
* El servlet equivalente de cada variable CGI estándar
* Un servlet que muestra los valores de todas las variables CGI

Si llega a los servlets con experiencia en la programación tradicional de Common Gateway Interface (CGI), probablemente esté acostumbrado a la idea de las "CGI variables". Se trata de una recopilación un tanto ecléctica de información sobre la request actual. Algunos se basan en la línea de HTTP request y los headers  (p. ej., datos de formulario), otros se derivan del propio socket (p. ej., el nombre y la dirección IP del host solicitante) y otros se toman de los parámetros de instalación del servidor (p. ej., la asignación de direcciones URL a rutas reales(actual paths)).

Aunque probablemente tenga más sentido pensar en diferentes fuentes de datos (datos de solicitud, información del servidor, etc.) como distintos, los programadores de CGI experimentados pueden encontrar útil ver el equivalente de servlet de cada una de las variables de CGI. Si no tiene experiencia en CGI tradicional, primero, cuente sus bendiciones; Los servlets son más fáciles de usar, más flexibles y más eficientes que el CGI estándar. En segundo lugar, simplemente hojee este capítulo, observando las partes que no están directamente relacionadas con la incoming HTTP request. En particular, observe que puede usar **`getServletContext().getRealPath`** para asignar un URI (la parte de la URL que viene después del host y el puerto) a una ruta real(actual path) y que puede usar **`request.getRemoteHost`** y **`request.getRemoteAddress`** para obtener el nombre y la dirección IP del cliente.

## 5.1. Servlet Equivalente a las Variables CGI

Para cada variable CGI estándar, esta sección resume su propósito y los medios para acceder a ella desde un servlet. Como de costumbre, una vez que esté familiarizado con esta información, puede usar el Apéndice A (Servlet and JSP Quick Reference) como recordatorio. Suponga que la **`request`** es **`HttpServletRequest`** proporcionada a los métodos **`doGet`** y **`doPost`**.

***`AUTH_TYPE`***

*Si se proporcionó un header **`Authorization`**, esta variable proporciona el esquema especificado ( **`basic`** or **`digest`** ). Acceda a él con **`request.getAuthType()`***.

***`CONTENT_LENGTH`***

*Solo para requests **`POST`**, esta variable almacena la cantidad de bytes de datos enviados, según lo indicado por **`Content-Length`** request header. Técnicamente, dado que la variable **`CONTENT_LENGTH`** es un string, el equivalente del servlet es **`String.valueOf(request.getContentLength())`** o **`request.getHeader("Content-Length")`**. Probablemente querrá simplemente llamar a **`request.getContentLength()`**, que devuelve un **`int`***.

***`CONTENT_TYPE`***

***`CONTENT_TYPE`** designa el MIME type de los datos adjuntos, si se especifica. Consulte la Tabla 7.1 en la Sección 7.2 (HTTP 1.1 Response Headers and Their Meaning) para conocer los nombres y significados de los MIME type comunes. Accede a **`CONTENT_TYPE`** con **`request.getContentType()`***.

***`DOCUMENT_ROOT`***

*La variable **`DOCUMENT_ROOT`** especifica el directorio real correspondiente a la URL http://host/ . Acceda a él con **`getServletContext().getRealPath("/")`**. En especificaciones de servlet más antiguas, accedías a esta variable con **`request.getRealPath("/")`**; el método de acceso anterior ya no es compatible. Además, puede usar **`getServletContext().getRealPath`** para asignar un URI arbitrario (es decir, un sufijo de URL que viene después del nombre de host y el puerto) a una actual path en la máquina local.*

***`HTTP_XXX_YYY`***

*Las variables de la forma **`HTTP_HEADER_NAME`** eran cómo los programas CGI obtenían acceso a los HTTP request headers arbitrarios. El header **`Cookie`** se convirtió en **`HTTP_COOKIE, User-Agent`** se convirtió en **` HTTP_USER_AGENT, Referer`** se convirtió en **`HTTP_REFERER`**, y así sucesivamente. Los servlets solo deben usar **`request.getHeader`** o uno de los métodos abreviados descritos en el Capítulo 4 (Handling the Client Request: HTTP Request Headers).*

***`PATH_INFO`***

*Esta variable proporciona cualquier información de ruta adjunta a la URL después de la dirección del servlet pero antes de los datos de la consulta. Por ejemplo, con http://host/servlet/coreservlets.SomeSerlet/foo/bar?baz=quux, la información de la ruta es **`/foo/bar`**. Dado que los servlets, a diferencia de los programas CGI estándar, pueden comunicarse directamente con el servidor, no es necesario que traten la información de la ruta de manera especial. La información de la ruta podría enviarse como parte de los datos del formulario normal y luego traducirse mediante **`getServletContext().getRealPath`**. Acceda al valor de **`PATH_INFO`** mediante **`request.getPathInfo()`**.*

***`PATH_TRANSLATED`***

***`PATH_TRANSLATED`** brinda la información de la ruta asignada a una ruta real(real path) en el servidor. Nuevamente, con los servlets no es necesario tener un caso especial para la información de la ruta, ya que un servlet puede llamar a **`getServletContext().getRealPath`** para traducir URL parciales en rutas reales(real paths). Esta traducción no es posible con CGI estándar porque el programa CGI se ejecuta completamente por separado del servidor. Acceda a esta variable mediante **`request.getPathTranslated()`**.*

***`QUERY_STRING`***

*Para las requests **`GET`**, esta variable brinda los datos adjuntos como una sola cadena con valores aún URL-encoded. Rara vez desea los datos sin procesar en servlets; en su lugar, use **`request.getParameter`** para acceder a parámetros individuales, como se describe en el Capítulo 3 (Handling the Client Request: Form Data). Sin embargo, si desea los datos sin procesar, puede obtenerlos a través de **`request.getQueryString()`**.*

***`REMOTE_ADDR`***

*Esta variable designa la dirección IP del cliente que realizó la solicitud, como un **`String`** (por ejemplo, **`"198.137.241.30"`** ). Acceda llamando a **`request.getRemoteAddr()`**.*

***`REMOTE_HOST`***

***`REMOTE_HOST`** indica el nombre de dominio completo (p. ej., **`whitehouse.gov`** ) del cliente que realizó la request. La dirección IP se devuelve si no se puede determinar el nombre de dominio. Puede acceder a esta variable con **`request.getRemoteHost()`**.*

***`REMOTE_USER`***

*Si el propio servidor proporcionó y decodificó un header **`Authorization`**, la variable **`REMOTE_USER`** proporciona la parte del usuario, que es útil para el seguimiento de la sesión en sitios protegidos. Acceda a él con **`request.getRemoteUser()`**. Para decodificar la información **`Authorization`** directamente en los servlets, consulte la sección (Restricting Access to Web Pages).*

***`REQUEST_METHOD`***

*Esta variable estipula el tipo de HTTP request, que suele ser **`GET`** o **`POST`** , pero ocasionalmente es **`HEAD`**, **`PUT`**, **`DELETE`**, **`OPTIONS`** o **`TRACE`**. Los servlets rara vez necesitan buscar **`REQUEST_METHOD`** explícitamente, ya que cada uno de los tipos de request generalmente se maneja con un método de servlet diferente ( **`doGet`**, **`doPost`**, etc.). Una excepción es **`HEAD`**, que el método **`service`** maneja automáticamente y devuelve los headers y status codes que usaría el método **`doGet`**. Acceda a esta variable mediante **`request.getMethod()`**.*

***`SCRIPT_NAME`***

*Esta variable especifica la path al servlet, relativa al directorio raíz del servidor. Se puede acceder a través de **`request.getServletPath()`**.*

***`SERVER_NAME`***

***`SERVER_NAME`** proporciona el nombre de host de la máquina del servidor. Se puede acceder mediante **`request.getServerName()`**.*

***`SERVER_PORT`***

*Esta variable almacena el puerto en el que escucha el servidor. Técnicamente, el equivalente del servlet es **`String.valueOf(request.getServerPort())`**, que devuelve un **`String`**. Por lo general, solo querrá **`request.getServerPort()`**, que devuelve un **`int`**.*

***`SERVER_PROTOCOL`***

*La variable **`SERVER_PROTOCOL`** indica el nombre del protocolo y la versión utilizada en la línea de solicitud (por ejemplo, **`HTTP/1.0`** o **`HTTP/1.1`** ). Acceda llamando a **`request.getProtocol()`**.*

***`SERVER_SOFTWARE`***

*Esta variable proporciona información de identificación sobre el servidor web. Acceda a él mediante **`getServletContext().getServerInfo()`***.
