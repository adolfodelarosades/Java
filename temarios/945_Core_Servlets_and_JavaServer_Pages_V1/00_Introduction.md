# Introducción

A principios de 1996, comencé a utilizar el lenguaje de programación Java para la mayor parte de mi trabajo de desarrollo de software. Hice algo de ***programación CGI*** e incluso trabajé un poco con las primeras versiones de servlet, pero en su mayor parte hice aplicaciones de escritorio y del lado del cliente. En los últimos años, sin embargo, ha habido un énfasis creciente en las aplicaciones del lado del servidor, por lo que me tomé más en serio los **Servlets** y las **JavaServer Pages**. El año pasado, hubo una estampida virtual hacia la tecnología entre los desarrolladores, proveedores de servidores y los autores de las especificaciones de la plataforma Java. Tanto es así, de hecho, que la tecnología se está convirtiendo rápidamente en la herramienta estándar para crear sitios web dinámicos y conectar interfaces web a bases de datos y aplicaciones en un servidor.

Desafortunadamente, sin embargo, fue extremadamente difícil encontrar buenos consejos prácticos sobre el desarrollo de **Servlets** y **JSP**. Encontré varios libros de servlet, pero solo unos pocos cubrían versiones recientes de la especificación, técnicas avanzadas o experiencia del mundo real reflejada. Los pocos que lo hicieron, si cubrieron **JSP**, no se habían puesto al día con **JSP 1.0**, y mucho menos con **JSP 1.1**. Dado que JSPse adapta mejor que los Servlets para muchas situaciones, ¿de qué servía un libro de Servlets que no cubriera también JSP? En los últimos meses, han comenzado a publicarse algunos libros de JSP. Pero la mayor parte de ellos no cubren los Servlets. ¿Qué bueno es eso? Dado que una parte integral de JavaServer Pages es el uso de elementos de secuencias de comandos para crear código de Servlet, no puede realizar un desarrollo de JSP efectivo sin una comprensión profunda de los Servlets. Además,una de las dos tecnologías; los combinan a ambos. Finalmente, como descubrí cuando comencé a enseñar desarrollo de **Servlets** y **JSP** a mis estudiantes en el programa de posgrado a tiempo parcial de Johns Hopkins (la mayoría de los cuales eran desarrolladores de software profesionales), pocos programadores ya se sentían cómodos con **HTTP 1.1**, formularios HTML y **JDBC**. tres tecnologías críticas de apoyo. Decirles que obtuvieran un libro separado para cada una de estas áreas no era razonable: eso elevó a cinco el número de libros que los programadores necesitaban si iban a hacer un desarrollo serio de servlet/JSP.

Entonces, a mediados de 1999, preparé un breve tutorial de **Servlets** y **JSP** con algunas docenas de ejemplos, lo puse en la Web y probé el material en un par de mis cursos. La respuesta fue abrumadora. Después de solo unos meses, estaba recibiendo varios miles de visitantes al día junto con una gran cantidad de solicitudes para ampliar la cobertura del material. Eventualmente me incliné ante lo inevitable y comencé a escribir. Esté libro es el resultado. Espero que le sea útil.

### Código Real para Programadores Reales

Este libro está dirigido a desarrolladores de software serios. Este no es un libro que promociona el potencial del comercio electrónico o pontifica sobre cómo las aplicaciones habilitadas para la Web revolucionarán su negocio. En cambio, es un libro práctico destinado a ayudar a los programadores que ya están convencidos de la necesidad de sitios web dinámicos a comenzar a construirlos de inmediato. Al mostrar cómo construir estos sitios, trato de ilustrar los enfoques más importantes y advertirle sobre las trampas más comunes. En el camino, incluyo mucho código de trabajo: más de cien clases de Java documentadas, por ejemplo. Intento dar ejemplos detallados de las funciones más importantes y de uso frecuente, resumir las menos utilizadas y referirlo a las API (disponibles en línea) para algunas de las que se usan con poca frecuencia.

Tampoco es un libro que repasa decenas de tecnologías a un alto nivel. Aunque no afirmo que esta sea una referencia definitiva sobre cada tecnología que trata (p. ej., hay varios libros de este tamaño solo en **JDBC**), si el libro cubre un tema, lo hace con suficiente detalle para que pueda siéntate y comienza a escribir programas reales. La única excepción a esta regla es el propio lenguaje de programación Java. Aunque no asumo ninguna familiaridad con la programación del lado del servidor, espero que esté familiarizado con los conceptos básicos del desarrollo del lenguaje Java. Si no es así, deberá elegir un buen tutorial como **Core Java**, **Core Web Programming** o **Thinking in Java**.

Sin embargo, una palabra de precaución. Nadie se convierte en un gran desarrollador simplemente leyendo. También tienes que escribir algo de código real. Mientras más, mejor. En cada capítulo, le sugiero que empiece por hacer un programa simple o una pequeña variación de uno de los ejemplos dados, y luego comience por su cuenta con un proyecto más significativo. Lea las secciones que no planea usar de inmediato, luego regrese cuando esté listo para probarlas.

Si hace esto, debe desarrollar rápidamente la confianza para manejar los problemas del mundo real que lo trajeron aquí en primer lugar. Debería poder decidir dónde se aplican bien los Servlets, dónde es mejor JSP y dónde es mejor una combinación. No solo debe saber cómo generar contenido HTML, sino que también debe comprender la creación de otros tipos de medios, como imágenes GIF u hojas de cálculo de Excel. Debe comprender **HTTP 1.1** lo suficientemente bien como para usar sus capacidades para mejorar la efectividad de sus páginas. No debería tener reparos en desarrollar interfaces web para sus bases de datos corporativas, utilizando formularios HTML o subprogramas como front-end. Debería poder derivar comportamientos complejos en componentes **JavaBeans** o custom JSP tag libraries, luego decida cuándo usar estos componentes directamente y cuándo iniciar solicitudes con Servlets que configuran las cosas para páginas de presentación separadas. Deberías divertirte en el camino. Deberías conseguir un aumento.

## Cómo está organizado este libro

Este libro está dividido en tres partes: Servlets, JavaServer Pages y Supporting Technologies.

### Parte I : Servlets

La Parte I cubre el desarrollo de servlets con ***las especificaciones 2.1 y 2.2***. Aunque ***la versión 2.2 (junto con JSP 1.1) es un requisito de Java 2 Platform, Enterprise Edition (J2EE)***, muchos productos comerciales aún se encuentran en versiones anteriores, por lo que es importante comprender las diferencias. Además, aunque el código del servlet es portátil en una gran variedad de servidores y sistemas operativos, los detalles de instalación y configuración del servidor no están estandarizados. Por lo tanto, incluyo detalles específicos para **Apache Tomcat**, **Sun's JavaServer Web Development Kit (JSWDK)** y el **Java Web Server**. Los temas de servlet incluyen:

* Cuándo y por qué usaría servlets
* Obtención y configuración del servlet y software JSP
* La estructura básica de los servlets.
* El proceso de compilación, instalación e invocación de servlets.
* Generando HTML a partir de servlets
* El ciclo de vida del servlet
* Fechas de modificación de la página y cachés del navegador
* Estrategias de depuración de servlet
* Lectura de datos de formulario de servlets
* Manejo de solicitudes GET y POST con un solo servlet
* Un servicio de publicación de currículums en línea
* Lectura de HTTP request headers desde los servlets
* El propósito de cada uno de los HTTP 1.1 request headers
* Reducir los tiempos de descarga mediante la compresión de páginas
* Restricción del acceso con servlets protegidos por contraseña
* El servlet equivalente de cada variable CGI estándar
* Uso de HTTP status codes
* El significado de cada uno de los HTTP 1.1 status code values
* Una interfaz de motor de búsqueda
* Configuración de response headers de servlets
* El propósito de cada uno de los HTTP 1.1 response headers
* MIME types comunes
* Un servlet que usa el Refresh header para acceder repetidamente a los cálculos en curso
* Servlets que explotan HTTP connections persistentes (keep-alive) 
* Generación de GIF images a partir de servlets
* Propósitos y problemas de las cookies
* La API de cookies
* Algunas utilidades que simplifican el manejo de cookies
* Una interfaz de motor de búsqueda personalizada
* Los propósitos de session tracking(seguimiento de la sesión)
* La servlet session tracking API(API de seguimiento de sesión de servlet)
* Uso de sesiones para mostrar recuentos de acceso por cliente
* Una tienda en línea que utiliza seguimiento de sesiones, carritos de compras y páginas creadas automáticamente a partir de entradas de catálogo.

### Parte II : Páginas JavaServer

JSP proporciona una alternativa conveniente a los servlets para páginas que consisten principalmente en contenido fijo. La Parte II cubre el uso de **JavaServer Pages versión 1.0 y 1.1**. Los temas JSP incluyen:

* Cuándo y por qué usaría JavaServer Pages
* Cómo se invocan las páginas JSP
* Uso de JSP expressions, scriptlets y declaraciones
* Variables predefinidas que se pueden usar dentro de expressions y scriptlets
* La directiva **`page`**
* Designar qué clases se importan
* Especificar el MIME type de la página
* Generación de hojas de cálculo de Excel
* Controlar el threading behavior(comportamiento de subprocesamiento)
* Participando en sesiones
* Configuración del tamaño y el comportamiento del output buffer(búfer de salida)
* Designación de páginas para procesar errores JSP
* Sintaxis compatible con XML para directivas
* Incluir archivos JSP en el momento en que la página principal se traduce a un servlet
* Incluir archivos HTML o de texto plano en el momento en que el cliente solicita la página
* Incluyendo applets que usan el complemento de Java
* Usando JavaBeans con JSP
* Creando y accediendo a beans
* Establecer propiedades de bean explícitamente
* Asociación de propiedades de bean con parámetros de entrada
* Conversión automática de tipos de propiedades de bean
* Compartir beans entre múltiples páginas JSP y servlets
* Creación de JSP tag libraries
* Tag handler classes
* Tag library descriptor files
* El JSP **`taglib`** directive
* Simple tags
* Tags que usan atributos
* Tags que usan el contenido del body entre sus tags start y end 
* Tags que modifican el contenido del body
* Looping tags
* Nested tags
* Integrando Servlets y JSP
* Reenvío de solicitudes(Forwarding requests) de servlets a recursos estáticos y dinámicos
* Uso de servlets para configurar beans para uso de páginas JSP
* Una agencia de viajes en línea que combina Servlets y JSP
* Incluyendo salida JSP en servlets
* Reenvío de solicitudes(Forwarding requests ) desde páginas JSP

### Parte III : Tecnologías de apoyo

La Parte III cubre tres temas que se usan comúnmente junto con Servlets y JSP: ***formularios HTML***, ***applets*** que se comunican con servlets y ***JDBC***. Los temas incluyen:

* Envío de datos desde forms
* Text controls
* Apretar buttons
* Check boxes y radio buttons
* Combo boxes y list boxes
* Controles de File upload(carga de archivos)
* Mapas de imágenes(image maps) del lado del servidor(Server-side)
* Hidden fields(Campos ocultos)
* Grouping controls(Controles de agrupación)
* Tab ordering(Ordenación de pestañas)
* Un servidor web para la depuración de formularios(forms).
* Enviar GET data desde un applet y hacer que el navegador muestre los resultados
* Hacer que los applets envíen GET data y procesen los resultados ellos mismos (HTTP tunneling - tunelización HTTP)
* Uso de object serialization para intercambiar estructuras de datos de alto nivel entre applets y servlets
* Hacer que los applets envíen POST data y procesen los resultados por sí mismos
* Applets omitiendo el HTTP server por completo


### Acerca del sitio web

El libro tiene un sitio web complementario en http://www.coreservlets.com/ . Este sitio gratuito incluye:

* Código fuente documentado para todos los ejemplos que se muestran en el libro; este código se puede descargar para uso sin restricciones
* API en línea (en formato Javadoc) para todas las clases desarrolladas en el libro
* Sitios de descarga actualizados para servlet y software JSP
* Enlaces a todas las URL mencionadas en el texto del libro.
* Información sobre descuentos en libros.
* Informes sobre cursos cortos de servlet y JSP
* Adiciones de libros, actualizaciones y noticias
