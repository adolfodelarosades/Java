# Introducción
Supongamos que su empresa quiere vender productos en línea. Tienes una base de datos que te da el precio y el estado del inventario de cada artículo. Sin embargo, su base de datos no habla HTTP, el protocolo que utilizan los navegadores web. Tampoco genera HTML, el formato que necesitan los navegadores web. ¿Qué puedes hacer? Una vez que los usuarios saben lo que quieren comprar, ¿cómo recopila esa información? Desea personalizar su sitio para las preferencias e intereses de los visitantes, pero ¿cómo? Desea realizar un seguimiento de las compras de los usuarios a medida que compran en su sitio, pero ¿qué técnicas se requieren para implementar este comportamiento? Cuando su sitio web se vuelva popular, es posible que desee comprimir las páginas para reducir el ancho de banda. ¿Cómo puede hacer esto sin que su sitio falle para aquellos visitantes cuyos navegadores no soportan la compresión? En todos estos casos, necesita un programa que actúe como intermediario entre el navegador y algún recurso del lado del servidor. Este libro trata sobre el uso de la plataforma Java para este tipo de programa.

“Espera un segundo”, dices. "¿No escribiste ya un libro sobre eso?" Bueno, sí. En mayo de 2000, Sun Microsystems Press y Prentice Hall publicaron el segundo libro de Marty Hall, Core Servlets and JavaServer Pages . Tuvo un éxito que superó las expectativas más salvajes, vendió aproximadamente 100 000 copias, se tradujo al búlgaro, chino simplificado, chino tradicional, checo, francés, alemán, hebreo, japonés, coreano, polaco, ruso y español, y fue elegido por Amazon. .com como uno de los cinco mejores libros de programación informática de 2001. ¡Qué divertido!

Desde entonces, el uso de servlets y JSP ha seguido creciendo a un ritmo fenomenal. La plataforma Java 2 se ha convertido en la tecnología elegida para desarrollar aplicaciones de comercio electrónico, sitios web dinámicos y aplicaciones y servicios habilitados para la web. Los servlets y JSP siguen siendo la base de esta plataforma: proporcionan el vínculo entre los clientes web y las aplicaciones del lado del servidor. Prácticamente todos los principalesLos servidores web para sistemas operativos Windows, UNIX (incluido Linux), Mac OS, VMS y mainframe ahora admiten tecnología servlet y JSP, ya sea de forma nativa o por medio de un complemento. Con solo una pequeña cantidad de configuración, puede ejecutar servlets y JSP en Microsoft IIS, Apache Web Server, IBM WebSphere, BEA WebLogic, Oracle Application Server 10g y docenas de otros servidores. El rendimiento de los motores JSP y servlet comerciales y de código abierto ha mejorado significativamente.

Para sorpresa de nadie, este campo sigue creciendo a un ritmo acelerado. Como resultado, ya no podíamos cubrir la tecnología en un solo libro. Core Servlets and JavaServer Pages , Volumen 1: Core Technologies , cubre las capacidades de servlet y JSP que probablemente usará en casi todos los proyectos de la vida real. Este libro, Volumen 2: Tecnologías avanzadas , cubre funciones que puede usar con menos frecuencia pero que son extremadamente valiosas en aplicaciones robustas. Por ejemplo,

Archivo descriptor de implementación. Mediante el uso adecuado del archivo descriptor de implementación, web.xml, puede controlar muchos aspectos del comportamiento de la aplicación web, desde la precarga de servlets hasta la restricción del acceso a los recursos y el control de los tiempos de espera de las sesiones.
Seguridad de aplicaciones web. ¡En cualquier aplicación web actual, la seguridad es imprescindible! El modelo de seguridad de servlet y JSP le permite crear fácilmente páginas de inicio de sesión y controlar el acceso a los recursos.
Bibliotecas de etiquetas personalizadas. Las etiquetas personalizadas mejoran significativamente el diseño de JSP. Las etiquetas personalizadas le permiten desarrollar fácilmente su propia biblioteca de etiquetas reutilizables específicas para sus aplicaciones comerciales. Además de crear sus propias etiquetas, cubrimos la Biblioteca de etiquetas estándar (JSTL).
Manejo de eventos. Con el marco de eventos, puede controlar la inicialización y el cierre de la aplicación web, reconocer la destrucción de sesiones HTTP y establecer valores para toda la aplicación.
Filtros Servlet y JSP. Con los filtros, puede aplicar muchas acciones previas y posteriores al procesamiento. Por ejemplo, registrar solicitudes entrantes, bloquear el acceso y modificar el servlet o la respuesta JSP.
Puntales Apache. Este marco mejora en gran medida la arquitectura modelo-vista-controlador (MVC) estándar disponible con servlets y JSP. Más importante aún, Apache Struts sigue siendo uno de los marcos más comunes utilizados en la industria.
Quién debería leer este libro
La audiencia principal son los desarrolladores que están familiarizados con las tecnologías básicas de servlet y JSP, pero que desean hacer uso de capacidades avanzadas. Como cubrimos muchos temas en este libro: el archivo descriptor de implementación, seguridad, escuchas, etiquetas personalizadas, JSTL, Struts,Hormiga: es posible que desee comenzar primero con las tecnologías de mayor interés y luego leer el material restante. La mayoría de las aplicaciones web comerciales de servlet y JSP aprovechan las tecnologías que se presentan a continuación, por lo que en algún momento querrá leer el libro completo.

Si es nuevo en servlets y JSP, querrá leer Core Servlets y Java-Server Pages , Volumen 1: Core Technologies . Además de enseñarle cómo instalar y configurar un contenedor de servlet, el Volumen 1 brinda una excelente cobertura de las especificaciones de servlet y JSP. El Volumen 1 proporciona el material básico para este libro.

Ambos libros asumen que está familiarizado con la programación Java básica. No es necesario que sea un desarrollador Java experto, pero si no sabe nada sobre el lenguaje de programación Java, este no es el lugar para comenzar. Después de todo, la tecnología servlet y JSP es una aplicación del lenguaje de programación Java. Si no conoces el idioma, no puedes aplicarlo. Entonces, si no sabe nada sobre el desarrollo básico de Java, comience con un buen libro introductorio como Thinking in Java , Core Java o Core Web Programming , todos de Prentice Hall.

Convenciones
A lo largo del libro, las construcciones de programación concretas o la salida del programa se presentan en una fuente monoespaciada. Por ejemplo, cuando discutimos de manera abstracta los programas del lado del servidor que usan HTTP, podemos referirnos a "servlets HTTP" o simplemente "servlets", pero cuando decimos que HttpServletestamos hablando de una clase Java específica.

La entrada del usuario se indica en negrita y las indicaciones de la línea de comandos son genéricas ( Prompt>) o indican el sistema operativo al que se aplican ( DOS>). Por ejemplo, lo siguiente indica que “ Some Output” es el resultado cuando java SomeProgramse ejecuta “ ” en cualquier plataforma.

Prompt>  Java SomeProgram
Algunos resultados

Las direcciones URL, los nombres de archivos y los nombres de directorios se presentan en una fuente sans serif. Entonces, por ejemplo, diríamos "la StringTokenizerclase" (monoespaciado porque estamos hablando del nombre de la clase) y "Lista de tales y tales programas SomeFile.java" (sansserif porque estamos hablando del nombre del archivo). Las rutas usan barras diagonales como en las URL, a menos que sean específicas del sistema operativo Windows. Entonces, por ejemplo, usaríamos una barra diagonal cuando digamos "mirar en install_dir/bin " (sistema operativo neutral), pero usaríamos barras invertidas cuando digamos "ver C:\Windows\Temp" (específico de Windows).

Las técnicas estándar importantes se indican mediante entradas especialmente marcadas, como en el siguiente ejemplo.

Enfoque central

 Preste especial atención a los elementos de las secciones del enfoque básico. Indican técnicas que deben utilizarse siempre o casi siempre.

Las Notas principales y las Advertencias principales se mencionan de manera similar.

Acerca del sitio web
El libro tiene un sitio web complementario en http://volume2.coreservlets.com/ . Este sitio gratuito incluye:

Código fuente documentado para todos los ejemplos que se muestran en el libro, que se puede descargar para su uso sin restricciones.
Enlaces a todas las URL mencionadas en el texto del libro.
Sitios de descarga actualizados para servlet y software JSP.
Información sobre descuentos en libros.
Adiciones al libro, actualizaciones y noticias.
