# Capítulo 2. Estándares y Tecnologías

Este capítulo describe los estándares de Web Service universalmente aceptados y el soporte de la plataforma J2EE para estos estándares. El paradigma informático de los Web Service permite que las aplicaciones y los servicios que se ejecutan en diferentes plataformas se comuniquen e interoperen fácilmente entre sí. Para ser tan ampliamente aceptado, el paradigma debe brindar a los implementadores de servicios flexibilidad en su enfoque de implementación. Igual de importante, cada implementación debe estar segura de que puede funcionar con otra implementación. Las tecnologías comprobadas facilitan el desarrollo de Web Service y este tipo de estándares aceptados permiten la interoperabilidad.

## 2.1. Descripción general de los estándares de Web Service

Los estándares difieren de las tecnologías. ***Los estándares son una colección de especificaciones, reglas y pautas formuladas y aceptadas por los principales participantes del mercado***. Si bien estas reglas y pautas prescriben una forma común de lograr el objetivo declarado del estándar, no prescriben los detalles de implementación. Los participantes individuales diseñan sus propias implementaciones de un estándar aceptado de acuerdo con las pautas y reglas del estándar. Estas diversas implementaciones de un estándar por diferentes proveedores dan lugar a una variedad de tecnologías. Sin embargo, a pesar de las diferencias en los detalles de implementación, las tecnologías pueden funcionar juntas si se han desarrollado de acuerdo con las especificaciones del estándar.

Para que los Web Service tengan éxito, los estándares de Web Service deben ser ampliamente aceptados. Para permitir una aceptación tan amplia, los estándares utilizados para los Web Service y las tecnologías que implementan esos estándares deben cumplir con los siguientes criterios:

* Un Web Service debe poder atender las solicitudes de cualquier cliente, independientemente de la plataforma en la que se implemente el cliente.

* Un cliente debería poder encontrar y utilizar cualquier Web Service independientemente de los detalles de implementación del servicio o la plataforma en la que se ejecuta.

Los estándares establecen una base común y permiten que los Web Service logren una amplia aceptación e interoperabilidad. Los estándares cubren áreas tales como:

* ***Markup language común para la comunicación***: Para empezar, los proveedores de servicios, que hacen que los servicios estén disponibles, y los solicitantes de servicios, que usan los servicios, deben poder comunicarse entre sí. La comunicación exige el uso de una terminología o lenguaje común a través del cual los proveedores y los solicitantes se comunican entre sí. ***Un lenguaje de marcado común facilita la comunicación entre proveedores y solicitantes***, ya que cada parte puede leer y comprender la información intercambiada en función de las etiquetas de marcado incrustadas. Aunque los proveedores y los solicitantes pueden comunicarse usando intérpretes o traductores, usar intérpretes o traductores no es práctico porque tales agentes intermediarios son ineficientes y no rentables. Los Web services utilizan eXtensible Markup Language (XML) para el common markup language (lenguaje de marcado común).

* ***Common message format para el intercambio de información***: Aunque establecer un common markup language es importante, por sí solo no es suficiente para que dos partes (específicamente, los proveedores de servicios y los solicitantes de servicios) se comuniquen correctamente. Para una comunicación efectiva, las partes deben poder intercambiar mensajes de acuerdo con un formato acordado. Al tener dicho formato, las partes que no se conocen entre sí pueden comunicarse de manera efectiva. El **Simple Object Access Protocol (SOAP)** proporciona un formato de mensaje común para los Web services.

AQUIIIIIIIIII
* ***Common service specification formats***(Formatos de especificación de servicios comunes): además de los formatos de mensajes comunes y el lenguaje de marcado, debe haber un formato común que todos los proveedores de servicios puedan usar para especificar los detalles del servicio, como el tipo de servicio, cómo acceder al servicio, etc. Un mecanismo estándar para especificar los detalles del servicio permite a los proveedores especificar sus servicios para que cualquier solicitante pueda entenderlos y usarlos. Por ejemplo, el lenguaje de descripción de servicios web (WSDL) proporciona servicios web con formatos de especificación comunes.

Medios comunes para la búsqueda de servicios : de la misma manera que los proveedores necesitan una forma común de especificar los detalles del servicio, los solicitantes de servicios deben tener una forma común de buscar y obtener detalles de un servicio. Esto se logra teniendo lugares comunes y bien conocidos donde los proveedores pueden registrar las especificaciones de sus servicios y donde los solicitantes saben dónde ir para encontrar los servicios. Al tener estas ubicaciones comunes y conocidas y una forma estándar de acceder a ellas, todos los proveedores y solicitantes pueden acceder universalmente a los servicios. La especificación Universal Description, Discovery and Integration (UDDI) define un medio común para buscar servicios web.

Aunque no analizan exhaustivamente estos estándares básicos, las siguientes secciones brindan suficiente información sobre los estándares para permitir una mayor discusión sobre las tecnologías J2EE que los implementan. Para obtener detalles completos, consulte la sección de referencia al final de este capítulo. Además de estos estándares básicos, los servicios web más complejos que implementan procesos de nivel empresarial necesitan estándares de seguridad, transacciones, control de flujo de procesos, etc.

2.1.1. Lenguaje de marcado extensible
El lenguaje de marcado extensible (XML), un estándar aceptado en toda la industria, permite que los proveedores de servicios y los solicitantes se comuniquen entre sí en un idioma común. XML no depende de una plataforma o tecnología propietaria, y los mensajes en XML se pueden comunicar a través de Internet utilizando protocolos estándar de Internet, como HTTP. Debido a que XML es un producto del cuerpo del Consorcio World Wide Web (W3C), todos los actores principales admitirán los cambios que se realicen en él. Esto garantiza que, a medida que evoluciona XML, los servicios web también pueden evolucionar sin problemas de compatibilidad con versiones anteriores.

XML es un lenguaje de marcado simple, flexible y basado en texto. Los datos XML se marcan mediante etiquetas encerradas entre corchetes angulares. Las etiquetas contienen el significado de los datos que marcan. Dicho marcado permite que diferentes sistemas intercambien datos fácilmente entre sí. Esto difiere del uso de etiquetas en HTML, que está orientado a mostrar datos. A diferencia de HTML, la visualización no es inherente a XML. El ejemplo de código 2.1 muestra el código de un documento XML que representa la información de contacto de una persona.

Ejemplo de código 2.1. Ejemplo de documento XML
<?versión xml="1.0" codificación="ISO-8859-1" standalone="sí"?>
<Información de contacto>
    <Nombre>Juan Pérez</Nombre>
    <Dirección>
        <Street>4140 Red Circle</Street>
        <Ciudad>Santa Clara</Ciudad>
        <Estado>California</Estado>
        <País>EE.UU.</País>
    </dirección>
    <Teléfono de casa>123-456-7890</Teléfono de casa>
    <Correo electrónico>j2eeblueprints@sun.com</Correo electrónico>
</Información de contacto>

Una definición de tipo de documento (DTD) o una definición de esquema XML (XSD) describe la estructura de un documento XML. Tiene información sobre las etiquetas que puede tener el documento XML correspondiente, el orden de esas etiquetas, etc. Un documento XML se puede validar contra su DTD o su XSD. La validación de un documento XML garantiza que el documento sigue la estructura definida en su DTD o XSD y que no tiene etiquetas XML no válidas. Por lo tanto, los sistemas que intercambian documentos XML para algún propósito pueden acordar una sola DTD o XSD y validar todos los documentos XML recibidos para ese propósito contra la DTD/XSD acordada antes de procesar el documento. El ejemplo de código 2.2 es la DTD para el documento XML en el ejemplo de código 2.1 .

Ejemplo de código 2.2. Definición de tipo de documento
<!ELEMENT Información de contacto (nombre, dirección, teléfono particular, correo electrónico)>
<!ELEMENTO Nombre (#PCDATA)>
<!ELEMENT Dirección (Calle, Ciudad, Estado, País)>
<!ELEMENT Calle (#PCDATA)>
<!ELEMENT Ciudad (#PCDATA)>
<!ELEMENTO Estado (#PCDATA)>
<!ELEMENT País (#PCDATA)>
<!ELEMENT Teléfono particular (#PCDATA)>
<!ELEMENTO CORREO ELECTRÓNICO (#PCDATA)>

Desafortunadamente, las DTD son una forma inadecuada de definir formatos de documentos XML. Por ejemplo, las DTD no brindan ninguna facilidad real para expresar tipos de datos o relaciones estructurales complejas. Las definiciones de esquema XML estandarizan las definiciones de formato de los documentos XML. El ejemplo de código 2.4 muestra el esquema XSD para el documento XML de muestra en el ejemplo de código 2.3 .

Ejemplo de código 2.3. Documento XML
<?versión xml="1.0" codificación="ISO-8859-1" standalone="sí"?>
<Información de contacto
       xmlns="http://simple.ejemplo.com/CInfoXmlDoc"
       xmlns:xsi=" http://www.w3.org/2001/XMLSchema-instance "
       xsi:schemaLocation=
          " http://simple.example.com/Archivo 
						CInfoXmlDoc:./CInfoXmlDoc.xsd ">
    <Nombre>Juan Pérez</Nombre>
    <Dirección>
        <Street>4140 Red Circle</Street>
        <Ciudad>Santa Clara</Ciudad>
        <Estado>California</Estado>
        <País>EE.UU.</País>
    </dirección>
    <Teléfono de casa>123-456-7890</Teléfono de casa>
     <Correo electrónico> j2eeblueprints@sun.com </Correo electrónico>
</Información de contacto>

Ejemplo de código 2.4. Esquema XSD
<?versión xml="1.0" codificación="UTF-8"?>
<xsd:esquema xmlns:xsd=" http://www.w3.org/2001/XMLSchema "
   targetNamespace=" http://simple.example.com/CInfoXmlDoc "
   xmlns=" http://simple.ejemplo.com/CInfoXmlDoc "
   elementFormDefault="calificado">
   <xsd:element name="Información de contacto">
      <xsd:tipocomplejo>
         <xsd:secuencia>
             <xsd:elemento nombre="Nombre" tipo="xsd:cadena" />
             <xsd:nombre del elemento="Dirección">
                <xsd:tipocomplejo>
                    <xsd:secuencia>
                       <xsd:nombre del elemento="Calle"
                                 tipo="xsd:cadena" />
                       <xsd:nombre del elemento="Ciudad"
                                 tipo="xsd:cadena" />
                       <xsd:nombre del elemento="Estado"
                                 tipo="xsd:cadena" />
                       <xsd:nombre del elemento="País"
                                 tipo="xsd:cadena" />
                     </xsd:secuencia>
                 </xsd:tipocomplejo>
              </xsd:elemento>
              <xsd:element name="HomePhone" type="xsd:string" />
              <xsd:nombre del elemento="Correo electrónico" tipo="xsd:cadena"/>
          </xsd:secuencia>
       </xsd:tipocomplejo>
   </xsd:elemento>
</xsd:esquema>

Al considerar esquemas XML, es importante comprender el concepto de espacios de nombres XML. Para habilitar el uso del mismo nombre con diferentes significados en diferentes contextos, los esquemas XML pueden definir un espacio de nombres. Un espacio de nombres es un conjunto de nombres únicos que se definen para un contexto particular y que se ajustan a reglas específicas para el espacio de nombres. Dado que un espacio de nombres es específico de un contexto particular, cada espacio de nombres no está relacionado con ningún otro espacio de nombres. Por lo tanto, el mismo nombre se puede usar en diferentes espacios de nombres sin causar un conflicto de nombres duplicados. Los documentos XML, que se ajustan a un esquema XML y tienen múltiples elementos y atributos, a menudo se basan en espacios de nombres para evitar una colisión en los nombres de etiquetas o atributos o para poder usar la misma etiqueta o nombre de atributo en diferentes contextos.

Técnicamente hablando, un espacio de nombres XML define una colección de nombres y se identifica mediante una referencia URI. (Observe en el Ejemplo de código 2.4 el código xmlns="http://simple.example.com/CInfoXmlDoc" . Un código como este indica que el esquema XML define un espacio de nombres para los diversos elementos y atributos del documento). Nombres en el El espacio de nombres se puede utilizar como tipos de elementos o atributos en un documento XML. La combinación de URI y tipo de elemento o nombre de atributo comprende un nombre universal único que evita colisiones.

Por ejemplo, en el Ejemplo de código 2.4 , hay un espacio de nombres que define los tipos de elementos del documento Información de contacto , como Nombre y Dirección . Estos tipos de elementos son únicos dentro del contexto de la información de contacto. Si el documento incluyera otro contexto de espacio de nombres, como BankInformation que definiera sus propios tipos de elementos de Nombre y Dirección , estos dos espacios de nombres serían separados y distintos. Es decir, un nombre y dirección usados ​​en el contexto de información bancaria no entrarían en conflicto con un nombre y dirección usados ​​en el contexto de información de contacto .

2.1.2. Simple Object Access Protocol
XML resuelve la necesidad de un lenguaje común, y el Protocolo simple de acceso a objetos (SOAP) satisface la necesidad de un formato de mensajería común. SOAP permite que objetos desconocidos entre sí se comuniquen; es decir, para intercambiar mensajes. SOAP, un protocolo de conexión similar al Internet Inter-ORB Protocol (IIOP) y al Java Remote Method Protocol (JRMP), es un protocolo basado en texto que utiliza un formato de codificación de datos basado en XML y HTTP/SMTP para transportar mensajes. SOAP es independiente tanto del lenguaje de programación como de la plataforma operativa, y no requiere ninguna tecnología específica en sus terminales, lo que lo hace completamente independiente de los proveedores, las plataformas y las tecnologías. Su formato de texto también convierte a SOAP en un protocolo compatible con cortafuegos. Además, SOAP cuenta con el respaldo de los principales actores industriales y se puede esperar que tenga soporte universal.

Para habilitar los intercambios de mensajes, SOAP define un sobre, que contiene un cuerpo SOAP, dentro del cual se incluye el mensaje, y un encabezado opcional específico de SOAP. Todo el sobre (cuerpo más encabezado) es un documento XML completo. (Consulte la Figura 2.1 ).

Figura 2.1. Estructura del mensaje SOAP



Las entradas del encabezado pueden contener información útil para los destinatarios, y estas entradas del encabezado también pueden ser útiles para los procesadores intermedios, ya que habilitan funciones avanzadas. El cuerpo, que contiene el contenido del mensaje, es consumido por el destinatario. SOAP es independiente del contenido del mensaje; la única restricción es que el mensaje esté en formato XML.

El ejemplo de código 2.5 muestra un ejemplo simple pero completo de una solicitud SOAP para obtener una cotización de acciones.

Ejemplo de código 2.5. Ejemplo de solicitud SOAP
<SOAP-ENV:Sobre xmlns:SOAP-ENV="SoapEnvelopeURI"
       SOAP-ENV:encodingStyle="SoapEncodingURI">
    <SOAP-ENV:Encabezado>
    </SOAP-ENV:Encabezado>
    <SOAP-ENV:Cuerpo>
        <m:GetLastTradePrice xmlns:m="URI del servicio">
            <tickerSymbol>SUNW</tickerSymbol>
        </m:ObtenerPrecioÚltimoTrade>
    </SOAP-ENV:Cuerpo>
</SOAP-ENV:Sobre>

Este ejemplo muestra cómo se codifica un mensaje SOAP utilizando XML e ilustra algunos elementos y atributos SOAP. Todos los mensajes SOAP deben tener un elemento Envelope y deben definir dos espacios de nombres: un espacio de nombres connota el sobre SOAP ( xmlns:SOAP-ENV ) y el otro indica la codificación SOAP ( SOAP-ENV:encodingStyle ). Los mensajes SOAP sin la especificación adecuada del espacio de nombres se consideran mensajes no válidos. El atributo encodingStyle es importante, ya que se usa para especificar reglas de serialización para el mensaje SOAP. Además, no puede haber referencias de DTD desde dentro de los mensajes SOAP.

Si bien es opcional, el elemento Header , cuando se usa, debe ser el primer elemento secundario inmediato después del Envelope . El elemento de encabezado proporciona una forma de extender el mensaje SOAP al especificar información adicional, como autenticación y transacciones. Especificar esta información adicional como parte del encabezado le dice al destinatario del mensaje cómo manejar el mensaje.

Hay muchos atributos que se pueden usar en el elemento de encabezado SOAP . Por ejemplo, el atributo actor del elemento Header permite que un mensaje SOAP pase a través de procesos intermedios en ruta hacia su destino final. Cuando el atributo actor está ausente, el destinatario es el destino final del mensaje SOAP. De manera similar, se pueden usar muchos otros atributos. Sin embargo, este capítulo no aborda estos detalles.

El elemento Body , que debe estar presente en todos los mensajes SOAP, debe seguir inmediatamente después del elemento Header , si está presente. De lo contrario, el elemento Body debe seguir inmediatamente después del inicio del elemento Envelope . El cuerpo contiene la especificación de la solicitud real (como las llamadas a métodos). El elemento Fault en SOAP Body permite el manejo de errores para solicitudes de mensajes.

Tenga en cuenta que este capítulo no analiza los detalles de los elementos de encabezado , los atributos y otras funciones adicionales, como SOAP con archivos adjuntos y enlace HTTP, aunque forman parte del estándar SOAP. Los lectores interesados ​​deben consultar las especificaciones de SOAP.

2.1.3. Normas de registro
La especificación Universal Description, Discovery, and Integration (UDDI) define una forma estándar para registrar, cancelar el registro y buscar servicios web. UDDI es una especificación basada en estándares para el registro, la descripción y el descubrimiento de servicios web. Al igual que las páginas amarillas de un sistema telefónico, el único propósito de un registro UDDI es permitir que los proveedores registren sus servicios y que los solicitantes encuentren servicios. Una vez que un solicitante encuentra un servicio, el registro ya no tiene ningún papel que desempeñar entre el solicitante y el proveedor.

La figura 2.2 muestra cómo UDDI permite la descripción dinámica, el descubrimiento y la integración de servicios web. Un proveedor de servicios web registra sus servicios con el registro UDDI. Un solicitante de servicios web busca los servicios requeridos en el registro UDDI y, cuando encuentra un servicio, el solicitante se vincula directamente con el proveedor para usar el servicio.

Figura 2.2. Rol de un Registry en un Servicio Web



La especificación UDDI define un esquema XML para mensajes SOAP y API para aplicaciones que desean usar el registro. Un proveedor que registre un servicio web con UDDI debe proporcionar información comercial, de servicio, vinculante y técnica sobre el servicio. Esta información se almacena en un formato común que consta de tres partes:

Páginas blancas : describen información comercial general, como nombre, descripción, números de teléfono, etc.

Páginas amarillas : describen el negocio en términos de taxonomías estándar. Esta información debe seguir las categorizaciones industriales estándar para que los servicios puedan ubicarse por industria, categoría o ubicación geográfica.

Páginas verdes : enumeran el servicio, la vinculación y la información técnica específica del servicio

La especificación UDDI incluye dos categorías de API para acceder a los servicios UDDI desde las aplicaciones:

API de consulta : habilite la búsqueda y exploración de información de registro

API de editores : permite que las aplicaciones registren servicios en el registro

Las API de UDDI se comportan de manera síncrona. Además, para garantizar que un proveedor o solicitante de servicios web pueda usar el registro, UDDI usa SOAP como protocolo base. Tenga en cuenta que UDDI es una especificación para un registro, no un repositorio. Como registro, funciona como un catálogo, lo que permite a los solicitantes encontrar los servicios disponibles. Un registro no es un repositorio porque no contiene los servicios en sí.

2.1.4. Lenguaje de descripción de servicios web
El lenguaje de descripción de servicios web (WSDL) define una forma estándar de especificar los detalles de un servicio web. Es un esquema XML de propósito general que se puede usar para especificar detalles de interfaces de servicios web, enlaces y otros detalles de implementación. Al tener una forma estándar de especificar los detalles de un servicio, los clientes que no tienen conocimiento previo del servicio aún pueden usar ese servicio web.

WSDL especifica una gramática que describe los servicios web como una colección de puntos finales de comunicación, llamados puertos. Los datos que se intercambian se especifican como parte de los mensajes. Todo tipo de acción permitida en un punto final se considera una operación. Las colecciones de operaciones posibles en un punto final se agrupan en tipos de puerto. Los mensajes, las operaciones y los tipos de puerto son definiciones abstractas, lo que significa que las definiciones no contienen detalles específicos de la implementación para permitir su reutilización.

Las especificaciones de protocolo y formato de datos para un tipo de puerto en particular se especifican como un enlace. Un puerto se define asociando una dirección de red con un enlace reutilizable y una colección de puertos define un servicio. Además, WSDL especifica un mecanismo de vinculación común para reunir todos los formatos de datos y protocolos con un mensaje, una operación o un punto final abstractos. Consulte la Figura 2.3 .

Figura 2.3. Descripción del servicio WSDL



El ejemplo de código 2.6 muestra un documento WSDL para un servicio web meteorológico que devuelve la información meteorológica de una ciudad determinada. El servicio web, que utiliza SOAP como protocolo de comunicación, espera recibir el nombre de la ciudad como datos de tipo String y envía datos de tipo String como respuesta.

Ejemplo de código 2.6. Documento WSDL para servicio web meteorológico
<?versión xml="1.0" codificación="UTF-8"?>
<definiciones nombre="WeatherWebService"
         targetNamespace="urna:WeatherWebService"
         xmlns:tns="urna:WeatherWebService"
         xmlns="http://esquemas.xmlsoap.org/wsdl/"
         xmlns:xsd="http://www.w3.org/2001/XMLSchema"
         xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <tipos/>
   <mensaje nombre="WeatherService_getWeather">
      <parte nombre="Cadena_1" tipo="xsd:cadena"/>
   </mensaje>
   <mensaje nombre="WeatherService_getWeatherResponse">
      <parte nombre="resultado" tipo="xsd:cadena"/>
   </mensaje>
   <portType name="Servicio Meteorológico">
      <operación nombre="getWeather" parámetroOrder="String_1">
         <mensaje de entrada="tns:WeatherService_getWeather"/>
         <salida
            mensaje="tns:WeatherService_getWeatherResponse"/>
      </operación>
   </tipo de puerto>
   <binding name="WeatherServiceBinding"
                            type="tns:Servicio Meteorológico">
      <operación nombre="getWeather">
         <entrada>
            <jabón:uso corporal="literal"
               namespace="urna:WeatherWebService"/>
         </entrada>
         <salida>
            <jabón:uso corporal="literal"
               namespace="urna:WeatherWebService"/>
         </salida>
         <soap:operación soapAction=""/></operación>
      <jabón: vinculante
             transporte="http://schemas.xmlsoap.org/soap/http"
             estilo="rpc"/>
   </enlace>
   <nombre del servicio="WeatherWebService">
      <port name="PuertoServicioMeteorológico"
                        vinculante="tns:WeatherServiceBinding">
         <soap:dirección
            location="http://mycompany.com/weatherservice"/>
      </puerto>
   </servicio>
</definiciones>

Un documento WSDL completo consta de un conjunto de definiciones que comienzan con un elemento de definiciones raíz seguido de seis definiciones de elementos individuales ( tipos , mensaje , tipo de puerto , enlace , puerto y servicio ) que describen los servicios.

El elemento de tipos define los tipos de datos contenidos en los mensajes intercambiados como parte del servicio. Los tipos de datos pueden ser tipos simples, complejos, derivados o de matriz. Los tipos, ya sean definiciones de esquema o referencias, a los que se hace referencia en el elemento de mensaje de un documento WSDL se definen en el elemento de tipo del documento WSDL.

El elemento de mensaje define los mensajes que intercambia el servicio web. Un documento WSDL tiene un elemento de mensaje para cada mensaje que se intercambia y el elemento de mensaje contiene los tipos de datos asociados con el mensaje.

El elemento portType especifica, de forma abstracta, operaciones y mensajes que forman parte del servicio web. Un documento WSDL tiene una o más definiciones de tipo de puerto para cada servicio web que define.

El elemento de enlace vincula el tipo de puerto abstracto y sus mensajes y operaciones a un protocolo de transporte ya formatos de mensaje.

Los elementos de servicio y puerto juntos definen el nombre del servicio web y, al proporcionar una dirección única para el enlace, asignan un punto final individual para el servicio. Un puerto solo puede tener una dirección. El elemento de servicio agrupa los puertos relacionados y, a través de su atributo de nombre , proporciona un nombre lógico para el servicio.

Esta descripción es para un documento WSDL simple. Cada definición de elemento tiene varios atributos y WSDL tiene características adicionales, como el manejo de fallas. WSDL también especifica cómo enlazar directamente con HTTP/MIME, SMTP/MIME, etc., pero estos están más allá del alcance de la discusión actual. Para obtener más detalles, consulte la especificación WSDL disponible en http://www.w3c.org/TR/wsdl .

2.1.5. Estándares emergentes
Hasta ahora hemos examinado los estándares existentes, que satisfacen las necesidades de los servicios web simples. Se han formado organizaciones que cruzan varias industrias para crear y promover estándares multiplataforma. La Organización de Interoperabilidad de Servicios Web (WS-I) es uno de esos grupos. WS-I ha publicado un perfil básico de WS-I que define un conjunto de estándares multiplataforma, como los que acabamos de examinar, para promover y garantizar la interoperabilidad. Pero se requieren otros estándares para abordar los problemas de los servicios web que manejan procesos comerciales complejos. Estos problemas incluyen estrictos requisitos de seguridad, procesos comerciales que interactúan con otros procesos comerciales y tienen transacciones de larga duración o transacciones que abarcan múltiples procesos comerciales, o procesos comerciales anidados dentro de otros procesos. Estos procesos comerciales también deben ejecutarse correctamente incluso cuando se ejecutan en diferentes plataformas. Varios organismos y organizaciones de estándares, como WS-I, están trabajando actualmente en estos estándares. Dado que estos estándares aún se están definiendo y aún no está claro qué estándares se aceptarán como universales, no entraremos en los detalles de los estándares emergentes.

Ahora que hemos examinado los estándares de servicios web, veamos cómo J2EE admite estos estándares aceptados.


