# Capítulo 1. Pruebas de servicios web y soapUI
Los servicios web son una de las clavesbloques de construcción de soluciones orientadas a servicios. Debido a su uso e importancia en las aplicaciones empresariales, se espera que los equipos de proyecto estén bien informados y familiarizados con las tecnologías asociadas con los servicios web y la arquitectura orientada a servicios ( SOA ). El aspecto de prueba de los servicios web en particular es uno de los temas clave que debe discutirse cuando se trabaja con servicios web.

Las pruebas de servicios web se pueden realizar utilizando muchos enfoques. Las API de cliente incluidas en marcos de servicios web como Apache Axis2 se pueden usar para invocar servicios web mediante programación. Además de eso, hay varias herramientas de propiedad y de código abierto disponibles para probar los servicios web automáticamente. soapUI es una de esas herramientas de prueba gratuitas y de código abierto que admite evaluaciones funcionales y no funcionales de servicios web.

Discutiremos los siguientes temas en este capítulo que le proporcionarán una introducción a los conceptos básicos de SOA, pruebas de servicios web y soapUI:

Descripción general de algunas de las características clave de los servicios web
El papel de los servicios web en SOA
Enfoques de prueba de servicios web
Desafíos de prueba de servicios web
Introducción a la interfaz de usuario de jabón
Instalación de la interfaz de usuario de jabón
SOA y servicios web
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

Como primer paso, se construyeron muchos servicios de envoltura (servicios web que encapsulan la lógica de diferentes módulos de procesamiento de seguros), exponiéndolos como servicios web. Por lo tanto, los módulos individuales pudieron comunicarse entre sí con preocupaciones mínimas de integración.Al adoptar SOA, sus aplicaciones usaban un lenguaje común, XML, en la transmisión de mensajes y, por lo tanto, sistemas heterogéneos como el sistema de manejo de pólizas de seguro basado en .NET en Smith and Co. pudo comunicarse con las aplicaciones basadas en Java que se ejecutan en InsurePlus Inc.

Al implementar una solución orientada al servicio, el sistema de Smith and Co. pudo fusionarse con muchos otros sistemas heredados con una sobrecarga de integración mínima.

Bloques de construcción de SOA
Al estudiar soluciones típicas orientadas a servicios,Podemos identificar tres bloques de construcción principales de la siguiente manera:

servicios web
Mediación
Composición
servicios web
Los servicios web son las unidades individuales de lógica empresarial en SOA. Los servicios web se comunican entre sí y con otros programas o aplicaciones mediante el envío de mensajes. Los servicios web consisten en una interfaz pública definición que es una pieza central de información que asigna una identidad al servicio y permite su invocación.

El contenedor de servicios es el componente de middleware SOA donde se aloja el servicio web para que las aplicaciones que lo consumen interactúen con él. Permite a los desarrolladores crear, implementar y administrar servicios web y también representa la función del procesador del lado del servidor en los marcos de servicios web. Una lista de usos comunesLos marcos de servicios web se pueden encontrar en http://en.wikipedia.org/wiki/List_of_web_service_frameworks ; aquí puede encontrar algunos middleware de servicios web populares como Windows Communication Foundation ( WCF ), Apache CXF, Apache Axis2, etc. Usaremos Apache Axis2 como contenedor de servicios para proyectos de muestra dentro del contexto de este libro. Apache Axis2 se puede encontrar en http://axis.apache.org/ .

El contenedor de servicios contiene la lógica empresarial , que interactúa con el consumidor del servicio a través de una interfaz de servicio .Esto se muestra en el siguiente diagrama:


Mediación
Por lo general, la transmisión de mensajes entre nodos en una solución orientada a servicios no solo ocurre a través de los típicos canales punto a punto. En cambio, una vez que se recibe un mensaje, puede fluir a través de múltiples intermediarios y someterse a diversas transformaciones y conversiones según sea necesario. Este comportamiento se conoce comúnmente como mediación de mensajes.y es otro bloque de construcción importante en soluciones orientadas a servicios. Similar a cómo se utiliza el contenedor de servicios como plataforma de alojamiento para servicios web,un intermediario es el componente de middleware SOA correspondiente para la mediación de mensajes. Por lo general, bus de servicio empresarial ( ESB )actúa como intermediario en soluciones orientadas a servicios.

Composición
En las soluciones orientadas a servicios, no podemos esperar que los servicios web individuales se ejecuten solos para proporcionar la funcionalidad empresarial deseada. En cambio, múltiples servicios web trabajan juntos y participan en varias composiciones de servicios. Por lo general, los servicios web se reúnen dinámicamente en el tiempo de ejecución según las reglas especificadas en las definiciones de procesos comerciales. La gestión o coordinación de estos procesos de negocio se rigen por el coordinador de procesos , que es el componente de middleware SOA asociado a las composiciones de servicios web.

Examinamos los componentes básicos principales de las soluciones orientadas a servicios y los componentes de middleware SOA correspondientes. A continuación, vamos a discutir algunos de los elementos distinguidos asociados específicamente con los servicios web.Estos son mensajería SOAP, lenguaje de descripción de servicios web ( WSDL ), patrones de intercambio de mensajes y servicios RESTful.Capítulo 1. Pruebas de servicios web y soapUI
Los servicios web son una de las clavesbloques de construcción de soluciones orientadas a servicios. Debido a su uso e importancia en las aplicaciones empresariales, se espera que los equipos de proyecto estén bien informados y familiarizados con las tecnologías asociadas con los servicios web y la arquitectura orientada a servicios ( SOA ). El aspecto de prueba de los servicios web en particular es uno de los temas clave que debe discutirse cuando se trabaja con servicios web.

Las pruebas de servicios web se pueden realizar utilizando muchos enfoques. Las API de cliente incluidas en marcos de servicios web como Apache Axis2 se pueden usar para invocar servicios web mediante programación. Además de eso, hay varias herramientas de propiedad y de código abierto disponibles para probar los servicios web automáticamente. soapUI es una de esas herramientas de prueba gratuitas y de código abierto que admite evaluaciones funcionales y no funcionales de servicios web.

Discutiremos los siguientes temas en este capítulo que le proporcionarán una introducción a los conceptos básicos de SOA, pruebas de servicios web y soapUI:

Descripción general de algunas de las características clave de los servicios web
El papel de los servicios web en SOA
Enfoques de prueba de servicios web
Desafíos de prueba de servicios web
Introducción a la interfaz de usuario de jabón
Instalación de la interfaz de usuario de jabón
SOA y servicios web
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

Como primer paso, se construyeron muchos servicios de envoltura (servicios web que encapsulan la lógica de diferentes módulos de procesamiento de seguros), exponiéndolos como servicios web. Por lo tanto, los módulos individuales pudieron comunicarse entre sí con preocupaciones mínimas de integración.Al adoptar SOA, sus aplicaciones usaban un lenguaje común, XML, en la transmisión de mensajes y, por lo tanto, sistemas heterogéneos como el sistema de manejo de pólizas de seguro basado en .NET en Smith and Co. pudo comunicarse con las aplicaciones basadas en Java que se ejecutan en InsurePlus Inc.

Al implementar una solución orientada al servicio, el sistema de Smith and Co. pudo fusionarse con muchos otros sistemas heredados con una sobrecarga de integración mínima.

Bloques de construcción de SOA
Al estudiar soluciones típicas orientadas a servicios,Podemos identificar tres bloques de construcción principales de la siguiente manera:

servicios web
Mediación
Composición
servicios web
Los servicios web son las unidades individuales de lógica empresarial en SOA. Los servicios web se comunican entre sí y con otros programas o aplicaciones mediante el envío de mensajes. Los servicios web consisten en una interfaz pública definición que es una pieza central de información que asigna una identidad al servicio y permite su invocación.

El contenedor de servicios es el componente de middleware SOA donde se aloja el servicio web para que las aplicaciones que lo consumen interactúen con él. Permite a los desarrolladores crear, implementar y administrar servicios web y también representa la función del procesador del lado del servidor en los marcos de servicios web. Una lista de usos comunesLos marcos de servicios web se pueden encontrar en http://en.wikipedia.org/wiki/List_of_web_service_frameworks ; aquí puede encontrar algunos middleware de servicios web populares como Windows Communication Foundation ( WCF ), Apache CXF, Apache Axis2, etc. Usaremos Apache Axis2 como contenedor de servicios para proyectos de muestra dentro del contexto de este libro. Apache Axis2 se puede encontrar en http://axis.apache.org/ .

El contenedor de servicios contiene la lógica empresarial , que interactúa con el consumidor del servicio a través de una interfaz de servicio .Esto se muestra en el siguiente diagrama:


Mediación
Por lo general, la transmisión de mensajes entre nodos en una solución orientada a servicios no solo ocurre a través de los típicos canales punto a punto. En cambio, una vez que se recibe un mensaje, puede fluir a través de múltiples intermediarios y someterse a diversas transformaciones y conversiones según sea necesario. Este comportamiento se conoce comúnmente como mediación de mensajes.y es otro bloque de construcción importante en soluciones orientadas a servicios. Similar a cómo se utiliza el contenedor de servicios como plataforma de alojamiento para servicios web,un intermediario es el componente de middleware SOA correspondiente para la mediación de mensajes. Por lo general, bus de servicio empresarial ( ESB )actúa como intermediario en soluciones orientadas a servicios.

Composición
En las soluciones orientadas a servicios, no podemos esperar que los servicios web individuales se ejecuten solos para proporcionar la funcionalidad empresarial deseada. En cambio, múltiples servicios web trabajan juntos y participan en varias composiciones de servicios. Por lo general, los servicios web se reúnen dinámicamente en el tiempo de ejecución según las reglas especificadas en las definiciones de procesos comerciales. La gestión o coordinación de estos procesos de negocio se rigen por el coordinador de procesos , que es el componente de middleware SOA asociado a las composiciones de servicios web.

Examinamos los componentes básicos principales de las soluciones orientadas a servicios y los componentes de middleware SOA correspondientes. A continuación, vamos a discutir algunos de los elementos distinguidos asociados específicamente con los servicios web.Estos son mensajería SOAP, lenguaje de descripción de servicios web ( WSDL ), patrones de intercambio de mensajes y servicios RESTful.
