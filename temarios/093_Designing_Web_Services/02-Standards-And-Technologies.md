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

* ***Common service specification formats***(Formatos de especificación de servicios comunes): además de los formatos de mensajes comunes y el lenguaje de marcado, debe haber un formato común que todos los proveedores de servicios puedan usar para especificar los detalles del servicio, como el tipo de servicio, cómo acceder al servicio, etc. Un mecanismo estándar para especificar los detalles del servicio permite a los proveedores especificar sus servicios para que cualquier solicitante pueda entenderlos y usarlos. Por ejemplo, el **Web Services Description Language (WSDL)** proporciona Web services con formatos de especificación comunes.

* ***Common means(medios comunes) para la búsqueda de servicios***: De la misma manera que los proveedores necesitan una forma común de especificar los detalles del servicio, los solicitantes de servicios deben tener una forma común de buscar y obtener detalles de un servicio. Esto se logra teniendo lugares comunes y bien conocidos donde los proveedores pueden registrar las especificaciones de sus servicios y donde los solicitantes saben dónde ir para encontrar los servicios. Al tener estas ubicaciones comunes y conocidas y una forma estándar de acceder a ellas, todos los proveedores y solicitantes pueden acceder universalmente a los servicios. La especificación **Universal Description, Discovery and Integration (UDDI)** define un medio común para buscar servicios web.

Aunque no analizan exhaustivamente estos estándares básicos, las siguientes secciones brindan suficiente información sobre los estándares para permitir una mayor discusión sobre las tecnologías J2EE que los implementan. Para obtener detalles completos, consulte la sección de referencia al final de este capítulo. Además de estos estándares básicos, los Web services más complejos que implementan procesos de nivel empresarial necesitan ***estándares de seguridad, transacciones, control de flujo de procesos***, etc.


### 2.1.1.Extensible Markup Language

El **eXtensible Markup Language - Lenguaje de Marcado Extensible (XML)**, un estándar aceptado en toda la industria, permite que los proveedores de servicios y los solicitantes se comuniquen entre sí en un idioma común. **XML** no depende de una plataforma o tecnología propietaria, y los mensajes en XML se pueden comunicar a través de Internet utilizando protocolos estándar de Internet, como **HTTP**. Debido a que **XML** es un producto del cuerpo del **World Wide Web Consortium (W3C)**, todos los actores principales admitirán los cambios que se realicen en él. Esto garantiza que, a medida que evoluciona **XML**, los Web services también pueden evolucionar sin problemas de compatibilidad con versiones anteriores.

***XML es un lenguaje de marcado simple, flexible y basado en texto. Los datos XML se marcan mediante etiquetas encerradas entre corchetes angulares. Las etiquetas contienen el significado de los datos que marcan***. Dicho marcado permite que diferentes sistemas intercambien datos fácilmente entre sí. Esto difiere del uso de etiquetas en **HTML**, que está orientado a mostrar datos. A diferencia de **HTML**, la visualización no es inherente a **XML**. El ejemplo de código 2.1 muestra el código de un documento **XML** que representa la información de contacto de una persona.

**Ejemplo de código 2.1. Ejemplo de Documento XML**

```xml
<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>
<ContactInformation>
    <Name>John Doe</Name>
    <Address>
        <Street>4140 Network Circle</Street>
        <City>Santa Clara</City>
        <State>California</State>
        <Country>USA</Country>
    </Address>
    <HomePhone>123-456-7890</HomePhone>
    <EMail>j2eeblueprints@sun.com</EMail>
</ContactInformation>
```

Una **Document Type Definition (DTD)** o **XML Schema Definition (XSD)** describe la estructura de un documento **XML**. ***Tiene información sobre las etiquetas que puede tener el documento XML correspondiente, el orden de esas etiquetas, etc***. Un documento **XML** se puede validar contra su **DTD** o su **XSD**. ***La validación de un documento XML garantiza que el documento sigue la estructura definida en su DTD o XSD y que no tiene etiquetas XML no válidas***. Por lo tanto, los sistemas que intercambian documentos **XML** para algún propósito pueden acordar una sola **DTD** o **XSD** y validar todos los documentos **XML** recibidos para ese propósito contra la **DTD/XSD** acordada antes de procesar el documento. El ejemplo de código 2.2 es la **DTD** para el documento **XML** en el ejemplo de código 2.1 .

**Ejemplo de código 2.2. Document Type Definition**

```dtd
<!ELEMENT ContactInformation (Name, Address, HomePhone, EMail)>
<!ELEMENT Name (#PCDATA)>
<!ELEMENT Address (Street, City, State, Country)>
<!ELEMENT Street (#PCDATA)>
<!ELEMENT City (#PCDATA)>
<!ELEMENT State (#PCDATA)>
<!ELEMENT Country (#PCDATA)>
<!ELEMENT HomePhone (#PCDATA)>
<!ELEMENT EMail (#PCDATA)>
```

Desafortunadamente, ***las DTD son una forma inadecuada de definir formatos de documentos XML***. Por ejemplo, las **DTD** no brindan ninguna facilidad real para expresar tipos de datos o relaciones estructurales complejas. Las definiciones de **XML schema** estandarizan las definiciones de formato de los documentos **XML**. El ejemplo de código 2.4 muestra el **XSD schema** para el documento **XML** de muestra en el ejemplo de código 2.3.

**Ejemplo de código 2.3. Documento XML**

```xml
<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>
<ContactInformation
       xmlns="http://simple.example.com/CInfoXmlDoc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation=
          "http://simple.example.com/CInfoXmlDoc
						file:./CInfoXmlDoc.xsd">
    <Name>John doe</Name>
    <Address>
        <Street>4140 Network Circle</Street>
        <City>Santa Clara</City>
        <State>California</State>
        <Country>USA</Country>
    </Address>
    <HomePhone>123-456-7890</HomePhone>
    <EMail>j2eeblueprints@sun.com</EMail>
</ContactInformation>
```

**Ejemplo de código 2.4. XSD Schema**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   targetNamespace="http://simple.example.com/CInfoXmlDoc"
   xmlns=" http://simple.example.com/CInfoXmlDoc"
   elementFormDefault="qualified">
   <xsd:element name="ContactInformation">
      <xsd:complexType>
         <xsd:sequence>
             <xsd:element name="Name" type="xsd:string" />
             <xsd:element name="Address">
                <xsd:complexType>
                    <xsd:sequence>
                       <xsd:element name="Street"
                                 type="xsd:string" />
                       <xsd:element name="City"
                                 type="xsd:string" />
                       <xsd:element name="State"
                                 type="xsd:string" />
                       <xsd:element name="Country"
                                 type="xsd:string" />
                     </xsd:sequence>
                 </xsd:complexType>
              </xsd:element>
              <xsd:element name="HomePhone" type="xsd:string" />
              <xsd:element name="EMail" type="xsd:string" />
          </xsd:sequence>
       </xsd:complexType>
   </xsd:element>
</xsd:schema>
```

Al considerar **XML schemas**, es importante comprender el concepto de **XML namespaces**. Para habilitar el uso del mismo nombre con diferentes significados en diferentes contextos, los **XML schemas** pueden definir un **namespaces**. *Un **namespaces** es un conjunto de nombres únicos que se definen para un contexto particular y que se ajustan a reglas específicas para el **namespaces***. Dado que un **namespaces** es específico de un contexto particular, cada **namespaces** no está relacionado con ningún otro **namespaces**. Por lo tanto, el mismo nombre se puede usar en diferentes **namespaces** sin causar un conflicto de nombres duplicados. Los documentos XML, que se ajustan a un esquema XML y tienen múltiples elementos y atributos, a menudo se basan en **namespaces** para evitar una colisión en los tag o nombres de atributos o para poder usar el mismo tag o nombres de atributos en diferentes contextos.

Técnicamente hablando, un **XML namespace** define una colección de nombres y se identifica mediante una referencia URI. (Observe en el Ejemplo de código 2.4 el código **`xmlns="http://simple.example.com/CInfoXmlDoc"`**. Un código como este indica que el **XML schema** define un **namespace** para los diversos elementos y atributos del documento). **Names** y el **namespace** se puede utilizar como tipos de elementos o atributos en un documento XML. La combinación de URI y tipo de elemento o nombre de atributo comprende un nombre universal único que evita colisiones.

Por ejemplo, en el Ejemplo de código 2.4 , hay un **namespace** que define los tipos de elementos del documento **`ContactInformation`**, como  **`Name`** y **`Address`**. Estos tipos de elementos son únicos dentro del contexto de la información de contacto. Si el documento incluyera otro contexto de espacio de nombres, como **`BankInformation`** que definiera sus propios tipos de elementos de **`Name`** y **`Address`**, estos dos ***namespaces*** serían separados y distintos. Es decir, un **`Name`** y **`Address`** usados en el contexto de información bancaria no entrarían en conflicto con un **`Name`** y **`Address`** usados en el contexto de información de contacto .

### 2.1.2. Simple Object Access Protocol (SOAP)

***XML resuelve la necesidad de un lenguaje común, y el Simple Object Access Protocol (SOAP) satisface la necesidad de un formato de mensajería común***. ***SOAP permite que objetos desconocidos entre sí se comuniquen; es decir, para intercambiar mensajes. SOAP***, un protocolo de conexión similar a **Internet Inter-ORB Protocol (IIOP)** y **Java Remote Method Protocol (JRMP)**, ***es un protocolo basado en texto que utiliza un formato de codificación de datos basado en XML y HTTP/SMTP para transportar mensajes***. SOAP es independiente tanto del lenguaje de programación como de la plataforma operativa, y no requiere ninguna tecnología específica en sus terminales, lo que lo hace completamente independiente de los proveedores, las plataformas y las tecnologías. Su formato de texto también convierte a SOAP en un protocolo compatible con cortafuegos. Además, SOAP cuenta con el respaldo de los principales actores industriales y se puede esperar que tenga soporte universal.

Para habilitar los intercambios de mensajes, SOAP define un **envelope(sobre)**, que contiene un **body(cuerpo) SOAP**, dentro del cual se incluye el **message(mensaje)**, y un header opcional específico de SOAP. ***Todo el envelope (body más header) es un documento XML completo****. (Consulte la Figura 2.1 ).

**Figura 2.1. Estructura del SOAP Message**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/58d580dc-d034-4378-9e0f-44b7afb591cd)

Las entradas del header pueden contener información útil para los destinatarios, y estas entradas del header también pueden ser útiles para los procesadores intermedios, ya que habilitan funciones avanzadas. El body, que contiene el contenido del message, es consumido por el destinatario. SOAP es independiente del contenido del message; ***la única restricción es que el message esté en formato XML***.

El ejemplo de código 2.5 muestra un ejemplo simple pero completo de una solicitud SOAP para obtener una cotización de acciones.

**Ejemplo de código 2.5. Ejemplo de SOAP Request**

```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="SoapEnvelopeURI"
       SOAP-ENV:encodingStyle="SoapEncodingURI">
    <SOAP-ENV:Header>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
        <m:GetLastTradePrice xmlns:m="ServiceURI">
            <tickerSymbol>SUNW</tickerSymbol>
        </m:GetLastTradePrice>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

Este ejemplo muestra cómo se codifica un mensaje SOAP utilizando XML e ilustra algunos elementos y atributos SOAP. Todos los mensajes SOAP deben tener un elemento **`Envelope`** y deben definir dos namespaces: Un namespace connota el **SOAP envelope (`xmlns:SOAP-ENV`)** y el otro indica la codificación **SOAP encoding (`SOAP-ENV:encodingStyle`)**. Los SOAP messages sin la especificación adecuada del namespace se consideran messages no válidos. El atributo **`encodingStyle`** es importante, ya que se usa para especificar reglas de serialización para el SOAP message. Además, no puede haber referencias de DTD desde dentro de los SOAP message.

Si bien es opcional el elemento **`Header`**, cuando se usa, debe ser el first child inmediato después del **`Envelope`**. El elemento **`Header`** proporciona una forma de extender el mensaje SOAP al especificar información adicional, como autenticación y transacciones. Especificar esta información adicional como parte del **`Header`** le dice al destinatario del mensaje cómo manejar el mensaje.

Hay muchos atributos que se pueden usar en el elemento **`Header`** de SOAP. Por ejemplo, el atributo **`actor`** del elemento **`Header`** permite que un SOAP message pase a través de procesos intermedios en ruta hacia su destino final. Cuando el atributo **`actor`** está ausente, el destinatario es el destino final del SOAP message. De manera similar, se pueden usar muchos otros atributos. Sin embargo, este capítulo no aborda estos detalles.

El elemento **`Body`**, que debe estar presente en todos los SOAP messages, debe seguir inmediatamente después del elemento **`Header`**, si está presente. De lo contrario, el elemento **`Body`** debe seguir inmediatamente después del inicio del elemento **`Envelope`**. El **`Body`** contiene la especificación del actual request(como las llamadas a métodos). El elemento **`Fault`** en SOAP **`Body`** permite el manejo de errores para solicitudes de mensajes.

Tenga en cuenta que este capítulo no analiza los detalles de los elementos **`Header`**, los atributos y otras funciones adicionales, como SOAP con archivos adjuntos y enlace HTTP, aunque forman parte del estándar SOAP. Los lectores interesados deben consultar las especificaciones de SOAP.

### 2.1.3. Registry Standards- Normas de registro

La especificación **Universal Description, Discovery, and Integration (UDDI)** define una forma estándar para registrar, cancelar el registro y buscar Web services. ***UDDI** es una especificación basada en estándares para el registro, la descripción y el descubrimiento de Web services*. Al igual que las páginas amarillas de un sistema telefónico, el único propósito de un registro **UDDI** es permitir que los proveedores registren sus servicios y que los solicitantes encuentren servicios. Una vez que un solicitante encuentra un servicio, el registro ya no tiene ningún papel que desempeñar entre el solicitante y el proveedor.

La figura 2.2 muestra cómo **UDDI** permite la descripción dinámica, el descubrimiento y la integración de Web services. Un proveedor de Web services registra sus servicios con el registro **UDDI**. Un solicitante de Web services busca los servicios requeridos en el registro **UDDI** y, cuando encuentra un servicio, el solicitante se vincula directamente con el proveedor para usar el servicio.

**Figura 2.2. Rol de un Registry en un Servicio Web**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/02f65543-0518-4213-8947-80a1a9f81db1)

La especificación **UDDI** define un **XML schema** para SOAP messages y APIs para aplicaciones que desean usar el registro. Un proveedor que registre un Web service con **UDDI** debe proporcionar información comercial, de servicio, vinculante(binding) y técnica sobre el servicio. Esta información se almacena en un formato común que consta de tres partes:

1. ***White pages***: Describen información comercial general, como nombre, descripción, números de teléfono, etc.

* ***Yellow pages***: Describen el negocio en términos de taxonomías estándar. Esta información debe seguir las categorizaciones industriales estándar para que los servicios puedan ubicarse por industria, categoría o ubicación geográfica.

* ***Green pages***: Enumeran el servicio, la vinculación y la información técnica específica del servicio

La especificación **UDDI** incluye dos categorías de API para acceder a los servicios **UDDI** desde las aplicaciones:

1. ***Inquiry APIs***: Habilite la búsqueda y exploración de información de registro

2. ***Publishers APIs***: Permite que las aplicaciones registren servicios en el registro

Las API de **UDDI** se comportan de manera síncrona. Además, para garantizar que un proveedor o solicitante de Web service pueda usar el registro, **UDDI** usa **SOAP** como protocolo base. Tenga en cuenta que **UDDI** es una especificación para un registro, no un repositorio. Como registro, funciona como un catálogo, lo que permite a los solicitantes encontrar los servicios disponibles. *Un registro no es un repositorio porque no contiene los servicios en sí*.

### 2.1.4. Web Services Description Language

El **Web Services Description Language(WSDL)** define una forma estándar de especificar los detalles de un Web service. Es un **XML schema** de propósito general que se puede usar para especificar detalles de interfaces de Web service, enlaces y otros detalles de implementación. Al tener una forma estándar de especificar los detalles de un servicio, los clientes que no tienen conocimiento previo del servicio aún pueden usar ese Web service.

**WSDL** especifica una gramática que describe los Web service como una colección de puntos finales de comunicación, llamados *ports(puertos)*. Los datos que se intercambian se especifican como parte de los mensajes. Todo tipo de acción permitida en un endpoint se considera una operación. Las colecciones de operaciones posibles en un endpoint se agrupan en tipos de puerto. Los mensajes, las operaciones y los tipos de puerto son definiciones abstractas, lo que significa que las definiciones no contienen detalles específicos de la implementación para permitir su reutilización.

Las especificaciones de protocolo y formato de datos para un tipo de puerto en particular se especifican como un enlace. Un puerto se define asociando una dirección de red con un enlace reutilizable y una colección de puertos define un servicio. Además, **WSDL** especifica un mecanismo de vinculación común para reunir todos los formatos de datos y protocolos con un mensaje, una operación o un punto final abstractos. Consulte la Figura 2.3 .

**Figura 2.3. Descripción del servicio WSDL**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/644ea4e2-0851-43fe-b364-9c64820c67bf)

El ejemplo de código 2.6 muestra un documento **WSDL** para un Web service meteorológico que devuelve la información meteorológica de una ciudad determinada. El Web service, que utiliza **SOAP** como protocolo de comunicación, espera recibir el nombre de la ciudad como datos de tipo **`String`** y envía datos de tipo **`String`** como respuesta.

**Ejemplo de código 2.6. Documento WSDL para Weather Web Service**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions name="WeatherWebService"
         targetNamespace="urn:WeatherWebService"
         xmlns:tns="urn:WeatherWebService"
         xmlns="http://schemas.xmlsoap.org/wsdl/"
         xmlns:xsd="http://www.w3.org/2001/XMLSchema"
         xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <types/>
   <message name="WeatherService_getWeather">
      <part name="String_1" type="xsd:string"/>
   </message>
   <message name="WeatherService_getWeatherResponse">
      <part name="result" type="xsd:string"/>
   </message>
   <portType name="WeatherService">
      <operation name="getWeather" parameterOrder="String_1">
         <input message="tns:WeatherService_getWeather"/>
         <output
            message="tns:WeatherService_getWeatherResponse"/>
      </operation>
   </portType>
   <binding name="WeatherServiceBinding"
                            type="tns:WeatherService">
      <operation name="getWeather">
         <input>
            <soap:body use="literal"
               namespace="urn:WeatherWebService"/>
         </input>
         <output>
            <soap:body use="literal"
               namespace="urn:WeatherWebService"/>
         </output>
         <soap:operation soapAction=""/></operation>
      <soap:binding
             transport="http://schemas.xmlsoap.org/soap/http"
             style="rpc"/>
   </binding>
   <service name="WeatherWebService">
      <port name="WeatherServicePort"
                        binding="tns:WeatherServiceBinding">
         <soap:address
            location="http://mycompany.com/weatherservice"/>
      </port>
   </service>
</definitions>
```

Un documento **WSDL** completo consta de un conjunto de definiciones que comienzan con un elemento raíz **`definitions`** seguido de seis definiciones de elementos individuales **`types`**, **`message`**, **`portType`**,**`binding`**, **`port`** y **`service`** que describen los servicios.

* El elemento **`types`** define los tipos de datos contenidos en los mensajes intercambiados como parte del servicio. Los tipos de datos pueden ser tipos simples, complejos, derivados o array. Los tipos, ya sean definiciones de esquema o referencias, a los que se hace referencia en el elemento de mensaje de un documento **WSDL** se definen en el elemento de tipo del documento **WSDL**.

* El elemento **`message`** define los mensajes que intercambia el Web service. Un documento **WSDL** tiene un elemento **`message`** para cada mensaje que se intercambia y el elemento **`message`** contiene los tipos de datos asociados con el mensaje.

* El elemento **`portType`** especifica, de forma abstracta, operaciones y mensajes que forman parte del Web Service. Un documento WSDL tiene una o más definiciones **`portType`** para cada Web Service que define.

* El elemento **`binding`** vincula el tipo de puerto abstracto(abstract port type) y sus mensajes y operaciones, a un protocolo de transporte y a formatos de mensaje.

* Los elementos **`service`** y **`port`** juntos definen el nombre del Web service y, al proporcionar una dirección única para el binding(enlace), asignan un punto final individual para el servicio. Un puerto solo puede tener una dirección. El elemento **`service`** agrupa los puertos relacionados y, a través de su atributo **`name`**, proporciona un nombre lógico para el servicio.

Esta descripción es para un documento **WSDL** simple. Cada definición de elemento tiene varios atributos y **WSDL** tiene características adicionales, como el manejo de fallas. **WSDL** también especifica cómo enlazar directamente con **HTTP/MIME**, **SMTP/MIME**, etc., pero estos están más allá del alcance de la discusión actual. Para obtener más detalles, consulte la especificación WSDL disponible en http://www.w3c.org/TR/wsdl .

### 2.1.5. Estándares emergentes

Hasta ahora hemos examinado los estándares existentes, que satisfacen las necesidades de los Web services simples. Se han formado organizaciones que cruzan varias industrias para crear y promover estándares multiplataforma. La **Web Services Interoperability Organization (WS-I)** es uno de esos grupos. **WS-I** ha publicado un perfil básico de **WS-I** que define un conjunto de estándares multiplataforma, como los que acabamos de examinar, para promover y garantizar la interoperabilidad. Pero se requieren otros estándares para abordar los problemas de losWeb Services que manejan procesos comerciales complejos. Estos problemas incluyen estrictos requisitos de seguridad, procesos comerciales que interactúan con otros procesos comerciales y tienen transacciones de larga duración o transacciones que abarcan múltiples procesos comerciales, o procesos comerciales anidados dentro de otros procesos. Estos procesos comerciales también deben ejecutarse correctamente incluso cuando se ejecutan en diferentes plataformas. Varios organismos y organizaciones de estándares, como **WS-I**, están trabajando actualmente en estos estándares. Dado que estos estándares aún se están definiendo y aún no está claro qué estándares se aceptarán como universales, no entraremos en los detalles de los estándares emergentes.

Ahora que hemos examinado los estándares de Web services, veamos cómo J2EE admite estos estándares aceptados.

## 2.2. J2EE: la Plataforma Integrada para Web Services

A partir de la plataforma J2EE 1.4, con su enfoque principal en los Web services, las tecnologías **Java-XML** existentes se integran en una plataforma consolidada de forma estándar, lo que permite que las aplicaciones se expongan como Web services a través de una interfaz **SOAP/HTTP**. Las siguientes secciones describen brevemente las ***adiciones Web service-specific en la plataforma J2EE 1.4.*** ( El Capítulo 1 incluye una descripción general de la plataforma J2EE 1.4. Consulte la especificación J2EE 1.4 que se enumera en “References and Resources” en la página xx para obtener información completa sobre la plataforma).

Esta sección pretende brindarle una descripción general de las diversas adiciones Web service-specific en la plataforma J2EE. Los próximos tres capítulos cubren cómo usar estas tecnologías en detalle.

### 2.2.1.  Java APIs para XML Processing

**JavaTM APIs for XML Processing (JAXP)** es un conjunto independiente de proveedores de APIs ligeras para analizar o procesar documentos **XML**. Debido a que **XML** es el lenguaje común que permite los Web services, un **XML parser** es necesario para procesar los mensajes (los documentos XML) intercambiados entre los Web services. La Figura 2.4 muestra cómo la **API JAXP** abstrae las implementaciones del parser(analizador) de la aplicación del usuario.

**Figura 2.4. Uso de JAXP para Abstract Parser Implementations desde User Application**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/40998bac-ee11-4e43-ad3f-6833a754bd1d)

***Tenga en cuenta que la API JAXP no es nueva en la plataforma J2EE 1.4. Ha sido parte de las versiones anteriores de las plataformas J2EE y Java TM 2 Standard Edition (J2SE TM). En la implementación de la plataforma J2EE 1.4, JAXP ha agregado soporte para esquemas XML***.

Aunque tiene su propia implementación de referencia, **JAXP** permite que se conecten parsers que cumplen con la **especificación JAXP** de otros proveedores. **JAXP** vuelve a analizar un documento XML usando su propia implementación si no se proporciona otra implementación. **JAXP** procesa documentos **XML** utilizando los modelos **SAX** o **DOM**, y permite el uso de motores **XSLT** durante el procesamiento de documentos. (**XSLT**, que significa **eXtensible Stylesheet Language Transformation**, ***se utiliza para transformar documentos XML de un formato a otro***).

Las principales **JAXP APIs** están disponibles a través del paquete **`javax.xml.parsers`**, que ***proporciona dos factory interfaces*** independientes del proveedor: ***una interfaz para procesamiento SAX y otra para procesamiento DOM***. Estas factory interfaces permiten el uso de otras implementaciones JAXP.

La Figura 2.5 muestra cómo funcionan los ***analizadores(parsers) SAX y DOM***. ***SAX procesa documentos en serie, convirtiendo los elementos de un documento XML en una serie de eventos***. Cada elemento en particular genera un evento, con eventos únicos que representan varias partes del documento. Los controladores de eventos proporcionados por el usuario manejan los eventos y toman las medidas adecuadas. El procesamiento de SAX es rápido debido a su acceso en serie y a los pequeños requisitos de almacenamiento de memoria. El ejemplo de código 2.7 muestra cómo usar las **API de JAXP y SAX** para procesar un **documento XML**.

**Ejemplo de código 2.7. Uso de SAX para procesar un documento XML**

```java
public class AnAppThatUsesSAXForXMLProcessing
       extends DefaultHandler {

   public void someMethodWhichReadsXMLDocument() {

      // Get a SAX PArser Factory and set validation to true
      SAXParserFactory spf = SAXParserFactory.newInstance();
      spf.setValidating(true);

      // Create a JAXP SAXParser
      SAXParser saxParser = spf.newSAXParser();

      // Get the encapsulated SAX XMLReader
      xmlReader = saxParser.getXMLReader();

      // Set the ContentHandler of the XMLReader
      xmlReader.setContentHandler(this);

      // Tell the XMLReader to parse the XML document
      xmlReader.parse(XMLDocumentName);
   }
}
```

**Figura 2.5. SAX- y DOM-Based XML Parser APIs**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/294830d4-8d45-4ded-99f6-ddb1fd6fdb06)

***El procesamiento DOM crea un árbol a partir de los elementos del documento XML***. Aunque esto requiere más memoria (para almacenar el árbol), esta función permite el acceso aleatorio al contenido del documento y permite dividir los documentos en fragmentos, lo que facilita el procesamiento del código DOM. ***DOM facilita las creaciones, los cambios o las adiciones a los documentos XML entrantes***. El ejemplo de código 2.8 muestra cómo utilizar las **JAXP APIs** y **DOM** para procesar un documento XML.

**Ejemplo de código 2.8. Uso de DOM para Procesar un Documento XML**

```java
public class AnAppThatUsesDOMForXMLProcessing {

   public void someMethodWhichReadsXMLDocument() {

      // Step 1: create a DocumentBuilderFactory
      DocumentBuilderFactory dbf =
                DocumentBuilderFactory.newInstance();
      dbf.setValidating(true);
      // Step 2: create a DocumentBuilder that satisfies
      // the constraints specified by the DocumentBuilderFactory
      db = dbf.newDocumentBuilder();

      // Step 3: parse the input file
      Document doc = db.parse(XMLDocumentFile);

      // Parse the tree created - node by node
   }
}
```

### 2.2.2. JavaTM API para XML-Based RPC

**JavaTM API for XML-based RPC (JAX-RPC)** admite **XML-based RPC for Java and J2EE platforms**. Habilita un mecanismo tradicional **client-server remote procedure call (RPC)** mediante un protocolo basado en XML. **JAX-RPC** permite a los desarrolladores de tecnología Java desarrollar Web services interoperables y portátiles basados en **SOAP**. Los desarrolladores utilizan el modelo de programación **JAX-RPC** para desarrollar puntos finales de Web services basados en **SOAP**, junto con sus correspondientes descripciones **WSDL** y clientes. Una implementación de  Web services basada en **JAX-RPC** puede interactuar con clientes que no están basados en Java. De manera similar, un cliente basado en **JAX-RPC** puede interactuar con una implementación de Web services no basada en Java.

Para escenarios típicos de Web services, el uso de **JAX-RPC** reduce la complejidad para los desarrolladores al:

* Estandarización de la creación de solicitudes y respuestas SOAP
* Estandarización de clasificación y desclasificación de parámetros y otros detalles específicos de implementación y tiempo de ejecución
* Eliminar estas tareas de creación y clasificación/desclasificación de SOAP de las responsabilidades de un desarrollador al proporcionar estas funciones en una biblioteca o una herramienta
* Brindar soporte estandarizado para diferentes escenarios de mapeo, incluidos ***XML a Java***, ***Java a XML***, ***WSDL a Java*** y mapeos de ***Java a WSDL***.

**JAX-RPC** también define asignaciones estándar entre **WSDL/XML** y **Java**, lo que le permite admitir un conjunto de tipos enriquecido. Sin embargo, los desarrolladores pueden usar tipos que no tienen asignaciones de tipo estándar. **JAX-RPC** define un conjunto de API para un framework de mapeo de tipos extensible que los desarrolladores pueden usar para tipos sin mapeos de tipos estándar. Con estas API, es posible desarrollar e implementar serializadores y deserializadores conectables para un mapeo extensible. La figura 2.6 muestra la arquitectura de alto nivel de la implementación de **JAX-RPC**.

**Figura 2.6. Arquitectura JAX-RPC**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/e828d823-46d5-4473-bb18-6795cc4a228a)

Una aplicación cliente puede realizar una solicitud a un Web services de una de tres maneras. El Capítulo 5 contiene descripciones detalladas de estos enfoques de acceso de clientes.

1. ***Invocación de métodos en stubs generados***: Según el contenido de una descripción **WSDL** de un servicio, se pueden usar herramientas para generar stubs. Estos stubs generados se configuran con toda la información necesaria sobre el Web service y su punto final. La aplicación cliente utiliza los stubs (apéndices) para invocar los métodos remotos disponibles en el extremo del Web services.

2. ***Uso de un proxy dinámico***: Un proxy dinámico soporta un Web service endpoint. Cuando se usa este modo, no hay necesidad de crear endpoint-specific stubs para el cliente.

3. ***Uso de una dynamic invocation interface (DII)***: En este modo, se accede dinámicamente a las operaciones en los endpoints del servicio de destino en función de un modelo en memoria de la descripción **WSDL** del servicio.

Independientemente del modo que se utilice, la solicitud de la aplicación cliente pasa por el tiempo de ejecución **JAX-RPC** del lado del cliente. El tiempo de ejecución asigna los tipos Java de la solicitud a XML y forma un mensaje SOAP correspondiente para la solicitud. Luego envía el mensaje SOAP a través de la red al servidor.

En el lado del servidor, el tiempo de ejecución **JAX-RPC** recibe el mensaje **SOAP** para la solicitud. El tiempo de ejecución del lado del servidor aplica las asignaciones de XML a Java, luego asigna la solicitud a la llamada de método Java correspondiente, junto con sus parámetros.

Tenga en cuenta que un cliente de un servicio **JAX-RPC** puede ser un cliente que no sea Java. Además, **JAX-RPC** puede interoperar con cualquier Web service, ya sea que ese servicio esté basado en **JAX-RPC** o no. También tenga en cuenta que los desarrolladores solo necesitan tratar con **JAX-RPC APIs**; todos los detalles para manejar **SOAP** suceden bajo el capó.

**JAX-RPC** admite tres modos de funcionamiento:

1. ***Synchronous request–response mode - Modo de solicitud-respuesta síncrona***: Después de invocar un método remoto, el subproceso del cliente del servicio se bloquea hasta que se devuelve un valor devuelto o una excepción.

2. ***One-way RPC mode - Modo RPC unidireccional***: Después de invocar un método remoto, el subproceso del cliente no se bloquea y continúa el procesamiento. No se espera ningún valor de retorno o excepción en esta llamada.

3. ***Non-blocking RPC invocation mode- Modo de invocación RPC sin bloqueo***: Un cliente invoca un procedimiento remoto y continúa en su subproceso sin bloquear. Posteriormente, el cliente procesa la devolución del método remoto realizando una llamada de recepción bloqueada o sondeando el valor de devolución.

Además, **JAX-RPC**, al especificar una forma estándar de conectar los controladores de mensajes **SOAP**, permite el procesamiento previo y posterior de las solicitudes y respuestas **SOAP**. Estos controladores de mensajes pueden interceptar solicitudes **SOAP** entrantes y respuestas **SOAP** salientes, lo que permite que el servicio realice un procesamiento adicional. Consulte la especificación **JAX-RPC** (enumerada en “References and Resources” en la página xx ) para obtener más información sobre **JAX-RPC**.

El ejemplo de código 2.9 es un ejemplo de una interfaz de servicio **JAX-RPC** para un servicio simple que proporciona información meteorológica para una ciudad.

**Ejemplo de código 2.9. Ejemplo de JAX-RPC Service Endpoint Interface**

```java
public interface WeatherService extends Remote {
   public String getWeather(String city) throws RemoteException;
}
```

El ejemplo de código 2.10 muestra la implementación de weather service interface mediante un Web component.

**Ejemplo de código 2.10. Implementación del JAX-RPC Service**

```java
public class WeatherServiceImpl implements
                 WeatherService, ServiceLifecycle {
   public void init(Object context) throws JAXRPCException {}

   public String getWeather(String city) {
      return ("Early morning fog clearing midday; " +
             "over all great day expected in " + city);
   }

   public void destroy() {}
}
```

El ejemplo de código 2.11 muestra cómo un cliente, usando **JAX-RPC** para acceder a este weather service.

**Ejemplo de código 2.11.Un Cliente Java/J2EE que Accede al Weather Service**

```java
.....
Context ic = new InitialContext();
Service svc = (Service)
       ic.lookup("java:comp/env/service/WeatherService");
WeatherSvcIntf port = (WeatherSvcIntf)
       svc.getPort(WeatherSvcIntf.class);
String info = port.getWeather("New York");
.....
```

Estos ejemplos ilustran que un desarrollador tiene que codificar muy poca información de configuración e implementación. La implementación de **JAX-RPC** maneja los detalles de la creación de una solicitud **SOAP**, el manejo de la respuesta **SOAP**, etc., aliviando así al desarrollador de estas complejidades.

### 2.2.3. JavaTM API para XML Registries

La **JavaTM API for XML Registries (JAXR)**, una Java API para acceder a los registros comerciales, tiene una arquitectura flexible que admite **UDDI** y otras especificaciones de registro (como **ebXML**). La figura 2.7 ilustra la arquitectura **JAXR**.

**Figura 2.7. Arquitectura JAXR**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/1daca7a6-2383-448c-8d73-6c294e3f62db)

***Un cliente JAXR, que puede ser una aplicación Java independiente(stand-alone Java application) o un componente J2EE***, utiliza una implementación de la **JAXR API provided** proporcionada por **JAXR provider** para acceder a los registros comerciales. Un **JAXR provider** consta de dos partes: un **registry-specific JAXR provider**, que proporciona una implementación específica del registro de la API, y un **JAXR pluggable provider**, que implementa las características de la API que son independientes del tipo de registro. El ***pluggable provider*** oculta los detalles de los ***registry-specific providers*** de los clientes.

El ***registry-specific provider plugs*** en el ***pluggable provider*** y actúa sobre las solicitudes y respuestas entre el cliente y el registro de destino. El ***registry-specific provider*** convierte las solicitudes de los clientes en un formato que el ***target registry*** entiende y envía las solicitudes al ***registry provider*** mediante ***registry-specific provider***. Convierte las respuestas del ***registry provider*** de un ***registry-specific*** a una respuesta **JAXR** y luego pasa la respuesta al cliente.

Consulte la especificación **JAXR** para obtener más información.

**2.2.4. SOAP with Attachments API for JavaTM - SOAP con API de archivos adjuntos para Java TM**

**SOAP with Attachments API for JavaTM (SAAJ)**, que permite a los desarrolladores producir y consumir mensajes conforme a la especificación **SOAP 1.1** y la nota SOAP con archivos adjuntos, proporciona una abstracción para manejar mensajes **SOAP** con archivos adjuntos. Los desarrolladores avanzados pueden usar **SAAJ** para que sus aplicaciones operen directamente con mensajes **SOAP**. Los archivos adjuntos pueden ser documentos **XML** completos, fragmentos **XML** o archivos adjuntos de tipo **MIME**. Además, **SAAJ** permite a los desarrolladores habilitar la compatibilidad con otros tipos de **MIME**. Las tecnologías **JAX**, como **JAX-RPC**, utilizan internamente **SAAJ** para ocultar las complejidades de **SOAP** a los desarrolladores.

**SAAJ** permite los siguientes modos de intercambio de mensajes:

* ***Synchronous request-response messaging - Mensajería de solicitud-respuesta síncrona***: El cliente envía un mensaje y luego espera la respuesta

* ***One-way asynchronous messaging (also called fire and forget) - Mensajería asíncrona unidireccional(también llamada disparar y olvidar)***: El cliente envía un mensaje y continúa con su procesamiento sin esperar una respuesta

Consulte la especificación **SAAJ** para obtener más información.

### 2.2.5. Web Service Technologies Integrated in J2EE Platform - Tecnologías de Servicios Web Integradas en Plataforma J2EE

Hasta ahora, hemos examinado cómo las tecnologías **Java XML** admiten varios estándares de Web service. Ahora veamos cómo la plataforma J2EE 1.4 combina estas tecnologías en una plataforma estándar que es portátil e integrada. Las tecnologías **Java XML** no solo están integradas en la plataforma, sino que la plataforma también define las responsabilidades relacionadas con el Web service para los contenedores, artefactos y componentes de puertos web y EJB existentes. La plataforma J2EE 1.4 garantiza la portabilidad al integrar las tecnologías **Java XML** como extensiones de los contenedores J2EE, los formatos de empaquetado, los modelos de implementación y los servicios de tiempo de ejecución existentes.

Un Web service en la plataforma J2EE 1.4 se puede implementar de la siguiente manera:

* ***Uso de un JAX-RPC service endpoint***: La implementación del servicio es una clase Java en el Web container. El servicio se adhiere al ciclo de vida del servlet y los requisitos de simultaneidad del Web container.

* ***Uso de un EJB service endpoint***: La implementación del servicio es un stateless session bean - bean de sesión sin estado en un contenedor EJB. El servicio cumple con los requisitos de simultaneidad y ciclo de vida del contenedor EJB.

En cualquier caso, el servicio se hace portátil con la definición de un componente de puerto, que proporciona la vista exterior del servicio para la implementación del Web service. Un componente de puerto consta de:

* Un documento **WSDL** que describe el Web service que sus clientes pueden usar

* Una **service endpoint interface** que define los métodos del Web service que están disponibles para los clientes

* Un **service implementation bean** que implementa la lógica de negocio de los métodos definidos en la **service endpoint interface**. La implementación puede ser una clase Java en el contenedor Web o un stateless session bean en el contenedor EJB.

Las interfaces de servicio específicas del contenedor, creadas por el contenedor J2EE, proporcionan stub estático y proxies dinámicos para todos los puertos. Un cliente de un Web service de plataforma J2EE puede ser un Web service, un J2EE component, o una aplicación stand-alone. No se requiere que el cliente sea un Web service o una aplicación implementada en Java.

***¿Cómo utilizan los clientes un Web service de la plataforma J2EE?*** Aquí hay un ejemplo de un componente J2EE que es un cliente de algún Web service. Tal cliente usa **JNDI** para buscar el servicio, luego accede al puerto del Web service usando métodos definidos en la interfaz **`javax.xml.rpc.Service`**. El cliente accede a la funcionalidad del servicio mediante su ***service endpoint interface***. *Un cliente que es un componente J2EE solo necesita considerar que la implementación del Web service no tiene estado*. Por lo tanto, el cliente no puede depender del estado de retención del servicio entre invocaciones de servicio sucesivas. Un cliente de componente J2EE no tiene que conocer ningún otro detalle del Web service, como por ejemplo, cómo accede la interfaz del servicio al servicio, la implementación del servicio, cómo se generan sus stubs, etc.

Recuerde (del ejemplo de código 2.9 y el ejemplo de código 2.10 ) cómo se ve una interfaz de servicio web, como el weather Web service, cuando se implementa como punto final de servicio **JAX-RPC** en una plataforma J2EE. Por el contrario, el ejemplo de código 2.12 muestra la implementación del  EJB service endpoint implementation equivalente para el mismo weather service.

**Ejemplo de código 2.12. EJB Service Endpoint Implementation para un Weather Service**

```java
public class HelloService implements SessionBean {
   private SessionContext sc;

   public WeatherService(){}
   public void ejbCreate() {}
   public String getWeather(String city) {
      return ("Early morning fog clearing midday; " +
             "over all great day expected in " + city);
   }
   public void setSessionContext(SessionContext sc) {
      this.sc = sc;
   }
   public void ejbRemove() {}
   public void ejbActivate() {}
   public void ejbPassivate() {}
}
```

Tenga en cuenta que cualquier cliente puede usar el código que se muestra en el ejemplo de código 2.11 para acceder a este weather service. Esto es cierto

* Independientemente de si el servicio se implementa como un **JAX-RPC service endpoint** o un **EJB service endpoint**

* Independientemente de si el cliente es un ***servlet***, un ***enterprise bean***, o un ***stand-alone Java client***

### 2.2.6. Compatibilidad con el WS-I Basic Profile

Hasta ahora hemos visto cómo las diversas tecnologías Java soportan los estándares de Web service. También hemos examinado cómo estas tecnologías Java se han integrado en la plataforma J2EE de forma estándar para garantizar la portabilidad de las implementaciones de Web service en las plataformas J2EE. Dado que garantizar la interoperabilidad entre plataformas heterogéneas es una fuerza principal para los Web service, la plataforma J2EE admite **WS-I Basic Profile**.

Como ya se vio en **“Emerging Standards”** en la página 40 , **WS-I** es una organización que abarca industrias y cuyo estatuto es crear y promover la interoperabilidad de los Web service. **WS-I** ha publicado **WS-I Basic Profile**, que dicta cómo se debe usar un conjunto de estándares de Web service para garantizar la interoperabilidad. El **WS-I Basic Profile** cubre:

* Messaging standards (tal como SOAP)
* Description and discovery standards (tal como UDDI)
* Security

Al soportar el **WS-I Basic Profile**, la plataforma J2EE está asegurada de proporcionar una plataforma interoperable y portátil para el desarrollo de Web service.

## 2.3. Otras tecnologías Java-XML

Hasta ahora, hemos discutido las tecnologías específicas de Web service que son una parte obligatoria de la plataforma J2EE. Como tal, estas tecnologías deben estar presentes en cualquier implementación J2EE de cualquier proveedor. Además de estas, existen otras tecnologías **Java-XML** que, si bien no son un requisito obligatorio de la plataforma J2EE, resultan muy útiles para implementar Web service. Si bien existen varias tecnologías de este tipo, aquí analizamos solo aquellas a las que se hace referencia a lo largo de este libro. Una de esas tecnologías **Java-XML** no obligatorias pero útiles es la arquitectura **Java Architecture for XML Binding (JAXB)**, que estandariza la representación de un documento **XML** como un objeto en memoria.

Como ya hemos visto, cuando dos partes se comunican pasando documentos XML entre ellas, los documentos XML deben seguir alguna estructura para que las partes que se comunican puedan entender el contenido de los documentos. La estructura del documento XML se define utilizando la función de esquema estándar para documentos XML. Por supuesto, si bien los desarrolladores pueden usar un parser DOM o SAX para analizar dichos documentos, es mucho más fácil si las diversas partes de los documentos XML están asignadas o vinculadas a objetos en memoria que realmente representan el significado previsto del documento, según la definición del esquema. Además de usar estos objetos, los desarrolladores tienen acceso a las definiciones del esquema como parte de su lógica. Esta instalación se denomina comúnmente **XML data-binding facility**(instalación de enlace de datos JAXB). **JAXB** proporciona una función de enlace de datos **XML** de buena calidad para la plataforma J2EE. La figura 2.8 muestra la arquitectura general de la **JAXB data-binding facility**.

**Figura 2.8. JAXB Architecture**

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ac128d33-7fae-48a3-a1b5-4ca75d50c4c7)


**JAXB** consta de tres componentes principales:

* Un **binding compiler- compilador vinculante** que crea clases Java (también denominadas content classes - clases de contenido) a partir de un esquema determinado. Las definiciones de tipos complejos dentro del esquema se asignan a clases de contenido separadas, mientras que los tipos simples (como declaraciones de atributos/elementos) se asignan a campos dentro de una clase de contenido. Los desarrolladores usan métodos get y set (similares a los métodos get y set de JavaBeans) para acceder y modificar el contenido del objeto.

* Un **binding framework - framework vinculante** que proporciona servicios de tiempo de ejecución, como marshalling(clasificación), unmarshalling(desclasificación) y validación, que se pueden realizar en las clases de contenido.

* Un **binding language - lenguaje de vinculación** que describe la vinculación del esquema a las clases de Java. Este lenguaje permite que un desarrollador anule las reglas de vinculación predeterminadas, lo que ayuda al desarrollador a personalizar las clases de contenido que crea el compilador de vinculación.

Para obtener más detalles sobre **JAXB**, consulte la especificación **JAXB** disponible a través del enlace proporcionado en la siguiente sección.

Además de **JAXB**, existen otras tecnologías Java emergentes que admiten estándares de Web service en términos de transacciones de larga duración, flujo de trabajo de procesos comerciales, etc. En el momento de redactar este documento, no se han finalizado y, por lo tanto, se tratarán en una versión futura de este libro.

## 2.4. Conclusión

Este capítulo describió los diversos estándares de Web service y las tecnologías de la plataforma J2EE 1.4 que admiten esos estándares de manera portátil e interoperable. Explicó por qué dichos estándares, incluidos **XML**, **SOAP**, **WSDL** y **UDDI**, son beneficiosos para los desarrolladores y describió brevemente cada estándar. Mostró cómo la plataforma integra las tecnologías **Java** y **Web service/XML**  existentes para permitir que las aplicaciones existentes y nuevas se expongan como Web service.

Además, este capítulo describió las diferentes APIs relacionadas con **XML** de la plataforma J2EE, incluidas **JAXP**, **JAXR**, **JAX-RPC** y **SAAJ**. Describió estas tecnologías desde un punto de vista arquitectónico de alto nivel y, cuando correspondía, ilustró su uso con código de muestra. También mostró cómo implementar un Web service en una plataforma J2EE utilizando un extremo de servicio **JAX-RPC** o **EJB**.

La Tabla 2.1 resume los estándares soportados por las diferentes tecnologías de la plataforma J2EE.

**Tabla 2.1. Soporte de Web service de la plataforma J2EE**
![image](https://github.com/adolfodelarosades/Java/assets/23094588/d17fce9c-6049-422d-b1fc-ac684dd8c21b)

Nombre de la tecnología | Estándar de apoyo | Objetivo
------------------------|-------------------|---------
JAXP | XML schema | Habilita el procesamiento de documentos XML de forma independiente al proveedor; admite modelos SAX y DOM
JAX-RPC | SOAP | Permite el intercambio de solicitudes y respuestas de SOAP a través de una API que oculta los detalles complejos de SOAP a los desarrolladores.
JAXR | UDDI, ebXML | Permite acceder a registros comerciales con una API que admite cualquier tipo de especificación de registro
SAAJ | SOAP with Attachments | Permite el intercambio de mensajes XML orientados a documentos utilizando las API de Java
J2EE for Web Services | Integra tecnologías Java XML en la plataforma J2EE; admite el perfil básico WS-I | Permite el desarrollo y la implementación de servicios web portátiles e interoperables en la plataforma J2EE
JAXB (opcional) | Representación estándar en memoria de un documento XML | Proporciona una función de enlace de datos XML para la plataforma J2EE

Ahora que tiene un buen conocimiento de las tecnologías de Web service, está listo para continuar con los problemas específicos de diseño e implementación. El Capítulo 3 describe cómo diseñar e implementar un punto final para que su aplicación pueda hacer que su funcionalidad esté disponible como un Web service.

