# Capítulo 5. ACCESO A LAS VARIABLES CGI ESTÁNDAR
Temas de este capítulo

La idea de las “variables CGI”

El servlet equivalente de cada variable CGI estándar

Un servlet que muestra los valores de todas las variables CGI

Si llega a los servlets con experiencia en la programación tradicional de interfaz de puerta de enlace común (CGI), probablemente esté acostumbrado a la idea de las "variables CGI". Se trata de una recopilación un tanto ecléctica de información sobre la solicitud actual. Algunos se basan en la línea de solicitud HTTP y los encabezados (p. ej., datos de formulario), otros se derivan del propio socket (p. ej., el nombre y la dirección IP del host solicitante) y otros se toman de los parámetros de instalación del servidor (p. ej., la asignación de direcciones URL a rutas reales).

Aunque probablemente tenga más sentido pensar en diferentes fuentes de datos (datos de solicitud, información del servidor, etc.) como distintos, los programadores de CGI experimentados pueden encontrar útil ver el equivalente de servlet de cada una de las variables de CGI. Si no tiene experiencia en CGI tradicional, primero, cuente sus bendiciones; Los servlets son más fáciles de usar, más flexibles y más eficientes que el CGI estándar. En segundo lugar, simplemente hojee este capítulo, observando las partes que no están directamente relacionadas con la solicitud HTTP entrante. En particular, observe que puede usar getServletContext().getRealPath para asignar un URI (la parte de la URL que viene después del host y el puerto) a una ruta real y que puede usar request.getRemoteHost y request.getRemoteAddresspara obtener el nombre y la dirección IP del cliente.
