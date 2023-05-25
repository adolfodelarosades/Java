# Introducción

Los servicios web están cambiando la forma en que pensamos acerca de los sistemas de software distribuido, pero hay un límite en lo que pueden hacer. Este libro describe las principales tecnologías habilitadoras ( **WSDL**, **SOAP** y **UDDI**) e identifica dónde comienzan y terminan los servicios web y dónde toman el relevo las tecnologías existentes.

Este libro describe los conceptos detrás de las tecnologías de servicios web básicos y también incluye capítulos sobre **ebXML**, tecnologías de servicios web adicionales e implementaciones de productos. El libro está dirigido a profesionales DE TI interesados ​​en comprender los servicios web, cómo funcionan y para qué sirven.

## Acerca de los servicios web

Los servicios web proporcionan una capa de abstracción por encima de los sistemas de software existentes, como servidores de aplicaciones, **CORBA**, servidores .NET, mensajería y aplicaciones empaquetadas. Los servicios web funcionan a un nivel de abstracción similar al de Internet y son capaces de unir cualquier sistema operativo, plataforma de hardware o lenguaje de programación, tal como lo hace la Web.

A diferencia de los sistemas informáticos distribuidos existentes, los servicios web se adaptan a la web. El protocolo de red predeterminado es **HTTP**. La mayoría de las tecnologías de computación distribuida existentes incluyen el protocolo de comunicaciones como parte de su alcance. Con los servicios web, el protocolo de comunicaciones ya está allí, en la web mundial y remota.

Las nuevas aplicaciones se vuelven posibles cuando todo está habilitado para servicios web. Una vez que el mundo esté habilitado para los servicios web, surgirán todo tipo de nuevos paradigmas comerciales, grupos de discusión, foros interactivos y modelos de publicación para aprovechar esta nueva capacidad.

Los proveedores de software y hardware por igual están lanzando productos de servicios Web al mercado. La adopción generalizada de los estándares básicos representa un avance significativo en la industria. Las aplicaciones realmente se pueden construir usando una combinación de componentes de múltiples proveedores. Están surgiendo especialistas para brindar servicios en las áreas de seguridad, coordinación de transacciones, procesamiento de facturas, traducción de idiomas, transformación de documentos, registros y repositorios, contabilidad, informes y cálculo especializado. Las aplicaciones que se crean en cualquier lugar, en cualquier momento y en cualquier sistema pueden aprovechar los componentes prediseñados, lo que acelera el tiempo de comercialización y reduce los costos.

Mientras tanto, **ebXML**, que fletó y mantiene un curso separado, continúa resolviendo problemas difíciles para los socios comerciales corporativos que están estableciendo sistemas automatizados de compra y facturación de la cadena de suministro, grandes transferencias de documentos electrónicos y comunidades comerciales que comparten objetivos comunes. El legítimo heredero de **EDI**, **ebXML** proporciona una alternativa más fácil de usar y de menor costo para las empresas que automatizan sus interacciones con otras empresas. Con **ebXML**, los sistemas IT internos de una empresa se conectan a los sistemas IT de sus socios comerciales, subcontratistas y colaboradores comerciales. Por lo tanto, el valor inherente a estos sistemas aumenta considerablemente, ya que se convierten esencialmente en parte de un gran SISTEMA IT, con información esencial que fluye libremente a través de los límites corporativos en lugar de quedarse atrapada dentro de ellos.

Existe una superposición considerable entre las tecnologías de servicios web centrales y **ebXML**. La convergencia entre los dos se basa en su adopción común de SOAP como transporte y en la capacidad de los respectivos registros para compartir datos. Las especificaciones de **ebXML** incluyen muchos requisitos de calidad de servicio que aún no están incluidos en los servicios web, como la integridad y el no repudio de los mensajes, la mensajería confiable, el flujo de procesos comerciales y la negociación de protocolos. Es posible una mayor convergencia a medida que las tecnologías de servicios web centrales comienzan a adoptar propuestas en estas áreas tecnológicas adicionales.

Sigue habiendo desacuerdo sobre el mejor enfoque para definir estas tecnologías adicionales en el contexto de los servicios web. Una vez que los estándares básicos se adoptan ampliamente, la discusión avanza para abordar los problemas de calidad de servicio. Se necesitan estándares de seguridad, transacciones, flujo de procesos y mensajería confiable, y algunos están más avanzados que otros.

El poder de **XML** impulsa las tecnologías de servicios web en general, ya sean los estándares básicos, las tecnologías adicionales o **ebXML**. **XML** finalmente resuelve el problema de la independencia de datos para lenguajes de programación, sistemas de middleware y sistemas de administración de bases de datos. Anteriormente, los tipos y estructuras de datos eran específicos de estos tipos de software, y los intentos de definiciones comunes, como **CORBA IDL**, obtuvieron una aceptación limitada. **XML** está en camino de consolidarse tanto como su hermano, **HTML**.

Todas las tecnologías de servicios web descritas en este libro se crean usando aplicaciones de **XML** de una forma u otra. **XML** no es una cosa, sino más bien una variedad de tecnologías en sí mismas, que abarcan datos de instancia, así como tipificación, estructura e información semántica asociada con los datos. **XML** no solo describe los datos de forma independiente, sino que también contiene información útil para mapear los datos dentro y fuera de cualquier sistema de software o lenguaje de programación.

Los servicios web ofrecen un potencial casi ilimitado. Cualquier programa se puede asignar a servicios web y los servicios web se pueden asignar a cualquier programa. La transformación de datos hacia y desde **XML** es esencial, pero **XML** es lo suficientemente flexible para adaptarse a cualquier tipo de datos y estructura e incluso para crear otros nuevos, si es necesario. Cuando todos los programas y sistemas de software estén finalmente habilitados para servicios web, el mundo de la computación distribuida será muy diferente de lo que es hoy.

## Sobre este libro

Para proporcionar antecedentes y detalles suficientes para la comprensión práctica y el uso de estas tecnologías, este libro está organizado en capítulos sobre los principales temas de interés.

### Capítulo 1, Introducción a los Servicios Web

Este capítulo destaca los aspectos más importantes de los servicios web y para qué se pueden utilizar, además de contener una descripción general detallada de todo el libro. Se proporciona información sobre lo siguiente:

* **XML (Extensible Markup Language - Lenguaje de marcado extensible)**, la familia de especificaciones relacionadas sobre las que se construyen todas las tecnologías de servicios web.

* **WSDL (Web Services Description Language - lenguaje de descripción de servicios web)**, que proporciona la abstracción fundamental y más importante de los servicios web, la interfaz expuesta a otros servicios web y a través de la cual los servicios web se asignan a los programas y sistemas de software subyacentes.

* **SOAP (Simple Object Access Protocol - Protocolo simple de acceso a objetos)**, que brinda capacidad de comunicación para que las interfaces de servicios web se comuniquen entre sí a través de Internet y otras redes.

* **UDDI (Universal Description, Discovery, and Integration - descripción, descubrimiento e integración universales)**, que proporciona servicios de registro y depósito para almacenar y recuperar interfaces de servicios web.

* **ebXML (electronic business XML - comercial electrónico XML)**, una arquitectura y un conjunto de especificaciones diseñadas para automatizar la interacción de procesos comerciales entre socios comerciales.

Tecnologías adicionales, que van más allá de los estándares básicos de los servicios web para cumplir con los requisitos de seguridad, mensajería confiable, procesamiento de transacciones y flujo de procesos comerciales para que las aplicaciones comerciales más complejas y críticas puedan usarlos.

Implementaciones de proveedores, que brindan una variedad de implementaciones generalmente alineadas con productos existentes pero, en algunos casos, productos completamente nuevos para servicios web flexibles y extensibles.

### Capítulo 2 , Descripción de la información: XML

El **Extensible Markup Language - Lenguaje de Marcado Extensible (XML)**, al igual que el **Hypertext Markup Language*(HTML)**, comparte un ancestro común en el **Standard Generalized Markup Language - lenguaje de marcado generalizado estándar (SGML)**. Una de las características de **SGML** fue la separación de formato y contenido. Si un documento se produjo para A4 o en formato de carta, por ejemplo, el formato se describió independientemente del contenido del documento. Por lo tanto, el mismo documento podría generarse en múltiples formatos sin cambiar el contenido. Este principio de lenguajes de marcado se aplica a los servicios web a través de la separación de la instancia del documento, que contiene los datos, y el esquema, que describe las estructuras y los tipos de datos, incluida la información semántica útil para asignar el documento a varios lenguajes de programación y sistemas de software.

**XML** representa una gran cantidad de especificaciones, muchas de las cuales son más pertinentes para el procesamiento de documentos que para el procesamiento de información. Este capítulo describe las especificaciones y tecnologías XML más importantes para los Web services, que en general se puede decir que van "MÁS ALLÁ DEL MARCADO" para proporcionar facilidades para estructurar y serializar datos. Este capítulo incluye solo aquellas tecnologías **XML** relevantes para los servicios web y explica cómo y qué son.

### Capítulo 3, Descripción de Web Services(Servicios Web): WSDL

El **Web Services Description Language - lenguaje de descripción de servicios web (WSDL)** proporciona el mecanismo a través del cual las definiciones de servicios web se exponen al mundo y que los implementadores de servicios web deben cumplir al enviar mensajes **SOAP**. **WSDL** describe los tipos y estructuras de datos para los servicios web, explica cómo asignar los tipos y estructuras de datos a los mensajes que se intercambian e incluye información que vincula los mensajes a las implementaciones subyacentes.

**WSDL** se define para que sus partes puedan desarrollarse por separado y combinarse para crear un archivo **WSDL** completo. Los tipos y estructuras de datos se pueden compartir entre varios mensajes, al igual que la definición de los servicios expuestos dentro de la interfaz. **WSDL** enumera las interfaces y, dentro de una interfaz, asocia cada servicio con una implementación subyacente.

Para lograr la comunicación de los Servicios Web, **WSDL** los mapea en protocolos de comunicación y transportes. Ambas partes en una interacción de Servicios Web comparten un archivo **WSDL** común. El ***remitente*** usa el archivo **WSDL** para generar el mensaje en el formato apropiado y usar el ***protocolo de comunicación*** apropiado. El ***receptor*** usa el archivo **WSDL** para comprender cómo recibir y analizar el mensaje y cómo asignarlo al objeto o programa subyacente.

### Capítulo 4, Acceso a Web Services(Servicios Web): SOAP

Una vez que se define una interfaz para ellos, los Servicios Web necesitan una forma de comunicarse entre sí e intercambiar mensajes. El **Simple Object Access Protocol - Protocolo simple de acceso a objetos (SOAP)** define un formato común para mensajes **XML** sobre **HTTP** y otros transportes. **SOAP** está diseñado para ser un mecanismo simple que se puede ampliar para abarcar características, funcionalidades y tecnologías adicionales.

Este capítulo describe las partes de **SOAP** y el propósito de cada una. **SOAP** ***es una tecnología de mensajería asíncrona unidireccional*** que se puede adaptar y utilizar en una variedad de estilos de interacción de paso de mensajes: orientado a **llamadas a procedimientos remotos (Remote Procedure Call RPC)**, orientado a documentos y publicación y suscripción, entre otros.

Si algo define el criterio mínimo para un Servicio Web, debe ser la adherencia a **SOAP**. La capacidad de mensajería **SOAP** es fundamental para los Servicios Web. **SOAP** se define en un nivel muy alto de abstracción y se puede asignar a cualquier cantidad de sistemas de software subyacentes, incluidos servidores de aplicaciones, servidores .NET, sistemas de middleware, sistemas de administración de bases de datos y aplicaciones empaquetadas.

El capítulo describe las partes obligatorias y opcionales de **SOAP**, explica cómo se procesan los mensajes **SOAP** y analiza el papel de los intermediarios en el procesamiento de mensajes **SOAP**. Se proporciona información básica sobre la especificación, así como ejemplos de las partes principales de **SOAP**. También se incluye una explicación de SOAP con archivos adjuntos.

### Capítulo 5 , Búsqueda de  Web Services(Servicios Web): UDDI Registry - Registro UDDI

La iniciativa para la **Universal Description, Discovery, and Interoperability - Descripción, el Descubrimiento y la Interoperabilidad Universales (UDDI)** produce especificaciones y una implementación activa de un repositorio para descripciones de Servicios Web. El registro **UDDI** se puede buscar utilizando varios criterios de categorización para obtener información de contacto de las empresas que ofrecen servicios de interés. **UDDI** proporciona un medio de acceso público para almacenar y recuperar información sobre interfaces e implementaciones de Servicios Web.

Este capítulo describe los formatos de datos de **UDDI** y las **API de SOAP** utilizadas para almacenar y recuperar información de **UDDI**. Este capítulo también brinda antecedentes sobre la organización **UDDI** que patrocina el registro físico y el proceso mediante el cual las especificaciones y tecnologías **UDDI** avanzan hacia la adopción.

La web necesita algo como **UDDI** para proporcionar un centro de intercambio de información de servicios web para que los editores y los consumidores puedan encontrarse. Solo entonces se puede realizar el verdadero valor de los Servicios Web: cuando los consumidores de Servicios Web pueden ubicar y comenzar a acceder fácil y rápidamente a las implementaciones de servicios web en cualquier parte del mundo.

### Capítulo 6 , Un enfoque alternativo: ebXML

La **electronic business XML (ebXML)** se inició casi al mismo tiempo que la comunidad de Servicios Web comenzó a crecer. Durante los primeros meses, **ebXML** fue un esfuerzo completamente separado y paralelo. Muchos de los objetivos de **ebXML** son comunes a los Servicios Web y muchas de las tecnologías se superponen en concepto. En general, sin embargo, **ebXML** se enfoca más en el nivel de computación industrial o empresarial, abordando como objetivo principal el tema de la definición de procesos comerciales.

Este capítulo explica los antecedentes, los objetivos y el origen de **ebXML** y cubre la arquitectura de **ebXML** en detalle. Las especificaciones individuales se describen y colocan en su contexto adecuado dentro de la arquitectura general.

La arquitectura **ebXML** incluye muchas de las mismas cosas que las tecnologías de Servicios Web principales, pero va más allá al definir los requisitos de calidad de servicio para mensajería confiable, seguridad y negociación con socios comerciales. Comenzando como un reemplazo de **EDI**, **ebXML** busca evitar algunos de los problemas con las implementaciones y la aceptación de **EDI**, especialmente en las empresas más pequeñas.

### Capítulo 7 , Arquitectura de Web Services(Servicios Web): Tecnologías Adicionales

Una vez que se implementan y adoptan las principales tecnologías de Servicios Web, se necesita toda una gama de tecnologías adicionales para permitir que los Wervicios Web aborden los requisitos de aplicaciones complejas y críticas. Las empresas deberán proteger sus Servicios Web contra el uso no autorizado, para garantizar que sus mensajes **SOAP** lleguen a los destinos previstos y se procesen de manera confiable, y para definir y ejecutar flujos de procesos comerciales automatizados de acuerdo con un mecanismo estándar.

Este capítulo describe estas y otras tecnologías en el contexto de las iniciativas del proveedor y la industria en las que es probable que progresen hacia la adopción. En algunos casos, las propuestas en competencia compiten por la adopción y se discuten los principales candidatos. El capítulo también incluye descripciones de dos tecnologías en las que se basan muchos conceptos de Servicios Web: **RosettaNet** y **XML** - **RPC**.

### Capítulo 8 , Implementación de Web Services(Servicios Web)

Las especificaciones y tecnologías de los Servicios Web no son significativas ni particularmente útiles sin implementaciones en productos de proveedores de software. Este capítulo resume los principales enfoques arquitectónicos para la implementación de Servicios Web, describe las principales comunidades de desarrollo de **.NET** y **J2EE** y presenta información proporcionada por **BEA Systems**, **Cape Clear**, **IBM**, **IONA**, **Microsoft**, **Hewlett-Packard**, **Oracle**, **Sun Microsystems** y **Systinet** sobre su oferta actual de productos y su visión del futuro.

Algunos proveedores tienden a ver las implementaciones de Servicios Web principalmente dentro del contexto de sus productos existentes, como clientes o adaptadores adicionales dentro y fuera de los servidores de aplicaciones existentes, sistemas de gestión de bases de datos y sistemas de middleware. Otros proveedores buscan explotar el valor de la capa de Servicios Web en sí, donde se relacionan e integran múltiples dominios de sistemas de software dispares. Otros proveedores ofrecen productos en múltiples categorías, incluidos algunos destinados únicamente a proporcionar una implementación de estándares de Servicios Web, así como algunos destinados a exponer las interfaces de Servicios Web a productos existentes.

Aunque los proveedores tienden a estar de acuerdo con la adopción y la implementación generalizada de los estándares básicos, existe muy poco acuerdo, si es que existe alguno, en el siguiente nivel; es decir, lo que debería venir después. La seguridad, las transacciones, el flujo de procesos y la mensajería confiable son parte de los planes de varios proveedores, pero en órdenes y niveles de importancia algo diferentes.
