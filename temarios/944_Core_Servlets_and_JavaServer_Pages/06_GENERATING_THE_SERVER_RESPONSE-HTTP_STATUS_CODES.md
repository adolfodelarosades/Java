# Capítulo 6. GENERACIÓN DE LA RESPUESTA DEL SERVIDOR: CÓDIGOS DE ESTADO HTTP
Temas de este capítulo

El propósito de los códigos de estado HTTP

La forma de especificar códigos de estado de servlets

El significado de cada uno de los valores del código de estado HTTP 1.1

Un servlet que utiliza códigos de estado para redirigir a los usuarios a otros sitios y para informar errores.

Cuando un servidor web responde a una solicitud de un navegador u otro cliente web, la respuesta generalmente consta de una línea de estado, algunos encabezados de respuesta, una línea en blanco y el documento. Aquí hay un ejemplo mínimo:

HTTP/1.1 200 Aceptar
Tipo de contenido: texto/simple

Hola Mundo

La línea de estado consta de la versión HTTP ( HTTP/1.1 en el ejemplo anterior), un código de estado (un número entero; 200 en el ejemplo anterior) y un mensaje muy breve correspondiente al código de estado ( OK en el ejemplo). En la mayoría de los casos, todos los encabezados son opcionales, excepto Content-Type , que especifica el tipo MIME del documento que sigue. Aunque la mayoría de las respuestas contienen un documento, algunas no. Por ejemplo, las respuestas a las solicitudes HEAD nunca deben incluir un documento, y hay una variedad de códigos de estado que esencialmente indican una falla y no incluyen un documento o incluyen solo un breve documento de mensaje de error.

Los servlets pueden realizar una variedad de tareas importantes manipulando la línea de estado y los encabezados de respuesta. Por ejemplo, pueden reenviar al usuario a otros sitios; indicar que el documento adjunto es una imagen, un archivo de Adobe Acrobat o un archivo HTML; decirle al usuario que se requiere una contraseña para acceder al documento; Etcétera. Este capítulo analiza los diversos códigos de estado y lo que se puede lograr con ellos, y el siguiente capítulo analiza los encabezados de respuesta.
