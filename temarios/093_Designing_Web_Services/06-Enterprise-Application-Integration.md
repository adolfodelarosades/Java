# Capítulo 6. Integración de aplicaciones empresariales

Los sistemas de información empresarial, la colección de sistemas de bases de datos relacionales y heredados, los sistemas de planificación de recursos empresariales (ERP) y los sistemas de procesamiento de transacciones de mainframe, proporcionan la infraestructura de información crítica para los procesos comerciales de una empresa. Estos variados sistemas contienen la información que una empresa necesita para llevar a cabo sus operaciones diarias. Es esencial que las nuevas aplicaciones desarrolladas para una empresa puedan integrarse con estos sistemas de información empresarial (EIS).

La integración de EIS siempre ha sido de gran importancia, y esto ha dado lugar a la integración de aplicaciones empresariales o EAI. EAI permite que una empresa integre sus aplicaciones y sistemas existentes, además de permitir la adición de nuevas tecnologías y aplicaciones. Las empresas deben aprovechar sus sistemas y recursos existentes incluso cuando adoptan nuevas tecnologías. Teniendo en cuenta el costo ya invertido en estos sistemas existentes, ninguna empresa puede darse el lujo de descartarlos. Además, dado que estos sistemas a menudo contienen datos valiosos que necesita la empresa, es probable que la empresa no los interrumpa. Sin embargo, al mismo tiempo, las empresas crecen continuamente y requieren nuevas aplicaciones. Para mantener sus negocios en crecimiento y seguir siendo rentables, las empresas deben integrar sus sistemas existentes con estas nuevas aplicaciones y no reemplazar los sistemas existentes con nuevas aplicaciones escritas desde cero. El surgimiento de arquitecturas basadas en la Web y servicios Web añade ímpetu para que las empresas integren sus EIS y los expongan a la Web.

La aparición de la Web y los servicios Web no es el único factor que impulsa la necesidad de integración. Cada vez más, las empresas se fusionan o adquieren otras empresas. Estas fusiones y adquisiciones suelen implicar la fusión y combinación de dos sistemas de tecnología de la información (TI) divergentes. Los sistemas de TI no solo son diferentes, sino que, como un desafío adicional, cada uno de ellos puede haber estandarizado el uso de diferentes tecnologías de integración dentro de sus respectivos entornos. Los estándares de servicios web emergentes son otro factor que impulsa la EAI basada en servicios web. Estos estándares están haciendo posible la integración de sistemas heterogéneos de forma sencilla y rentable.

En el entorno actual, una empresa típica tiene una multitud de aplicaciones existentes que se ejecutan en diversas plataformas y sistemas operativos. Aunque estas aplicaciones pueden basarse muy bien en los mismos datos o en datos similares, mantienen esos datos en diferentes formatos. Por lo tanto, el problema de la integración abarca tanto las plataformas de datos como las de sistemas.

Estos son solo algunos ejemplos de las complejidades que debe abordar la integración de aplicaciones empresariales. EAI no solo debe manejar la integración de aplicaciones, sino que también debe abordar la integración de datos y tecnologías para que las empresas puedan compartir fácilmente los procesos y datos comerciales.

Utilizando varios escenarios, este capítulo ilustra las consideraciones clave de integración. Describe las tecnologías de la plataforma J2EE 1.4 que ayudan con la integración y presenta algunos enfoques y pautas de diseño de integración.

## 6.1. Requisitos y escenarios de integración
Antes de profundizar en los detalles de las tecnologías, es útil ilustrar las principales preocupaciones para integrar los sistemas de información empresarial y tener una idea del alcance del problema de EAI. Analizamos tres tipos de escenarios de integración: integración de datos, integración de aplicaciones e integración de procesos comerciales. A menudo, las necesidades de integración de una empresa abarcan estos diferentes tipos.

6.1.1. Escenarios típicos de integración
La integración de datos implica la integración de datos existentes que viven en diferentes sistemas empresariales y, a menudo, ocurre cuando una empresa depende de múltiples tipos de sistemas de bases de datos. Por ejemplo, algunos sistemas de bases de datos pueden ser relacionales, otros pueden ser jerárquicos o basados ​​en objetos, y otros pueden estar basados ​​en archivos o incluso en almacenes heredados. A modo de ilustración, un sistema de gestión de pedidos basado en la web recientemente desarrollado podría tener que integrarse con una base de datos de pedidos de clientes existente. La integración de datos implica no solo integrar diferentes sistemas de datos, sino que también implica integrar diferentes modelos de información o datos.

La integración de aplicaciones implica la integración de nuevas aplicaciones con aplicaciones existentes o heredadas. Dado que el negocio de una empresa depende de la continuidad de sus aplicaciones existentes, es importante integrar las nuevas aplicaciones con interrupciones mínimas. La integración con aplicaciones heredadas de cosecha propia presenta un desafío mayor, ya que estos sistemas no tienen capas adaptadoras proporcionadas por el proveedor o listas para usar. No solo tiene que escribir las capas del adaptador usted mismo, sino que estas aplicaciones locales pueden ser más idiosincrásicas, con una arquitectura que es más opaca y difícil de entender.

La integración de procesos comerciales implica la integración de los sistemas existentes de una empresa para respaldar un conjunto de procesos comerciales. Un proceso empresarial es una serie de pasos (a menudo asincrónicos) que juntos completan una tarea o función empresarial. Por ejemplo, la empresa constructora de aventuras tiene un proceso empresarial para cumplir con los pedidos de compra enviados a su centro de procesamiento de pedidos. El proceso comercial de cumplimiento de pedidos incluye pasos tales como validar la tarjeta de crédito de un cliente, comunicarse con varios proveedores para completar diferentes partes de un pedido y notificar al cliente sobre el estado del pedido en varias etapas de procesamiento.

La integración a menudo se logra mediante el intercambio de documentos, que cada vez más son documentos XML, entre procesos comerciales de acuerdo con reglas comerciales definidas. Los diferentes procesos transforman los documentos aplicando sus reglas comerciales individuales y luego enrutan los documentos a otros procesos. Buenos ejemplos son los procesos comerciales que hacen cosas como manejar órdenes de compra y facturas, o incorporar catálogos de proveedores. Cada uno de estos procesos comerciales ejecuta un flujo de trabajo que interactúa con otras entidades, ya sean internas o externas.

6.1.2. Ejemplos de escenarios de integración
Examinar algunos escenarios típicos ayuda a poner estos requisitos de integración en una mejor perspectiva. Usamos los escenarios presentes en nuestro ejemplo empresarial de construcción de aventuras para ilustración. Un escenario de integración común es el de la empresa constructora de aventuras, que puede desear que su inventario esté disponible en línea para expandir su alcance de clientes. La empresa puede tener aplicaciones y bases de datos existentes, por ejemplo, bases de datos de catálogos e inventarios, junto con sistemas de procesamiento de pedidos y gestión de relaciones con los clientes (CRM), para su negocio. Estos sistemas y bases de datos deben mejorarse para adaptarse a la tienda electrónica.

La empresa constructora de aventuras compra y personaliza el paquete de CRM, pero su sistema de procesamiento de pedidos puede ser de cosecha propia. En la medida de lo posible, la empresa desea reducir la duplicación de software y mantener los costos de infraestructura al mínimo. Con ese fin, puede querer usar estos mismos sistemas para manejar el negocio de la tienda electrónica, especialmente porque sus clientes existentes también pueden comprar productos a través de la tienda en línea. La empresa constructora de aventuras también quiere aprovechar su departamento de servicio al cliente y tener estos mismos especialistas que atienden a ambos tipos de clientes: en la tienda y en línea. Adventure builder Enterprise espera incluir bases de datos adicionales relevantes solo para el sitio web.

Este escenario ilustra un problema de integración de aplicaciones y datos. Las bases de datos existentes de la empresa almacenan la información que necesita la tienda electrónica, que puede necesitar actualizar estas bases de datos. Las bases de datos tienen configuraciones de seguridad existentes, además de protocolos para transacciones. El proveedor del sistema CRM puede haber proporcionado un conector J2EE que podría utilizarse para conectar el sistema CRM al servidor de aplicaciones J2EE de la empresa. Sin embargo, el sistema de procesamiento de pedidos, dado que es de cosecha propia, puede no tener ese soporte.

La Figura 6.1 ilustra el escenario de esta aplicación con respecto a los EIS que utiliza. Este escenario de ejemplo toca muchos de los requisitos de integración que pertenecen a todas las empresas. Debido a que está abierto a cualquier persona en Internet, el sitio web del creador de aventuras puede tener potencialmente una gran cantidad de usuarios, lo que hace que la escalabilidad y el rendimiento sean cuestiones importantes. La seguridad es una consideración importante, ya que el sitio web de Adventure Builder maneja datos de clientes que debe mantener en privado. La empresa tiene el desafío adicional de garantizar que sus sistemas heredados no se extiendan más allá de sus capacidades y que las plataformas heterogéneas puedan albergar los sistemas EIS.

Figura 6.1. Un escenario de aplicación



La empresa depende de un centro de cumplimiento de pedidos para procesar los pedidos realizados a través del sitio web de la tienda electrónica. Un departamento separado posee el centro de cumplimiento de pedidos y utiliza su propio conjunto de bases de datos separadas del sitio web de la tienda electrónica. Para mantener los dos modelos de datos desacoplados, los pedidos que fluyen entre la tienda electrónica y el centro de cumplimiento de pedidos se mantienen en formato XML. La comunicación también es asíncrona, lo que permite a los clientes continuar con su propio trabajo mientras se procesa un pedido. En esencia, el centro de cumplimiento de pedidos inicia un proceso comercial cada vez que recibe un pedido. El proceso comercial, siguiendo un conjunto de reglas automatizadas, interactúa con varios sistemas en un flujo de trabajo para completar o cumplir el pedido sin intervención humana.

El centro de cumplimiento de pedidos interactúa con socios comerciales externos para completar su flujo de trabajo. Por ejemplo, el centro de cumplimiento de pedidos puede depender de un servicio de facturación de tarjeta de crédito independiente para procesar la facturación de sus clientes. Algunos de sus productos pueden ser suministrados directamente por otro proveedor. El proceso de cumplimiento de pedidos inicia múltiples procesos comerciales para cada negocio externo con el que interactúa.

Veamos un escenario de integración diferente. Una aplicación de recursos humanos, diseñada solo para uso interno, puede tener un escenario similar a una tienda electrónica, ya que se trata de una nueva aplicación que utiliza activos empresariales existentes. Sin embargo, el uso interno de la aplicación limita los problemas de escalabilidad, rendimiento y seguridad. Las principales preocupaciones con aplicaciones internas como esta son el tiempo de entrega rápido, la heterogeneidad de la plataforma y la capacidad de hacer crecer la aplicación y admitir múltiples tipos de clientes a medida que la empresa se expande. La aplicación también puede querer un inicio de sesión único para los usuarios en varios dominios de seguridad, pero, al mismo tiempo, permitir el acceso solo a los empleados cuyos privilegios de acceso adecuados cumplan con las reglas de toda la empresa.

Las aplicaciones internas también pueden proporcionar algunas funciones móviles limitadas; es decir, deben ser accesibles desde dispositivos móviles como PDA y teléfonos celulares. Por ejemplo, una aplicación de seguimiento de gastos de viaje puede permitir que los empleados que están de viaje realicen un seguimiento de sus registros de gastos. Del mismo modo, las empresas cuyos departamentos están dispersos geográficamente pueden encontrar más eficiente que los empleados utilicen Internet para las comunicaciones internas. Las interfaces de servicios web son particularmente útiles en estas situaciones, aunque existen preocupaciones adicionales de dominios de seguridad múltiples y distribuidos.

A menudo, los sistemas desarrollados para uso interno se basan en sistemas heredados de cosecha propia. Si bien los sistemas comprados a proveedores externos pueden integrarse mediante conectores estándar suministrados por sus proveedores o por terceros, esto no es cierto para los sistemas desarrollados internamente. Estas aplicaciones propias o únicas aún deben integrarse con otras aplicaciones en la empresa y accederse desde un navegador web.

## 6.2. Tecnologías de integración J2EE
Ahora que hemos examinado algunos escenarios de integración comunes, veamos las tecnologías que están disponibles en la plataforma J2EE 1.4 para ayudar con estos problemas. La plataforma J2EE proporciona un conjunto de tecnologías de integración EIS que abordan el problema de integración EIS. Estos incluyen tecnologías de integración de bases de datos relacionales (como JDBC, persistencia administrada por contenedor de tecnología Enterprise JavaBeans y Java Data Objects), tecnologías de mensajería (como Java Message Service y beans controlados por mensajes), tecnologías de acceso EIS (particularmente la arquitectura J2EE Connector) , servicios web y tecnologías XML para manipular documentos.

Examinemos brevemente algunas de las tecnologías de integración disponibles. La sección " Enfoques de diseño de integración " en la página 263 asigna estas tecnologías a diferentes problemas de integración, ilustrando cuándo y cómo usarlas de manera más efectiva.

6.2.1. Tecnologías de integración de bases de datos relacionales
Los sistemas de administración de bases de datos relacionales (RDBMS) son la forma más frecuente de almacenamiento de datos empresariales. La plataforma J2EE proporciona tres tecnologías para integrar datos en RDBMS:

JDBC : los desarrolladores pueden usar las API de JDBC para acceder a datos relacionales en forma tabular.

Persistencia administrada por contenedor (CMP) de Enterprise JavaBeans : los desarrolladores usan la persistencia administrada por contenedor para realizar el mapeo relacional de objetos (O/R). Al asignar los datos de la tabla de la base de datos a los objetos de Java, los desarrolladores pueden manejar una vista de objeto de los datos en lugar de una vista relacional tabular. CMP también encapsula los objetos en componentes administrados de nivel superior con características transaccionales y de seguridad.

Java Data Objects (JDO) : una tecnología de mapeo O/R que genera clases Java en lugar de componentes. Tenga en cuenta que JDO es opcional en la plataforma J2EE 1.4. Dado que es opcional, es posible que su servidor de aplicaciones no admita JDO o que admita JDO de una manera no estándar.

“ Asignación de datos en aplicaciones EAI ” en la página 274 explica cuándo es mejor usar JDBC, beans empresariales o JDO.

6.2.1.1. JDBC
La API de JDBC define una API de Java estándar para la integración con sistemas de bases de datos relacionales. Una aplicación Java utiliza la API de JDBC para obtener una conexión de base de datos, recuperar registros de base de datos, ejecutar consultas de base de datos y procedimientos almacenados y realizar otras funciones de base de datos.

Muchos proveedores de componentes de aplicaciones usan la API de JDBC para acceder a bases de datos relacionales para administrar datos persistentes para sus aplicaciones.

La API de JDBC tiene dos partes: una API de cliente para uso directo de los desarrolladores para acceder a bases de datos relacionales y un contrato estándar a nivel de sistema entre servidores J2EE y controladores JDBC para admitir transacciones y agrupación de conexiones. Los desarrolladores no utilizan directamente el contrato entre los servidores J2EE y los controladores JDBC. Más bien, los proveedores de servidores J2EE utilizan este contrato para proporcionar servicios de transacción y agrupación a los componentes J2EE automáticamente. Tenga en cuenta que, de acuerdo con la especificación JDBC 3.0, los contratos de nivel de sistema JDBC pueden ser los mismos que los contratos de sistema de arquitectura Connector. Conceptualmente, los controladores JDBC son adaptadores de recursos enchufables y se pueden empaquetar como adaptadores de recursos del conector J2EE.

6.2.1.2. Persistencia administrada por contenedor EJB
La persistencia administrada por contenedor (CMP), que es una API de acceso a datos independiente del administrador de recursos para beans de entidad, se ha ampliado y mejorado en la plataforma J2EE 1.4. La tecnología CMP permite que las aplicaciones se integren fácilmente con varias bases de datos o administradores de recursos, además de mejorar la portabilidad.

CMP protege al desarrollador de los detalles del almacén de datos subyacente. El desarrollador no necesita saber cómo persistir o recuperar datos hacia o desde un almacén de datos en particular, ya que el contenedor EJB maneja estas tareas. En cambio, el desarrollador solo necesita indicar qué datos o estado deben almacenarse de manera persistente.

Además, un desarrollador utiliza la misma API, es decir, los métodos EJB CMP, independientemente del tipo de administrador de recursos subyacente. Por lo tanto, el mismo bean de entidad se puede usar con cualquier tipo de administrador de recursos o esquema de base de datos. La tecnología hace posible desarrollar beans empresariales que se pueden personalizar en la implementación para trabajar con datos existentes. Es decir, la misma implementación de bean se puede implementar para trabajar con muchos esquemas de datos de clientes diferentes. El mapeo realizado en la implementación puede variar para la configuración de cada cliente, pero el bean en sí es el mismo. Dado que el contenedor EJB genera un código de acceso a datos adecuado para cada situación, el desarrollador de beans no tiene que saber ni preocuparse por el código específico del administrador de recursos subyacente. Además, dado que tiene control completo sobre la gestión de la persistencia,

La plataforma J2EE 1.4 incluye la especificación EJB y la tecnología CMP más actualizadas. En lugar de declarar variables persistentes en la implementación de un bean, los desarrolladores incluyen métodos de acceso abstractos get y set para variables persistentes. Por lo tanto, las variables persistentes se tratan de manera similar a las propiedades de JavaBeans. Los desarrolladores no proporcionan una implementación para estos métodos de acceso ya que son métodos abstractos; en su lugar, el contenedor EJB proporciona las implementaciones del método.

La arquitectura CMP también incluye relaciones administradas por contenedores, lo que permite que varios beans de entidad tengan relaciones entre ellos. Las relaciones administradas por contenedores se manejan de la misma manera que la persistencia administrada por contenedores. La implementación del bean simplemente proporciona métodos de acceso get y set para estos campos, y el contenedor proporciona las implementaciones del método. De manera similar, el desarrollador especifica las relaciones en el descriptor de implementación.

6.2.1.3. Objetos de datos Java
Java Data Objects (JDO) es una API que proporciona una abstracción de persistencia del modelo Java estándar y basado en la interfaz. Los desarrolladores de aplicaciones pueden utilizar la API de JDO para almacenar directamente las instancias del modelo de dominio de Java en un almacén persistente, como una base de datos. Puede considerar JDO como una alternativa al uso de JDBC o beans empresariales con persistencia administrada por contenedor. Sin embargo, tenga en cuenta que JDO no es estándar en la plataforma J2EE 1.4.

Hay algunos beneficios al usar JDO. Dado que JDO mantiene las aplicaciones independientes o aisladas de la base de datos subyacente, los desarrolladores de aplicaciones pueden centrarse en su modelo de objetos de dominio y no tener que preocuparse por los detalles de persistencia, como el almacenamiento de objetos campo por campo. JDO también asegura que la aplicación utilice las estrategias óptimas de acceso a datos para un mejor rendimiento.

No es inusual comparar JDO con beans empresariales con persistencia administrada por contenedor, ya que ambos brindan capacidades de mapeo relacional de objetos. La principal diferencia es que JDO asigna las relaciones de la base de datos a los objetos simples de Java, mientras que EJB CMP asigna las relaciones a los componentes transaccionales administrados por un contenedor. EJB CMP esencialmente proporciona una capa de servicio más alta que JDO. Algunos servidores de aplicaciones J2EE, como el SDK de la plataforma J2EE 1.4, utilizan internamente JDO para implementar la persistencia gestionada por contenedores de beans empresariales.

6.2.2. Tecnologías de mensajería
Los sistemas de mensajería permiten que las aplicaciones no relacionadas se comuniquen de forma asincrónica y confiable. Las partes que se comunican no solo no tienen que estar estrechamente vinculadas entre sí, sino que también pueden permanecer relativamente anónimas.

La plataforma J2EE proporciona la API de Java Message Service (JMS), que es una API de Java estándar definida para los sistemas de mensajería empresarial. Junto con JMS, la plataforma J2EE también proporciona beans controlados por mensajes. Los beans controlados por mensajes son componentes EJB que consumen y procesan mensajes asincrónicos entregados a través de JMS o algún otro sistema de mensajería.

Echemos un vistazo a las tecnologías de mensajería en general, luego examinemos dos tecnologías específicas de J2EE: Java Message Service y beans controlados por mensajes.

6.2.2.1. Descripción general de las tecnologías de mensajería
Antes de la llegada de los servicios web, los desarrolladores a menudo elegían los sistemas de mensajería (llamados MOM por Message Oriented Middleware) para crear una arquitectura de integración. Con un sistema de mensajería, dos sistemas pueden comunicarse entre sí mediante el envío de mensajes. Dichos mensajes, que se envían de forma asincrónica, normalmente constan de dos partes: una parte, el cuerpo del mensaje, contiene los datos comerciales y la otra parte, el encabezado del mensaje, contiene información de enrutamiento. Dado que los mensajes se envían de forma asíncrona, el remitente no tiene que esperar a que el mensaje se entregue al receptor.

Hay dos estilos de mensajería comunes: punto a punto y publicación y suscripción. Se utiliza un estilo de mensajería punto a punto cuando los mensajes se envían a un solo receptor. El destinatario recibe los mensajes que se le envían a través de una cola configurada específicamente para el destinatario. Un remitente de mensajes envía mensajes a esta cola y el destinatario recupera (y elimina) sus mensajes de la cola. Publicar y suscribirse, por otro lado, está destinado a usarse cuando puede haber múltiples destinatarios de un mensaje. En lugar de una cola, este estilo utiliza un tema. Los mensajes se envían (o, más correctamente, se publican) al tema y todos los receptores interesados ​​en estos mensajes se suscriben al tema. Cualquier mensaje publicado en un tema puede ser recibido por cualquier receptor que se haya suscrito al tema. Consulte la Figura 6.2 .

Figura 6.2. Colas y temas del sistema de mensajería



Además, un sistema MOM típico tiene un enrutador de mensajes que es responsable de garantizar la entrega de mensajes (de acuerdo con la calidad de servicio acordada) al receptor. El enrutador de mensajes utiliza la información del encabezado del mensaje para determinar dónde y cómo enrutar el contenido del mensaje.

Cuando se utiliza para la integración, es muy probable que una empresa requiera que todos los sistemas EIS participantes se comuniquen entre sí mediante el envío de mensajes a través del sistema de mensajería. Como resultado, las empresas suelen estandarizar su sistema MOM con un proveedor y utilizan los adaptadores de ese proveedor para acomodar sus diversos EIS. A cambio, las empresas que utilizan sistemas de mensajería obtienen los beneficios de las llamadas de mensajería asíncronas: los mensajes se ponen en cola y se entregan cuando el sistema de destino está disponible sin restringir el sistema de envío. La asincronía de los sistemas de mensajería significa que las aplicaciones de comunicación no necesitan estar ejecutándose actualmente para recibir mensajes. Esto protege las aplicaciones que se comunican de fallas del sistema y otros tipos de interrupciones parciales, condiciones que no son infrecuentes en situaciones de red.

Los sistemas de mensajería también aportan una calidad dinámica a los sistemas EIS. Los componentes se pueden agregar o quitar a la red sin afectar otros sistemas. Los sistemas no necesitan que sus rendimientos coincidan perfectamente, ya que pueden interactuar con el sistema de mensajería a su propio ritmo. Por ejemplo, si una aplicación envía mensajes más rápido de lo que la aplicación receptora puede recuperar estos mensajes, el sistema de mensajería mantiene estos mensajes en la cola indefinidamente. Como resultado, se logra un buen rendimiento general ya que cada parte del sistema puede funcionar a su capacidad óptima.

Además, la tecnología de mensajería se considera una tecnología bastante madura. La mayoría de los sistemas MOM brindan una serie de características de calidad de servicio, como entrega confiable una vez y solo una vez, balanceo de carga, escalabilidad, tolerancia a fallas y soporte transaccional.

Sin embargo, la naturaleza propietaria de los sistemas MOM da como resultado algunas desventajas significativas. Dado que utilizan protocolos propietarios en la red, suele ser más difícil mezclar y combinar productos MOM de diferentes proveedores. Aunque los sistemas de mensajería desacoplan al emisor y al receptor y permiten que las partes que se comunican se ejecuten en diferentes plataformas de hardware y software, no logran una verdadera interoperabilidad porque vinculan a los desarrolladores con sus API patentadas para enviar y recibir mensajes. Como resultado, los desarrolladores de aplicaciones deben personalizar sus aplicaciones para diferentes sistemas MOM.

6.2.2.2. Servicio de mensajes de Java
La API de Java Message Service (JMS), una API de Java estándar definida para los sistemas de mensajería empresarial, se puede utilizar en diferentes tipos de sistemas de mensajería. Una aplicación Java utiliza la API de JMS para conectarse a un sistema de mensajería empresarial. Una vez conectada, la aplicación utiliza las funciones del sistema de mensajería empresarial subyacente (a través de la API) para crear mensajes y comunicarse de forma asíncrona con una o más aplicaciones del mismo nivel.

Para la plataforma J2EE 1.4, JMS incluye algunas mejoras. En particular, la adición de interfaces comunes le permite utilizar la API de JMS para que no sea específica de un dominio punto a punto o de publicación-suscripción. Un proveedor de JMS también puede utilizar la arquitectura del conector J2EE para integrarse más estrechamente con un servidor de aplicaciones. (La sección “ Tecnologías de acceso EIS ” en la página 259 analiza la arquitectura del conector J2EE).

En muchos sentidos, JMS es para los sistemas de mensajería lo que JDBC es para los sistemas de bases de datos. Así como JDBC proporciona una interfaz estándar para muchos sistemas de bases de datos, JMS proporciona una API estándar para los sistemas MOM. De hecho, JMS cambió la naturaleza propietaria de los sistemas MOM al proporcionar una API de Java estándar que interactúa con cualquier sistema MOM. El desarrollador ahora escribe en esta API estándar en lugar de API individuales y propietarias. La plataforma J2EE simplificó aún más, e hizo más portátil, la integración de un sistema MOM con un servidor de aplicaciones J2EE.

Similar a su soporte para JDBC, la plataforma J2EE ha agregado soporte para JMS para un estilo operativo orientado a la conexión: los desarrolladores pueden buscar una fábrica y una conexión de la misma manera. Al igual que JDBC, JMS admite transacciones y puede continuar transacciones JTA iniciadas por un componente web o EJB.

6.2.2.3. Beans controlados por mensajes
Los beans controlados por mensajes, que son componentes EJB que reciben mensajes empresariales entrantes de un proveedor de mensajería, contienen la lógica para procesar estos mensajes. La lógica empresarial de un bean controlado por mensajes, que puede incluir el inicio de un flujo de trabajo, la realización de un cálculo o el envío de un mensaje, puede estar impulsada por el contenido del mensaje en sí o simplemente por la recepción del mensaje.

Los beans controlados por mensajes son particularmente útiles en situaciones en las que los mensajes deben entregarse automáticamente y se desea una mensajería asíncrona. Permiten que las aplicaciones se integren de forma débilmente acoplada, pero aún confiable. Los beans controlados por mensajes también son útiles cuando la entrega de un mensaje debe ser el evento que inicia un proceso de flujo de trabajo o cuando un mensaje específico debe desencadenar una acción posterior.

Cuando una aplicación produce y envía un mensaje a una cola o tema de destino de mensajes en particular, el contenedor EJB activa el bean controlado por mensajes correspondiente (del conjunto de beans controlados por mensajes disponibles). La instancia del bean activado consume el mensaje del destino del mensaje. Dado que no tienen estado, cualquier instancia de un tipo coincidente de bean controlado por mensaje puede manejar el mensaje.

La implementación de un bean controlado por mensajes es sencilla. El desarrollador del bean amplía la interfaz javax.ejb.MessageDrivenBean y una interfaz de escucha de mensajes para el bean; la interfaz de escucha de mensajes corresponde al sistema de mensajería de la empresa. Para las empresas que utilizan JMS, el desarrollador amplía la interfaz javax.jms.MessageListener . Un desarrollador puede incrustar lógica de negocios para manejar mensajes particulares dentro de los métodos de MessageListener . Por ejemplo, cuando un bean controlado por mensajes consume mensajes JMS, el desarrollador codifica la lógica comercial de manejo de mensajes dentro del método onMessage . Cuando un mensaje apropiado para este bean llega al destino de un mensaje, el contenedor EJB invoca el onMessage del bean controlado por mensajes.método.

Con beans controlados por mensajes, puede hacer que la invocación del bean sea parte de una transacción. Es decir, puede asegurarse de que la entrega del mensaje desde el destino del mensaje al bean controlado por mensajes sea parte de cualquier trabajo transaccional posterior iniciado por la lógica del bean. Si se producen problemas con la lógica subsiguiente que hace que la transacción se revierta, la entrega del mensaje también se revierte y el mensaje se vuelve a entregar a otra instancia del bean controlado por mensajes.

6.2.3. Tecnologías de acceso EIS
La plataforma J2EE 1.4 incluye la arquitectura J2EE Connector, una tecnología diseñada específicamente para acceder a los sistemas de información empresarial (EIS). La arquitectura Connector simplifica la integración de diversos EIS en la plataforma, ya que cada EIS puede usar el mismo adaptador de recursos único para integrarse con todos los servidores J2EE compatibles.

La arquitectura J2EE Connector proporciona una arquitectura estándar para integrar aplicaciones J2EE con EIS y aplicaciones existentes, y en particular para la integración de datos con bases de datos no relacionales. La arquitectura Connector permite conectar adaptadores para EIS externos al servidor de aplicaciones J2EE. Las aplicaciones empresariales pueden usar estos adaptadores para admitir y administrar una comunicación bidireccional segura, transaccional y escalable con EIS. El proveedor de EIS sabe que su adaptador funcionará con todos los servidores de aplicaciones compatibles con J2EE y que el servidor compatible con J2EE puede conectarse a varios EIS. Consulte la Figura 6.3 .

Figura 6.3. Sistema de arquitectura de conectores y contratos
[Ver imagen a tamaño completo]


La versión anterior de la arquitectura Connector se centró en la integración síncrona con los EIS, mientras que la versión actual, que forma parte de J2EE 1.4, amplía esta funcionalidad básica para admitir la integración asíncrona. Es decir, admite la integración basada en mensajes entrantes y salientes que es independiente del protocolo.

Un adaptador de recursos es un componente J2EE que implementa la API del conector para un EIS específico. La comunicación entre una aplicación J2EE y un EIS se produce a través de este adaptador de recursos. En cierto sentido, piense en un adaptador de recursos como un controlador JDBC, ya que proporciona una API estándar para el acceso entre el servidor J2EE y el recurso externo.

La arquitectura J2EE Connector, a través de sus contratos, establece un conjunto de reglas para la integración EIS. El servidor de aplicaciones J2EE y un adaptador de recursos EIS colaboran, a través de un conjunto de contratos a nivel de sistema, para mantener la seguridad, las transacciones y los mecanismos de conexión transparentes para los componentes de la aplicación. Los componentes de la aplicación y los adaptadores de recursos se basan en el contrato de nivel de aplicación para su comunicación.

El contrato de nivel de aplicación define la API utilizada por un cliente para acceder a un adaptador de recursos para un EIS. Esta API puede ser la interfaz de cliente común (CCI), que es una API genérica para acceder a varios EIS heterogéneos, o puede ser una API específica del adaptador de recursos.

El lanzamiento inicial de la arquitectura Connector, que forma parte de la plataforma J2EE 1.3, estableció tres contratos a nivel de sistema, de la siguiente manera:

Contrato de administración de conexiones : admite la agrupación de conexiones a un EIS subyacente, un requisito importante para las aplicaciones escalables.

Contrato de gestión de transacciones : admite transacciones locales y globales y permite la gestión de transacciones (globales) en varios EIS.

Contrato de administración de seguridad : permite intercambios seguros entre un EIS y un servidor de aplicaciones J2EE y protege los recursos administrados por EIS.

La versión más reciente (versión 1.5) de la arquitectura Connector amplió las capacidades de los adaptadores de recursos. Esta versión amplió el soporte de transacciones para un adaptador de recursos. Anteriormente, una transacción tenía que comenzar desde un bean empresarial en el servidor de aplicaciones J2EE y permanecía vigente durante las operaciones en el EIS. Ahora, las transacciones pueden comenzar en el EIS e importarse al servidor de aplicaciones. La arquitectura del conector J2EE especifica cómo propagar el contexto de la transacción desde el EIS al servidor de aplicaciones. La arquitectura del conector también especifica la función del contenedor para completar una transacción y cómo debe manejar la recuperación de datos después de un bloqueo.

La versión actual también especifica contratos a nivel de sistema adicionales a los tres contratos iniciales que se acaban de mencionar. Estos nuevos contratos son:

Contrato de "capacidad de conexión" de mensajería : amplía las capacidades de los beans controlados por mensajes para que puedan manejar mensajes de cualquier proveedor de mensajes en lugar de limitarse a manejar solo mensajes JMS. Al seguir las API para el manejo y la entrega de mensajes especificadas en este contrato, un EIS o un proveedor de mensajes puede conectar su propio proveedor de mensajes personalizado o patentado en un contenedor J2EE. JAXM es un buen ejemplo de este tipo de proveedor de mensajes.

Contrato de administración de trabajo : permite que el servidor de aplicaciones J2EE administre subprocesos para el adaptador de recursos, lo que garantiza que los adaptadores de recursos utilicen los subprocesos correctamente. Cuando un adaptador de recursos utiliza subprocesos de forma incorrecta, como cuando crea demasiados subprocesos o no los libera, puede causar problemas en todo el entorno del servidor de aplicaciones. El manejo deficiente de subprocesos por parte de un adaptador de recursos puede inhibir el apagado del servidor y afectar el rendimiento. Para paliar este problema, el contrato de gestión del trabajo permite que el servidor de aplicaciones agrupe y reutilice subprocesos, de forma similar a la agrupación y reutilización de conexiones.

Además, el contrato de administración de trabajo brinda a los adaptadores de recursos más flexibilidad para usar subprocesos. El adaptador de recursos puede especificar el contexto de ejecución de un subproceso. El contrato permite que un subproceso solicitante se bloquee (detenga su propia ejecución) hasta que se complete un subproceso de trabajo. O bien, un subproceso solicitante puede bloquearse mientras espera obtener un subproceso de trabajo; cuando el servidor de aplicaciones proporciona un subproceso de trabajo, tanto el subproceso de solicitud como el de trabajo se ejecutan en paralelo. Otra opción más, un adaptador de recursos puede enviar el trabajo del subproceso a una cola y hacer que se ejecute en algún momento posterior; el adaptador continúa su propia ejecución sin esperar más. Por lo tanto, un adaptador de recursos y un subproceso pueden ejecutarse juntos o de forma independiente, utilizando un mecanismo de escucha, si es necesario, para notificar al adaptador de recursos que el subproceso de trabajo ha finalizado.

Contrato de gestión del ciclo de vida : permite que un servidor de aplicaciones gestione el ciclo de vida de un adaptador de recursos. Con este contrato, el servidor de aplicaciones tiene un mecanismo para iniciar una instancia de adaptador de recursos en la implementación o en el inicio del servidor, y para notificar a la instancia del adaptador cuando no está implementada o cuando el servidor se está cerrando.

6.2.4. Servicios Web y Tecnologías XML
Aunque los sistemas de mensajería brindan muchas de las mismas ventajas de EAI que los servicios web, los servicios web van un paso más allá. Principalmente, los servicios web admiten múltiples proveedores y la capacidad de atravesar firewalls utilizando los estándares de Internet. Los servicios web también admiten un formato XML flexible.

La plataforma J2EE 1.4 proporciona un amplio conjunto de API de servicios web y tecnologías de manipulación de documentos XML. Las API de servicios web (JAX-RPC, JAXR, SAAJ, JAXB y JAXP) proporcionan API de Java estándar para integrar aplicaciones y otros sistemas. Una aplicación Java puede usar estas API para obtener y usar un servicio web. Estas API son particularmente útiles cuando una aplicación o sistema expone una capa de servicios web explícitamente con fines de integración.

También hay una serie de API e instalaciones relacionadas con XML en el lenguaje Java (y la plataforma J2EE 1.4) que se pueden aplicar a los problemas de integración. Le permiten definir un modelo de datos de interfaz, manipular documentos dispares y realizar transformaciones entre tipos de datos. Estas API XML le brindan la capacidad de estructurar un modelo de datos para pasar datos entre diferentes sistemas.

El Capítulo 2 analiza estas tecnologías con mayor profundidad.

## 6.3. Enfoques de diseño de integración
La plataforma J2EE 1.4 proporciona varias tecnologías para la integración y puede combinarlas para que se ajusten a sus requisitos de integración. Estas tecnologías, junto con las otras capacidades de la plataforma, le brindan una plataforma rica para diseñar una solución de integración. Los arquitectos de TI enfrentan el desafío de combinar las tecnologías de la manera más eficaz y flexible posible para crear una arquitectura de integración que pueda adaptarse a las cambiantes necesidades y estrategias comerciales.

A menudo, las empresas intentan la integración como una solución única, es decir, tratan cada problema de integración como una instancia única con su propia solución especial. Con este tipo de enfoque, una empresa integra cada sistema de manera individual y personalizada, no es el enfoque de integración más eficiente o efectivo. Es mucho mejor tener una arquitectura de integración que crezca con las necesidades de la empresa. La plataforma J2EE, con su amplio soporte para servicios web, hace posible esta arquitectura. Un servidor de aplicaciones J2EE actúa como conector universal entre los sistemas EIS y las nuevas aplicaciones EAI. (Este capítulo usa el término aplicaciones EAI para referirse a aplicaciones especialmente diseñadas para resolver los problemas de integración de aplicaciones empresariales). En cierto sentido, el servidor de aplicaciones J2EE es el centro de integración.La figura 6.4 muestra cómo podría verse esto desde un nivel alto.

Figura 6.4. Servidor de aplicaciones J2EE como centro de integración



Una buena arquitectura de integración consta de un conjunto de "capas de integración", cada una de las cuales proporciona cierta calidad de servicios. Por capa de integración nos referimos a la interfaz o punto final en el que se cruzan distintos sistemas. Los arquitectos empresariales y los desarrolladores de software deben decidir cómo implementar estas diversas capas de integración de la manera más adecuada. Generalmente, los requisitos de cada situación impulsan la elección de la capa de integración. Por ejemplo, la empresa constructora de aventuras utiliza servicios web como capa de integración para su cadena de suministro. Como resultado, todas las interacciones con sus proveedores deben ocurrir a través de las interfaces del servicio web.

La capa de integración define la interfaz entre los sistemas EIS y las nuevas aplicaciones, exponiendo así un sistema EIS a una aplicación.

Una capa de integración debe ser el punto estable en su sistema, el estándar fijo contra el cual se programan las nuevas aplicaciones. Si bien tanto la nueva aplicación como el EIS existente pueden cambiar, la capa de integración debe permanecer igual. De lo contrario, los cambios en un lugar requerirán cambios en numerosos sistemas dependientes.

Los enfoques de integración varían y, a menudo, la situación dicta el mejor enfoque. En algunas situaciones, el enfoque de integración es bastante obvio. Por ejemplo, cuando un cliente requiere una interacción estrechamente acoplada con una base de datos relacional, claramente la API de JDBC es la estrategia de diseño a utilizar. De manera similar, otra estrategia de diseño utiliza la arquitectura J2EE Connector para la integración de datos con bases de datos no relacionales. Estas dos estrategias de diseño son particularmente apropiadas cuando el cliente requiere una API para conectar, consultar y actualizar una base de datos con semántica transaccional. Otras situaciones requieren que combine tecnologías para cumplir con los requisitos de integración. Puede usar conectores sobre una base de datos no relacional, pero luego, según los requisitos del cliente, puede agregar una capa de servicio web sobre el conector.

Es útil ver el proceso de formulación de un enfoque de integración como tres tareas separadas (cada una requiere una fase de diseño e implementación):

Decida la capa de integración, incluido dónde debe ubicarse y qué forma debe tomar. Con la plataforma J2EE, son posibles varias capas de integración, incluidos conectores, beans empresariales, JMS y servicios web. Recuerde que desea que la capa de integración sea tal que otras aplicaciones o sistemas puedan evolucionar fácilmente.

Decidir cómo adaptar cada EIS a la capa de integración.

Decida cómo escribir nuevas aplicaciones contra estas capas de integración.

Tenga en cuenta que una razón importante para usar una capa de integración son los servicios que proporciona para la distribución. Por lo general, los EIS están ubicados en diferentes máquinas físicas o pueden ejecutarse como procesos separados. Para integrar estos EIS, debe utilizar una tecnología distribuida. Los servidores de aplicaciones J2EE son una excelente opción para la integración porque pueden manejar múltiples protocolos para computación distribuida: Internet Inter-ORB Protocol (IIOP), mensajería, HTTP y servicios web. Además, los servidores de aplicaciones J2EE pueden manejar protocolos EIS nativos a través de conectores. Estos protocolos nativos incluyen protocolos propietarios utilizados por ERP y proveedores de bases de datos, entre otros.

La Figura 6.5 muestra los enfoques de diseño de integración que son posibles con las tecnologías J2EE.

Figura 6.5. Enfoques de diseño de integración EIS



Nota : esta figura usa líneas discontinuas para representar llamadas asíncronas, como enviar un mensaje JMS. Las líneas continuas muestran llamadas síncronas, que se realizan a través de EJB o API de servicios web. Las tres aplicaciones, que se muestran en el lado izquierdo del diagrama, son nuevas aplicaciones EAI que podría estar escribiendo. El lado derecho del diagrama muestra algunos de los sistemas EIS existentes que deben integrarse con las aplicaciones EAI.

Dado que requiere un acoplamiento muy estrecho con EIS A, la aplicación EAI 1 pasa por alto el servidor de aplicaciones J2EE pero reutiliza la capa del conector. La aplicación 2 necesita usar alguna lógica comercial presente en el servidor de aplicaciones. Como resultado, no desea acceder directamente al EIS. En su lugar, la aplicación 2 utiliza una combinación de llamadas síncronas y asíncronas al nivel EJB. Estas llamadas (a beans empresariales y beans controlados por mensajes) acceden a EIS A ya la base de datos relacional a través de JDBC, persistencia administrada por contenedor EJB o conectores. EIS B también genera mensajes asincrónicos para implementar la lógica comercial y estos mensajes deben entregarse a un bean controlado por mensajes. La aplicación 3 utiliza la interfaz menos acoplada, los servicios web, y accede a la funcionalidad disponible a través de una interfaz de servicio web. El servicio web utiliza internamente la lógica empresarial almacenada en el servidor de aplicaciones J2EE. (En las siguientes secciones, analizamos más de cerca estos diferentes enfoques de diseño de EAI y luego brindamos algunas pautas para implementar estos enfoques).

Veamos cómo puede aplicar esta estrategia a la empresa constructora de aventuras. La empresa constructora de aventuras decide utilizar varias capas para la integración:

Los servicios web como capa de integración para su cadena de suministro.

Los servicios web como capa de integración para la comunicación entre diferentes departamentos. Por ejemplo, el sitio web del constructor de aventuras utiliza un servicio web para enviar un pedido al centro de procesamiento de pedidos.

Componentes EJB/JMS como capa de integración con EIS. El centro de procesamiento de pedidos integra EIS dentro de su departamento utilizando JMS. Por lo tanto, el centro de procesamiento de pedidos cumple un pedido utilizando tecnologías JMS y EJB para integrar sus diversos sistemas EIS, gestión de relaciones con el cliente, sistemas de facturación, etc.

6.3.1. Enfoque de servicios web
Un enfoque para EAI es utilizar un servicio web como capa de integración. Con este enfoque, los sistemas EIS de una empresa exponen su funcionalidad mediante la implementación de servicios web. Hacen que sus interfaces de servicios web estén disponibles para otras aplicaciones proporcionando descripciones WSDL de ellas. Además, la capa de integración también puede incluir esquemas XML para los documentos utilizados como parámetros y valores de retorno. Esencialmente, la descripción WSDL de la interfaz de servicio y los esquemas de documentos se convierte en la capa de integración o el punto de estabilidad.

Los desarrolladores que utilizan el enfoque de servicios web para la integración pueden aprovechar las ventajas de los servicios web. Los desarrolladores pueden escribir nuevas aplicaciones empresariales con cualquier tecnología que admita servicios web y las aplicaciones pueden ejecutarse en una variedad de plataformas de hardware y software. Sin embargo, este enfoque se queda corto cuando las nuevas aplicaciones tienen ciertos requisitos adicionales, como la semántica transaccional o requisitos de seguridad estrictos. Discutimos cómo manejar estos problemas en secciones posteriores.

La aplicación Adventure Builder es un buen ejemplo del enfoque de servicios web. Como se señaló, la empresa constructora de aventuras utiliza servicios web para integrar su cadena de suministro. ( El Capítulo 8 analiza la estructura exacta de la aplicación, pero aquí destacamos los detalles relacionados con la integración.) Los arquitectos del constructor de aventuras deciden, en consulta con los proveedores, los esquemas de los documentos que pretenden intercambiar. (Consulte “ Diseño de esquemas XML específicos de dominio ” en la página 131.) Dado que su negocio depende de este intercambio de documentos: la aplicación Adventure Builder envía órdenes de compra a varios proveedores que cumplen con las solicitudes de aventuras y, a su vez, los proveedores facturan a Adventure Builder: la empresa Adventure Builder y los proveedores deben acordar esquemas. que describen el contenido de estos documentos. Por ejemplo, un proveedor de alojamiento podría usar un esquema de documento de factura. El ejemplo de código 6.1 muestra un documento de ejemplo correspondiente a ese esquema. Se definen esquemas similares para otros tipos de proveedores, como proveedores de actividades y líneas aéreas.

Ejemplo de código 6.1. Factura de proveedor de alojamiento
<?versión xml="1.0" codificación="UTF-8"?>
<Factura xmlns="http://java.sun.com/blueprints/ns/invoice"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://java.sun.com/blueprints/ns/invoice http://java.sun.com
/blueprints/schemas/invoice-lodging.xsd">
   <ID>1234</ID>
   <OPCPoId>AB-j2ee-1069278832687</OPCPoId>
   <SupplierId>LODGING_INVOICE</SupplierId>
   <estado>COMPLETADO</estado>
   <HotelId>LODG-6</HotelId>
   <Dirección del hotel>1234 Main Street, Sometown 12345, EE. UU.
   </Dirección del hotel>
<CancelPolicy>No cancelaciones 24 horas antes</CancelPolicy>
</Factura>

De manera similar, los arquitectos estandarizan el WSDL para usar en las facturas al cumplir con un pedido. Los proveedores, como aerolíneas, hoteles y proveedores de actividades, utilizan estos esquemas y descripciones WSDL cuando interactúan con la empresa creadora de aventuras. El ejemplo de código 6.2 muestra el WSDL para el extremo del servicio web al que los proveedores envían sus facturas.

El WSDL que se muestra en el Ejemplo de código 6.2 proporciona una única operación, submitDocument , que tiene un único parámetro xsd:anyType que representa el documento XML de la factura y que devuelve un único valor de cadena que indica una confirmación. El uso de xsd:anyType permite que un punto final reciba varios tipos de documentos de factura con un solo método. Consulte " Intercambio de documentos XML " en la página 107 . Un documento WSDL normalmente comienza con las definiciones de tipo que utiliza, como el tipo de excepción InvalidDocumentException. (Para abreviar, el ejemplo de código omite estas definiciones de tipo). El código WSDL luego describe los mensajes SOAP utilizados en las llamadas de solicitud y respuesta SOAP que corresponden al método de envío de documentos . También describe un puerto WSDL correspondiente a la interfaz JAX-RPC para recibir facturas, además vincula el puerto al protocolo HTTP e indica el enlace RPC-literal. Finalmente, el código WSDL define el nombre del servicio y la URL en la que está disponible el servicio. (Para obtener una explicación más detallada de un documento WSDL, consulte “ Lenguaje de descripción de servicios web ” en la página 36 ).

Ejemplo de código 6.2. WSDL para recibir las facturas
<?versión xml="1.0" codificación="UTF-8"?>
<definiciones nombre="WebServiceBroker" targetNamespace= ...>
   ...
   <nombre del mensaje="BrokerServiceIntf_submitDocument">
      <parte nombre="Factura" tipo="xsd:anyType"/></mensaje>
   <nombre del mensaje="BrokerServiceIntf_submitDocumentResponse">
      <parte nombre="resultado" tipo="xsd:cadena"/></mensaje>
   <mensaje nombre="InvalidDocumentException"><parte nombre=
          Elemento "Excepción de documento no válido" =
          "tns:Excepción de documento no válido"/>
   </mensaje>
   <portType name="BrokerServiceIntf">
      <operación nombre="enviarDocumento" parámetroPedido="Factura">
         <mensaje de entrada="tns:BrokerServiceIntf_submitDocument"/>
         <mensaje de salida
            ="tns:BrokerServiceIntf_submitDocumentResponse"/>
         <nombre de error="Excepción de documento no válido" mensaje=
                       "tns:Excepción de documento no válido"/>
      </operación>
   </tipo de puerto>
   <binding name="BrokerServiceIntfBinding" type=
                            "tns:BrokerServiceIntf">
      ...
   </enlace>
   <nombre del servicio="WebServiceBroker">
      ...
   </servicio>
</definiciones>

Aunque puede modificar los sistemas EIS que participan en las interacciones del servicio web para exportar las interfaces del servicio web, un mejor enfoque utiliza un conector J2EE para conectar el sistema EIS al servidor de aplicaciones J2EE. El conector, por su naturaleza, no interfiere en el EIS. Esta última estrategia aprovecha las capacidades del servidor J2EE. Entre otras ventajas, el uso de conectores permite que los contextos transaccionales y de seguridad de un servidor de aplicaciones J2EE se transfieran a la aplicación EIS. Además, el EIS puede utilizar los grupos de subprocesos del servidor de aplicaciones. Junto con los conectores, utiliza JAX-RPC del servidor de aplicaciones J2EE para exponer una interfaz de servicio web. Consulte la Figura 6.6 .

Para exponer una interfaz de servicio web para un EIS, utilice JAX-RPC delante de un conector.

Figura 6.6. Uso de JAX-RPC y conectores



Por ejemplo, la empresa constructora de aventuras quiere utilizar los servicios web para integrar su sistema CRM existente, que proporciona servicios para gestionar las relaciones con los clientes y procesar pedidos. El departamento que posee el módulo CRM no solo quiere mantener el control del software, sino que también quiere usar una interfaz genérica que pueda manejar las solicitudes de los usuarios desde múltiples fuentes (sitio web, teléfono, canales OEM, etc.). Los servicios web son la mejor manera de crear una interfaz genérica de este tipo, por las siguientes razones:

Los servicios web establecen límites claros y definidos. Dado que los servicios web pueden proporcionar una interfaz con límites de responsabilidades claros y definidos, el departamento de CRM tiene la responsabilidad de mantener únicamente el punto final y publicar un WSDL que describa el punto final.

Los servicios web proporcionan acceso controlado. Las solicitudes externas al CRM deben ingresar a través de la interfaz de servicio, y el departamento de CRM puede aplicar sus parámetros de control de acceso para limitar el acceso, además puede registrar cada acceso.

Los servicios web admiten múltiples plataformas. Debido a que no controla las plataformas de hardware y software que utilizan otros departamentos, el departamento de CRM puede adaptarse a cualquier plataforma mediante el uso de servicios web.

La generación actual de servicios web es más adecuada para aplicaciones con una necesidad limitada de transacciones y seguridad. El objetivo principal del sistema CRM es permitir consultas de estado sobre pedidos existentes. Como tal, tiene poca necesidad de transacciones. También tiene una necesidad limitada de seguridad, ya que todo acceso al módulo ocurre dentro del firewall corporativo.

Los desarrolladores pueden elegir entre tipos de puntos finales para implementar el servicio web que representa el EIS: un punto final de servicio EJB o un punto final de servicio JAX-RPC basado en web. Únicamente desde el punto de vista de la integración, cualquier tipo de punto final funciona bien, ya que los componentes Web y EJB pueden usar directamente conectores JDBC y J2EE. Por ejemplo, la empresa creadora de aventuras recibe facturas utilizando un punto final de servicio EJB, así como puntos finales de servicio JAX-RPC para otras funciones.

Volviendo al problema de CRM, la empresa constructora de aventuras podría usar una pequeña aplicación J2EE que usa un conector J2EE para conectarse al sistema CRM. Una aplicación de este tipo debe tener un punto final JAX-RPC para exponer la funcionalidad del servicio web requerida.

Hoy en día, dado que muchos proveedores de EIS brindan soporte de servicios web incorporados, los desarrolladores pueden usar conectores y aprovechar este soporte directamente para evitar escribir un contenedor JAX-RPC. Si elige seguir esta ruta, asegúrese de que el proveedor de EIS proporcione un servicio web compatible con el perfil básico de WS-I. Si el proveedor no lo hace, considere escribir una capa de adaptador usted mismo para manejar cualquier diferencia. Este enfoque puede requerir actualizar su sistema EIS a una nueva versión de software, un riesgo que tal vez no quiera correr. En tales casos, considere usar los conectores recomendados y el enfoque JAX-RPC.

Considere utilizar el soporte de servicios web integrado proporcionado por los proveedores de EIS para evitar escribir interfaces adicionales.

6.3.2. Enfoque Enterprise Beans y JMS
Puede utilizar beans empresariales y capas JMS, por separado o combinadas, para desarrollar una capa de integración. Con este enfoque, utiliza un servidor de aplicaciones J2EE para proporcionar una capa de bean empresarial para interacciones sincrónicas. Para las interacciones asincrónicas, coloca un bus de mensajes en la empresa y requiere que las aplicaciones lo utilicen.

La empresa constructora de aventuras utiliza esta estrategia para integrar aplicaciones dentro de un departamento. Por ejemplo, un solo departamento posee el módulo de procesamiento de pedidos. Dentro de ese departamento, diferentes grupos manejan varios aspectos del procesamiento de pedidos, como los pagos con tarjeta de crédito, las interacciones de la cadena de suministro, las relaciones con los clientes, etc. En este arreglo de flujo de trabajo, las interacciones entre estos grupos departamentales se manejan de manera asíncrona y débilmente acoplada usando JMS. Cuando necesita proporcionar acceso síncrono, un grupo puede usar una interfaz de bean empresarial remota. (Consulte la Figura 8.3 en la página 345 ).

El uso de beans empresariales y JMS no excluye el uso de XML, que es un beneficio adicional. Por ejemplo, la empresa constructora de aventuras utiliza el mismo documento de factura que se muestra en el ejemplo de código 6.1 cuando envía un mensaje JMS dentro de su centro de procesamiento de pedidos. El bean controlado por mensajes que recibe el mensaje JMS aplica la validación XML y la lógica de traducción como cualquier punto final de servicio web.

6.3.3. El enfoque del conector
Cuando se utilizan conectores, la nueva aplicación EAI se programa directamente contra una interfaz proporcionada por el EIS. Para aplicaciones nuevas que también son aplicaciones J2EE, utilice un conector para acceder al EIS. Puede comprar un conector listo para usar o escribir uno propio.

Si desea proporcionar una capa de aislamiento simple, debe considerar escribir un objeto de acceso a datos, o clase DAO, para ocultar los detalles internos del EIS. Un objeto de acceso a datos encapsula el acceso a datos persistentes, como los almacenados en un sistema de gestión de datos. Desvincula al usuario del objeto del mecanismo de programación para acceder a los datos subyacentes. También puede exponer una API más fácil de usar. Por lo general, usted desarrolla una clase de acceso a datos para una función comercial específica o un conjunto de funciones, luego las aplicaciones cliente usan estas clases. Otro uso común es superponer objetos de acceso a datos sobre conectores o adaptadores de recursos, aislando así las aplicaciones de los detalles de las interacciones del conector. A menudo, cada interacción del adaptador de recursos tiene un objeto de acceso a datos correspondiente,

El uso de un conector reduce la complejidad de la capa de integración. Tenga en cuenta que cuando se utiliza el enfoque del conector, la aplicación EAI está estrechamente relacionada con el EIS, ya que la aplicación utiliza directamente el modelo de datos y la funcionalidad del EIS. Dado que hay capas mínimas, también aumenta el rendimiento. Sin embargo, es un enfoque que funciona mejor cuando el problema de integración tiene un alcance pequeño. Dado que no establece una verdadera arquitectura de integración, este enfoque puede limitar la capacidad de escalar la capa de integración a medida que crece la empresa. Dadas estas ventajas y desventajas, considere usar este enfoque como un componente básico para otras estrategias.

6.3.4. Combinación de enfoques en una arquitectura de integración
En muchos casos, los arquitectos combinan estas diversas capas de integración en una sola arquitectura de integración. El resultado final, la combinación de tipos de capas de integración, depende en gran medida de los requisitos de la situación de cada empresa. Los arquitectos deben considerar las realidades del estado actual de las tecnologías y compararlas con las promesas futuras.

Por ejemplo, los servicios web, tal como existen hoy en día, tienen algunas deficiencias: no ofrecen las capacidades de integración de procesos, transformación de datos y seguridad de servicio pesado que requieren muchos escenarios de EAI. Del mismo modo, los servicios de integridad transaccional y mensajería confiable aún no están implementados. Dado que la seguridad y la propagación del contexto transaccional son requisitos comerciales críticos, estos son factores importantes a considerar cuando se utiliza un enfoque de servicios web.

El enlace de datos es otro tema a considerar. Los servicios web son una buena solución cuando los requisitos de vinculación de datos son sencillos, como la asignación de tipos de datos simples a tipos de datos Java. Sin embargo, cuando sea necesario manipular binarios o relacionales complejos desde un EIS, es posible que desee considerar otras soluciones, como usar la arquitectura J2EE Connector, que proporciona una función de metadatos para descubrir dinámicamente el formato de datos en el EIS.

La tabla 6.1 compara estos enfoques para diferentes problemas de integración e indica los enfoques más adecuados para estos problemas de integración. La empresa de creación de aventuras utiliza servicios web para las interacciones entre socios y entre departamentos, y el enfoque de beans empresariales con JMS (EJB/JMS) para las interacciones entre departamentos.

Tabla 6.1. Comparación de diferentes enfoques de integración
Operación	Enfoque del conector	Enfoque EJB / JMS	Enfoque de servicios web
Acoplamiento con EIS	Acoplamiento estrecho. Utiliza el modelo de datos EIS directamente.	Puede agregar una capa de abstracción en la capa EJB/JMS.	Sin acoplamiento de plataforma de hardware/software. Puede agregar varias capas de abstracciones y traducciones.
Soporte transaccional	Disponible	Propagación de contexto declarativa y automática	La propagación de transacciones globales no está disponible actualmente. La implementación del punto final puede usar transacciones para la lógica empresarial.
Soporte de operaciones asincrónicas	La plataforma J2EE 1.4 agrega capacidades asíncronas a los conectores.	Los beans controlados por mensajes proporcionan una abstracción fácil de usar para recibir eventos asíncronos de los EIS.	Actualmente no hay soporte asíncrono. WSDL proporciona un mecanismo primitivo para llamadas unidireccionales, aunque la calidad del servicio es baja.
Actuación	más alto	Gastos generales debido a llamadas remotas y requisitos para ejecutar un servidor.	Gastos generales significativos debido a las llamadas remotas, los requisitos para ejecutar un servidor y el procesamiento y la validación de XML.
Soporte de plataforma heterogénea	Requiere que el cliente esté programado en Java.	Requiere un servidor de aplicaciones J2EE (disponible en una amplia gama de plataformas de hardware/software).	Compatible con una variedad de plataformas de hardware/software.
Características de seguridad	Puede integrarse directamente con el modelo de seguridad de EIS.	Proporciona mecanismos de seguridad del servidor de aplicaciones.	Limitado. Se admite HTTPS.



## 6.4. Directrices de integración de datos
Recuerde que los datos empresariales pueden almacenarse en varios tipos de almacenes de datos, incluidas bases de datos relacionales, bases de datos no relacionales, servidores de directorio, etc. Algunas estrategias comunes que ayudan a integrar datos de estos diferentes tipos de almacenes de datos son el mapeo de datos, la transformación de datos y el filtrado de datos.

6.4.1. Mapeo de datos en aplicaciones EAI
Las empresas utilizan varios tipos de almacenes de datos para almacenar datos, y cada uno de esos almacenes de datos conserva los datos de acuerdo con su propio diseño y utilizando sus propios tipos de datos. Esto es cierto incluso dentro de una sola empresa. Por lo tanto, hay muchas representaciones externas variadas de datos. A menudo, las representaciones de datos externos son de naturaleza relacional porque la mayoría de los datos se almacenan en una base de datos relacional. Las aplicaciones EAI necesitan saber cómo acceder a estos datos. Es importante asignar datos externos a las estructuras de datos utilizadas dentro de una aplicación EAI.

Un tema importante a considerar al integrar fuentes de datos es decidir sobre una capa de mapeo. En general, tiene estas opciones para los datos relacionales:

Cree un modelo de datos formal orientado a objetos.

Cree una capa genérica de soporte de datos.

El modelo de datos formal orientado a objetos se basa en tecnologías de mapeo relacional de objetos para mapear datos de fuentes de datos relacionales a un formato orientado a objetos. Puede utilizar tecnologías de mapeo como la persistencia administrada por contenedor de Enterprise JavaBeans, Java Data Objects o incluso la estrategia de objetos de acceso a datos. Hay una serie de ventajas en esta opción. Por un lado, puede aprovechar las ventajas tradicionales de un enfoque orientado a objetos, en particular la reutilización, ya que establece una capa de mapeo que otras aplicaciones pueden reutilizar. Cuando utiliza la tecnología de persistencia administrada por contenedor EJB, también puede confiar en las características de seguridad del contenedor EJB para controlar el acceso a los datos. También aprovecha los beneficios de rendimiento del motor de persistencia administrado por contenedor EJB, que utiliza el almacenamiento en caché de datos para mejorar el rendimiento. Finalmente,

La otra opción para representar datos relacionales es crear una capa genérica para contener los datos. Para este enfoque, utiliza las API de JDBC para manejar datos de orígenes de datos relacionales. La tecnología JDBC RowSet , en particular, facilita el acceso a datos relacionales de manera eficiente. (Sin embargo, tenga en cuenta que la tecnología JDBC RowSet aún no es estándar en la plataforma J2EE). La tecnología RowSet , a través de WebRowSetfunción, le ofrece una vista XML de la fuente de datos. Sus capacidades de CachedRowSet le permiten acceder a los datos de manera desconectada, mientras que las funciones de FilteredRowSet le brindan la capacidad de administrar los datos de manera desconectada, sin necesidad de un soporte pesado de DBMS. Al usar una capa genérica para contener datos, tiene un diseño más simple, ya que no hay capas reales y evita el peso conceptual de un modelo de datos formal. Este enfoque puede tener un mejor rendimiento, especialmente cuando el acceso es de naturaleza tabular (como cuando se seleccionan varios atributos de todas las filas que coinciden con una condición particular).

Para acceder a los datos almacenados en fuentes de datos no relacionales, es mejor usar conectores.

Los conectores le permiten conectar fuentes de datos no relacionales al entorno J2EE. Para los sistemas no relacionales que no tienen conectores prefabricados disponibles, como los sistemas desarrollados internamente, debe escribir su propio conector. Consulte " Integración de sistemas heredados personalizados " en la página 283 .

6.4.2. Transformación de datos
La transformación de datos, la capacidad de convertir datos a un formato de aplicación aceptable, es un requisito común para las aplicaciones más nuevas que necesitan acceder a datos heredados. Dicha funcionalidad de transformación es necesaria porque la mayoría de los sistemas heredados no fueron diseñados para manejar los requisitos de estas aplicaciones posteriores.

Para ilustrar, un sistema heredado puede almacenar fechas utilizando un formato de número entero de ocho dígitos; por ejemplo, almacenar la fecha 23 de septiembre de 2003 como 20030923 . Otra aplicación que acceda a este sistema heredado necesita la misma fecha con el formato MM/DD/AAAA o 23/09/2003 . La aplicación necesita acceder a la fecha de ocho dígitos del sistema heredado y transformarla a un formato utilizable.

Otro ejemplo de transformación de datos podría involucrar datos de clientes. Los datos del cliente abarcan una variedad de información y pueden incluir información de identidad y dirección, así como información de crédito y pedidos anteriores. Diferentes sistemas pueden estar interesados ​​en diferentes partes de estos datos del cliente y, por lo tanto, cada sistema puede tener una noción diferente de un cliente.

Incluso los esquemas, incluidos los esquemas estándar de la industria, como el Intercambio electrónico de datos para administración, comercio y transporte (EDIFact), Universal Business Language (UBL) y RosettaNet, deben transformarse entre sí. A menudo, las empresas necesitan utilizar estos formatos estándar de la industria para las comunicaciones externas y, al mismo tiempo, utilizar formatos propietarios para las comunicaciones internas.

Una forma de resolver el problema de la transformación de datos es exigir que todos los sistemas utilicen el mismo formato de datos estándar. Desafortunadamente, esta solución no es realista ni práctica, como lo ilustra el problema Y2K de convertir la representación de un año calendario de dos dígitos a cuatro dígitos. Aunque pasar de dos a cuatro dígitos debería ser un cambio menor, el costo de solucionar este problema fue enorme. Los arquitectos de sistemas deben vivir con la realidad de que las transformaciones de datos llegaron para quedarse, ya que diferentes sistemas inevitablemente tendrán diferentes representaciones de la misma información.

Una buena estrategia para la transformación de datos es utilizar el modelo de datos canónico.

Una empresa puede configurar un modelo de datos canónicos para toda la empresa o modelos separados para diferentes aspectos de su negocio. Esencialmente, un modelo de datos canónico es un modelo de datos independiente de cualquier aplicación. Por ejemplo, un modelo canónico podría usar un formato estándar para las fechas, como MM/DD/YYYY . En lugar de transformar los datos del formato de una aplicación directamente al formato de otra aplicación, transforma los datos de las diversas aplicaciones que se comunican a este modelo canónico común. Usted escribe nuevas aplicaciones para usar este formato común y adapta los sistemas heredados al mismo formato.

Use XML para representar un modelo de datos canónico.

XML proporciona un buen medio para representar este modelo de datos canónico, por varias razones:

XML, a través de un lenguaje de esquemas, puede representar tipos rigurosamente. Al usar XML para representar su modelo canónico, puede escribir varios esquemas que definen sin ambigüedades el modelo de datos. Antes de XML, muchas veces se establecían modelos de datos canónicos, pero sus desarrolladores nunca los documentaban. Si tuvo suerte, los desarrolladores podrían haber descrito el modelo en un documento de texto. Era fácil que un documento de este tipo no estuviera sincronizado con los tipos reales utilizados por el modelo.

Los esquemas XML son exigibles. Puede validar un documento XML para asegurarse de que se ajusta al esquema del modelo de datos canónico. Un documento de texto no puede imponer el uso de los tipos adecuados.

XML es más fácil de convertir a una forma alternativa mediante el uso de medios declarativos como las hojas de estilo.

XML es neutral tanto para la plataforma como para el lenguaje de programación. Por lo tanto, puede tener una variedad de sistemas que utilicen el mismo modelo de datos canónicos sin necesidad de una plataforma o un lenguaje de programación específicos.

Esto no implica que XML sea perfecto, ya que existen algunas desventajas en el uso de XML para representar un modelo canónico. Por un lado, para usar XML necesita aprender el lenguaje de esquemas XML (XSL) o usar una buena herramienta. A menudo, la transformación de XML requiere el uso de XSL, que no es un lenguaje fácil de aprender, especialmente porque XSL es diferente de los lenguajes de programación tradicionales. También hay gastos generales de rendimiento con XML. Sin embargo, para muchas configuraciones empresariales (y especialmente para propósitos de integración) los beneficios de usar XML superan sus desventajas, y los beneficios de XML se vuelven más significativos cuando se toman en cuenta los costos de mantenimiento futuros.

El ejemplo de código 6.3 muestra un documento XML que representa la información de la factura. Este podría ser el modelo canónico de una factura utilizada por la empresa constructora de aventuras. Dado que este documento se publica internamente, todas las aplicaciones nuevas que requieran este tipo de datos pueden utilizarlo.

Ejemplo de código 6.3. Documento XML con información de factura
<?versión xml="1.0" codificación="UTF-8"?>
<bpi:Factura
   xmlns:bpi="http://java.sun.com/blueprints/ns/factura"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://java.sun.com/blueprints/ns/
       factura http://java.sun.com/blueprints/schemas/
       factura.xsd">
   <bpi: Id. de factura>1234</bpi:Id. de factura>
   <bpi:OPCPoId>AB-j2ee-1069278832687</bpi:OPCPoId>
   <bpi:IdProveedor>LODGING_FACTURA</bpi:IdProveedor>
   <bpi: estado>COMPLETADO</bpi:estado>
</bpi:Factura>

Por lo general, es una buena idea proporcionar el esquema para el modelo de datos canónico. Al tener el esquema disponible, puede validar los documentos traducidos con él y las aplicaciones más nuevas pueden usar el esquema para definir sus propios modelos. El ejemplo de código 6.4 muestra el archivo de esquema XSD para esta información de factura.

Ejemplo de código 6.4. Esquema XSD para información de factura
<?versión xml="1.0" codificación="UTF-8"?>
<xsd:esquema
     xmlns:xsd="http://www.w3.org/2001/XMLSchema"
     targetNamespace="http://java.sun.com/blueprints/ns/invoice"
     xmlns="http://java.sun.com/blueprints/ns/factura"
     elementFormDefault="calificado">
  <xsd:nombre del elemento="Factura" tipo="TipoFactura"/>
  <xsd:complexType name="TipoFactura">
       <xsd:secuencia>
           <xsd:nombre del elemento="IdFactura" tipo="xsd:cadena"/>
           <xsd:nombre del elemento="OPCPoId" tipo="xsd:cadena"/>
           <xsd:nombre del elemento="Id del proveedor" tipo="xsd:cadena"/>
           <xsd:nombre del elemento="estado" tipo="xsd:cadena"/>
       </xsd:secuencia>
  </xsd:tipocomplejo>
</xsd:esquema>

Además del formulario XML, la representación del modelo canónico puede ser necesaria en el formulario de objeto Java . A menudo, se necesita el formulario de objeto Java , por ejemplo, cuando se escribe una cantidad sustancial de lógica comercial en el servidor de aplicaciones J2EE. Para usar la forma canónica para código nuevo, convierta los tipos de datos canónicos (de un esquema XML a Java o viceversa) en objetos Java. Es decir, utiliza los documentos XML o sus representaciones de objetos Java como punto de integración estable. (Consulte “ Enfoque de servicios web ” en la página 266 .) Por ejemplo, el Ejemplo de código 6.5 muestra las clases Java equivalentes para el modelo canónico de información de facturas.

Ejemplo de código 6.5. Equivalentes de clases de Java para información de facturas canónicas
Factura de clase pública {
   cadena pública getInvoiceId();
   dirección pública getOPCPoId();
   cadena pública getSupplierId();
   cadena pública getStatus();
   // implementación de la clase...
}

Una vez que se define el XML, también puede usar herramientas como JAXB para generar las clases de Java. (Consulte “ Asignación flexible ” en la página 148 ).

Después de establecer un modelo de datos canónico, debe diseñar una estrategia para convertir cualquier representación de datos alternativa a este modelo. Debido a que conecta sus sistemas empresariales (facturación, procesamiento de pedidos y CRM) a través de un servidor de aplicaciones, la empresa creadora de aventuras expone el modelo de datos canónico solo a través de las interfaces externas expuestas por el servidor de aplicaciones. Es decir, solo aquellos componentes con interfaces externas (aplicaciones de servicios web, beans empresariales remotos, etc.) exponen el modelo de datos canónico. Dado que el mundo externo necesita (y ve) solo el modelo de datos canónicos, la empresa constructora de aventuras debe transformar sus representaciones de datos internos, que tienen su propio modelo de datos diseñado por sus diversos EIS, a este mismo modelo canónico.

La traducción de datos entre las representaciones internas y externas se puede realizar antes de que los datos pasen del EIS al servidor de aplicaciones, es decir, el servidor de aplicaciones utiliza internamente el modelo de datos canónicos, que generalmente se recomienda. O bien, la traducción de datos puede tener lugar justo antes de enviar los datos al mundo externo, es decir, el servidor de aplicaciones utiliza las representaciones de datos nativas de los diversos EIS. A veces, la lógica comercial requiere este último enfoque porque la lógica necesita conocer el formato nativo preciso. La traducción se logra de una de dos maneras:

Utilice hojas de estilo XSL para transformar estas representaciones de datos alternativas, ya sea cuando los datos entran o cuando salen. Las hojas de estilo XSL funcionan para interfaces basadas en XML. En este enfoque, el servidor de aplicaciones utiliza internamente los formatos nativos de EIS y la traducción se produce justo antes de que los datos salgan al mundo exterior o entren desde el exterior.

Utilice un enfoque de fachada y realice un mapeo programático de objetos en la capa DAO. Es decir, configura un DAO para conectar un EIS al servidor de aplicaciones. Escriba el DAO para que exponga solo el modelo de datos canónicos y haga que asigne cualquier dato entrante al modelo de datos interno adecuado. Dado que este enfoque convierte los datos entrantes al formato canónico cuando los datos llegan al servidor de aplicaciones, la lógica empresarial utiliza internamente la representación de datos canónicos.

Para comprender el enfoque de la hoja de estilo XSL, consideremos cómo la empresa constructora de aventuras recibe las facturas de varios proveedores. En el caso de Adventure Builder, varios proveedores envían facturas y cada proveedor puede tener una representación diferente (es decir, un formato diferente) de la información de la factura. Además, los diversos EIS de Adventure Builder pueden tener cada uno una representación diferente de la misma información de factura. El ejemplo de código 6.6 muestra un ejemplo de la factura de un proveedor típico.

Ejemplo de código 6.6. Ejemplo de información de factura de proveedor
<?versión xml="1.0" codificación="UTF-8"?>
<Factura xmlns="http://java.sun.com/blueprints/ns/invoice"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation=
       "http://java.sun.com/blueprints/ns/factura
          http://java.sun.com/blueprints/schemas/
          factura-alojamiento.xsd">
   <ID>1234</ID>
   <OPCPoId>AB-j2ee-1069278832687</OPCPoId>
   <SupplierId>LODGING_INVOICE</SupplierId>
   <estado>COMPLETADO</estado>
   <HotelId>LODG-6</HotelId>
   <Dirección del hotel>1234 Main Street, Sometown 12345, EE. UU.
   </Dirección del hotel>
<CancelPolicy>No cancelaciones 24 horas antes</CancelPolicy>
</Factura>

Compare esta lista de información de factura con la del modelo canónico de Adventure Builder, que se muestra en el ejemplo de código 6.3 . El constructor de aventuras puede convertir una factura de este proveedor a su modelo de datos canónicos aplicando en la capa de interacción del servicio web la hoja de estilo que se muestra en el ejemplo de código 6.7 . La hoja de estilos define reglas, como las de plantillas coincidentes ( <xsl:template match-...> ), que se aplican a la factura del proveedor y al fragmento XML correspondiente cuando se genera el modelo canónico.

Ejemplo de código 6.7. Hoja de estilo para convertir factura de proveedor a modelo canónico
<xsl:versión de hoja de estilo='1.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transformar'
    xmlns:bpi='http://java.sun.com/blueprints/ns/factura'>
     <xsl:template match="text()"/>
     <xsl:coincidencia de plantilla="@*"/>
     <xsl:template match="bpi:Factura">
      <bpi:Factura xmlns:xsi=
           "http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation=
          "http://java.sun.com/blueprints/ns/factura
          http://java.sun.com/blueprints/schemas/invoice.xsd">
       <xsl:apply-templates/>
      </bpi:Factura>
     </xsl:plantilla>
     <xsl:template match="bpi:ReferenciaFactura">
           <bpi:InvoiceId><xsl:value-of select="text()"/>
   </bpi:IdFactura>
     </xsl:plantilla>
     <xsl:template match="bpi:OPCPoId">
         <bpi:OPCPoId><xsl:value-of select="text()"/></bpi:OPCPoId>
     </xsl:plantilla>
     <xsl:template match="bpi:Id. de proveedor">
          <bpi:IdProveedor><xsl:value-of select="text()"/>
          </bpi:IdProveedor>
     </xsl:plantilla>
     <xsl:template match="bpi:Estado">
           <bpi:estado><xsl:valor-de-selección="texto()"/></bpi:estado>
     </xsl:plantilla>
</xsl:hoja de estilo>

La aplicación Adventure Builder aplica la hoja de estilo cuando se envía una factura a un proveedor. Consulte “ Reutilizar y agrupar analizadores y hojas de estilo ” en la página 188 para obtener más información sobre la agrupación de hojas de estilo.

Las fachadas de transición, que se pueden aplicar a cualquier representación de objetos de datos, son una solución más general para las transformaciones. Puede usar fachadas de transición para ocultar información adicional o para proporcionar mapeos simples. Para usar una fachada, escribe una clase de Java dentro de la cual realiza asignaciones y transformaciones de datos manuales.

También debe considerar usar una de las muchas herramientas disponibles para transformaciones de datos. Estas herramientas simplifican la tarea de transformación de datos y facilitan su mantenimiento.

Cuando los datos están en un documento XML, es más fácil escribir hojas de estilo XSL que realicen las transformaciones requeridas.

Cuando accede a los datos mediante la persistencia administrada por contenedor EJB, puede modificar directamente las clases persistentes administradas por contenedor o escribir fachadas para realizar las transformaciones necesarias.

6.4.3. Filtrado de datos
Cuando no tiene acceso al código de una aplicación, como aplicaciones empaquetadas disponibles en el mercado o aplicaciones que no se pueden modificar porque son fundamentales para el funcionamiento de un sistema comercial, puede considerar usar el filtrado. Es decir, usted construye un filtro que se ubica frente a la aplicación y realiza todas las traducciones de datos necesarias.

En general, el filtrado de datos va de la mano con las transformaciones de datos. Debido a que debe admitir todos los casos de uso dentro de una empresa, el modelo de datos canónicos suele ser un buen candidato para el filtrado. Dado que muchas aplicaciones no necesitan acceso a todos los campos de datos, puede filtrar datos y simplificar el desarrollo de aplicaciones y mejorar el rendimiento al reducir la cantidad de datos que se intercambian.

Hay dos tipos de filtrado, y cada uno tiene sus propios casos de uso:

Filtrado que oculta información pero la guarda para su uso posterior

Filtrado que genera solo la información necesaria

Por ejemplo, en la empresa Adventure Builder, un administrador de flujo de trabajo recibe las facturas enviadas por los diferentes proveedores. Dado que solo necesita un identificador para identificar el flujo de trabajo asociado con la factura, el administrador de flujo de trabajo puede filtrar el documento para recuperar solo esta información. Sin embargo, dado que es posible que deba pasar la factura completa (todos los campos de datos de la factura) al siguiente paso del flujo de trabajo, el administrador de flujo de trabajo debe conservar el documento completo. El administrador de flujo de trabajo puede lograr esto mediante el mapeo flexible. (Consulte “ Asignación flexible ” en la página 148 ).

Por otro lado, es posible que desee aplicar el filtrado de datos antes de enviar información. Por ejemplo, un componente de procesamiento de tarjetas de crédito de un flujo de trabajo puede necesitar enviar información de crédito. El componente debe enviar solo la información requerida para la protección de la privacidad y debe usar el filtrado de datos para eliminar la información que no necesita pasarse a otra aplicación.

El filtrado también se puede aplicar a nivel de la base de datos. Mediante el filtrado, puede obtener una vista simplificada de los datos adaptados a una aplicación en particular. Además, el uso de persistencia administrada por contenedor EJB para la transformación de datos facilita el filtrado de datos. Las herramientas de mapeo de persistencia administradas por contenedor le permiten seleccionar un subconjunto del esquema de la base de datos, y esto es análogo al filtrado. Si está utilizando el enfoque JDBC RowSet, solo necesita seleccionar las columnas para los datos que le interesan.

También puede escribir fachadas que filtren adecuadamente los datos. En este caso, el código de cliente accede a los datos solo a través de estas fachadas.


## 6.5. Directrices para la integración
Ahora que hemos examinado los enfoques y técnicas de diseño de integración, veamos algunas pautas para integrar aplicaciones empresariales con sistemas EIS.

Examinamos las pautas para la integración de sistemas heredados, particularmente los sistemas locales, y las pautas para el uso de beans de comando. Aunque no es tan común, mencionamos pautas para lograr la integración mediante el uso de metadatos, registros y control de versiones y evolución.

6.5.1. Integración de sistemas heredados personalizados
La mayoría de las empresas tienen EIS propios o personalizados, también conocidos como sistemas únicos, y estos sistemas deben integrarse. Como ya hemos visto, los conectores son la mejor solución para integrar EIS en un entorno J2EE. Sin embargo, debido a que se trata de sistemas personalizados, no hay conectores listos para usar o proporcionados por proveedores disponibles para ellos, como los hay para los EIS conocidos. Como resultado, es posible que deba escribir su propio conector para un EIS local. La forma recomendada de escribir un conector es utilizar una herramienta de creación de conectores. Una herramienta como esta no solo genera un conector, sino que (con la ayuda de otros servicios de servidor de aplicaciones J2EE) también puede crear una capa de servicios web.

Generalmente, hay dos escenarios que implican la integración de sistemas personalizados. En un caso, dos sistemas EIS deben interactuar entre sí. El enfoque del conector funciona bien con este tipo de escenario: simplemente escribe clases de Java que implementan la lógica comercial para un EIS y usa un conector para comunicarse con el otro sistema EIS. En el segundo escenario, pretende que varias aplicaciones utilicen un EIS personalizado. Para este caso, es mejor conectar el EIS personalizado al servidor de aplicaciones y exponer la lógica empresarial reutilizable del EIS a través del servidor de aplicaciones. Puede exponer la lógica mediante el uso de beans empresariales con JMS o mediante un enfoque de servicios web. Si la situación lo justifica, puede utilizar Enterprise Beans con JMS y un enfoque de servicios web juntos.

6.5.2. Uso de raspado de pantalla para la integración
Hay momentos en los que puede querer integrar un EIS que no tiene interfaz de programación. A menudo, esto sucede con las aplicaciones de mainframe heredadas. En estos casos, puedes recurrir al screen scraping para crear una interfaz de programación. Con el raspado de pantalla, escribe una capa de adaptador que actúa como un usuario final que ingresa datos en la aplicación de mainframe, y esta capa de adaptador sirve como interfaz de programación. Luego escribe un conector que usa esta interfaz de programación para realizar sus acciones de integración.

Cuando recurra al raspado de pantalla, asegúrese de tener en cuenta las limitaciones del sistema heredado. Aunque puede integrar una nueva aplicación a un sistema heredado, el sistema original tiene limitaciones que pueden hacer que no pueda manejar la nueva funcionalidad. Por ejemplo, suponga que usó el raspado de pantalla para integrar una aplicación de front-end con una aplicación de mainframe diseñada para ser interactiva. La aplicación front-end, dado que no tiene restricciones humanas, puede enviar repentinamente un gran volumen de solicitudes a la aplicación de mainframe, que puede no haber sido diseñada para manejar tal carga. Es difícil detectar un problema como este hasta el tiempo de ejecución, cuando el sistema de repente se ve abrumado por un gran volumen de solicitudes. En este punto del ciclo de desarrollo, puede ser bastante costoso arreglar la aplicación.

6.5.3. metadatos
Los metadatos son información que describe las características de un conjunto de datos. Para un sistema EIS, los metadatos describen el contenido, la calidad y la condición (entre otras características) de los datos del EIS.

Los EIS proporcionan un rango de acceso a estos metadatos. Algunos EIS brindan acceso programático a sus metadatos, mientras que otros brindan la información de los metadatos solo en forma de texto, como una forma de documentación. A veces, la información de los metadatos está disponible a través de las herramientas de soporte del sistema de base de datos. Por ejemplo, algunas bases de datos permiten consultas para conocer los nombres y esquemas de sus tablas. De manera similar, un EIS puede darle acceso a sus diversos parámetros de calidad de servicio.

Los metadatos suelen ser relevantes para la integración. Los metadatos le permiten usar herramientas para descubrir las propiedades de los sistemas empresariales y, a partir de este descubrimiento, crear fachadas apropiadas y fáciles de usar para los sistemas. Al tener acceso a los metadatos, las herramientas pueden generar clases más significativas.

Los servicios web están diseñados para admitir metadatos. Los servicios web se basan en archivos WSDL, que esencialmente proporcionan metadatos que describen los servicios, las operaciones que ofrecen los servicios, los parámetros para estas operaciones, etc. Dado que estos archivos WSDL son documentos XML, son accesibles para herramientas y otros programas. (Consulte “ Lenguaje de descripción de servicios web ” en la página 36 ).

El uso de una capa de integración ayuda a que los metadatos sean más explícitos. Cuando los metadatos se asocian implícitamente con los datos EIS, las herramientas pueden tener dificultades para descubrir los metadatos. Por ejemplo, una columna de la tabla de una base de datos puede representar distancias desde un punto determinado y estas distancias se miden implícitamente en millas. Es posible que una herramienta que acceda a los datos de esta columna de la tabla no pueda determinar si la distancia se mide en millas o kilómetros. Al crear una capa de integración, puede hacer que esta información sea explícita. Puede nombrar los métodos que acceden a los datos de tal manera que indique los metadatos asociados. Por ejemplo, en lugar de tener un método getDistance , puede llamar al método getDistanceInMiles. Para los servicios web, los formatos de documentos estándar que describen el servicio están diseñados para que los metadatos sean más explícitos.

Otra forma de hacer que los metadatos sean explícitos y accesibles, especialmente para medianas y grandes empresas, es almacenar los metadatos en una ubicación central, como un directorio LDAP tradicional. (LDAP, que significa Protocolo ligero de acceso a directorios, es un protocolo de Internet que los programas pueden usar para buscar información de un servidor). Puede hacer que los metadatos de su EIS estén disponibles para otros de varias maneras. Puede habilitar la compatibilidad con metadatos en sus sistemas empresariales. El archivo WSDL que acompaña a un servicio web ya define los metadatos para el servicio. También puede proporcionar métodos específicos que recuperan metadatos relacionados con la calidad de los servicios, restricciones de parámetros, etc. Publicar un esquema para un documento que acepta un servicio es otra forma de proporcionar metadatos.

Cuando decida qué información almacenar en un directorio, intente almacenar datos que sean útiles para más de una aplicación. El almacenamiento de metadatos en un directorio también ayuda si necesita analizar el impacto de cualquier cambio en la aplicación.

Además, considere implementar el uso compartido de datos basado en directorios, ya que esto permite que las aplicaciones operen de manera colectiva. Dicho intercambio de datos reduce los costos de administración y mejora la capacidad de respuesta general de una empresa al cambio comercial. Si utiliza este enfoque, asegúrese de configurar políticas de autorización para controlar el acceso a los datos.

También es importante cuando se utiliza un servicio de directorio para ubicar fuentes autorizadas o confiables de los datos. Una de las principales razones para no utilizar un servicio de directorio son los datos obsoletos o sospechosos. Los usuarios aprenden rápidamente que no pueden confiar en el servicio y, por lo tanto, dejan de usarlo. Tenga en cuenta, sin embargo, que una sola aplicación o base de datos rara vez tiene autoridad para todos los datos requeridos, y esto puede causar un problema de integración de datos propio.

6.5.4. Uso de registros para la integración
Es posible que desee considerar el uso de registros para integrar una aplicación con un EIS existente, especialmente cuando desea un enlace flexible entre la aplicación y los sistemas con los que está integrado. Por ejemplo, en el enfoque de servicios web, puede almacenar la URL y el WSDL para el servicio web en un registro UDDI. Sin embargo, el uso de un registro conlleva la sobrecarga adicional de ejecutar y mantener un servidor de registro y la complejidad de programación adicional para que su aplicación use el registro. El servidor de registro también puede ser un único punto de falla para su sistema.

Generalmente, no vale la pena usar registros para una pequeña empresa cuyas aplicaciones se integran con solo unos pocos EIS. Los registros tienen más sentido para arquitecturas de integración medianas y grandes. Desea maximizar el uso del registro entre tantas aplicaciones como sea posible.

6.5.5. Versionado y Evolución
Las aplicaciones integradas con los EIS cambian con el tiempo, al igual que los EIS. A medida que estos sistemas y aplicaciones evolucionan a lo largo de su vida, surgen nuevas versiones de ellos. La integración de las aplicaciones y los EIS debe ser capaz de manejar este proceso de evolución y control de versiones.

Muchas aplicaciones empresariales cambian debido a cambios en los requisitos comerciales subyacentes. Los EIS también cambian por razones similares, pero también pueden cambiar debido a actualizaciones de hardware y software y correcciones de errores. Se puede agregar una nueva funcionalidad a las aplicaciones y retirar la funcionalidad existente. A veces, las políticas cambian y, como resultado, las aplicaciones deben acceder a los EIS de una manera diferente.

En general, es más fácil evolucionar los diversos componentes (las aplicaciones empresariales y los EIS) que evolucionar la capa de integración, ya que es el punto de estabilidad. Primero veamos algunas estrategias para evolucionar los EIS y luego analicemos cómo evolucionar los diferentes tipos de capas de integración.

A veces, a medida que evoluciona, los cambios en un EIS son solo internos. La funcionalidad externa, la funcionalidad visible para otras aplicaciones, sigue siendo la misma. Cuando este sea el caso, debe esforzarse por mantener sin cambios la interfaz externa original especificada en la capa de integración. Para hacer esto, realice el tipo de cambios en la implementación interna del EIS que no afecten la interfaz externa; es decir, se debe cambiar la implementación interna para que se adapte a la interfaz externa original.

Es diferente cuando evoluciona la capa de integración. Una forma de manejar esto es usar una capa de transformación, que es una capa adicional agregada para permitir que las aplicaciones más antiguas continúen funcionando. Una capa de transformación acepta mensajes en el estilo antiguo que usan estas aplicaciones y los transforma al formato actual. A menudo, debido a su menor acoplamiento, es más fácil desarrollar capas de integración que sean servicios web que otros tipos de capas de integración.

Cuando controla ambos extremos del punto de integración (el extremo de los servicios web y el cliente), a menudo es más fácil actualizarlos al mismo tiempo. Cuando solo cambia la implementación interna del servicio web, y estos cambios no afectan la interfaz externa, simplemente conecta la nueva implementación.

Los cambios de implementación interna en el servicio web que provocan cambios en la interfaz externa pueden ser relativamente más fáciles de manejar si estos cambios mejoran el servicio pero no modifican el contrato de servicio original. En estos casos, puede proporcionar dos conjuntos de archivos WSDL, uno que describa el servicio original y otro que describa el nuevo servicio mejorado.

Sin embargo, existen escenarios más complejos y no puede esperar que los clientes migren inmediatamente a una nueva implementación de servicio. Es posible que algunos clientes nunca migren al nuevo servicio. Para escenarios más complejos, una buena estrategia es publicar un extremo de servicio web independiente que proporcione la nueva versión del servicio. Los clientes pueden migrar al nuevo servicio cuando les resulte conveniente. Puede mantener la interfaz de servicio anterior pero volver a implementar el punto final existente para usar la nueva implementación del servicio. Incluso es posible que pueda publicar el nuevo punto final en la misma URL sin romper los clientes existentes. Por ejemplo, si solo está agregando algunos puertos adicionales a su WSDL, debería poder actualizar el WSDL anterior con la nueva descripción de WSDL y luego los clientes existentes deberían continuar funcionando sin problemas.

6.5.6. Escribir aplicaciones para la integración
Un área en la que tiene bastante flexibilidad es cómo codifica su nueva aplicación EAI. Dado que la aplicación es nueva, tiene la cantidad máxima de opciones para implementar cómo la aplicación accederá a los diversos recursos que requiere. La plataforma J2EE, que se está moviendo en esta dirección, proporciona algunas facilidades para ayudar en esta tarea.

La interfaz de programación de sistemas Java Business Integration (JBI), basada en JSR 208, amplía la plataforma J2EE con una infraestructura de integración conectable mediante el intercambio de mensajes basado en WSDL. JBI es más interesante para los proveedores de software independientes de integración (ISV) que para los desarrolladores empresariales. JBI permite a los ISV escribir módulos de integración que admitan protocolos comerciales, como Business Process Execution Language (BPEL), y conectarlos a un servidor de aplicaciones J2EE mediante mecanismos JBI. JBI también proporciona a estos módulos de integración servicios útiles como subprocesos, gestión de contexto, seguridad, gestión del ciclo de vida, agrupación de conexiones, temporizadores, etc. Como desarrollador, se ocupa de los servicios web para los diversos servicios de integración basados ​​en JBI proporcionados por estos ISV.



## 6.6. Conclusión

Este capítulo examinó algunos de los temas clave para la integración de aplicaciones empresariales. Comenzó ilustrando los problemas de integración típicos que encuentran las empresas y luego describió las diversas tecnologías de integración disponibles con la plataforma J2EE 1.4. Estas tecnologías J2EE no se limitan únicamente a los servicios web, aunque los servicios web representan un enfoque de integración válido más útil en ciertas situaciones. Además de los servicios web, la plataforma J2EE tiene tecnologías para integrarse con bases de datos relacionales y otros tipos de almacenes de datos, tecnologías de mensajería y tecnologías de acceso a EIS.

El capítulo describió los principales enfoques de integración de aplicaciones J2EE, incluido el uso de servicios web, beans empresariales y JMS, conectores y objetos de acceso a datos, y detalló las situaciones en las que era más apropiado utilizar estos diferentes enfoques. También mostró cómo se pueden combinar los diversos enfoques.

El capítulo concluyó con un conjunto de pautas para lograr la integración de datos, aplicaciones y procesos comerciales. También presentó algunas pautas para la integración de sistemas locales, además de cómo aprovechar las capacidades de los registros para fines de integración.

El Capítulo 7 analiza los enfoques para implementar servicios web seguros.























