# Capítulo 4. MANEJO DE LA SOLICITUD DEL CLIENTE: CABECERA DE SOLICITUD HTTP
Temas de este capítulo

Lectura de encabezados de solicitud HTTP de servlets

Creación de una tabla de todos los encabezados de solicitud

El propósito de cada uno de los encabezados de solicitud HTTP 1.1

Reducir los tiempos de descarga mediante la compresión de páginas

Restricción del acceso con servlets protegidos por contraseña

Una de las claves para crear servlets efectivos es comprender cómo manipular el Protocolo de transferencia de hipertexto (HTTP). Obtener una comprensión completa de este protocolo no es un tema teórico esotérico, sino más bien un problema práctico que puede tener un impacto inmediato en el rendimiento y la usabilidad de sus servlets. Este capítulo analiza la información HTTP que se envía desde el navegador al servidor en forma de encabezados de solicitud. Explica cada uno de los encabezados de solicitud HTTP 1.1, resumiendo cómo y por qué se usarían en un servlet. El capítulo también incluye tres ejemplos detallados: enumerar todos los encabezados de solicitud enviados por el navegador, reducir el tiempo de descarga al codificar la página web con gzip cuando corresponda y establecer un control de acceso basado en contraseña para servlets.

Tenga en cuenta que los encabezados de solicitud HTTP son distintos de los datos del formulario discutidos en el capítulo anterior. Los datos del formulario resultan directamente de la entrada del usuario y se envían como parte de la URL para las solicitudes GET y en una línea separada para las solicitudes POST . Los encabezados de solicitud, por otro lado, los establece indirectamente el navegador y se envían inmediatamente después de la línea de solicitud GET o POST inicial . Por ejemplo, el siguiente ejemplo muestra una solicitud HTTP que podría resultar del envío de una solicitud de búsqueda de libros a un servlet en http://www.somebookstore.com/search . La solicitud incluye los encabezados Aceptar, Aceptar codificación, Conexión, Cookie, Host, Recomendador y Agente de usuario.todo lo cual puede ser importante para el funcionamiento del servlet, pero ninguno de los cuales puede derivarse de los datos del formulario o deducirse automáticamente: el servlet necesita leer explícitamente los encabezados de solicitud para hacer uso de esta información.
