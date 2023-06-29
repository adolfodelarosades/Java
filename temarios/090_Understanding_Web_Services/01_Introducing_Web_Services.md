# Capítulo 1. Introducción a los Web Services

Al igual que el efecto del transporte ferroviario en los sistemas económicos nacionales, los web services están cambiando fundamentalmente las reglas del comercio web. Conectan programas entre sí a través de puntos distantes en el mapa global, transportando grandes cantidades de datos de manera más eficiente y económica que nunca. El resultado es una comunicación más rápida, mejor y más productiva tanto para las empresas como para los consumidores.

<hr>

**NOTA**

Los web services lo están cambiando todo

<hr>   

La Web comenzó apoyando las interacciones humanas con datos de texto y gráficos. La gente usa Internet todos los días para buscar cotizaciones de acciones, comprar bienes de consumo y leer las últimas noticias. Este nivel de interacción está bien para muchos propósitos. Pero la Web esencialmente basada en texto no admite muy bien las interacciones de software, especialmente las transferencias de grandes cantidades de datos. Se necesita un método más eficiente que permita que las aplicaciones interactúen directamente entre sí, ejecutando automáticamente instrucciones que, de lo contrario, tendrían que ingresarse manualmente a través de un navegador.

Las personas y las empresas que hacen negocios en la web necesitan una forma de publicar enlaces a sus aplicaciones y datos, de la misma manera que publican enlaces a sus páginas web. Las aplicaciones basadas en Internet deben poder encontrar, acceder e interactuar automáticamente con otras aplicaciones basadas en Internet. Los web services mejoran el uso de Internet al permitir la comunicación entre programas. A través de la adopción generalizada de los web services, las aplicaciones en varias ubicaciones de Internet pueden integrarse e interconectarse directamente como si fueran parte de un solo gran sistema DE TI (Tecnología de la Información).

<hr> 

**NOTA**

La Web actual no soporta muy bien las interacciones orientadas al software

<hr>    

## Los Fundamentos de los Web Services

Los web services son aplicaciones de **Extensible Markup Language (XML)** asignadas a programas, objetos o bases de datos o funciones comerciales integrales. Utilizando un documento XML creado en forma de mensaje, un programa envía una solicitud a un servicio web a través de la red y, opcionalmente, recibe una respuesta, también en forma de documento XML . Los estándares de web services definen el formato del mensaje, especifican la interfaz a la que se envía un mensaje, describen convenciones para mapear el contenido del mensaje dentro y fuera de los programas que implementan el servicio y definen mecanismos para publicar y descubrir interfaces de web services.

<hr>

**NOTA**

Los web services transforman documentos XML dentro y fuera de los sistemas IT

<hr>

Esta tecnología se puede utilizar de muchas maneras. Los web services pueden ejecutarse en clientes de escritorio y portátiles para acceder a aplicaciones de Internet tales como sistemas de reservas y sistemas de seguimiento de pedidos. Los web services también se pueden utilizar para la integración de empresa a empresa (B2B), conectando aplicaciones ejecutadas por varias organizaciones en la misma cadena de suministro. Los web services también pueden resolver el problema más amplio de la integración de aplicaciones empresariales - enterprise application integration (EAI), conectando múltiples aplicaciones de una sola organización a múltiples otras aplicaciones tanto dentro como fuera del firewall. En todos estos casos, las tecnologías de los web services proporcionan el pegamento estándar que conecta diversas piezas de software.

<hr>

**NOTA**

Los web services se pueden utilizar en muchas aplicaciones

<hr>

Como se ilustra en la Figura 1-1 , los web services envuelven, presentando a la red una forma estándar de interactuar con los sistemas de software de back-end, como los sistemas de administración de bases de datos, .NET, J2EE (Java2 Platform, Enterprise Edition) o CORBA (Common Object Request Broker Architecture), objetos, adaptadores a paquetes de planificación de recursos empresariales - enterprise resource planning ( ERP ), intermediarios de integración y otros. Las interfaces de web services reciben un mensaje XML estándar del entorno de red, transforman el XML data en un formato comprensible para un sistema de software back-end particular y, opcionalmente, devolver un mensaje de respuesta. Las implementaciones de software subyacentes de los web services se pueden crear utilizando cualquier lenguaje de programación, sistema operativo o sistema de software intermedio.

**Figura 1-1. Interfaz de web services con sistemas back-end.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e56fc159-2744-4674-bbe0-6502423eabdb)


Los web services combinan las características de ejecución de las aplicaciones programáticas con las características de abstracción de Internet. Las tecnologías de Internet actuales tienen éxito en parte porque están definidas en un nivel de abstracción lo suficientemente alto como para permitir la compatibilidad con cualquier sistema operativo, hardware o software. La infraestructura de Internet basada en web services explota este nivel de abstracción e incluye información semántica asociada con los datos. Es decir, los web services definen no solo los datos, sino también cómo procesarlos y mapearlos dentro y fuera de las aplicaciones de software subyacentes.

<hr>

**NOTA**

Los web services combinan programación y conceptos web

<hr> 

### Un ejemplo simple: Búsqueda de Información

Hoy en día, la mayoría de los servicios se invocan a través de la Web ingresando datos en formularios de **HyperText Markup Language (HTML)** y enviando los datos al servicio, incrustados(embedded) dentro de una cadena de **Uniform Resource Locator (URL)**:

```sh
http://www.google.com/search?q=Skate+boots&btnG=Google+Search
```

Este ejemplo ilustra cómo se accede a través de la Web a interacciones web sencillas, como una búsqueda, una compra de acciones o una solicitud de indicaciones para llegar en automóvil, incorporando parámetros y palabras clave en una URL. En este ejemplo, ingresar una solicitud de búsqueda simple **`Skate boots`** en el motor de búsqueda de Google da como resultado la URL que se muestra. La palabra clave **`search`** representa el servicio que se solicita a través de la Web, mientras que las palabras clave **`Skate+boots`** representan la cadena de búsqueda ingresada en el formulario HTML que muestra el sitio web de Google. Luego, el servicio de búsqueda de Google pasa la solicitud a una serie de otros motores de búsqueda, que devuelven listas de URL a páginas con texto que coincide con las palabras clave de búsqueda **`Skate+boots`**. Esta forma ineficiente de buscar en la Web depende completamente de hacer coincidir las cadenas de texto dadas con las páginas HTML catalogadas .

XML proporciona muchas ventajas para la transmisión de datos a través de Internet. Ahora, la solicitud anterior puede estar contenida en un documento XML en su lugar:

```xml
<SOAP-ENV:Body>
  <s:SearchRequest
  xmlns:s="www.xmlbus.com/SearchService">
    <p1>Skate</p1>
    <p2>boots</p2>
    <p3>size 7.5</p3>
  </s:SearchRequest>
</SOAP-ENV:Body>
```

<hr>

**NOTA**

XML es una mejor manera de enviar datos

<hr>

El envío de la solicitud dentro de un documento XML tiene muchas ventajas, como una estructura y un tipo de datos mejorados, una mayor flexibilidad y extensibilidad. XML puede representar datos estructurados y escritos (el campo **`size`** se puede escribir como una cadena decimal o como un punto flotante, por ejemplo) y puede contener una mayor cantidad de información de la que es posible dentro de una URL string.

<hr>

**NOTA**

Los web services utilizan documentos XML

<hr>

Este ejemplo se muestra en forma de un **Simple Object Access Protocol (SOAP)**, una forma estándar de mensajería XML y una de las principales tecnologías habilitadoras en la base de los Web services (consulte el Capítulo 4 ). En los mensajes SOAP, el nombre de la solicitud de servicio y los parámetros de entrada toman la forma de elementos XML. El ejemplo también ilustra el uso de espacios de nombres XML ( **`xmlns:`** ), otro elemento fundamental de los Web services (consulte el Capítulo 2 ). Dado que los documentos XML admiten tipos de datos, estructuras complejas y la asociación de XML schemas, la tecnología moderna de Web services proporciona ventajas significativas sobre las capacidades URL y HTML existentes para acceder a las aplicaciones de software.

## La Próxima Generación de la Web

<hr>

**NOTA**

La próxima generación de la Web se basará en interacciones orientadas al software
   
<hr>

Los web services están destinados a poner la vasta red global de la Web, establecida para la interacción humana, con un propósito completamente nuevo. Las interacciones orientadas al software realizarán automáticamente operaciones que antes requerían intervención manual, como

* Buscar y comprar bienes y servicios al mejor precio
* Coordinación de boletos de viaje y mesas de restaurante para una fecha determinada
* Optimización de las operaciones comerciales de adquisición, facturación y envío

La próxima generación de la Web utilizará servicios orientados al software para interoperar directamente con aplicaciones construidas utilizando cualquier combinación de objetos, programas y bases de datos.

Pero los Web services no son solo interfaces para objetos, programas, middleware y bases de datos para acceder a través de Internet. Al combinar una serie de Web services en una interacción más amplia, los Web services también proporcionan los medios para realizar nuevos tipos de interacciones.

Suponga, por ejemplo, que vive en San Francisco y desea reservar una mesa en su restaurante favorito de París y luego hacer los arreglos de viaje necesarios para estar allí a la hora acordada. Hoy, tendrías que llamar directamente al restaurante para obtener la reserva, teniendo en cuenta la diferencia horaria de 9 horas y la diferencia de idioma, y ​​luego llamar a un agente de viajes para encontrar un vuelo compatible y un hotel. Pero al utilizar los Web services, puede programar la cena con el calendario de su asistente digital personal ( PDA ) y hacer clic en un botón para reservar automáticamente una mesa en un momento conveniente. Una vez realizada la reserva, el Web service podría iniciar otros servicios que reservarían un vuelo barato y reservarían una habitación en un hotel de cuatro estrellas cercano.

<hr>

**NOTA**

Los Web services permiten nuevos tipos de interacciones

<hr>

La figura 1-2 muestra cómo los Web services pueden interactuar con una PDA conectada a un procesador de Web services inalámbrico para hacer una reserva en un restaurante favorito, utilizando el Web service del restaurante. [1] El procesador de Web services acepta solicitudes de la función de calendario de la PDA y descubre Web services relacionados con funciones de calendario extendidas, como reservar una mesa en un restaurante. Después de reservar con éxito una mesa, el procesador de Web services se pone en contacto con los Web services para reservas de hoteles y vuelos para completar la acción de programación solicitada.


**Figura 1-2. Las aplicaciones pueden usar los Web services para reservar una mesa en un restaurante y hacer reservas de hotel y vuelos.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/06db97f1-ddf5-4b05-900d-81f46393b7df)


Los Web service también son muy útiles para descubrir e interactuar con sitios de Internet que proporcionan sistemas de ingreso de pedidos en línea, como el de las botas de skate de moda de Skateboots Company, una bota con un patín de hielo retráctil incorporado, como las que usaron Batman y Robin en la película Batman y Robin. Los minoristas de artículos deportivos interesados ​​en almacenar las botas, el artículo nuevo de moda de este año, pueden usar los Web services para realizar pedidos anticipados al por mayor en lote, verificar el estado de un pedido o realizar pedidos de reabastecimiento durante la temporada y ser notificados de inmediato de los pedidos pendientes, si el fabricante no tiene stock. Los componentes básicos de los Web services proporcionan componentes estándar de la aplicación para Skateboots Company, que no es lo suficientemente grande como para albergar toda su propia infraestructura de aplicaciones. Las empresas de alojamiento de Web services brindan servicios de seguridad para garantizar que Skateboots acepte pedidos solo de minoristas aprobados y para brindar servicios de validación de crédito para aprobar pedidos anticipados masivos. Otras empresas ayudan a Skateboots proporcionando servicios de contabilidad y recaudación electrónica de fondos.

<hr>

**NOTA**

Los Web services se descubren e interactúan entre sí

<hr>

Todo el sistema de entrada de pedidos de Skateboots está expuesto a Internet como un Web service, pero detrás del Web service de nivel superior hay una serie de otros Web services que trabajan juntos para proporcionar la funcionalidad necesaria. La figura 1-3 ilustra cómo los Web services pueden cambiar la forma en que se construyen y utilizan las aplicaciones comerciales. El minorista interesado en almacenar botas de skate ingresa una solicitud a su servicio de administración de inventario local, que está expuesto a las computadoras de la tienda como un Web service. Luego, el servicio de inventario local se comunica con el Web service del fabricante a través de Internet y envía el pedido de la cantidad correcta de botas de skate, según el espacio disponible en los estantes y los tamaños más populares.


**Figura 1-3. El servicio de entrada de pedidos de Skateboots comprende varios otros Web services.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/978811fe-f0b5-4d11-a5a0-fad7b403b49c)

El sistema de entrada de pedidos de Skateboots Company comprende múltiples Web services, incluida una parte personalizada que se ocupa de los aspectos únicos de su producto y varias partes de productos básicos que se encargan de las funciones estándar, como la autenticación del usuario, la autorización de crédito y la contabilidad y facturación, todo ello alojado por otras empresas especializadas en la prestación de dichos servicios a través de Internet.

La creación de aplicaciones empresariales utilizando Web services implica poner en relación adecuada una serie de otros Web services, que se pueden implementar mediante el uso de cualquier combinación de lenguaje de programación, sistema operativo o software empaquetado, dentro o fuera del firewall. (Esta es también la forma en que los Web services resuelven el difícil problema de EAI ). Al establecer la relación adecuada, o el flujo, de los Web services relacionados, también automatiza los procesos y procedimientos comerciales correspondientes.

A través de la adopción generalizada de los Web services, Internet se está volviendo más eficiente, especialmente para las interacciones comerciales. En la próxima generación de la Web, los componentes básicos de los Web services permitirán interacciones automáticas en Internet, combinando el acceso directo a aplicaciones de software y documentos comerciales, pasando por alto las páginas Web familiares basadas en texto para acceder directamente a datos basados ​​en software. Además, es muy probable que los componentes básicos de los servicios web fundamentales sean alojados y publicados por una variedad de empresas que se centren en un componente funcional específico, como la autenticación, la coordinación transaccional o la contabilidad y la facturación. Este cambio a la interacción directa de aplicación a aplicación a través de la Web se encuentra en el corazón de los servicios Web, lo que significan y cómo funcionan.

<hr>

**NOTA**

Los Web services crean mayores eficiencias comerciales

<hr>

#### HACIA UN ENTENDIMIENTO COMÚN

La tecnología de Web services existe en un nivel de abstracción lo suficientemente alto como para admitir múltiples definiciones simultáneas, que a veces son contradictorias. En el nivel más simple, los Web services se pueden considerar como adaptadores de integración basados ​​en texto y orientados a Internet. Cualquier dato se puede mapear dentro y fuera del texto ASCII, y este tipo de mapeo ha sido durante mucho tiempo el mínimo común denominador para los sistemas de visualización gráfica y los sistemas de administración de bases de datos. Si todo lo demás falla, dice el refrán, asigne los datos a texto. Los sistemas basados ​​en texto también están detrás del éxito de la World Wide Web, en la que se basa la abstracción adicional de los Web services. Cualquier computadora o sistema operativo es capaz de soportar HTMLy servidores web y navegadores, y cuando descargan archivos, no les importa o ni siquiera saben con qué tipo de sistemas de back-end están interactuando.

Lo mismo es cierto para los Web services, lo que a menudo genera mucha confusión cuando los desarrolladores de entornos informáticos tradicionales o establecidos intentan comprender la tecnología de Web services en referencia a un solo tipo de sistema de software distribuido, como CORBA, J2EE o .NET. Debido a que los Web services son mucho más abstractos, más como adaptadores que como interfaces, pasará algún tiempo antes de que la industria establezca definiciones y convenciones verdaderamente comunes para ellos.

## Interactuar con Web Services

El nivel de abstracción en el que operan los Web services abarca estilos de interacción tales como emulación RPC (llamada a procedimiento remoto), mensajería asíncrona, mensajería unidireccional, difusión y publicación/suscripción. La mayoría de los principales sistemas de administración de bases de datos, como Oracle, SQL Server y DB2, admiten servicios de análisis y transformación DE XML, lo que permite la interacción directa entro los Web services y los sistemas de administración de base de datos. Los proveedores de middleware también suelen proporcionar una asignación de Web services a sus sistemas de software, como servidores de aplicaciones y agentes de integración. Para el usuario, por lo tanto, las interacciones con los Web services pueden aparecer como interacciones por lotes o en línea, que admiten patrones de comunicación sincrónicos o asincrónicos, y como interfaces de usuario escritas con programas Java, programas VB (Visual Basic), aplicaciones de oficina, navegadores o clientes pesados ​​para sistemas de administración de bases de datos, por nombrar algunos, y pueden asignarse a cualquier tipo de sistema de software subyacente.

<hr>

**NOTA**

Los Web services admiten múltiples paradigmas de mensajería

<hr>

Los estándares y tecnologías de Web services generalmente abarcan dos tipos principales de patrones de interacción de aplicaciones:

* Llamada a remote procedure (online)
* Orientado a documentos (batch)

<hr>

**NOTA**

Los Web services abarcan RPC e interacciones orientadas a documentos

<hr>

Estos dos tipos de interacciones se describen en las siguientes subsecciones.

### Interacciones Orientadas a RPC

En las interacciones orientadas a RPC, la solicitud de Web services toma la forma de un método o una llamada de procedimiento con parámetros de entrada y salida asociados. En contraste con la interacción orientada a documentos, la interacción orientada a RPC envía un documento formateado específicamente para ser mapeado a un solo programa lógico [2] o base de datos, como se muestra en la Figura 1-4. Debido a que el pedido de botas de skate en “tiempo real” o en temporada depende del inventario disponible, por ejemplo, el programa accede a la base de datos para verificar el suministro disponible del artículo pedido. Si todo está bien, el programa devuelve un documento XML al distribuidor en el formato de request/response para indicar que el pedido ha sido aceptado y será enviado. Si el suministro no está disponible, el mensaje de devolución indica un pedido pendiente o rechaza el pedido por completo. En contraste con el estilo de interacción orientado a documentos, la solicitud y la respuesta se modelan como ***mensajes sincrónicos***. Es decir, ***la aplicación que envía el mensaje espera una respuesta***.


**Figura 1-4. Este Web service admite una request/response de pedido interactiva.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ea37c586-f71e-48a6-bc03-7be32d945c83)

<hr>

**NOTA**

Las interacciones orientadas a RPC son buenas para intercambios breves de datos

<hr>   

### Interacciones Orientadas a Documentos

En el estilo de interacción orientado a documentos, la Web service request toma la forma de un documento XML completo que está destinado a ser procesado en su totalidad. Por ejemplo, un Web service que envía un pedido de compra completo, como un pedido de pretemporada de botas de skate, enviaría el pedido al por mayor completo al fabricante de una sola vez, como se muestra en la figura 1-5. Esto es como enviar un mensaje a una cola para su procesamiento asíncrono. Normalmente, el fabricante enviaría un correo electrónico u otra forma de acuse de recibo al minorista para indicar que se recibió el pedido y que se procesaría de acuerdo con un flujo de ejecución predefinido. El flujo puede incluir pasos como verificar la base de datos de pedidos anteriores del mismo minorista para asegurarse de que no exceda su límite de crédito o capacidad acordada o programar una fecha de envío para el pedido. En un flujo de proceso real, por supuesto, es probable que haya muchos más pasos antes de que se envíe el pedido y se envíe la factura, pero el ejemplo muestra solo el paso final: enviar la factura XML al distribuidor para el pago después de que se haya enviado el pedido y recibió.


**Figura 1-5. Este Web service procesa una orden de compra completa.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9639fbe9-1e78-4e37-8289-90ce057e7150)

<hr>

**NOTA**

El estilo orientado a documentos es bueno para intercambios masivos de datos.

<hr>

Las interacciones orientadas a documentos a menudo asumen que las partes de una conversación de servicios web han acordado compartir un documento comercial común, como una orden de compra, un conocimiento de embarque o una factura. Estas partes a menudo se identifican como socios comerciales o socios colaboradores. Los socios comerciales también suelen acordar un flujo de proceso común, o patrón de interacción, para intercambiar el documento compartido, como solicitar un acuse de recibo de una orden de compra, devolver información de estado específica en respuesta a una consulta de orden o enviar un correo electrónico. Alerta cuando un pedido ha sido enviado. Durante la ejecución del proceso comercial, se puede intercambiar un documento completo. Si el documento ya es común, los fragmentos de información necesarios para completar secciones específicas del documento compartido, como el precio de compra o la fecha de entrega prometida,

<hr>

**NOTA**

Los acuerdos de socios comerciales determinan las interacciones requeridas

<hr>

En el ejemplo de Skateboots Company, los pedidos al por mayor de pretemporada se manejan mediante el uso de pedidos de compra enviados en lotes de acuerdo con términos y condiciones predefinidos que ayudan al fabricante a planificar la capacidad. Durante la temporada, los pedidos de reabastecimiento inmediato son manejados por servicios más interactivos que dependen de completar los pedidos del inventario disponible y que pueden identificar de inmediato los pedidos pendientes. Por lo tanto, Skateboots.com proporciona servicios web compatibles con los dos tipos principales de interacción.

<hr>

**NOTA**

Los dos estilos se corresponden bien con los paradigmas de mensajería sincrónica/asincrónica - synchronous/asynchronous.

<hr>

## La Tecnología de los Web Services

Los programas que interactúan entre sí a través de la Web deben poder encontrarse, descubrir información que les permita interconectarse, descubrir cuáles son los patrones de interacción esperados (¿una simple solicitud/respuesta(request/reply) o un flujo de proceso más complicado?) y negociar tales cualidades de servicio como seguridad, mensajería confiable y composición transaccional. Algunas de estas calidades de servicio están cubiertas por las tecnologías existentes y los estándares propuestos, pero otras no. En general, la comunidad de Web services está trabajando para cumplir con todos estos requisitos, pero es un proceso evolutivo, como lo ha sido la propia web. La infraestructura y los estándares de los Web services se están diseñando y desarrollando desde cero para que sean extensibles, como XML y HTML, antes que ellos, de modo que todo lo que se introduzca a corto plazo pueda seguir utilizándose a medida que surjan nuevos estándares y tecnologías.

<hr>

**NOTA**

Los estándares definen cómo se describen, descubren y comunican entre sí los Web services.

<hr>

#### ¿LA NUEVA BALA DE PLATA?

Los Web services a veces se presentan como soluciones "bala de plata" para los problemas informáticos contemporáneos, que cumplen el papel que antes desempeñaban la web original, las bases de datos relacionales, los lenguajes de cuarta generación y la inteligencia artificial. Desafortunadamente, los Web services por sí solos no pueden resolver mucho. Los Web services son una nueva capa, otra forma de hacer las cosas, pero no son un cambio fundamental que reemplace la necesidad de una infraestructura informática existente. Esta nueva capa de tecnología realiza una nueva función, una nueva forma de trabajar, pero, lo que es más importante, proporciona un mecanismo de integración definido en un nivel más alto de abstracción.

Los Web services son importantes porque son capaces de unir dominios tecnológicos, no porque reemplacen ninguna tecnología existente. Se podría decir que los lenguajes más nuevos, como Visual Basic, C#, C/C++ y Java, reemplazan a los lenguajes más antiguos, como COBOL y FORTRAN, aunque todavía existen muchos programas en esos lenguajes, al igual que las asignaciones de Web services para ellos. Los Web services, como los servidores web, son complementarios y no están en conflicto con las aplicaciones, los programas y las bases de datos existentes. El desarrollo de aplicaciones sigue requiriendo Java, VB y C#. Todo lo que es nuevo es una forma de transformar datos dentro y fuera de programas y aplicaciones, utilizando formatos y protocolos de datos XML estándar para alcanzar un nuevo nivel de interoperabilidad e integración.

Es posible que los desarrolladores deban tener en cuenta los Web services al diseñar y desarrollar nuevos programas y bases de datos, pero esos programas y bases de datos seguirán siendo necesarios detrás de los envoltorios de servicios web. Los Web services no son elementos ejecutables en sí mismos; se basan en programas ejecutables escritos con lenguajes de programación y scripts. Los Web services definen una poderosa capa de abstracción que se puede usar para lograr la interacción de programa a programa, usando la infraestructura web existente, pero no son nada sin una infraestructura de soporte.

Los Web services requieren varias tecnologías relacionadas basadas en XML para transportar y transformar datos dentro y fuera de programas y bases de datos.

<hr>

**NOTA**

Los Web services requieren el uso de varias tecnologías relacionadas basadas en XML

<hr>

**XML (Extensible Markup Language)**, la base básica sobre la que se construyen los Web services proporciona un lenguaje para definir datos y cómo procesarlos. XML representa una familia de especificaciones relacionadas publicadas y mantenidas por World Wide Web Consortium (W3C) y otros.

**WSDL (Web Services Description Language)**, una tecnología basada en XML, define las interfaces de los Web services, los tipos de datos y mensajes, los patrones de interacción y las asignaciones de protocolos.

**SOAP (Simple Object Access Protocol)**, una tecnología basada en XML, define un sobre para la comunicación de Web services (asignable a HTTP y otros transportes) y proporciona un formato de serialización para transmitir documentos XML sobre una red y un convención para representar interacciones RPC.

**UDDI (Universal Description, Discovery, and Integration)**, un mecanismo de descubrimiento y registro de Web services, se utiliza para almacenar y categorizar información comercial y para recuperar punteros a interfaces de Web services.

### Ejemplo de uso

Los estándares de Web services básicos se utilizan juntos. Una vez que se obtiene el WSDL desde un UDDI u otra ubicación, se genera un mensaje SOAP para transmitirlo al sitio remoto.

<hr>

**NOTA**

Los estándares de Web services generalmente se usan juntos

<hr>

Como se muestra en la Figura 1-6, un programa que envía un documento a una dirección de Web service utiliza un XML schema de un tipo específico, como WSDL, para transformar los datos de su fuente de entrada (un archivo estructurado en este ejemplo) y producir un Instancia de documento XML en el formato consistente con lo que espera el Web service de destino, como se describe en el mismo archivo WSDL. El archivo WSDL se utiliza para definir las transformaciones de datos de entrada y salida.


**Figura 1-6. Los Web service utilizan documentos XML y los transforman dentro y fuera de los programas.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/1b5f071a-5c1d-413c-ae77-5d58a7a9856b)


El procesador SOAP de la computadora emisora ​​transforma los datos de su formato nativo en los tipos de datos de XML schema predefinidos contenidos en el archivo WSDL para texto, punto flotante y otros, utilizando tablas de mapeo. Las tablas de asignación asocian los tipos de datos nativos con los tipos de datos de XML schema correspondientes. (Las asignaciones estándar están ampliamente disponibles para Java, Visual Basic, CORBA y otros sistemas de tipo de uso común. Muchas herramientas de asignación XML están disponibles para definir asignaciones personalizadas o especiales). El procesador SOAP de la computadora receptora realiza la transformación a la inversa, asignando desde el XML tipos de datos de esquema a los tipos de datos nativos correspondientes.

La URL, de uso generalizado en la Web, apunta a una dirección **TCP (Transmission Control Protocol)** que contiene un recurso Web. Los Web services schemas son una forma de recurso web, contenidos en archivos accesibles a través de Internet y expuestos a la web utilizando el mismo mecanismo que para descargar archivos HTML. La principal diferencia entre la descarga de archivos HTML y el acceso a recursos de Web services es que los Web services utilizan XML en lugar de documentos HTML y se basan en tecnologías asociadas, como schemas, transformación y validación, para admitir la comunicación remota entre aplicaciones. Pero la forma en que se publican y descargan los esquemas de Web services es la misma: una operación HTTP en una URL determinada.

<hr>

**NOTA**

Los archivos de descripción del Web service generalmente se publican mediante direcciones URL.

<hr>

Cuando recibe un documento, la implementación de un Web service primero debe analizar el mensaje XML y validar los datos, realizar cualquier verificación de calidad de servicio relevante, como hacer cumplir políticas de seguridad o acuerdos de socios comerciales, y ejecutar cualquier flujo de proceso comercial asociado con el documento. El Web service del sitio web ficticio skateboots.com se encuentra en la **`skateboots.com/order`**, que es a lo que apunta la URL.[3]

<hr>

**NOTA**

Los Web services usan XML schemas para validar mensajes

<hr>

Los Web services disponibles en esta dirección de Internet se identifican dentro de un archivo WDSL público que se puede descargar a la computadora emisora ​​y se usa para generar el mensaje. The Skateboots Company también publicó una lista en el directorio público DE UDDI, apuntando al mismo archivo WSDL, para los clientes que podrían descubrir la empresa a través del servicio UDDI. En general, cualquier persona que desee interactuar con los Web services que realizan o rastrean pedidos para Skateboots Company a través de la Web debe encontrar una manera de obtener y usar ese archivo WSDL en particular para generar el mensaje.

Los programas en la dirección skateboots.com proporcionan un HTTP listener asociado con los Web services para reconocer los mensajes XML enviados en el formato definido. Los programas incluyen analizadores y transformadores XML y asignan los datos del mensaje SOAP a los formatos requeridos por el sistema de entrada de pedidos de Skateboots Company.

Estas tecnologías son suficientes para crear, implementar y publicar Web services básicos. De hecho, incluso SOAP básico es suficiente. Otras tecnologías se agregan continuamente al framework de Web services en expansión a medida que surgen. Sin embargo , estas tecnologías fundamentales son suficientes para respaldar el uso de Internet para la comunicación comercial básica y para unir dominios TI dispares; y esta forma de interacción Web se está adoptando muy rápidamente.

<hr>

**NOTA**

Las tecnologías de Web services están evolucionando desde un framework básico

<hr>

Con el tiempo, a medida que maduren los estándares para el registro, el descubrimiento y la calidad del servicio, la visión de una Web comercial dinámica y ad hoc comenzará a afianzarse, y los Web services comenzarán a operar más como la Web actual, lo que permitirá a las empresas encontrar y comerciar entre sí únicamente mediante el uso de comunicaciones al estilo de Internet. Mientras tanto, las tecnologías y los estándares de Web services básicos que se tratan en este libro son suficientes para muchas soluciones, como la integración de dominios de software dispares (J2EE y .NET, por ejemplo), la conexión a aplicaciones empaquetadas, como SAP y PeopleSoft, y el envío de documentos a flujos de procesos de negocio predefinidos.

### XML: la Base

En el contexto de los Web services, XML se utiliza no solo como formato de mensaje, sino también como la forma en que se definen los servicios. Por lo tanto, es importante saber un poco sobre XML, especialmente en el contexto de cómo se usa para definir e implementar Web services.

<hr>

**NOTA**

XML se utiliza para múltiples propósitos

<hr>   

#### REINVENTANDO LA RUEDA

Algunas personas dicen que los Web services están reinventando la rueda porque comparten muchas características con otras arquitecturas informáticas distribuidas, como CORBA o DCOM. Los Web services comparten un terreno común considerable con estas y otras arquitecturas e implementaciones informáticas distribuidas, pero también hay una buena razón para inventar una nueva arquitectura. La Web está establecida y, para aprovechar esta tremenda red global, es necesario adaptar los conceptos de computación distribuida. Primero, la Web está básicamente desconectada; es decir, las conexiones son transitorias y temporales. Los servicios informáticos distribuidos, como la seguridad y las transacciones, tradicionalmente dependen de una conexión a nivel de transporte y deben rediseñarse para proporcionar una funcionalidad equivalente para la Web desconectada. En segundo lugar, la Web asume que las partes pueden conectarse sin conocimiento previo entre sí, siguiendo URL links y observando algunas reglas básicas. Para los Web services, esto significa que cualquier cliente puede acceder a los Web services publicados por cualquier otra persona, siempre que la información sobre el servicio (el esquema) esté disponible y sea comprensible y los procesadores XML sean capaces de generar mensajes que se ajusten al esquema.

Las tecnologías informáticas distribuidas tradicionales asumen una relación mucho más estrecha entre el cliente y el servidor y, por lo tanto, no pueden aprovechar inherentemente la World Wide Web existente. Debido a que los Web services adoptan el modelo de publicación de la web, es posible encapsular y publicar un end point u operación empresarial específica mediante una definición de interfaz de Web services, sin necesidad de un tipo específico de cliente para ese end point. El cambio de paradigma que los clientes pueden desarrollar e integrar posteriormente tiene muchas ventajas para resolver el problema de la integración empresarial.

### Propósitos de XML

XML se desarrolló para superar las limitaciones de HTML, especialmente para admitir mejor la creación y administración de contenido dinámico. HTML está bien para definir y mantener contenido estático, pero a medida que la Web evoluciona hacia una plataforma habilitada por software, en la que los datos tienen un significado asociado, el contenido debe generarse y digerirse dinámicamente. Usando XML, puede definir cualquier número de elementos que asocien significado con datos; es decir, describe los datos y qué hacer con ellos utilizando uno o más elementos creados para tal fin. Por ejemplo:

```xml
<Company>
  <CompanyName region="US">
  Skateboots Manufacturing
  </CompanyName>
  <address>
    <line>
    200 High Street
    </line>
    <line>
    Springfield, MA 55555
    </line>
    <Country>
    USA
    </Country>
  </address>
  <phone>
  +1 781 555 5000
  </phone>
</Company>
```

<hr>

**NOTA**

XML permite definir cualquier número de elementos

<hr>

En este ejemplo, XML le permite definir no solo elementos que describen los datos, sino también estructuras que agrupan datos relacionados. Es fácil imaginar una búsqueda de elementos que coincidan con ciertos criterios, como **`<Country>`** y **`<phone>`** para una empresa determinada, o para todos **`<Country>`** los elementos y devolver una lista de esas entidades identificándose como empresas en la Web.

Además, como se mencionó anteriormente, XML permite que los esquemas asociados validen los datos por separado y describan otros atributos y cualidades de los datos, algo completamente imposible con HTML .

Por supuesto, problemas significativos resultan de la gran flexibilidad de XML. Debido a que XML le permite definir sus propios elementos, es muy difícil asegurarse de que todos usen los mismos elementos de la misma manera para significar lo mismo. Ahí es donde entra la necesidad de modelos de contenido consistentes y acordados mutuamente.

<hr>

**NOTA**

Los esquemas XML limitan la flexibilidad

<hr>

Dos partes que intercambian datos XML pueden comprender e interpretar elementos de la misma manera solo si comparten las mismas definiciones de lo que son. Si dos partes que comparten un documento XML también comparten el mismo esquema, pueden estar seguros de comprender el significado de las mismas etiquetas de elementos de la misma manera. Así es exactamente como funcionan los Web services.

### Tecnologías

XML es una familia de tecnologías: un data markup language, varios modelos de contenido, un modelo de enlace, un namespace de nombres y varios mecanismos de transformación. Los siguientes son miembros importantes de la familia XML que se utilizan como base de los Web services:

* **`XML v1.0`**: Las reglas para definir elementos, atributos y etiquetas encerrados dentro de un elemento raíz del documento, proporcionando un modelo de datos abstracto y un formato de serialización

* **`XML schema`**: Documentos XML que definen los tipos de datos, el contenido, la estructura y los elementos permitidos en un XML; también se usa para describir instrucciones de procesamiento semántico asociadas con elementos del documento

* **`XML namespaces`**: Los nombres exclusivos calificados para aplicaciones y elementos de documentosXML

<hr>

**NOTA**

Varios miembros de la familia XML se utilizan en los servicios web.

<hr>

#### EL FUTURO DE LA WEB

El inventor de la World Wide Web, Tim Berners-Lee, ha dicho que la próxima generación de la Web se tratará de datos, no de texto; XML es a los datos lo que HTML es al texto. La próxima generación de la Web pretende abordar varias deficiencias de la Web existente, en particular la dificultad de buscar en la Web coincidencias exactas en las cadenas de texto incrustadas en las páginas Web. Sin embargo, debido a que la Web ha tenido tanto éxito, el futuro de la Web debe lograrse como una extensión, o una evolución, de la Web actual. ¡Es imposible reemplazar todo y empezar de nuevo! Las soluciones para la comunicación de aplicación a aplicación deben derivarse de las tecnologías de Internet existentes.

Si el futuro de la Web depende de su capacidad para respaldar las comunicaciones de datos con la misma eficacia y facilidad que las comunicaciones de texto, los Web services deben poder hacer referencia dinámicamente a los end points de la Web, o direcciones (URL), y asignar datos(map data) a y de XML de forma transparente. Estos end points, o direcciones, brindan los servicios que procesan los datos XML, de la misma manera que los navegadores procesan el texto HTML. Estas direcciones también se pueden incluir en cualquier programa capaz de reconocer una URL y analizar XML. Así será posible comunicarse desde su hoja de cálculo a una fuente remota de datos o desde su programa de gestión de dinero a su aplicación de gestión de cuentas bancarias, concertar citas con compañeros para reuniones, etc.

Microsoft y otros ya están desarrollando este tipo de servicios estándar accesibles desde cualquier programa, y ​​una gran parte de la estrategia .NET de Microsoft se centra en herramientas de desarrollo para crear y unir aplicaciones que utilizan Web services predefinidos. Pero lograr que esto suceda requiere una estandarización significativa, comparable al esfuerzo que implica la estandarización de los componentes de la PC y, por lo tanto, es posible que no suceda durante varios años.

* **XML Information Set**: Una representación abstracta y coherente de las partes de un documento XML
* **XPointer**: Un puntero a una parte específica de un documento; **XPath**, expresiones para buscar documentos XML y **XLink**, para buscar múltiples documentos XML
* **Extensible Stylesheet Language Transformations (XSLT)**: Transformación de XML en otros XML o para exportar a formatos XML
* **DOM (Document Object Model) and SAX (Simple API for XML)**: Libraries y modelos de programación para analizar XML, ya sea creando un árbol completo para recorrer o leyendo y respondiendo a XML elements uno por uno

Estas tecnologías y otras se describen con más detalle en el Capítulo 2 .

## WSDL: Descripción de Web Services

El **Web Services Description Language (WSDL)** es un formato de XML schema que define un extensible framework para describir las Web services interfaces. WSDL fue desarrollado principalmente por Microsoft e IBM y fue presentado al W3C por 25 empresas. [4] WSDL está en el corazón del Web services framework, proporcionando una forma común de representar los tipos de datos pasados ​​en los mensajes, las operaciones que se realizarán en los mensajes y el mapeo de los mensajes en los transportes de red.

WSDL, como el resto del Web services framework, está diseñado para usarse con interacciones tanto orientadas a procedimientos como orientadas a documentos. Al igual que con el resto de las tecnologías XML, WSDL es tan ampliable y tiene tantas opciones que puede resultar difícil garantizar la compatibilidad y la interoperabilidad entre distintas implementaciones. Sin embargo, si el remitente y el receptor de un mensaje pueden compartir y comprender el mismo archivo WSDL de la misma manera, se puede garantizar la interoperabilidad.

<hr>

**NOTA**

WSDL es el formato XML que describe en qué consiste un Web service

<hr>

WSDL se divide en tres elementos principales:

* Definiciones de tipos de datos
* Operaciones abstractas
* Service bindings

<hr>

**NOTA**

WSDL tiene tres elementos principales, según el nivel de abstracción

<hr>

Cada elemento principal puede especificarse en un documento XML separado e importarse en varias combinaciones para crear una descripción final de los Web services, o pueden definirse todos juntos en un solo documento. Las definiciones de tipos de datos determinan la estructura y el contenido de los mensajes. Las operaciones abstractas determinan las operaciones realizadas en el contenido del mensaje y los enlaces de servicio determinan el transporte de red que llevará el mensaje a su destino.

<hr>

**NOTA**

Los elementos WSDL se pueden definir en documentos separados

<hr>

La Figura 1-7 muestra los elementos de WSDL, en capas según sus niveles de abstracción, que se definen independientemente del transporte, específicamente para que se puedan usar múltiples transportes para el mismo servicio. Por ejemplo, se puede acceder al mismo servicio a través de SOAP sobre HTTP y SOAP sobre JMS. De manera similar, las definiciones de tipos de datos se colocan en una sección separada para que puedan ser utilizadas por múltiples servicios. Los elementos principales de WSDL se dividen en subpartes.

**Figura 1-7. WSDL consta de tres elementos principales y siete partes.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a40bfaea-364f-45d0-a0b6-cc2d61a701f2)


Las partes de definición incluyen definiciones de tipos de datos, mensajes y operaciones abstractas, que son similares a las definiciones de interfaz en CORBA o DCOM. Los mensajes pueden tener varias partes y se pueden definir para su uso con el estilo de interacción orientado a procedimientos, el estilo de interacción orientado a documentos o ambos. A través de las capas de abstracción, los mismos mensajes se pueden definir y utilizar para varios tipos de puertos. Al igual que las otras partes de WSDL , los mensajes también incluyen componentes de extensibilidad, por ejemplo, para incluir otros atributos de mensajes.

<hr>

**NOTA**

Las interfaces WSDL son como las interfaces CORBA o DCOM

<hr>

Las definiciones de tipo de datos WSDL se basan en XML schemas, pero se puede sustituir por otro sistema de definición de tipo equivalente o similar. Por ejemplo, los tipos de datos del Interface Definition Language (IDL) de CORBA podrían usarse en lugar de los tipos de datos de XML schema. (Sin embargo, si se utiliza otro sistema de definición de tipos, ambas partes de una interacción de servicios web deben poder entenderlo).

<hr>

**NOTA**

Los tipos de datos de Web service se basan en XML schemas, pero son extensibles a cualquier otro mecanismo

<hr>

Los service bindings map(asignan) los mensajes abstractos y las operaciones a transportes específicos, como SOAP. Los binding extensibility components se utilizan para incluir información específica de SOAP y otras mappings. Las definiciones abstractas se pueden asignar a una variedad de transportes físicos. La especificación WSDL incluye ejemplos de asignaciones unidireccionales DE SOAP para SMTP (Simple Mail Transfer Protocol), SOAP RPC mappings para HTTP, SOAP mappings para HTTP **`GET`** y **`POST`**, y un ejemplo mapping MIME (multipurpose Internet messaging extensions) multipart binding para SOAP.

<hr>

**NOTA**

Los mensajes abstractos y las operaciones son mapped a transportes específicos.

<hr>

Los XML namespaces se utilizan para garantizar la exclusividad de los nombres de los XML element utilizados en cada uno de los tres elementos principales de WSDL elements. Por supuesto, cuando los WSDL elements se desarrollan por separado y se importan en un solo archivo completo, los espacios de nombres utilizados en los archivos separados no deben superponerse. Los esquemas asociados se utilizan para validar tanto el archivo WSDL como los mensajes y operaciones definidos en el archivo WSDL .

<hr>

**NOTA**

Los namespaces aseguran la unicidad de los nombres de los WSDL element

<hr>

Es seguro decir que es probable que WSDL incluya muchas extensiones, cambios y adiciones a medida que maduren los Web services. Al igual que SOAP, WSDL está diseñado como un extensible XML framework que se puede adaptar fácilmente a múltiples asignaciones de tipos de datos, definiciones de tipos de mensajes, operaciones y transportes. Por ejemplo, IETF (Internet Engineering Task Force) están proponiendo un nuevo estándar de protocolo, el Blocks Extensible Exchange Protocol (BEEP), para definir un transporte útil orientado a la conexión. ( HTTP, por el contrario, es inherentemente sin conexión, lo que dificulta la resolución de problemas de calidad de servicio a nivel de transporte) tales como DCOM or IIOP (Internet Inter-Orb Protocol).

### SOAP: Acceso a Web Services

Hasta ahora, ha definido los datos ( XML ) y expresado la abstracción del servicio necesario para admitir la comunicación y el procesamiento del mensaje ( WSDL ). Ahora debe definir la forma en que el mensaje se enviará de una computadora a otra y así estará disponible para su procesamiento en la computadora de destino.

La especificación SOAP define un framework de mensajería para intercambiar datos XML formateados a través de Internet. El framework de mensajería es simple, fácil de desarrollar y completamente neutral con respecto al sistema operativo, el lenguaje de programación o la plataforma informática distribuida. SOAP está destinado a proporcionar un nivel mínimo de transporte sobre el cual se pueden construir interacciones y protocolos más complicados.

<hr>

**NOTA**

SOAP proporciona el mecanismo de comunicación para conectar Web services

<hr>

SOAP es fundamentalmente un modelo de comunicación unidireccional que garantiza que se transfiera un mensaje coherente del remitente al receptor, lo que incluye potencialmente intermediarios que pueden procesar parte o agregar a la unidad de mensaje. La especificación SOAP contiene convenciones para adaptar su mensajería unidireccional para el paradigma de request/response popular en las comunicaciones de estilo RPC y también define cómo transmitir documentos XML completos. SOAP define una regla de codificación opcional para los tipos de datos, pero los end points en una comunicación SOAP pueden decidir sobre sus propias reglas de códificación a través de un acuerdo privado. La comunicación a menudo utiliza codificación XML nativa o encoding.

<hr>

**NOTA**

SOAP es la forma XML de definir qué información se envía y cómo

<hr>

Como se muestra en la Figura 1-8, SOAP está diseñado para proporcionar un protocolo de comunicación abstracto e independiente capaz de unir o conectar dos o más empresas o dos o más sitios comerciales remotos. Los sistemas conectados se pueden construir utilizando cualquier combinación de hardware y software que admita el acceso a Internet a los sistemas existentes, como .NET y J2EE. Los sistemas existentes normalmente también representan múltiples infraestructuras y productos de software empaquetados. SOAP y el resto del framework XML proporcionan los medios para que dos o más sitios comerciales, marketplaces o socios comerciales acuerden un enfoque común para exponer los servicios en la Web.


**Figura 1-8. Los SOAP messages conectan sitios remotos.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/d391b69f-24b1-4c9c-933f-576f1846a9c8)


SOAP tiene varias partes principales:

* **`Envelope`**: ​​Define el inicio y el final del mensaje

* **`Header`**: Contiene cualquier atributo opcional del mensaje utilizado en el procesamiento del mensaje, ya sea en un punto intermedio o en el último end point.

* **`Body`**: Contiene el XML data que componen el mensaje que se envía

* **`Attachment`**: Consiste en uno o más documentos adjuntos al mensaje principal (SOAP con Adjuntos solamente)

* **`RPC interaction`**: define cómo modelar RPC con SOAP

* **`Encoding`**: Define cómo representar datos simples y complejos que se transmiten en el mensaje

<hr>

**NOTA**

Los SOAP messages contienen un envelope, un header, y un body

<hr>

Solo son obligatorios el envelope y el body.

## UDDI: Publicación y Descubrimiento Web Services

Después de haber definido los datos en los mensajes ( XML ), descrito los servicios que recibirán y procesarán el mensaje ( WSDL ) e identificado los medios para enviar y recibir los mensajes ( SOAP ), necesita una forma de publicar el servicio que usted ofrece y para encontrar los servicios que otros ofrecen y que usted puede querer utilizar. Esta es la función que proporciona UDDI (universal distribution, discovery, and interoperability).

#### DENTRO DE LA EMPRESA
AQUIIIIII
Muchas empresas están explorando las posibles ventajas de utilizar servicios web tanto dentro como fuera de la empresa. Esto es análogo al uso de navegadores y servidores web dentro de la empresa en redes internas. La infraestructura web interna existente se puede utilizar para dar soporte a las interacciones del estilo de los servicios web. Aunque es poco probable que reemplacen los entornos informáticos distribuidos existentes, como COM y CORBA , los servicios web pueden ser un complemento valioso para las tecnologías existentes. A veces, todo lo que tiene es una conexión HTTP o SMTP . Debido a que representan un formato completamente neutral que se puede usar para lograr un nuevo nivel de interoperabilidad, los servicios web también se pueden usar como puente entre COM, CORBA, EJB y entornos de colas de mensajes. Finalmente, debido a que los servicios web utilizan la infraestructura HTTP existente , el impacto en los administradores de sistemas es mínimo en comparación con la introducción de otras tecnologías informáticas distribuidas en un departamento DE TI . El rendimiento es sin duda un problema en comparación con los transportes y protocolos orientados a binarios más tradicionales, pero los beneficios potenciales superan los costos para muchas aplicaciones, y los problemas de rendimiento tienden a resolverse con el tiempo, como sucedió con la Web original.

El marco UDDI define un modelo de datos en XML e interfaces de programación de aplicaciones (API) SOAP para registrar y descubrir información empresarial, incluidos los servicios web que publica una empresa . UDDI es producido por un consorcio independiente de proveedores, fundado por Microsoft, IBM y Ariba, para desarrollar un estándar de Internet para el registro y descubrimiento de descripciones de servicios web. Microsoft, IBM, Hewlett-Packard y SAP alojan la implementación inicial de un servicio UDDI público , que sigue el modelo conceptual de DNS , el servicio de nombres de dominio de Internet que traduce los nombres de host de Internet en direcciones TCP . En realidad, UDDIes mucho más como un servicio de base de datos replicado accesible a través de Internet.

<hr>

**NOTA**

UDDI registra y publica definiciones de servicios web

<hr>

UDDI es similar en concepto a un directorio de páginas amarillas. Las empresas registran su información de contacto, incluidos detalles como números de teléfono y fax, dirección postal y sitio web. El registro incluye información de categoría para la búsqueda, como ubicación geográfica, código de tipo de industria, tipo de negocio, etc. Otras empresas pueden buscar la información registrada en UDDI para encontrar proveedores de repuestos, servicios de catering o subastas y mercados. Una empresa también puede descubrir información sobre servicios web específicos en el registro, normalmente encontrando una URL para un archivo WSDL que apunta al servicio web de un proveedor.

<hr>

**NOTA**

UDDI es un directorio de servicios Web

<hr>

Las empresas utilizan SOAP para registrarse a sí mismos oa otros con UDDI ; luego, los clientes del registro utilizan las API de consulta para buscar información registrada y descubrir un socio comercial. Una consulta inicial puede devolver varias coincidencias de las que se elige una única entrada. Una vez que se elige la entrada de una empresa, se realiza una llamada API final para obtener la información de contacto específica de la empresa.

<hr>

**NOTA**

UDDI usa SOAP para registrar y descubrir información

<hr>

La Figura 1-9 muestra cómo una empresa registraría la información del servicio web, junto con otra información de contacto más tradicional, con el registro UDDI . Una empresa primero genera un archivo WSDL para describir los servicios web compatibles con su procesador SOAP (1) y utiliza las API DE UDDI para registrar la información en el repositorio (2). Después de que una empresa envía sus datos al registro, junto con otra información de contacto, la entrada del registro contiene una URL que apunta al WSDL del sitio del servidor SOAP u otro archivo de esquema XML QUE DESCRIBE EL SERVICIO WEB. UNA VEZ QUE EL SOAP de otra empresaEl procesador consulta el registro (3) para obtener el WSDL u otro esquema (4), el cliente puede generar el mensaje apropiado (5) para enviar a la operación especificada sobre el protocolo identificado (6). Por supuesto, tanto el cliente como el servidor deben poder estar de acuerdo con el mismo protocolo (en este ejemplo, SOAP sobre HTTP ) y compartir la misma comprensión o definición semántica del servicio, que en este ejemplo se representa a través de WSDL . Sin embargo, con la adopción generalizada de estos estándares fundamentales, esta comprensión común de WSDL parece estar asegurada.


**Figura 1-9. El repositorio UDDI se puede utilizar para descubrir un servicio web.**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/3ece91bc-7ede-4f1e-85a0-fddf31b747f0)

XML para la colaboración empresarial: ebXML
Se requieren varias tecnologías adicionales, más allá de lo que se proporciona en las tecnologías de servicios web básicos, para admitir una verdadera interacción de empresa a empresa a través de la web. El consorcio Electronic Business XML (ebXML), por ejemplo, ha definido un conjunto integral de especificaciones para un patrón de uso industrial para el intercambio de documentos XML entre socios comerciales. La especificación de mensajería ebXML se basa en SOAP con archivos adjuntos y no utiliza WSDL , pero agrega varias cualidades de servicio, como seguridad, mensajería garantizada y cumplimiento de patrones de interacción de procesos comerciales.

<hr>

**NOTA**

La especificación ebXML proporciona más que tecnologías básicas de servicios web

<hr>

La iniciativa ebXML, cuya primera fase finalizó en mayo de 2001, fue patrocinada por un grupo internacional establecido por el Centro de las Naciones Unidas para la Facilitación del Comercio y el Comercio Electrónico (UN/CEFACT) y OASIS para investigar, desarrollar Y promover ESTÁNDARES globales PARA la uso de XML para facilitar el intercambio de datos comerciales electrónicos. [5] La arquitectura ebXML comienza con un proceso comercial y un modelo de información, asigna el modelo a esquemas XML y define los requisitos para las aplicaciones que procesan los documentos y los intercambian entre los socios comerciales.

<hr>

**NOTA**

La especificación ebXML define el uso DE XML para procesos comerciales cooperativos

<hr>

SERVICIOS WEB Y EDI FRENTE A EBXML

Aunque el intercambio electrónico de datos ( EDI ) ha existido durante más de dos décadas, es muy complejo, tiene múltiples interpretaciones, requiere una gran experiencia técnica para su implementación y se basa en una arquitectura inflexible y estrechamente acoplada. Aunque se pueden implementar en redes públicas, las aplicaciones EDI se usan con mayor frecuencia en redes dedicadas costosas y requieren mucha experiencia para configurarlas y ejecutarlas.

Por el contrario, ebXML y los servicios web prometen cumplir los objetivos originales de EDI , simplificando y facilitando el intercambio de documentos electrónicos a través de Internet. Sin embargo, ebXML y los servicios web también tendrán que madurar durante varios años antes de que abarquen todas las funciones y funciones actuales de EDI.

Aunque el consorcio ebXML ha completado su trabajo inicial, OASIS , UN / CEFACT y otras organizaciones continúan promoviendo la adopción de la arquitectura y las especificaciones a una audiencia más amplia, con la esperanza de establecer un mercado de comercio electrónico global a través del intercambio estandarizado de documentos XML . y mensajes, independientemente de las fronteras geográficas o políticas, y con las calidades de servicio que esperan las empresas. La arquitectura ebXML define

Procesos de negocio y sus mensajes y contenido asociados

Un mecanismo de registro y descubrimiento para publicar secuencias de procesos comerciales con intercambios de mensajes relacionados

Perfiles de empresa

Acuerdos de socios comerciales

Una capa de transporte de mensajes uniforme asignada a SOAP con archivos adjuntos MIME DE VARIAS PARTES

<hr>

**NOTA**

La arquitectura ebXML amplía los conceptos básicos de los servicios web

<hr>

De manera similar a la forma en que UDDI facilita la búsqueda de definiciones de servicios web, la arquitectura ebXML permite que las empresas se encuentren entre sí mediante un registro, para definir acuerdos de socios comerciales e intercambiar mensajes XML en apoyo de las operaciones comerciales. El objetivo es permitir que todas estas actividades se realicen automáticamente, sin intervención humana, a través de Internet. La arquitectura ebXML tiene muchas similitudes con SOAP / WSDL / UDDI , y ya se está produciendo cierto nivel de convergencia con la adopción de SOAP en la especificación de transporte ebXML. [6]RosettaNet también anunció su adopción del transporte ebXML, al igual que muchos otros consorcios verticales de la industria.

<hr>

**NOTA**

El registro ebXML permite que las empresas se encuentren y colaboren entre sí

<hr>

La arquitectura ebXML claramente se centra en interacciones orientadas a documentos; a medida que ebXML gana aceptación, puede llegar a definir el paradigma para las interacciones de servicios web orientadas a B2B. Las empresas que ya han estado intercambiando información electrónicamente, quizás usando estándares EDI , encontrarán muchos paralelos en los objetivos de ebXML, aunque ebXML tiene como objetivo abordar este tipo de requisitos de manera más amplia y para Internet.

<hr>

**NOTA**

La especificación ebXML se centra en las interacciones orientadas a documentos

<hr>

COMPARACIÓN DE EBXML Y SOAP

Inicialmente, parecía que el grupo ebXML estaba compitiendo con el grupo de empresas patrocinadoras de SOAP , WSDL y UDDI . De hecho, las especificaciones ebXML cubren gran parte del mismo territorio que SOAP , WSDL y UDDI . Podría ver el esfuerzo DE SOAP en W3C como un enfoque "de abajo hacia arriba", comenzando con una definición de la forma de asignar documentos XML a mensajes HTTP , y ver el esfuerzo de ebXML como un enfoque "de arriba hacia abajo", comenzando con una definición del proceso de negocio como una serie de mensajes asignados a cualquier transporte.

El grupo ebXML se formó principalmente para crear estándares de procesos comerciales, las áreas en las que el trabajo de ebXML es más prometedor. Las áreas de transporte, descripción de servicios y registro parecen más apropiadas para esfuerzos enfocados más puramente en temas de infraestructura que de procesos de negocios e interacción de documentos. Uno de los principales motivadores de ebXML es producir estándares que sirvan para el mismo o similar propósito que EDI , INCLUIDO EL SOPORTE PARA LOS "VOCABULARIOS" XML emergentes específicos de la industria . Parece apropiado considerar la arquitectura ebXML como requisitos en W3C y otros XML-Iniciativas orientadas como una forma de garantizar que los servicios web estarán listos para el uso comercial real, en lugar de como un esfuerzo competitivo para definir los servicios de infraestructura central.

Servicios web frente a otras tecnologías
Los servicios web no se parecen tanto a las tecnologías informáticas distribuidas tradicionales como CORBA , DCOM y EJB, sino a los servidores web, HTML y HTTP , en los que se basan. Los servicios web son fundamentalmente mensajes asincrónicos unidireccionales asignados a programas de software ejecutables. Los servicios web definen un formato de datos independiente del lenguaje de programación, el sistema operativo, el transporte de red y el mecanismo de almacenamiento de datos; por lo tanto, los datos tienen que ser mapeados dentro y fuera del formato independiente. La tipificación y la estructura de los datos se extraen de las implementaciones subyacentes de los servicios.

<hr>

**NOTA**

Los servicios web difieren de las tecnologías informáticas distribuidas tradicionales

<hr>

Los servicios web a menudo se comparan con invocaciones de llamadas a procedimientos remotos o componentes de software. Sin embargo, los servicios web se comparan más apropiadamente con los adaptadores de integración de aplicaciones empresariales. Los servicios web definen un formato de mensaje canónico, como lo hacen los sistemas de software EAI , como MQSeries, TIBCO, NEON, Vitria y Orbix E2A de IONA, y definen la forma en que el mensaje se dirige a una interfaz de servicio a través de la cual los datos se mapean o transformado en una aplicación subyacente. En otras palabras, la inteligencia para comprender cómo asignar un mensaje a un programa de software no está contenida dentro de la propia interfaz, como lo está en CORBA , J2EE y DCOM, todos los cuales están basados ​​en RPC .conceptos, que unen estrechamente el nombre del servicio con el programa que se invoca. Más bien, esa inteligencia está contenida dentro del procesador XML , que consume el mensaje y sigue las instrucciones asociadas sobre cómo analizar el mensaje y mapear los datos en cualquier programa que implemente el servicio web.

<hr>

**NOTA**

Los servicios web son más como adaptadores

<hr>

Además, los servicios web no requieren ni asumen la existencia del mismo sistema de software en ambos extremos de una ruta de comunicación. LOS ADAPTADORES EAI aceptan de manera similar un formato de mensaje canónico y asignan la información del mensaje a una planificación de recursos empresariales ( ERP ) u otro tipo de aplicación empresarial. Los servicios web se definen en un nivel similar de abstracción, lo que permite asignar el mismo tipo de mensaje a múltiples aplicaciones, incluidos, entre otros, componentes basados ​​en RPC .

<hr>

**NOTA**

Los servicios web se asignan a cualquier software

<hr>

A diferencia del middleware orientado A RPC , como CORBA y DCOM, los servicios web utilizan mensajería asíncrona unidireccional, que se asigna de forma más natural a un sistema de colas de mensajes, como MQSeries o JMS , que a CORBA o DCOM; aunque, por supuesto, los servicios web también se asignan a menudo a productos basados ​​en CORBA , J2EE y DCOM. Los servicios web admiten un paradigma de solicitud/respuesta típico de las comunicaciones síncronas de estilo RPC A TRAVÉS DE LA EMULACIÓN; es decir, el procesador XML , en lugar del protocolo, correlaciona las solicitudes con las respuestas. El mapeo HTTP DE SOAP, por ejemplo, no admite la correlación de solicitud/respuesta a nivel de protocolo. [7] La ​​emulación de servicios web de un RPC se asigna fácilmente a sistemas tradicionales basados ​​en RPC COMO CORBA , EJB y DCOM, aunque es probable que las cualidades del servicio (por ejemplo, seguridad, transacciones y manejo de excepciones) sean muy diferentes. de los disponibles en las tecnologías informáticas distribuidas tradicionales, que a menudo están estrechamente vinculadas a la capa de transporte y son específicas de cada tecnología.

<hr>

**NOTA**

Los servicios web son fundamentalmente sistemas de mensajería unidireccionales y asíncronos.

<hr>

Debido a que las interacciones con los servicios web se logran a través de los programas y bases de datos a los que se asignan los servicios web, es probable que la experiencia del usuario sea muy diferente de una experiencia típica basada en un navegador: los servicios web se parecen más a las aplicaciones tradicionales que a los navegadores, aunque, por supuesto, se pueden utilizar navegadores. (Como se mencionó anteriormente, los servicios web por sí mismos no son ejecutables, sino que deben asignarse a un programa, un objeto, un sistema de middleware o un sistema de administración de bases de datos).

<hr>

**NOTA**

Interactuar con servicios web es como interactuar con aplicaciones tradicionales

<hr>

Tecnologías Adicionales
Las tecnologías de servicios web centrales, como SOAP , WSDL y UDDI , son útiles para unir dominios tecnológicos dispares y enviar documentos a flujos de procesos comerciales. Sin embargo, para volverse útiles para más tipos de aplicaciones y cumplir con la visión completa de los servicios web que permiten el uso de bloques de construcción de aplicaciones a través de Internet, las tecnologías de servicios web deben ampliarse para abarcar características, funciones y calidades de servicio adicionales.

El trabajo en curso de evolución de los servicios web hacia un sustrato tecnológico más útil es muy similar a la evolución de la arquitectura del intermediario de solicitudes de objetos comunes, emprendida por el Grupo de gestión de objetos (OMG) DURANTE la década de 1990. El trabajo DE OMG definió una arquitectura de software integral que guió un esfuerzo colaborativo abierto que produjo un amplio conjunto de especificaciones para transacciones, mensajería asincrónica, seguridad, conmutación por error, tolerancia a fallas, etc. El mismo tipo de esfuerzo se está iniciando en el W3C para los servicios web y se está desarrollando una arquitectura similar.

En el mundo de los servicios web, los principales proveedores de software de la industria ya acordaron los estándares básicos, que es la verdadera prueba de estandarización. Microsoft, IBM, Sun Microsystems, BEA Systems, Oracle, IONA y otros acordaron implementar SOAP , WSDL y UDDI , aunque persisten algunas diferencias de opinión sobre el papel del registro ebXML. Sin embargo, aparte de los estándares fundamentales, las propuestas a menudo compiten, como la diferencia de opinión entre Microsoft e IBM sobre la definición de flujo de procesos comerciales, es decir, XLANG versus WSFL (Lenguaje de flujo de servicios web), y propuestas en competencia para manejar el contexto de seguridad.

<hr>

**NOTA**

Las tecnologías adicionales pueden o no convertirse en parte del estándar

<hr>

Las tecnologías adicionales se centran principalmente en las siguientes áreas clave:

Seguridad

Flujo del proceso

Actas

Mensajería

Algunas de las tecnologías adicionales más importantes para los servicios web implican tecnologías de seguridad.

La seguridad es importante para garantizar la confidencialidad e integridad de los datos de los servicios web. No se debe permitir que nadie más que el destinatario previsto de los datos examine o manipule el contenido del mensaje. La seguridad también es necesaria para controlar el acceso a los servicios web, especialmente cuando se usan varios servicios web juntos, de modo que solo aquellos a quienes están destinados los usen.

<hr>

**NOTA**

La seguridad es lo más importante

<hr>

Existen estándares propuestos para la autenticación y la autorización ( SAML , o lenguaje de marcado de autorización de seguridad) y para la gestión de claves públicas para el cifrado ( XKMS , o especificación de gestión de claves XML ). Por supuesto, fundamental para toda la seguridad de Internet es Secure Socket Layer ( SSL ) y, para los protocolos basados ​​en HTTP , HTTPS ( HTTP seguro ) para la seguridad básica de nivel de cifrado.

Además de HTTPS, cortafuegos, SAML , XKMS , el uso de firmas digitales y cifrado XML , Microsoft ha propuesto WS-License para la gestión de credenciales y WS-Security para propagar credenciales de seguridad asociadas con interacciones de servicios web.

El flujo de procesos es fundamental para automatizar las interacciones de los procesos comerciales en la Web y dentro de una empresa. El flujo de proceso también suele denominarse orquestación porque define la relación entre una serie de interacciones necesarias para lograr un propósito determinado, como completar una orden de compra, procesar una reserva de viaje o ejecutar un plan de fabricación. Un flujo se modela como una secuencia de pasos definidos para un proceso comercial determinado. La serie de pasos crea una agregación de funciones para las que se puede definir una interfaz de servicio web.

<hr>

**NOTA**

Los flujos automatizan la ejecución de procesos comerciales

<hr>

En el mundo de las operaciones comerciales automatizadas, las transacciones han desempeñado durante mucho tiempo el papel de ejecutor, asegurando que las plataformas de ejecución produjeran resultados consistentes de una serie de operaciones relacionadas con los datos, a pesar de las fallas de software o hardware. Sin embargo, estos protocolos y técnicas tradicionales no son directamente aplicables a la Web, ya que están diseñados para un entorno estrechamente acoplado en el que es posible mantener bloqueos de bases de datos en espera de la notificación del resultado de la transacción y en el que está disponible un protocolo orientado a la conexión para detectar fallos de comunicación automáticamente. La propuesta de Business Transaction Protocol ( BTP ) de OASISestá diseñado para resolver este problema de los servicios web mediante la definición de un protocolo débilmente acoplado que garantiza que los resultados de múltiples interacciones de servicios web se propaguen y compartan correctamente.

<hr>

**NOTA**

Las transacciones se están redefiniendo para la Web

<hr>

Los protocolos de mensajería ejecutan los patrones de comunicación definidos para las interacciones de servicios web, como unidireccional asíncrono, solicitud/respuesta, difusión y conversacional o de igual a igual. Las tecnologías de servicios web adicionales también pueden depender de la capa de mensajería para ciertas calidades de servicio, como la entrega confiable o garantizada, la propagación de contextos de seguridad y transacciones, y el enrutamiento correcto de mensajes a lo largo de una ruta definida que incluye uno o más intermediarios. IBM ha propuesto HTTP confiable (HTTPR) para abordar los requisitos en esta área.

<hr>

**NOTA**

Se necesitan mecanismos para mensajería confiable

<hr>

IBM y Microsoft han colaborado en la propuesta de WS-Inspection para descubrir información sobre los servicios web disponibles en un destino de mensaje en particular. Microsoft también ha propuesto WS-Referral y WS-Routing para definir una ruta de mensajes específica para un servicio web, incluida cualquier cantidad de intermediarios, y cómo enrutar los mensajes hacia adelante y hacia atrás a lo largo de la ruta especificada.

El protocolo de intercambio extensible de bloques ( BEEP ) de IETF define un protocolo de Internet orientado a la conexión. Se ha definido una asignación SOAP para BEEP Y, EN ESTE CASO, LOS MENSAJES SOAP heredan las cualidades de servicio adicionales de BEEP para mantener el contexto de la sesión en los nodos emisor y receptor. El contexto se puede utilizar para relacionar múltiples mensajes en una unidad de transferencia más grande y para relacionar múltiples mensajes como provenientes de la misma fuente o destinados al mismo destino. El contexto de seguridad y transacción también se puede asociar con una conexión.

<hr>

**NOTA**

BEEP proporciona un protocolo orientado a la conexión

<hr>

Otros estándares y tecnologías relevantes incluyen muchos de los definidos por las siguientes organizaciones:

OASIS , que aloja ebXML en curso y otras propuestas XML relacionadas , como BTP y SAML

RosettaNet, influenciador de los conceptos de servicios web, desarrollado por un grupo de proveedores de productos electrónicos para la interacción de flujos de procesos comerciales B2B a través de Internet

UserLand, desarrollador de XML - RPC , precursor de SOAP

OAGI (Open Applications Group, Inc.), que define formatos de documentos XML canónicos para empresas e industrias

<hr>

**NOTA**

Muchas otras tecnologías y estándares son relevantes para los servicios web.

<hr>

El trabajo de estos y otros grupos a menudo se centra en promover la adopción de XML para fines comerciales específicos, como construir sobre los estándares básicos para definir formatos de documentos y protocolos para las industrias electrónica, financiera, de atención médica y otras. Debido a que los servicios web se basan en XML , el trabajo de casi cualquier organismo o consorcio de estándares que promueva el uso de tecnologías relacionadas con XML para negocios en Internet es relevante. Algunos de los otros trabajos, como BTP y SAML , emergen como tecnología candidata para su adopción por parte del W3C dentro de su actividad de arquitectura de servicios web.

EL LARGO CAMINO POR DELANTE

Las tecnologías adicionales, como la seguridad, las transacciones y la mensajería confiable, que actualmente se encuentran en los entornos informáticos distribuidos existentes, deben definirse nuevamente para los servicios web debido al cambio fundamental involucrado en la infraestructura (XML y HTTP) en la que AHORA deben ESTAR . construido. El World Wide Web Consortium emprenderá el esfuerzo de definir la arquitectura de los servicios web, tal como OMG definió la arquitectura para CORBA , aunque es probable que sea una tarea muy difícil y desalentadora. El W3C no está creado para resolver grandes diferencias de opinión entre sus miembros, especialmente cuando esas diferencias están motivadas por intereses comerciales. Esta es la ruina de muchos esfuerzos de estándares, de hecho.

Enfoques de proveedores de servicios web
Los proveedores de software, tanto grandes como pequeños, ofrecen implementaciones de servicios web como complementos de productos o como productos completamente nuevos.

Los servicios web no cambian fundamentalmente los sistemas de software existentes, aunque pueden cambiar la forma en que se combinan los sistemas de software. Las diferencias en la implementación suelen seguir las diferencias en la filosofía o el enfoque de los proveedores: ¿Son los servicios web una tecnología habilitadora fundamental? ¿O son simplemente puntos de entrada y salida hacia y desde los sistemas de software existentes? En otras palabras, los proveedores varían en su enfoque de los servicios web, dependiendo de la medida en que ven los servicios web como un impacto en las arquitecturas de sistemas de software existentes. Por ejemplo, ¿los servicios web invalidan J2EE o son complementarios? Las respuestas a estas y otras preguntas similares se pueden descubrir en el enfoque de un proveedor.

<hr>

**NOTA**

Los servicios web no cambian los sistemas de software subyacentes

<hr>
Los cinco enfoques básicos de los servicios web son mapearlos

Dentro y fuera de un sistema de gestión de base de datos

Entrada y salida de un servidor de aplicaciones

Dentro y fuera de un corredor de integración

Entre dominios tecnológicos

A bloques de construcción de software arquitectónico o componentes funcionales

En otras palabras, los implementadores de servicios web distinguen fundamentalmente entre tecnologías de servicios web e implementaciones de software subyacentes. Los servicios web, por lo tanto, son aspectos secundarios de los sistemas de software existentes o una parte necesaria de la infraestructura.

¿Puede un servidor de aplicaciones, un agente de solicitud de objetos o un sistema de administración de bases de datos continuar existiendo sin soporte para los servicios web? ¿O pueden existir los servicios web por sí solos?

Entonces la pregunta es, ¿dónde está el valor? ¿Con los servidores de aplicaciones, los sistemas de gestión de bases de datos y los intermediarios de integración, dejando que los servicios web sean simplemente un medio para mapear datos dentro y fuera de los sistemas de software existentes? ¿O reside el valor en los propios servicios web, como fundamentales para una nueva categoría de sistemas de software?

<hr>

**NOTA**

El valor está en el software subyacente o en la capa de servicios web

<hr>

Las implementaciones de proveedores tienden a dividirse entre estas distintas opiniones sobre el valor de los servicios web. No es sorprendente que Microsoft tenga su propia opinión, mientras que Sun Microsystems, IBM, BEA Systems, Oracle y otros están adoptando una visión alternativa. Hasta cierto punto, esta divergencia de puntos de vista o iniciativas de los proveedores representa una continuación de la batalla de los desarrolladores de Visual Basic/Java, pero Microsoft está adoptando una postura muy audaz y agresiva en los servicios web, incluso rompiendo las actuales aplicaciones de Visual Basic para garantizar que el futuro versión de VB apoyará los servicios web como tecnología habilitadora fundamental. La comunidad de Java está adoptando una visión menos radical, extendiendo las API de Java para servicios web en lugar de requerir una reescritura para incorporarlas.

<hr>

**NOTA**

Las opiniones de los proveedores varían, a menudo a lo largo de las líneas de Java/Visual Basic

<hr>

Los consorcios comerciales de la industria, como ebXML y OASIS , así como los productos de intermediarios de integración de proveedores como IBM, Microsoft, IONA y WebMethods, tienden a centrarse en el proceso comercial o en el tipo de aplicaciones orientadas a documentos para servicios web. Los productos de otros proveedores, como los juegos de herramientas de servicios web que se envían con WebLogic de BEA y J2EE Edition de IONA, tienden a centrarse en el estilo de interacción RPC . Las mismas tecnologías y estándares basados ​​EN XML generalmente se pueden usar para cualquiera, pero las iniciativas y los productos tienden a enfocarse en uno u otro porque los paradigmas son muy diferentes. En general, los servidores de aplicaciones tienden a admitir RPC.estilo de interacción, mientras que los intermediarios de integración tienden a admitir el estilo de interacción asíncrono orientado a documentos.

<hr>

**NOTA**

Los productos tienden a centrarse en el RPC o en el estilo asíncrono

<hr>

¿PARA QUÉ SIRVEN LOS SERVICIOS WEB?

La respuesta a esta pregunta puede variar según el proveedor, según el enfoque particular de la implementación de servicios web. Los servicios web generalmente no reemplazan ninguna tecnología existente, sino que son complementarios, otra herramienta en la caja de herramientas, por así decirlo. Los servicios web representan interacciones débilmente acopladas, que son más adecuadas para integrar dominios de software dispares y conectar tecnologías incompatibles, en lugar de aplicaciones pesadas y de alto rendimiento. Los servicios web también son muy buenos para enviar documentos a flujos de procesos comerciales de larga duración, que en cualquier caso parecen ser una buena manera de comenzar con las interacciones a través de Internet.

Los proveedores de intermediarios de integración, como WebMethods, Vitria, SeeBeyond, Software AG y Mercator, suelen ver los servicios web como una extensión de las tecnologías clásicas de integración empresarial y de empresa a empresa y han construido adaptadores para servicios web como lo harían con cualquier adaptador. otra tecnología con la que sus productos tienen que integrarse. Otros proveedores, como IONA, adoptan una visión más neutral y global de los servicios web como tecnología habilitadora para ampliar el servidor de aplicaciones existente, CORBA y el middleware COM y como fundamentales para la próxima generación de estándares de integración empresarial y empresarial. La línea de productos Orbix E2A de IONA proporciona no solo adaptadores de servicios web para procesamiento asíncrono orientado a documentos e interfaces de servicios web orientados a RPC PARAOBJETOS COMPATIBLES CON CORBA y J2EE, pero también componentes básicos de servicios web. El motor de procesos de negocios de IONA, el motor de conversión y transformación de XML , LOS ADAPTADORES DE APLICACIONES EMPAQUETADAS Y EL MARCO DE PROTOCOLO DE NEGOCIOS, TODAS EXPORTAN INTERFACES DE SERVICIOS WEB. Los productos de IONA admiten un enfoque consistente para la integración de aplicaciones, utilizando tecnologías de servicios web dentro y fuera del firewall.

Por último, una serie de proveedores ven los servicios web como una tecnología interesante y potencialmente rentable por derecho propio y han desarrollado productos de servicios web de "juego puro". Estos productos, basados ​​completamente en tecnología de servicios web, generalmente requieren su uso con otras tecnologías y productos. Por ejemplo, Cape Clear comercializa un producto de servicios web destinado a unir J2EE y .NET. Shinka comercializa un producto que supone que los servicios web son un centro de diseño fundamental y que los programas se desarrollarán para mapearlos, en lugar de viceversa, que es lo que la mayoría de los otros proveedores parecen creer.

<hr>

**NOTA**

Algunos proveedores se centran únicamente en los servicios web.

<hr>

Resumen
Los servicios web se están convirtiendo rápidamente en una tecnología importante en la evolución de la web y la computación distribuida. Los servicios web aprovechan la independencia de datos de XML para resolver problemas de integración empresarial, tanto dentro como fuera del firewall. Las interfaces de servicios web son shells o contenedores que se asignan a cualquier tipo de programa de software, sistema de middleware, sistema de administración de base de datos o aplicación empaquetada.

Se están creando nuevos tipos de aplicaciones mediante el uso de bloques de construcción de servicios web estándar, creando así mayores economías de escala en la automatización de las interacciones de empresas y consumidores con la web y entre sí. Las tecnologías de servicios web están cambiando rápidamente y se requiere una larga lista de características y funcionalidades adicionales para completar la visión. Los estándares de servicios web básicos ( SOAP , WSDL y UDDI) son útiles de inmediato para muchas aplicaciones, como la publicación de interfaces para procesos comerciales automatizados, la conexión de dominios de software dispares y la conexión de clientes inalámbricos a funciones web.

La iniciativa ebXML ofrece una visión alternativa de una infraestructura de computación distribuida habilitada para XML , específicamente dirigida a conectar interacciones de procesos comerciales entre socios comerciales de Internet. ebXML representa una forma de servicios web de potencia industrial, aunque ebXML no incluye WSDL o UDDI . Muchos proveedores ven los servicios web y ebXML como aspectos importantes que deben agregarse a sus productos existentes; otros proveedores ven los servicios web como tecnología suficiente en la que basar productos completos.


[1] A lo largo del libro, la convención de diamante en un palo se utiliza para representar una interfaz de servicios web.

[2] Un solo programa lógico puede, por supuesto, comprender múltiples subprogramas.

[3] Un término más genérico, Indicador uniforme de recursos ( URI ), suele aparecer en las especificaciones de los servicios web en lugar de URL . Un URI es un término de sintaxis categórica que incluye el Localizador Uniforme de Recursos ( URL ) y el Nombre Uniforme de Recursos ( URN ). Un URN es un nombre que no hace referencia a un recurso físico. En la práctica, hay poca diferencia entre URI y URL .

[4] Hasta la fecha, 25 es el mayor número de empresas que se han unido a cualquier presentación del W3C. Una presentación es una especificación propuesta para su adopción por parte del W3C; consulte www.w3.org/Submission/2001/07 .

[5] Aunque el esfuerzo original de ebXML finalizó en mayo de 2001, el trabajo continúa en comités específicos DE OASIS (Organización para el Avance de los Estándares de Información Estructurada) y UN / CEFACT para mejorar y ampliar aún más las especificaciones originales de ebXML.

[6] Consulte www.ebxml.org para obtener más información sobre el uso de SOAP por parte de ebXML y otros detalles de la iniciativa ebXML.

[7] Varias propuestas abordan este problema, incluido HTTPR ( HTTP confiable ) y BEEP , un nuevo protocolo orientado a sesiones de IETF ; consulte el Capítulo 7 para obtener más información.
