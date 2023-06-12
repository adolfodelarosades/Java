# Capítulo 3. Diseño de Service Endpoint

Los Web services interactúan con los clientes para recibir los requests(solicitudes) de los clientes y devolver las responses(respuestas). Entre la solicitud y la respuesta, un Web service aplica la lógica de negocio adecuada para procesar y cumplir con la solicitud de un cliente. El diseño de un Web service efectivo comienza con la comprensión de la naturaleza del servicio que se proporcionará, es decir, cómo el servicio interactuará con el cliente y cómo procesará y cumplirá la solicitud del cliente, junto con cómo los usuarios del servicio encontrar y hacer sus solicitudes. Este capítulo examina los Web services desde la perspectiva de la funcionalidad de interacción y procesamiento de un servicio.

El capítulo describe los aspectos clave que debe tener en cuenta al diseñar un Web service y luego muestra cómo estas consideraciones impulsan el diseño y la implementación de la interfaz y la funcionalidad del Web service. En particular, el capítulo examina las interacciones entre un servicio y sus clientes y el procesamiento comercial que realiza el servicio. Ilustra estas consideraciones a partir de ejemplos que utilizan tres escenarios típicos de Web services.

El capítulo cubre la mayoría de las decisiones que se deben tomar cuando se diseña e implementa un Web service, incluyendo la identificación de las diferentes posibilidades que dan lugar a diferentes soluciones. Describe cómo recibir requests, delegar requests a la lógica de negocio, formular responses, publicar un Web service y manejar interacciones basadas en documentos.

A lo largo del camino, el capítulo hace recomendaciones y ofrece algunas pautas para diseñar un Web service. Estas recomendaciones y puntos clave, marcados con check boxes, incluyen discusiones sobre justificaciones y compensaciones. Se ilustran con los escenarios de servicio de ejemplo. Dado que los Web services básicamente exponen interfaces interoperables para aplicaciones nuevas y existentes, un gran segmento de la audiencia de este libro puede tener aplicaciones existentes para las que ya han implementado la lógica de negocio. Por esa razón, y dado que el principal interés de la mayoría de los lectores son los Web services, este capítulo mantiene su enfoque en el desarrollo de Web services y no profundiza en los detalles del diseño e implementación de la lógica de negocio.

## 3.1. Example Scenarios - Ejemplo de Escenarios  

Repasemos los escenarios presentados en **“Typical Web Service Scenarios”** en la página 11: el ***adventure builder enterprise scenario - escenario empresarial de creación de aventuras** y los ejemplos que ilustran cuándo los Web services funcionan bien para una empresa, desde el punto de vista del diseño de un Web service. Este capítulo, en lugar de discutir los problemas de diseño de manera abstracta, amplía estos escenarios típicos para ilustrar problemas de diseño importantes y mantener la discusión en la perspectiva adecuada.

En este capítulo, nos centramos en tres tipos de Web services:

1. ***Un Web service informativo que sirve datos que se leen con más frecuencia que se actualizan***: los clientes leen la información mucho más de lo que la actualizan. En nuestro ejemplo adventure builder - creación de aventuras, un buen escenario es un Web service que proporciona a los clientes interesados información relacionada con los viajes, como pronósticos meteorológicos, para una ciudad determinada.

2. ***Un Web service que al mismo tiempo completa los requests de los clientes mientras maneja una alta proporción de datos compartidos que se actualizan con frecuencia y, por lo tanto, requieren un uso intensivo de EIS o transacciones de bases de datos***. El sistema de reservas de aerolíneas asociado con el adventure builder es un buen ejemplo de este tipo de Web service. Muchos clientes pueden enviar simultáneamente detalles de las reservas de aerolíneas deseadas, y el Web service maneja y realiza estas reservas simultáneamente.

3. ***Un Web service de proceso de negocio cuyo procesamiento de un request de cliente incluye el inicio de una serie de procesos de flujo de trabajo y de negocio de ejecución prolongada***. La decisión de ***Adventure Builder Enterprise*** de crear una interfaz de servicio para las agencias de viajes asociadas es un buen ejemplo de este tipo de Web service. A través de esta interfaz de servicio, las agencias asociadas pueden ofrecer a sus clientes los mismos servicios que se ofrecen en ***el sitio web de Adventure Builder***. Las agencias asociadas utilizan la lógica de negocio de ***Adventure Builder*** para cumplir con los pedidos de sus clientes. Un servicio como este recibe los detalles de una solicitud(request) de plan de viaje de una agencia asociada y luego el servicio inicia una serie de procesos para reservar aerolíneas, hoteles, autos de alquiler, etc. para las fechas especificadas.

Las discusiones sobre problemas de diseño de Web services en este capítulo incluyen referencias a estos ejemplos y escenarios. Sin embargo, las discusiones usan solo las características apropiadas de estos escenarios en lo que respecta a un problema de diseño en particular, y no pretenden representar un diseño completo de un escenario.

## 3.2. Flujo de una llamada de Web service

En un escenario de Web service, un cliente realiza una request a un Web service en particular, como solicitar el clima en un lugar determinado, y el servicio, después de procesar la request, envía una response al cliente para cumplir con la request. Cuando tanto el cliente como el Web service se implementan en un entorno Java, el cliente realiza la llamada al servicio invocando un método Java, junto con la configuración y el paso de los parámetros necesarios, y recibe como respuesta el resultado de la invocación del método.

Para ayudarlo a comprender el contexto dentro del cual diseña los Web services, primero observemos de alto nivel lo que sucede debajo del capó en una implementación típica de Web services en un entorno Java. La figura 3.1 muestra cómo un cliente Java se comunica con un Web service Java en la plataforma J2EE 1.4.

**Figura 3.1. Flujo de un Web service en Plataforma Java**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/371232db-8f64-4282-a99e-d4a41b32ca1f)


**Nota**: La figura 3.1 cambia cuando un cliente que no es de Java interactúa con un Web service de Java. En tal caso, el lado derecho de la figura, que refleja las acciones del Web service, sigue siendo el mismo que se muestra aquí, pero el lado izquierdo de la figura reflejaría las acciones de la plataforma del cliente. Cuando un cliente Java invoca un Web service que se encuentra en una plataforma que no es Java, el lado derecho de la figura cambia para reflejar la plataforma del Web service y el lado izquierdo, que refleja las acciones del cliente, permanece como se muestra en la figura.

Una vez que el cliente sabe cómo acceder al servicio, realiza una request al servicio invocando un método Java, que se pasa con sus parámetros al **JAX-RPC runtime** del lado del cliente. Con la llamada al método, el cliente en realidad está invocando una operación en el servicio. Estas operaciones representan los diferentes servicios de interés para los clientes. El **JAX-RPC runtime** ***asigna los tipos Java a tipos XML estándar y forma un mensaje SOAP que encapsula la llamada al método y los parámetros***. Luego, el runtime pasa el ***mensaje SOAP*** a través de los ***controladores SOAP***, si los hay, y luego al puerto de servicio del lado del servidor (server-side service port).

La request del cliente llega al servicio a través de un puerto, ya que un puerto proporciona acceso a través de un protocolo y un formato de datos específicos en un extremo de la red que consta de un nombre de host y un número de puerto.

Antes de que el puerto pase el request al endpoint, se asegura de que el contenedor J2EE aplique sus servicios declarativos (como controles de seguridad) a la SOAP request. Después de eso, cualquier controlador SOAP escrito por el desarrollador que se encuentre en su lugar se aplica al request. Tenga en cuenta que los controladores SOAP, que son opcionales, permiten a los desarrolladores aplicar una lógica de procesamiento específica de la aplicación común a todas las requests y responses que fluyen a través de este endpoint. Después de que los controladores operen en el mensaje SOAP, el mensaje se pasa al service endpoint.

El contenedor J2EE extrae la llamada de método invocada por el cliente junto con los parámetros de la llamada, realiza cualquier asignación de objeto de XML a Java necesaria y entrega el método a la implementación de la interfaz del Web service para su posterior procesamiento. Un conjunto similar de pasos ocurre cuando el servicio devuelve su response.

**Nota**: Todos los detalles entre la invocación del método y la respuesta que acabamos de describir suceden bajo el capó. La plataforma protege al desarrollador de estos detalles. En su lugar, el desarrollador solo se ocupa de la semántica típica del lenguaje de programación Java, como las llamadas a métodos Java, los tipos Java, etc.

## 3.3. Key Web Services Design Decisions - Decisiones Clave de Diseño de Web Services

Ahora que comprende lo que sucede en la interacción de un Web service, analicemos más a fondo los problemas relacionados con el diseño y la implementación de un Web service. En primer lugar, analizamos lo que sucede en el diseño de un Web service, examinamos los problemas para los que se requieren decisiones y, cuando es posible, hacemos recomendaciones. (Del mismo modo, el Capítulo 5 examina las cuestiones que se deben tener en cuenta al diseñar un cliente de Web services). Antes de hacerlo, vale la pena repetir este punto:

✅ ***Las tecnologías de Web services básicamente lo ayudan a exponer una interfaz interoperable para una aplicación nueva o existente. Es decir, puede agregar una interfaz de Web service a una aplicación existente para que sea interoperable con otras aplicaciones, o puede desarrollar una aplicación completamente nueva que sea interoperable desde su inicio***.

Es importante tener en cuenta que el diseño de capacidades de Web services para una aplicación es independiente del diseño de la lógica de negocio de la aplicación. De hecho, usted diseña la lógica de negocio de una aplicación sin tener en cuenta si la aplicación tiene una interfaz de Web service. ***Dicho de otro modo, el diseño de la lógica de negocio de la aplicación es el mismo independientemente de si la aplicación tiene o no una interfaz de Web service. Cuando diseña una interfaz de Web service para una aplicación, debe tener en cuenta los aspectos relacionados específicamente con la interoperabilidad y los Web services, y no con la lógica de negocio, y debe tomar sus decisiones de diseño en función de estos aspectos***.

Al diseñar un Web service, tenga en cuenta el flujo lógico de los Web services típicos y los problemas que abordan. En general, un Web service:

* Expone una interfaz que los clientes usan para realizar requests al servicio.
* Pone un servicio a disposición de socios y clientes interesados mediante la publicación de los detalles del servicio
* Recibe requests de los clientes.
* Los delegados recibieron requests a la lógica de negocio adecuada y procesan las requests
* Formula y envía una response a la request.

Dado este flujo de lógica, los siguientes son los pasos típicos para diseñar un Web service.

1. ***Decidir sobre la interfaz para los clientes. Decida si desea publicar esta interfaz y cómo hacerlo.***

   Usted, como desarrollador de Web services, inicia el proceso de diseño decidiendo la interfaz que su servicio hace público a los clientes. La interfaz debe reflejar el tipo y la naturaleza de las llamadas que realizarán los clientes para utilizar el servicio. Debe considerar el tipo de endpoints que desea usar endpoints de servicio EJB oendpoints de servicio **JAX-RPC**) y cuándo usarlos. También debe decidir si va a utilizar controladores SOAP. Por último, pero no menos importante, dado que una de las razones para agregar una interfaz de Web service es lograr la interoperabilidad, debe asegurarse de que sus decisiones de diseño no afecten la interoperabilidad del servicio como un todo.

   A continuación, decide si desea publicar la interfaz de servicio y, de ser así, cómo publicarla. Publicar un servicio lo pone a disposición de los clientes. Puede restringir la disponibilidad del servicio a los clientes a los que haya notificado personalmente sobre el servicio, o puede hacer que su servicio sea completamente público y registrarlo en un registro público. Tenga en cuenta que no es obligatorio que publique los detalles de su servicio, especialmente cuando diseña su servicio para socios de confianza y no quiere que otros sepan sobre su servicio. Tenga en cuenta también que restringir los detalles del servicio a socios de confianza no garantiza automáticamente la seguridad. Efectivamente, está dando a conocer los detalles sobre su servicio y su acceso solo a los socios y no al público en general.

2. ***Determine cómo recibir y preprocesar las requests.***

   Una vez que haya decidido la interfaz y, si es necesario, cómo hacer que esté disponible, estará listo para considerar cómo recibir requests de los clientes. Debe diseñar su servicio no solo para recibir una llamada que ha realizado un cliente, sino también para realizar el preprocesamiento necesario de la request, como traducir el contenido de la request a un formato interno, antes de aplicar la lógica de negocio del servicio.

3. ***Determine cómo delegar la request a la lógica de negocio.

   Una vez que se ha recibido y preprocesado una request, está listo para delegarla a la lógica de negocio del servicio.

4. ***Decidir cómo procesar la request***.

   A continuación, el servicio procesa una request. Si el servicio ofrece una interfaz de Web service para la lógica de negocios existente, entonces el trabajo de este paso puede ser simplemente determinar cómo se pueden usar las interfaces de lógica de negocios existentes para manejar las requests del Web service.

5. ***Determinar cómo formular y enviar la response***.

   Por último, debe diseñar cómo el servicio formula y envía una response al cliente. Es mejor mantener estas operaciones lógicamente juntas. Hay otras consideraciones a tener en cuenta antes de enviar la response al cliente.

6. ***Determinar cómo reportar problemas***.

   Dado que los Web services no son inmunes a los errores, debe decidir cómo iniciar o manejar las excepciones o los errores que se produzcan. Debe abordar cuestiones tales como generar excepciones específicas del servicio o permitir que el sistema subyacente genere excepciones específicas del sistema. También debe formular un plan para recuperarse de excepciones en aquellas situaciones que requieren recuperación.

Después de considerar estos pasos, comience a diseñar su Web service ideando respuestas adecuadas a estas preguntas:

* ***¿Cómo harán uso de sus servicios los clientes?*** Considere qué tipo de llamadas pueden hacer los clientes y cuáles podrían ser los parámetros de esas llamadas.
* ***¿Cómo recibirá su Web service las requests de los clientes?*** Considere qué tipo de endpoints utilizará para su Web service.
* ***¿Qué tipo de preprocesamiento común, como transformaciones, traducciones y logging(registro), debe realizarse?***
* ***¿Cómo se delegará la request a la lógica de negocio?***
* ***¿Cómo se formará y devolverá la response?***
* ***¿Qué tipo de excepciones devolverá el servicio a los clientes y cuándo sucederá esto?***
* ***¿Cómo va a informar a los clientes acerca de su Web service? ¿Vas a publicar tu servicio en registros públicos, en registros privados o de alguna otra forma que no sean registros?***

Antes de explorar los detalles de estos problemas de diseño, veamos un servicio desde un alto nivel. Esencialmente, se puede considerar que la implementación de un servicio tiene dos capas: ***una interacción y una capa de procesamiento***. (Consulte la Figura 3.2 ).

✅ ***Es útil ver un servicio en términos de capas: una capa de interacción y una capa de procesamiento.***

**Figura 3.2. Vista en capas de un Web service**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e4ca488e-bcce-4033-8a0d-9d896f9fc1bd)

**La capa de interacción del servicio consta de la interfaz de endpoint que el servicio expone a los clientes y a través de la cual recibe las solicitudes de los clientes. La capa de interacción también incluye la lógica de cómo el servicio delega las requests a la lógica de negocio y formula responses. Cuando recibe requests de los clientes, la capa de interacción realiza cualquier preprocesamiento necesario antes de delegar las requests a la lógica de negocio. Cuando se completa el procesamiento de la lógica de negocio, la capa de interacción devuelve la response al cliente. En estos casos, la capa de interacción puede tener responsabilidades adicionales para aquellos escenarios en los que el servicio espera recibir documentos XML de los clientes, pero la lógica de negocio se ocupa de los objetos.**

**La capa de procesamiento de servicios contiene toda la lógica de negocio utilizada para procesar las requests de los clientes. También es responsable de la integración con EIS y otros Web services. En el caso de aplicaciones existentes que agregan una interfaz de Web service, la aplicación existente en sí misma suele formar la capa de procesamiento del servicio.**

Ver la implementación de su servicio en términos de capas ayuda a:

* Divide claramente las responsabilidades
* Proporcione una ubicación común o única para la lógica de procesamiento de requests (tanto antes como después del procesamiento) en la capa de interacción
* Exponer la lógica de negocio existente como un Web service

Para poner esta noción de una vista en capas en el contexto adecuado, veamos un ejemplo como el escenario del Web service del proceso empresarial de ***Adventure builder***. En este escenario, una agencia de viajes asociada utiliza el Web service de ***Adventure Builder Enterprise*** para crear un itinerario de viaje para sus clientes. A través de la interfaz de servicio que expone a estas agencias de viajes, la ***Adventure Builder Enterprise*** recibe documentos comerciales (en formato XML) que contienen todos los detalles necesarios para las solicitudes de itinerarios de viaje. ***Adventure builder*** utiliza sus sistemas de flujo de trabajo existentes para procesar y satisfacer estas solicitudes de socios. La capa de interacción de la interfaz de Web service expuesta de ***Adventure Builder*** valida estos documentos comerciales entrantes y luego *convierte los documentos XML entrantes a su formato interno o asigna el contenido del documento a objetos Java*. Una vez finalizada la conversión, el control pasa a los mecanismos de flujo de trabajo en la capa de procesamiento donde se completan las requests de viaje. ***La capa de interacción genera responses para las requests de viaje completadas, convierte las responses en documentos XML u otros formatos apropiados y garantiza que las respuestas se transmitan a las agencias asociadas***.

Es importante aclarar el alcance del preprocesamiento realizado en la capa de interacción, ya que difiere del procesamiento en **JAX-RPC runtime**. La capa de interacción de **Adventure Builder**, su interfaz de Web service expuesta, aplica un preprocesamiento específico del servicio a las requests que ingresan al servicio. Este preprocesamiento específico del servicio se realiza solo si lo requiere la lógica del servicio e incluye la conversión de documentos XML entrantes a un formato adecuado o la asignación del contenido del documento a objetos Java. Esta asignación de documentos XML entrantes a objetos comerciales no es la misma que la asignación en tiempo de ejecución JAX-RPC(**JAX-RPC runtime**) entre documentos XML y objetos Java. Aunque el contenedor realiza la asignación de **JAX-RPC runtime** para todas las requests y responses, el desarrollador elige la asignación de documentos XML entrantes a objetos de negocio.

✅ ***Aunque existen ventajas, como se señaló anteriormente, para ver un servicio en términos de interacción y capas de procesamiento, un Web service puede optar por fusionar estas dos capas en una sola capa. Hay momentos en que múltiples capas hacen que un servicio sea innecesariamente complicado y, en estos casos, puede ser más sencillo diseñar el servicio como una sola capa. Por lo general, esto sucede en escenarios donde la lógica en cualquiera de las capas es demasiado pequeña para merecer una capa separada.***

El escenario del weather service es uno de esos servicios que podría beneficiarse de la fusión de las capas de interacción y procesamiento en una sola capa. Este tipo de servicio no necesita preprocesar las requests entrantes. Una request de cliente al servicio de información meteorológica simplemente incluye un nombre o código postal para identificar la ubicación. El servicio busca la información meteorológica de la ubicación, forma una respuesta que contiene la información y se la devuelve al cliente. Dado que las requests entrantes no requieren procesamiento previo, una vista en capas del servicio meteorológico solo complica lo que de otro modo debería ser un servicio simple.

## 3.4. Diseño de la Capa de Interacción de un Servicio

La capa de interacción de un servicio tiene varias responsabilidades importantes, y ***la principal de ellas es el diseño de la interfaz que el servicio presenta al cliente***. Dado que los clientes acceden al servicio a través de ella, la interfaz es el punto de partida de la interacción de un cliente con el servicio. La capa de interacción también maneja otras responsabilidades, como recibir requests de clientes, delegar requests a la lógica de negocio adecuada y crear y enviar responses. Esta sección examina las responsabilidades de la capa de interacción y destaca algunas pautas para su diseño.

### 3.4.1. Diseño de la interfaz

Hay algunas consideraciones que se deben tener en cuenta al diseñar la interfaz de su Web service, como los problemas relacionados con los métodos de sobrecarga(overloading), la elección del tipo deendpoint, etc. Antes de examinar estos problemas, decida el enfoque que desea adoptar para desarrollar la definición de la interfaz del servicio.

Dos enfoques para desarrollar la definición de interfaz para un Web service son:

1. **Java a WSDL**: Comience con un conjunto de interfaces Java para el Web service y, a partir de ellas, cree la descripción del **Web Services Description Language (WSDL)** del servicio para que la utilicen otros.

2. **WSDL a Java**: Comience con un documento WSDL que describa los detalles de la interfaz del Web service y utilice esta información para crear las interfaces Java correspondientes.

***¿Cómo se comparan estos dos enfoques?*** Comenzar con las interfaces de Java y crear un documento WSDL es probablemente el más fácil de los dos enfoques. Con este enfoque, no necesita conocer ningún detalle de WSDL porque utiliza herramientas proporcionadas por el proveedor para crear la descripción de WSDL. Si bien estas herramientas le facilitan la generación de archivos WSDL desde las interfaces de Java, pierde algo de control sobre la creación de archivos WSDL.

✅ ***Con el enfoque de Java a WSDL, tenga en cuenta que la interfaz de servicio expuesta puede ser demasiado inestable desde el punto de vista de la evolución del servicio.***

Con el enfoque de **Java a WSDL**, puede ser difícil hacer evolucionar la interfaz del servicio sin forzar un cambio en el documento WSDL correspondiente, y cambiar el WSDL puede requerir volver a escribir los clientes del servicio. Estos cambios, y la inestabilidad que los acompaña, pueden afectar la interoperabilidad del propio servicio. ***Dado que lograr la interoperabilidad es una de las principales razones para utilizar los Web services, la inestabilidad del enfoque de Java a WSDL es un gran inconveniente***. Además, tenga en cuenta que diferentes herramientas pueden utilizar interpretaciones diferentes para ciertos tipos de Java (por ejemplo, **`java.util.Date`** podría interpretarse como **`java.util.Calendar`**), lo que da como resultado representaciones diferentes en el archivo WSDL. Si bien no es común, estas variaciones de representación pueden generar algunas sorpresas semánticas.

Por otro lado, el enfoque de **WSDL a Java** le brinda una forma poderosa de exponer una interfaz de servicio estable que puede evolucionar con relativa facilidad. No solo le brinda una mayor flexibilidad de diseño, el enfoque de **WSDL a Java** también proporciona una forma ideal para que finalice todos los detalles del servicio, desde los tipos de llamada de método y los tipos de fallas hasta los esquemas que representan los documentos comerciales intercambiados, incluso antes de comenzar una implementación del servicio o del cliente. Aunque se requiere un buen conocimiento de **WSDL** y el perfil básico de **WS-I** para describir correctamente estos detalles de Web services, el uso de las herramientas disponibles ayuda a solucionar estos problemas.

Después de decidir el enfoque a seguir, aún debe resolver otros detalles del diseño de la interfaz, que se describen en las siguientes secciones.

#### 3.4.1.1. Elección del Interface Endpoint Type

En la plataforma J2EE, tiene dos opciones para implementar la interfaz de Web service: puede usar un ***JAX-RPC service endpoint*** (también denominado***Web tier endpoint***) o un ***EJB service endpoint*** (también denominado ***EJB tier endpoint***). El uso de uno de estos tipos de endpoints hace posible integrar el endpoint en el mismo nivel que la implementación del servicio. Esto simplifica la implementación del servicio, porque evita la necesidad de colocar el endpoint en su propio nivel donde la presencia del endpoint es únicamente para actuar como un proxy que dirige las requests a otros niveles que contienen la lógica de negocio del servicio.

Cuando desarrolla un nuevo Web service que no usa la lógica de negocios existente, elegir el tipo de endpoint que se usará para la interfaz del Web service es sencillo. La elección del tipo endpoint depende de la naturaleza de su lógica de negocio, ya sea que la lógica de negocio del servicio esté completamente contenida en el nivel web o en el nivel EJB:

✅ ***Utilice un endpoint de servicio JAX-RPC cuando la capa de procesamiento esté dentro del nivel web.***

✅ ***Utilice un endpoint de servicio EJB cuando la capa de procesamiento solo se encuentre en el nivel EJB.***

Cuando agrega una interfaz de Web service a una aplicación o servicio existente, debe considerar si la aplicación o el servicio existente procesa previamente las solicitudes antes de delegarlas a la lógica de negocio. Si es así, tenga en cuenta la siguiente pauta:

✅ ***Cuando agrega una interfaz de Web service para una aplicación existente, elija un tipo de endpoint adecuado para el nivel en el que se produce la lógica de preprocesamiento en la aplicación existente. Utilice un endpoint de servicio JAX-RPC cuando el preprocesamiento se produzca en el nivel web de la aplicación existente y un endpoint de servicio EJB cuando el preprocesamiento se produzca en el nivel EJB.***

Si la aplicación o el servicio existente no requiere el preprocesamiento de la request entrante, elija el endpoint adecuado que esté presente en el mismo nivel que la lógica de negocio existente. Además de estas consideraciones importantes para elegir un tipo de endpoint, existen otras diferencias más sutiles entre un endpoint de servicio EJB y un endpoint de servicio JAX-RPC. Puede que le resulte útil tener en cuenta estos puntos adicionales al elegir un tipo de endpoint de Web service:

* ***Consideraciones de acceso de Multi-threaded***: Un endpoint de servicio EJB, debido a que se implementa como un stateless session bean, no necesita preocuparse por el acceso de subprocesos múltiples, ya que se requiere el contenedor EJB para serializar requests a cualquier instancia particular de un stateless session bean. Para un endpoint de servicio JAX-RPC, por otro lado, debe realizar la sincronización usted mismo en el código fuente.

* ✅ Un endpoint de servicio JAX-RPC tiene que gestionar el acceso de clientes simultáneos por su cuenta, mientras que el contenedor EJB se encarga del acceso de clientes simultáneos para un endpoint de servicio EJB.

* ***Consideraciones sobre transacciones***: El contexto transaccional del contenedor de la implementación del servicio determina el contexto transaccional en el que se ejecuta una implementación del servicio. Dado que un endpoint de servicio JAX-RPC se ejecuta en un contenedor web, no se especifica su contexto transaccional. Tampoco hay medios declarativos para iniciar automáticamente la transacción. Por lo tanto, debe usar **JTA** para demarcar explícitamente la transacción.

   Por otro lado, un endpoint de servicio EJB se ejecuta en el contexto de transacción de un contenedor EJB. Usted, como desarrollador, debe demarcar las transacciones de forma declarativa. Por lo tanto, la lógica de negocios del servicio se ejecuta bajo el contexto transaccional definido por el elemento contenedor-transacción de EJB en el descriptor de implementación.

   ✅ ***Si la lógica de negocio del Web service requiere el uso de transacciones (y el servicio tiene un extremo de servicio JAX-RPC), debe implementar la lógica de gestión de transacciones mediante JTA o alguna otra instalación similar. Si su servicio usa un endpoint de servicio EJB, puede usar los servicios de transacciones declarativas del contenedor. Al hacerlo, el contenedor es responsable de manejar las transacciones de acuerdo con la configuración del elemento container-transaction del descriptor de implementación.***

* ***Consideraciones para los permisos de acceso a nivel de método***: Una variedad de diferentes clientes pueden acceder a los métodos de un Web service, y es posible que desee imponer diferentes restricciones de acceso para cada método.

   ✅ ***Cuando desee controlar el acceso al servicio en el nivel de método individual, considere usar un endpoint de servicio EJB en lugar de un endpoint de servicio JAX-RPC.***

   ***Los Enterprise beans permiten la declaración de permisos de acceso a nivel de método en el deployment descriptor***: Puede declarar varios permisos de acceso para diferentes métodos de Enterprise beans y el contenedor maneja correctamente el acceso a estos métodos. Esto es válido para un endpoint de servicio EJB, ya que es un stateless session bean. Un endpoint de servicio JAX-RPC, por otro lado, no tiene una función para declarar restricciones de acceso a nivel de método, lo que requiere que lo haga mediante programación. Consulte el Capítulo 7 para obtener más información.

* ***Consideraciones sobre el acceso a la sesión HTTP***: Un endpoint de servicio JAX-RPC, debido a que se ejecuta en el contenedor web, tiene acceso completo a un objeto **`HttpSession`**. El acceso a un objeto **`HttpSession`**, que se puede usar para incrustar cookies y almacenar el estado del cliente, puede ayudarlo a crear clientes conscientes de la sesión. Un endpoint de servicio EJB, que se ejecuta en el contenedor EJB, no tiene acceso al estado del contenedor web. Sin embargo, generalmente el soporte de sesión HTTP es apropiado para interacciones conversacionales de corta duración, mientras que los Web services a menudo representan procesos comerciales con duraciones más largas y, por lo tanto, necesitan mecanismos adicionales. Consulte **“Correlating Messages”** en la página 359 para conocer una de esas estrategias.

#### 3.4.1.2. Granularidad del servicio

***Gran parte del diseño de una interfaz de Web service implica diseñar las operaciones del servicio o sus métodos. Primero determina las operaciones del servicio y luego define la firma del método para cada operación. Es decir, usted define los parámetros de cada operación, sus valores de retorno y cualquier error o excepción que pueda generar***.

✅ ***Es importante tener en cuenta la granularidad de las operaciones del servicio al diseñar la interfaz del Web service.***

Para aquellos Web services que implementan un proceso de negocios, la naturaleza del proceso de negocios mismo a menudo dicta la granularidad del servicio. Los procesos comerciales que intercambian documentos, como órdenes de compra y facturas, por su naturaleza dan como resultado una interfaz de Web service de granularidad gruesa. Con Web services más interactivos, debe elegir cuidadosamente la granularidad de estas operaciones.

Debe tener en cuenta las mismas consideraciones cuando diseñe los métodos para un Web service que cuando diseñe los métodos de un enterprise bean remoto. Esto es particularmente cierto no solo con respecto al impacto del acceso remoto en el rendimiento, sino también con los Web services; es importante con los Web services porque hay una representación XML subyacente que requiere analizar y tomar ancho de banda. Por lo tanto, ***una buena regla es definir la interfaz del Web service para una granularidad óptima de sus operaciones; es decir, encuentre el equilibrio correcto entre la granularidad de grano grueso y de grano fino***.

✅ ***En general, debe consolidar las operaciones detalladas relacionadas en operaciones más detalladas para minimizar las costosas llamadas a métodos remotos.***

Las operaciones de servicio más detalladas, como la devolución de entradas de catálogo en conjuntos de categorías, reducen la sobrecarga de la red y mejoran el rendimiento. Sin embargo, a veces son menos flexibles desde el punto de vista del cliente. Si bien las operaciones de servicio más detalladas, como la exploración de un catálogo por productos o artículos, ofrecen una mayor flexibilidad al cliente, estas operaciones dan como resultado una mayor sobrecarga de la red y un rendimiento reducido.

✅ ***Tenga en cuenta que demasiada consolidación conduce a ineficiencias.***

Por ejemplo, la consolidación de operaciones lógicamente diferentes es ineficiente y debe evitarse. Es mucho mejor consolidar operaciones similares u operaciones que es probable que un cliente utilice juntas, como operaciones de consulta.

✅ ***Cuando exponga stateless session beans existentes como extremos de Web services, asegúrese de que las operaciones de Web services sean lo suficientemente detalladas.***

Si planea exponer stateless session beans existentes como endpoints de Web services, recuerde que es posible que dichos beans no se hayan diseñado teniendo en cuenta los Web services. Por lo tanto, pueden ser demasiado detallados para ser buenos endpoints de Web services. Debería considerar la consolidación de operaciones relacionadas en una única operación de Web service.

Un buen diseño para nuestro Web service de reservas de aerolíneas, por ejemplo, es esperar que los clientes del servicio envíen toda la información necesaria para una reserva (destino, horarios preferidos de salida y llegada, aerolínea preferida, etc.) en una sola invocación al servicio, que es, como un gran mensaje. Esto es mucho más preferible que hacer que un cliente invoque un método separado para cada pieza de información que comprende la reserva. Para ilustrar, es preferible que los clientes usen la interfaz que se muestra en el ejemplo de código 3.1 .

**Ejemplo de código 3.1. Uso de la Consolidación para una Mayor Eficiencia (Recomendado)**

```java
public interface AirlineTicketsIntf extends Remote {
   public String submitReservationRequest(
          AirReservationDetails details) throws RemoteException;
}
```

El ejemplo de código 3.1 combina datos relacionados lógicamente en un mensaje grande para una interacción más eficiente del cliente con el servicio. Esto es preferible a recibir los datos con llamadas a métodos individuales, como se muestra en el ejemplo de código 3.2 .

**Ejemplo de código 3.2. Recuperación de Datos con Llamadas a Métodos Separados (No recomendado)**

```java
public interface AirlineTicketsIntf extends Remote {
   public String submitFlightInformation(FlightDetails fltInfo)
                     throws RemoteException;
   public String submitPreferredDates(Date depart, Date arrive)
                 throws RemoteException;
   // other similar methods
}
```

Sin embargo, puede que no sea una buena idea combinar en una única invocación de servicio la misma reserva con una llamada de método de consulta.

Junto con la granularidad óptima, debe considerar los problemas de almacenamiento en caché de datos. Los servicios de granularidad gruesa implican la transferencia de grandes cantidades de datos. Si opta por operaciones de servicio más detalladas, es más eficiente almacenar en caché los datos en el lado del cliente para reducir la cantidad de viajes de ida y vuelta entre el cliente y el servidor.

#### 3.4.1.3. Tipos de Parámetros para Operaciones de Web Services

Una interfaz de Web service expone un conjunto de llamadas de método a los clientes. Al invocar un método de interfaz de servicio, es posible que un cliente deba establecer valores para los parámetros asociados con la llamada. Cuando diseñe los métodos de una interfaz, elija cuidadosamente los tipos de estos parámetros. Tenga en cuenta que una llamada de método y sus parámetros se envían como un mensaje SOAP entre el cliente y el servicio. Para formar parte de un mensaje SOAP, los parámetros deben asignarse a XML. Cuando se reciben en el cliente o en el extremo del servicio, los mismos parámetros deben asignarse desde XML a sus tipos u objetos adecuados. En esta sección, se describen algunas pautas que se deben tener en cuenta al definir los parámetros de llamadas a métodos y los valores devueltos.

**Nota**: Dado que cada llamada puede devolver potencialmente un valor, la discusión en esta sección sobre los valores de los parámetros se aplica igualmente a los valores devueltos.

Los parámetros para las llamadas a métodos de Web services pueden ser tipos y objetos Java estándar, documentos XML o incluso tipos no estándar. Ya sea que utilice el enfoque de **Java a WSDL** o el enfoque de **WSDL a Java**, cada tipo de parámetro debe asignarse a su equivalente XML en el mensaje SOAP. La Figura 3.3 muestra cómo ocurre la vinculación para varios tipos de parámetros.

**Figura 3.3. Binding Parameters and Return Values with JAX-RPC - Enlace de Parámetros y Valores Devueltos con JAX-RPC**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/f7a50911-3d4a-4a8a-9f76-bda4031fa461)


#### 3.4.1.3.1. Java Objects as Parameters - Objetos Java como Parámetros

Los parámetros para las llamadas de Web services pueden ser tipos y objetos estándar de Java. Si utiliza el enfoque de **Java a WSDL**, especifique los tipos de parámetros como parte de los argumentos de las llamadas a métodos de su interfaz Java. Si utiliza el enfoque de **WSDL a Java**, especifique los tipos de parámetros como el tipo o los atributos de elemento del elemento de parte de cada mensaje en su WSDL. El tipo de parámetro que utiliza tiene un efecto significativo en la portabilidad y la interoperabilidad de su servicio.

La plataforma admite los siguientes tipos de datos de Java. (Consulte la especificación JAX-RPC en http://java.sun.com/xml/jaxrpc/ para conocer las asignaciones WSDL equivalentes para estos tipos de datos Java).

* ***Tipos primitivos de Java***: **`boolean`**, **`byte`**, **`short`**, **`int`**, **`long`**, **`float`** y **`double`**, junto con sus clases contenedoras de Java correspondientes

* ***Clases estándar de Java***: **`String`**, **`Date`**, **`Calendar`**, **`BigInteger`**, **`BigDecimal`**, **`QName`** y **`URI`**

* ***Arrays de Java con tipos de Java compatibles con JAX-RPC como members***

* ***Tipos de valor JAX-RPC***: Clases de Java definidas por el usuario, incluidas clases con propiedades similares a componentes de JavaBeansTM

✅ ***Al diseñar parámetros para llamadas a métodos en una interfaz de Web service, elija parámetros que tengan asignaciones de tipo estándar. (Consulte la Figura 3.3 ). Tenga siempre en cuenta que la portabilidad y la interoperabilidad de su servicio se reducen cuando utiliza tipos de parámetros que, de forma predeterminada, no son compatibles.***

Como muestra la figura 3.3, los parámetros que tienen asignaciones de tipo estándar están vinculados implícitamente. Sin embargo, el desarrollador debe trabajar más cuando usa parámetros que no tienen asignaciones de tipo estándar. Consulte **“Handling Nonstandard Type Parameters”** en la página 76 para obtener más detalles sobre el uso de tipos de Java no estándar y los posibles efectos secundarios de dicho uso.

Estos son algunos puntos útiles adicionales que debe tener en cuenta cuando utiliza objetos Java con asignaciones de tipo estándar como parámetros.

1. Muchas aplicaciones y servicios necesitan pasar listas de objetos. Sin embargo, las utilidades para manejar listas, como **`ArrayList`** y **`Collection`**, por nombrar algunas, no son tipos estándar admitidos. En cambio, los arrays de Java brindan una funcionalidad equivalente y tienen un mapeo estándar proporcionado por la plataforma.

2. Los tipos de valor JAX-RPC son clases Java definidas por el usuario con algunas restricciones. Tienen constructores y pueden tener campos públicos, privados, protegidos, estáticos o transitorios. Los tipos de valor JAX-RPC también pueden tener métodos, incluidos los métodos set y get para establecer y obtener campos de clase Java.

Sin embargo, cuando se mapean tipos de valores JAX-RPC hacia y desde XML, no existe una forma estándar de retener el orden de los parámetros para los constructores y otros métodos. Por lo tanto, evite configurar los campos de tipo de valor JAX-RPC a través del constructor. El uso de los métodos get y set para recuperar o establecer campos de tipo de valor evitan este problema de asignación y garantizan la portabilidad y la interoperabilidad.

3. La plataforma J2EE admite tipos de valores JAX-RPC anidados; es decir, tipos de valor JAX-RPC que hacen referencia a otros tipos de valor JAX-RPC dentro de sí mismos. Para mayor claridad, es preferible usar esta función e incrustar referencias de tipo de valor en lugar de usar una sola clase de tipo de valor JAX-RPC plana y grande.

4. La plataforma J2EE, debido a su compatibilidad con el mensaje SOAP con protocolo adjunto, también admite el uso de contenido codificado en MIME. Proporciona asignaciones de Java para un subconjunto de tipos MIME. (Consulte la Tabla 3.1 ).

**Tabla 3.1. Mapeo de tipos MIME**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a12bf3da-8e62-44ff-ac87-50485915a85a)

Dado que el contenedor J2EE maneja automáticamente las asignaciones basadas en los tipos de Java, el uso de estas asignaciones Java-MIME lo libera de las complejidades de enviar y recuperar documentos e imágenes como parte del manejo de solicitudes y respuestas de un servicio. Por ejemplo, si su servicio espera recibir una imagen GIF con un tipo MIME de **`image/gif`**, puede esperar que el cliente envíe un objeto **`java.awt.Image`**. Una interfaz de Web service de muestra que recibe una imagen podría parecerse a la que se muestra en el ejemplo de código 3.3:

**Ejemplo de código 3.3. Recibir un Objeto `java.awt.Image`**

```java
import java.awt.Image;
public interface WeatherMapService extends Remote {
   public void submitWeatherMap(Image weatherMap)
                 throws RemoteException, InvalidMapException;
}
```

En este ejemplo, el objeto **`Image`** permite que la implementación del contenedor maneje los detalles del paso de imágenes. El contenedor proporciona clases **`javax.activation.DataHandler`**, que funcionan con **Java Activation Framework** para realizar las asignaciones **Java-MIME** y **MIME-Java**.

Teniendo en cuenta esta asignación entre los tipos Java y MIME, es mejor enviar imágenes y documentos XML que se encuentran en una interfaz de Web service utilizando los tipos Java que se muestran en la Tabla 3.1 . Sin embargo, debe tener cuidado con el efecto sobre la interoperabilidad de su servicio. Consulte **“Interoperability”*** en la página 86 para obtener más detalles.

##### 3.4.1.3.2. Documentos XML como Parámetros

Hay escenarios en los que desea pasar documentos XML como parámetros. Por lo general, esto ocurre en las interacciones de empresa a empresa donde existe la necesidad de intercambiar documentos comerciales legalmente vinculantes, realizar un seguimiento de lo que se intercambia, etc. El intercambio de documentos XML como parte de un Web service se trata en una sección separada; consulte **“Handling XML Documents in a Web Service”** en la página 105 para conocer las pautas a seguir al pasar documentos XML como parámetros.

##### 3.4.1.3.3. Handling Nonstandard Type Parameters - Manejo de Parámetros de Tipo No Estándar

La tecnología JAX-RPC, además de proporcionar un rico conjunto de mapeo estándar entre tipos de datos XML y Java, también proporciona un framework de mapeo de tipo extensible. Los desarrolladores pueden usar este framework para especificar serializadores y deserializadores personalizados conectables(pluggable) que admitan asignaciones de tipos no estándar.

✅ ***Los frameworks de mapeo de tipos extensibles, que los desarrolladores pueden usar para admitir mapeos de tipos no estándar, aún no son una parte estándar de la plataforma J2EE.***

Actualmente, los proveedores pueden proporcionar sus propias soluciones a este problema. Debe enfatizarse que si implementa un servicio utilizando el framework de mapeo de tipo específico de implementación de algún proveedor, entonces no se garantiza que su servicio sea portátil e interoperable.

✅ ***Debido a las limitaciones de portabilidad, debe evitar pasar parámetros que requieran el uso de serializadores o deserializadores específicos del proveedor.***

En su lugar, una mejor manera es pasar estos parámetros como fragmentos de documentos SOAP representados como un subárbol DOM en la interfaz del punto final del servicio. (Consulte la Figura 3.3 ). Si es así, debe considerar enlazar (ya sea manualmente o utilizando **JAXB**) los fragmentos SOAP a objetos Java antes de pasarlos a la capa de procesamiento para evitar un acoplamiento estrecho de la lógica de negocio con el fragmento del documento.

#### 3.4.1.4. Interfaces with Overloaded Methods - Interfaces con Métodos Sobrecargados

En la interfaz de su servicio, puede sobrecargar los métodos y exponerlos a los clientes del servicio. ***Los métodos sobrecargados comparten el mismo nombre de método pero tienen diferentes parámetros y valores de retorno***. Si elige utilizar métodos sobrecargados como parte de su interfaz de servicio, tenga en cuenta que existen algunas limitaciones, como se indica a continuación:

* Si elige el enfoque de **WSDL a Java**, existen limitaciones para representar métodos sobrecargados en una descripción de WSDL. En la descripción de WSDL, cada llamada de método y su respuesta se representan como mensajes SOAP únicos. Para representar métodos sobrecargados, la descripción WSDL debería admitir varios mensajes SOAP con el mismo nombre. WSDL versión 1.1 no tiene esta capacidad para admitir varios mensajes con el mismo nombre.

* Si elige el enfoque de **Java a WSDL** y su servicio expone métodos sobrecargados, asegúrese de verificar cómo las herramientas específicas del proveedor que está utilizando representan estos métodos sobrecargados en la descripción de WSDL. Debe asegurarse de que la representación WSDL de los métodos sobrecargados funcione en el contexto de su aplicación.

Veamos cómo se aplica esto en el escenario del servicio meteorológico. Como proveedor, puede ofrecer el servicio a los clientes, permitiéndoles buscar información meteorológica por nombre de ciudad o código postal. Si utiliza el enfoque de **Java a WSDL**, primero puede definir la interfaz WeatherService como se muestra en el ejemplo de código 3.4.

**Ejemplo de código 3.4. Interfaz `WeatherService` para el Enfoque de Java a WSDL**

```java
public interface WeatherService extends Remote {
   public String getWeather(String city) throws RemoteException;
   public String getWeather(int zip) throws RemoteException;
}
```

Después de definir la interfaz, ejecute la herramienta proporcionada por el proveedor para crear el WSDL desde la interfaz. Cada herramienta tiene su propia forma de representar los métodos sobrecargados **`getWeather`** en el WSDL, y su WSDL refleja la herramienta particular que utiliza. Por ejemplo, si usa J2EE 1.4 SDK de Sun Microsystems, su herramienta **`wscompile`** crea desde la interfaz **`WeatherService`** el WSDL que se muestra en el Ejemplo de código 3.5.

**Ejemplo de código 3.5. WSDL Generado para la interfaz `WeatherService`**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions name="WeatherWebService" .......>
   <types/>
   <message name="WeatherService_getWeather">
      <part name="int_1" type="xsd:int"/>
   </message>
   <message name="WeatherService_getWeatherResponse">
      <part name="result" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeather2">
      <part name="String_1" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeather2Response">
      <part name="result" type="xsd:string"/>
   </message>
   ...
</definitions>
```

Tenga en cuenta que el WSDL representa los métodos sobrecargados **`getWeather`** como dos SOAP messages diferentes, llamando a uno **`getWeather`**, que toma un número entero para el código postal como su parámetro, y el otro **`getWeather2`**, que toma un parámetro string para la ciudad. Como resultado, un cliente interesado en obtener información meteorológica utilizando el nombre de una ciudad invoca el servicio llamando a **`getWeather2`**, como se muestra en el ejemplo de código 3.6 .

**Ejemplo de código 3.6. Using Weather Service Interface with Java-to-WSDL Approach - Uso de la Interfaz de Servicio Meteorológico con el Enfoque de Java a WSDL**

```java
...
Context ic = new InitialContext();
WeatherWebService weatherSvc = (WeatherWebService) ic.lookup("java:comp/env/service/WeatherService");
WeatherServiceIntf port = (WeatherServiceIntf) weatherSvc.getPort(WeatherServiceIntf.class);
String returnValue = port.getWeather2("San Francisco");
...
```

Por ejemplo, para obtener la información meteorológica de San Francisco, el cliente llamó a **`port.getWeather2("San Francisco")`**. Tenga en cuenta que es muy probable que otra herramienta genere un WSDL cuya representación de métodos sobrecargados sea diferente.

Es posible que desee evitar el uso de métodos sobrecargados en su interfaz Java si prefiere tener solo nombres de métodos intuitivos en el WSDL.

Si, en cambio, elige utilizar el enfoque de **WSDL a Java**, su descripción de WSDL podría tener el siguiente aspecto. (Consulte el ejemplo de código 3.7).

**Ejemplo de código 3.7. WSDL for Weather Service with Overloaded Methods Avoided - WSDL para Servicio Meteorológico con Métodos Sobrecargados Evitados**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions name="WeatherWebService" ...>
   <types/>
   <message name="WeatherService_getWeatherByZip">
      <part name="int_1" type="xsd:int"/>
   </message>
   <message name="WeatherService_getWeatherByZipResponse">
      <part name="result" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeatherByCity">
      <part name="String_1" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeatherByCityResponse">
      <part name="result" type="xsd:string"/>
   </message>
   ...
</definitions>
```

Dado que los mensajes en un archivo WSDL deben tener nombres exclusivos, debe usar nombres de mensaje diferentes para representar métodos que, de otro modo, sobrecargaría. Estos diferentes nombres de mensajes en realidad se convierten en diferentes llamadas a métodos en su interfaz. Tenga en cuenta que el WSDL incluye un método **`getWeatherByZip`**, que toma un parámetro de número entero, y un método **`getWeatherByCity`**, que toma un parámetro string. Por lo tanto, un cliente que desee obtener información meteorológica por nombre de ciudad desde una interfaz **`WeatherService`** asociada con el WSDL en el Ejemplo de código 3.7 podría invocar el servicio como se muestra en el Ejemplo de código 3.8 .

**Ejemplo de código 3.8. Using Weather Service with WSDL-to-Java Approach - Uso del Servicio Meteorológico con el Enfoque de WSDL a Java**

```java
...
Context ic = new InitialContext();
WeatherWebService weatherSvc = (WeatherWebService) ic.lookup("java:comp/env/service/WeatherService");
WeatherServiceIntf port = (WeatherServiceIntf) weatherSvc.getPort(WeatherServiceIntf.class);
String returnValue = port.getWeatherByCity("San Francisco");
...
```

#### 3.4.1.5. Manejo de Excepciones

Al igual que cualquier aplicación Java o J2EE, una aplicación de Web service puede encontrar una condición de error al procesar una solicitud de cliente. Una aplicación de Web service necesita detectar adecuadamente cualquier excepción generada por una condición de error y propagar estas excepciones. Para una aplicación Java que se ejecuta en una sola máquina virtual, puede propagar excepciones en la pila(stack) de llamadas hasta llegar a un método con un controlador de excepciones que maneja el tipo de excepción lanzada. Para decirlo de otra manera, para las aplicaciones Java y J2EE que no son Web services, puede continuar lanzando excepciones en la pila de llamadas, pasando por todo el seguimiento de la pila, hasta llegar a un método con un controlador de excepciones que maneja el tipo de excepción lanzada. También puede escribir excepciones que amplíen o hereden otras excepciones.

Sin embargo, lanzar excepciones en las aplicaciones de Web services tiene restricciones adicionales que afectan el diseño del endpoint del servicio. Al considerar cómo el extremo del servicio maneja las condiciones de error y notifica a los clientes sobre los errores, debe tener en cuenta estos puntos:

* De forma similar a las requests y responses, las excepciones también se devuelven al cliente como parte de los mensajes SOAP.

* Su aplicación de Web service debe admitir clientes que se ejecutan en plataformas distintas de Java que pueden no tener los mismos mecanismos de manejo de errores, o incluso similares, que el mecanismo de manejo de excepciones de Java.

***Una aplicación de Web service puede encontrar dos tipos de condiciones de error***. ***Un tipo de error podría ser un error irrecuperable del sistema***, como un error debido a un problema de conexión a la red. Cuando se produce un error como este, el tiempo de ejecución de JAX-RPC en el cliente genera el equivalente de la plataforma del cliente a ***una excepción irrecuperable del sistema***. Para los clientes de Java, esto se traduce en una **`RemoteException`**.

Una aplicación de Web service ***también puede encontrar una condición de error de aplicación recuperable***. Este tipo de error se denomina ***excepción específica del servicio***. El error es particular del servicio específico. Por ejemplo, un Web service meteorológico puede indicar un error si no puede encontrar información meteorológica para una ciudad específica.

Para ilustrar el mecanismo de manejo de excepciones del Web service, examinémoslo en el contexto del ejemplo del Web service meteorológico. Al diseñar el weather service, desea que el servicio pueda manejar un escenario en el que el cliente solicita información meteorológica para una ciudad inexistente. Puede diseñar el servicio para generar una excepción específica del servicio, como **`CityNotFoundException`**, al cliente que realizó la solicitud. Puede codificar la interfaz de servicio para que el método **`getWeather`** arroje esta excepción. (Consulte el ejemplo de código 3.9 ).

**Ejemplo de código 3.9. Throwing a Service-Specific Exception - Lanzar una Excepción Específica del Servicio**

```java
public interface WeatherService extends Remote {
   public String getWeather(String city) throws
              CityNotFoundException, RemoteException;
}
```

Las excepciones específicas del servicio como **`CityNotFoundException`**, que lanza el Web service para indicar condiciones de error específicas de la aplicación, deben ser excepciones comprobadas que directa o indirectamente extienden **`java.lang.Exception`**. No pueden ser excepciones no verificadas. El ejemplo de código 3.10 muestra una implementación típica de una excepción específica del servicio, como **`CityNotFoundException`**.

**Ejemplo de código 3.10. Implementation of a Service-Specific Exception - Implementación de una Excepción Específica del Servicio**

```java
public class CityNotFoundException extends Exception {
   private String message;
   public CityNotFoundException(String message) {
      super(message);
      this.message = message;
   }
   public String getMessage() {
      return message;
   }
}
```

El ejemplo de código 3.11 muestra la implementación del servicio para la misma interfaz de servicio meteorológico. Este ejemplo ilustra cómo el servicio podría generar **`CityNotFoundException`**.

**Ejemplo de código 3.11. Example of a Service Throwing a Service-Specific Exception - Ejemplo de un Servicio que Arroja una Excepción Específica del Servicio**

```java
public class WeatherServiceImpl implements WeatherService {
   public String getWeather(String city)
                            throws CityNotFoundException {
      if(!validCity(city))
         throw new CityNotFoundException(city + " not found");
      // Get weather info and return it back
   }
}
```

El Capítulo 5 describe los detalles del manejo de excepciones en el lado del cliente. (En particular, consulte **“Handling Exceptions”** en la página 230). En el lado del servicio, tenga en cuenta cómo incluir excepciones en la interfaz del servicio y cómo lanzarlas. En general, desea hacer lo siguiente:

✅ ***Convierta los errores específicos de la aplicación y otras excepciones de Java en excepciones significativas específicas del servicio y arroje estas excepciones específicas del servicio a los clientes.***

Aunque promueven la interoperabilidad entre plataformas heterogéneas, los estándares de Web services no pueden abordar todos los tipos de excepciones lanzadas por diferentes plataformas. Por ejemplo, los estándares no especifican cómo deben devolverse al cliente las excepciones de Java, como **`java.io.IOException`** y **`javax.ejb.EJBException`** . Como consecuencia, es importante para un Web service, desde el punto de vista de la interoperabilidad del servicio, no exponer excepciones específicas de Java (como las que se acaban de mencionar) en la interfaz del Web service. En su lugar, lanza una excepción específica del servicio. Además, ten en cuenta los siguientes puntos:

* No puede lanzar excepciones no serializables a un cliente a través del endpoint del Web service.

* Cuando un servicio lanza excepciones **`java`** o **`javax`**, el tipo de excepción y su información de contexto se pierden para el cliente que recibe la excepción lanzada. Por ejemplo, si su servicio lanza una excepción **`javax.ejb.FinderException`** al cliente, el cliente puede recibir una excepción llamada **`FinderException`**, pero su información de tipo puede no estar disponible para el cliente. Además, el tipo de excepción para el cliente puede no ser el mismo que el tipo de excepción lanzada. (Dependiendo de la herramienta utilizada para generar las interfaces del lado del cliente, la excepción puede incluso pertenecer a algún paquete que no sea **`javax.ejb`**).

Como resultado, debe evitar lanzar excepciones **`java`** y **`javax`** directamente a los clientes. En su lugar, cuando su servicio encuentre uno de estos tipos de excepciones, envuélvalo dentro de una excepción específica del servicio significativa y envíe esta excepción específica del servicio al cliente. Por ejemplo, suponga que su servicio encuentra una excepción **`javax.ejb.FinderException`** mientras procesa una request de cliente. El servicio debe detectar la excepción **`FinderException`** y luego, en lugar de devolver esta excepción al cliente, el servicio debe generar una excepción específica del servicio que tenga más significado para el cliente. Consulte el ejemplo de código 3.12 .

**Ejemplo de código 3.12. Converting an Exception into a Service-Specific Exception - Conversión de una Excepción en una Excepción Específica del Servicio**

```java
...
try {
    // findByPrimaryKey
    // Do processing
    // return results
} catch (javax.ejb.FinderException fe) {
   throw new InvalidKeyException(
      "Unable to find row with given primary key");
}
```

✅ ***Las herencias de excepción se pierden cuando lanza(throw) una excepción específica del servicio.***

Debe evitar definir excepciones específicas del servicio que  inherit(heredan) o extend(extiendan) otras excepciones. Por ejemplo, si **`CityNotFoundException`** en el ejemplo de código 3.10 extiende otra excepción, como **`RootException`**, cuando el servicio genera **`CityNotFoundException`**, los métodos y propiedades heredados de **`RootException`** no se pasan al cliente.

✅ ***El exception stack trace(seguimiento de la pila de excepciones) no se pasa al cliente.***

El stack trace(seguimiento de la pila) para una excepción solo es relevante para el entorno de ejecución actual y no tiene sentido en un sistema diferente. Por lo tanto, cuando un servicio lanza una excepción al cliente, el cliente no tiene el stack trace que explica las condiciones bajo las cuales ocurrió la excepción. Por lo tanto, debe considerar pasar información adicional en el mensaje para la excepción.

Los estándares de Web services facilitan que un servicio transmita condiciones de error a un cliente de forma independiente a la plataforma. Si bien la siguiente discusión puede ser de interés, no es esencial que los desarrolladores conozcan estos detalles sobre los mecanismos de manejo de errores de la plataforma J2EE para los Web services.

Como se señaló anteriormente, las condiciones de error se incluyen dentro de los mensajes SOAP que un servicio devuelve a los clientes. La especificación SOAP define un tipo de mensaje, llamado **`fault`**, que permite que las condiciones de error se transmitan como parte del mensaje SOAP y aún así se diferencien de la parte de request o response. De manera similar, la especificación WSDL define un conjunto de operaciones que son posibles en un endpoint. Estas operaciones incluyen **`input`** y **`output`**, que representan la request y la response respectivamente, y una operación denominada **`fault`**.

Un **`fault`** de SOAP define excepciones a nivel del sistema, como **`RemoteException`**, que son errores irrecuperables. La falla de WSDL denota excepciones específicas del servicio, como **`CityNotFoundException`**, y estas son condiciones de error de aplicación recuperables. Dado que la falla de WSDL denota una condición de error recuperable, la plataforma puede pasarla como parte del mensaje de respuesta SOAP. Por lo tanto, los estándares proporcionan una forma de intercambiar mensajes de error y asignar estos mensajes a operaciones en el endpoint.

El ejemplo de código 3.13 muestra el código WSDL para el mismo ejemplo de Web service weather. Este ejemplo ilustra cómo se asignan las excepciones específicas del servicio al igual que se asignan los mensajes de entrada y salida.

**Ejemplo de código 3.13. Mapping a Service-Specific Exception in WSDL - Asignación de una Excepción Específica del Servicio en WSDL**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions ...>
   ...
   <message name="WeatherService_getWeather">
      <part name="String_1" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeatherResponse">
      <part name="result" type="xsd:string"/>
   </message>
   <message name="CityNotFoundException">
      <part name="CityNotFoundException" element="tns:CityNotFoundException"/>
   </message>
   <portType name="WeatherService">
      <operation name="getWeather" parameterOrder="String_1">
         <input message="tns:WeatherService_getWeather"/>
         <output message="tns:WeatherService_getWeatherResponse"/>
         <fault name="CityNotFoundException" message="tns:CityNotFoundException"/>
      </operation>
   </portType>
   ...
</definitions>
```

#### 3.4.1.6. Uso de Handlers(Manipuladores)

Como se discutió en el Capítulo 2, y como se muestra en la Figura 3.1, la tecnología **JAX-RPC** le permite conectar en SOAP message handlers, lo que permite el procesamiento de SOAP messages que representan requests y responses. Plugging en SOAP message handlers le brinda la capacidad de examinar y modificar las SOAP requests antes de que sean procesadas por el Web service y de examinar y modificar las SOAP responses antes de que se entreguen al cliente.

***Los Handlers son particulares de un Web service y están asociados con el puerto específico del servicio***. Como resultado de esta asociación, la lógica del handler se aplica a todas las SOAP requests y responses que pasan por el puerto de un servicio. Por lo tanto, utilice estos message handlers cuando su Web service deba realizar algún procesamiento específico de SOAP message común a todas sus requests y responses. Debido a que los handlers son comunes a todas las requests y responses que pasan a través de un endpoint de Web service, tenga en cuenta la siguiente directriz:

✅ ***No es recomendable poner en un handler una lógica de negocios o un procesamiento particular para requests y responses específicas.***

***No puede almacenar el estado específico del cliente en un handler***: La lógica de un handler actúa en todas las requests y responses que pasan a través de un endpoint. Sin embargo, puede usar el handler para almacenar el estado específico del puerto, que es un estado común a todas las llamadas a métodos en esa interfaz de servicio. Tenga en cuenta también que los handlers se ejecutan en el contexto del componente en el que están presentes.

✅ ***No almacene el estado específico del cliente en un handler.***

También tenga en cuenta que los handlers funcionan directamente en el SOAP message, y esto implica el procesamiento de XML. Puede usar handlers para pasar el estado específico del cliente a través del contexto del mensaje. (Consulte **“Passing Context Information on Web Service Calls”** en la página 366).

✅ ***El uso de handlers puede tener un impacto significativo en el rendimiento del servicio como un todo.***

El uso de handlers podría afectar potencialmente la interoperabilidad de su servicio. Consulte la siguiente sección sobre interoperabilidad. Tenga en cuenta que se necesita un conocimiento avanzado de las **SOAP message manipulation APIs (como SAAJ)** para usar correctamente los handlers. Para evitar errores, los desarrolladores de Web services deben intentar usar handlers existentes o proporcionados por proveedores. El uso de handlers tiene sentido principalmente para escribir servicios del sistema, como auditoría, registro, etc.

#### 3.4.1.7. interoperabilidad

Un beneficio importante de los Web services es la interoperabilidad entre plataformas heterogéneas. Para obtener el máximo beneficio, desea diseñar su Web service para que sea interoperable con clientes en cualquier plataforma y, como se explicó en el Capítulo 2 , la organización de interoperabilidad de Web services (WS-I) ayuda en este sentido. WS-I promueve un conjunto de protocolos genéricos para el intercambio interoperable de mensajes entre Web services. El perfil básico de WS-I promueve la interoperabilidad al definir y recomendar cómo se puede usar un conjunto de especificaciones y estándares de Web services básicos (incluidos SOAP, WSDL, UDDI y XML) para desarrollar Web services interoperables.

Además de los protocolos WS-I, otros grupos, como el grupo de interoperabilidad de SOAPBuilders (consulte http://java.sun.com/wsinterop/sb/index.html ), proporcionan bases de prueba comunes que facilitan la prueba de interoperabilidad. de varias implementaciones SOAP. Esto ha hecho posible que varios proveedores de tecnología de Web services prueben la interoperabilidad de las implementaciones de sus estándares. Cuando implementa su servicio utilizando tecnologías que se adhieren a las especificaciones del perfil básico de WS-I, tiene la seguridad de que dichos servicios son interoperables.

Además de estos estándares y entornos de prueba, usted, como desarrollador de servicios, debe diseñar e implementar su Web service para que sea posible la máxima interoperabilidad. Para lograr la máxima interoperabilidad, debe tener en cuenta estos tres puntos:

Los dos estilos de mensajería y enlaces admitidos por WSDL

El soporte WS-I para archivos adjuntos

La forma más efectiva de usar controladores

WSDL admite dos tipos de estilos de mensajería: rpc y document . El atributo de estilo WSDL indica el estilo de mensajería. (Consulte el Ejemplo de código 3.14 ). Un atributo de estilo establecido en rpc indica una operación orientada a RPC, donde los mensajes contienen parámetros y valores devueltos, o firmas de funciones. Cuando el atributo de estilo se establece en documento , indica una operación orientada a documentos, en la que los mensajes contienen documentos. Cada estilo de operación tiene un efecto diferente en el formato del cuerpo de un mensaje SOAP.

**Ejemplo de código 3.14. Especificación de enlaces WSDL**

```xml
```

Junto con los estilos de operación, WSDL admite dos tipos de mecanismos de serialización y deserialización: un mecanismo literal y uno codificado . El atributo de uso de WSDL indica qué mecanismo se admite. (Consulte el Ejemplo de código 3.14 ). Un literalEl valor para el atributo de uso indica que los datos están formateados de acuerdo con las definiciones abstractas dentro del documento WSDL. El valor codificado significa que los datos se formatean de acuerdo con las codificaciones definidas en el URI especificado por el atributo encodingStyle . Por lo tanto, puede elegir entre un estilo rpc o documento de paso de mensajes y cada mensaje puede usar un formato de datos literal o codificado.

Dado que WS-I Basic Profile 1.0, al que se ajusta la plataforma J2EE1.4, solo admite enlaces literales, debe evitar los enlaces codificados.

Los enlaces literales no pueden representar tipos complejos, como objetos con referencias circulares, de forma estándar.

El ejemplo de código 3.14 muestra un fragmento del documento WSDL que ilustra cómo el servicio meteorológico de muestra especifica estos enlaces.

Es importante tener en cuenta estos estilos y enlaces de mensajes, especialmente cuando diseñe la interfaz utilizando el enfoque de WSDL a Java y cuando diseñe el WSDL para su servicio. Cuando utiliza el enfoque de Java a WSDL, confía en las herramientas proporcionadas por el proveedor para generar el WSDL para sus interfaces Java, y puede contar con ellas para crear un WSDL compatible con WS-I para su servicio. Sin embargo, tenga en cuenta que algunos proveedores pueden esperar que especifique ciertas opciones para garantizar la creación de un WSDL compatible con WS-I. Por ejemplo, el SDK J2EE 1.4 de Sun Microsystems proporciona una herramienta wscompile , que espera que el desarrollador utilice el -f:wsimarca para crear el WSDL compatible con WS-I para el servicio. También es una buena idea verificar el documento WSDL para asegurarse de que cualquier herramienta que use haya creado el documento correctamente.

Con respecto al segundo problema, debe tener en cuenta que el perfil básico WS-I 1.0 (que es el perfil compatible con la plataforma J2EE 1.4) no aborda los archivos adjuntos. La sección, “ Tipos de parámetros para operaciones de Web services ” en la página 72 , que analiza las asignaciones de tipo Java-MIME proporcionadas por la plataforma J2EE, recomienda que un diseño eficiente es usar estas asignaciones para enviar imágenes y documentos XML dentro de un entorno completamente Java. Debido a que el perfil básico de WS-I, versión 1.0, no se ocupa de los archivos adjuntos, es posible que un Web service que utilice estas asignaciones no pueda interoperar con clientes en una plataforma que no sea Java.

Dado que la especificación WS-I Basic Profile 1.0 no aborda los archivos adjuntos, no se garantiza que un Web service que utilice las asignaciones Java-MIME proporcionadas por la plataforma J2EE sea interoperable.

Dado que la mayoría de los Web services se basan en un intercambio de documentos comerciales y la interoperabilidad no siempre está garantizada, es importante que comprenda correctamente las opciones para manejar documentos XML. La sección, “ Intercambio de documentos XML ” en la página 107 , explica las diversas opciones disponibles para los Web services para intercambiar documentos XML de manera interoperable. También se debe tener en cuenta que la próxima versión de la especificación del perfil básico de WS-I aborda una forma estándar de enviar archivos adjuntos, y las versiones posteriores de las plataformas J2EE incorporarán esto.

El último es el tema de los controladores. Los controladores, que le dan acceso a los mensajes SOAP, al mismo tiempo le imponen responsabilidades importantes.

Cuando utilice controladores, debe tener cuidado de no cambiar un mensaje SOAP hasta el punto de que el mensaje ya no cumpla con las especificaciones WS-I, lo que pone en peligro la interoperabilidad de su servicio.

Esto finaliza la discusión de las consideraciones para diseñar una interfaz de Web service. Las siguientes secciones examinan otras responsabilidades de la capa de interacción, como recibir y delegar solicitudes y formular respuestas.

### 3.4.2. Recepción de solicitudes
	
La capa de interacción, a través del punto final, recibe las solicitudes de los clientes. La plataforma asigna las solicitudes de los clientes entrantes, que tienen la forma de mensajes SOAP, a llamadas de método presentes en la interfaz del Web service.

Antes de delegar estas solicitudes de clientes entrantes a la lógica de negocio del Web service, debe realizar cualquier validación de seguridad requerida, transformación de parámetros y otro procesamiento previo de parámetros requerido.

Como se indica en “ Tipos de parámetros para operaciones de Web services ” en la página 72 y en otros lugares, las llamadas a Web services son básicamente llamadas a métodos cuyos parámetros se pasan como objetos Java, documentos XML ( objetos javax.xml.transform.Source ) o incluso documentos SOAP. fragmentos ( objetos javax.xml.soap.SOAPElement ).

Para los parámetros que se pasan como objetos Java (como String, int , tipos de valor JAX-RPC, etc.), realice la validación de parámetros específica de la aplicación y asigne los objetos entrantes a objetos específicos del dominio en la capa de interacción antes de delegar la solicitud a la capa de procesamiento.

Es posible que deba realizar pasos adicionales para manejar documentos XML que se pasan como parámetros. Estos pasos, que se realizan mejor en la capa de interacción de su servicio, son los siguientes:

1. El extremo del servicio debe validar el documento XML entrante con su esquema. Para obtener detalles y pautas sobre cómo y cuándo validar los documentos XML entrantes, junto con las técnicas de validación recomendadas, consulte “ Validación de documentos XML ” en la página 139 .

2. Cuando la capa de procesamiento del servicio y la lógica de negocio están diseñadas para manejar documentos XML, debe transformar el documento XML en un esquema compatible internamente, si el esquema para el documento XML difiere del esquema interno, antes de pasar el documento a la capa de procesamiento.

3. Cuando la capa de procesamiento trata con objetos pero la interfaz de servicio recibe documentos XML, entonces, como parte de la capa de interacción, asigne los documentos XML entrantes a objetos de dominio antes de delegar la solicitud a la capa de procesamiento. Para obtener detalles y pautas sobre técnicas de mapeo para documentos XML entrantes, consulte “ Mapeo de esquemas al modelo de datos de la aplicación ” en la página 143 .

Es importante que estos tres pasos (validación de parámetros entrantes o documentos XML, traducción de documentos XML a esquemas compatibles internos y asignación de documentos a objetos de dominio) se realicen lo más cerca posible del extremo del servicio y, sin duda, en la capa de interacción del servicio. .

Un diseño como este ayuda a detectar errores temprano y, por lo tanto, evita llamadas innecesarias y viajes de ida y vuelta a la capa de procesamiento. La figura 3.4 muestra la forma recomendada de manejar solicitudes y respuestas en la capa de interacción del Web service.

**Figura 3.4. Web Service Request Processing - Procesamiento de Peticiones de Servicios Web**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/04ef87f6-384f-446f-9da3-d01ea65e29f5)


La capa de interacción del Web service maneja todas las solicitudes entrantes y las delega a la lógica de negocio expuesta en la capa de procesamiento. Cuando se implementa de esta manera, la capa de interacción del Web service tiene varias ventajas, ya que le brinda una ubicación común para las siguientes tareas:

Administrar el manejo de solicitudes para que el extremo del servicio sirva como punto de contacto inicial

Invocación de servicios de seguridad, incluidas la autenticación y la autorización.

Validación y transformación de documentos XML entrantes y asignación de documentos XML a objetos de dominio

Delegar a la lógica de negocio existente

Manejo de errores

En general, se recomienda realizar todo el procesamiento común, como controles de seguridad, registro, auditoría, validación de entrada, etc., para las solicitudes en la capa de interacción tan pronto como se recibe una solicitud y antes de pasarla a la capa de procesamiento.

### 3.4.3. Delegación de solicitudes de Web services a la capa de procesamiento

Después de diseñar las tareas de preprocesamiento de solicitudes, el siguiente paso es diseñar cómo delegar la solicitud a la capa de procesamiento. En este punto, considere el tipo de procesamiento que requiere la solicitud, ya que esto lo ayuda a decidir cómo delegar la solicitud a la capa de procesamiento. Todas las solicitudes se pueden clasificar en dos grandes categorías según el tiempo que lleva procesar la solicitud, a saber:

Una solicitud que se procesa en un tiempo lo suficientemente corto como para que un cliente pueda bloquear y esperar a recibir la respuesta antes de continuar. En otras palabras, el cliente y el servicio interactúan de manera síncrona, de modo que el cliente que invoca se bloquea hasta que la solicitud se procesa por completo y se recibe la respuesta.

Una solicitud que tarda mucho en ser procesada, tanto que no es buena idea hacer esperar al cliente hasta que finalice la tramitación. En otras palabras, el cliente y el servicio interactúan de manera asíncrona, de modo que el cliente que invoca no necesita bloquear y esperar hasta que la solicitud se procese por completo.

**Nota**: Cuando nos referimos al procesamiento de solicitudes, usamos los términos síncrono y asíncrono desde el punto de vista de cuándo se completa completamente el procesamiento de la solicitud del cliente. Tenga en cuenta que, bajo el capó, una interacción asíncrona entre un cliente y un servicio puede resultar en una invocación síncrona a través de la red, ya que HTTP es síncrono por naturaleza. De manera similar, los mensajes SOAP enviados a través de HTTP también son síncronos.

El servicio de información meteorológica es un buen ejemplo de una interacción síncrona entre un cliente y un servicio. Cuando recibe la solicitud de un cliente, el servicio meteorológico debe buscar la información requerida y enviar una respuesta al cliente. Esta búsqueda y devolución de la información se puede lograr en un tiempo relativamente corto, durante el cual se puede esperar que el cliente bloquee y espere. El cliente continúa su procesamiento solo después de obtener una respuesta del servicio. (Consulte la Figura 3.5 ).

**Figura 3.5. Weather Information Service Interaction - Interacción del servicio de información meteorológica**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c7c96e5a-63db-4f11-bded-690bb5de0124)


Un Web service como este se puede diseñar utilizando un extremo de servicio que recibe la solicitud del cliente y luego delega la solicitud directamente a la lógica apropiada del servicio en la capa de procesamiento. La capa de procesamiento del servicio procesa la solicitud y, cuando se completa el procesamiento, el extremo del servicio devuelve la respuesta al cliente. (Consulte la Figura 3.6 ).

**Figura 3.6. Synchronous Interaction Between Client and Service - Interacción síncrona entre el cliente y el servicio**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/fd5c7b24-5594-4608-9c94-7c099df69fdb)

El ejemplo de código 3.15 muestra la interfaz del servicio meteorológico realizando algunas comprobaciones de validación de parámetros básicos en la capa de interacción. La interfaz también obtiene la información requerida y pasa esa información al cliente de manera síncrona:

**Ejemplo de código 3.15. Realización de una interacción de cliente síncrona**

```java
public class WeatherServiceImpl implements
                     WeatherService, ServiceLifecycle {

   public void init(Object context) throws JAXRPCException {....}

   public String getWeather(String city)
                        throws CityNotFoundException {

      /** Validate parameters **/
      if(!validCity(city))
         throw new CityNotFoundException(....);

      /** Get weather info form processing layer and **/
      / **return results **/
      return (getWeatherInfoFromDataSource(city));
   }

   public void destroy() {....}
}
```

Ahora examinemos una interacción asíncrona entre un cliente y un servicio. Al realizar una solicitud de este tipo de servicio, el cliente no puede darse el lujo de esperar la respuesta debido al tiempo significativo que tarda el servicio en procesar la solicitud por completo. En su lugar, el cliente puede querer continuar con algún otro procesamiento. Posteriormente, cuando recibe la respuesta, el cliente retoma el procesamiento que inició la solicitud de servicio. Por lo general, en estos tipos de servicios, el contenido de los parámetros de solicitud inicia y determina el flujo de trabajo de procesamiento (los pasos para cumplir con la solicitud) para el Web service. A menudo, cumplir con una solicitud requiere múltiples pasos de flujo de trabajo.

El servicio de agencia de viajes es un buen ejemplo de una interacción asíncrona entre un cliente y un servicio. Un cliente solicita arreglos para un viaje en particular enviando al servicio de viajes toda la información pertinente (muy probablemente en un documento XML). Según el contenido del documento, el servicio realiza pasos como verificar la cuenta del usuario, verificar y obtener la autorización de la tarjeta de crédito, verificar la disponibilidad de alojamiento y transporte, crear un itinerario, comprar boletos, etc. Dado que el servicio de viajes debe realizar una serie de pasos que a menudo consumen mucho tiempo en su flujo de trabajo normal, el cliente no puede darse el lujo de hacer una pausa y esperar a que se completen estos pasos.

La figura 3.7 muestra un enfoque recomendado para delegar asincrónicamente este tipo de solicitudes de Web services a la capa de procesamiento. En esta arquitectura, el cliente envía una solicitud al extremo del servicio. El extremo del servicio valida la solicitud entrante en la capa de interacción y luego delega la solicitud del cliente a la capa de procesamiento adecuada del servicio. Lo hace enviando la solicitud como un mensaje JMS a una cola o tema JMS designado específicamente para este tipo de solicitud.

Debe evitarse delegar una solicitud a la capa de procesamiento a través de JMS antes de validar la solicitud.

**Figura 3.7. Asynchronous Interaction Between Client and Service - Interacción asíncrona entre el cliente y el servicio**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/99f47ea7-1858-4b0c-a1fe-6c2d44056625)


La validación asegura que una solicitud es correcta. Delegar la solicitud antes de la validación puede dar como resultado que se pase una solicitud no válida a la capa de procesamiento, lo que hace que el seguimiento y el manejo de errores sean demasiado complejos. Una vez que la solicitud se delega con éxito a la capa de procesamiento, el extremo del servicio puede devolver un identificador de correlación al cliente. Este identificador de correlación es para referencia futura del cliente y puede ayudar al cliente a asociar una respuesta que corresponda a su solicitud anterior. Si la lógica de negocio se implementa utilizando beans empresariales, los beans controlados por mensajes en el nivel EJB leen la solicitud e inician el procesamiento para que, en última instancia, se pueda formular una respuesta.

La Figura 3.8 muestra cómo el servicio de agencia de viajes podría implementar esta interacción, y el Ejemplo de código 3.16 muestra el código real que podría usarse.

**Ejemplo de código 3.16. Implementing Travel Agency Service Interaction - Implementación de la interacción del servicio de la agencia de viajes**

```java
public class ReservationRequestRcvr {
   public ReservationRequestRcvr() throws RemoteException {....}

   public String receiveRequest(Source reservationDetails) throws
                        RemoteException, InvalidRequestException{

      /** Validate incoming XML document **/
      String xmlDoc = getDocumentAsString(reservationDetails);
      if(!validDocument(xmlDoc))
         throw new InvalidRequestException(...);

      /** Get a JMS Queue and delegate the incoming request **/
      /** to the queue **/
      QueueConnectionFactory queueFactory =
         serviceLocator.getQueueConnectionFactory(....);
      Queue reservationRequestQueue =
                    serviceLocator.getQueue(...);
      QueueConnection connection =
         queueFactory.createQueueConnection();
      QueueSession session = connection.createQueueSession(false,
                       Session.AUTO_ACKNOWLEDGE);
      QueueSender queueSender = session.createSender(queue);
      TextMessage message = session.createTextMessage();
      message.setText(xmlDoc);
      queueSender.send(message);
      /** Generate and return a correlation identifier **/
      return generateCorrelationID();
   }
}
```

**Figura 3.8. Travel Agency Service Interaction - Interacción de servicios de agencias de viajes**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7a4a4d09-3446-438a-a13e-e5c1a0b1307a)



En la Figura 3.8 , las líneas verticales representan el paso del tiempo, de arriba hacia abajo. Los cuadros rectangulares verticales indican cuando la entidad (cliente o servicio) está ocupada procesando la solicitud o esperando a que la otra entidad complete el procesamiento. El tipo de media flecha indica comunicación asíncrona y la línea vertical discontinua indica que la entidad es libre de trabajar en otras cosas mientras se procesa una solicitud.

Queda una pregunta: ¿Cómo obtiene el cliente el resultado final de su solicitud? El servicio puede poner a disposición el resultado de la solicitud del cliente de una de dos maneras:

El cliente que invocó el servicio verifica periódicamente el estado de la solicitud utilizando el identificador de correlación que se proporcionó en el momento en que se envió la solicitud. Esto también se conoce como sondeo y aparece como la Opción 1 en la Figura 3.8 .

O bien, si el propio cliente es un par de Web services, el servicio devuelve la llamada al servicio del cliente con el resultado. El cliente puede usar el identificador de correlación para relacionar la respuesta con la solicitud original (Opción 2 en la Figura 3.8 ).

A menudo, esto se decide por la naturaleza del servicio en sí. Por ejemplo, si el servicio ejecuta un flujo de trabajo de proceso comercial, el flujo de trabajo requiere que el servicio tome las medidas adecuadas después de procesar la solicitud.

3.4.4. Formulación de respuestas
Después de delegar la solicitud a la parte de la lógica de negocios de la aplicación, y la lógica de negocios completa su procesamiento, está listo para el siguiente paso: formar la respuesta a la solicitud.

Debe realizar la generación de respuestas, que es simplemente construir los valores de retorno de la llamada al método y los parámetros de salida, en la capa de interacción, lo más cerca posible del punto final del servicio.

Esto permite tener una ubicación común para el ensamblado de respuestas y las transformaciones de documentos XML, especialmente si el documento que devuelve a la persona que llama debe ajustarse a un esquema diferente del esquema interno. Mantener esta funcionalidad cerca del punto final le permite implementar el almacenamiento en caché de datos y evitar viajes adicionales a la capa de procesamiento. (Consulte la Figura 3.9 ).

**Figura 3.9. Procesamiento de respuestas de Web services**



Considere la generación de respuestas desde el punto de vista del servicio de información meteorológica. El servicio de información meteorológica puede ser utilizado por una variedad de tipos de clientes, desde navegadores hasta clientes enriquecidos y dispositivos portátiles. Un servicio de información meteorológica bien diseñado daría sus respuestas en formatos adecuados para estos diferentes tipos de clientes.

Sin embargo, no es un buen diseño tener una implementación diferente de la lógica del servicio para cada tipo de cliente. Más bien, es mejor diseñar una lógica de negocio común para todos los tipos de clientes. Luego, en la capa de interacción, transforme los resultados por tipo de cliente para renderizar. Por lo tanto, es importante tener en cuenta las pautas anteriores, especialmente cuando su servicio tiene una lógica de procesamiento común, pero potencialmente tiene diferentes necesidades de representación de respuestas para adaptarse a sus variados tipos de clientes.
  
## 3.5. Diseño de capa de procesamiento
	
La capa de procesamiento es donde se aplica la lógica de negocio a una solicitud de Web service. Recuerde que el Web service es una forma interoperable de exponer aplicaciones nuevas o existentes. Por lo tanto, independientemente de los medios que utilice para exponer la funcionalidad de su aplicación, los problemas de diseño de la lógica de negocio son los mismos. Todavía debe diseñar la lógica de negocio teniendo en cuenta aspectos como el uso de beans empresariales, la exposición de un modelo de interfaz EJB local o remoto, el uso de persistencia administrada por contenedor o administrada por beans, etc.

Los problemas y las consideraciones para diseñar la capa de lógica de negocio o de procesamiento de una aplicación, como si se debe realizar esta lógica en el nivel Web o EJB, son los mismos independientemente de que utilice o no un Web service.

No abordamos estos problemas de diseño de lógica de negocios aquí, ya que gran parte de esta discusión ya se cubrió en el libro Diseño de aplicaciones empresariales con la plataforma J2EE TM , segunda edición , y puede consultar ese libro para obtener pautas y recomendaciones generales. También debe consultar el sitio web de BluePrints en http://java.sun.com/blueprints para obtener recomendaciones sobre el diseño de la lógica de procesamiento empresarial de una aplicación.

Además de estas pautas generales, hay algunas cuestiones específicas que se deben tener en cuenta al diseñar la capa de procesamiento de un Web service.

Mantenga la capa de procesamiento independiente de la capa de interacción . Al mantener las capas independientes y débilmente acopladas, la capa de procesamiento sigue siendo genérica y puede admitir diferentes tipos de clientes, como clientes de Web services, clientes web clásicos, etc. Para lograr un acoplamiento débil entre las capas, considere el uso de clases delegadas que encapsulen el acceso a los componentes comerciales.

Enlace documentos XML a objetos Java en la capa de interacción . Hay ocasiones en las que su Web service espera recibir de un cliente un documento XML que contiene una solicitud completa, pero la lógica de negocio del servicio no necesita operar en el documento. En estas ocasiones, se recomienda que la capa de interacción vincule el contenido del documento XML a los objetos Java antes de pasar la solicitud a la capa de procesamiento. Dado que la lógica de procesamiento no tiene que realizar la conversión de XML a Java, una sola capa de procesamiento puede admitir documentos XML que se basan en diferentes esquemas. Esto también facilita la compatibilidad con varias versiones de un esquema XML.

Tenga en cuenta que su lógica de procesamiento puede operar sobre el contenido de un documento XML recibido de un cliente. Consulte “ Manejo de documentos XML en un Web service ” en la página 105 , que destaca los problemas a tener en cuenta cuando pasa documentos XML a su lógica de procesamiento comercial.

Según el escenario de su aplicación, es posible que se requiera que su capa de procesamiento trabaje con otros pares de Web services para completar la solicitud de un cliente. Si es así, su capa de procesamiento se convierte efectivamente en un cliente de otro Web service. Consulte el Capítulo 5 para conocer las pautas sobre los clientes de Web services. En otras circunstancias, es posible que su capa de procesamiento tenga que interactuar con los EIS. Para estos casos, consulte el Capítulo 6 para obtener pautas.
  
## 3.6. Publicación de un Web service
	
Hasta ahora, este capítulo ha cubierto las pautas para diseñar e implementar su Web service. Igual de importante, su Web service debe ser accesible para sus clientes previstos. Recuerde que algunos Web services están destinados al uso del público en general. Otros Web services están destinados a ser utilizados únicamente entre socios comerciales de confianza (entre empresas), y otros están destinados a ser utilizados únicamente dentro de una empresa (intraempresa).

Independientemente de si un servicio debe ser accesible para el público, otras empresas o incluso dentro de una sola empresa, primero debe hacer que los detalles sobre el Web service (su interfaz, parámetros, dónde se encuentra el servicio, etc.) sean accesibles. a los clientes Lo hace poniendo a disposición de los interesados una descripción del Web service. Como se indica en “ Lenguaje de descripción de Web services ” en la página 36 , WSDL es el lenguaje estándar para describir un servicio. Poner esta descripción WSDL a disposición de los clientes les permite utilizar el servicio.

Una vez que el WSDL está listo, tiene la opción de publicarlo en un registro. La siguiente sección describe cuándo es posible que desee publicar el WSDL en un registro. Si hace que la descripción WSDL de su servicio esté disponible en un registro público, entonces un cliente basado en Java puede usar las API de JAXR para buscar la descripción de su servicio y luego usar el servicio. De hecho, un cliente puede usar las mismas API JAXR para buscar la descripción de cualquier Web service con una descripción WSDL disponible. Esta sección examina los registros desde el punto de vista de un desarrollador de servicios.

### 3.6.1. Publicación de un servicio en un registro
	
La publicación de un servicio en un registro es un método para poner el servicio a disposición de los clientes. Si decide publicar su servicio en un registro, decide el tipo de registro que utilizará en función de los posibles escenarios de uso de su servicio. Los registros abarcan toda la gama, desde registros públicos hasta registros corporativos disponibles solo dentro de una sola empresa.

Es posible que desee registrar los Web services para el consumo del público en general en un registro público conocido.

Cuando hace que su servicio esté disponible a través de un registro público, esencialmente abre la accesibilidad del servicio a la audiencia más amplia posible. Cuando un servicio se inscribe en un registro público, cualquier cliente, incluso sin conocimiento previo del servicio, puede consultar y utilizar el servicio. Tenga en cuenta que el registro público contiene la descripción del Web service, que consta no solo de la descripción WSDL del servicio, sino también de los esquemas XML a los que hace referencia la descripción del servicio. En resumen, su Web service debe publicar sus esquemas XML públicos y cualquier esquema adicional definido en el contexto del servicio. También debe publicar en el mismo registro público los esquemas XML a los que hace referencia la descripción del Web service.

Cuando un Web service es estrictamente para uso dentro de la empresa, puede publicar una descripción del Web service en un registro corporativo dentro de la empresa.

No necesita usar un registro si todos los clientes de sus Web services son socios dedicados y existe un acuerdo entre los socios sobre el uso de los servicios. Cuando este sea el caso, puede publicar la descripción de su Web service (el WSDL y los esquemas XML referenciados) en una ubicación conocida con las protecciones de acceso adecuadas.

### 3.6.2. Comprender los conceptos de registro
	
Al considerar publicar su servicio a través de un registro, es importante comprender algunos de los conceptos, como repositorios y taxonomías, que están asociados con los registros.

Los registros públicos no son repositorios. En lugar de contener detalles completos sobre los servicios, los registros públicos contienen solo detalles sobre qué servicios están disponibles y cómo acceder a estos servicios. Por ejemplo, un servicio de venta de paquetes de aventura no puede registrar su catálogo completo de productos. Un registro solo puede almacenar el tipo de servicio, su ubicación y la información requerida para acceder al servicio. Un cliente interesado en un servicio primero debe descubrir el servicio desde el registro y luego vincularse con el servicio para obtener el catálogo completo de productos del servicio. Una vez que obtiene el catálogo de servicios, el cliente puede verificar si el servicio en particular cubre sus necesidades. Si no, el cliente debe volver al registro y repetir el proceso de descubrimiento y vinculación: el cliente busca en el registro algún otro servicio que potencialmente ofrezca lo que quiere, se vincula a ese servicio, obtiene y evalúa su catálogo, etc. Dado que este proceso, que no es insignificante, puede tener que repetirse varias veces, es fácil ver que es importante registrar un servicio bajo su taxonomía adecuada.

Registrar un servicio bajo la taxonomía adecuada.

Es importante registrar su servicio bajo las taxonomías adecuadas. Cuando desee publicar su servicio en un registro, ya sea un registro público o corporativo, debe hacerlo contra una taxonomía que clasifique o categorice correctamente su Web service. Es importante decidir la taxonomía adecuada, ya que esto afecta la facilidad con la que los clientes pueden encontrar y utilizar su servicio. Actualmente existen varias taxonomías estándar de la industria bien definidas, como las definidas por organizaciones como el Sistema de Clasificación de la Industria de América del Norte (NAICS).

El uso de taxonomías conocidas y existentes brinda a los clientes de su Web service una base estándar desde la cual buscar su servicio, lo que facilita que los clientes encuentren su servicio. Por ejemplo, supongamos que su empresa de viajes ofrece paquetes de aventuras relacionados con las islas de los Mares del Sur, así como aventuras alpinas o de montañismo. En lugar de crear su propia taxonomía para categorizar su servicio, los clientes pueden encontrar su servicio más fácilmente si publica la descripción de su servicio utilizando dos taxonomías estándar diferentes: una taxonomía para aventuras en islas y otra para aventuras alpinas y montañismo.

Puede publicar su Web service en más de un registro. Para ayudar aún más a los clientes a encontrar su servicio, también es una buena idea publicar en tantas categorías aplicables como sea posible. Por ejemplo, una empresa de viajes que vende paquetes de aventuras podría registrarse utilizando una taxonomía de categorías de productos, además de una taxonomía geográfica. Esto brinda a los clientes la oportunidad de utilizar estrategias óptimas para localizar un servicio. Por ejemplo, si existen varias instancias de un servicio para un producto en particular, el cliente puede refinar aún más su selección considerando la ubicación geográfica y eligiendo un servicio cercano a su propia ubicación. Usando el servicio de negocios de viajes como ejemplo, dicho servicio podría registrarse bajo las taxonomías para tipos de paquetes de aventura (isla y montañismo),

3.6.3. Escenarios de implementación del registro
Una vez que decida publicar su servicio y establezca las taxonomías que mejor identifiquen su servicio, estará listo para implementar sus decisiones. Antes de hacerlo, puede que le resulte útil examinar algunos de los escenarios de implementación del registro que puede encontrar.

Cuando se usa un registro, hemos visto que el proveedor de servicios publica la descripción del Web service en un registro y los clientes descubren y se unen al Web service para usar sus servicios. En general, un cliente debe realizar tres pasos para utilizar un Web service:

1. El cliente debe determinar cómo acceder a los métodos del servicio, como determinar los parámetros del método de servicio, los valores devueltos, etc. Esto se conoce como descubrir la interfaz de definición de servicio.

2. El cliente debe ubicar el Web service real; es decir, encuentre la dirección del servicio. Esto se conoce como descubrir la implementación del servicio.

3. El cliente debe estar ligado a la ubicación específica del servicio, y esto puede ocurrir en una de tres ocasiones:

Cuando se desarrolla el cliente (llamado enlace estático)

Cuando se implementa el cliente (también llamado enlace estático)

Durante el tiempo de ejecución (llamado enlace dinámico)

Estos tres pasos pueden producir tres escenarios. El escenario particular depende de cuándo ocurre el enlace y si el cliente se implementa únicamente para un servicio específico o es un cliente genérico. Los siguientes párrafos describen estos escenarios. (Consulte la Tabla 3.2 para obtener un resumen). También señalan puntos importantes que debe tener en cuenta al diseñar e implementar un Web service. ( El Capítulo 5 considera estos escenarios desde el punto de vista de un cliente).

***Escenario 1***: el Web service tiene un acuerdo con sus socios y publica su descripción WSDL y sus esquemas XML referenciados en una ubicación conocida y especificada. Espera que los desarrolladores de sus clientes conozcan esta ubicación. Cuando este es el caso, el cliente se implementa teniendo en cuenta la interfaz del servicio. Cuando se construye, el cliente ya está diseñado para buscar la interfaz del servicio directamente en lugar de usar un registro para encontrar el servicio.

***Escenario 2***: similar al escenario 1, el Web service publica su descripción WSDL y esquemas XML en una ubicación conocida y espera que sus socios conozcan esta ubicación o puedan descubrirla fácilmente. O bien, cuando se construye el socio, puede usar una herramienta para descubrir dinámicamente y luego incluir la implementación específica del servicio o la definición de la interfaz del servicio, junto con su implementación específica. En este caso, el enlace es estático porque el socio se crea cuando ya conoce la definición y la implementación de la interfaz de servicio, aunque esta información se haya encontrado de forma dinámica.

***Escenario 3***: el servicio implementa una interfaz en una ubicación conocida o espera que sus clientes utilicen herramientas para encontrar la interfaz en el momento de la compilación. Dado que los clientes del Web service son clientes genéricos, no son clientes diseñados únicamente para usar este Web service, debe diseñar el servicio para que pueda registrarse en un registro. Dichos clientes genéricos encuentran dinámicamente la implementación específica de un servicio en tiempo de ejecución utilizando registros. Elija el tipo de registro para el servicio, ya sea público, corporativo o privado, según los tipos de sus clientes, ya sea público en general o dentro de la empresa, sus restricciones de seguridad, etc.

Tabla 3.2. Escenarios de enlace de detección para clientes
Escenarios	Descubrir la definición de interfaz de servicio	Descubra la implementación del servicio	Enlace a una ubicación específica
1	Ninguno	Ninguno	Estático
2	Ninguno o dinámico en tiempo de compilación	Dinámico en tiempo de construcción	Estático
3	Ninguno o dinámico en tiempo de compilación	Dinámico en tiempo de ejecución	Dinámico en tiempo de construcción
  
## 3.7. Manejo de documentos XML en un Web service
	
Hasta ahora, este capítulo abordó temas aplicables a todas las implementaciones de Web services. Hay consideraciones adicionales cuando la implementación de un Web service espera recibir un documento XML que contiene toda la información de un cliente y que el servicio utiliza para iniciar un proceso comercial para manejar la solicitud. Hay varias razones por las que es apropiado intercambiar documentos:

Los documentos, especialmente los documentos comerciales, pueden ser muy grandes y, como tales, a menudo se envían como un lote de información relacionada. Pueden comprimirse independientemente del mensaje SOAP.

Los documentos pueden ser documentos comerciales legalmente vinculantes. Como mínimo, su forma original debe conservarse durante el intercambio y, lo más probable, es posible que deban archivarse y conservarse como evidencia en caso de desacuerdo. Para estos documentos, se debe conservar el conjunto de información completo del documento original, incluidos los comentarios y las referencias a entidades externas (así como a las entidades referidas).

El procesamiento de algunas aplicaciones requiere el conjunto completo de información del documento, incluidos los comentarios y las referencias a entidades externas. Al igual que con los documentos legalmente vinculantes, es necesario conservar el conjunto de información completo, incluidos los comentarios y las referencias a entidades externas, del documento original.

Cuando se envían como archivos adjuntos, es posible manejar documentos que pueden ajustarse a esquemas expresados ​​en idiomas no admitidos por el extremo del Web service o que no pueden estar presentes en un conjunto de información de mensajes SOAP (como la declaración de tipo de documento <!DOCTYPE > para un esquema basado en DTD).

Por ejemplo, considere el Web service de la agencia de viajes, que normalmente recibe la solicitud de un cliente como un documento XML que contiene toda la información necesaria para organizar un viaje en particular. La información del documento incluye detalles sobre la cuenta del cliente, el estado de la tarjeta de crédito, los destinos de viaje deseados, las aerolíneas preferidas, la clase de viaje, las fechas, etc. El Web service utiliza el contenido de los documentos para realizar pasos como verificar la cuenta del cliente, obtener la autorización de la tarjeta de crédito, verificar la disponibilidad de alojamiento y transporte, crear un itinerario y comprar boletos.

En esencia, el servicio, que recibe la solicitud con el documento XML, inicia un proceso comercial para realizar una serie de pasos para completar la solicitud. El contenido del documento XML se utiliza en todo el proceso empresarial. Manejar este tipo de escenario de manera efectiva requiere algunas consideraciones además de las generales para todos los Web services.

Un buen diseño espera que los documentos XML se reciban como objetos javax.xml.transform.Source . Consulte “ Intercambio de documentos XML ” en la página 107 , que trata sobre el intercambio de documentos XML como parámetros. Tenga en cuenta el efecto sobre la interoperabilidad (consulte “ Interoperabilidad ” en la página 86 ).

Es un buen diseño realizar la validación y cualquier transformación necesaria de los documentos XML lo más cerca posible del punto final. La validación y la transformación deben realizarse antes de aplicar cualquier lógica de procesamiento al contenido del documento. Consulte la Figura 3.4 y la discusión sobre la recepción de solicitudes en “ Recepción de solicitudes ” en la página 89 .

Es importante considerar el tiempo de procesamiento de una solicitud y si el cliente espera la respuesta. Cuando un servicio espera un documento XML como entrada e inicia un largo proceso comercial basado en el contenido del documento, los clientes normalmente no desean esperar la respuesta. Un buen diseño cuando el tiempo de procesamiento puede ser extenso es delegar una solicitud a una cola o tema JMS y devolver un identificador de correlación para referencia futura del cliente. (Recuerde la Figura 3.7 en la página 96 y su discusión).

En las siguientes secciones se analizan otras consideraciones.

### 3.7.1. Intercambio de documentos XML
	
Como se señaló anteriormente, hay ocasiones en las que puede tener que intercambiar documentos XML como parte de su Web service y dichos documentos se reciben como parámetros de una llamada de método. La plataforma J2EE proporciona tres formas de intercambiar documentos XML.

La primera opción es utilizar las asignaciones Java-MIME proporcionadas por la plataforma J2EE. Consulte la Tabla 3.1 en la página 75 . Con esta opción, el extremo del Web service recibe documentos como objetos javax.xml.transform.Source . (Consulte el Ejemplo de código 3.3 en la página 75 ). Junto con el documento, el extremo del servicio también puede esperar recibir otros argumentos JAX-RPC que contengan metadatos, requisitos de procesamiento, información de seguridad, etc. Cuando un documento XML se pasa como fuenteobjeto, el contenedor maneja automáticamente el documento como un archivo adjunto; de hecho, la implementación del contenedor maneja los detalles del paso del documento por usted. Esto lo libera de las complejidades de enviar y recuperar documentos como parte del manejo de solicitudes/respuestas del terminal.

Pasar documentos XML como objetos de origen es la opción más eficaz en un entorno completamente basado en Java (uno en el que todos los clientes de Web services se basan en Java). Sin embargo, es posible que el envío de documentos como objetos de origen no sea interoperable con clientes que no sean de Java. (Como ya se indicó en la sección “ Interoperabilidad ” en la página 86 , actualmente se están formulando formas estándar de intercambiar archivos adjuntos. Las versiones futuras de la plataforma J2EE incorporarán estos estándares una vez que sean finales).

La segunda opción es diseñar su extremo de servicio de modo que reciba documentos como tipos de cadena . El ejemplo de código 3.17 muestra la descripción de WSDL para un servicio que recibe documentos como tipos de cadena, lo que ilustra cómo WSDL asigna el documento XML.

**Ejemplo de código 3.17. Asignación de documento XML a xsd: cadena**

```xml
```

El ejemplo de código 3.18 muestra la interfaz Java equivalente para el WSDL que se muestra en el ejemplo de código 3.17 .

**Ejemplo de código 3.18. Recibir un documento XML como un objeto de cadena**

```java
```

Si está desarrollando su servicio utilizando el enfoque de Java a WSDL, y el servicio debe intercambiar documentos XML y ser interoperable con clientes en cualquier plataforma, entonces pasar documentos como objetos String puede ser su única opción.

Puede haber un inconveniente de rendimiento al enviar un documento XML como un objeto de cadena : a medida que crece el tamaño del documento, también crece el tamaño equivalente de cadena del documento. Como resultado, el tamaño de la carga útil del mensaje que envías también crece. Además, el documento XML pierde su formato original ya que enviar un documento como un objeto String lo envía en un formato canónico.

La tercera opción es intercambiar el documento XML como un fragmento de documento SOAP. Con esta opción, asigna el documento XML a xsd:anyType en el archivo WSDL del servicio.

Se recomienda que los Web services intercambien documentos XML como fragmentos de documentos SOAP porque pasar documentos XML de esta manera es portátil entre implementaciones J2EE e interoperable con todas las plataformas.

Para pasar fragmentos de documentos SOAP, debe implementar su servicio utilizando el enfoque de WSDL a Java.

Por ejemplo, el servicio de agencia de viajes recibe un documento XML que representa una orden de compra que contiene todos los detalles sobre los planes de viaje preferidos del cliente. Para implementar este servicio, defina el WSDL para el servicio y, en el WSDL, asigne el tipo de documento XML como xsd:anyType . Consulte el ejemplo de código 3.19 .

**Ejemplo de código 3.19. Asignación de documentos XML a xsd:anyType**

```xml
```

Una asignación WSDL del tipo de documento XML a xsd:anyType requiere que la plataforma asigne el parámetro del documento como un objeto javax.xml.soap.SOAPElement . Por ejemplo, el Ejemplo de código 3.20 muestra la interfaz Java generada para la descripción WSDL en el Ejemplo de código 3.19 .

**Ejemplo de código 3.20. Interfaz Java para WSDL en el ejemplo de código 3.19**

```java
```

En este ejemplo, el parámetro SOAPElement en submitPurchaseOrder representa el fragmento de documento SOAP enviado por el cliente. Para el servicio de agencia de viajes, esta es la orden de compra. El servicio puede analizar el fragmento de documento SOAP recibido utilizando la API javax.xml.soap.SOAPElement . O bien, el servicio puede utilizar JAXB para asignar el fragmento de documento a un objeto Java o transformarlo en otro esquema. Un cliente de este Web service crea el documento de orden de compra utilizando la API específica de la plataforma del cliente para crear fragmentos de documentos SOAP (en la plataforma Java, esta es la API javax.xml.soap.SOAPElement ) y envía el documento como uno de los parámetros de llamada del servicio.

Al utilizar el enfoque de WSDL a Java, puede asignar directamente el documento que se va a intercambiar a su esquema adecuado en el WSDL. La interfaz Java generada correspondiente representa el documento como su objeto Java equivalente . Como resultado, el extremo del servicio nunca ve el documento que se intercambia en su forma de documento original. También significa que el punto final está estrechamente relacionado con el esquema del documento: cualquier cambio en el esquema del documento requiere un cambio correspondiente en el punto final. Si no desea un acoplamiento tan estrecho, considere usar xsd:anyType para mapear el documento.

### 3.7.2. Separación de la manipulación de documentos de la lógica de procesamiento

Cuando la lógica de negocio de su servicio opera en el contenido de un documento XML entrante, la lógica de procesamiento comercial debe, como mínimo, leer el documento, si no modificarlo. Al separar la lógica de manipulación de documentos de la lógica de procesamiento, un desarrollador puede cambiar entre varios mecanismos de manipulación de documentos sin afectar la lógica de procesamiento. Además, existe una clara división entre las habilidades de los desarrolladores.

Es una buena práctica separar la lógica de manipulación de documentos XML de la lógica de negocio.

La sección “ Resumir el procesamiento XML de la lógica de la aplicación ” en la página 155 proporciona más información sobre cómo lograr esta separación y sus méritos.

### 3.7.3. Fragmentación de documentos XML

Cuando la lógica de negocio de su servicio opera en el contenido de un documento XML entrante, es una buena idea dividir los documentos XML en fragmentos lógicos cuando corresponda. Cuando la lógica de procesamiento recibe un documento XML que contiene toda la información para procesar una solicitud, el documento XML generalmente tiene segmentos bien definidos para diferentes entidades y cada segmento contiene los detalles sobre una entidad específica.

En lugar de pasar el documento completo a diferentes componentes que manejan varias etapas del proceso comercial, es mejor si la lógica de procesamiento divide el documento en fragmentos y pasa solo los fragmentos necesarios a otros componentes o servicios que implementan partes de la lógica del proceso comercial.

Consulte “ Fragmentación de documentos XML entrantes ” en la página 153 para obtener más detalles sobre la fragmentación.

### 3.7.4. Usando XML

XML, si bien tiene muchos beneficios, también tiene desventajas de rendimiento. Debe sopesar las ventajas y desventajas de pasar documentos XML a través de las etapas de procesamiento de la lógica de negocio. Los pros y los contras de pasar documentos XML cobran mayor importancia cuando la implementación de la lógica de negocio abarca varios contenedores. Consulte el Capítulo 5 , específicamente la sección titulada “ Use XML juiciosamente ” en la página 194 , que proporciona pautas sobre este tema. Seguir estas pautas puede ayudar a minimizar la sobrecarga de rendimiento que conlleva el paso de documentos XML a través de las etapas del flujo de trabajo.

Además, cuando decida un enfoque, tenga en cuenta los costos que implica el uso de XML y sopéselos junto con las recomendaciones sobre análisis, validación y vinculación de documentos a objetos Java. Véase el Capítulo 4 para una discusión de estos temas.

### 3.7.5. Uso de tecnologías JAXM y SAAJ

La plataforma J2EE proporciona una serie de tecnologías, incluidas tecnologías obligatorias como JAX-RPC y SAAJ y tecnologías opcionales como Java TM API para mensajería XML (JAXM), que permiten el intercambio de mensajes y documentos con SOAP. Cada una de estas tecnologías J2EE ofrece un nivel diferente de soporte para mensajería y comunicación basada en SOAP. (Vea el Capítulo 2 para la discusión sobre JAX-RPC y SAAJ).

Una pregunta obvia que surge es: ¿Por qué no utilizar las tecnologías JAXM o SAAJ en escenarios donde hay que pasar documentos XML? Si recuerdas:

SAAJ permite a los desarrolladores tratar directamente con mensajes SOAP y es más adecuado para entornos de mensajería punto a punto. SAAJ es mejor para los desarrolladores que desean tener más control sobre los mensajes SOAP que se intercambian y para los desarrolladores que usan controladores.

JAXM define una infraestructura para la entrega garantizada de mensajes. Proporciona una forma de enviar y recibir documentos XML y garantizar su recepción, y está diseñado para casos de uso que implican almacenar y reenviar documentos y mensajes XML.

SAAJ se considera más útil para desarrolladores avanzados que conocen a fondo la tecnología y que deben tratar directamente con mensajes SOAP.

Usar JAXM para escenarios que requieren pasar documentos XML puede ser una buena opción. Tenga en cuenta, sin embargo, que JAXM es opcional en la plataforma J2EE 1.4. Como resultado, es posible que un servicio desarrollado con JAXM no sea portátil. Cuando controla ambos puntos finales de un Web service, puede tener más sentido considerar el uso de JAXM.
  
## 3.8. Implementación y empaquetado de un extremo de servicio

Hasta ahora, hemos examinado los Web services en la plataforma J2EE en términos de diseño, desarrollo e implementación. Una vez que complete la implementación de los Web services, debe escribir sus descriptores de implementación, empaquetar el servicio con todos sus componentes e implementar el servicio.

Los desarrolladores deben, si es posible, usar herramientas o IDE para desarrollar un Web service. Estas herramientas de desarrollo de Web services e IDE crean automáticamente los descriptores de implementación adecuados para el servicio y manejan correctamente el paquete del servicio, pasos necesarios para que un servicio funcione correctamente. Además, las herramientas y los IDE ocultan estos detalles al desarrollador.

Aunque puede esperar que su herramienta de desarrollo realice estas tareas por usted, es bueno tener una comprensión conceptual del descriptor de implementación de la plataforma J2EE 1.4 y la estructura de empaquetado, ya que determinan cómo se implementa un servicio en un servidor J2EE y la disponibilidad del servicio para clientela. Esta sección, que proporciona una descripción general conceptual de los detalles de implementación y empaquetado, no es una lectura esencial. No obstante, puede que valga la pena ver cómo estos detalles contribuyen a los Web services portátiles e interoperables.

3.8.1. Información de servicio en los descriptores de implementación
Para implementar correctamente un servicio, el desarrollador proporciona la siguiente información.

Detalles relacionados con la implementación de la implementación del servicio, incluida la interfaz del Web service, las clases que implementan la interfaz del Web service, etc.

Detalles sobre los Web services que se implementarán, como los puertos y las asignaciones

Detalles sobre la relación de componente de puerto a puerto de WSDL

Más específicamente, el descriptor de implementación contiene información sobre el puerto de un servicio y el WSDL asociado. Recuerde de “ Tecnologías de Web services integradas en la plataforma J2EE ” en la página 49 :

Un componente de puerto (también llamado puerto) brinda una vista del servicio a los clientes, de modo que el cliente no necesita preocuparse por cómo se ha implementado el servicio.

Cada puerto tiene un WSDL asociado.

Cada puerto tiene un punto final de servicio asociado (y su implementación). El punto final atiende todas las solicitudes que pasan por la ubicación definida en la dirección del puerto WSDL.

Para comenzar, la implementación del servicio declara sus detalles de implementación en los descriptores de implementación específicos del módulo apropiado. Por ejemplo, una implementación de servicio que utiliza un punto final de servicio JAX-RPC declara sus detalles en WEB-INF/web.xmlarchivo utilizando el elemento de clase de servlet . (Consulte el ejemplo de código 3.21 ).

**Ejemplo de código 3.21. Archivo web.xml para un punto final de servicio JAX-RPC**

```xml
```

Tenga en cuenta que cuando tiene un servicio que funciona puramente como un Web service mediante puntos finales de servicio JAX-RPC, algunas especificaciones en el archivo web.xml , como <error-page> y <welcome-file-list> , no tienen efecto.

Una implementación de servicio que usa un punto final de servicio EJB declara sus detalles de implementación en el archivo META-INF/ejb-jar.xml usando el elemento de sesión . (Consulte el ejemplo de código 3.22 ).

**Ejemplo de código 3.22. Archivo ejb-jar.xml para un punto final de servicio EJB**
	
```xml
```

A continuación, se especifican los detalles del puerto. El descriptor de implementación del Web service, llamado webservices.xml , define y declara los detalles estructurales para el puerto de un Web service. Este archivo contiene la siguiente información:

Un nombre lógico para el puerto que también es único entre todos los componentes del puerto ( elemento port-component-name )

La interfaz de punto final de servicio para el puerto ( elemento de interfaz de punto final de servicio )

El nombre de la clase que implementa la interfaz de servicio ( elemento service-impl-bean )

El archivo WSDL para el servicio ( elemento wsdl-file )

Un QNombrepara el puerto ( elemento wsdl-port)

Una correlación entre las definiciones de WSDL y las interfaces y definiciones de Java reales utilizando el archivo de mapeo ( elemento jaxrpc-mapping-file )

Detalles opcionales sobre cualquier controlador

La referencia al bean de implementación del servicio, especificado mediante el elemento service-impl-bean en webservices.xml , es un enlace de servlet o un enlace ejb dependiendo de si el punto final es un punto final de servicio JAX-RPC o EJB. Este elemento de enlace asocia el puerto del Web service a la implementación del punto final real definida en el archivo web.xml o ejb-jar.xml .

El archivo de mapeo JAX-RPC, que se especifica utilizando el elemento jaxrpc-mapping-file en webservices.xml , mantiene detalles sobre las relaciones y los mapeos entre las definiciones WSDL y las interfaces y definiciones Java correspondientes. La información contenida en este archivo, junto con la información en el WSDL, se usa para crear apéndices y vínculos para los servicios implementados.

Por lo tanto, el descriptor de implementación de Web services, webservices.xml , vincula la información del puerto WSDL a un componente de puerto único y desde allí a las clases de implementación reales y las asignaciones de Java a WSDL. El ejemplo de código 3.23 es un ejemplo del descriptor de implementación de Web services para nuestro Web service meteorológico de muestra, que utiliza un extremo de servicio JAX-RPC.

**Ejemplo de código 3.23. Descriptor de implementación del Web service meteorológico**
	
```xml
```

### 3.8.2. Estructura del paquete
	
Una vez que se completan la implementación del servicio y los descriptores de implementación, los siguientes archivos deben empaquetarse en el módulo J2EE apropiado:

El archivo WSDL

La interfaz de punto final de servicio, incluida su implementación y clases dependientes

El archivo de asignación JAX-RPC, que especifica el nombre del paquete que contiene las clases de tiempo de ejecución generadas y define el URI del espacio de nombres para el servicio. Consulte el ejemplo de código 5.21 en la página 242 .

El descriptor de implementación del Web service

El tipo de punto final utilizado para la implementación del servicio determina el tipo de módulo J2EE que se utilizará.

El módulo J2EE apropiado para un servicio con un punto final de servicio JAX-RPC es un archivo WAR. Un servicio que utiliza un punto final de servicio EJB debe empaquetarse en un archivo EJB-JAR.

La estructura del paquete es la siguiente:

Los archivos WSDL se encuentran en relación con la raíz del módulo.

La interfaz de servicio, las clases de implementación del servicio y las clases dependientes se empaquetan como cualquier otro componente J2EE.

El archivo de asignación JAX-RPC se encuentra en relación con la raíz del módulo (normalmente en el mismo lugar que el descriptor de implementación del módulo).

La ubicación del descriptor de implementación del Web service depende del tipo de extremo del servicio, de la siguiente manera:

Para un punto final de servicio EJB, el descriptor de implementación del Web service se empaqueta en un EJB-JAR en el directorio META-INF como META-INF/webservice.xml

Para un punto final de servicio JAX-RPC, el descriptor de implementación se empaqueta en un archivo WAR en el directorio WEB-INF como WEB-INF/webservices.xml.

Consulte la Figura 3.10 , que muestra una estructura de paquete típica para un Web service que utiliza un punto final EJB. La figura 3.11 muestra la estructura típica de un Web service que utiliza un extremo JAX-RPC.

**Figura 3.10. Estructura del paquete para EJB Endpoint**



**Figura 3.11. Estructura del paquete para punto final de servicio JAX-RPC**


## 3.9. Conclusión
	
Este capítulo comenzó con una descripción de los fundamentos de los Web services. Describió el flujo subyacente de un Web service típico en la plataforma Java, mostrando cómo los diversos componentes que conforman los clientes y servicios pasan solicitudes y respuestas entre ellos. El capítulo también describió algunos escenarios de ejemplo, que utilizó para ilustrar varios conceptos. Una vez que se establecieron las bases, el capítulo analizó las decisiones de diseño clave que debe tomar un desarrollador de Web services, principalmente el diseño de un servicio como una interacción y una capa de procesamiento. Trazó cómo tomar decisiones de diseño y recomendar buenas opciones de diseño para escenarios específicos.

El siguiente capítulo se centra en el desarrollo de clientes de Web services.
  
  
