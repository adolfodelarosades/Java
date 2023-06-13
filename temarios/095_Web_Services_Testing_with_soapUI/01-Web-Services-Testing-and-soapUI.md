# Capítulo 1. Pruebas de web services y soapUI

Los web services son una de las clavesbloques de construcción de soluciones orientadas a servicios. Debido a su uso e importancia en las aplicaciones empresariales, se espera que los equipos de proyecto estén bien informados y familiarizados con las tecnologías asociadas con los web services y la arquitectura orientada a servicios ( SOA ). El aspecto de prueba de los web services en particular es uno de los temas clave que debe discutirse cuando se trabaja con web services.

Las pruebas de web services se pueden realizar utilizando muchos enfoques. Las API de cliente incluidas en marcos de web services como Apache Axis2 se pueden usar para invocar web services mediante programación. Además de eso, hay varias herramientas de propiedad y de código abierto disponibles para probar los web services automáticamente. soapUI es una de esas herramientas de prueba gratuitas y de código abierto que admite evaluaciones funcionales y no funcionales de web services.

Discutiremos los siguientes temas en este capítulo que le proporcionarán una introducción a los conceptos básicos de SOA, pruebas de web services y soapUI:

Descripción general de algunas de las características clave de los web services
El papel de los web services en SOA
Enfoques de prueba de web services
Desafíos de prueba de web services
Introducción a la interfaz de usuario de jabón
Instalación de la interfaz de usuario de jabón
SOA y web services
SOA es un distintivoenfoque para separar preocupaciones y construir soluciones comerciales utilizando componentes reutilizables y poco acoplados. SOA ya no es una característica agradable para la mayoría de las empresas y se usa ampliamente en las organizaciones para lograr muchas ventajas estratégicas. Al adoptar SOA, las organizaciones pueden permitir que sus aplicaciones comerciales respondan de manera rápida y eficiente a los cambios comerciales, de procesos y de integración que generalmente ocurren en cualquier entorno empresarial.

Soluciones orientadas al servicio
Si un sistema de software se construye siguiendo los principios asociados con SOA, se puede considerar como una solución orientada a servicios. Las organizaciones generalmente tienden a crear soluciones orientadas a servicios para aprovechar la flexibilidad en sus negocios, fusionarse o adquirir nuevos negocios y lograr ventajas competitivas. Para comprender el uso y el propósito de SOA y las soluciones orientadas a servicios, echemos un vistazo a un estudio de caso simplificado.

Caso de estudio
Smith and Co. es un gran proveedor de pólizas de seguros de automóviles ubicado en América del Norte. La empresa utiliza un sistema de software para realizar todas sus operaciones asociadas con el procesamiento de reclamos de seguros.El sistema consta de varios módulos, incluidos los siguientes:

Inscripción y registro de clientes
Tramitación de pólizas de seguro
Procesamiento de reclamos de seguros
Gestión de clientes
Contabilidad
Gestión de proveedores de servicios
Con el enorme éxito y la satisfacción del cliente de las reclamaciones de seguros procesadas por la compañía durante el pasado reciente, Smith and Co. adquirió InsurePlus Inc., uno de sus proveedores de seguros competidores, hace unos meses.

InsurePlus también ha proporcionado algunas de las pólizas de reclamaciones de automóviles de seguros que son similares a las que Smith and Co. proporciona a sus clientes. Por lo tanto, la dirección de la empresa ha decidido integrar los sistemas de procesamiento de reclamaciones de seguros utilizados por ambas empresas y ofrecer una solución a sus clientes.

Smith and Co. utiliza muchas tecnologías de Microsoft(TM) y todas sus aplicaciones de software, incluido el sistema general de administración de pólizas de seguros, se basan en el marco .NET. Por otro lado, InsurePlus usa mucho J2EE y sus aplicaciones de procesamiento de seguros están todas basadas en tecnologías Java. Para empeorar el problema de la integración, InsurePlus también consta de un componente de aplicación de administración de clientes heredado, que se ejecuta en un sistema AS-400.

Los departamentos de TI de ambas empresas enfrentaron numerosas dificultades cuando intentaron integrar las aplicaciones de software en Smith and Co. e InsurePlus Inc. Tuvieron que escribir muchos módulos adaptadores para que ambas aplicaciones se comunicaran entre sí y realizaran las conversiones de protocolo como necesario.

Para superar estos y futuros problemas de integración, la gerencia de TI de Smith and Co. decidió adoptar SOA en su metodología de desarrollo de aplicaciones comerciales y convertir el sistema de procesamiento de seguros en una solución orientada a servicios.

Como primer paso, se construyeron muchos servicios de envoltura (web services que encapsulan la lógica de diferentes módulos de procesamiento de seguros), exponiéndolos como web services. Por lo tanto, los módulos individuales pudieron comunicarse entre sí con preocupaciones mínimas de integración.Al adoptar SOA, sus aplicaciones usaban un lenguaje común, XML, en la transmisión de mensajes y, por lo tanto, sistemas heterogéneos como el sistema de manejo de pólizas de seguro basado en .NET en Smith and Co. pudo comunicarse con las aplicaciones basadas en Java que se ejecutan en InsurePlus Inc.

Al implementar una solución orientada al servicio, el sistema de Smith and Co. pudo fusionarse con muchos otros sistemas heredados con una sobrecarga de integración mínima.

Bloques de construcción de SOA
Al estudiar soluciones típicas orientadas a servicios,Podemos identificar tres bloques de construcción principales de la siguiente manera:

web services
Mediación
Composición
web services
Los web services son las unidades individuales de lógica empresarial en SOA. Los web services se comunican entre sí y con otros programas o aplicaciones mediante el envío de mensajes. Los web services consisten en una interfaz pública definición que es una pieza central de información que asigna una identidad al servicio y permite su invocación.

El contenedor de servicios es el componente de middleware SOA donde se aloja el servicio web para que las aplicaciones que lo consumen interactúen con él. Permite a los desarrolladores crear, implementar y administrar web services y también representa la función del procesador del lado del servidor en los marcos de web services. Una lista de usos comunesLos marcos de web services se pueden encontrar en http://en.wikipedia.org/wiki/List_of_web_service_frameworks ; aquí puede encontrar algunos middleware de web services populares como Windows Communication Foundation ( WCF ), Apache CXF, Apache Axis2, etc. Usaremos Apache Axis2 como contenedor de servicios para proyectos de muestra dentro del contexto de este libro. Apache Axis2 se puede encontrar en http://axis.apache.org/ .

El contenedor de servicios contiene la lógica empresarial , que interactúa con el consumidor del servicio a través de una interfaz de servicio .Esto se muestra en el siguiente diagrama:


Mediación
Por lo general, la transmisión de mensajes entre nodos en una solución orientada a servicios no solo ocurre a través de los típicos canales punto a punto. En cambio, una vez que se recibe un mensaje, puede fluir a través de múltiples intermediarios y someterse a diversas transformaciones y conversiones según sea necesario. Este comportamiento se conoce comúnmente como mediación de mensajes.y es otro bloque de construcción importante en soluciones orientadas a servicios. Similar a cómo se utiliza el contenedor de servicios como plataforma de alojamiento para web services,un intermediario es el componente de middleware SOA correspondiente para la mediación de mensajes. Por lo general, bus de servicio empresarial ( ESB )actúa como intermediario en soluciones orientadas a servicios.

Composición
En las soluciones orientadas a servicios, no podemos esperar que los web services individuales se ejecuten solos para proporcionar la funcionalidad empresarial deseada. En cambio, múltiples web services trabajan juntos y participan en varias composiciones de servicios. Por lo general, los web services se reúnen dinámicamente en el tiempo de ejecución según las reglas especificadas en las definiciones de procesos comerciales. La gestión o coordinación de estos procesos de negocio se rigen por el coordinador de procesos , que es el componente de middleware SOA asociado a las composiciones de web services.

Examinamos los componentes básicos principales de las soluciones orientadas a servicios y los componentes de middleware SOA correspondientes. A continuación, vamos a discutir algunos de los elementos distinguidos asociados específicamente con los web services.Estos son mensajería SOAP, lenguaje de descripción de web services ( WSDL ), patrones de intercambio de mensajes y servicios RESTful.Capítulo 1. Pruebas de web services y soapUI
Los web services son una de las clavesbloques de construcción de soluciones orientadas a servicios. Debido a su uso e importancia en las aplicaciones empresariales, se espera que los equipos de proyecto estén bien informados y familiarizados con las tecnologías asociadas con los web services y la arquitectura orientada a servicios ( SOA ). El aspecto de prueba de los web services en particular es uno de los temas clave que debe discutirse cuando se trabaja con web services.

Las pruebas de web services se pueden realizar utilizando muchos enfoques. Las API de cliente incluidas en marcos de web services como Apache Axis2 se pueden usar para invocar web services mediante programación. Además de eso, hay varias herramientas de propiedad y de código abierto disponibles para probar los web services automáticamente. soapUI es una de esas herramientas de prueba gratuitas y de código abierto que admite evaluaciones funcionales y no funcionales de web services.

Discutiremos los siguientes temas en este capítulo que le proporcionarán una introducción a los conceptos básicos de SOA, pruebas de web services y soapUI:

Descripción general de algunas de las características clave de los web services
El papel de los web services en SOA
Enfoques de prueba de web services
Desafíos de prueba de web services
Introducción a la interfaz de usuario de jabón
Instalación de la interfaz de usuario de jabón
SOA y web services
SOA es un distintivoenfoque para separar preocupaciones y construir soluciones comerciales utilizando componentes reutilizables y poco acoplados. SOA ya no es una característica agradable para la mayoría de las empresas y se usa ampliamente en las organizaciones para lograr muchas ventajas estratégicas. Al adoptar SOA, las organizaciones pueden permitir que sus aplicaciones comerciales respondan de manera rápida y eficiente a los cambios comerciales, de procesos y de integración que generalmente ocurren en cualquier entorno empresarial.

Soluciones orientadas al servicio
Si un sistema de software se construye siguiendo los principios asociados con SOA, se puede considerar como una solución orientada a servicios. Las organizaciones generalmente tienden a crear soluciones orientadas a servicios para aprovechar la flexibilidad en sus negocios, fusionarse o adquirir nuevos negocios y lograr ventajas competitivas. Para comprender el uso y el propósito de SOA y las soluciones orientadas a servicios, echemos un vistazo a un estudio de caso simplificado.

Caso de estudio
Smith and Co. es un gran proveedor de pólizas de seguros de automóviles ubicado en América del Norte. La empresa utiliza un sistema de software para realizar todas sus operaciones asociadas con el procesamiento de reclamos de seguros.El sistema consta de varios módulos, incluidos los siguientes:

Inscripción y registro de clientes
Tramitación de pólizas de seguro
Procesamiento de reclamos de seguros
Gestión de clientes
Contabilidad
Gestión de proveedores de servicios
Con el enorme éxito y la satisfacción del cliente de las reclamaciones de seguros procesadas por la compañía durante el pasado reciente, Smith and Co. adquirió InsurePlus Inc., uno de sus proveedores de seguros competidores, hace unos meses.

InsurePlus también ha proporcionado algunas de las pólizas de reclamaciones de automóviles de seguros que son similares a las que Smith and Co. proporciona a sus clientes. Por lo tanto, la dirección de la empresa ha decidido integrar los sistemas de procesamiento de reclamaciones de seguros utilizados por ambas empresas y ofrecer una solución a sus clientes.

Smith and Co. utiliza muchas tecnologías de Microsoft(TM) y todas sus aplicaciones de software, incluido el sistema general de administración de pólizas de seguros, se basan en el marco .NET. Por otro lado, InsurePlus usa mucho J2EE y sus aplicaciones de procesamiento de seguros están todas basadas en tecnologías Java. Para empeorar el problema de la integración, InsurePlus también consta de un componente de aplicación de administración de clientes heredado, que se ejecuta en un sistema AS-400.

Los departamentos de TI de ambas empresas enfrentaron numerosas dificultades cuando intentaron integrar las aplicaciones de software en Smith and Co. e InsurePlus Inc. Tuvieron que escribir muchos módulos adaptadores para que ambas aplicaciones se comunicaran entre sí y realizaran las conversiones de protocolo como necesario.

Para superar estos y futuros problemas de integración, la gerencia de TI de Smith and Co. decidió adoptar SOA en su metodología de desarrollo de aplicaciones comerciales y convertir el sistema de procesamiento de seguros en una solución orientada a servicios.

Como primer paso, se construyeron muchos servicios de envoltura (web services que encapsulan la lógica de diferentes módulos de procesamiento de seguros), exponiéndolos como web services. Por lo tanto, los módulos individuales pudieron comunicarse entre sí con preocupaciones mínimas de integración.Al adoptar SOA, sus aplicaciones usaban un lenguaje común, XML, en la transmisión de mensajes y, por lo tanto, sistemas heterogéneos como el sistema de manejo de pólizas de seguro basado en .NET en Smith and Co. pudo comunicarse con las aplicaciones basadas en Java que se ejecutan en InsurePlus Inc.

Al implementar una solución orientada al servicio, el sistema de Smith and Co. pudo fusionarse con muchos otros sistemas heredados con una sobrecarga de integración mínima.

Bloques de construcción de SOA
Al estudiar soluciones típicas orientadas a servicios,Podemos identificar tres bloques de construcción principales de la siguiente manera:

web services
Mediación
Composición
web services
Los web services son las unidades individuales de lógica empresarial en SOA. Los web services se comunican entre sí y con otros programas o aplicaciones mediante el envío de mensajes. Los web services consisten en una interfaz pública definición que es una pieza central de información que asigna una identidad al servicio y permite su invocación.

El contenedor de servicios es el componente de middleware SOA donde se aloja el servicio web para que las aplicaciones que lo consumen interactúen con él. Permite a los desarrolladores crear, implementar y administrar web services y también representa la función del procesador del lado del servidor en los marcos de web services. Una lista de usos comunesLos marcos de web services se pueden encontrar en http://en.wikipedia.org/wiki/List_of_web_service_frameworks ; aquí puede encontrar algunos middleware de web services populares como Windows Communication Foundation ( WCF ), Apache CXF, Apache Axis2, etc. Usaremos Apache Axis2 como contenedor de servicios para proyectos de muestra dentro del contexto de este libro. Apache Axis2 se puede encontrar en http://axis.apache.org/ .

El contenedor de servicios contiene la lógica empresarial , que interactúa con el consumidor del servicio a través de una interfaz de servicio .Esto se muestra en el siguiente diagrama:


Mediación
Por lo general, la transmisión de mensajes entre nodos en una solución orientada a servicios no solo ocurre a través de los típicos canales punto a punto. En cambio, una vez que se recibe un mensaje, puede fluir a través de múltiples intermediarios y someterse a diversas transformaciones y conversiones según sea necesario. Este comportamiento se conoce comúnmente como mediación de mensajes.y es otro bloque de construcción importante en soluciones orientadas a servicios. Similar a cómo se utiliza el contenedor de servicios como plataforma de alojamiento para web services,un intermediario es el componente de middleware SOA correspondiente para la mediación de mensajes. Por lo general, bus de servicio empresarial ( ESB )actúa como intermediario en soluciones orientadas a servicios.

Composición
En las soluciones orientadas a servicios, no podemos esperar que los web services individuales se ejecuten solos para proporcionar la funcionalidad empresarial deseada. En cambio, múltiples web services trabajan juntos y participan en varias composiciones de servicios. Por lo general, los web services se reúnen dinámicamente en el tiempo de ejecución según las reglas especificadas en las definiciones de procesos comerciales. La gestión o coordinación de estos procesos de negocio se rigen por el coordinador de procesos , que es el componente de middleware SOA asociado a las composiciones de web services.

Examinamos los componentes básicos principales de las soluciones orientadas a servicios y los componentes de middleware SOA correspondientes. A continuación, vamos a discutir algunos de los elementos distinguidos asociados específicamente con los web services.Estos son mensajería SOAP, lenguaje de descripción de web services ( WSDL ), patrones de intercambio de mensajes y servicios RESTful.

## Simple Object Access Protocol
Protocolo simple de acceso a objetos ( SOAP )puede considerarse como el principal estándar de mensajería para su uso con web services. Está definido por el World Wide Web Consortium ( W3C ) en http://www.w3.org/TR/2000/NOTE-SOAP-20000508/ de la siguiente manera:

SOAP es un protocolo ligero para el intercambio de información en un entorno distribuido y descentralizado. Es un protocolo basado en XML que consta de tres partes: un sobre que define un marco para describir el contenido de un mensaje y cómo procesarlo, un conjunto de reglas de codificación para expresar instancias de tipos de datos definidos por la aplicación y una convención para representar llamadas y respuestas a procedimientos remotos.

La especificación SOAP ha sido universalmente aceptada como el protocolo de transporte estándar para mensajes procesados por web services. Hay dos versiones diferentes de la especificación SOAP y ambas se utilizan ampliamente en soluciones orientadas a servicios. Estas dos versiones son SOAP v1.1 y SOAP v1.2.

Independientemente de la versión de la especificación SOAP, el formato de mensaje de un mensaje SOAP permanece intacto. Un mensaje SOAP es un documento XML que consta de un sobre SOAP obligatorio, un encabezado SOAP opcional y un cuerpo SOAP obligatorio.

La estructura de un mensaje SOAPse muestra en el siguiente diagrama:


El sobre SOAP es el elemento contenedor que contiene todos los nodos secundarios dentro de un mensaje SOAP.

El elemento de encabezado SOAP es un bloque opcional donde se almacena la metainformación. Usando los encabezados, los mensajes SOAP pueden contener diferentes tipos de información complementaria relacionada con la entrega y el procesamiento de mensajes. Esto proporciona indirectamente la ausencia de estado para los web services, ya que al mantener los encabezados SOAP, los servicios no necesariamente necesitan almacenar la lógica específica del mensaje. Por lo general, los encabezados SOAP pueden incluir lo siguiente:

Instrucciones de procesamiento de mensajes
Metadatos de la política de seguridad
Información de direccionamiento
Datos de correlación de mensajes
Metadatos de mensajería fiables
El cuerpo SOAPes el elemento donde se alojan los contenidos reales del mensaje. Estos contenidos del cuerpo se conocen generalmente como el mensaje.carga útil.

Echemos un vistazo a un mensaje SOAP de muestra y relacionemos los conceptos anteriores a través del siguiente diagrama:


En este ejemplo de mensaje SOAP, podemos identificar claramente los tres elementos; sobre, cuerpo y encabezado. El elemento de encabezado incluye un conjunto de elementos secundarios como <wsa:To>, <wsa:ReplyTo>, <wsa:Address>, <wsa:MessageID>y <wsa:Action>. Estos bloques de encabezado forman parte de la especificación WS-Addressing. De manera similar, cualquier elemento de encabezado asociado con las especificaciones WS-* se puede incluir dentro del elemento de encabezado SOAP.

El <s:Body>elemento lleva la carga útil del mensaje real. En este ejemplo, es el <p:echoString>elemento con un elemento secundario.

CONSEJO
Cuando se trabaja con mensajes SOAP, la identificación de la versión del mensaje SOAP es uno de los requisitos importantes. A primera vista, puede determinar la versión de la especificación utilizada en el mensaje SOAP a través del identificador de espacio de nombres del <Envelope>elemento. Si el mensaje cumple con la especificación SOAP 1.1, sería http://schemas.xmlsoap.org/soap/envelope/ ; de lo contrario, http://www.w3.org/2003/05/soap-envelope es el identificador del espacio de nombres de mensajes SOAP 1.2.
  
## Alternatives to SOAP
Though SOAP is considered as the standard protocol for web services communication, it is not the only possible transport protocol which is used. SOAP was designed to be extensible so that the other standards could be integrated into it. The WS-* extensions such as WS-Security, WS-Addressing, and WS-ReliableMessaging are associated with SOAP messaging due to this extensible nature. In addition to the platform and language agnosticism, SOAP messages can be transmitted over various transports such as HTTP, HTTPS, JMS, and SMTP among others. However, there are a few drawbacks associated with SOAP messaging. The performance degradations due to heavy XML processing and the complexities associated with the usage of various WS-* specifications are two of the most common disadvantages of the SOAP messaging model. Because of these concerns, we can identify some alternative approaches to SOAP.

REST
Due to the complexities accompanied with the SOAP model, Representational State Transfer (REST) architecture has emerged as a result. RESTful web services can be considered as a lightweight alternative to the bulky and complex SOAP based web service standards. In RESTful web services, the emphasis is on point-to-point communication over HTTP, primarily using plain old XML (POX) messages. We will discuss RESTful web services in detail in Chapter 8, Getting started with REST Testing.

Java Script Object Notation
Java Script Object Notation (JSON) is a lightweight data exchange format similar to XML. It is based on a subset of JavaScript language. JSON uses key value pairs to represent data which are carried inside the message. The following example shows how the XML payload of a SOAP message can be represented in JSON:

Java Script Object Notation
The corresponding JSON format of the preceding XML payload is represented by:

Java Script Object Notation
You may refer to http://www.json.org for more details about JSON.
  
## Alternatives to SOAP
Though SOAP is considered as the standard protocol for web services communication, it is not the only possible transport protocol which is used. SOAP was designed to be extensible so that the other standards could be integrated into it. The WS-* extensions such as WS-Security, WS-Addressing, and WS-ReliableMessaging are associated with SOAP messaging due to this extensible nature. In addition to the platform and language agnosticism, SOAP messages can be transmitted over various transports such as HTTP, HTTPS, JMS, and SMTP among others. However, there are a few drawbacks associated with SOAP messaging. The performance degradations due to heavy XML processing and the complexities associated with the usage of various WS-* specifications are two of the most common disadvantages of the SOAP messaging model. Because of these concerns, we can identify some alternative approaches to SOAP.

REST
Due to the complexities accompanied with the SOAP model, Representational State Transfer (REST) architecture has emerged as a result. RESTful web services can be considered as a lightweight alternative to the bulky and complex SOAP based web service standards. In RESTful web services, the emphasis is on point-to-point communication over HTTP, primarily using plain old XML (POX) messages. We will discuss RESTful web services in detail in Chapter 8, Getting started with REST Testing.

Java Script Object Notation
Java Script Object Notation (JSON) is a lightweight data exchange format similar to XML. It is based on a subset of JavaScript language. JSON uses key value pairs to represent data which are carried inside the message. The following example shows how the XML payload of a SOAP message can be represented in JSON:

Java Script Object Notation
The corresponding JSON format of the preceding XML payload is represented by:

Java Script Object Notation
You may refer to http://www.json.org for more details about JSON.
  
## Lenguaje de descripción de web services
  
Según la especificación WSDL 1.1, WSDL esdefinido como:

WSDL es un formato XML para describir los servicios de red como un conjunto de puntos finales que operan en mensajes que contienen información orientada a documentos oa procedimientos. Las operaciones y los mensajes se describen de forma abstracta y luego se vinculan a un protocolo de red y un formato de mensaje concretos para definir un punto final. Los puntos finales concretos relacionados se combinan en puntos finales abstractos (servicios)

En términos simples, WSDL proporciona una definición formal del servicio web a través de definiciones abstractas y concretas de la interfaz. El siguiente diagrama muestra la estructura principal de un documento WSDL:


WSDL es un documento XML con un <definitions>elemento en la raíz y los elementos secundarios, <types>, <message>, <portType>y <binding>. Estos se pueden explicar de la siguiente manera:

el <types>elementose utiliza para definir los tipos de datos utilizados por el servicio web, generalmente a través de un esquema XML. El esquema se puede definir en línea como un elemento secundario <types>o se puede importar desde una URL externa.
el <message>elementodefine una representación abstracta de todos los mensajes utilizados por el servicio web. Un mensaje consta de partes lógicas, cada una de las cuales está asociada con una definición dentro de algún tipo en el esquema XML del servicio web. La siguiente imagen es un ejemplo de un mensaje:

El <portType>elemento es una representación abstracta de las operaciones y los patrones de intercambio de mensajes utilizados en el servicio web. Las operaciones representan una acción específica.realizado por un servicio web y que puede estar relacionado con los métodos públicos utilizados por un programa. Las operaciones tienen parámetros de entrada y salida y estos se representan como mensajes. Por lo tanto, una operación consta de conjuntos de mensajes de entrada y salida. Esto es evidente en la siguiente imagen:

En el ejemplo anterior, el SampleServicePortTypeelemento incluye un solo elemento secundario, <wsdl:operation name="echoString">que a su vez incluye dos elementos secundarios para definir los mensajes de entrada y salida procesados ​​por la echoStringoperación.

el <binding>elementoconecta la interfaz de servicio web abstracta definida por <portType>los <message>elementos y en un protocolo de transporte físico. Un enlace representa una tecnología de transporte particular que el servicio utiliza para comunicarse. Por ejemplo, SOAP v1.1 es uno de esos enlaces de uso común.
Hablaremos sobre el WSDL en detalle en el Capítulo 2 , El proyecto de muestra , usando el que se usa en el proyecto de muestra.
  
## Patrones de intercambio de mensajes
Como ya hemos comentado, los web services se comunican entre sí y con los demás programas mediante el envío de mensajes. Si consideramos dos nodos de procesamiento SOAP, el patrón de comunicación entre las dos entidades se puede definir como un patrón de intercambio de mensajes ( MEP ).Los principales patrones de intercambio de mensajes son:

Solicitar respuesta
Dispara y olvida
En un patrón de solicitud-respuesta, cuando una entidad de origen (solicitante de servicio) transmite un mensaje a un destino (proveedor de servicio), el proveedor debe responder al solicitante. Este es el patrón de intercambio de mensajes más utilizado y lo usaremos en la mayoría de los ejemplos de este libro.

En el siguiente diagrama, un solicitante de servicios envía un mensaje de solicitud SOAP a un proveedor de servicios:

Patrones de intercambio de mensajes
Al recibir el mensaje de solicitud SOAP, el proveedor de servicios responde con una respuesta SOAP como se muestra en el siguiente diagrama:

Patrones de intercambio de mensajes
Cuando no se espera una respuesta a un mensaje de solicitud de un servicio web (o proveedor de servicios), se conoce como un patrón de intercambio de mensajes de disparar y olvidar. Por ejemplo, si enviamos una solicitud de ping a un servicio web, no esperamos un mensaje de respuesta.
  
## Errores de SOAP
Antes de concluir nuestra discusión sobre los web services y los conceptos asociados, debemos analizar el mecanismo de manejo de fallas de los web services. Los web services pueden devolver fallas debido a varias razones. Por ejemplo, si el mensaje de solicitud no se ajusta al esquema XML del servicio web, el servicio responde con un error de SOAP. El elemento de error de SOAP se utiliza para transportardichas fallas ocurrieron durante la comunicación del servicio web. Este elemento debe incluirse dentro del cuerpo de un mensaje SOAP. Un mensaje de error típico de SOAP 1.1 consta de los siguientes elementos secundarios:

faultcode: El faultcodeelemento se utiliza para definir el tipo de fallo. Por ejemplo, si el problemade la transmisión del mensaje se debe al servidor, el código de falla asociado es Server. Del mismo modo, podemos usar VersionMismatchy códigos de error según corresponda MustUnderstand.Client
faultstring: El faultstringelementotiene la intención de proporcionar una explicación legible por humanos sobre la falla.
faultactor: ElfaultactorEl elemento proporciona una indicación sobre la parte responsable que provocó la falla en la ruta del mensaje.
detail: EldetailEl elemento se utiliza para transportar información de error específica de la aplicación relacionada con el elemento del cuerpo. Por ejemplo, si el servicio web no puede procesar la carga útil de la solicitud SOAP, la respuesta asociada debe incluir el elemento de detalle dentro de la falla SOAP.
En el caso de la mensajería SOAP v1.2, faultcodese cambia el nombre a Codey faultstringse cambia el nombre a Reason. Además de eso, un mensaje de error de SOAP v1.2 puede incluir los elementos secundarios opcionales Node, Role,y Detail.Puede encontrar una explicación detallada de las fallas de SOAP 1.1 en http://www.w3.org/TR/2000/NOTE-SOAP-20000508/#_Toc478383507 . Las fallas de SOAP 1.2 se explican en detalle en http://www.w3.org/TR/soap12-part1/#soapfault .
  
## Enfoques de prueba de web services
  
Discutimos un conjunto de conceptos más asociados con los web services. Ahora es el momento de analizar los aspectos de prueba de los web services. Como notamos, los web services son componentes autónomos y poco acoplados que son unidades individuales de lógica empresarial en SOA. Esto facilita un enfoque distinguido para probar web services. Debido a la naturaleza débilmente acoplada, los servicios no mantienen estrechas dependencias entre servicios entre sí. Por lo tanto, una vez que se implementa un servicio web en particular, se puede probar independientemente de los demás.

Esto brinda a los probadores la capacidad de seguir una metodología de prueba a nivel de componente. Antes de pasar a varias integraciones, se puede probar un servicio web para verificar los requisitos funcionales y no funcionales. Una vez que el servicio se mejora con diferentes atributos, como políticas de seguridad, dicho servicio también se puede probar individualmente para garantizar que funcione correctamente antes de tener en cuenta los escenarios de integración. Esto brinda una gran flexibilidad para los evaluadores y brinda agilidad a los procesos de prueba.

Podemos identificar un conjunto de enfoques comunes paraprobando los web services de la siguiente manera:

Examen de la unidad
Pruebas funcionales de web services.
Pruebas de integración de web services
Pruebas de rendimiento
Analicemos cada uno de estos enfoques en detalle.

Pruebas unitarias de web services
Un servicio web es una unidad de lógica empresarial y consta de una o más operaciones. Estas operaciones deben probarse individualmente para asegurarse de que el servicio web aborde los problemas comerciales previstos. operaciones. Por lo tanto, al igual que los métodos individuales en un programa de computadora se prueban como unidades, las operaciones del servicio web también deben probarse como unidades. Las pruebas unitarias se pueden desarrollar utilizando el marco de pruebas unitarias asociado con el lenguaje de programación que se utiliza para implementar los web services. Por ejemplo, si los web services están escritos en Java, el marco JUnit se puede usar como marco de pruebas unitarias. Generalmente, es responsabilidad del autor del servicio web escribir una cantidad suficiente de pruebas unitarias para cubrir la lógica de las operaciones del servicio web.

Pruebas funcionales
Una vez que un servicio web se implementa en un contenedor de servicios, se somete a una verificación funcional integral. El propósito de La prueba funcional de un servicio web es para garantizar que el servicio web proporciona la funcionalidad comercial esperada. Hay muchos enfoques para realizar pruebas funcionales como se explica a continuación.

Pruebas asistidas por herramientas
El objetivo principal de usar herramientas para la prueba de web services es admitir la generación y el envío automáticos de solicitudes de web services. Como la interfaz del servicio web es un documento XML legible por máquina, No es una tarea fácil leer el WSDL y derivar pruebas manualmente. Por lo tanto, se pueden utilizar herramientas para apuntar al WSDL y generar automáticamente las solicitudes correspondientes, para que los probadores puedan enviarlas al servicio con o sin alteraciones. soapUI es un buen ejemplo de una herramienta de prueba de este tipo, que se puede utilizar en las pruebas funcionales de los web services.

Uso de las API de cliente proporcionadas por el middleware del contenedor de servicios
La vida de un servicio web viene dada por el middleware del contenedor de servicios donde se aloja el servicio. Por lo general, los proveedores de middleware envían las bibliotecas de API de cliente asociadas que se pueden usar para invocar web services mediante programación sin usar ninguna herramienta de terceros.

Pruebas de integración de web services
  
Los web services esencialmente no se ejecutan solos. En cambio, están integrados con múltiples componentes, como corredores o servicios.coordinadores Una vez que un servicio se integra o se une a otro componente, debemos realizar pruebas para asegurarnos de que dichas integraciones no rompan el sistema. Por ejemplo, en una solución orientada a servicios, si una aplicación de consumidor de servicios envía un mensaje a un servicio web pero el mensaje no se ajusta al esquema anunciado del servicio web. En este caso, el servicio web suele responder con un fallo de SOAP. Sin embargo, si queremos tomar dicha solicitud y transformar el mensaje SOAP de solicitud para que sea válido de acuerdo con el esquema, entonces no queremos pedir a los consumidores de nuestro servicio web que cambien las aplicaciones cliente a medida que se modifica el esquema del servicio. . Este tipo de transformación de mensajes se logra mediante el uso de un componente de intermediario, en otras palabras, bus de servicio empresarial ( ESB) software intermedio. Según las reglas de transformación definidas en el bus de servicios empresariales, la solicitud se convierte al formato correcto y se reenvía al servicio web. Este es un tipicoejemplo de integración de web services. Para probar este tipo de integración, el mensaje de solicitud debe reenviarse al componente ESB en lugar de enviarlo directamente al servicio web. Las herramientas como soapUI se pueden usar fácilmente para enviar los mensajes a las ubicaciones de destino deseadas de manera adecuada.

Pruebas de rendimiento de los web services.
  
Una vez que estamos satisfechos con los aspectos funcionales del servicio web, debe probarse exhaustivamente el rendimiento. Esto incluye pruebas de carga y estrés del servicio web, así como la medición del rendimiento bajovarias condiciones Podemos utilizar varias herramientas comerciales o de código abierto en las pruebas de rendimiento de los web services. Apache JMeter(que se encuentra en http://jmeter.apache.org/ ) es un buen ejemplo de una herramienta de prueba de código abierto que se puede usar para probar web services. Las pruebas funcionales que creamos en soapUI se pueden ampliar fácilmente para probar el rendimiento de los web services. Discutiremos las capacidades de prueba de rendimiento de soapUI en detalle en el Capítulo 5 , Pruebas de carga y rendimiento con soapUI .

Los desafíos comunes de las pruebas de web services
  
En comparación con los enfoques de prueba tradicionales, existen algunos desafíos únicos asociados con las pruebas de web services.

Uso de web services externos
  
La naturaleza autónoma y débilmente acoplada de los web services introduce un mayor nivel de escalabilidad y extensibilidad al sistema. Todos los servicios incluidos en un sistema no necesariamente se construyen internamente. Algunos web services pueden ser desarrollados y alojados por terceros. Estos servicios pueden serdescubierto y utilizado dinámicamente de acuerdo con los requisitos del negocio. Si bien esto acelera la entrega de soluciones, probar un sistema de este tipo se vuelve complejo porque la garantía de calidad y la disponibilidad de los servicios de terceros están fuera de su control.

Implicaciones del uso de estándares y protocolos complejos
  
Los web services, especialmente los servicios basados ​​en SOAP, pueden usar varias especificaciones WS-*. Cuando se prueban web services que se adhieren a especificaciones como WS-Security, el evaluador debe poseer una buena cantidad de conocimiento sobre los estándares y conceptos para llevar a cabo las pruebas de manera efectiva. Esto introduce una curva de aprendizaje más alta para que los evaluadores comiencen a probar los web services.

Los web services también se pueden exponer a través de múltiples protocolos de transporte. Por lo tanto, las pruebas no se limitan a un transporte en particular, como HTTP. Se puede acceder al mismo servicio web a través de transportes como JMS o VFS, lo que requiere cambios en la configuración de la prueba, así como un conjunto diferente de escenarios de prueba.

Naturaleza sin cabeza de los web services
  
En las pruebas de aplicaciones web tradicionales, los escenarios de prueba se pueden identificar con bastante facilidad estudiando la GUI de los componentes. Como discutimos anteriormente, las operaciones de los web services están expuestas al mundo exterior a través de contratos de servicio legibles por máquina (como WSDL). Por lo tanto, durante las primeras etapas del desarrollo de web services, los evaluadores deben usar WSDL como referencia para la derivación de escenarios de prueba, lo que puede ser difícil en comparación con la exploración de una GUI.

A medida que avancemos con los capítulos de este libro, aprenderemos cómo soapUI aborda algunos de los desafíos antes mencionados y facilita la vida de un probador de web services.

Hemos discutido los fundamentos de SOA y las pruebas de web services. Ahora, estamos listos para explorar el mundo de las pruebas de web services con soapUI.
  
## ¿Qué es SoapUI?
El objetivo principal de diseñar herramientas de prueba es ayudar a las personas a probar el software reduciendo el tiempo que lleva la ejecución de la prueba.Hay diferentes tipos de herramientas que se pueden utilizar para pruebas funcionales y no funcionales. Algunas de las herramientas están diseñadas para automatizar las interacciones basadas en la interfaz de usuario y otras se utilizan para derivar automáticamente varios tipos de mensajes de solicitud y transmitirlos a las aplicaciones con o sin modificaciones. Algunas herramientas admiten ambos aspectos.

soapUI es una herramienta que se puede utilizar tanto para pruebas funcionales como no funcionales. No se limita a los web services, aunque es la herramienta de facto utilizada en las pruebas de web services. En las pruebas de web services, soapUI es capaz de desempeñar el papel de cliente y servicio. Permite a los usuarios crear pruebas funcionales y no funcionales de forma rápida y eficiente mediante el uso de un único entorno.

El primer lanzamiento de soapUI (v1.0) fue en octubre de 2005. Mientras trabajaba en un proyecto relacionado con SOA, Ole Lensmer sintió la necesidad de una herramienta de prueba para respaldar el desarrollo ágil. Por lo tanto, comenzó a desarrollar soapUI en su tiempo libre. Eventualmente, el proyecto fue de código abierto y la comunidad creció. Desde entonces, se han lanzado varias versiones con varias funciones y mejoras nuevas, y la versión más reciente de soapUI es la 4.0.1 al momento de escribir este libro.

El creador de soapUI, Ole Lensmer, estuvo administrando los lanzamientos del proyecto a través de una empresa llamada Eviware durante los últimos años. En julio de 2011, SmartBear Software adquirió Eviware ( http://smartbear.com/ ) y ahora soapUI forma parte de SmartBear Software.

soapUI es una utilidad gratuita y de código abierto, lo que significa que puede utilizar las diversas funciones proporcionadas por la herramienta libremente tan bien como ustedpermite realizar modificaciones en el código fuente de soapUI y adaptarlo de acuerdo con sus requisitos. soapUI tiene licencia bajo los términos de GNU Licencia Pública General Menor ( LGPL ). Se ha implementado únicamente utilizando la plataforma Java, por lo que se ejecuta en la mayoría de los sistemas operativos listos para usar.

Cabe señalar que soapUI también se distribuye como una versión comercial no gratuita conocida como soapUI Pro, que básicamente brinda a los usuarios utilidades personalizadas y capacidades de prueba de nivel de producción mejoradas. Todas nuestras discusiones y ejemplos se basan en la versión gratuita de soapUI para su conveniencia.

NOTA
soapUI v4.0.1 era la versión más nueva en el momento de escribir el libro. Por lo tanto, se utiliza en todo el contexto de este libro. Sin embargo, no discutiremos ningún tema específico de la versión, por lo que las versiones anteriores 3.x de soapUI también se pueden usar para probar los proyectos de muestra y las demostraciones.
  
  ## Capacidades de soapUI
  
El objetivo principal de los autores de soapUI es brindar a los usuarios una utilidad simple y fácil de usar que se pueda usar para crear y ejecutar pruebas funcionales y no funcionales a través de un solo entorno de prueba. Sobre la base de ese objetivo, soapUI se ha convertido en la herramienta de prueba de web services y SOA líder en el mundo. soapUI se puede instalar sin sobrecarga de configuración en la mayoría de lossistemas operativos que permiten a los usuarios comenzar a utilizar la herramienta sin perder tiempo configurando varios requisitos previos de instalación.

Al usar la GUI basada en Java Swing fácil de usar, puede comenzar a crear pruebas funcionales sin codificación. Eventualmente, las mismas pruebas funcionales se pueden usar para las pruebas de carga y rendimiento a través del mismo entorno de prueba. Esto brinda a los usuarios una gran flexibilidad ya que todas las pruebas funcionales y no funcionales se pueden administrar a través de un único punto de acceso.

Veamos algunas de las características importantes.de soapUI que estamos planeando discutir en los siguientes capítulos.

Cobertura completa de los aspectos funcionales de los web services y las aplicaciones web : soapUI admite la mayoría de los estándares utilizados en las aplicaciones web, como la transmisión de mensajes a través de HTTP, el transporte HTTPS y JMS. También admite pruebas de web services SOAP y RESTful. Específicamente, soapUI admite la mayoría de las especificaciones de web services, como WS-Security, WS-Addressing, entre otros.
Simulación de servicios : con los servicios simulados de soapUI, puede simular los web services antes de que se implementen realmente. Esto le brinda la posibilidad de probar las aplicaciones de consumo de web services sin esperar hasta que se implementen los proveedores de web services.
Secuencias de comandos : ya sea con Groovy o JavaScript, soapUI le permite realizar varias configuraciones de prueba previas o posteriores al procesamiento, como respuestas simuladas dinámicas, pruebas de inicialización o limpieza, envío de operaciones simuladas dinámicas, etc.
Pruebas funcionales : soapUI le permite realizar verificaciones funcionales contra web services, aplicaciones web y fuentes de datos JDBC. Puedes validar las respuestas de tus pruebasutilizando varias aserciones integradas y personalizadas. También le permite agregar pasos de prueba condicionales para controlar el flujo de ejecución de la prueba.
Pruebas de rendimiento : con solocon unos pocos clics, puede generar pruebas de rendimiento y carga rápidamente usando soapUI.
Automatización de pruebas : soapUI se puede integrar en marcos de prueba automatizados como JUnit, y las pruebas también se pueden iniciar a través de los marcos de compilación Apache Maven y Apache Ant. También se puede integrar en herramientas de integración continua como Hudson o Bamboo.
Además de las funciones anteriores, la versión propietaria de soapUI, soapUI Pro, brinda a los usuarios capacidades de prueba basadas en datos, grabación HTTP e informes de prueba que no están dentro del alcance de este libro.
  
## Instalación de la interfaz de usuario de jabón
Examinamos las funciones principales proporcionadas por soapUI y discutimos la herramienta en general. Es hora de explorar la instalación fácil y sencilla de soapUI en algunos de los sistemas operativos populares.

Requisitos del sistema
Para poder ejecutar soapUI, debe tener Java Development Kit ( JDK ) v1.6 ejecutándose en su sistema. Como soapUI se implementa en Java, se ejecuta en muchos sistemas operativos, incluidos Windows XP, Windows Vista, Windows 7, Windows Server 2003, Windows Server 2008, varias versiones de Linux como Ubuntu, Red Hat, Fedora, SuSE y CentOS, y Mac OS X v10.4 o superior.

Podemos resumir los requisitos del sistema para instalar y ejecutar soapUI de la siguiente manera:

Sistema operativo

versión Java

Memoria

Procesador

Espacio del disco

microsoft windows xp

microsoft windows vista

Servidor de Microsoft Windows 2003

y

Servidor de Microsoft Windows 2008

JDK v1.6.x

512 MB (mínimo)

1 GHz o superior, procesador de 32 o 64 bits

200 MB de espacio en disco duro (mínimo)

Linux:

ubuntu

sombrero rojo

Fedora

CentOS

y

SuSE

JDK v1.6.x

512 MB (mínimo)

1 GHz o superior, procesador de 32 o 64 bits

240 MB de espacio en disco duro (mínimo)

Mac OS:

Mac OS X v10.4 o superior

Mac OS X Server v10.4 o superior

JDK v1.6.x

512 MB (mínimo)

1 GHz o superior, procesador de 32 o 64 bits

140 MB de espacio en disco duro (mínimo)

Analicemos en detalle el procedimiento de instalación de soapUI en cada uno de los sistemas operativos anteriores.

Instalación de soapUI en Linux
soapUI se distribuye como dos instaladores diferentes para su conveniencia. Puede descargar el archivo binario (ZIP) del instalador o el script del instalador.

Primero, veremos el procedimiento de instalación del archivo binario. Realice los siguientes pasos:

Descargue la versión zip binaria de Linux (por ejemplo soapui-4.0.1-linux-bin.zip) de la última versión de soapUI de http://www.soapui.org .
Extraiga la distribución binaria descargada en un directorio de su sistema de archivos local, por ejemplo /home/user/soapui.
NOTA
Nos referiremos al directorio extraído como SOAPUI_HOME.

Vaya a SOAPUI_HOME/biny ejecute el soapui.shscript de inicio de la siguiente manera: ./soapui.sh. Esto iniciará la interfaz gráfica de usuario de soapUI.
CONSEJO
Si encuentra un error de Permiso denegado al ejecutar el soapui.shscript, asegúrese de cambiar el modo de permiso del archivo otorgando privilegios ejecutables al usuario ejecutandoel chmodcomando como chmod 755 soapui.sh.

También puede instalar soapUI utilizando el instalador de Linux realizando los siguientes pasos:

Descargue un instalador Linux de soapUI (por ejemplo soapUI-x32-4_0_1.sh) desde http://www.soapui.org .
Después de descargar el archivo, otorgue permisos ejecutables ejecutando el comando, chmod 755 soapUI-x32-4_0_1.sh.
Ejecute el instalador de la siguiente manera: ./soapUI-x32-4_0_1.sh.
Esto iniciará la interfaz de usuario del instalador como se muestra en la siguiente captura de pantalla:

Ahora, puede continuar con el asistente de instalación. Se le pedirá que acepte el contrato de licencia en el siguiente paso del asistente. Simplemente haga clic en la opción Acepto el acuerdo y haga clic en Siguiente . Se le pedirá que especifique un directorio de destino para la instalación de soapUI.

En el siguiente paso del asistente de instalación, puede seleccionar qué componentes necesita incluir en soapUI, como; Hermes JMS, archivos fuente de soapUI y tutoriales. Simplemente acepte todas las opciones y haga clic en Siguiente . Se le solicitará el acuerdo de licencia para los componentes de Hermes en el siguiente paso. Acepte el acuerdo de licencia y haga clic en Siguiente para continuar con el asistente. Luego, se le pedirá que especifique un directorio para los tutoriales de soapUI. Ingrese una ubicación que esté en su sistema de archivos y haga clic en Siguiente . Se le pedirá un directorio donde se crean enlaces simbólicos de soapUI para ejecutables como el soapui.sharchivo. Introduzca un directorio y haga clic en Siguiente . Puede marcar la casilla de verificación Crear un icono de escritorio para crear un icono en el escritorio para que pueda iniciar fácilmente soapUI. Finalmente, haga clic en Siguientebotón para iniciar la instalación.

La pantalla de instalación de soapUI se verá como la siguiente captura de pantalla:


instalación de soapUI en Windows
Similar al procedimiento de instalación anterior en Linux, soapUI se puede instalar en un sistema operativo Windows usando Instalador de Windows o archivo binario de Windows.

Veamos los pasos de instalación del archivo binario de Windows. Son los siguientes:

Descargue la versión zip binaria de Windows (por ejemplo soapui-4.0.1-windows-bin.zip) de la última versión de soapUI de http://www.soapui.org .
Extraiga la distribución binaria descargada en un directorio de su sistema de archivos local, por ejemplo C:/soapui.
NOTA
Nos referiremos al directorio extraído como SOAPUI_HOME. Esto iniciará la interfaz gráfica de usuario de soapUI.

Vaya SOAPUI_HOME/biny ejecute el soapui.batscript de inicio ejecutando el comando: soapui.bat.
Los pasos para la instalación de soapUI usando el El instalador de Windows son casi los mismos que los pasos dados en el instalador de Linux. Solo necesita hacer doble clic en el instalador ( soapUI-x32-4_0_1.exe) y se iniciará el asistente de instalación de soapUI.

Instalación de soapUI en MacOS
La instalación de soapUI en Mac OS es sencillo y similar a los pasos anteriores que describimos para los instaladores de Linux y Windows.
  
## Un vistazo a la interfaz de usuario de soapUI
soapUI es una herramienta de prueba que se explica por sí misma. La interfaz de usuario fácil de usar simplifica el trabajo con soapUI para cualquier tipo de usuario. Con unos pocos clics, puede comenzar a probar un servicio web o una aplicación web con el mínimo esfuerzo.Esta interfaz de usuario altamente usable y flexible ayudó a soapUI a convertirse en la herramienta de prueba de SOA y web services más fácil de usar y más fácil entre la comunidad de prueba.

Una vez que se inicie soapUI, se le mostrará la interfaz de usuario de inicio como se muestra en la siguiente captura de pantalla:

Un vistazo a la interfaz de usuario de soapUI
En soapUI, todas las pruebas están organizadas bajo un elemento central, conocido como Proyectos . Simplemente haciendo clic derecho en el nodo Proyectos en el panel lateral izquierdo en la GUI de soapUI, se puede crear un nuevo proyecto de soapUI como se muestra en la siguiente captura de pantalla:

Un vistazo a la interfaz de usuario de soapUI
Dejaré que usted navegue por el resto de los elementos de la interfaz de usuario por su cuenta antes de comenzar con los proyectos de muestra. Encontrarás un montón demateriales en el sitio web oficial de soapUI relacionados con estas características. Exploraremos a través de la interfaz de usuario de soapUI a medida que avancemos a través de las demostraciones y ejemplos en el resto de los capítulos.
  
  
## Resumen
  
Los web services son las unidades individuales de lógica empresarial en SOA. Para probar los web services, debemos poseer un buen conocimiento sobre SOA y los web services, así como los componentes tecnológicos asociados. Este capítulo se ha dedicado a construir esa base.

Comenzamos a buscar en soapUI, la herramienta de prueba de web services y SOA líder y más completa del mundo. Discutimos las metas y objetivos principales del uso de soapUI en las pruebas de web services. Analizamos un poco la historia de soapUI y sus modelos de distribución. Finalmente, se explicaron los pasos para instalar soapUI en Linux, Windows y Mac OS.

Ahora, tenemos SOAPUI ejecutándose en nuestros sistemas. Ensuciémonos las manos con un proyecto de muestra en el próximo capítulo.
  
  
