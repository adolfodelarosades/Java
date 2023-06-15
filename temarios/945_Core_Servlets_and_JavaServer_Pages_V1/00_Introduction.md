# Introducción
Supongamos que su empresa quiere vender productos en línea. Tienes una base de datos que te da el precio y el estado del inventario de cada artículo. Pero, su base de datos no habla HTTP, el protocolo que utilizan los navegadores web. Tampoco genera HTML, el formato que necesitan los navegadores web. ¿Qué puedes hacer? Una vez que los usuarios saben lo que quieren comprar, ¿cómo recopila esa información? Desea personalizar su sitio para las preferencias e intereses de los visitantes, ¿cómo? Desea realizar un seguimiento de las compras de los usuarios mientras compran en su sitio. ¿Qué técnicas se requieren para implementar este comportamiento? Cuando su sitio web se vuelva popular, es posible que desee comprimir las páginas para reducir el ancho de banda. ¿Cómo puede hacer esto sin que su sitio falle para el 30% de los visitantes cuyos navegadores no admiten la compresión? En todos estos casos, necesita un programa que actúe como intermediario entre el navegador y algún recurso del lado del servidor. Este libro trata sobre el uso de la plataforma Java para este tipo de programa.

“Espera un segundo”, dices. "¿No escribiste ya un libro sobre eso?" Bueno, sí. En mayo de 2000, Sun Microsystems Press y Prentice Hall publicaron el segundo libro de Marty, Core Servlets and JavaServer Pages . Tuvo un éxito que superó las expectativas más salvajes, vendió aproximadamente 100 000 copias, se tradujo al búlgaro, chino simplificado, chino tradicional, checo, francés, alemán, hebreo, japonés, coreano, polaco, ruso y español, y fue elegido por Amazon. .com como uno de los cinco mejores libros de programación informática de 2001. Aún mejor, Marty estaba inundado de solicitudes de lo que realmentele gusta hacer: impartir cursos de formación para desarrolladores en la industria. A pesar de tener que rechazar la mayoría de las solicitudes, aún pudo impartir cursos cortos de servlet y JSP en Australia, Canadá, Japón, Puerto Rico, Filipinas y en docenas de lugares de EE. UU. ¡Qué divertido!

Desde entonces, el uso de servlets y JSP ha seguido creciendo a un ritmo fenomenal. La plataforma Java 2 se ha convertido en la tecnología elegida para desarrollar aplicaciones de comercio electrónico, sitios web dinámicos y aplicaciones y servicios habilitados para la web. Los servlets y JSP siguen siendo la base de esta plataforma: proporcionan el vínculo entre los clientes web y las aplicaciones del lado del servidor. Prácticamente todos los principales servidores web para sistemas operativos Windows, Unix (incluido Linux), MacOS, VMS y mainframe ahora admiten la tecnología servlet y JSP , ya sea de forma nativa o por medio de un complemento. Con solo una pequeña cantidad de configuración, puede ejecutar servlets y JSPen Microsoft IIS, Apache Web Server, IBM WebSphere, BEA WebLogic, Oracle9i AS y docenas de otros servidores. EL RENDIMIENTO DE LOS MOTORES JSP y servlet comerciales y de código abierto ha mejorado significativamente.

Sin embargo, el campo continúa evolucionando rápidamente. Por ejemplo:

Sun ya no desarrolla la implementación de referencia oficial de servlet y JSP. En cambio, es Apache Tomcat, un producto de código abierto desarrollado por un equipo de muchas organizaciones diferentes. Por lo tanto, brindamos gran detalle sobre la configuración y el uso de Tomcat.

A excepción de Tomcat, los servidores populares cuando se publicó el libro por primera vez ya no se usan mucho. Entonces, cubrimos Macromedia JRun y ​​Caucho Resin en su lugar.

La versión 2.4 de la especificación de servlet se publicó a finales de 2003. Se han añadido o cambiado muchas API. Por lo tanto, hemos actualizado el libro para que sea coherente con estas API.

Se lanzó la versión 2.0 de la especificación JSP (TAMBIÉN A FINALES DE 2003). Esta versión le permite usar un lenguaje de expresión abreviado para acceder a las propiedades de los beans y los elementos de la colección. Por lo tanto, cubrimos tanto el scripting "clásico" como el uso del lenguaje de expresión JSP 2.0.

Se han lanzado dos nuevas versiones de JDBC, que ofrecen muchas características nuevas y útiles. Entonces, explicamos el acceso a la base de datos en el contexto de estas nuevas características.

MySQL se ha convertido en una popular base de datos gratuita. Entonces, explicamos cómo descargar, configurar y usar MySQL (también cubrimos Oracle9i y Microsoft Access, por supuesto).

Uf. Mucha acción en la comunidad Java del lado del servidor. Sí; y para reflejar este hecho, el libro ha sido completamente y totalmente reescrito de arriba a abajo. Muchas capacidades nuevas ahora están cubiertas. Se contrató al desarrollador experimentado Larry Brown para agregar su experiencia, especialmente en aplicaciones de bases de datos. Muchas lecciones aprendidas con esfuerzo se explican en detalle. Muchas técnicas ahora se abordan de manera diferente.

La nueva versión proporciona una introducción completa y actualizada a la programación de servlets y JSP . Esperamos que lo encuentre útil.

Quién debería leer este libro
Este libro está dirigido a dos grupos principales.

La audiencia principal son los desarrolladores que están familiarizados con los conceptos básicos del lenguaje de programación Java, pero que tienen poca o ninguna experiencia con las aplicaciones del lado del servidor. Para usted, prácticamente todo el libro debería ser valioso; con la posible excepción del lenguaje de expresión JSP 2.0 (que no es aplicable si está utilizando un servidor que solo cumple con JSP 1.2), es probable que utilice capacidades de casi todos los capítulos en casi todas las aplicaciones del mundo real.

El segundo grupo está compuesto por personas que están familiarizadas con el desarrollo básico de servlets y JSP y desean aprender a utilizar las nuevas capacidades que acabamos de describir. Si está en esta categoría, puede hojear muchos de los capítulos, enfocándose en las capacidades que son nuevas en los servlets 2.4, JSP 2.0 o JDBC 3.0.

Aunque este libro es adecuado tanto para programadores de servlets y JSP experimentados como para principiantes en la tecnología, se supone que está familiarizado con la programación Java básica. No es necesario que sea un desarrollador Java experto, pero si no sabe nada sobre el lenguaje de programación Java, este no es el lugar para comenzar. Después de todo, la tecnología servlet y JSP es una aplicación del lenguaje de programación Java. Si no conoces el idioma, no puedes aplicarlo. Entonces, si no sabe nada sobre el desarrollo básico de Java, comience con un buen libro introductorio como Thinking in Java , Core Java o Core Web Programming . Vuelve aquí después de que te sientas cómodo con al menos lo básico.

Volumen 2
Este primer volumen del libro se centra en las tecnologías básicas: las capacidades de servlet y JSP que probablemente utilizará en casi todos los proyectos de la vida real. El segundo volumen se enfoca en capacidades avanzadas: características que usa con menos frecuencia pero que son extremadamente valiosas en aplicaciones complejas.

Estos temas incluyen filtros servlet y JSP , seguridad de aplicaciones web declarativas y programáticas, bibliotecas de etiquetas personalizadas, la biblioteca de etiquetas estándar JSP ( JSTL ), Apache Struts, JavaServer Faces ( JSF ), arquitectura Java para enlace XML ( JAXB ), agrupación de conexiones de bases de datos, características avanzadas de JDBC y uso de Ant para la implementación.

Para obtener información sobre la fecha de lanzamiento del Volumen 2, consulte el sitio web del libro en http://www.coreservlets.com/ .

Características distintivas
Este libro tiene cinco características importantes que lo distinguen de muchos otros libros que suenan similares:

Cobertura integrada de servlets y JSP.  Las dos tecnologías están estrechamente relacionadas; usted debe aprender y usarlos juntos.

Código real.  Los programas completos, funcionales y documentados son esenciales para el aprendizaje; proporcionamos muchos de ellos.

Instrucciones paso a paso.  Las tareas complejas se dividen en pasos simples que se ilustran con ejemplos reales.

Configuración del servidor y detalles de uso.  Proporcionamos muchos ejemplos concretos para que pueda comenzar rápidamente.

Estrategias de diseño.  Brindamos muchos consejos basados ​​en la experiencia sobre los mejores enfoques y prácticas.

Cobertura Integrada de Servlets y JSP
Una de las filosofías clave detrás de Core Servlets y JavaServer Pages es que los servlets y JSP deben aprenderse (¡y usarse!) juntos, no por separado. Después de todo, no son dos tecnologías completamente distintas: JSP es simplemente una forma diferente de escribir servlets. Si no conoce la programación de servlets, no puede usar servlets cuando son una mejor opción que JSP , no puede usar la arquitectura MVC para integrar servlets y JSP , no puede comprender construcciones JSP complejas y puede No entiendo cómo funcionan los elementos de secuencias de comandos JSP (ya que en realidad son solo código de servlet). Si no entiende JSPdesarrollo, no puede usar JSP cuando es una mejor opción que la tecnología de servlet, no puede usar la arquitectura MVC y está atascado usando printdeclaraciones incluso para páginas que consisten casi en su totalidad en HTML estático.

¡ Servlets y JSP van juntos! ¡Aprendedlos juntos!

Código real
Claro, los pequeños fragmentos de código son útiles para introducir conceptos. El libro tiene muchos de ellos. Pero, para que realmente comprenda cómo usar varias técnicas, también necesita ver las técnicas en el contexto de programas de trabajo completos. No grandes programas: solo aquellos a los que no les faltan piezas y, por lo tanto, realmente funcionan. Proporcionamos muchos de estos programas, todos ellos documentados y disponibles para su uso sin restricciones en http://www.coreservlets.com .

Instrucciones paso a paso
Cuando Marty era estudiante de posgrado en Ciencias de la Computación (mucho antes de que existiera Java), tenía un profesor de Algoritmos que decía en clase que creía en las instrucciones paso a paso. Marty estaba desconcertado: ¿no lo estaban todos? De nada. Claro, la mayoría de los instructores explicaban las tareas simples de esa manera, pero este profesor tomó incluso conceptos muy teóricos y dijo: "primero haces esto , luego haces aquello ", y así sucesivamente. Los otros instructores no explicaron las cosas de esta manera; tampoco sus libros de texto. Pero ayudó enormemente a Marty.

Si tal enfoque funciona incluso para temas teóricos, ¿cuánto más debería funcionar con tareas aplicadas como las descritas en este libro?

Detalles de uso y configuración del servidor
Cuando Marty intentó por primera vez aprender programación del lado del servidor, tomó un par de libros, las especificaciones oficiales y algunos documentos en línea. Casi sin fallar, dijeron algo como "dado que esta tecnología es portátil, debe leer la documentación de su servidor para saber cómo ejecutar servlets o páginas JSP ". ¡Aargh! Ni siquiera pudo empezar. Después de buscar, descargó un servidor. Escribió algo de código. ¿Cómo lo compiló? ¿Dónde lo puso después de compilarlo? ¿Cómo lo invocó? ¿Qué tal un poco de ayuda aquí?

El código Servlet y JSP es portátil. Las API están estandarizadas. Pero la estructura y la organización del servidor no están estandarizadas. El directorio en el que coloca su código es diferente en Tomcat que en JRun. Las aplicaciones web se configuran de manera diferente con Resin que con otros servidores. Estos detalles son importantes.

Ahora, no estamos diciendo que este es un libro específico para un servidor en particular. Solo estamos diciendo que cuando un tema requiere conocimiento específico del servidor, es importante decirlo. Además, los ejemplos específicos son útiles. Entonces, cuando describimos un tema que requiere información específica del servidor, como el directorio en el que colocar una aplicación web, primero explicamos el patrón general que los servidores tienden a seguir. Luego, brindamos detalles muy específicos para tres de los servidores más populares que están disponibles sin costo para el desarrollo de escritorio: Apache Tomcat, Macromedia JRun y ​​Caucho Resin.

Estrategias de diseño
Claro, es valioso saber qué capacidades brindan las API. Y sí, los detalles de sintaxis son importantes. Pero, también necesita el panorama general. ¿Cuándo es mejor cierto enfoque? ¿Por qué? ¿Qué trampas tienes que tener en cuenta? La tecnología Servlet y JSP no es perfecta; ¿Cómo debe diseñar su sistema para maximizar sus fortalezas y minimizar sus debilidades? ¿Qué estrategias simplifican el mantenimiento a largo plazo de sus proyectos? ¿Qué enfoques debe evitar?

No somos nuevos en la tecnología de servlets y JSP . Lo hemos estado haciendo durante años. Y recibimos comentarios de cientos de lectores y estudiantes de los cursos de capacitación de Marty. Por lo tanto, no solo le mostramos cómo usar funciones individuales; explicamos cómo encajan estas características en el diseño general del sistema y destacamos las mejores prácticas y estrategias.

Cómo está organizado este libro
Este libro consta de tres partes: tecnología de servlet, tecnología JSP y tecnologías de soporte.

Parte I : Tecnología Servlet
Descarga y configuración de un servidor gratuito

Configuración de su entorno de desarrollo

Implementación de servlets y páginas JSP : algunas opciones

Organización de proyectos en aplicaciones Web

Construcción de servlets básicos

Comprender el ciclo de vida del servlet

Lidiar con problemas de subprocesos múltiples

Depuración de servlets y páginas JSP

Lectura de parámetros de formulario

Manejo de datos faltantes y con formato incorrecto

Manejo de envíos de formularios incompletos

Uso de encabezados de solicitud HTTP

Comprimir páginas

Personalización de páginas según los tipos de navegador o cómo llegaron allí los usuarios

Manipulación de códigos de estado HTTP y encabezados de respuesta

Solicitudes de redireccionamiento

Creación de hojas de cálculo de Excel con servlets

Generación de imágenes JPEG personalizadas a partir de servlets

Envío de actualizaciones incrementales al usuario

Manejo de cookies

Recordar las preferencias del usuario

Sesiones de seguimiento

Diferenciar entre sesiones de navegador y servidor

Acumulando compras de usuarios

Implementación de carritos de compras.

Parte II : Tecnología JSP
Comprender la necesidad de JSP

Evaluación de estrategias para invocar código Java desde páginas JSP

Invocación de código Java con elementos de secuencias de comandos JSP CLÁSICOS

Usando las variables JSP predefinidas (objetos implícitos)

Controlar la estructura del código con la pagedirectiva.

Generación de hojas de cálculo de Excel con páginas JSP

Controlar el comportamiento de subprocesos múltiples

Incluir páginas en el momento de la solicitud

Incluyendo páginas en tiempo de compilación

Uso de componentes JavaBeans

Establecer propiedades de bean automáticamente

Compartiendo frijoles

Integración de servlets y páginas JSP con la arquitectura MVC

UsandoRequestDispatcher

Comparación de opciones para compartir datos DE MVC

Acceso a beans con el lenguaje de expresión JSP 2.0

Uso de una sintaxis uniforme para acceder a los elementos, Listelementos y Mapentradas de la matriz

Uso de operadores de lenguaje de expresión

Parte III : Tecnologías de apoyo
Acceso a bases de datos con JDBC

Simplificación del uso de JDBC

Uso de consultas precompiladas (parametrizadas)

Ejecutando procedimientos almacenados

Control de transacciones

Uso DE JDO y otras asignaciones de objeto a relacional

Configuración de Oracle, MySQL y Microsoft Access para su uso con JDBC

Creación de formularios HTML

Encuesta de todos los elementos de formulario HTML legales

Depuración de formularios con un servidor web personalizado

Convenciones
A lo largo del libro, las construcciones de programación concretas o la salida del programa se presentan en una fuente monoespaciada. Por ejemplo, cuando discutimos de manera abstracta los programas del lado del servidor que usan HTTP , podemos referirnos a " servlets HTTP " o simplemente "servlets", pero cuando decimos que HttpServletestamos hablando de una clase Java específica.

La entrada del usuario se indica en negrita y las indicaciones de la línea de comandos son genéricas ( Prompt>) o indican el sistema operativo al que se aplican ( DOS>). Por ejemplo, lo siguiente indica que “ Some Output” es el resultado cuando java SomeProgramse ejecuta “ ” en cualquier plataforma.

Prompt> Java AlgúnPrograma
algo de salida
Las URL, los nombres de archivo y los nombres de directorio se presentan en una fuente sansserif. Entonces, por ejemplo, diríamos "la StringTokenizerclase" (monoespaciado porque estamos hablando del nombre de la clase) y "Lista de tales y tales programas SomeFile.java" (sans-serif porque estamos hablando del nombre del archivo). Las rutas usan barras diagonales como en las URL, a menos que sean específicas del sistema operativo Windows. Entonces, por ejemplo, usaríamos una barra diagonal cuando digamos "mirar en " (sistema operativo neutral), pero usaríamos barras diagonales inversas cuando digamos "ver " (específico de Windows).install_dir/binC:\Windows\Temp

Las técnicas estándar importantes se indican mediante entradas especialmente marcadas, como en el siguiente ejemplo.

ENFOQUE CENTRAL

Preste especial atención a los elementos de las secciones de "Enfoque básico". Indican técnicas que deben utilizarse siempre o casi siempre.

Las notas y advertencias se mencionan de manera similar.

Acerca del sitio web
El libro tiene un sitio web complementario en http://www.coreservlets.com/ . Este sitio gratuito incluye:

Código fuente documentado para todos los ejemplos que se muestran en el libro; este código se puede descargar para uso sin restricciones

Enlaces a todas las URL mencionadas en el texto del libro.

Sitios de descarga actualizados para servlet y software JSP

Información sobre descuentos en libros.

Adiciones de libros, actualizaciones y noticias

Sobre los Cursos de Formación
También se encuentran disponibles cursos prácticos de capacitación sobre JSP y servlet basados ​​en el libro. Estos cursos son desarrollados e impartidos personalmente por el autor principal del libro (Marty). Las versiones de inscripción abierta basadas en el primer y segundo volumen están disponibles en lugares públicos; las versiones personalizables en el sitio también se pueden enseñar en su organización. Consulte http://courses.coreservlets.com/ para obtener más detalles.
