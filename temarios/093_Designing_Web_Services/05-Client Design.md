# Capítulo 5. Diseño del cliente
Los servicios web llevan el modelo de cliente web al siguiente nivel. Los desarrolladores pueden escribir clientes mucho más potentes cuya interacción con los servicios web proporciona una experiencia de cliente enriquecida. En este entorno, los desarrolladores de clientes no necesitan tener control sobre la parte del servidor de una aplicación, pero aún pueden escribir aplicaciones de cliente ricas y potentes. Este capítulo se centra en el uso de la plataforma Java para diseñar y desarrollar clientes basados ​​en servicios web.

Los clientes pueden aprovechar los servicios web para obtener una amplia gama de funciones o servicios. Para un cliente, un servicio web es una caja negra: el cliente no tiene que saber cómo se implementa el servicio o incluso quién lo proporciona. El cliente se preocupa principalmente por la funcionalidad, el servicio, proporcionado por el servicio web. Los ejemplos de servicios web incluyen servicios de seguimiento de pedidos, servicios de búsqueda de información y servicios de validación de tarjetas de crédito. Varios clientes que se ejecutan en diferentes tipos de plataformas pueden acceder a estos servicios web.

Una de las principales razones para implementar servicios web es lograr la interoperabilidad. Los clientes pueden acceder a los servicios web independientemente de la plataforma o el sistema operativo en el que se implemente el servicio. No solo la plataforma del servicio no es de interés para el cliente, sino que el lenguaje de implementación del cliente es completamente independiente del servicio.

Los clientes de servicios web pueden tomar muchas formas, desde aplicaciones J2EE completas hasta aplicaciones de clientes enriquecidos, incluso clientes de aplicaciones livianas, como dispositivos inalámbricos. En resumen, hay muchos tipos diferentes de clientes que pueden comunicarse con los servicios web. La plataforma Java proporciona un soporte excelente para escribir clientes de servicios web. Los servicios web también brindan a los clientes un enfoque estandarizado para acceder a los servicios a través de firewalls. Dicho acceso amplía las capacidades de los clientes. Los clientes que acceden a los servicios web también permanecen más flojamente acoplados al servicio.

Comenzamos analizando los diferentes medios para comunicarse con servicios y aplicaciones web, y luego examinamos algunos escenarios típicos en los que tiene sentido usar clientes basados ​​en servicios web. A partir de ahí, el capítulo analiza los diferentes tipos de clientes que utilizan los servicios web, destacando en particular las diferentes consideraciones de diseño para los principales clientes Java: clientes J2EE, J2SE y J2ME. Luego, el capítulo aborda los pasos para desarrollar estas aplicaciones cliente, desde la ubicación de un servicio hasta el manejo de errores. También cubre las API de comunicación que las aplicaciones cliente pueden emplear para acceder a un servicio. En esta discusión se incluyen recomendaciones y pautas para ayudar a los desarrolladores a elegir el enfoque óptimo. El capítulo concluye con pautas para empaquetar aplicaciones cliente.

## 5.1. Elegir una tecnología de comunicación
Los servicios web son solo una de varias formas en que un cliente puede acceder a un servicio de aplicación. Por ejemplo, las aplicaciones Java pueden acceder a los servicios de la aplicación utilizando RMI/IIOP, JMS o servicios web. Hay ventajas y desventajas con cada una de estas tecnologías de comunicación, y el desarrollador debe sopesar estas consideraciones al decidir sobre el diseño de la aplicación del cliente.

La interoperabilidad es la principal ventaja de utilizar los servicios web como medio de comunicación. Los servicios web brindan a los clientes la capacidad de interoperar con casi cualquier tipo de sistema y aplicación, independientemente de la plataforma en la que se ejecute el sistema o la aplicación. Además, el cliente puede utilizar una variedad de tecnologías para esta comunicación. Además, diferentes tipos de clientes, como dispositivos portátiles, navegadores de escritorio o clientes de GUI enriquecidos, que se ejecutan en diferentes plataformas y están escritos en diferentes idiomas pueden acceder al mismo conjunto de servicios. Algunas aplicaciones pueden estar diseñadas de manera que solo se pueda acceder a su funcionalidad a través de un servicio web.

Los servicios web utilizan HTTP como protocolo de transporte, lo que permite a los clientes operar con sistemas a través de cortafuegos. El documento WSDL del servicio permite a los clientes y servicios que utilizan tecnologías muy diferentes mapear y convertir sus respectivos objetos de datos. Para los servicios y clientes que se basan en JAX-RPC, el tiempo de ejecución de JAX-RPC maneja esta asignación de forma transparente.

Veamos los diferentes enfoques de comunicación que están disponibles para que un cliente J2EE acceda a un servicio, incluidos los servicios web, RMI/IIOP y Java Message Service. Los clientes pueden usar fácilmente las clases de código auxiliar generadas por JAX-RPC para acceder a un servicio web. Aunque no es tan rápido desde la perspectiva del rendimiento como otras tecnologías (como RMI/IIOP), JAX-RPC brinda a los clientes una mayor flexibilidad y admite más tipos de clientes.

Los clientes de aplicaciones J2EE también pueden usar RMI/IIOP para realizar llamadas remotas a través de la red en la lógica comercial de la aplicación. RMI/IIOP se utiliza a menudo para clientes que operan en entornos de intranet, donde existe un mayor grado de control sobre la implementación del cliente y el servidor J2EE. Si bien estos entornos controlados brindan un contenedor de clientes que maneja la seguridad de la comunicación, pasar a través de los firewalls puede ser problemático. RMI/IIOP brinda a los clientes un acceso seguro a la lógica comercial de la aplicación y, al mismo tiempo, se ocupa de los detalles de la comunicación del cliente y el servidor y de los parámetros de clasificación y desclasificación.

Java Message Service (JMS) es otro medio para que los clientes J2EE se comuniquen con las aplicaciones del servidor. JMS proporciona un medio para la comunicación asíncrona. Las aplicaciones que usan JMS se adaptan mejor a una configuración que está detrás de un firewall, ya que los sistemas de mensajería generalmente no funcionan bien en Internet. (A menudo, los sistemas de mensajería ni siquiera están expuestos en Internet). Los desarrolladores no solo deben tener algún conocimiento sobre cómo trabajar con los sistemas de mensajería, por ejemplo, cómo configurar y usar temas o colas, sino que los mecanismos del sistema de mensajería ya deben estar en funcionamiento. lugar.

Aunque los servicios web proporcionan una forma estándar de intercambiar documentos XML a través de HTTP, también puede utilizar enfoques no estándar. La comunicación mediante el protocolo HTTP requiere solo una infraestructura simple para enviar y recibir mensajes. Sin embargo, la aplicación cliente debe poder analizar los documentos XML que representan los mensajes. El análisis implica asignar los datos XML al modelo de objetos de la aplicación cliente. Al utilizar este medio de comunicación, el desarrollador necesita, como mínimo, escribir código para enviar y recibir los documentos a través de HTTP, así como para analizar los datos del documento. Si dicha comunicación también debe ser segura, los desarrolladores tendrían que incluir un código que use Secure Socket Layer (SSL), lo que dificultaría la tarea de desarrollo. Sin embargo, este medio de comunicación puede ser suficiente, particularmente en un entorno cerrado o cuando los clientes son applets. Se debe tener cuidado si se utiliza este enfoque, ya que no es estándar.


## 5.2. Escenarios para aplicaciones cliente basadas en servicios web
Los desarrolladores suelen escribir clientes para acceder a servicios web preexistentes, es decir, servicios web públicos o privados. En ocasiones, los mismos desarrolladores pueden desarrollar simultáneamente tanto el servicio como sus clientes. Independientemente de esto, los desarrolladores de clientes deben confiar en la descripción del servicio WSDL para conocer los detalles del servicio. Además, los desarrolladores pueden usar una variedad de tecnologías y API para desarrollar estos clientes. Pueden desarrollar clientes usando tecnologías J2EE, a menudo llamados clientes J2EE, o pueden usar las tecnologías estándar de Java (J2SE y J2ME), o incluso tecnologías que no son de Java.

Antes de profundizar en los detalles del desarrollo de clientes, examinemos varios escenarios de clientes de servicios web. Aunque diferente, cada escenario se basa en acceder al mismo servicio web. Los escenarios son los siguientes:

Componente J2EE : en este escenario, un componente J2EE accede a un servicio web. El componente J2EE recibe resultados del servicio y formatea estos resultados para que un navegador pueda leerlos o mostrarlos.

Cliente J2SE : un cliente J2SE puede acceder al mismo servicio web que el componente J2EE. Sin embargo, el cliente J2SE proporciona una vista más detallada de los resultados devueltos por el servicio.

Cliente J2ME : un cliente J2ME, como una aplicación de cliente que se ejecuta en un dispositivo móvil o PDA, brinda al usuario la libertad de acceder al mismo servicio web desde lugares distintos a su oficina. Además, el usuario puede trabajar sin conexión con los resultados devueltos por el servicio.

Cliente que no es de Java : un cliente que no es de Java accede al mismo servicio web mediante SOAP sobre HTTP.

La figura 5.1 muestra cómo estos diferentes tipos de clientes pueden acceder a la misma interfaz de servicio web de seguimiento de órdenes de compra. Todos los clientes, independientemente de su plataforma, confían en el documento WSDL del servicio web, que utiliza un formato estándar para describir la ubicación del servicio y sus operaciones. Los clientes necesitan conocer la información del documento WSDL, como la URL del servicio, los tipos de parámetros y los nombres de los puertos, para comprender cómo comunicarse con un servicio en particular.

Figura 5.1. Clientes de servicios web en entornos J2EE y no J2EE



Es importante señalar que ninguno de los clientes se comunica directamente con un servicio Web. Cada tipo de cliente se basa en un tiempo de ejecución, ya sea un tiempo de ejecución JAX-RPC o SOAP, a través del cual accede al servicio. Desde la perspectiva del desarrollador, el uso que hace el cliente de un tiempo de ejecución se mantiene casi transparente. Sin embargo, un buen diseño dicta que un desarrollador siga modularizando el código de acceso al servicio web, además de considerar los problemas relacionados con las llamadas remotas y el manejo de excepciones remotas. Estos puntos se abordan más adelante. (Consulte “ Ubicación y acceso a un servicio ” en la página 219 y “ Manejo de excepciones ” en la página 230 ).

Las aplicaciones basadas en navegador se basan en componentes J2EE, que actúan como clientes del servicio web. Estos clientes, denominados clientes J2EE, son componentes J2EE que acceden a un servicio web y, a su vez, el tiempo de ejecución JAX-RPC gestiona la comunicación con el servicio web. El entorno J2EE protege al desarrollador de los detalles de la comunicación. Los clientes J2EE se ejecutan en un contenedor EJB o en un contenedor web, y estos contenedores administran el entorno del cliente.

Los clientes independientes, que pueden ser clientes J2SE, clientes J2ME o clientes escritos en un lenguaje distinto de Java, se comunican con el servicio web a través del tiempo de ejecución JAX-RPC o el tiempo de ejecución SOAP. Los clientes autónomos están fuera del entorno J2EE. Debido a que no tienen un contenedor J2EE EJB o un contenedor web para administrar el entorno, los clientes independientes requieren más trabajo por parte del desarrollador.

Aunque cada tipo de cliente funciona bien, los desarrolladores deben lidiar con un nivel de complejidad cada vez mayor si trabajan directamente con los tiempos de ejecución JAX-RPC o SOAP. La ventaja del entorno J2EE es que protege a los desarrolladores de parte de la complejidad asociada con el desarrollo de servicios web, como la búsqueda del servicio y la gestión del ciclo de vida de los objetos utilizados para acceder a un servicio. En el entorno J2EE, un desarrollador usa JNDI para buscar un servicio de la misma manera que podría usar otras API de Java, como JDBC o JMS.

Dado que muchos tipos de clientes pueden acceder a los servicios web, ¿cómo determina qué tipo de cliente es mejor para su aplicación? Para tomar esta determinación, debe considerar cómo los usuarios finales y la aplicación esperan usar el servicio. También debe sopesar los pros y los contras de cada tipo de cliente y considerar que cada tipo de cliente tiene sus propias características únicas que pueden hacerlo apropiado (o no apropiado) para una tarea de aplicación específica. Por lo tanto, debe considerar las características de los diferentes tipos de clientes, así como los mecanismos de comunicación disponibles para cada tipo de cliente al decidir qué tipo de cliente usar para acceder a un servicio web. Las siguientes pautas generales deberían ayudar con esta decisión:

Clientes J2EE : los clientes J2EE tienen buen acceso a los servicios web. Los clientes J2EE tienen otras ventajas proporcionadas por la plataforma J2EE, como la seguridad declarativa, las transacciones y la gestión de instancias. Los clientes J2EE también pueden acceder a los servicios web desde una arquitectura de flujo de trabajo y pueden agregar servicios web.

Clientes J2SE : en general, los clientes J2SE son mejores cuando necesita proporcionar una interfaz rica o cuando debe manipular grandes conjuntos de datos. Los clientes J2SE también pueden funcionar en un modo de operación desconectado.

Clientes J2ME : los clientes J2ME son mejores para aplicaciones que requieren acceso remoto e inmediato a un servicio web. Los clientes J2ME pueden estar restringidos a un conjunto limitado de componentes de interfaz. Al igual que los clientes J2SE, los clientes J2ME también pueden funcionar en un modo de operación desconectado.

Ahora que hemos visto algunos ejemplos de escenarios de servicios web, examinemos con más detalle los diferentes tipos de clientes que usan servicios web.

5.2.1. Diseño de clientes J2EE
Como ya se señaló, la plataforma J2EE 1.4 proporciona un entorno que admite el acceso de la aplicación del cliente a los servicios web. En un entorno J2EE, los descriptores de implementación definen mediante declaración la información de configuración del servicio web del lado del cliente. El implementador puede cambiar esta información de configuración en el momento de la implementación. Además, la plataforma J2EE maneja el trabajo subyacente para crear e inicializar el acceso a los servicios web.

La plataforma J2EE proporciona muchas otras tecnologías además de admitir servicios web. Los desarrolladores pueden obtener un conjunto de funcionalidades más completo mediante el uso de estos otros servicios, como los componentes Web y EJB, además de los servicios Web para sus aplicaciones cliente.

Por ejemplo, considere un cliente de navegador que accede a un servicio web de seguimiento de pedidos a través de un componente web. (Consulte la Figura 5.2 ). El componente web presenta una página del navegador al usuario final, quien ingresa un identificador de pedido en un formulario que se muestra en su navegador. El cliente del navegador pasa este identificador de pedido a un componente web, que accede al servicio web de seguimiento de pedidos y recupera la información del pedido. El componente web convierte la información recuperada en una página HTML y devuelve la página formateada al cliente del navegador para presentarla al usuario final.

Figura 5.2. Componente de nivel web que llama a un servicio web



En este ejemplo, un componente web llama al servicio de seguimiento de pedidos y, cuando recibe una respuesta del servicio, coloca los resultados en un componente Java Beans ( OrderDetailsBean ) que está dentro del alcance de la solicitud. El componente web utiliza un JSP para generar una respuesta HTML, que el contenedor devuelve al navegador que realizó la solicitud original.

También es posible escribir clientes J2EE utilizando componentes EJB. (Consulte la Figura 5.3 ). Estos componentes EJB pueden ser en sí mismos puntos finales de servicios web, así como clientes de otros servicios web. A menudo, los componentes EJB se utilizan en un flujo de trabajo para proporcionar servicios web con el soporte adicional proporcionado por un contenedor EJB, es decir, soporte transaccional declarativo, seguridad declarativa y gestión del ciclo de vida.

Figura 5.3. Componentes EJB y servicios web en un flujo de trabajo



La figura 5.3 muestra un escenario de flujo de trabajo: un punto final de servicio web que se usa en combinación con un componente de bean controlado por mensajes para proporcionar una operación de flujo de trabajo que se ejecuta de forma asincrónica una vez que se inicia el servicio inicial. El punto final del servicio web coloca sincrónicamente el pedido de compra en una cola de mensajes JMS y devuelve un ID de pedido a la aplicación que realiza la llamada. El bean controlado por mensajes escucha los mensajes entregados desde la cola JMS. Cuando llega uno, el bean recupera el mensaje e inicia el flujo de trabajo de procesamiento de órdenes de compra. La orden de compra se procesa de forma asíncrona mientras el servicio Web recibe otras órdenes de compra.

En este ejemplo, el flujo de trabajo consta de tres etapas adicionales realizadas por servicios web separados: un servicio de cobro de tarjeta de crédito, un servicio de envío y un servicio que envía una confirmación de pedido. El bean controlado por mensajes agrega las tres etapas del flujo de trabajo. Otros sistemas dentro de una organización pueden proporcionar estos servicios y pueden ser compartidos por muchas aplicaciones.

5.2.2. Diseño de clientes J2SE
A diferencia del entorno J2EE, los desarrolladores de clientes que no son J2EE son responsables de gran parte del trabajo subyacente para buscar un servicio y crear y mantener instancias de clases que acceden al servicio. Dado que no pueden depender de un contenedor, estos desarrolladores deben crear y administrar sus propios servicios y garantizar la disponibilidad de todos los entornos de tiempo de ejecución necesarios para acceder a los servicios web.

Los clientes J2SE, como las aplicaciones de escritorio desarrolladas con la API de Swing, tienen la capacidad de realizar más procesamiento y administración de estado que otros clientes. Este tipo de cliente de aplicación puede proporcionar un rico entorno de desarrollo de aplicaciones GUI que incluye la edición de documentos y la manipulación gráfica. Sin embargo, hay algunos puntos que deben tenerse en cuenta al considerar los clientes J2SE:

Aplicaciones de ejecución prolongada : el uso de J2SE es particularmente bueno para los clientes de servicios web que se ejecutan durante largos períodos de tiempo. Debido a que estas aplicaciones se ejecutan durante períodos prolongados, los desarrolladores deben considerar que tanto el cliente como el servicio web pueden necesitar mantener el estado de al menos algunos de los datos. Es posible incrustar el estado conversacional dentro de cada invocación de método, si así lo requiere el caso de uso del servicio.

Usando una rica interfaz gráfica de usuario (GUI) para datos complejos , los clientes J2SE pueden proporcionar a los usuarios una vista rica de los datos. Una interfaz tan rica podría permitir a un usuario navegar y modificar sin conexión un gran conjunto de datos devueltos por un servicio. Posteriormente, el cliente puede actualizar el servicio web con cualquier cambio en los datos.

Requiere solo acceso intermitente a la red : el cliente J2SE puede usar los servicios web sin necesidad de mantener un acceso continuo a la red, aliviando parte de la carga en una red. Se debe tener cuidado para garantizar la consistencia de los datos entre el servicio y el cliente.

Requerir cálculos complejos en el cliente : los clientes J2SE son adecuados para realizar cálculos matemáticos complejos, así como operaciones que actualizan datos y luego envían los resultados a un servicio. Por ejemplo, estos clientes tienen mejores recursos para la manipulación de imágenes y pueden aliviar al servidor de esta carga. Por lo tanto, los clientes J2SE pueden proporcionar un entorno mejor que un servicio para la interacción de un usuario con conjuntos de datos.

Por ejemplo, una aplicación J2SE puede contener una GUI enriquecida que se utiliza para actualizar la información del catálogo. El usuario puede manipular atributos y datos gráficos utilizando las pantallas GUI de la aplicación. Cuando el usuario termina, la aplicación envía datos de catálogo nuevos o actualizados al servicio de catálogo.

Las aplicaciones J2SE se pueden implementar utilizando la tecnología Java Web Start. Java Web Start simplifica la implementación en grandes entornos empresariales al garantizar que los clientes tengan disponibles las versiones adecuadas de Java Runtime Environment y todas las bibliotecas necesarias.

Siempre que sea posible, utilice Java Web Start para proporcionar un medio estandarizado de implementación para clientes J2SE.

Cuando diseñe un cliente de servicio web, intente mantener el código de acceso al servicio web separado del código GUI.

Dado que los clientes J2SE pueden funcionar en modo conectado o desconectado, al desarrollar estos clientes, tenga en cuenta las cuestiones relacionadas con el mantenimiento del estado y la sincronización de clientes y servicios.

5.2.3. Clientes J2ME
Los clientes de Java 2 Platform, Micro Edition (J2ME) pueden interactuar de forma remota con un servicio web. Sin embargo, dado que los clientes J2ME tienen capacidades GUI limitadas en comparación con los clientes J2SE, considere usar clientes J2ME cuando la movilidad y el acceso remoto sean requisitos. También considere usar este tipo de cliente cuando la inmediatez del acceso es importante.

Por ejemplo, la figura 5.4 muestra un cliente J2ME ejecutándose en un teléfono celular y accediendo a un servicio de seguimiento de pedidos. El cliente no necesita una GUI elaborada o un conjunto de widgets para interactuar con el servicio web.

Figura 5.4. Cliente J2ME que accede al servicio web



Los clientes J2ME pueden acceder a los servicios web utilizando un subconjunto de la API JAX-RPC. Al acceder a los servicios web, los clientes de J2ME deben tener en cuenta los problemas de ancho de banda y de conexión de red, el funcionamiento sin conexión frente al conectado, y las limitaciones de GUI y procesamiento.

Es posible que las redes que admiten dispositivos J2ME no siempre proporcionen una conectividad constante. Las aplicaciones que usan tales redes deben considerar fallas en la conexión o conectividad esporádica, y estar diseñadas para que la recuperación sea posible.

Además, los anchos de banda de muchas redes que admiten dispositivos J2ME limitan la velocidad a la que se pueden intercambiar datos. Las aplicaciones deben diseñarse para limitar su tasa de intercambio de datos a la permitida por la red y considerar el costo que estas limitaciones implican. También se debe tener cuidado para lidiar con la latencia de la red para mantener aceptable la experiencia del usuario. Dado que los servicios web no especifican un nivel de servicio para la entrega de mensajes, la aplicación cliente debe tener esto en cuenta y brindar soporte para las fallas en la entrega de mensajes.

Tenga en cuenta que los proveedores de red J2ME pueden cobrar por el uso de la red por kilobyte. Las aplicaciones dirigidas a J2ME pueden ser costosas para el usuario a menos que se tenga cuidado de limitar los datos transferidos.

Las aplicaciones para dispositivos J2ME pueden funcionar en modo fuera de línea o desconectado, así como en modo en línea o conectado. Cuando se trabaja en modo fuera de línea, las aplicaciones deben recopilar datos y agruparlos en solicitudes al servicio web, así como obtener datos del servicio en lotes. Se debe tener en cuenta la cantidad de datos que se pasan entre el servicio web y el cliente.

Las aplicaciones para dispositivos J2ME tienen un conjunto estándar y uniforme de widgets de GUI disponibles para manipular datos, como la interfaz de usuario de pantalla de cristal líquido que forma parte de MIDP 1.0 y MIDP 2.0. Además, cada tipo de dispositivo puede tener su propio conjunto de widgets. Dichos widgets tienen diferentes capacidades para validar datos antes de acceder a un servicio.

Los dispositivos J2ME, si bien son capaces de realizar pequeños cálculos y validación de datos, tienen capacidades de procesamiento limitadas y restricciones de memoria. Las aplicaciones de los clientes deben considerar los tipos de datos intercambiados y cualquier procesamiento previo y posterior requerido. Por ejemplo, los dispositivos J2ME tienen soporte limitado para el procesamiento de documentos XML y no se requieren para realizar la validación de documentos XML.

En resumen, tenga en cuenta las siguientes consideraciones al diseñar clientes J2ME.

Limitaciones de conectividad y ancho de banda : los clientes J2ME pueden tener un ancho de banda limitado, desconexiones intermitentes y tarifas por el uso de la conexión.

Potencia de procesamiento : las capacidades de procesamiento de un cliente de servicio web deben tenerse en cuenta en su diseño.

Mantenimiento de estado : los clientes J2ME pueden operar en modo conectado o desconectado, lo que requiere el mantenimiento del estado y la sincronización entre el cliente y el servicio.

## 5.3. Desarrollo de aplicaciones cliente para usar un servicio web
Todas las aplicaciones cliente siguen ciertos pasos para utilizar un servicio web. En resumen, primero deben buscar o ubicar el servicio, realizar una llamada al servicio y procesar los datos devueltos. La elección del modo de comunicación determina gran parte de los detalles para realizar estos pasos.

Una aplicación puede comunicarse con un servicio mediante stubs, proxies dinámicos o la interfaz de llamada de interfaz de invocación dinámica (DII) . (La siguiente sección explica estos modos). Con estos modos, un desarrollador confía en algún tipo de clase de proxy del lado del cliente (stub, proxy dinámico o una interfaz DII) que representa un servicio web para acceder a la funcionalidad del servicio. El desarrollador del cliente decide qué representación usar en función de la disponibilidad de WSDL, la dirección del extremo del servicio y los casos de uso del servicio.

Después de decidir un modo de comunicación, los desarrolladores deben hacer lo siguiente al diseñar y desarrollar aplicaciones cliente:

Evaluar la naturaleza y disponibilidad del servicio y la descripción del servicio.

Normalmente, el primer paso es determinar la ubicación del documento WSDL del servicio web y elegir un modo de comunicación. Si usa stubs o proxies dinámicos, primero debe ubicar y obtener acceso al documento WSDL completo que representa el servicio web, ya que desarrolla la aplicación cliente a partir de los stubs y los archivos de soporte generados desde WSDL. Si solo tiene acceso a un archivo WSDL parcial, use DII, ya que DII le permite ubicar el servicio en tiempo de ejecución. Consulte “ Modos de comunicación para acceder a un servicio ” en la página 212 para obtener más información.

Cree un delegado de servicio web del lado del cliente.

Si corresponde, genere los stubs y las clases de soporte necesarios : es posible que las clases generadas no se puedan transferir entre implementaciones. Si la portabilidad es importante, limite el uso de llamadas a métodos específicos del proveedor en las clases de código auxiliar.

Localice el servicio : según el modo de comunicación, existen diferentes formas de localizar un servicio. Consulte “ Ubicación y acceso a un servicio ” en la página 219 .

Configure los objetos stub o Call : consulte “ Configuración de stubs y llamadas ” en la página 223 .

Invocar el servicio.

Cuando se usan stubs y proxies dinámicos, las invocaciones son sincrónicas. Use DII si elige tener una llamada unidireccional.

Manejar parámetros, valores devueltos y excepciones.

Presentar la vista .

A menudo, el cliente puede necesitar generar una vista para los usuarios finales. Hay diferentes formas en que los clientes pueden manejar la presentación al usuario de la respuesta del servicio web. En algunos casos, un servicio envía su respuesta como un documento XML y este documento puede transformarse o asignarse a un formato adecuado para la presentación. Los clientes de nivel web pueden pasar la respuesta del servicio a un componente web como JSP y permitir que el componente aplique una transformación al documento XML o maneje los datos devueltos. Los propios clientes de nivel EJB pueden aplicar transformaciones XSLT al contenido devuelto para crear el contenido de destino, que luego pasan a un componente web.

Las siguientes secciones examinan algunas de las consideraciones para diseñar e implementar aplicaciones cliente.

5.3.1. Modos de comunicación para acceder a un servicio
Para determinar mejor el modo de comunicación para su aplicación cliente, necesita saber las respuestas a las siguientes dos preguntas. ¿Se conoce el documento WSDL completo del servicio web? ¿Se conoce la dirección del extremo del servicio web?

Como se indicó, hay tres modos principales para la comunicación de una aplicación cliente con un servicio web: stub, proxy dinámico e interfaz de invocación dinámica (DII). Por modo de comunicación, nos referimos a las API para acceder mediante programación a un servicio a través de la interfaz javax.xml.rpc.Service . Los clientes que utilizan stubs o proxies dinámicos para acceder a un servicio requieren la definición previa de una interfaz de extremo de servicio. Tenga en cuenta que cuando nos referimos a la interfaz de punto final de servicio, que es la interfaz entre el código auxiliar y los clientes de proxy dinámico y la API JAX-RPC y el código auxiliar, nos referimos a la interfaz que representa la vista del cliente de un servicio web.

Cuando se utilizan stubs, una herramienta de tiempo de ejecución JAX-RPC genera durante el desarrollo clases de stubs estáticas que permiten que el servicio y el cliente se comuniquen. El stub, que se encuentra entre el cliente y la representación del cliente de la interfaz del extremo del servicio, es responsable de convertir una solicitud de un cliente en un mensaje SOAP y enviarlo al servicio. El stub también convierte las respuestas del extremo del servicio, que recibe como mensajes SOAP, a un formato comprensible para el cliente. En cierto sentido, un stub es un objeto local que actúa como un proxy para el punto final del servicio.

Los proxies dinámicos brindan la misma funcionalidad que los stubs, pero lo hacen de una manera más dinámica. Tanto los stubs como los proxies dinámicos proporcionan al desarrollador acceso a la interfaz javax.xml.rpc.Stub , que representa un punto final de servicio. Con ambos modelos, es fácil para un desarrollador programar contra la interfaz de punto final de servicio, particularmente porque el tiempo de ejecución JAX-RPC hace gran parte del trabajo de comunicación entre bastidores. El modelo de proxy dinámico difiere del modelo stub principalmente porque el modelo de proxy dinámico no requiere la generación de código durante el desarrollo.

DII es una interfaz de llamada que admite una invocación programática de solicitudes JAX-RPC. Usando DII, un cliente puede llamar a un servicio oa un procedimiento remoto en un servicio sin saber en tiempo de compilación el nombre exacto del servicio o la firma del procedimiento. Un cliente DII puede descubrir esta información en tiempo de ejecución y puede buscar dinámicamente el servicio y sus procedimientos remotos.

Al usar DII, los clientes pueden acceder dinámicamente a un servicio en tiempo de ejecución. Los stubs se basan en una herramienta que utiliza el archivo WSDL para crear la interfaz de punto final de servicio, además de generar stubs y otras clases necesarias. Estas clases generadas eliminan la necesidad de que el desarrollador use las API de JAX-RPC directamente. Por el contrario, los enfoques de proxy dinámico y DII requieren que el desarrollador utilice las API JAX-RPC.

5.3.1.1. Uso de la comunicación de código auxiliar
Los clientes de J2EE deben usar stubs generados para acceder a los servicios, especialmente para servicios con interfaces bastante estáticas. La comunicación Stub permite fácilmente el acceso de Java a un servicio Web. Este es el enfoque recomendado para acceder a los servicios y sus archivos WSDL cuando es poco probable que cambien con el tiempo.

La figura 5.5 muestra cómo una aplicación cliente puede acceder a un servicio web utilizando un código auxiliar generado por una herramienta antes de la implementación y compilación del cliente. El archivo WSDL para el servicio sirvió como entrada para la herramienta. La interfaz de punto final de servicio del lado del cliente, que implementa la interfaz de punto final de servicio en el lado del cliente del canal de comunicación, proporciona la vista del cliente del servicio web.

Figura 5.5. Modelo de comunicación de código auxiliar



El stub, que implementa la interfaz de extremo de servicio del lado del cliente, actúa como un proxy del servicio web para el cliente; es decir, el stub es la vista del cliente del servicio Web. La herramienta que genera la clase stub también genera todas las clases auxiliares necesarias para acceder al servicio. Estas clases auxiliares definen los parámetros para las llamadas al servicio y los valores devueltos del servicio, lo que garantiza que los parámetros y los valores devueltos sean todos los tipos adecuados esperados por el tiempo de ejecución de JAX-RPC. Para generar estas clases auxiliares y de código auxiliar, la herramienta se basa en el documento WSDL, así como en un archivo de asignación JAX-RPC. El archivo de asignación proporciona información sobre los enlaces de Java a XML, como el nombre de paquete correcto para las clases generadas.

El entorno J2ME difiere un poco. Las aplicaciones en entornos J2ME solo pueden usar stubs para acceder a servicios web, y los stubs son portátiles para dispositivos J2ME. El perfil JAX-RPC para entornos J2ME no admite proxies dinámicos ni DII.

Aunque en este momento los stubs no son portátiles en las implementaciones de J2EE, se espera que la próxima versión de JAX-RPC aborde este problema de portabilidad.

El uso de stubs, especialmente en un entorno Java, suele ser lo más fácil porque el desarrollador puede trabajar con archivos de clase generados que representan los parámetros de llamada del método de servicio y los valores devueltos. Sin embargo, las mayores dependencias entre el cliente y el servicio web pueden generar problemas si la interfaz del servicio cambia con frecuencia. Este modo también requiere que se generen clases de código auxiliar antes de compilar la aplicación.

5.3.1.2. Uso de la comunicación de proxy dinámico
Los proxies dinámicos son similares en muchos aspectos a los stubs descritos anteriormente. Sin embargo, a diferencia de los stubs, el desarrollador del cliente solo necesita la interfaz del lado del cliente que coincida con la interfaz del extremo del servicio. Es decir, los clientes que utilizan proxies dinámicos programan una interfaz que garantiza que la aplicación del cliente sea portátil entre otras implementaciones de tiempo de ejecución JAX-RPC. Los desarrolladores que utilizan proxies dinámicos deben crear clases de Java para que funcionen como tipos de valor JAX-RPC; estas clases tienen un constructor vacío y establecen métodos para cada campo, de forma similar a las clases de JavaBeans.

El proxy dinámico se basa en la interfaz de punto final de servicio, su documento WSDL y un archivo de asignación JAX-RPC (similar al modelo de stubs). (Consulte la Figura 5.6 ). Las aplicaciones cliente pueden acceder a los puertos del servicio web mediante el método getPort de javax.xml.rpc.Service .

Figura 5.6. Acceso a un servicio mediante un proxy dinámico



Observe en la Figura 5.6 que un cliente accede a un servicio web a través de la representación del lado del cliente de la interfaz del extremo del servicio, mientras que el tiempo de ejecución JAX-RPC maneja el trabajo de comunicación con el servicio respectivo. Un desarrollador programa contra una interfaz, lo que proporciona una forma flexible de acceder a un servicio de forma portátil.

Considere usar el enfoque de proxy dinámico si la portabilidad es importante para su aplicación, ya que este enfoque usa la interfaz de punto final del servicio para comunicarse con un servicio en tiempo de ejecución. La comunicación de proxy dinámico es el modo más portátil en las implementaciones de JAX-RPC.

Debido a la forma en que acceden a un servicio en tiempo de ejecución, los proxies dinámicos pueden tener una sobrecarga adicional cuando se realizan las llamadas.

5.3.1.3. Uso de la interfaz de llamadas DII
Una aplicación de cliente también puede acceder dinámicamente a un servicio web localizando el servicio en tiempo de ejecución desde un registro. El cliente no conoce el servicio cuando se compila; en su lugar, el cliente descubre el nombre del servicio de un registro JAXR en tiempo de ejecución. Junto con el nombre, el cliente descubre los parámetros necesarios y los valores de retorno para realizar una llamada al servicio. Usando una interfaz de invocación dinámica, el cliente localiza el servicio y lo llama en tiempo de ejecución.

Generalmente, usar DII es más difícil para un desarrollador. Un desarrollador debe trabajar con una interfaz más compleja que con stubs o proxies dinámicos. Esta interfaz no solo requiere más trabajo por parte del desarrollador, sino que es más propensa a las excepciones de conversión de clase. Además, el enfoque DII puede tener un acceso más lento. Un desarrollador puede optar por utilizar el enfoque DII cuando no se dispone o no se proporciona un documento WSDL completo, especialmente cuando el documento WSDL no especifica los puertos. El enfoque DII es más adecuado cuando se usa dentro de un marco, ya que desde dentro de un marco, las aplicaciones cliente pueden acceder de forma genérica y dinámica a los servicios sin cambios en el código de la aplicación central.

La Figura 5.7 muestra cómo un cliente usa la API de JAXR para buscar el WSDL de punto final para un servicio en un registro. El cliente usa la información del registro para construir aj avax.xml.rpc.Call , que usa para acceder al servicio web.

Figura 5.7. Interfaz de llamada DII



El uso de la interfaz de llamada DII permite que una aplicación cliente defina en tiempo de ejecución el nombre del servicio y las operaciones que pretende llamar en el servicio, lo que le brinda al cliente el beneficio de acoplar libremente su código con el del servicio. El cliente se ve menos afectado por los cambios en el servicio, ya sea que esos cambios impliquen acceso al servicio o requisitos de datos. Además, el modelo de comunicación DII permite que el código de acceso al servicio web se estandarice entre un conjunto de clientes y se reutilice como un componente.

 DII implica más trabajo que stubs o proxies dinámicos y debe usarse con moderación. Puede considerar usar este modo si un servicio cambia con frecuencia.

5.3.1.4. Resumen de las pautas del modelo de comunicación
La Tabla 5.1 resume los modelos de comunicación para clientes de servicios web.

Tabla 5.1. Modos de comunicación del cliente
Consideraciones del cliente	Talón	Proxy dinámico	DII
Código de cliente portátil en implementaciones JAX-RPC	Sí, en la plataforma J2EE cuando una aplicación utiliza un medio neutral para acceder a los stubs. (Para ver un ejemplo, consulte el Ejemplo de código 5.2 ). Dado que los stubs están vinculados a un tiempo de ejecución JAX-RPC específico, es posible que la confianza en el acceso específico de JAX-RPC a un stub no se comporte de la misma manera en todas las plataformas. El código auxiliar debe generarse para una aplicación.	Sí	Sí
Requiere generación de código usando una herramienta	Sí	No. Se puede usar una herramienta para generar tipos de valor JAX-RPC requeridos por una interfaz de punto final de servicio (pero no serializadores y otros artefactos).	No
Capacidad para cambiar mediante programación la URL del punto final del servicio	Sí, pero el WSDL debe coincidir con el utilizado para generar la clase de código auxiliar y las clases de soporte.	Sí, pero la interfaz del extremo del servicio del lado del cliente debe coincidir con la representación del lado del servidor.	Sí
Admite excepciones específicas del servicio	Sí	Sí	No. Todas son excepciones java.rmi .Remote. Las excepciones marcadas no se pueden utilizar cuando las llamadas se realizan de forma dinámica.
Admite el modo de comunicación unidireccional	No	No	Sí
Admite la capacidad de especificar dinámicamente tipos de valores JAX-RPC en tiempo de ejecución	No. El desarrollador debe programar contra una interfaz de punto final de servicio.	No. El desarrollador debe programar contra una interfaz de punto final de servicio.	Sí. Sin embargo, devuelve objetos Java que el desarrollador necesita convertir en objetos específicos de la aplicación según sea necesario.
Compatible con la plataforma J2ME	Sí	No	No
Compatible con plataformas J2SE y J2EE	Sí	Sí	Sí
Requiere WSDL	No. Una interfaz de extremo de servicio puede generar una clase de código auxiliar junto con información sobre el enlace del protocolo.	No. Se puede utilizar un WSDL parcial (uno con el elemento de puerto de servicio sin definir).	No. Las llamadas se pueden utilizar cuando se especifica WSDL parcial o no se especifica WSDL. El uso de métodos que no sean el método createCall en la interfaz de llamada puede provocar un comportamiento inesperado en tales casos.

Elija el modo de comunicación para su aplicación cliente después de considerar lo siguiente:

Los clientes J2EE deben usar stubs. Los stubs son los más fáciles de usar para los desarrolladores. Tenga en cuenta, sin embargo, que con los stubs puede perder algo de portabilidad entre las implementaciones de JAX-RPC.

Los componentes J2EE que actúan como clientes deberían utilizar proxies dinámicos cuando la portabilidad sea un requisito. Dado que los proxies dinámicos no requieren un archivo de mapeo JAX-RPC, puede ocurrir cierta ambigüedad y esto puede resultar en un comportamiento inesperado al llamar a un servicio.

 DII es el más difícil de usar de los tres enfoques. Solo considere usar DII si necesita la capacidad de tiempo de ejecución para buscar operaciones.

Todos los clientes J2SE y J2ME deben usar stubs si es posible.

5.3.2. Localización y acceso a un servicio
La localización de un servicio difiere según el cliente. Las aplicaciones cliente que se ejecutan en entornos J2EE utilizan el método JNDI InitialContext.lookup para localizar un servicio, mientras que un cliente J2SE puede utilizar la clase javax.xml.rpc.ServiceFactory o un código auxiliar específico de la implementación para localizar un servicio. Los clientes utilizan la interfaz API javax.xml.rpc.Service para acceder a un servicio web. Un stub implementa la interfaz de servicio.

El ejemplo de código 5.1 muestra cómo una aplicación en un entorno J2EE podría usar un código auxiliar para acceder a un servicio. La aplicación localiza el servicio mediante una llamada JNDI InitialContext.lookup . La llamada JNDI devuelve un objeto OpcOrderTrackingService , que es un código auxiliar.

Ejemplo de código 5.1. Acceso a un servicio con un stub en un entorno J2EE
   Contexto ic = new InitialContext();
   OpcOrderTrackingService opcOrderTrackingSvc =
          (OpcOrderTrackingService) ic.búsqueda(
          "java:comp/env/service/OpcOrderTrackingService");
   Puerto OrderTrackingIntf =
          opcOrderTrackingSvc.getOrderTrackingIntfPort();
OrderDetails od = port.getOrderDetails(orderId);

Debido a que depende de las clases de stub generadas, el código de cliente del Ejemplo de código 5.1 no es la estrategia recomendada para usar stubs. Aunque este ejemplo funciona sin problemas, JAX-RPC le brinda una forma neutral de acceder a un servicio y obtener los mismos resultados. Mediante el uso del método getPort de la interfaz javax.xml.rpc.Service de JAX-RPC , puede acceder a un servicio web de la misma manera, independientemente de si utiliza stubs o proxies dinámicos. El método getPort devuelve una instancia de una clase de implementación de código auxiliar generado o un proxy dinámico, y el cliente puede usar esta instancia devuelta para invocar operaciones en el extremo del servicio.

El método getPort elimina las dependencias de las clases de implementación específicas del servicio generadas. Cuando se invoca este método, el tiempo de ejecución de JAX-RPC selecciona un puerto y un enlace de protocolo para comunicarse con el puerto, luego configura el stub devuelto que representa la interfaz de punto final de servicio. Además, dado que la plataforma J2EE permite que el descriptor de implementación especifique varios puertos para un servicio, el contenedor, en función de su configuración, puede elegir el mejor puerto y enlace de protocolo disponible para la llamada de servicio. (Consulte el ejemplo de código 5.2 ).

Ejemplo de código 5.2. Búsqueda de un puerto mediante un Stub o proxy dinámico
Contexto ic = new InitialContext();
Servicio servicio = (Servicio)ic.lookup(
          "java:comp/env/service/OpcPurchaseOrderService");
Puerto de BuyOrderIntf = (PurchaseOrderIntf)servicio.getPort(
          CompreOrderIntf.clase);

El ejemplo de código 5.2 ilustra cómo un cliente J2EE podría usar el método getPort de la interfaz de servicio . En lugar de convertir la referencia JNDI a la clase de implementación del servicio, el código convierte la referencia JNDI a una interfaz javax.xml.rpc.Service . El uso de la interfaz de servicio de esta manera reduce la dependencia de las clases de código auxiliar generadas. El desarrollador del cliente, al invocar el método getPort , utiliza la representación del lado del cliente de la interfaz del extremo del servicio para buscar el puerto. Después de obtener el puerto, el cliente puede realizar las llamadas deseadas por la aplicación en el puerto.

Al usar stubs o proxies dinámicos, la estrategia recomendada para reducir la dependencia de las clases generadas es usar java.xml.rpc.Serviceinterfaz y el método getPort como un proxy para la clase de implementación del servicio.

Un desarrollador cliente no debe eludir la gestión de un servicio de la plataforma J2EE. Un cliente no debe crear ni destruir un puerto de servicio web. En su lugar, un cliente debe utilizar los mecanismos J2EE estándar, como los que se muestran en el ejemplo de código 5.2 .

Un desarrollador de cliente no debe suponer que se utiliza la misma instancia de puerto para el servicio para todas las llamadas al servicio. Las instancias de puerto no tienen estado y no se requiere que la plataforma J2EE devuelva una instancia de puerto utilizada anteriormente a un cliente.

Una aplicación en un entorno que no es J2EE utiliza un código auxiliar para realizar una llamada de servicios web de una manera diferente. La aplicación cliente accede a un código auxiliar para un servicio mediante el método getOrderTrackingIntfPort en la clase de implementación generada, OpcOrderTrackingService_Impl , que es específica de cada tiempo de ejecución JAX-RPC. Los clientes J2SE o J2ME utilizan estos archivos _Impl generados porque no tienen acceso a los servicios de nombres disponibles para los clientes en un entorno J2EE a través de las API JNDI. Consulte el ejemplo de código 5.3 .

Ejemplo de código 5.3. Acceso a un servicio con un stub en entornos J2SE y J2ME
Stub stub = (Stub)(nuevo OpcOrderTrackingService_Impl()
   getOrderTrackingIntfPort());
OrderTrackingIntf port = (OrderTrackingIntf)stub;

Además, un cliente J2SE o J2ME puede acceder a un servicio utilizando la clase javax.xml.rpc.ServiceFactory para instanciar un objeto de código auxiliar. El ejemplo de código 5.4 muestra cómo un cliente J2SE podría usar una fábrica para ubicar el mismo servicio de seguimiento de pedidos.

Ejemplo de código 5.4. Búsqueda de un servicio en entornos J2SE y J2ME
ServiceFactory factory = ServiceFactory.newInstance();
Servicio servicio = factory.createService(nuevo QName(
   "urna:OpcOrderTrackingService", "OpcOrderTrackingService"));

De manera similar, el Ejemplo de código 5.5 muestra cómo una aplicación J2SE podría usar un proxy dinámico en lugar de un código auxiliar para acceder a un servicio.

Ejemplo de código 5.5. Búsqueda de servicio de proxy dinámico de cliente J2SE
...
ServiceFactory sf = ServiceFactory.newInstance();
Cadena wsdlURI =
       "http://localhost:8001/webservice/OtEndpointEJB?WSDL";
URL wsdlURL = nueva URL (wsdlURI);
Servicio ots = sf.createService(wsdlURL,
       nuevo QName("urna:OpcOrderTrackingService",
       "OpcOrderTrackingService"));
Puerto OrderTrackingIntf = (
       OrderTrackingIntf)ots.getPort(nuevo QName(
       "urna:OpcOrderTrackingService", "OrderTrackingIntfPort"),
       OrderTrackingIntf.clase);
...

El ejemplo de código 5.5 ilustra cómo un cliente J2SE podría programar interfaces que son portátiles a través de tiempos de ejecución JAX-RPC. Muestra cómo un cliente J2SE usa ServiceFactory para buscar y obtener acceso al servicio, representado como un objeto Service . El cliente usa el nombre calificado, o QName , del servicio para obtener el puerto del servicio. El documento WSDL define el QName para el servicio. El cliente debe pasar como argumentos el QName para el puerto de servicio de destino y la representación del lado del cliente de la interfaz del extremo del servicio.

Por el contrario, el ejemplo de código 5.6 muestra cómo un cliente J2EE podría usar un proxy dinámico para buscar y acceder a un servicio. Estos dos ejemplos muestran cuánto más simple es para los clientes J2EE buscar y acceder a un servicio que para los clientes J2SE, ya que una búsqueda JNDI desde el IntialContext de un servicio existente es mucho más simple que configurar los parámetros para ServiceFactory . El cliente J2EE simplemente invoca una llamada getPort en la representación del lado del cliente de la interfaz del punto final del servicio.

Ejemplo de código 5.6. Uso de un proxy dinámico en un entorno J2EE
Contexto ic = new InitialContext();
Servicio ot =
       (Servicio) ic.búsqueda(
       "java:comp/env/service/OpcOrderTrackingService");
Puerto OrderTrackingIntf = (OrderTrackingIntf)ots.getPort(
    OrderTrackingIntf.clase);

Un cliente J2SE que utilice el enfoque DII podría implementar el código que se muestra en el ejemplo de código 5.7 para buscar el mismo servicio en tiempo de ejecución. La comunicación DII admite dos modos de invocación: síncrono y unidireccional, también llamado disparar y olvidar. Ambos modos de invocación se configuran con el objeto javax.xml.rpc.Call . Tenga en cuenta que DII es el único modelo de comunicación que admite la invocación unidireccional. El ejemplo de código 5.7 ilustra el uso del enfoque DII para ubicar y acceder a un servicio. Muestra cómo la LlamadaLa interfaz utilizada por DII está configurada con los valores de propiedad necesarios para acceder al servicio web de seguimiento de pedidos. Los valores establecidos para estas propiedades pueden haberse obtenido de un registro. Tenga en cuenta que el uso de DII es complejo y, a menudo, requiere más trabajo por parte del desarrollador del cliente.

Ejemplo de código 5.7. Cliente J2SE usando DII para acceder a un servicio web
servicio servicio = // obtener servicio
QName puerto = nuevo QName("urna:OpcOrderTrackingService",
       "OrderTrackingIntfPort");
Llamada llamada = servicio.createCall(puerto);
llamada.setTargetEndpointAddress(
       "http://localhost:8000/webservice/OtEndpointEJB");
call.setProperty(Call.SOAPACTION_USE_PROPERTY,
       nuevo booleano (verdadero));
call.setProperty(Call.SOAPACTION_URI_PROPERTY,"");
call.setProperty(ENCODING_STYLE_PROPERTY, URI_ENCODING);
QName QNAME_TYPE_STRING = nuevo QName(NS_XSD, "cadena");
llamada.setReturnType(QNAME_TYPE_STRING);
llamada.setOperationName(
nuevo QName(BODY_NAMESPACE_VALUE "getOrderDetails"));
llamada.addParameter("String_1", QNAME_TYPE_STRING,
       ModoParámetro.IN);
String[] parámetros = {orderId};
OrderDetails = (OrderDetails)call.invoke(params);

5.3.3. Stubs y configuración de llamadas
Los desarrolladores pueden querer configurar una instancia de un stub o una interfaz de llamada antes de invocar un servicio o pueden preferir permitir que la configuración se realice dinámicamente en tiempo de ejecución. A menudo, el desarrollador configura el código auxiliar o la interfaz de llamada antes de invocar el servicio cuando el servicio requiere autenticación básica. Por ejemplo, una aplicación de cliente J2SE necesita establecer un nombre de usuario y una contraseña en el código auxiliar o en la llamada.justo antes de invocar el servicio; el servicio requiere estos dos campos para que pueda autenticar al cliente. En otros casos, el desarrollador puede desear flexibilidad para especificar la dirección del punto final que se usará para un servicio en particular, según la disponibilidad de la red, etc. El desarrollador puede configurar esta dirección de punto final dinámicamente en tiempo de ejecución.

Los stubs se pueden configurar de forma estática o dinámica. La configuración estática de un stub se establece a partir de la descripción del archivo WSDL en el momento en que se genera el stub. En lugar de usar esta configuración estática, un cliente puede usar métodos definidos por la interfaz javax.xml.rpc.Stub para configurar dinámicamente las propiedades del stub en tiempo de ejecución. Dos métodos son de particular interés: _setProperty para configurar las propiedades del código auxiliar y _getProperty para obtener información sobre las propiedades del código auxiliar. Los clientes pueden usar estos métodos para obtener o configurar propiedades tales como la dirección del extremo del servicio, el nombre de usuario y la contraseña.

En general, se recomienda convertir las implementaciones de código auxiliar específicas del proveedor en un objeto j avax.xml.rpc.Stub para la configuración. Esto garantiza que la configuración se realice de forma portátil y que la aplicación se pueda ejecutar en otras implementaciones de JAX-RPC con cambios mínimos, si los hubiera.

El ejemplo de código 5.8 muestra cómo un cliente J2EE podría usar métodos de interfaz Stub para buscar y establecer la dirección del punto final de un servicio web.

Ejemplo de código 5.8. Configuración de propiedades en un resguardo
Servicio opcPurchaseOrderSvc =
       (Servicio) ic.lookup(AdventureKeys.PO_SERVICE);
Puerto IntfOrdenCompra =
       opcPurchaseOrderSvc.getPort(PurchaseOrderIntf.class);
(Puerto (Stub))._setProperty(Stub.ENDPOINT_ADDRESS_PROPERTY,
   "http://localhost:8000/webservice/PoEndpointEJB");

En un entorno J2EE, el contenedor J2EE se reserva el derecho de utilizar dos propiedades relacionadas con la seguridad para sus propios fines. Como resultado, los clientes J2EE que utilizan cualquiera de los tres modos de comunicación (stub, proxy dinámico o DII) no deben configurar estas dos propiedades de seguridad:

javax.xml.rpc.security.auth.nombre de usuario
javax.xml.rpc.security.auth.contraseña

Sin embargo, los desarrolladores de J2SE necesitan establecer estas dos propiedades de seguridad si invocan un servicio web que requiere autenticación básica. Al usar DII, la aplicación cliente puede establecer las propiedades en la interfaz de llamadas . Consulte el ejemplo de código 5.7 , que ilustra la configuración de estas propiedades.

Los desarrolladores de clientes J2EE deben evitar establecer propiedades que no sean la propiedad javax.xml.rpc.endpoint.address .

Evite establecer propiedades no estándar si es importante lograr la portabilidad entre los tiempos de ejecución JAX-RPC. Las propiedades no estándar son aquellas cuyos nombres de propiedad no están precedidos por javax.xml.rpc .

Evite usar la propiedad javax.xml.rpc.session.maintain . Esta propiedad se refiere a la capacidad de un servicio para admitir sesiones. A menos que tenga control sobre el desarrollo tanto del cliente como del punto final, como cuando ambos se desarrollan dentro de la misma organización, no puede estar seguro de que los puntos finales del servicio web admitan sesiones y puede tener problemas si establece esta propiedad incorrectamente. .

5.3.4. Asignación de tipos de WSDL a Java
Al trabajar con servicios web, puede haber diferencias entre los tipos definidos por SOAP (definidos en el documento WSDL) utilizados por el servicio y los tipos definidos por Java utilizados por la aplicación cliente. Para manejar estos diferentes tipos, un cliente de un servicio web no puede usar el enfoque normal e importar clases remotas. En su lugar, el cliente debe correlacionar los tipos WSDL con los tipos Java para obtener los tipos de parámetro y retorno utilizados por el servicio. Una vez que se asignan los tipos, el cliente tiene los tipos de Java correctos para usar en su código.

Generalmente, el tiempo de ejecución de JAX-RPC maneja la asignación de parámetros, excepciones y valores devueltos a los tipos de JAX-RPC. Cuando un cliente invoca un servicio, el tiempo de ejecución JAX-RPC asigna los valores de los parámetros a sus representaciones SOAP correspondientes y envía una solicitud HTTP que contiene un mensaje SOAP al servicio. Cuando el servicio responde a la solicitud, el tiempo de ejecución de JAX-RPC recibe esta respuesta SOAP y asigna los valores devueltos a objetos Java o tipos estándar. Si se produce una excepción, el tiempo de ejecución asigna WSDL:fault a una excepción de Java o a javax.rmi.RemoteException si se encuentra un SOAP:fault . (Esto se analiza con más detalle en “ Manejo de excepciones ” en la página 230 ).

El tiempo de ejecución de JAX-RPC admite los siguientes tipos de valores estándar: String , BigInteger , Calender , Date , boolean , byte , short , int , long , float , double y matrices de estos tipos. Los servicios pueden devolver tipos MIME como imágenes asignadas a la clase java.awt.Image y texto XML como objetos javax.xml.transform.Source . (El perfil básico WSDL 1.0 no es compatible con javax.xml.transform.Sourceobjetos como tipos mimo. Como resultado, debe evitar este uso hasta que sea compatible con una versión futura de WSDL). Un servicio también puede devolver tipos complejos, y estos se asignan a representaciones de objetos Java. Para obtener más información, consulte “ Tipos de parámetros para operaciones de servicios web ” en la página 72 .

Cuando se utilizan stubs, la herramienta de mapeo JAX-RPC WSDL-to-Java mapea tipos de parámetros, excepciones y valores devueltos en las clases generadas utilizando la información contenida en el documento WSDL proporcionado por el desarrollador. Los tipos complejos definidos dentro de un documento WSDL están representados por clases Java individuales, al igual que las fallas. Una herramienta de asignación de WSDL a Java incluida con el tiempo de ejecución JAX-RPC también genera clases para serializar y deserializar estos valores a XML. El tiempo de ejecución de JAX-RPC utiliza estas clases generadas para serializar los valores de los parámetros en un mensaje SOAP y deserializar los valores devueltos y las excepciones.

Use herramientas de WSDL a Java para generar clases de soporte, incluso si usa el enfoque de proxy dinámico o DII.

Siempre que sea posible, los desarrolladores deben intentar usar una herramienta para realizar la asignación de WSDL a Java, ya que una herramienta maneja correctamente el formato WSDL y la semántica de asignación. Tenga en cuenta que los objetos Java generados por estas herramientas de mapeo contienen constructores vacíos y métodos de obtención y configuración para los elementos. Debe usar el constructor vacío para crear una instancia del objeto y establecer cualquier valor de campo o elemento usando los métodos de establecimiento correspondientes. JAX-RPC no garantiza que asignará correctamente los valores creados como parte del constructor a los campos correspondientes.

Aunque no es aconsejable, es posible que un desarrollador trabaje sin el beneficio de una herramienta de mapeo, si no hay ninguna disponible. Sin embargo, sin tales herramientas de mapeo, el alcance del trabajo del desarrollador se expande enormemente. Por ejemplo, solo para compilar el código del cliente, el desarrollador debe comprender el WSDL para un servicio y generar manualmente clases Java que coincidan con el parámetro y los tipos de retorno definidos en el documento WSDL o, en el caso de un proxy dinámico, el cliente- representación lateral de la interfaz de punto final de servicio. Estas clases deben configurarse correctamente para que el tiempo de ejecución JAX-RPC pueda hacer coincidir los tipos de mensajes SOAP con los objetos Java correspondientes.

5.3.5. Procesamiento de valores devueltos
Las aplicaciones J2EE generalmente usan componentes web para generar datos devueltos para su visualización. Por ejemplo, un cliente que accede a un servicio de seguimiento de pedidos puede mostrar información de seguimiento en una página web utilizando un navegador HTML. El componente J2EE puede tomar los valores devueltos por el servicio web y manejarlos como cualquier otro objeto Java. Por ejemplo, un componente web en una aplicación de cliente J2EE podría consultar el estado de un pedido de un servicio de seguimiento de pedidos, que devuelve estos valores dentro de un objeto similar a JavaBeans. El componente del cliente coloca el objeto devuelto en el ámbito de la solicitud y utiliza un JSP para mostrar su contenido. (Consulte el ejemplo de código 5.9 ).

Ejemplo de código 5.9. JSP para generar un documento HTML
<html>
ID de pedido: ${bean.orderId}
Estado: ${bean.status} <br>
Nombre: ${bean.givenName} ${bean.familyName} <br>
</html>

La plataforma J2EE tiene un amplio conjunto de tecnologías de componentes para generar contenido web, incluida la tecnología JavaServer Pages (JSP) para generar contenido HTML y Java Standard Tag Libraries (JSTL). JSTL es un conjunto de etiquetas que ayudan al desarrollador de un cliente a formatear los JSP. Por ejemplo, JSTL proporciona etiquetas adicionales para bucles, acceso a bases de datos, acceso a objetos y transformaciones de hojas de estilo XSLT. La versión actual de JSP (2.0), junto con las versiones futuras, proporciona un lenguaje de expresión que permite a un desarrollador acceder a las propiedades del bean. Juntos, los desarrolladores pueden usar las tecnologías JSTL y JSP para generar documentos HTML a partir de los datos recuperados de un servicio. Por ejemplo, un desarrollador podría generar el siguiente documento HTML para los detalles del pedido (consulte el ejemplo de código 5.10). Este documento HTML se devuelve al cliente de navegador HTML que solicitó el servicio.

Ejemplo de código 5.10. Documento HTML
<html>
    Pedido: 54321<br>
    Estado: ENVIADO<br>
    Nombre: Duque Smith<br>
</html>

Un caso de uso diferente podría ser el uso de componentes EJB con datos devueltos en un flujo de trabajo. Por ejemplo, a medida que avanza el flujo de trabajo, pueden proporcionar actualizaciones de seguimiento de pedidos formateando los datos de seguimiento en HTML y adjuntándolos a un mensaje de correo electrónico enviado al cliente. A menos que la solicitud inicial se haya originado en un cliente de nivel web, los componentes EJB en una situación de flujo de trabajo no tienen disponibles tecnologías de nivel web como JSP. Además, el servicio de seguimiento de pedidos puede devolver resultados como documentos XML, lo que requiere componentes EJB para aplicar transformaciones XSL a estos documentos. El ejemplo de código 5.11 muestra un documento XML que contiene los datos devueltos por el servicio.

Ejemplo de código 5.11. Datos devueltos como documento XML
<detalles del pedido>
    <id>54321</id>
    <status>ENVIADO</status>
    <información de envío>
       <nombre de familia>Smith</nombre de familia>
       <nombre-dado>Duque</nombre-dado>
    </info de envío>
</detalles del pedido>

Un componente EJB puede usar la hoja de estilo XSL que se muestra en el Ejemplo de código 5.12 para transformar un documento XML de detalles de pedido en el mismo documento HTML que en el Ejemplo de código 5.10 . Este documento HTML puede adjuntarse a un mensaje de correo electrónico y enviarse a un cliente. Las transformaciones XSLT también se pueden usar para transformar un documento en múltiples formatos para diferentes tipos de clientes.

Ejemplo de código 5.12. Hoja de estilos XSL
<xsl:versión de hoja de estilo='1.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transformar'>

 <xsl:método de salida="html"/>
 <xsl:template match="text()"/>

 <xsl:template match="detalles del pedido">
   <html>
   Orden: <xsl:value-of select="id/text()"/><br/>
   <xsl:apply-templates/>
   </html>
 </xsl:plantilla>

 <xsl:template match="información de envío">
  Nombre: <xsl:value-of select="nombre-dado/texto()"/>
        <xsl:texto> </xsl:texto>
        <xsl:value-of select="nombre-de-familia/texto()"/>
  <br/>
 </xsl:plantilla>

 <xsl:template match="estado">
  Estado: <xsl:value-of select="text()"/><br/>
 </xsl:plantilla>
</xsl:hoja de estilo>

Las tecnologías para manejar y transformar documentos XML también están disponibles para componentes web como servlets o JSP. Los componentes web pueden usar componentes de etiquetas personalizadas, XSL o las API JAXP para manejar documentos XML. (Para obtener más información sobre el manejo de documentos XML, consulte el Capítulo 4 ).

En general, siempre que sea posible, los desarrolladores de clientes deben usar JSP para generar respuestas por parte de un servicio y presentar los datos como una vista a los clientes (como los navegadores que usan tecnologías de nivel web).

Para clientes en un entorno de nivel no web donde la tecnología JSP no está disponible, los desarrolladores deben usar transformaciones XSLT.

Los desarrolladores pueden utilizar la tecnología JSP para acceder al contenido de los documentos XML y crear una página HTML a partir del contenido del documento XML. El Ejemplo de código 5.13 muestra cómo la tecnología JSP facilita el análisis del contenido XML y la creación de una página HTML a partir del contenido detallado del pedido que se muestra en el Ejemplo de código 5.11 .

Ejemplo de código 5.13. JSP generando una respuesta de servicio web
<%@ taglib prefijo="x" uri="/WEB-INF/x-rt.tld" %>
<x:parse xml="${orderDetailsXml}" var="od" scope="aplicación"/>
<html>
  Pedido:<x:out select="$od/orderdetails/id"/><br>
  Estado:<x:out select="$od/orderdetails/status"/><br>
  Nombre:<x:out select="$od/orderdetails/shippinginfo/given-name"/>
      <x:out select="$od/orderdetails/shippinginfo/family-name"/>
</html>

En este ejemplo, la aplicación J2EE primero coloca el documento de detalles del pedido recibido del servicio en el ámbito de la solicitud utilizando la clave orderDetailsXML. Las siguientes líneas son código JSP que utiliza la etiqueta x:out JSTL para acceder al contenido XML de los detalles del pedido. Estas líneas de código seleccionan campos de interés (como identificador de pedido, estado y campos de nombre) usando expresiones XPath y convierten los datos a HTML para presentarlos a un cliente de navegador. El código JSP se basa en etiquetas JSTL para acceder a estas partes del documento de detalles del pedido. Por ejemplo, la etiqueta JSTL x:out , que utiliza expresiones XPath, accede a los campos de identificador, estado y nombre del pedido en el documento de detalles del pedido. Cuando se completa el procesamiento de JSP, el resultado es idéntico a la página HTML que se muestra en el ejemplo de código 5.10 .

5.3.6. Manejo de excepciones
Se producen dos tipos de excepciones para las aplicaciones cliente que acceden a los servicios web: excepciones del sistema y excepciones específicas del servicio, que son iniciadas por un extremo del servicio. Se lanzan excepciones del sistema para condiciones tales como pasar parámetros incorrectos al invocar un método de servicio, inaccesibilidad del servicio, error de red o algún otro error fuera del control de la aplicación. Las excepciones de servicio, que se asignan a partir de fallas, se generan cuando se encuentra un error específico del servicio. La aplicación cliente debe tratar con ambos tipos de excepciones.

5.3.6.1. Excepciones del sistema
Las excepciones del sistema generalmente involucran errores imprevistos, como un tiempo de espera de la red o un servidor no disponible o inalcanzable, que ocurren al invocar un servicio web. Si bien las excepciones del sistema generalmente están fuera del control del desarrollador del cliente, aún debe tener en cuenta que estos errores pueden ocurrir y debe tener una estrategia para que su aplicación cliente se ocupe de estas situaciones. Por ejemplo, con este tipo de errores, puede ser útil que la aplicación cliente solicite al usuario que vuelva a intentar la operación o redirigir al usuario a un servicio alternativo, si es posible. Muchas veces, la única solución es mostrar la ocurrencia de la excepción al usuario final. A veces, puede ser apropiado traducir la excepción del sistema a una excepción no verificada e idear una forma global de manejarlas.

Las excepciones del sistema, que el cliente recibe como RemoteException , surgen por una variedad de razones. A menudo, las excepciones del sistema ocurren debido a fallas en la red o errores del servidor. También pueden ser el resultado de una falla de SOAP. Dado que una RemoteException generalmente contiene una explicación del error, la aplicación puede usar ese mensaje para proporcionar su propio mensaje de error al usuario y puede solicitarle que realice una acción adecuada. Si un cliente de componente EJB está haciendo su trabajo en nombre de un cliente de nivel web, el cliente EJB debe lanzar una excepción al cliente de nivel web. El cliente de nivel web notifica al usuario, dándole la oportunidad de volver a intentar la acción o elegir una acción alternativa.

Cuando se comunica mediante stubs, la mayoría de las excepciones del sistema involucran problemas de red o la configuración del stub. Se genera un error de configuración desde los métodos _getProperty y _setProperty como una excepción javax.xml.rpc.JAXRPCException e indica un nombre de propiedad que no es compatible o no es válido, un valor de configuración de propiedad que no está permitido o una falta de coincidencia de tipo.

Cuando se utiliza un proxy dinámico, el método getPort puede generar una excepción javax.xml.rpc.ServiceException si el documento WSDL tiene metadatos insuficientes para crear correctamente el proxy.

Un cliente puede recibir varias excepciones diferentes al usar la interfaz de llamada DII . Un cliente puede recibir una excepción remota si se produce un error en la red. Un cliente también puede recibir una excepción javax.xml.rpc.JAXRPCException si los métodos de conjunto de llamadas utilizan nombres de propiedad no válidos o intentan establecer propiedades con valores no válidos.

Por ejemplo, una aplicación cliente que accede a un servicio de seguimiento de pedidos puede querer usar un servicio alternativo o punto final si recibe una excepción remota que indica la falta de disponibilidad del servicio.

Los componentes web pueden aprovechar el sistema de mensajes de error del servlet y asignar RemoteException a algunas instrucciones de manejo de excepciones en el archivo web.xml . El cliente puede lanzar su propia javax.servlet.ServletException y puede mostrar un mensaje de error general de la aplicación. Es posible extender ServletException para crear un conjunto de excepciones específicas de la aplicación para diferentes errores. También puede usar el archivo para definir un JSP de error específico para manejar el error, como se muestra en el ejemplo de código 5.14 .

Ejemplo de código 5.14. Uso del sistema de mensajes de error de servlet
<página de error>
    <tipo-de-excepción>java.lang.Runtime</tipo-de-excepción>
    <ubicación>/order_tracking_system_exception.jsp</ubicación>
</página-de-error>

Aunque no interactúan directamente con el usuario, los clientes de flujo de trabajo implementados como componentes EJB pueden beneficiarse del procesamiento transaccional, especialmente si se utilizan transacciones administradas por contenedor. Sin embargo, dado que no puede suponer que el servicio web también es transaccional, es posible que deba revertir manualmente algunos de sus cambios si otros servicios web están involucrados en el procesamiento. Tenga en cuenta que revertir los cambios puede ser difícil de lograr y es propenso a problemas.

Un componente J2EE que recibe una excepción remota al acceder a un servicio puede volver a intentar conectarse al servicio un número determinado de veces. Si ninguno de los reintentos tiene éxito, el cliente puede registrar un error y salir del flujo de trabajo. O bien, el cliente puede reenviar la unidad de trabajo a otro proceso en el flujo de trabajo y permitir que ese componente acceda al mismo servicio en un momento posterior o use un servicio diferente. Los clientes basados ​​en componentes EJB que usan DII pueden ubicar un servicio alternativo usando la API JAXR desde un registro.

5.3.6.2. Excepciones de servicio
Las excepciones de servicio ocurren cuando una llamada de servicio web hace que el servicio devuelva una falla. Un servicio arroja tales fallas cuando los datos que se le presentan no cumplen con los criterios del servicio. Por ejemplo, los datos pueden estar más allá de los límites de los límites, pueden duplicar otros datos o pueden estar incompletos. Estas excepciones se definen en el archivo WSDL del servicio como elementos de operación y se denominan elementos wsdl:fault . Estas excepciones son excepciones comprobadas en las aplicaciones cliente. Por ejemplo, un cliente que acceda al servicio de seguimiento de pedidos puede pasar al servicio un identificador de pedido que no coincida con los pedidos mantenidos por el servicio. El cliente puede recibir una excepción OrderNotFoundException , ya que ese es el mensaje de error definido en el documento WSDL:

<nombre de la falla="OrderNotFoundException"
          mensaje="tns:OrderNotFoundException"/>

Este mecanismo de mapeo de excepciones no se puede usar con DII, ya que este modo de comunicación devuelve todas las excepciones como java.rmi.RemoteException . Tenga en cuenta que no hay garantía de que el sistema de tiempo de ejecución JAX-RPC genere una ServiceException para un error wsdl:fault específico . En su lugar, el tiempo de ejecución puede lanzar una excepción de tiempo de ejecución javax.xml.rpc.soap.SOAPFaultException .

Utilice las herramientas JAX-RPC para asignar fallas a objetos Java. (Consulte “ Asignación de tipos de WSDL a Java ” en la página 225 ). Estas herramientas generan las asignaciones de parámetros necesarias para las clases de excepción y generan las clases necesarias para la asignación. Las clases de excepciones generadas extienden java.lang.Exception . El desarrollador de la aplicación cliente es responsable de detectar estas excepciones comprobadas en un bloque try / catch . El desarrollador también debe intentar proporcionar la funcionalidad de la aplicación adecuada para recuperarse de tales excepciones. Por ejemplo, un cliente de seguimiento de pedidos podría incluir el código que se muestra en el ejemplo de código 5.15 para manejar los casos en los que no se encuentra un pedido coincidente. El servicio de seguimiento de pedidos lanzó unOrderNotFoundException y el cliente presentó al usuario un cuadro de diálogo GUI que indicaba que no se encontró el pedido.

Ejemplo de código 5.15. Cliente J2SE mostrando un error
intentar {
   OrderDetails od = service.getOrderDetails(orderId);
} captura (OrderNotFoundException onx) {
   JOptionPane.showMessageDialog(gui,
      "Pedido no encontrado con ID de pedido" + ID de pedido, "Error",
      JOptionPane.ERROR_MESSAGE);
}

Un cliente de componente web J2EE puede manejar la excepción utilizando las funciones proporcionadas por el entorno J2EE. El cliente puede ajustar la excepción de la aplicación y generar una excepción no verificada, como javax.servlet.ServletException , o puede asignar la excepción directamente a una página de error en el descriptor de implementación web. En el ejemplo de código 5.16, el cliente asigna la OrderNotFoundException directamente a un JSP. Los clientes siempre deben proporcionar mensajes legibles por humanos y dar al usuario la posibilidad de volver a una página de entrada.

Ejemplo de código 5.16. Uso del mecanismo de error de servlet
<página de error>
   <tipo de excepción>com.sun.blueprints.adventure.
          OrderNotFoundException</tipo-de-excepción>
   <ubicación>/order_not_found_exception.jsp</ubicación>
</página-de-error>

Tenga en cuenta que el uso del mecanismo de error del servlet de esta manera vincula estrechamente el cliente de la aplicación web con el servicio. Si el servicio cambia las fallas que arroja, o cualquiera de los parámetros de falla, el cliente se ve directamente afectado.

Los desarrolladores de clientes deben aislar las excepciones específicas del servicio tanto como sea posible envolviéndolas en sus propias excepciones específicas de la aplicación para evitar que la aplicación del cliente esté demasiado vinculada a un servicio. Esto es especialmente importante cuando el servicio está fuera del control del desarrollador del cliente o si el servicio cambia con frecuencia. Un cliente puede requerir una refactorización cuando cambia un servicio porque los stubs y las representaciones de objetos Java compatibles con las excepciones se generaron de forma estática.

Los desarrolladores de clientes también pueden generalizar el manejo de excepciones y, en su lugar, manejar todas las excepciones en un solo punto de la aplicación. Mantener el manejo de excepciones en un solo lugar en una aplicación reduce la necesidad de incluir código para manejar excepciones en toda la aplicación.

Ejemplo de código 5.17. Procesamiento de excepciones generalizado
intentar {
   OrderDetails od = stub.getOrderDetails(orderId);
} captura (OrderNotFoundException onx) {
   RuntimeException re= nueva RuntimeException(onx);
}

En el ejemplo de código 5.17 , la excepción lanzada como resultado de la llamada al servicio web se establece como la causa de la excepción en tiempo de ejecución. Esta técnica, conocida como encadenamiento de excepciones, produce un mejor seguimiento de la pila y ayuda a mostrar más claramente la causa raíz de la excepción. El encadenamiento de excepciones junto con el mecanismo de error de servlet que se muestra en el ejemplo de código 5.16 puede proporcionar un medio generalizado para mostrar las excepciones de servicio.

La verificación de límites puede ayudar a prevenir excepciones de servicio. Por ejemplo, un cliente de un servicio de seguimiento de pedidos podría verificar primero que el identificador de un pedido sea un número entero de cinco dígitos o que su valor se encuentre dentro de un cierto rango. Si bien la API JAX-RPC garantiza que los tipos sean correctos, el desarrollador de la aplicación es responsable de verificar las limitaciones de los límites.

Los clientes en un entorno J2EE que presentan contenido HTML pueden usar JavaScript para validar los límites antes de enviar solicitudes a un servicio. Los clientes que utilizan una interfaz HTML deben asegurarse de que los tipos de valores ingresados ​​sean correctos, ya que todos los parámetros HTML se tratan como objetos de cadena .

Realice comprobaciones de límites y otras validaciones en el lado del cliente para que las llamadas al servicio web y los viajes de ida y vuelta al servidor se reduzcan al mínimo.

## 5.4. Consideraciones Generales
Hay algunas consideraciones generales que los desarrolladores de clientes de servicios web deberían tener en cuenta. En particular, los desarrolladores deben ser conscientes de los problemas relacionados con el estado conversacional. En esta sección también se incluyen algunas pautas para mejorar la experiencia del usuario y una breve discusión sobre las consideraciones de diseño del lado del servidor. Por último, hay una explicación de cómo empaquetar aplicaciones cliente.

5.4.1. Administrar el estado conversacional
Los clientes deben ver los servicios web como sin estado y deben asumir que un punto final de servicio no retiene conocimiento de las interacciones anteriores del cliente. Sin embargo, algunos casos de uso pueden requerir que un cliente realice una secuencia de llamadas a un servicio para realizar una operación determinada.

Lo mejor es que la aplicación cliente mantenga el estado cuando las circunstancias lo requieran. El cliente puede manipular este estado retenido cuando no está en línea. Hay formas para que un cliente se identifique a través de múltiples llamadas a un servicio y administre su estado para mantenerlo sincronizado con el estado en el servidor.

5.4.1.1. Estado de coordinación con un extremo de servicio
Hay determinadas situaciones en las que el cliente puede querer que el extremo del servicio gestione su estado de conversación. Una aplicación cliente, por ejemplo, puede tener capacidades de procesamiento mínimas y recursos de memoria insuficientes para almacenar adecuadamente su estado de conversación durante una interacción de sesión con un servicio. Para que un punto final de servicio mantenga un estado de conversación con sus clientes, el punto final debe diseñarse teniendo esto en cuenta.

A menudo, dichos puntos finales están diseñados para usar un token único y no replicable para identificar la comunicación de un cliente específico, al igual que los navegadores usan el mecanismo de cookies. El extremo del servicio y la aplicación del cliente pasan el token entre ellos con cada llamada durante su conversación. El ejemplo de código 5.18 muestra la definición de los métodos de un extremo del servicio de administración de pedidos para recuperar y actualizar un pedido de compra. Cada método incluye un parámetro de token, clientToken, que identifica al cliente específico. La aplicación cliente crea un token único y lo pasa al extremo del servicio al invocar estos métodos. Cuando recibe la invocación del método, el extremo del servicio identifica al cliente y conserva su estado. En este ejemplo, observe que el extremo puede identificar la orden de compra porque se pasa el mismo token de cliente al recuperar y actualizar la orden de compra.

Ejemplo de código 5.18. Métodos de interfaz de punto final de servicio con tokens únicos
interfaz pública OrderManagementSEI extiende remoto {
   public void updatePurchaseOrder(PurchaseOrder po,
          String clientToken) lanza RemoteException;
   orden de compra pública getPurchaseOrder(String id,
          String clientToken) lanza RemoteException;
}

Cuando un componente EJB es la base de un punto final de servicio, el componente EJB puede conservar el estado de conversación en un almacén de datos durante la sesión. El punto final del servicio aún puede estar diseñado para usar tokens, y dichos tokens pueden representar la clave principal de un bean de entidad. En este caso, el diseñador de terminales debe asegurarse de limpiar los datos de sesión obsoletos del almacén persistente. Esto se puede hacer utilizando una marca de tiempo en el bean de entidad que contiene el estado conversacional y un bean temporizador para rastrear el tiempo transcurrido. Un punto final que no limpia correctamente los datos de sesión obsoletos podría conservar una gran cantidad de datos.

Un desarrollador de cliente cuya aplicación interactúa con un punto final que almacena el estado conversacional debe tener un conocimiento detallado de los requisitos del token del punto final y el estado que mantiene el punto final. Además, el desarrollador necesita un conocimiento detallado del tiempo de espera, si existe. Esta coordinación entre el cliente y el punto final hace que estén estrechamente acoplados. Como tal, los desarrolladores deben usar este enfoque solo cuando una situación estrechamente acoplada es aceptable o requerida, o cuando las responsabilidades del cliente y el extremo del servicio están claramente documentadas.

5.4.1.2. Sincronización de estado compartido entre clientes
Hay momentos en que varios clientes de servicios web comparten el estado entre ellos. Dicho estado compartido puede ser de solo lectura o puede ser un estado que se actualiza. El estado de solo lectura no requiere sincronización, dado que los clientes solo recuperan datos, pueden sondear el servicio a intervalos y obtener datos actuales. Sin embargo, es posible que otros clientes web actualicen simultáneamente los datos compartidos. La consistencia de los datos es un problema cuando uno o más clientes pueden estar manipulando los mismos datos al mismo tiempo.

Un caso de uso de ejemplo que ilustra el estado modificable compartido entre clientes de servicios web podría ser una aplicación de cliente de gestión de órdenes de compra. La aplicación accede a un conjunto de órdenes de compra que requieren aprobación manual. Después de que el usuario procesa manualmente estos pedidos fuera de línea, la aplicación los carga en el servicio. Es concebible que dos de tales aplicaciones cliente puedan descargar cada una algunas de las mismas órdenes de compra, y algunas de estas órdenes pueden cambiarse independientemente unas de otras. Después de que la primera aplicación cliente cargue sus datos modificados en el servicio, hay un problema de coherencia de datos si la segunda aplicación intenta cargar sus datos modificados.

Para evitar tales inconsistencias, el desarrollador del cliente debe tener en cuenta ciertas consideraciones. El desarrollador puede detectar la inconsistencia de los datos utilizando técnicas como la verificación de la marca de tiempo o el análisis de la suma de verificación antes de cargar los datos modificados, y esto puede requerir la cooperación del extremo del servicio. El bloqueo de datos es otra técnica para evitar cambios simultáneos en los mismos datos. Un extremo de servicio podría generar una excepción específica del servicio que indique que otro cliente ha modificado los datos y es posible que no estén sincronizados. La aplicación del cliente se puede diseñar para sobrescribir la copia del punto final del servicio o puede solicitar al usuario que vuelva a ingresar los datos. Tanto los desarrolladores de punto final de servicio como de cliente deben asegurarse de que sus respectivas aplicaciones manejen tales inconsistencias de manera adecuada.

5.4.2. Mejora de la experiencia del usuario
La dinámica de la interfaz de usuario juega un papel importante en la determinación de la calidad de la experiencia del usuario. Los clientes de J2SE tienen la ventaja de aprovechar un amplio conjunto de API, en particular, las API de Swing, para que la experiencia del usuario sea de la mejor calidad posible. Estas API brindan a los clientes de J2SE la capacidad de consultar un servicio web en segundo plano, invocando el servicio web en un subproceso diferente y luego actualizando la interfaz de usuario cuando se recibe la información. El cliente puede continuar su interacción con el usuario hasta que el servicio devuelva la información. Con otros tipos de clientes, el usuario a menudo se queda con lo que parece ser una pantalla congelada o una aplicación no funcional o bloqueada, ya que la aplicación cliente se bloquea durante la llamada al servicio web. En resumen, el usuario no sabe si la aplicación sigue viva.

Un cliente J2SE puede usar el método SwingUtilities.invokeLater para realizar la llamada al servicio en un hilo separado y así lograr una mejor experiencia de usuario. (Consulte el Ejemplo de código 5.19 ). Este método toma un único argumento de un objeto que implementa la interfaz Runnable . Cuando se invoca el método invocarLater , la plataforma J2SE crea otro subproceso para ejecutar en segundo plano al invocar el método de ejecución en la clase Runnable .

Ejemplo de código 5.19. Cliente J2SE usando SwingUtils.invokeLater
privado void trackOrder() {
   setStatus("Orden de Seguimiento" + getOrderId());
   GetOrderDetails gd = new GetOrderDetails(this);
   SwingUtilities.invokeLater(gd);
}

clase GetOrderDetails implementa Runnable {
   interfaz gráfica de usuario OTClientGUI privada;
   ID de orden de cadena privada;
   booleano hecho = falso;

   GetOrderDetails(GUI de OTClientGUI) {
       esto.gui = gui;
       this.orderId = gui.getOrderId();
   }

ejecución de vacío público () {
   si (!hecho) {
      intentar {
         interfaz gráfica de usuario setStatus("Buscando pedido" + orderId);
         OrderDetails od = WSProcessor.getOrderDetails(orderId);
         si (od != nulo) {
            gui.setDetalles(od);
         }
      } captura (OrderNotFoundException ex) {
         gui.clearDetails();
         gui.setStatus("");
         JOptionPane.showMessageDialog(gui,
            "Pedido no encontrado con ID de pedido" + ID de pedido,
            "Error",
             JOptionPane.ERROR_MESSAGE);
      } catch (excepción ex) {
         // no hacer nada por ahora
      }
      gui.setStatus("Búsqueda completada para ID de pedido" + ID de pedido);
      SwingUtilities.invokeLater(esto);
      hecho = verdadero;
      }
   }
}

Este ejemplo ilustra cómo un cliente J2SE puede utilizar las API de la plataforma J2SE para mejorar la experiencia del usuario. En este ejemplo, el usuario ha seleccionado una opción para rastrear un pedido que actualmente está manejando el servicio web. Esa opción llama al método invoqueLater , que a su vez invoca una clase que implementa la interfaz Runnable . Esta clase, mediante un mecanismo de devolución de llamada, actualiza al usuario con mensajes que indican el estado de la llamada del servicio web y los detalles relacionados con el pedido que se está rastreando. Si no se encuentra el pedido, el código se encarga de mostrar al usuario un mensaje de error adecuado que indica la excepción.

Nota : hay más información disponible en la API de SwingUtilities , junto con el uso de subprocesos y GUI con clientes J2SE. Puede encontrar esta información en http://java.sun.com/docs/books/tutorial/uiswing/misc/threads.html .

5.4.3. Consideraciones de diseño del lado del servidor para clientes
Ya debería estar claro que los desarrolladores de clientes y los proveedores de terminales de servicio no operan en el vacío. Cuando se sabe que el entorno del cliente de destino se basa en JAX-RPC, el desarrollador del extremo del servicio puede proporcionar bibliotecas preempaquetadas y documentación del lado del servidor. Estas bibliotecas deben contener todos los archivos, como la representación del lado del cliente de la interfaz del extremo del servicio y sus clases dependientes, que son necesarios para acceder al servicio. La biblioteca puede incluir clases de fachada adicionales que simplifican la vista del cliente del servicio y potencialmente protegen al cliente de algunos cambios futuros en el servicio. Estas clases de fachada ayudan a un desarrollador de clientes no solo a acceder al servicio de manera estandarizada, sino que también pueden mejorar su comprensión del punto final del servicio para desarrollar mejores clientes.

La documentación HTML más extensa de un servicio que cubre los parámetros requeridos por el servicio, los valores devueltos y las excepciones ayuda a los desarrolladores a interactuar mejor con el servicio. Esta información debe ir más allá de lo que se incluye en el documento WSDL.

5.4.4. embalaje
Para acceder a un servicio, un cliente independiente requiere un entorno de tiempo de ejecución. Para clientes J2SE, el tiempo de ejecución se debe empaquetar con la aplicación. Los clientes J2EE confían en el tiempo de ejecución JAX-RPC.

Los clientes J2ME no necesitan empaquetar el tiempo de ejecución JAX-RPC con las aplicaciones. Aunque los apéndices deben empaquetarse con una aplicación, los apéndices son portátiles en tiempos de ejecución JAX-RPC. La portabilidad de los stubs es fundamental porque los clientes J2ME no pueden generar ni compilar código de implementación de stubs y, por lo tanto, deben confiar en un aprovisionamiento más dinámico.

En esta sección se analizan los problemas de embalaje para los diferentes tipos de clientes.

5.4.4.1. Clientes J2EE
Los clientes de servicios web que se ejecutan en un entorno J2EE requieren algunos artefactos básicos, como se indica a continuación:

Referencia de servicio : un elemento de referencia de servicio en el descriptor de implementación

Archivo de asignación : un archivo de asignación JAX-RPC

documento WSDL

Interfaz de extremo de servicio : un stub o proxy dinámico

clases generadas

El elemento service-ref , parte del esquema general J2EE 1.4, contiene información sobre un servicio. Los descriptores de despliegue del módulo de cliente de aplicación web, EJB y J2EE utilizan este elemento para localizar los archivos de correlación JAX-RPC, así como el archivo WSDL del servicio. El elemento de referencia de servicio asigna un servicio a un nombre de recurso JNDI y también especifica la interfaz de punto final de servicio para aquellos clientes que usan stubs y proxies dinámicos. (Los clientes que usan DII no necesitan especificar la interfaz de punto final del servicio). También especifica el archivo WSDL para el servicio (su ubicación se proporciona en relación con la raíz del paquete) y el nombre calificado para el servicio en el archivo WSDL. Si se requiere un archivo WSDL, el elemento especifica un archivo de correlación JAX-RPC. La ubicación del archivo de asignación también es relativa a la raíz del paquete.El ejemplo de código 5.20 es un ejemplo de una referencia de servicio:

Ejemplo de código 5.20. Fragmento web.xml para referencia de servicio web
<ref-servicio>
   <description>Cliente de servicio OPC OT</description>
   <nombre-ref-servicio>servicio/OpcOrderTrackingService
   </servicio-ref-nombre>
   <interfaz de servicio>
      com.sun.j2ee.blueprints.adventure.web.actions.
         OpcOrderTrackingServiceOpcOrderTrackingService
   </servicio-interfaz>
   <archivo-wsdl>WEB-INF/wsdl/OpcOrderTrackingService.wsdl
   </archivo-wsdl>
   <archivo de asignación de jaxrpc>WEB-INF/opc-ot-jaxrpc-mapping.xml
   </jaxrpc-mapping-archivo>
   <servicio-qname
      xmlns:servicens="urna:OpcOrderTrackingService">
         servicios:OpcOrderTrackingService
   </servicio-qname>
</ref-servicio>

El archivo de asignación JAX-RPC especifica el nombre del paquete que contiene las clases de tiempo de ejecución generadas y define el URI del espacio de nombres para el servicio. (Consulte el ejemplo de código 5.21 ).

Ejemplo de código 5.21. Archivo de asignación JAX-RPC
<java-wsdl-mapping xmlns="http://java.sun.com/xml/ns/j2ee"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee ht
    tp://www.ibm.com/webservices/xsd/j2ee_jaxrpc_mapping_1_1.xsd"
versión="1.1">
<paquete-asignación>
   <tipo-paquete>com.sun.j2ee.blueprints.adventure.web.actions
</tipo-paquete>
<namespaceURI>urna:OpcOrderTrackingService</namespaceURI>
</paquete-asignación>
</java-wsdl-mapping>

Los archivos WSDL, incluidos los archivos WSDL parciales, se empaquetan dentro de los clientes. Su ubicación depende del tipo de módulo. Dado que los clientes que usan DII no requieren un archivo WSDL, dejan la parte del elemento del archivo wsdl del elemento ref-servicio sin definir y no deben especificar el elemento jaxrpc-mapping-file .

Para un archivo de aplicación web (WAR), el archivo WSDL está en el directorio WEB-INF/wsdl . (Consulte la Figura 5.8 ). Para un punto final EJB, así como para un cliente de aplicación J2EE, el archivo WSDL se encuentra en el directorio MET-INF/wsdl . (Consulte la Figura 5.9 ). Ambos directorios son relativos al directorio raíz del módulo de la aplicación.

Figura 5.8. Paquete de módulo de aplicación web



Figura 5.9. Empaquetado del módulo EJB



Para clientes de nivel Web, un elemento service-ref en el archivo web.xml contiene la ubicación del archivo de asignación JAX-RPC, client-jaxrpc-mapping-file.xml . La interfaz de punto final de servicio (si se proporciona) es un archivo de clase en el directorio WEB-INF/classes o está empaquetada en un archivo JAR en el directorio WEB-INF/lib . Las clases generadas se encuentran en el mismo directorio.

Para los componentes de cliente de nivel EJB, el elemento service-ref se define en el descriptor de implementación del archivo ejb-jar.xml y el archivo de mapeo client-jaxrpc-mapping-file.xml . Los archivos WSDL están en un directorio META-INF/wsdl . La interfaz del punto final del servicio, así como los archivos de clase generados, se almacenan en el directorio raíz del módulo.

El desarrollador del cliente debe asegurarse de que la definición de referencia de recurso en el descriptor de implementación del cliente sea correcta y que el archivo de asignación JAX-RPC esté empaquetado en el módulo correcto.

5.4.4.2. Clientes J2SE
Los clientes de J2SE que utilizan stubs o proxies dinámicos deben empaquetar la interfaz de punto final de servicio con el cliente de la aplicación, y el atributo classpath del archivo de manifiesto del paquete debe hacer referencia a ellos. Los clientes J2SE también deben proporcionar un tiempo de ejecución JAX-RPC. Por ejemplo, un cliente J2SE se empaqueta junto con sus clases de soporte o con referencias a estas clases. (Consulte la Figura 5.10 ). La interfaz de punto final de servicio, así como los archivos generados necesarios, se pueden proporcionar en un archivo JAR separado.

Figura 5.10. Empaquetado de un cliente J2SE con la biblioteca de servicios web



La figura 5.10 muestra cómo empaquetar un cliente J2SE de manera modular. Las clases específicas para el acceso al servicio web se mantienen en un archivo JAR separado al que se hace referencia a través de una dependencia de ruta de clase. Empaquetado de esta manera, un cliente puede intercambiar el acceso al punto final del servicio sin tener que cambiar el código del cliente central. Las clases de acceso al servicio también pueden ser compartidas por diferentes clientes de aplicaciones que acceden al mismo servicio. Un desarrollador que utiliza una interfaz de servicio preempaquetada también puede desarrollar un cliente de servicio web con menos conocimiento de un servicio.

5.4.4.3. Clientes J2ME
Dos paquetes opcionales, ambos extensiones de la plataforma J2ME, habilitan los servicios web en la plataforma J2ME al proporcionar soporte de tiempo de ejecución para el procesamiento XML y la comunicación JAX-RPC. (Tenga en cuenta que aunque las capacidades de procesamiento XML no se proporcionan en la plataforma J2ME, son necesarias para la comunicación JAX-RPC).

Un desarrollador de aplicaciones cliente J2ME debe empaquetar ciertos recursos con una aplicación J2ME. En primer lugar, las aplicaciones J2ME se empaquetan en formato MIDlet. Un MIDlet es un archivo Java Archive (JAR) que contiene archivos de clase, recursos de aplicación y un archivo de manifiesto ( manifest.mf ), que contiene atributos de aplicación.

Un desarrollador también puede proporcionar un archivo Java Application Descriptor (JAD) externo para el MIDlet. Un archivo JAD proporciona al entorno J2ME información adicional sobre la aplicación, como la ubicación del archivo MIDlet de la aplicación. Los atributos de un archivo JAD reflejan los que se encuentran en el archivo de manifiesto, pero el archivo JAD tiene prioridad sobre el archivo de manifiesto. Además, un desarrollador o implementador puede anular los atributos de la aplicación en el archivo JAD. La figura 5.11 describe el paquete de una aplicación de cliente MIDlet de servicio web.

Figura 5.11. Empaquetado de una aplicación de cliente de servicio web MIDlet



El archivo MIDlet foo.jar contiene las clases de aplicación del cliente y los artefactos respectivos generados por las herramientas de desarrollo del servicio web J2ME, así como un archivo de manifiesto. Un archivo foo.jad describe el MIDlet foo.jar . Al igual que la plataforma J2EE, la plataforma J2ME con los paquetes de servicios web opcionales proporciona los recursos necesarios para la comunicación de servicios web.

## 5.5. Conclusión
Este capítulo describió los diferentes tipos de clientes que pueden acceder a los servicios web y los problemas que enfrentan los desarrolladores de estos clientes. Destacó las diferencias entre los clientes que se ejecutan en un entorno J2EE y los clientes que se ejecutan en entornos J2SE y J2ME, y cómo estas diferencias afectan el diseño de una aplicación cliente.

El capítulo describió los tres modos de comunicación disponibles para los clientes: stubs, proxy dinámico e interfaz de invocación dinámica. Estos tres modos forman la base para el acceso de un cliente a un servicio Web. Para cada modo de comunicación, el capítulo analizó los pasos para implementar clientes de servicios web. Proporcionó discusiones detalladas sobre cómo ubicar y acceder a un servicio a través del manejo de errores generados por un servicio.

El capítulo también describió cómo empaquetar diferentes tipos de clientes y analizó la gestión del estado conversacional. También proporcionó pautas para mejorar la experiencia general del usuario final.

El siguiente capítulo habla de XML en profundidad, ya que XML tiene un papel importante en los servicios web.





























