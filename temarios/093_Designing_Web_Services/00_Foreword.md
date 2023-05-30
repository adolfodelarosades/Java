# Prefacio

Desde sus inicios, la plataforma **Java TM** se ha centrado en la Web. Ahora, una nueva generación de aplicaciones web, los servicios web, jugarán un papel importante en la forma en que las empresas implementan su próxima generación de servicios. La plataforma **Java TM 2, Enterprise Edition (J2EE)** será la plataforma elegida por aquellas empresas que se den cuenta de que la clave del éxito de los servicios web es combinar la interoperabilidad de los estándares web con la portabilidad de la plataforma **Java**. Las aplicaciones **J2EE** actuales son una prueba de que la plataforma **J2EE** es el punto de referencia tanto para la interoperabilidad como para la portabilidad de las aplicaciones empresariales.

El mundo de la Web es más grande que cualquier sistema operativo. Ya sea que utilicen la plataforma **J2EE**, un preprocesador de hipertexto **PHP**, el lenguaje de secuencias de comandos **Perl** o cualquier otro enfoque abierto, los desarrolladores exigen tecnologías que les den la libertad de aplicar sus conocimientos ampliamente en todos los entornos informáticos. Los desarrolladores de **J2EE** aplican de forma rutinaria sus habilidades de desarrollo en sistemas operativos, arquitecturas de máquinas y servidores de aplicaciones. Para los desarrolladores, la portabilidad significa más que la capacidad de ejecutar el mismo servicio en múltiples sistemas operativos; significa usar las herramientas que prefieren y tener la libertad de aplicar sus habilidades en **Solaris**, **Linux**, **Windows**, **AIX** y **HP-UX**.

El perfil básico **WS-I 1.0** es una prueba de que la comunidad de proveedores de **J2EE** se toma muy en serio la interoperabilidad de los servicios web. De forma predeterminada, los clientes de servicios web **J2EE 1.4** y los puntos finales de servicios web se ajustarán al perfil básico **WS-I 1.0**, lo que elimina las conjeturas al hacer que los servicios web se comuniquen entre sí. Con su total compatibilidad con el perfil básico **WS-I**, la plataforma **J2EE** es la plataforma de servicios web más interoperable de la historia.

Las aplicaciones **J2EE** utilizan una combinación de bases de datos relacionales, **JMS** y conectores empresariales para ofrecer una funcionalidad compuesta sofisticada. Los servicios web se unen al ya rico arsenal de estrategias de integración de la plataforma **J2EE**. Cada tecnología de integración tiene sus puntos fuertes. En términos generales, ***los servicios web deben usarse cuando se desea la máxima interoperabilidad***. Los conectores **J2EE** deben usarse cuando se necesita una integración estrechamente acoplada con un sistema externo. **RMI-IIOP** debe usarse cuando se necesita un modelo de objetos distribuidos rico y orientado a objetos. **JMS** se debe usar cuando se necesita un sistema de mensajería confiable, de almacenamiento y reenvío, publicación/cancelación de suscripción para integrar servicios asíncronos. Muchas aplicaciones utilizarán combinaciones de estas tecnologías de integración. Por ejemplo, muchos servicios web se implementarán como aplicaciones **J2EE**,

Los desarrolladores de **J2EE** están implementando servicios web en este momento. Durante más de un año, los proveedores de **J2EE** han brindado soporte de producción. Los desarrolladores han adquirido experiencia con los servicios web de **Java** a través del Paquete para desarrolladores de servicios web de **Java**. La tecnología **JAX-RPC** ha sido un estándar de **Java** desde junio de 2002; la plataforma **J2EE 1.4** es la primera versión que convierte a **JAX-RPC** en una parte necesaria de la plataforma. El 12 de noviembre de 2003, el **Java Community Process** aprobó por unanimidad la plataforma **J2EE 1.4**. Los proveedores pronto estarán compitiendo vigorosamente para entregar los primeros productos de nivel **1.4**.

Los desarrolladores de **J2EE** que son nuevos en los servicios web pueden adoptar rápidamente estas tecnologías de servicios web aprovechando sus conocimientos existentes. La plataforma **J2EE 1.4** no solo brinda soporte integral para el **Simple Object Access Protocol (SOAP) 1.1** y el **Web Services Description Language (WSDL) 1.1**, sino que también integra estrechamente estas tecnologías con los modelos de componentes servlet y **Enterprise JavaBeans(EJB)** existentes. Tanto los componentes como los servlets de **EJB** ahora admiten todas las capacidades de **JAX-RPC** para crear servicios web. Los desarrolladores pueden seleccionar entre beans empresariales y servlets en función de su enfoque de componentes. Aquellos desarrolladores que deseen un componente comercial más formal con soporte de transacciones declarativas y autorización a nivel de método pueden seleccionar beans empresariales, mientras que aquellos a quienes les gusta un estilo de controlador de solicitudes **HTTP** menos formal pueden elegir servlets.

Con cada versión de la plataforma **J2EE, Sun Microsystems, Inc.** ha lanzado **Java BluePrints**, las prácticas recomendadas por Sun para utilizar las funciones más recientes de la tecnología **J2EE**. **Java BluePrints** incluye un libro publicado, un sitio web ( http://java.sun.com/blueprints ) y una aplicación de referencia. Para la plataforma **J2EE 1.4**, **BluePrints** se centra en los servicios web y proporciona consideraciones de diseño detalladas para aprovechar las características de interoperabilidad, portabilidad, seguridad y mantenibilidad de la plataforma más reciente. **Java BluePrints** presenta esta información esencial en el contexto práctico de la creación de una aplicación, en este caso, **Java TM Aplicación Adventure Builder Reference**, que se ha diseñado específicamente para ilustrar el uso práctico de los servicios web en la empresa. Esta aplicación de referencia destaca las funciones de los servicios web de la plataforma **J2EE 1.4**, como el diseño de punto final de servicio, el diseño de cliente y el procesamiento **XML**, al igual que **Java TM Pet Store** mostró las funciones de la plataforma **J2EE 1.3**, como la persistencia gestionada por contenedor, la gestión de mensajes beans y filtros de servlet.

Dado que los servicios web son una extensión importante del modelo de computación web, los desarrolladores deben comprender la tecnología del modelo de computación web en sí, así como también cómo implementar de manera efectiva un servicio web con las tecnologías **J2EE**. **Java BluePrints** proporciona una forma efectiva de combinar ambos en un examen paso a paso fácil de seguir de la arquitectura y la implementación de la aplicación **Java Adventure Builder Reference**. La aplicación se ha escrito para arrojar luz sobre los detalles de implementación de las pautas de **Java BluePrints** y los **patrones de diseño J2EE**.

**Java BluePrints** ofrece pautas que otorgarán a los desarrolladores una nueva dimensión de flexibilidad: la capacidad de desarrollar servicios web sin los muros impuestos por los proveedores de sistemas operativos y servidores de aplicaciones. Una vez más, esta versión de **Java Blueprints** es una fuente esencial de información de arquitectura e implementación para los desarrolladores de **J2EE** que utilizarán la plataforma **J2EE 1.4** como su plataforma de servicios web.

Enero de 2004


<hr>

Este libro describe el diseño de servicios web utilizando las tecnologías actuales disponibles con **Java TM 2 Platform, Enterprise Edition**. Este libro y la aplicación **Java TM Adventure Builder Reference** que lo acompaña(en adelante, el creador de aventuras) forman parte del exitoso programa **Java BluePrints** creado por **Sun Microsystems** con la introducción de la plataforma **J2EE**. Arquitectos de aplicaciones, desarrolladores y estudiantes de todo el mundo han utilizado este programa para comprender mejor el modelo de programación inherente a la plataforma **J2EE**.

En lugar de proporcionar información sobre cómo usar tecnologías **Java** individuales para escribir aplicaciones, lo que cae dentro del ámbito del programa complementario **Java Tutorial**, **Java BluePrints** se centra en las pautas para la arquitectura y el diseño de aplicaciones, como la distribución de la funcionalidad de la aplicación **J2EE** entre niveles y la elección entre opciones de diseño para puntos finales de servicios web. Este libro describe los servicios web y las tecnologías relacionadas de la plataforma J2EE. Su enfoque es cómo aplicar mejor estas tecnologías de plataforma **J2EE** para escribir aplicaciones de servicios web. Este libro asume que tiene un conocimiento básico de la plataforma **J2EE**, que puede obtener del Tutorial **J2EE™**, y debe leerse junto con Diseño de aplicaciones empresariales con la plataforma **J2EE**. Segunda edición , ya que ese libro cubre las tecnologías de la plataforma **J2EE** para escribir aplicaciones empresariales tradicionales.

Este libro está dirigido principalmente a arquitectos empresariales y desarrolladores de aplicaciones que se dedican o están pensando en escribir servicios web y aplicaciones de servicios web con la plataforma **J2EE**. También es útil para los proveedores de productos interesados en desarrollar aplicaciones de servicios web compatibles con el estándar de la plataforma J2EE.

### Obtención de la solicitud de referencia

La aplicación de referencia del constructor de aventuras, que se describe en este libro, está disponible en el disco compacto que se incluye con este libro. 

También puedes descargarlo desde:

http://java.sun.com/blueprints/code/

La aplicación requiere una plataforma compatible con **J2EE versión 1.4** para ejecutarse. El disco compacto adjunto incluye una implementación de esta plataforma y un servidor de aplicaciones. Puede descargar **J2EE SDK TM**, que es una implementación gratuita de esa plataforma, desde:

http://java.sun.com/j2ee/download.html

El sitio web de **Java BluePrints** incluye contenido adicional, disponible sólo en línea, que describe en detalle la arquitectura de la aplicación de muestra **Java Adventure Builder**.

### Referencias y recursos

Los punteros a la documentación de J2EE se pueden encontrar en:

http://java.sun.com/j2ee/1.4/docs

Para obtener información sobre cómo usar J2EE SDK para crear aplicaciones empresariales de varios niveles, consulte el Tutorial de J2EE , disponible en:

http://java.sun.com/j2ee/1.4/docs/tutorial/docs

Confiamos en muchas de las siguientes referencias para detalles técnicos y antecedentes. Estas referencias son buenas fuentes para aquellos interesados en explorar los servicios web con mayor detalle.

Diseño de aplicaciones empresariales con la plataforma J2EE , segunda edición. I. Singh, B. Stearns, M. Johnson, Equipo empresarial. Copyright 2002, Addison-Wesley.

El sitio web de Java BluePrints, < http://java.sun.com/blueprints > .

Patrones Core J2EE: mejores prácticas y estrategias de diseño , segunda edición . D. Alur, D. Malks, J. Crupi. Copyright 2003, Prentice Hall PTR.

Patrones de integración empresarial: diseño, construcción e implementación de soluciones de mensajería . G. Hohpe, B. Woolf. Copyright 2003, Addison-Wesley.

Los estándares de servicios web citados en este libro son:

* Perfil básico de WS-I, versión 1.0 . Disponible en < http://www.ws-i.org >.

* Protocolo simple de acceso a objetos, versión 1.1 . Disponible en < http://www.w3.org >.

* Lenguaje de marcado extensible (XML), versión 1.0 . Disponible en < http://www.w3.org >.

* Lenguaje de descripción de servicios web, versión 1.1 . Disponible en < http://www.w3.org >.

* Esquema XML, Parte 1 y 2 . Disponible en < http://www.w3.org >.

* Descripción Universal, Descubrimiento e Integración (UDDI), Versión 2 . Disponible en < http://www.w3.org >.

Las tecnologías J2EE citadas en este libro se describen en sus especificaciones:

* Java™ 2 Platform, Enterprise Edition Specification, versión 1.4 (especificación J2EE). Disponible en < http://java.sun.com/j2ee/ > .

* API de Java™ para la especificación RPC basada en XML, versión 1.1 ( especificación JAXP ). Disponible en < http://java.sun.com/xml/jaxrpc/ >

* API Java™ para la especificación de procesamiento XML, versión 1.2 ( especificación JAXP ). Disponible en < http://java.sun.com/xml/jaxp/ >

* SOAP con API de archivos adjuntos para especificación Java, versión 1.2 (especificación SAAJ). Disponible en < http://java.sun.com/xml/saaj/ >

* API de Java para la especificación de registros XML, versión 1.0 (especificación JAXR). Disponible en < http://java.sun.com/xml/jaxr/ >

* Servicios web para la especificación J2EE, versión 1.1 . Disponible en < ftp://www.ibm.com/pub/jsr109/spec1.1/ >

* API de Java para especificación de enlace XML (especificación JAXB). Disponible en < http://java.sun.com/xml/jaxb/ >

* Especificación de servlet de Java™, versión 2.4 (especificación de servlet). Disponible en < http://java.sun.com/products/servlet/ >

* Especificación JavaServer Pages™, versión 2.0 (especificación JSP). Disponible en < http://java.sun.com/products/jsp/ >

* Especificación Enterprise JavaBeans™, versión 2.1 (especificación EJB). Disponible en < http://java.sun.com/products/ejb/ >

* Especificación de la arquitectura del conector J2EE™, versión 1.5 ( Especificación del conector). Disponible en < http://java.sun.com/j2ee/connector/ >

* Especificación del servicio de mensajes Java™, versión 1.0.2 (especificación JMS). Disponible en < http://java.sun.com/products/jms/ >


### Cómo está organizado este libro

Este libro se divide en los siguientes capítulos:

* El Capítulo 1 , “Introducción”, describe los servicios web y explica el soporte proporcionado por la plataforma J2EE 1.4 para los servicios web.

* El Capítulo 2 , "Estándares y tecnologías", enumera y describe en detalle las tecnologías de comunicación, servicios y componentes específicos de los servicios web compatibles con la plataforma J2EE 1.4.

* El Capítulo 3 , "Diseño de punto final de servicio", describe la mejor manera de diseñar e implementar un punto final de servicio web.

* El Capítulo 4 , "Procesamiento de XML", aborda en detalle los problemas para diseñar y desarrollar aplicaciones basadas en XML y manejar documentos XML. En particular, se enfoca en aquellas cuestiones que son de mayor preocupación para los clientes y puntos finales de servicios web.

* El Capítulo 5 , "Diseño del cliente", describe los diferentes modos de comunicación que utilizan los clientes J2EE y no J2EE para acceder a los servicios web. Incluye pautas y técnicas para escribir aplicaciones de cliente de servicios web eficientes.

* El Capítulo 6 , "Integración de aplicaciones empresariales", describe las capacidades proporcionadas por la plataforma J2EE para usar servicios web para integrar aplicaciones y datos, y muestra cómo utilizar mejor estas capacidades en una aplicación empresarial.

* El Capítulo 7 , "Seguridad", describe el modelo de seguridad J2EE y cómo se aplica a los puntos finales y clientes del servicio web.

* El capítulo 8 , "Arquitectura y diseño de aplicaciones", reúne los temas de los capítulos anteriores en un modelo de programación coherente que ilustra la mejor manera de diseñar y desarrollar puntos finales y clientes de servicios web.

* “Glosario” es una lista de palabras y frases que se encuentran en este libro y sus definiciones.

