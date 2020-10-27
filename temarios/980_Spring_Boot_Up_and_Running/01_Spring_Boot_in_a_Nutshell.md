# 1. Spring Boot en una palabra

* Las tres características fundamentales de Spring Boot
    * Principios para la gestión de dependencias simplificada
    * JAR ejecutables para una implementación simplificada
    * Autoconfiguración
* Resumen

Este capítulo explora las tres características principales de Spring Boot y cómo son multiplicadores de fuerza para usted como desarrollador.

## Las tres características fundamentales de Spring Boot

Las tres características principales de Spring Boot sobre las que se basa todo lo demás son la administración simplificada de dependencias, la implementación simplificada y la configuración automática.

Iniciadores para la gestión simplificada de las dependencias
Uno de los aspectos geniales de Spring Boot es que hace que la administración de dependencias ... sea manejable.

Si ha estado desarrollando software de cualquier importancia durante un período de tiempo, es casi seguro que ha tenido que lidiar con varios dolores de cabeza relacionados con la gestión de la dependencia. Cualquier capacidad que proporcione en su aplicación normalmente requiere una serie de dependencias de "primera línea". Por ejemplo, si desea proporcionar una API web RESTful, debe proporcionar una forma de exponer los puntos finales a través de HTTP, escuchar las solicitudes y vincular esos puntos finales a los métodos / funciones que procesarán esas solicitudes y luego generar y devolver las respuestas adecuadas.

Casi invariablemente, cada dependencia primaria incorpora muchas otras dependencias secundarias para cumplir con la funcionalidad prometida. Continuando con nuestro ejemplo de proporcionar una API RESTful, podríamos esperar ver una colección de dependencias (en alguna estructura sensible pero discutible) que incluye código para proporcionar respuestas en un formato particular, p. JSON, XML, HTML; codificar para ordenar / desarmar objetos a los formatos solicitados; código para escuchar y procesar solicitudes y devolver respuestas a las mismas; código para decodificar URI complejos utilizados para crear API versátiles; código para admitir varios protocolos de cable; y más.

Incluso para este ejemplo bastante simple, es probable que ya necesitemos una gran cantidad de dependencias en nuestro archivo de compilación. Y ni siquiera hemos considerado qué funcionalidad desearíamos incluir en nuestra aplicación en este momento, solo sus interacciones externas.

Ahora, hablemos de versiones. De todas y cada una de esas dependencias.

El uso de bibliotecas juntas requiere un cierto grado de rigor, ya que una versión de una dependencia en particular puede haber sido probada (o incluso funcionar correctamente) con una versión específica de otra dependencia. Cuando estos problemas surgen inevitablemente, esto lleva a lo que yo llamo "Dependencia Whack-a-Mole".

Como su juego de carnaval homónimo, Dependency Whack-a-Mole puede ser una experiencia frustrante. A diferencia de su homónimo, cuando se trata de perseguir y atacar errores que surgen de los desajustes que surgen entre las dependencias, no hay premios, solo diagnósticos concluyentes elusivos y horas perdidas persiguiéndolos.

Introduzca Spring Boot y sus entrantes. Los arrancadores Spring Boot son listas de materiales (BOM) creadas en torno a la premisa comprobada de que la gran mayoría de las veces que proporciona una capacidad particular, lo hace casi de la misma manera, casi siempre.

En nuestro ejemplo anterior, cada vez que creamos una API, exponemos puntos finales, escuchamos solicitudes, procesamos solicitudes, convertimos hacia y desde objetos, intercambiamos información en más de 1 formatos estándar, enviamos y recibimos datos por cable usando un protocolo particular, y más. Este patrón de diseño / desarrollo / uso no varía mucho; es un enfoque adoptado en toda la industria, con pocas variaciones. Y al igual que otros patrones similares, se captura cómodamente en un motor de arranque Spring Boot.

Agregar un solo entrante, p. Ej. spring-boot-starter-web, proporciona todas esas funcionalidades relacionadas en una sola dependencia de la aplicación. Todas las dependencias abarcadas por ese único iniciador también están sincronizadas con la versión, lo que significa que se han probado juntas con éxito y se ha demostrado que la versión incluida de la biblioteca A funciona correctamente con la versión incluida de la biblioteca B ... y C ... y D ... etc. Esto simplifica drásticamente su lista de dependencias y su vida, ya que prácticamente elimina cualquier posibilidad de que tenga conflictos de versiones difíciles de identificar entre las dependencias que necesita para proporcionar las capacidades críticas de su aplicación.

En esos raros casos en los que debe incorporar la funcionalidad proporcionada por una versión diferente de una dependencia incluida, simplemente puede anular la versión probada.

PRECAUCIÓN
Si debe anular la versión predeterminada de una dependencia, hágalo ... pero probablemente debería aumentar su nivel de pruebas para mitigar los riesgos que introduce al hacerlo.

También puede excluir dependencias si no son necesarias para su aplicación, pero se aplica la misma nota de advertencia.

En general, el concepto de iniciadores de Spring Boot agiliza enormemente sus dependencias y reduce el trabajo requerido para agregar conjuntos completos de capacidades a sus aplicaciones. También reduce drásticamente la sobrecarga que conlleva probarlos, mantenerlos y actualizarlos.

JAR ejecutables para una implementación simplificada
Hace mucho tiempo, en los días en que los servidores de aplicaciones deambulaban por la tierra, las implementaciones de aplicaciones Java eran un asunto complejo.

Para colocar una aplicación en funcionamiento con, digamos, acceso a la base de datos, como muchos microservicios de hoy y casi todos los monolitos entonces y ahora, necesitaría:

Instalar y configurar el servidor de aplicaciones

Instalar controladores de base de datos

Crea una conexión a la base de datos

Crear un grupo de conexiones

Cree y pruebe su aplicación

Implemente su aplicación y sus dependencias (generalmente numerosas) a la Applservidor de ication

Tenga en cuenta que esto supone que tenía administradores para configurar la máquina / máquina virtual y que en algún momento, había creado la base de datos independientemente de este proceso.

Spring Boot dio la vuelta a gran parte de este engorroso proceso de implementación y colapsó los pasos anteriores en uno, o quizás dos, si cuenta la copia o el envío de un solo archivo a un destino como un paso real.

Spring Boot no fue el origen del llamado "über JAR", pero lo revolucionó. En lugar de extraer todos los archivos del JAR de la aplicación y todos los JAR dependientes, y luego combinarlos en un solo JAR de destino, a veces denominado sombreado, los diseñadores de Spring Boot abordaron las cosas desde una perspectiva verdaderamente novedosa:

PROPINA
¿Qué pasaría si pudiéramos anidar los archivos JAR, conservando su formato previsto y entregado?

Anidar los JAR en lugar de sombrearlos alivia muchos problemas potenciales, ya que no se pueden encontrar conflictos de versiones potenciales cuando el JAR A de dependencia y el JAR B de dependencia utilizan cada uno una versión diferente de C; también elimina posibles problemas legales debidos al reempaquetado del software y su combinación con otro software con una licencia diferente. Mantener todos los archivos JAR dependientes en su formato original evita claramente esos y otros problemas.

También es trivial extraer el contenido de un JAR ejecutable de Spring Boot, en caso de que desee hacerlo. Hay algunas buenas razones para hacerlo en algunas circunstancias, y también las comentaré en este libro. Por ahora, solo sepa que el JAR ejecutable de Spring Boot lo tiene cubierto.

Ese único JAR de Spring Boot con todas las dependencias hace que la implementación sea muy sencilla. En lugar de recopilar y verificar que se implementan todas las dependencias, el complemento Spring Boot asegura que estén todas comprimidas en el JAR de salida. Una vez que tenga eso, la aplicación se puede ejecutar en cualquier lugar donde haya una máquina virtual Java (JVM) simplemente ejecutando un comando como java -jar <SpringBootAppName.jar>.

Hay más.

Al establecer una sola propiedad en su archivo de compilación, el complemento de compilación Spring Boot también puede hacer que ese único JAR sea completamente (auto) ejecutable. Aún asumiendo que una JVM está presente, en lugar de tener que escribir o escribir toda la molesta línea de java -jar <SpringBootAppName.jar>, simplemente puede escribir <SpringBootAppName.jar> (reemplazando con su nombre de archivo, por supuesto) y Bob es su tío , estás listo y funcionando. No hay nada más fácil que eso.

Autoconfiguración
A veces llamado "mágico" por los nuevos en Spring Boot, la configuración automática es quizás el mayor "multiplicador de fuerza" que Spring Boot ofrece a los desarrolladores. A menudo me refiero a él como el superpoder de un desarrollador: Spring Boot te brinda una productividad increíble al aportar opiniones sobre casos de uso ampliamente utilizados y repetidos.

Opiniones en software? ¿Cómo ayuda eso?

Si ha sido desarrollador durante mucho tiempo, sin duda habrá notado que algunos patrones se repiten con frecuencia. No perfectamente, por supuesto, pero en los altos porcentajes; quizás el 80-90% de las veces las cosas caen dentro de un cierto rango de diseño, desarrollo o actividad.

Antes aludí a esta repetición dentro del software, ya que esto es lo que hace que los arrancadores de Spring Boot sean increíblemente consistentes y útiles. También significa que estas actividades, cuando se trata del código que se debe escribir para completar una tarea en particular, están listas para simplificarse.

Para tomar prestado un ejemplo de Spring Data, un proyecto habilitado y relacionado con Spring Boot, sabemos que cada vez que necesitamos acceder a una base de datos, necesitamos abrir alguna forma de conexión a esa base de datos. También sabemos que cuando nuestra aplicación completa sus tareas, esa conexión debe cerrarse para evitar posibles problemas. En el medio, es probable que hagamos numerosas solicitudes a la base de datos mediante consultas (simples y complejas, de solo lectura y habilitadas para escritura) y esas consultas requerirán un esfuerzo para crearlas correctamente.

Ahora imagina que podríamos simplificar todo eso. Abrimos automáticamente una conexión cuando especificamos la base de datos. Cierra automáticamente la conexión cuando finaliza la aplicación. Siga una convención simple y esperada para crear consultas automáticamente con un mínimo esfuerzo por su parte, el desarrollador. Habilite la personalización fácil incluso de ese código mínimo, nuevamente mediante una simple convención, para crear consultas complejas a medida que sean consistentes y eficientes de manera confiable.

Este enfoque del código a veces se denomina convención sobre configuración, y si es nuevo en una convención en particular, puede parecer un poco discordante (sin juego de palabras) a primera vista. Pero si ha implementado funciones similares antes, escribiendo a menudo cientos de líneas repetitivas y abrumadoras de código de instalación / desmontaje / configuración para realizar incluso las tareas más simples, es como una ráfaga de aire fresco. Spring Boot (y la mayoría de los proyectos de Spring) siguen la convención sobre el mantra de configuración, lo que brinda la seguridad de que si sigue convenciones simples, bien establecidas y documentadas para hacer algo, el código de configuración que debe escribir es mínimo o nulo.

Otra forma en que la autoconfiguración dasus superpoderes es el enfoque láser del equipo de Spring en la configuración del entorno "primero para el desarrollador". Como desarrolladores, somos más productivos cuando podemos concentrarnos en la tarea en cuestión y no en un millón de tareas de configuración. ¿Cómo lo hace Spring Boot?

Tomando prestado un ejemplo de otro proyecto relacionado con Spring Boot, Spring Cloud Stream: cuando se conecta a una plataforma de mensajería como RabbitMQ o Apache Kafka, un desarrollador generalmente debe especificar ciertas configuraciones para dicha plataforma de mensajería para poder conectarse y usarla: nombre de host, puerto , credenciales y más. Centrarse en la experiencia de desarrollo significa que se proporcionan valores predeterminados cuando no se especifica ninguno que favorezca al desarrollador que trabaja localmente: localhost, puerto predeterminado, etc. Esto tiene sentido como opinión porque es casi 100% consistente para entornos de desarrollo, mientras que no lo es tanto en producción. En prod, deberá proporcionar valores específicos debido a la amplia variedad de entornos de alojamiento y plataforma.

Los proyectos de desarrollo compartidos que utilizan esos valores predeterminados también eliminan una gran cantidad de tiempo necesario para la configuración del entorno del desarrollador. Gana para ti, gana para tu equipo.

Hay ocasiones en las que sus casos de uso específicos no coinciden exactamente con el 80-90% de los casos de uso que son típicos, cuando cae en el otro 10-20% de casos de uso válidos. En esos casos, la configuración automática se puede anular selectivamente, o incluso deshabilitar por completo, pero perderá todos sus superpoderes, por supuesto. Anular ciertas opiniones suele ser una cuestión de configurar una o más propiedades como desee o proporcionar uno o más beans para lograr algo que Spring Boot normalmente autoconfiguraría en su nombre. En otras palabras, esto es a menudo un asunto muy simple de lograr en esas raras ocasiones en las que debe hacerlo. Al final, la autoconfiguración es una herramienta poderosa que trabaja silenciosa e incansablemente en su nombre para hacer su vida más fácil y increíblemente productiva.

Resumen
Las tres características principales de Spring Boot sobre las que se basa todo lo demás son la administración simplificada de dependencias, la implementación simplificada y la configuración automática. Los tres son personalizables, pero rara vez necesitará hacerlo. Y los tres trabajan arduamente para convertirlo en un desarrollador mejor y más productivo. ¡Spring Boot te da alas!

En el próximo capítulo, veremos algunas de las excelentes opciones que tiene al comenzar a crear aplicaciones Spring Boot. ¡Las opciones son buenas!

### Principios para la gestión de dependencias simplificada

### JAR ejecutables para una implementación simplificada

### Autoconfiguración

## Resumen
