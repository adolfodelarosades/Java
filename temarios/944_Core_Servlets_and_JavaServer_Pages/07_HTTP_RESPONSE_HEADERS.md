# Capítulo 7. Generación de la Respuesta del Servidor: HTTP Response Headers

Temas de este capítulo

* Configuración de response headers de servlets
* El propósito de cada uno de los response headers HTTP 1.1
* MIME types comunes
* Un servlet que usa el header **`Refresh`** para acceder repetidamente a los cálculos en curso
* Servlets que explotan conexiones HTTP persistentes (keep-alive)
* Generación de imágenes GIF a partir de servlets

Una response de un servidor web normalmente consta de una status line, uno o más response headers, una línea en blanco y el documento. Para aprovechar al máximo sus servlets, necesita saber cómo usar la status line y los response headers de manera efectiva, no solo cómo generar el documento.

La configuración de los HTTP response headers a menudo va de la mano con la configuración de los status codes en la status line, como se explicó en el capítulo anterior. Por ejemplo, todos los status codes de "document moved" (del 300 al 307) tienen un header **`Location`** adjunto, y un código 401 ( **`Unauthorized`** ) siempre incluye un header **`WWW-Authenticate`** adjunto. Sin embargo, especificar headers también puede desempeñar un papel útil incluso cuando no se establece un status code inusual. Los response headers se pueden usar para especificar cookies, para proporcionar la fecha de modificación de la página (para el almacenamiento en caché del lado del cliente), para indicar al navegador que vuelva a cargar la página después de un intervalo designado, para dar el tamaño del archivo para que se puedan usar conexiones HTTP persistentes, para designar el tipo de documento que se genera y para realizar muchas otras tareas.

## 7.1. Configuración de Response Headers de Servlets

La forma más general de especificar headers es usar el método **`setHeader`** de **`HttpServletResponse`**. Este método toma dos strings: el nombre del header y el valor del header. Al igual que con la configuración de status codes, debe especificar los headers antes de devolver el documento real. Con la versión 2.1 de los servlets, esto significa que debe configurar los headers antes del primer uso de **`PrintWriter`** o **`OutputStream`** sin formato que transmite el contenido del documento. Con los servlets versión 2.2 (la versión en J2EE), **`PrintWriter`** puede usar un búfer, por lo que puede establecer headers hasta la primera vez que se vacía el búfer. Consulte la Sección 6.1 (Specifying Status Codes) para obtener más detalles.

**Core Approach**

   :atom: Asegúrese de establecer response headers antes de enviar el contenido de cualquier documento al cliente.


Además del método **`setHeader`** de propósito general, **`HttpServletResponse`** también tiene dos métodos especializados para establecer headers que contienen dates y integers:

* **`setDateHeader(String header, long milliseconds)`**

   Este método le ahorra la molestia de traducir una fecha de Java en milisegundos desde 1970 (como lo devuelve **`System.currentTimeMillis`**, **`Date.getTime`** o **`Calendar.getTimeInMillis`**) en una GMT time string.

* **`setIntHeader(String header, int headerValue)`**

   Este método le ahorra el pequeño inconveniente de convertir un **`int`** en una **`String`** antes de insertarlo en un header.

HTTP permite multiples apariciones del mismo nombre de header y, a veces, desea agregar un nuevo header en lugar de reemplazar cualquier header existente con el mismo nombre. Por ejemplo, es bastante común tener varios headers **`Accept`** y **`Set-Cookie`** que especifican diferentes MIME types admitidos y diferentes cookies, respectivamente. Con la versión 2.1 de los servlets, **`setHeader`**, **`setDateHeader`** y **`setIntHeader`** siempre agregan nuevos headers, por lo que no hay forma de "unset" los headers que se establecieron anteriormente (por ejemplo, mediante un método heredado). Con servlets versión 2.2, **`setHeader`**, **`setDateHeader`** y **`setIntHeader`** reemplazan cualquier headers existente con el mismo nombre, mientras que **`addHeader`**, **`addDateHeader`** y **`addIntHeader`** agregan un header independientemente de si ya existe un header con ese nombre. Si le importa si ya se ha establecido un header específico, use **`containsHeader`** para verificar.

Finalmente, **`HttpServletResponse`** también proporciona varios métodos convenientes para especificar headers comunes. Estos métodos se resumen a continuación.

* **`setContentType`**

   Este método establece el header **`Content-Type`** y lo utiliza la mayoría de los servlets. Consulte la Sección 7.5 (Using Servlets to Generate GIF Images) para ver un ejemplo de su uso.

* **`setContentLength`**

   Este método establece el header **`Content-Length`**, que es útil si el navegador admite conexiones HTTP persistentes (keep-alive). Consulte la Sección 7.4 para ver un ejemplo.

* **`addCookie`**

   Este método inserta una cookie en el header **`Set-Cookie`**. No existe un método **`setCookie`** correspondiente, ya que es normal tener varias líneas **`Set-Cookie`**. Vea el Capítulo 8 para una discusión sobre las cookies.

* **`sendRedirect`**

   Como se discutió en el capítulo anterior, el método **`sendRedirect`** establece el header **`Location`** y establece el código de estado en 302. Consulte la Sección 6.3 (A Front End to Various Search Engines) para ver un ejemplo.

## 7.2. HTTP 1.1 Response Headers y su Significado

A continuación se muestra un resumen de los encabezados de respuesta HTTP 1.1. Una buena comprensión de estos encabezados puede aumentar la efectividad de sus servlets, por lo que al menos debe hojear las descripciones para ver qué opciones tiene a su disposición. Puede volver para obtener detalles cuando esté listo para hacer uso de las capacidades. Tenga en cuenta que el Apéndice A (Servlet and JSP Quick Reference) presenta un breve resumen de estos headers para usar como recordatorio.

Estos headers son un superconjunto de los permitidos en HTTP 1.0. Para obtener detalles adicionales sobre estos headers, consulte la especificación HTTP 1.1, proporcionada en RFC 2616. Hay varios lugares donde los RFC oficiales se archivan en línea; su mejor opción es comenzar en http://www.rfc-editor.org/ para obtener una lista actualizada de los sitios de archivo. Los nombres de los headers no distinguen entre mayúsculas y minúsculas, pero tradicionalmente se escriben con la primera letra de cada palabra en mayúscula.

Tenga cuidado al escribir servlets cuyo comportamiento dependa de headers de response que solo están disponibles en HTTP 1.1, especialmente si su servlet necesita ejecutarse en la WWW "en general", en lugar de en una intranet; muchos navegadores antiguos solo admiten HTTP 1.0. Es mejor verificar explícitamente la versión HTTP con **`request.getRequestProtocol`** antes de usar headers nuevos.

* ***`Accept-Ranges`***

   Este header, que es nuevo en HTTP 1.1, le dice al cliente si acepta o no los **`Range`** request headers rango. Por lo general, especifica un valor de **`bytes`** para indicar que acepta **`Range`** requests y un valor **`none`** para indicar que no lo hace.

* ***`Age`***

   Los proxies utilizan este header para indicar cuánto tiempo hace que el servidor original generó el documento. Es nuevo en HTTP 1.1 y rara vez lo usan los servlets.

* ***`Allow`***

   El header **`Allow`** especifica los request methods (**`GET`**, **`POST`**, etc.) que admite el servidor. Es necesario para las responses 405 ( **`Method Not Allowed`** ). El método **`service`** predeterminado de los servlets genera automáticamente este header para las requests **`OPTIONS`**.

* ***`Cache-Control`***

   Este header útil le dice al navegador u otro cliente las circunstancias en las que el documento de respuesta se puede almacenar en caché de manera segura. Tiene los siguientes valores posibles:

   * ***`public`***: El documento se puede almacenar en caché, incluso si las reglas normales (p. ej., para páginas protegidas con contraseña) indican que no debería ser así.

   * ***`private`*** : El documento es para un solo usuario y solo se puede almacenar en cachés privados (no compartidos).

   * ***`no-cache`***: El documento nunca debe almacenarse en caché (es decir, usarse para satisfacer una request posterior). El servidor también puede especificar “**`no-cache="header1,header2,...,headerN"`**” para indicar los headers que deben omitirse si se usa más tarde una respuesta almacenada en caché. Los navegadores normalmente no almacenan en caché los documentos que se recuperaron mediante requests que incluyen datos de formulario. Sin embargo, si un servlet genera contenido diferente para diferentes requests, incluso cuando las requests no contienen datos de formulario, es fundamental decirle al navegador que no almacene en caché la response. Dado que los navegadores más antiguos usan el header **`Pragma`** para este propósito, el enfoque típico de servlet es establecer ambos headers, como en el siguiente ejemplo.

   ```java
   response.setHeader("Cache-Control", "no-cache");
   response.setHeader("Pragma", "no-cache");
   ```

   * ***`no-store`***: El documento nunca debe almacenarse en caché y ni siquiera debe almacenarse en una ubicación temporal en el disco. Este header está destinado a evitar copias inadvertidas de información confidencial.

   * ***`must-revalidate`***: El cliente debe revalidar el documento con el servidor original (no solo los proxies intermedios) cada vez que se usa.

   * ***`proxy-revalidate`***: Esto es lo mismo que **`must-revalidate`**, excepto que se aplica solo a los cachés compartidos.

   * ***`max-age=xxx`***: El documento debe considerarse obsoleto después de xxx segundos. Esta es una alternativa conveniente al header **`Expires`**, pero solo funciona con clientes HTTP 1.1. Si tanto **`max-age`** como **`Expires`** están presentes en la respuesta, el valor de **`max-age`** tiene prioridad.

   * ***`s-max-age=xxx`***: Las cachés compartidas deberían considerar el documento obsoleto después de xxx segundos.

      El header **`Cache-Control`** es nuevo en HTTP 1.1.


* ***`Connection`***
  
   Un valor de **`close`** para este header de response le indica al navegador que no use conexiones HTTP persistentes. Técnicamente, las conexiones persistentes son las predeterminadas cuando el cliente admite HTTP 1.1 y no especifica un request header "Connection: close" (o cuando un cliente HTTP 1.0 especifica "Connection: keep-alive"). Sin embargo, dado que las conexiones persistentes requieren un **`Content-Length`** response header, no hay razón para que un servlet use explícitamente el header **`Connection`**. Simplemente omita el header **`Content-Length`** si no está utilizando conexiones persistentes. Consulte la Sección 7.4 (Using Persistent HTTP Connections) para ver un ejemplo del uso de conexiones HTTP persistentes desde servlets.
AQUIIIIIIIII

* ***`Content-Encoding`***

Este encabezado indica la forma en que se codificó la página durante la transmisión. El navegador debe invertir la codificación antes de decidir qué hacer con el documento. Comprimir el documento con gzip puede resultar en un gran ahorro en el tiempo de transmisión; para ver un ejemplo, consulte la Sección 4.4 (Envío de páginas web comprimidas).

* ***`Content-Language`***

El encabezado Content-Language indica el idioma en el que está escrito el documento. El valor del encabezado debe ser uno de los códigos de idioma estándar, como en , en-us , da , etc. Consulte RFC 1766 para obtener detalles (puede acceder a los RFC en línea en uno de los sitios de archivo enumerados en http:// www.rfc-editor.org/ ).

* ***`Content-Length`***

Este encabezado indica el número de bytes en la respuesta. Esta información es necesaria solo si el navegador utiliza una conexión HTTP persistente (mantener activa). Consulte el encabezado Conexión para determinar cuándo el navegador admite conexiones persistentes. Si desea que su servlet aproveche las conexiones persistentes cuando el navegador lo admita, su servlet debe escribir el documento en un ByteArrayOutputStream , buscar su tamaño cuando haya terminado, colocarlo en el campo Content-Length con response.setContentLength y luego enviar el contenido a través de byteArrayStream.writeTo(response.getOutputStream()) . Para ver un ejemplo de este enfoque, consulte la Sección 7.4 .

* ***`Content-Location`***

Este encabezado proporciona una dirección alternativa para el documento solicitado. Content-Location es informativo; las respuestas que incluyen este encabezado también incluyen el documento solicitado, a diferencia del caso del encabezado Ubicación . Este encabezado es nuevo en HTTP 1.1.

* ***`Content-MD5`***

El encabezado de respuesta Content-MD5 proporciona un resumen MD5 para el documento posterior. Este resumen proporciona una verificación de la integridad del mensaje para los clientes que desean confirmar que recibieron el documento completo e inalterado. Consulte RFC 1864 para obtener detalles sobre MD5. Este encabezado es nuevo en HTTP 1.1.

* ***`Content-Range`***

Este nuevo encabezado HTTP 1.1 se envía con respuestas de documentos parciales y especifica cuánto se envió del documento total. Por ejemplo, un valor de " bytes 500-999/2345 " significa que la respuesta actual incluye los bytes 500 a 999 de un documento que contiene 2345 bytes en total.

* ***`Content-Type`***

El encabezado Content-Type brinda el tipo MIME (Extensión de correo de Internet multipropósito) del documento de respuesta. Establecer este encabezado es tan común que hay un método especial en HttpServletResponse para ello: setContentType . Los tipos MIME tienen la forma maintype/subtype para los tipos registrados oficialmente y la forma maintype/x-subtype para los tipos no registrados. El tipo MIME predeterminado para los servlets es text/plain , pero los servlets suelen especificar explícitamente text/html . Sin embargo, pueden especificar otros tipos en su lugar. Por ejemplo, la Sección 7.5(Uso de servlets para generar imágenes GIF) presenta un servlet que construye una imagen GIF basada en la entrada proporcionada al especificar el tipo de contenido de la imagen/gif , y la Sección 11.2 (El atributo contentType) muestra cómo los servlets y las páginas JSP pueden generar hojas de cálculo de Excel especificando un tipo de contenido de application/vnd.ms-excel .

La Tabla 7.1 enumera algunos de los tipos MIME más comunes utilizados por los servlets.

Para obtener más detalles, muchos de los tipos MIME comunes se enumeran en RFC 1521 y RFC 1522 (nuevamente, consulte http://www.rfc-editor.org/ para obtener una lista de sitios de archivos RFC). Sin embargo, los nuevos tipos MIME se registran todo el tiempo, por lo que una lista dinámica es un mejor lugar para buscar. Los tipos registrados oficialmente se enumeran en http://www.isi.edu/in-notes/iana/assignments/media-types/media-types . Para tipos comunes no registrados, http://www.ltsw.se/knbase/internet/mime.htp es una buena fuente.

Tabla 7.1. Tipos comunes de MIME
Tipo	Significado
aplicación/msword	Documento de Microsoft Word
aplicación/flujo de octetos	Datos no reconocidos o binarios
Solicitud PDF	archivo acróbata (.pdf)
solicitud/posdata	Archivo PostScript
aplicación/vnd.lotus-notas	archivo de notas de loto
aplicación/vnd.ms-excel	hoja de cálculo de Excel
aplicación/vnd.ms-powerpoint	presentación de Powerpoint
aplicación/x-gzip	archivo gzip
aplicación/x-java-archivo	archivo JAR
application/x-java-serialized-object	Objeto Java serializado
aplicación/x-java-vm	Archivo de código de bytes Java (.class)
aplicación/código postal	Archivo zip
audio/básico	Archivo de sonido en formato .au o .snd
audio/x-aiff	Archivo de sonido AIFF
audio/x-wav	Archivo de sonido de Microsoft Windows
audio/midi	archivo de sonido midi
texto/css	Hoja de estilo en cascada HTML
texto/html	documento HTML
Texto sin formato	Texto sin formato
imagen/gif	imagen GIF
imagen/jpeg	imagen JPEG
imagen/png	imagen PNG
imagen/tiff	imagen TIFF
imagen/x-xbitmap	Imagen de mapa de bits de X Window
vídeo/mpeg	videoclip MPEG
vídeo/tiempo rápido	Videoclip de QuickTime

* ***`Date`***

Este encabezado especifica la fecha actual en formato GMT. Si desea establecer la fecha de un servlet, use el método setDateHeader para especificarlo. Ese método le ahorra la molestia de formatear la cadena de fecha correctamente, como sería necesario con response.setHeader("Date", "...") . Sin embargo, la mayoría de los servidores configuran este encabezado automáticamente, por lo que los servlets no suelen necesitarlo.

* ***`ETag`***

Este nuevo encabezado HTTP 1.1 da nombres a los documentos devueltos para que el cliente pueda hacer referencia a ellos más tarde (como con el encabezado de solicitud If-Match ).

* ***`Expires`***

Este encabezado estipula el momento en que el contenido debe considerarse obsoleto y, por lo tanto, ya no se almacenará en caché. Un servlet podría usar esto para un documento que cambia con relativa frecuencia, para evitar que el navegador muestre un valor almacenado en caché obsoleto. Por ejemplo, lo siguiente indicaría al navegador que no almacene en caché el documento durante más de 10 minutos

  long currentTime = System.currentTimeMillis();

  diez minutos largos = 10*60*1000; // En milisegundos

  respuesta.setDateHeader("Caduca",

                         horaActual + diezMinutos);
Consulte también la edad máximavalor del encabezado Cache-Control .

* ***`Last-Modified`***

Este encabezado muy útil indica cuándo se modificó por última vez el documento. Luego, el cliente puede almacenar en caché el documento y proporcionar una fecha mediante un encabezado de solicitud If-Modified-Since en solicitudes posteriores. Esta solicitud se trata como un GET condicional , y el documento solo se devuelve si Last-Modifiedla fecha es posterior a la especificada para If-Modified-Since . De lo contrario, se devuelve una línea de estado 304 ( No modificado ) y el cliente usa el documento almacenado en caché. Si configura este encabezado explícitamente, use el método setDateHeader para ahorrarse la molestia de formatear las cadenas de fecha GMT. Sin embargo, en la mayoría de los casos, simplemente implementa el método getLastModified y deja que el método de servicio estándar maneje las solicitudes If-Modified-Since . Para ver un ejemplo, consulte la Sección 2.8 (Un ejemplo usando fechas de inicialización de servlet y modificación de página).

* ***`Location`***

Este encabezado, que debe incluirse con todas las respuestas que tienen un código de estado en los 300, notifica al navegador la dirección del documento. El navegador se vuelve a conectar automáticamente a esta ubicación y recupera el nuevo documento. Este encabezado generalmente se establece indirectamente, junto con un código de estado 302, mediante el método sendRedirect de HttpServletResponse . Se da un ejemplo en la Sección 6.3 (Un front-end para varios motores de búsqueda).

* ***`Pragma`***

Proporcionar este encabezado con un valor de no caché indica a los clientes HTTP 1.0 que no almacenen en caché el documento. Sin embargo, la compatibilidad con este encabezado no era compatible con los navegadores HTTP 1.0. En HTTP 1.1, " Cache-Control: no-cache " es un reemplazo más confiable.

* ***`Refresh`***

Este encabezado indica qué tan pronto (en segundos) el navegador debe solicitar una página actualizada. Por ejemplo, para decirle al navegador que solicite una nueva copia en 30 segundos, especificaría un valor de 30 con

  respuesta.setIntHeader("Actualizar", 30)
Tenga en cuenta que Refresh no estipula actualizaciones continuas; simplemente especifica cuándo debería ser la próxima actualización. Por lo tanto, debe continuar brindando Actualizar en todas las respuestas posteriores, y enviar un código de estado 204 ( Sin contenido ) evita que el navegador se vuelva a cargar. Para ver un ejemplo, consulte la Sección 7.3 (Estado persistente del servlet y páginas de recarga automática).

En lugar de que el navegador simplemente vuelva a cargar la página actual, puede especificar la página para cargar. Para ello, proporcione un punto y coma y una URL después del tiempo de actualización. Por ejemplo, para decirle al navegador que vaya a http://host/ruta después de 5 segundos, haría lo siguiente.

  respuesta.setHeader("Actualizar", "5; URL=http://host/ruta")
Esta configuración es útil para las "pantallas de presentación", en las que se muestra brevemente una imagen o un mensaje introductorio antes de cargar la página real.

Tenga en cuenta que este encabezado se establece comúnmente por

  <META HTTP-EQUIV="Actualizar"
        CONTENIDO="5; URL=http://host/ruta">
en la sección HEAD de la página HTML, en lugar de como un encabezado explícito del servidor. Ese uso se produjo porque la recarga o el reenvío automático es algo que a menudo desean los autores de páginas HTML estáticas. Sin embargo, para los servlets, establecer el encabezado directamente es más fácil y claro.

Este encabezado no forma parte oficialmente de HTTP 1.1, pero es una extensión compatible con Netscape e Internet Explorer.

* ***`Retry-After`***

Este encabezado se puede usar junto con una respuesta 503 ( Servicio no disponible ) para decirle al cliente cuándo puede repetir su solicitud.

* ***`Server`***

Este encabezado identifica el servidor web. Los servlets no suelen establecer esto; el propio servidor Web lo hace.

* ***`Set-Cookie`***

El encabezado Set-Cookie especifica una cookie asociada con la página. Cada cookie requiere un Set-Cookie por separadoencabezamiento. Los servlets no deben usar response.setHeader("Set-Cookie", ...) , sino que deben usar el método addCookie de propósito especial de HttpServletResponse . Para obtener más información, consulte el Capítulo 8 (Manejo de cookies). Técnicamente, Set-Cookie no es parte de HTTP 1.1. Originalmente era una extensión de Netscape, pero ahora es ampliamente compatible, tanto en Netscape como en Internet Explorer.

* ***`Trailer`***

Este encabezado HTTP 1.1 nuevo y poco utilizado identifica los campos de encabezado que están presentes en el tráiler de un mensaje que se envía con codificación de transferencia "fragmentada". Consulte la Sección 3.6 de la especificación HTTP 1.1 (RFC 2616) para obtener más información. Recuerde que http://www.rfc-editor.org/ mantiene una lista actualizada de sitios de archivos RFC.

* ***`Transfer-Encoding`***

Proporcionar a este encabezado un valor de fragmentado indica una codificación de transferencia "fragmentada". Consulte la Sección 3.6 de la especificación HTTP 1.1 (RFC 2616) para obtener más información.

* ***`Upgrade`***

Este encabezado se usa cuando el cliente usa por primera vez el encabezado de solicitud de actualización para pedirle al servidor que cambie a uno de varios protocolos nuevos posibles. Si el servidor está de acuerdo, envía un código de estado 101 ( Protocolos de conmutación ) e incluye un encabezado de respuesta de actualización con el protocolo específico al que se está cambiando. Esta negociación de protocolo generalmente la lleva a cabo el propio servidor, no un servlet.

* ***`Vary`***

Este nuevo encabezado HTTP 1.1 que rara vez se usa le dice al cliente qué encabezados se pueden usar para determinar si el documento de respuesta se puede almacenar en caché.

* ***`Via`***

Las puertas de enlace y los proxies utilizan este encabezado para enumerar los sitios intermedios por los que pasó la solicitud. Es nuevo en HTTP 1.1.

* ***`Warning`***

Este encabezado general nuevo y poco utilizado le permite advertir a los clientes sobre errores de almacenamiento en caché o transformación de contenido.

* ***`WWW-Authenticate`***

Este encabezado siempre se incluye con un código de estado 401 ( no autorizado ). Le dice al navegador qué tipo de autorización y dominio debe proporcionar el cliente en su encabezado de Autorización . Con frecuencia, los servlets permiten que las páginas web protegidas con contraseña sean manejadas por los mecanismos especializados del servidor web (por ejemplo, .htaccess ) en lugar de manejarlas directamente. Para ver un ejemplo de servlets que tratan directamente con este encabezado, consulte la Sección 4.5 (Restricción del acceso a las páginas web).

## 7.3. Estado de servlet persistente y páginas de recarga automática
Aquí hay un ejemplo que le permite pedir una lista de algunos números primos grandes elegidos al azar. Este cálculo puede llevar algún tiempo para números muy grandes (p. ej., 150 dígitos), por lo que el servlet devuelve inmediatamente los resultados iniciales pero luego sigue calculando, utilizando un subproceso de baja prioridad para que no degrade el rendimiento del servidor web. Si los cálculos no están completos, el servlet le indica al navegador que solicite una nueva página en unos segundos enviándole un encabezado Actualizar .

Además de ilustrar el valor de los encabezados de respuesta HTTP, este ejemplo muestra otras dos valiosas capacidades de servlet. Primero, muestra que el mismo servlet puede manejar múltiples conexiones simultáneas, cada una con su propio hilo. Entonces, mientras un subproceso está terminando un cálculo para un cliente, otro cliente puede conectarse y aún ver resultados parciales.

En segundo lugar, este ejemplo muestra lo fácil que es para los servlets mantener el estado entre solicitudes, algo que es engorroso de implementar en CGI tradicional y muchas alternativas de CGI. Solo se crea una única instancia del servlet, y cada solicitud simplemente da como resultado un nuevo subproceso que llama al método de servicio del servlet (que llama a doGet o doPost ). Por lo tanto, los datos compartidos simplemente deben colocarse en una variable de instancia regular (campo) del servlet. Por lo tanto, el servlet puede acceder al cálculo en curso apropiado cuando el navegador vuelve a cargar la página y puede mantener una lista de los Nresultados solicitados más recientemente, devolviéndolos inmediatamente si una nueva solicitud especifica los mismos parámetros que una reciente. Por supuesto, las reglas normales que requieren que los autores sincronicen el acceso multiproceso a los datos compartidos aún se aplican a los servlets. Los servlets también pueden almacenar datos persistentes en el objeto ServletContext que está disponible a través del método getServletContext . ServletContext tiene métodos setAttribute y getAttribute que le permiten almacenar datos arbitrarios asociados con claves específicas. La diferencia entre almacenar datos en variables de instancia y almacenarlos en el ServletContext es que el ServletContextes compartido por todos los servlets en el motor de servlet (o en la aplicación web, si su servidor admite tal capacidad).

El listado 7.1 muestra la clase de servlet principal. Primero, recibe una solicitud que especifica dos parámetros: numPrimesy numDigits . Estos valores normalmente se recopilan del usuario y se envían al servlet por medio de un formulario HTML simple. El Listado 7.2 muestra el código fuente y la Figura 7-1 muestra el resultado. Luego, estos parámetros se convierten a números enteros por medio de una sencilla utilidad que usa Integer.parseInt (vea el Listado 7.5 ). Estos valores luego se comparan con findPrimeListmétodo a un vector de cálculos recientes o en curso para ver si hay un cálculo anterior correspondiente a los mismos dos valores. Si es así, ese valor anterior (de tipo PrimeList) se utiliza; de lo contrario, se crea una nueva PrimeList y se almacena en el Vector de cálculos en curso, desplazando potencialmente a la lista anterior más antigua. A continuación, se comprueba esa PrimeList para determinar si ha terminado de encontrar todos sus números primos. De lo contrario, se envía al cliente un encabezado Actualizar para indicarle que regrese en cinco segundos para obtener resultados actualizados. De cualquier manera, se devuelve al cliente una lista con viñetas de los valores actuales.

Figura 7-1. Resultado de PrimeNumbers.html , utilizado como interfaz para el servlet PrimeNumbers .



Los listados 7.3 (PrimeList.java) y 7.4 (Primes.java) presentan el código auxiliar utilizado por el servlet. PrimeList.java maneja el subproceso de fondo para la creación de una lista de números primos para un conjunto específico de valores. Primes.java contiene los algoritmos de bajo nivel para elegir un número aleatorio de una longitud específica y luego encontrar un número primo en ese valor o por encima de él. Utiliza métodos incorporados en BigIntegerclase; el algoritmo para determinar si el número es primo es probabilístico y, por lo tanto, tiene la posibilidad de equivocarse. Sin embargo, se puede especificar la probabilidad de equivocarse, y utilizo un valor de error de 100. Suponiendo que el algoritmo utilizado en la mayoría de las implementaciones de Java es la prueba de Miller-Rabin, la probabilidad de reportar falsamente un número compuesto como primo es probablemente menor que 2 100 . Es casi seguro que es menor que la probabilidad de que un error de hardware o una radiación aleatoria provoquen una respuesta incorrecta en un algoritmo determinista y, por lo tanto, el algoritmo puede considerarse determinista.

Listado 7.1. PrimeNumbers.java
paquete coreservlets;

importar java.io.*;
importar javax.servlet.*;
importar javax.servlet.http.*;
importar java.util.*;

/** Servlet que procesa una solicitud para generar n
 * números primos, cada uno con al menos m dígitos.
 * Realiza los cálculos en un segundo plano de baja prioridad
 * subproceso, devolviendo solo los resultados que ha encontrado hasta ahora.
 * Si estos resultados no están completos, envía un Refresh
 * encabezado que indica al navegador que solicite nuevos resultados a
 * poco tiempo después. También mantiene una lista de
 * pequeño número de listas de números primos calculadas previamente
 * para devolver inmediatamente a cualquiera que suministre el
 * misma n y m como un cálculo completado recientemente.
 */

clase pública PrimeNumbers extiende HttpServlet {
  vector privado primeListVector = nuevo Vector();
  privado int maxPrimeLists = 30;

  doGet public void (solicitud HttpServletRequest,
                    respuesta HttpServletResponse)
      lanza ServletException, IOException {
    int numeroPrimos =
      ServletUtilities.getIntParameter(solicitud,
                                       "numPrimos", 50);
    int numDigits =
      ServletUtilities.getIntParameter(solicitud,
                                       "numDigits", 120);
    listaprincipal listaprincipal =
      findPrimeList(primeListVector, numPrimes, numDigits);

    if (listaprincipal == nulo) {
      primeList = new PrimeList(numPrimes, numDigits, true);
      // Múltiples subprocesos de solicitud de servlet comparten la instancia
      // variables (campos) de PrimeNumbers. Entonces
      // sincronizar todos los accesos a los campos del servlet.
      sincronizado(primeListVector) {
        si (primeListVector.size() >= maxPrimeLists)
          primeListVector.removeElementAt(0);
        primeListVector.addElement(principalLista);
      }
    }
    Vector currentPrimes = primeList.getPrimes();
    int numCurrentPrimes = currentPrimes.size();
    int numPrimesRemaining = (numPrimes - numCurrentPrimes);
    booleano isLastResult = (numPrimesRemaining == 0);
    if (!isLastResult) { 
						respuesta.setHeader("Actualizar", "5");
    }
    respuesta.setContentType("texto/html");
    PrintWriter out = respuesta.getWriter();
    String title = "Algunos" + numDigits + "-Digit Prime Numbers";
    out.println(ServletUtilities.headWithTitle(título) +
                "<CUERPO BGCOLOR=\"#FDF5E6\">\n" +
                "<H2 ALIGN=CENTER>" + título + "</H2>\n" +
                "<H3>Primos encontrados con " + numDigits +
                " o más dígitos: " + numCurrentPrimes +
                ".</H3>");
    si (es el último resultado)
      out.println("<B>Búsqueda terminada.</B>");
    demás
      out.println("<B>Todavía buscando " + numPrimesRemaining +
                  " más<BLINK>...</BLINK></B>");
    out.println("<OL>");
    for(int i=0; i<númeroPrimosActuales; i++) {
      out.println(" <LI>" + currentPrimes.elementAt(i));
    }
    salida.println("</OL>");
    salida.println("</BODY></HTML>");
  }

  public void doPost (solicitud HttpServletRequest,
                     respuesta HttpServletResponse)
      lanza ServletException, IOException {
    doGet(solicitud, respuesta);
  }

  // Ver si hay una existente en curso o completada
  // calculo con el mismo numero de primos y numero
  // de dígitos por número primo. Si es así, devuelva esos resultados en su lugar
  // de iniciar un nuevo hilo de fondo. mantener esta lista
  // pequeño para que el servidor web no utilice demasiada memoria.
  // Sincronizar el acceso a la lista ya que puede haber
  // múltiples solicitudes simultáneas.

  PrimeList privado findPrimeList(Vector primeListVector,
                                  números primos int,
                                  número de dígitos int) {
    sincronizado(primeListVector) {
      for(int i=0; i<primeListVector.size(); i++) {
        PrimeList primos =
          (PrimeList)primeListVector.elementAt(i);
        if ((numPrimos == primos.numPrimos()) &&
            (numDigits == números primos.numDigits()))
          retorno(primos);
      }
      retorno (nulo);
    }
  }
}

Listado 7.2. PrimeNumbers.html
<!DOCTYPE HTML PÚBLICO "-//W3C//DTD HTML 4.0 Transicional//EN">
<HTML>
<JEFE>
  <TITLE>Encontrar números primos grandes</TITLE>
</HEAD>

<CUERPO BGCOLOR="#FDF5E6">
<H2 ALIGN="CENTER">Encontrar números primos grandes</H2>
<BR><BR>
<CENTRO>
<FORM ACTION="/servlet/coreservlets.PrimeNumbers">
  <B>Número de primos a calcular:</B>
  <INPUT TYPE="TEXT" NAME="numPrimes" VALUE=25 SIZE=4><BR>
  <B>Número de dígitos:</B>
  <INPUT TYPE="TEXT" NAME="numDigits" VALUE=150 TAMAÑO=3><BR>
  <INPUT TYPE="SUBMIT" VALUE="Comenzar a calcular">
</FORMULARIO>
</CENTRO>
</BODY>
</HTML>

Figura 7-2. Resultado intermedio de una solicitud al servlet PrimeNumbers . Este resultado se puede obtener cuando el navegador se recarga automáticamente o cuando un cliente diferente ingresa de forma independiente los mismos parámetros que los de una solicitud en curso o reciente. De cualquier manera, el navegador recargará automáticamente la página para obtener resultados actualizados.



Figura 7-3. Resultado final de una solicitud al servlet PrimeNumbers . Este resultado se puede obtener cuando el navegador se recarga automáticamente o cuando un cliente diferente ingresa de forma independiente los mismos parámetros que los de una solicitud en curso o reciente. El navegador dejará de actualizar la página en este punto.



Listado 7.3. PrimeList.java
paquete coreservlets;

importar java.util.*;
importar java.math.BigInteger;

/** Crea un Vector de grandes números primos, normalmente en
 * un subproceso de fondo de baja prioridad. Proporciona algunos pequeños
 * Métodos de acceso seguros para subprocesos.
*/

clase pública PrimeList implementa Runnable {
  primos vectoriales privados encontrados;
  privado int númerosPrimos, númerosDígitos;

  /** Encuentra numPrimes números primos, cada uno de los cuales es
   * numDigits largo o más largo. Puede configurarlo solo
   * devuélvalo cuando haya terminado, o haga que lo devuelvan de inmediato,
   * y luego puede sondearlo para ver qué tan lejos
   * ha conseguido.
   */
  public PrimeList(int numPrimes, int numDigits,
                   booleano runInBackground) {
    // Usando Vector en lugar de ArrayList
    // para admitir motores de servlet JDK 1.1
    primosEncontrados = nuevo Vector(numPrimos);
    this.numPrimes = numPrimes;
    this.numDigits = numDigits;
    si (ejecutar en segundo plano) {
      Subproceso t = nuevo subproceso (esto);
      // Use baja prioridad para no ralentizar el servidor.
      t.setPriority(Subproceso.MIN_PRIORIDAD);
      t.start();
    } demás {
      correr();
    }
  }

  ejecución de vacío público () {
    BigInteger start = Primes.random(numDigits);
    for(int i=0; i<numeroPrimos; i++) {
      inicio = Primes.nextPrime(inicio);
      sincronizado(esto) {
        primesFound.addElement(inicio);
      }
    }
  }

  booleano público sincronizado isDone() {
    return(primosEncontrados.tamaño() == numeroPrimos);
  }
  vector sincronizado público getPrimes() {
    si (está Terminado())
      return(primosEncontrados);
    demás
      return((Vector)primosEncontrados.clon());
  }

  public int numDigits() {
    retorno(numeroDigitos);
  }

  public int numPrimes() {
    return(numPrimos);
  }

  público sincronizado int numCalculatedPrimes() {
    return(primosEncontrados.tamaño());
  }
}

Listado 7.4. primos.java
paquete coreservlets;

importar java.math.BigInteger;

/** Algunas utilidades para generar un BigInteger aleatorio grande,
 * y encuentre el siguiente número primo por encima de un BigInteger dado.
*/

Primos de clase pública {
  // Tenga en cuenta que BigInteger.ZERO era nuevo en JDK 1.2 y 1.1
  // el código se utiliza para admitir la mayoría de los motores de servlet.
  BigInteger final estático privado CERO = new BigInteger ("0");
  BigInteger final estático privado UNO = new BigInteger ("1");
  BigInteger final estático privado DOS = new BigInteger ("2");

  // La probabilidad de falso primo es menor que 1/2^ERR_VAL
  // Supuestamente BigInteger usa la prueba de Miller-Rabin o
  // equivalente, y por lo tanto NO se deja engañar por los números de Carmichael.
  // Consulte la sección 33.8 de la Introducción a la
  // Algoritmos para detalles.
  int final estático privado ERR_VAL = 100;

  BigInteger estático público nextPrime (Inicio de BigInteger) {
    si (es par (inicio))
      inicio = inicio.add(UNO);
    demás
      inicio = inicio.add(DOS);
    si (inicio.esProbablePrime(ERR_VAL))
      retorno (inicio);
    demás
      return(nextPrime(inicio));
  }

  booleano estático privado isEven(BigInteger n) {
    return(n.mod(DOS).equals(CERO));
  }

  privado estático StringBuffer[] dígitos =
    { nuevo StringBuffer("0"), nuevo StringBuffer("1"),
      nuevo StringBuffer("2"), nuevo StringBuffer("3"),
      nuevo StringBuffer("4"), nuevo StringBuffer("5"),
      nuevo StringBuffer("6"), nuevo StringBuffer("7"),
      nuevo StringBuffer("8"), nuevo StringBuffer("9") };

  StringBuffer estático privado randomDigit() {
    índice int = (int)Math.floor(Math.random() * 10);
    return(dígitos[índice]);
  }

  BigInteger estático público aleatorio (int numDigits) {
    StringBuffer s = nuevo StringBuffer("");
    for(int i=0; i<númeroDígitos; i++) {
      s.append(randomDigit());
    }
    return(nuevo BigInteger(s.toString()));
  }

  /** Programa simple de línea de comandos para probar. Ingresar número
   * de dígitos, y elige un número aleatorio de ese
   * longitud y luego imprime los primeros 50 números primos
   * por encima de eso.
   */

  public static void main(String[] args) {
    int numeroDigitos;
    if (args.longitud > 0)
      numDigits = Integer.parseInt(args[0]);
    demás
      numeroDigitos = 150;
    BigInteger start = random(numDigits);
    para(int i=0; i<50; i++) {
      inicio = siguientePrimo(inicio);
      System.out.println("Prime " + i + " = " + inicio);
    }
  }
}

Listado 7.5. ServletUtilities.java
paquete coreservlets;

importar javax.servlet.*;
importar javax.servlet.http.*;


clase pública ServletUtilities {
  // ...

  /** Leer un parámetro con el nombre especificado, convertirlo
   * a un int, y devolverlo. Devolver el valor predeterminado designado
   * valor si el parámetro no existe o si es un
   * formato entero ilegal.
  */

  public static int getIntParameter(HttpServletRequest request, 
						String paramName, 
						int defaultValue) { 
						String paramString = request.getParameter(paramName); 
						int paramValor; 
						prueba { 
						paramValue = Integer.parseInt(paramString); 
						} catch(NumberFormatException nfe) { // formato nulo o incorrecto 
						paramValue = defaultValue; 
						} 
						return(parámetroValor); 
						} 
						// ... 
						}


## 7.4. Uso de conexiones HTTP persistentes
Uno de los problemas con HTTP 1.0 era que requería una conexión de socket separada para cada solicitud. Cuando se recupera una página web que incluye muchas imágenes pequeñas o muchas clases de subprogramas, la sobrecarga de establecer todas las conexiones puede ser significativa en comparación con el tiempo real de descarga de los documentos. Muchos navegadores y servidores admitieron la extensión "keep-alive" para solucionar este problema. Con esta extensión, el servidor le dice al navegador cuántos bytes contiene la respuesta, luego deja la conexión abierta durante un cierto período de tiempo después de devolver el documento. El cliente detecta que el documento ha terminado de cargarse al monitorear la cantidad de bytes recibidos y se vuelve a conectar en el mismo socket para realizar más transacciones. Las conexiones persistentes de este tipo se convirtieron en estándar en HTTP 1.1,Conexión: cierre el encabezado de la solicitud o indirectamente mediante el envío de una solicitud que especifique HTTP/1.0 en lugar de HTTP/1.1 y que no estipule también " Conexión: mantenimiento de conexión ").

Los servlets pueden aprovechar las conexiones persistentes si los servlets están integrados en servidores que los admitan. El servidor debe manejar la mayor parte del proceso, pero no tiene forma de determinar qué tan grande es el documento devuelto. Por lo tanto, el servlet debe configurar el encabezado de respuesta Content-Length por medio de response.setContentLength . Un servlet puede determinar el tamaño del documento devuelto almacenando en búfer la salida por medio de un ByteArrayOutputStream , recuperando la cantidad de bytes con el método de tamaño del flujo de bytes y luego enviando la salida almacenada en búfer al cliente pasando el flujo de salida del servlet al flujo de bytes. método writeTo .

Es probable que el uso de conexiones persistentes solo resulte rentable para los servlets que cargan una gran cantidad de objetos pequeños, donde esos objetos también son generados por servlet y, por lo tanto, no aprovecharían el soporte del servidor para conexiones persistentes. Aun así, la ventaja obtenida varía mucho de un servidor web a otro e incluso de un navegador web a otro. Por ejemplo, la configuración predeterminada para el servidor web Java de Sun es permitir solo cinco conexiones en un solo socket HTTP: un valor que es demasiado bajo para muchas aplicaciones. Aquellos que usan este servidor pueden aumentar el límite yendo a la consola de administración, seleccionando "Servicio web", luego "Ajuste del servicio", luego ingresando un valor en la ventana "Persistencia de la conexión".

El listado 7.6 muestra un servlet que genera una página con 100 etiquetas IMG (vea el resultado en la Figura 7-4 ). Cada una de las etiquetas IMG se refiere a otro servlet ( ImageRetriever , que se muestra en el Listado 7.7 ) que lee un archivo GIF del sistema del servidor y lo devuelve al cliente. Tanto el servlet original como el servlet de ImageRetriever usan conexiones persistentes a menos que se les indique que no lo hagan por medio de un parámetro en el formulario llamado data usePersistence con un valor de no. Con Netscape 4.7 y una conexión de acceso telefónico de 28,8 K para comunicarse con la versión Solaris de Java Web Server 2.0 (con el límite de conexión por encima de 100), el uso de conexiones persistentes redujo el tiempo promedio de descarga entre un 15 y un 20 por ciento.

Figura 7-4. Resultado del servlet PersistentConnection .



Listado 7.6. PersistentConnection.java
paquete coreservlets;

importar java.io.*;
importar javax.servlet.*;
importar javax.servlet.http.*;
importar java.util.*;

/** Ilustra el valor de las conexiones HTTP persistentes para
 * páginas que incluyen muchas imágenes, clases de subprogramas o
 * otro contenido auxiliar que de otro modo requeriría
 * una conexión separada para recuperar.
 */

clase pública PersistentConnection extiende HttpServlet {
  doGet public void (solicitud HttpServletRequest,
                    respuesta HttpServletResponse)
      lanza ServletException, IOException {
    respuesta.setContentType("texto/html");
    ByteArrayOutputStream byteStream = 
						new ByteArrayOutputStream(7000); 
						PrintWriter out = new PrintWriter(byteStream, true);
    Cadena persistenciaFlag =
      request.getParameter("usarPersistencia");
    uso booleanoPersistencia =
      ((bandera de persistencia == nulo) ||
       (!persistenciaFlag.equals("no")));
    Título de cadena;
    si (usar persistencia) {
      title = "Uso de conexión persistente";
    } demás {
      title = "No usar conexión persistente";
    }
    out.println(ServletUtilities.headWithTitle(título) +
                "<CUERPO BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=\"CENTER\">" + título + "</H1>");
    int numImages = 100;
    for(int i=0; i<numImages; i++) {
      out.println(hacerImagen(i, usarPersistencia));
    }
    salida.println("</BODY></HTML>");
    if (usePersistence) { 
						respuesta.setContentLength(byteStream.size()); 
						} 
						byteStream.writeTo(response.getOutputStream());
  }

  cadena privada makeImage(int n, boolean usePersistence) {
    Archivo de cadena =
      "/servlet/coreservlets.ImageRetriever?gifLocation=" +
      "/viñetas/viñeta" + n + ".gif";
    si (! usar persistencia)
      archivo = archivo + "&usePersistence=no";
    return("<IMG SRC=\"" + archivo + "\"\n" +
           " ANCHO=6 ALTO=6 ALT=\"\">");
  }   

  public void doPost (solicitud HttpServletRequest,
                     respuesta HttpServletResponse)
      lanza ServletException, IOException {
    doGet(solicitud, respuesta);
  }
}

Listado 7.7. ImageRetriever.java
paquete coreservlets;

importar java.io.*;
importar javax.servlet.*;
importar javax.servlet.http.*;

/** Un servlet que lee un archivo GIF del sistema local
 * y lo envía al cliente con el tipo MIME apropiado.
 * Incluye el encabezado Content-Length para admitir el
 * uso de conexiones HTTP persistentes a menos que sea explícito
 * se le indicó que no lo hiciera a través de "usePersistence=no".
 * Utilizado por el servlet PersistentConnection.
*/

clase pública ImageRetriever extiende HttpServlet {
  doGet public void (solicitud HttpServletRequest,
                    respuesta HttpServletResponse)
      lanza ServletException, IOException {
    String gifLocation = request.getParameter("gifLocation");
    si ((gifUbicación == nulo) ||
        (gifUbicación.longitud() == 0)) {
      reportError(respuesta, "Archivo de imagen no especificado");
      devolver;
    }
    Archivo de cadena = getServletContext().getRealPath(gifLocation);
    intentar {
      BufferedInputStream en =
        nuevo BufferedInputStream (nuevo FileInputStream (archivo));
      ByteArrayOutputStream byteStream = 
						new ByteArrayOutputStream(512);
      int imageByte;
      while((imageByte = in.read()) != -1) {
        byteStream.write(imageByte);
      }
      cercar();
      Cadena persistenciaFlag =
      request.getParameter("usarPersistencia");
      uso booleanoPersistencia =
        ((bandera de persistencia == nulo) ||
         (!persistenciaFlag.equals("no")));
      respuesta.setContentType("imagen/gif"); 
						if (usePersistence) { 
						respuesta.setContentLength(byteStream.size()); 
						}
      byteStream.writeTo(response.getOutputStream());
    } catch(IOException ioe) {
      reportError(respuesta, "Error: " + ioe);
    }
  }

  public void reportError(HttpServletResponse respuesta,
                          mensaje de cadena)
      lanza IOException {
    respuesta.enviarError(respuesta.SC_NO_ENCONTRADO,
                       mensaje);
  }
}

## 7.5. Uso de servlets para generar imágenes GIF
Aunque los servlets a menudo generan salida HTML, ciertamente no siempre lo hacen. Por ejemplo, la Sección 11.2 (El atributo contentType) muestra una página JSP (que se traduce en un servlet) que crea hojas de cálculo de Excel y las devuelve al cliente. Aquí, te mostraré cómo generar imágenes GIF.

Primero, permítanme resumir los dos pasos principales que deben realizar los servlets para crear contenido multimedia. Primero, deben establecer el encabezado de respuesta de tipo de contenido mediante el método setContentType de HttpServletResponse . En segundo lugar, deben enviar la salida en el formato adecuado. Este formato varía entre los tipos de documentos, por supuesto, pero en la mayoría de los casos utiliza enviar datos binarios, no cadenas como con los documentos HTML. En consecuencia, los servlets normalmente obtendrán el flujo de salida sin procesar mediante el método getOutputStream , en lugar de obtener un PrintWriter mediante el uso de getWriter . Juntando estos dos puntos, los servlets que generan contenido no HTML suelen tener una sección de sumétodo doGet o doPost que se ve así:

respuesta.setContentType("tipo/subtipo");
OutputStream out = respuesta.getOutputStream();

Esos son los dos pasos generales necesarios para crear contenido que no sea HTML. A continuación, veamos los pasos específicos necesarios para generar imágenes GIF.

1.
Crear una imagen .

Crea un objeto de imagen utilizando el método createImage de la clase Component . Dado que los programas del lado del servidor en realidad no deberían abrir ninguna ventana en la pantalla, deben decirle explícitamente al sistema que cree un objeto de sistema de ventana nativo, un proceso que normalmente ocurre automáticamente cuando aparece una ventana. El método addNotify realiza esta tarea. Poniendo todo esto junto, aquí está el proceso normal:

Cuadro f = nuevo Cuadro();
f.addNotify();
ancho int = ...;
int altura = ...;
Imagen img = f.createImage(ancho, alto);

2.
Dibuja en la imagen .

Usted logra esta tarea llamando al método getGraphics de Image y luego usando el objeto Graphics resultante de la manera habitual. Por ejemplo, con JDK 1.1, usaría varios métodos draw Xxx y fill Xxx de Graphics para dibujar imágenes, cadenas y formas en Image . Con la plataforma Java 2, convertiría el objeto Graphics a Graphics2D, luego haga uso del conjunto mucho más completo de Java2D de operaciones de dibujo, transformaciones de coordenadas, configuraciones de fuente y patrones de relleno para realizar el dibujo. Aquí hay un ejemplo simple:

Gráficos g = img.getGraphics();
g.fillRect(...);
g.drawString(...);

3.
Establezca el encabezado de respuesta de tipo de contenido .

Como ya se mencionó, utiliza el método setContentType de HttpServletResponse para esta tarea. El tipo MIME para imágenes GIF es image/gif .

respuesta.setContentType("imagen/gif");

4.
Obtenga un flujo de salida.

Como se mencionó anteriormente, si está enviando datos binarios, debe llamar al método getOutputStream de HttpServletResponse en lugar del método getWriter .

OutputStream out = respuesta.getOutputStream();

5.
Envíe la imagen en formato GIF al flujo de salida.

Realizar esta tarea usted mismo requiere bastante trabajo. Afortunadamente, existen varias clases que realizan esta operación. Una de las más populares es la clase GifEncoder de Jef Poskanzer , disponible gratuitamente en http://www.acme.com/java/ . Así es como usaría esta clase para enviar una imagen en formato GIF:

intentar {
  nuevo GifEncoder(img, out).encode();
} catch(IOException ioe) {
  // Mensaje de error
}

Los listados 7.8 y 7.9 muestran un servlet que lee los parámetros message , fontName y fontSize y los usa para crear una imagen GIF que muestra el mensaje en la cara y tamaño designados, con una versión sombreada oblicua gris del mensaje que se muestra detrás de la cadena principal . Esta operación hace uso de varias funciones disponibles solo en la plataforma Java 2. En primer lugar, utiliza cualquier fuente que esté instalada en el sistema del servidor, en lugar de limitarse a los nombres estándar ( Serif , SansSerif , Monospaced , Dialog y DialogInput ) disponibles para los programas JDK 1.1.

En segundo lugar, utiliza las transformaciones translate , scale y shear para crear la versión sombreada del mensaje principal. En consecuencia, el servlet se ejecutará solo en motores de servlet que se ejecuten en la plataforma Java 2. Es de esperar que este sea el caso de los motores que admiten la especificación de servlet 2.2, ya que esa es la versión de servlet estipulada en J2EE.

Incluso si está utilizando un servidor que solo admite la versión 2.1, debe usar la plataforma Java 2 si puede, ya que tiende a ser significativamente más eficiente para las tareas del lado del servidor. Sin embargo, muchos motores de servlet 2.1 vienen preconfigurados para usar JDK 1.1, y cambiar la versión de Java no siempre es sencillo. Entonces, por ejemplo, Tomcat y JSWDK utilizan automáticamente cualquier versión de Java que esté primero en su PATH , pero Java Web Server usa una versión integrada de JDK 1.1.

El listado 7.10 muestra un formulario HTML utilizado como interfaz para el servlet. Figuras 7-5a 7-8 muestran algunos resultados posibles. Solo para simplificar la experimentación, el Listado 7.11 presenta una aplicación interactiva que le permite especificar el mensaje, el nombre de la fuente y el tamaño de la fuente en la línea de comando, mostrando un JFrame que muestra la misma imagen que devolvería el servlet. La figura 7-9 muestra un resultado típico.

Figura 7-5. Interfaz del servlet ShadowedText .



Figura 7-6. Uso del servlet de generación de GIF para crear el logotipo de un sitio web de libros para niños. (Resultado de enviar el formulario que se muestra en la Figura 7-5 ).



Figura 7-7. Uso del servlet de generación de GIF para crear la imagen del título de un sitio que describe una compañía de teatro local.



Figura 7-8. Uso del servlet de generación de GIF para crear una imagen para una página que anuncia un carnaval local.



Figura 7-9. aplicación ShadowedTextFrame cuando se invoca con “ java coreservlets.ShadowedTextFrame "Tom's Tools" Haettenschweiler 100 ”.



Listado 7.8. TextoSombreado.java
paquete coreservlets;

importar java.io.*;
importar javax.servlet.*;
importar javax.servlet.http.*;
importar java.awt.*;

/** Servlet que genera imágenes GIF que representan
 * un mensaje designado con una sombra oblicua
 * versión detrás de él.
 * <P>
 * <B>Solo se ejecuta en servidores que soportan Java 2, ya que
 * se basa en Java2D para construir las imágenes.</B>
 */
clase pública ShadowedText extiende HttpServlet {
  doGet public void (solicitud HttpServletRequest,
                    respuesta HttpServletResponse)
      lanza ServletException, IOException {
    Cadena mensaje = request.getParameter("mensaje");
    if ((mensaje == nulo) || (mensaje.longitud() == 0)) {
      mensaje = "Falta el parámetro 'mensaje'";
    }
    String fontName = request.getParameter("fontName");
    if (nombre de fuente == nulo) {
      nombre de fuente = "Serif";
    }
    String fontSizeString = request.getParameter("fontSize");
    int tamaño de fuente;
    intentar {

      fontSize = Integer.parseInt(fontSizeString);
    } catch(NumberFormatException nfe) {
      tamaño de fuente = 90;
    }
    respuesta.setContentType("imagen/gif"); 
						OutputStream out = respuesta.getOutputStream(); 
						Image messageImage = 
						MessageImage.makeMessageImage(message, 
						fontName, 
						fontSize); 
						ImagenMensaje.sendAsGIF(ImagenMensaje, salida);
  }

  /** Permitir que el formulario envíe datos a través de GET o POST. */
 
  public void doPost (solicitud HttpServletRequest,
                     respuesta HttpServletResponse)
      lanza ServletException, IOException {
    doGet(solicitud, respuesta);
  }
}

Listado 7.9. ImagenMensaje.java
paquete coreservlets;

importar java.awt.*;
importar java.awt.geom.*;
importar java.io.*;
importar Acme.JPM.Encoders.GifEncoder;

/** Utilidades para construir imágenes mostrando mensajes sombreados.
 * Incluye una rutina que utiliza GifEncoder de Jef Poskanzer
 * para devolver el resultado como un GIF.
 * <P>
 * <B>No se ejecuta en JDK 1.1, ya que se basa en Java2D
 * para construir las imágenes.</B>
 * <P>
 */
imagen de mensaje de clase pública {

  /** Crea una imagen de una cadena con un oblicuo
   * sombra detrás de él. Utilizado por el servlet ShadowedText
   * y la aplicación de escritorio ShadowedTextFrame.
   */
  imagen estática pública makeMessageImage (mensaje de cadena,
                                       Cadena nombre de fuente,
                                       tamaño de fuente int) {
    Cuadro f = nuevo Cuadro();
    // Conéctese al recurso de pantalla nativo para la creación de imágenes.
    f.addNotify();
    // Asegúrese de que Java conozca los nombres de las fuentes locales.
    Entorno de gráficos env =
      Entorno de Gráficos.getLocalGraphicsEnvironment();
    env.getAvailableFontFamilyNames();
    Font font = new Font(fontName, Font.PLAIN, fontSize);
    Métricas de FontMetrics = f.getFontMetrics(fuente);
    int messageWidth = metrics.stringWidth(mensaje);
    int línea baseX = ancho del mensaje/10;
    ancho int = ancho del mensaje + 2 * (línea base X + tamaño de fuente);
    altura int = tamaño de fuente * 7/2;
    int línea baseY = altura*8/10;
    Imagen mensajeImagen = f.createImage(ancho, alto);
    Gráficos2D g2d =
      (Gráficos2D)imagen del mensaje.getGraphics();
    g2d.setFont(fuente);
    g2d.translate(línea baseX, línea baseY);
    g2d.setPaint(Color.gris claro);
    AffineTransform origTransform = g2d.getTransform();
    g2d.corte(-0.95, 0);
    g2d.escala(1, 3);
    g2d.drawString(mensaje, 0, 0);
    g2d.setTransform(origTransform);
    g2d.setPaint(Color.negro);
    g2d.drawString(mensaje, 0, 0);
    return(mensajeImagen);
  }

  /** Utiliza GifEncoder para enviar la imagen hacia abajo en el flujo de salida
   * en formato GIF89A. Consulte http://www.acme.com/java/ para
   * la clase GifEncoder.
   */

  public static void sendAsGIF (imagen de imagen, OutputStream out) {
    intentar {
      nuevo GifEncoder(imagen, salida).encode();
    } catch(IOException ioe) {
      System.err.println("Error al generar GIF: " + ioe);
    }
  }
}

Listado 7.10. Texto sombreado.html
<!DOCTYPE HTML PÚBLICO "-//W3C//DTD HTML 4.0 Transicional//EN">
<HTML>
<JEFE>
  <TITLE>Servicio de generación de GIF</TITLE>
</HEAD>

<CUERPO BGCOLOR="#FDF5E6">
<H1 ALIGN="CENTER">Servicio de generación de GIF</H1>
Bienvenido a la edición de prueba <I>gratuita</I> de nuestro GIF
servicio de generación. Introduzca un mensaje, un nombre de fuente,
y un tamaño de fuente a continuación, luego envíe el formulario. Vas a
devolverá una imagen GIF que muestre el mensaje en el
fuente designada, con una "sombra" oblicua del mensaje
Detrás de eso. Una vez que obtiene una imagen con la que está satisfecho, a la derecha
haga clic en él (o haga clic mientras mantiene presionada la tecla MAYÚS) para guardar
a su disco local.
<P>
El servidor se encuentra actualmente en Windows, por lo que el nombre de la fuente debe
ser un nombre de fuente Java estándar (p. ej., Serif, SansSerif,
o Monoespaciado) o un nombre de fuente de Windows (por ejemplo, Arial Black).
Los nombres de fuentes no reconocidos volverán a ser Serif.

<FORM ACTION="/servlet/coreservlets.ShadowedText" >
  <CENTRO>
    Mensaje:
    <TIPO DE ENTRADA="TEXTO" NOMBRE="mensaje"><BR>
    Nombre de la fuente:
    <INPUT TYPE="TEXT" NAME="fontName" VALUE="Serif"><BR>
    Tamaño de fuente:
    <INPUT TYPE="TEXT" NAME="fontSize" VALUE="90"><BR><BR>
    <TIPO de entrada="ENVIAR" VALOR="Imagen de compilación">
  </CENTRO>
</FORMULARIO>

</BODY>
</HTML>

Listado 7.11. ShadowedTextFrame.java
paquete coreservlets;

importar java.awt.*;
importar javax.swing.*;
importar java.awt.geom.*;

/** Interfaz interactiva para la clase MessageImage.
 * Ingrese el mensaje, el nombre de la fuente y el tamaño de la fuente en el comando
 * línea. Requiere Java2.
 */

clase pública ShadowedTextFrame extiende JPanel {
  Imagen de mensaje de imagen privada;

  public static void main(String[] args) {
    Mensaje de cadena = "Texto sombreado";
    if (args.longitud > 0) {
      mensaje = argumentos[0];
    }
    String fontName = "Serif";
    if (args.longitud > 1) {
      nombreFuente = argumentos[1];
    }
    int tamaño de fuente = 90;
    if (args.longitud > 2) {
      intentar {
        fontSize = Integer.parseInt(args[2]);
      } catch(NúmeroFormatException nfe) {}
    }
    Marco JFrame = new JFrame("Texto sombreado");
    frame.addWindowListener(nuevo ExitListener());
    Panel JPanel =
      nuevo ShadowedTextFrame (mensaje, nombre de fuente, tamaño de fuente);
    marco.setContentPane(panel);
    cuadro.paquete();
    marco.setVisible(verdadero);
  }

  público ShadowedTextFrame (mensaje de cadena,
                           Cadena nombre de fuente,
                           tamaño de fuente int) {
    mensajeImagen = MensajeImagen.makeMessageImage(mensaje,
                                                 nombre de la fuente,
                                                 tamaño de fuente);
    int ancho = mensajeImagen.getWidth(esto);
    int altura = mensajeImagen.getHeight(esto);
    setPreferredSize(nueva Dimensión(ancho, alto));
  }
  public void paintComponent(Gráficos g) {
    super.paintComponent(g);
    g.drawImage(mensajeImagen, 0, 0, esto);
  }
}

Listado 7.12. ExitListener.java
paquete coreservlets;

importar java.awt.*;
importar java.awt.event.*;

/** Un oyente que adjuntas al Frame o JFrame de nivel superior
 * de su aplicación, por lo que al salir del marco sale de la aplicación.
 */

Clase pública ExitListener extiende WindowAdapter {
  cierre de ventana public void (evento WindowEvent) {
    Sistema.salir(0);
  }
}


