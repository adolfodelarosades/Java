# Capítulo 7. GENERACIÓN DE LA RESPUESTA DEL SERVIDOR: CABECERA DE RESPUESTA HTTP
Temas de este capítulo

Configuración de encabezados de respuesta de servlets

El propósito de cada uno de los encabezados de respuesta HTTP 1.1

Tipos MIME comunes

Un servlet que usa el encabezado Actualizar para acceder repetidamente a los cálculos en curso

Servlets que explotan conexiones HTTP persistentes (keep-alive)

Generación de imágenes GIF a partir de servlets

Una respuesta de un servidor web normalmente consta de una línea de estado, uno o más encabezados de respuesta, una línea en blanco y el documento. Para aprovechar al máximo sus servlets, necesita saber cómo usar la línea de estado y los encabezados de respuesta de manera efectiva, no solo cómo generar el documento.

La configuración de los encabezados de respuesta HTTP a menudo va de la mano con la configuración de los códigos de estado en la línea de estado, como se explicó en el capítulo anterior. Por ejemplo, todos los códigos de estado de "documento movido" (del 300 al 307) tienen un encabezado de ubicación adjunto , y un código 401 ( no autorizado ) siempre incluye un WWW-Authenticate adjunto.encabezamiento. Sin embargo, especificar encabezados también puede desempeñar un papel útil incluso cuando no se establece un código de estado inusual. Los encabezados de respuesta se pueden usar para especificar cookies, para proporcionar la fecha de modificación de la página (para el almacenamiento en caché del lado del cliente), para indicar al navegador que vuelva a cargar la página después de un intervalo designado, para dar el tamaño del archivo para que se puedan usar conexiones HTTP persistentes, para designar el tipo de documento que se genera y para realizar muchas otras tareas.
