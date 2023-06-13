# Capítulo 4. Procesamiento XML
Las aplicaciones de servicios web a menudo transmiten información utilizando documentos XML. Los desarrolladores de aplicaciones cuyas aplicaciones aceptan documentos XML deben saber cuál es la mejor manera de extraer información de estos documentos XML y usar esa información en su procesamiento comercial. También deben saber cómo ensamblar documentos XML a partir de los resultados de este procesamiento empresarial.

Este capítulo proporciona una amplia cobertura del manejo de documentos XML. Para hacerlo más manejable, es posible que desee concentrarse en las secciones que le interesen en particular. Estas secciones son las siguientes:

“ Descripción general de XML ” en la página 122 : proporciona una descripción general de los conceptos básicos de XML. Si no está familiarizado con XML, esta sección proporciona un resumen conciso de los conceptos y tecnologías clave de XML. Incluso si conoce bien XML, es posible que desee hojear esta parte, ya que destaca cuestiones importantes para el diseño de aplicaciones basadas en XML.

“ Resumen para el manejo de documentos XML ” en la página 128 : describe cómo las aplicaciones generalmente manejan los documentos XML.

“ Diseño de aplicaciones basadas en XML ” en la página 131 : cubre temas de diseño tales como recibir y enviar documentos XML, validar documentos XML, asignar documentos XML a objetos de datos, aplicar lógica comercial en documentos u objetos y mantener la lógica de procesamiento comercial separada del procesamiento XML lógica. Esta discusión también incluye recomendaciones que ayudan a determinar cómo diseñar mejor una aplicación basada en XML. Los arquitectos y diseñadores de aplicaciones encontrarán esta sección de especial interés.

“ Implementación de aplicaciones basadas en XML ” en la página 164 : proporciona pautas para los desarrolladores sobre la mejor manera de implementar aplicaciones basadas en XML. Esta sección incluye una discusión detallada de las diversas tecnologías de procesamiento de XML que los desarrolladores pueden usar para implementar sus aplicaciones. Cubre las ventajas y desventajas de los principales modelos de programación XML y brinda recomendaciones sobre cuándo debe considerar usar cada uno de los modelos.

“ Consideraciones de rendimiento ” en la página 182 : describe las pautas para maximizar el rendimiento. Esta sección hace recomendaciones específicas para los enfoques que los desarrolladores pueden tomar para mantener el rendimiento en un nivel aceptable.

Muchos de estos conceptos para diseñar aplicaciones basadas en XML son de naturaleza genérica; se aplican a cualquier aplicación que maneje documentos XML. Dado que los servicios web son aplicaciones basadas en XML, estos conceptos se aplican especialmente al diseño de puntos finales y clientes de servicios web. El capítulo hace hincapié en las consideraciones de diseño que deben tenerse en cuenta al desarrollar puntos finales y clientes de servicios web.

Aunque presenta los conceptos básicos de XML, este capítulo asume que tiene un conocimiento práctico de las tecnologías de procesamiento de XML, especialmente SAX, DOM, XSLT y JAXB. (Consulte el Capítulo 2 para obtener más detalles sobre estas tecnologías). Siempre que sea posible, el capítulo utiliza los escenarios presentados en el Capítulo 1 para ilustrar varios puntos.

## 4.1. Descripción general de XML
Si bien es posible que ya esté familiarizado con XML, es importante comprender los conceptos de XML desde el punto de vista de las aplicaciones que manejan documentos XML. Con este conocimiento, estará en una mejor posición para juzgar el impacto de sus decisiones de diseño en la implementación y el rendimiento de sus aplicaciones basadas en XML.

Esencialmente, XML es un lenguaje de marcado que permite que el contenido de datos jerárquicos extrapolados de las estructuras de datos del lenguaje de programación se represente como un documento de texto marcado. Como lenguaje de marcado, XML utiliza etiquetas para marcar piezas de datos. Cada etiqueta intenta asignar un significado a los datos asociados con ella; es decir, transformar los datos en información. Si conoce SGML (Lenguaje de marcado generalizado estándar) y HTML (Lenguaje de marcado de hipertexto), XML le resultará familiar. XML se deriva de SGML y también tiene cierto parecido con HTML, que también es un subconjunto de SGML. Pero a diferencia de HTML, XML se enfoca en representar datos en lugar de presentarlos al usuario final. Si bien XML tiene como objetivo separar los datos de la presentación, la presentación de los datos XML por parte del usuario final se aborda de manera específica mediante tecnologías adicionales basadas en XML de diversas formas.

Aunque los documentos XML no están destinados principalmente a ser leídos por los usuarios, la especificación XML establece claramente como uno de sus objetivos que "los documentos XML deben ser legibles por humanos y razonablemente claros". Esta característica de legibilidad contribuyó a la adopción de XML. XML es compatible con las comunicaciones humanas y de computadora, y garantiza la apertura, la transparencia y la independencia de la plataforma en comparación con un formato binario.

Una gramática junto con su vocabulario (también llamado esquema en su acepción genérica) define el conjunto de etiquetas y su anidamiento (la estructura de etiquetas) que se pueden permitir o que se esperan en un documento XML. Además, un esquema puede ser específico de un dominio en particular, y los esquemas específicos de dominio a veces se denominan vocabularios de marcado. La sintaxis de definición de tipo de documento (DTD), que forma parte de la especificación XML central, permite la definición de esquemas específicos de dominio y otorga a XML su capacidad "eXtensible". Con el tiempo, ha habido un número creciente de estos vocabularios XML o lenguajes basados ​​en XML, y esta extensibilidad es un factor clave en el éxito de XML. En particular, XML y sus vocabularios se están convirtiendo en la lengua franca de la comunicación de empresa a empresa (B2B).

En resumen, XML es un metalenguaje utilizado para definir otros lenguajes de marcado. Si bien las etiquetas ayudan a describir los documentos XML, no son suficientes, incluso si se eligen cuidadosamente, para que un documento se describa completamente a sí mismo. Los esquemas escritos como DTD, o en algún otro lenguaje de esquema, como la definición de esquema XML W3C (XSD), mejoran la descripción de los documentos XML, ya que pueden definir la sintaxis o la estructura exacta de un documento. Pero incluso con los sistemas de tipos introducidos por los lenguajes de esquemas modernos, generalmente es necesario acompañar un esquema XML con documentos de especificación que describen la semántica específica del dominio de las diversas etiquetas XML. Estas especificaciones están destinadas a los desarrolladores de aplicaciones y otras personas que crean y procesan los documentos XML. Los esquemas son necesarios para especificar y validar la estructura y, hasta cierto punto, el contenido de los documentos XML. Aun así, los desarrolladores deben incorporar en última instancia la semántica de etiquetas del esquema XML en las aplicaciones que producen y consumen los documentos. Sin embargo, gracias al esquema de marcado XML bien definido, las aplicaciones intermedias, como los enrutadores de documentos, aún pueden manejar documentos de forma parcial o genérica sin conocer la semántica completa específica del dominio de los documentos.

El manejo de los siguientes conceptos de documentos XML puede tener un impacto significativo en el diseño y rendimiento de una aplicación basada en XML:

Bien formado : un documento XML debe estar bien formado para ser analizado. Un documento XML bien formado se ajusta a las reglas y restricciones de sintaxis XML, como:

El documento debe contener exactamente un elemento raíz y todos los demás elementos son elementos secundarios de este elemento raíz.

Todas las etiquetas de marcado deben estar equilibradas; es decir, cada elemento debe tener una etiqueta de inicio y una de finalización.

Los elementos pueden estar anidados pero no deben superponerse.

Todos los valores de los atributos deben estar entre comillas.

Validez : según la especificación XML, un documento XML se considera válido si tiene una declaración DTD asociada y cumple con las restricciones expresadas en la DTD. Para ser válido, un documento XML debe cumplir con los siguientes criterios:

estar bien formado

Consulte un esquema basado en DTD accesible mediante una declaración de tipo de documento: <!DOCTYPE>

Conforme a la DTD referenciada

Con la aparición de nuevos lenguajes de esquema, la noción de validez se extiende más allá de la especificación inicial a otros lenguajes de esquema no basados ​​en DTD, como XSD. Para estos esquemas que no son DTD, es posible que el documento XML no haga referencia explícita al esquema, aunque solo puede contener una pista sobre el esquema al que se ajusta. La aplicación se encarga de habilitar la validación del documento. Independientemente de las sugerencias, una aplicación aún puede validar este documento contra un esquema en particular. (Consulte “ Validación de documentos XML ” en la página 139 ).

Formas lógicas y físicas : un documento XML tiene una forma lógica que se puede distribuir potencialmente en numerosas formas físicas. El formulario físico (o formularios) representan el diseño de almacenamiento del documento. La forma física consta de unidades de almacenamiento denominadas entidades, que contienen datos analizados o no analizados. Las entidades analizadas se invocan por nombre utilizando referencias de entidad. Cuando se analiza, la referencia se reemplaza por el contenido de la entidad, y este texto de reemplazo se convierte en parte integral del documento. La forma lógica es el documento completo independientemente de su diseño físico o de almacenamiento.

Un procesador XML, en el curso del procesamiento de un documento, puede necesitar encontrar el contenido de una entidad externa; este proceso se denomina resolución de entidades. El procesador XML puede conocer cierta información de identificación sobre la entidad externa, como su nombre, sistema o identificador público (en forma de URI: URL o URN), etc., que puede usar para determinar la ubicación real de la entidad. Al realizar la resolución de entidades, el procesador XML asigna la información de identificación conocida a la ubicación real de la entidad. Esta información de mapeo puede ser accesible a través de un catálogo de resolución de entidades.

4.1.1. Tipo de documento y definiciones de esquema XML W3C
Originalmente, la sintaxis de definición de tipo de documento (DTD), que forma parte de la especificación principal de XML 1.0 y se convirtió en una recomendación en 1998, permitía la definición de esquemas específicos de dominio. Sin embargo, con el crecimiento de la adopción de XML (particularmente en el área B2B), quedó claro que la sintaxis DTD tenía algunas limitaciones. Las limitaciones de DTD son:

Utiliza una sintaxis que no se ajusta a otros documentos XML.

No admite espacios de nombres. Sin embargo, con algo de inteligencia, es posible crear esquemas DTD que tengan en cuenta el espacio de nombres.

No puede expresar tipos de datos. Con DTD, los valores de atributos y los datos de caracteres en los elementos se consideran texto (o cadenas de caracteres).

Para abordar estas deficiencias, el W3C definió el lenguaje de definición de esquemas XML (XSD). (XSD se convirtió en una recomendación oficial del W3C en 2001). XSD aborda algunas de las deficiencias de DTD, al igual que otros lenguajes de esquema, como RELAX-NG. En particular, XSD:

Es en sí mismo una aplicación de XML basada en la especificación XML : un esquema XML se puede escribir y manipular como un documento XML.

Admite espacios de nombres : al admitir espacios de nombres, XSD permite el diseño de esquemas modulares y permite la composición de definiciones de esquemas XSD. En particular, resuelve el problema de los nombres de etiquetas en conflicto, que a menudo puede ocurrir con la modularización.

Admite tipos de datos : XSD proporciona un sistema de tipos que admite derivación y restricción de tipos, además de admitir varios tipos simples integrados, como enteros, flotantes, de fecha y de hora.

La siguiente convención se aplica al resto del capítulo: El sustantivo "esquema" o "esquema XML" designa la gramática o el esquema al que debe ajustarse un documento XML y se utiliza independientemente del lenguaje del esquema real (DTD, XSD, etc. ). Nota: Si bien XSD juega un papel importante en los servicios web, es posible que los servicios web aún tengan que lidiar con esquemas basados ​​en DTD debido a razones heredadas.

Como convención adicional, usamos la palabra "serialización" para referirnos a la serialización y deserialización de XML. Nos referimos explícitamente a la serialización de Java cuando nos referimos a la serialización compatible con el lenguaje de programación Java. También tenga en cuenta que podemos usar los términos "serialización" y "desserialización" como sinónimos de serialización y deserialización de XML. Esta es la misma terminología utilizada por las tecnologías de enlace de datos XML como JAXB.

4.1.2. Esquemas XML horizontales y verticales
Los esquemas XML, que son aplicaciones del lenguaje XML, pueden aplicar XML a dominios horizontales o verticales. Los dominios horizontales son dominios entre industrias, mientras que los dominios verticales son específicos para tipos de industrias. Se han desarrollado esquemas XML específicos para estos diferentes tipos de dominios, y estas aplicaciones horizontales y verticales de XML suelen definir esquemas disponibles públicamente.

Se han establecido muchos esquemas para dominios horizontales; es decir, abordan problemas que son comunes en muchas industrias. Por ejemplo, las especificaciones del W3C definen aplicaciones o esquemas XML de dominio horizontal como Lenguaje de marcado de hipertexto extensible (XHTML), Gráficos vectoriales escalables (SVG), Lenguaje de marcado matemático (MathML), Lenguaje de integración multimedia sincronizada (SMIL), Marco de descripción de recursos (RDF) , Etcétera.

Asimismo, existen numerosos esquemas XML de dominio vertical. Estos esquemas o aplicaciones de XML definen estándares que extienden o aplican XML a un dominio vertical, como el comercio electrónico. Por lo general, los grupos de empresas de una industria desarrollan estos estándares. Algunos ejemplos de estándares XML de comercio electrónico son Electronic Business with XML (ebXML), Commerce XML (CXML), Common Business Language (CBL) y Universal Business Language (UBL).

Al diseñar una aplicación empresarial, los desarrolladores a menudo pueden definir sus propios esquemas personalizados. Estos esquemas personalizados pueden mantenerse privados dentro de la empresa. O bien, pueden compartirse solo con aquellos socios que tengan la intención de intercambiar datos con la aplicación. También es posible que estos esquemas personalizados se expongan públicamente. Dichos esquemas personalizados o esquemas específicos de la aplicación se definen desde cero o, si corresponde, pueden reutilizar, cuando sea posible, componentes de esquemas horizontales o verticales existentes. Tenga en cuenta que la publicación de esquemas para compartirlos entre socios se puede implementar de varias maneras, incluida la publicación de esquemas junto con descripciones de servicios web en un registro (consulte “ Publicación de un servicio web ” en la página 101 ).

4.1.3. Otras especificaciones relacionadas con XML
Para aquellos interesados ​​en explorar más, aquí hay una lista parcial de las muchas especificaciones relacionadas con XML.

Modelo de Objetos de Documento (DOM) — El Modelo de Objetos de Documento es una interfaz, neutral tanto en plataforma como en lenguaje, que permite que los programas y scripts procesen dinámicamente documentos XML. Usando DOM, los programas pueden acceder y actualizar el contenido, la estructura y el estilo de los documentos.

Xpath : la especificación Xpath define un lenguaje de expresión para navegar y procesar un documento de origen XML, incluida la forma de localizar elementos en un documento XML.

Transformaciones del lenguaje de hojas de estilo extensible (XSLT) : esta especificación, que es un subconjunto del lenguaje de hojas de estilo extensible (XSL), describe cómo transformar documentos XML entre diferentes formatos XML y formatos que no son XML.

Espacios de nombres : esta especificación describe cómo asociar un URI con etiquetas, elementos, nombres de atributos y tipos de datos en un documento XML, para resolver la ambigüedad cuando los elementos y atributos tienen los mismos nombres.

Conjunto de información XML : esta especificación, a menudo denominada conjunto de información, proporciona las definiciones de información en documentos XML que se consideran bien formados de acuerdo con los criterios de espacios de nombres.

XML canónico : esta especificación aborda cómo resolver las variaciones sintácticas entre XML 1.0 y las especificaciones de espacios de nombres para crear la representación canónica física de un documento XML.

## 4.2. Esquema para el manejo de documentos XML
Una aplicación basada en XML, y en particular una aplicación de servicio web, puede consumir o producir documentos XML, y dicha aplicación puede implementar tres fases de procesamiento distintas:

La aplicación consume un documento XML.

La aplicación aplica su lógica empresarial a la información recuperada del documento.

La aplicación produce un documento XML para la respuesta.

En términos generales, una aplicación basada en XML expone una interfaz que se define en términos de esquemas para los documentos XML que consume y produce, así como también por las políticas de comunicación o interacción de la aplicación. En el caso de un servicio web, un documento de lenguaje de descripción de servicios web (WSDL) describe esta interfaz, y este documento hace referencia a los esquemas XML a los que se ajustan los documentos intercambiados.

Examinemos los pasos para manejar documentos XML. (Consulte la Figura 4.1 ). La primera fase, el consumo de documentos XML entrantes o el procesamiento de entrada XML, consta de los siguientes pasos:

1.
Analizar y, opcionalmente, validar el documento : analizar y validar el documento entrante con el esquema al que debe ajustarse el documento.

2.
Transforme el documento : si es necesario, transforme el documento de su esquema conforme al esquema admitido internamente.

3.
Desensamblar el documento o pasarlo como está a la siguiente fase : desensamblar un documento consta de estos pasos:

Busque en el documento entrante información relevante. La información se puede reconocer utilizando las etiquetas incrustadas o su ubicación esperada dentro del documento.

Extrae la información relevante una vez localizada.

Opcionalmente, asigne la información recuperada a objetos específicos del dominio.

Figura 4.1. Modelado de diagramas de actividad Pasos típicos para manejar documentos XML



En la segunda fase, la aplicación aplica la lógica empresarial. Esto implica procesar realmente la información de entrada recuperada del documento XML. Dicho procesamiento se considera centrado en el documento cuando la lógica maneja el documento directamente, o centrado en el objeto cuando la lógica se aplica a objetos específicos del dominio a los que se ha asignado la información recuperada. Como resultado de este procesamiento, la aplicación puede generar información de salida XML, que es la tercera fase.

Los pasos para esta tercera fase, el procesamiento de salida XML, reflejan los del procesamiento de entrada XML. La producción de una salida XML consta de los siguientes pasos:

1.
Ensamblar el documento : ensamblar el documento de salida a partir de los resultados de aplicar la lógica de la aplicación.

2.
Transforme el documento : si es necesario, transforme el documento del esquema compatible internamente a los esquemas verticales externos apropiados.

3.
Opcionalmente, valide y luego serialice el documento : la validación antes de serializar el documento de salida a menudo se considera opcional.

Es muy posible que una aplicación basada en XML solo implemente algunas de estas fases, generalmente las que se aplican a sus servicios. Por ejemplo, algunas aplicaciones utilizan XML solo con fines de configuración y es posible que estas aplicaciones solo consuman documentos XML. Otras aplicaciones solo generan contenido dirigido a dispositivos y estas aplicaciones solo pueden producir documentos XML (Lenguaje de marcado inalámbrico, HTML, SVG, etc.). Las aplicaciones de comercio electrónico, por otro lado, pueden consumir y producir documentos XML.

También hay aplicaciones que se especializan en operaciones particulares, como aquellas que se especializan en transformaciones, en cuyo caso realizan solo las operaciones previstas. Por ejemplo, la función de una aplicación podría ser seleccionar y aplicar una transformación a un documento en función de los requisitos de procesamiento aprobados con el documento, produciendo así uno o más documentos nuevos. En este ejemplo, la lógica de la aplicación puede consistir únicamente en la lógica de selección de hojas de estilo.

Los desarrolladores que implementan aplicaciones con un modelo de procesamiento centrado en documentos, donde la propia lógica comercial maneja los documentos, pueden encontrar que el manejo de documentos está más enredado con la lógica comercial. En particular, los pasos que pueden entremezclarse con la lógica de negocios son aquellos para desensamblar los documentos consumidos y ensamblar el documento de salida. Estos casos requieren un manejo cuidadoso. Consulte “ Abstraer el procesamiento XML de la lógica de la aplicación ” en la página 155 .

Los clientes, ya sea un par de servicios web o un cliente enriquecido que interactúa con un usuario final, implementan procesos, como el proceso que se acaba de presentar, para manejar documentos XML enviados junto con solicitudes a un servicio o recibidos como respuestas. A veces, la lógica de la aplicación de los clientes enriquecidos orientados a personas puede tener que lidiar con la presentación de los documentos recibidos al usuario final en lugar del procesamiento de la lógica comercial.

Tenga en cuenta que las aplicaciones empresariales del mundo real pueden tener varias instancias de este proceso abstracto para manejar documentos con esquemas no relacionados o documentos con propósitos no relacionados. Además, estos procesos pueden implementarse para abarcar una o más capas de una aplicación empresarial. En particular, en el caso de un punto final de servicio web, estas fases se pueden implementar tanto en las capas de interacción como de procesamiento, según el modelo de procesamiento utilizado por el servicio web. Consulte la discusión sobre una arquitectura en capas de servicios web en " Decisiones clave de diseño de servicios web " en la página 61 .

## 4.3. Diseño de aplicaciones basadas en XML
Hay una serie de consideraciones que se deben tener en cuenta al diseñar aplicaciones basadas en XML, en particular aplicaciones de servicios web. Por un lado, es posible que deba diseñar un esquema XML específico para su dominio. También debe considerar cómo su aplicación pretende recibir y enviar documentos, y cómo y cuándo validar esos documentos. También es importante separar el procesamiento del documento XML del procesamiento de la lógica comercial de la aplicación. (“ Elegir modelos de procesamiento ” en la página 151 analiza con más detalle cómo separar el documento XML del procesamiento de la lógica de negocios).

Ya sea que diseñe su propio esquema específico de dominio o confíe en esquemas verticales estándar, aún debe comprender la dinámica de asignar el modelo de datos de la aplicación al esquema. También debe considerar el modelo de procesamiento y si usar un modelo centrado en documentos o un modelo centrado en objetos.

Estos temas se discuten en las siguientes secciones.

4.3.1. Diseño de esquemas XML específicos de dominio
A pesar de la disponibilidad de más y más esquemas de dominio vertical, es posible que los desarrolladores de aplicaciones aún tengan que definir esquemas XML específicos de la aplicación que deben acordarse y compartirse entre los participantes que interoperan. Con la introducción de lenguajes de esquemas modernos como XSD, que introdujeron tipificación de datos y derivación de tipos sólidos, el diseño de esquemas XML comparte muchos de los aspectos del diseño orientado a objetos, especialmente con respecto a la modularización y la reutilización.

El diseño de esquemas XML específicos de dominio se desglosa según la definición de los tipos de esquema XML, su relación con otros tipos y las restricciones a las que están sujetos. Las definiciones de tales tipos de esquemas XML, relaciones y restricciones suelen ser el resultado del análisis del vocabulario del dominio de la aplicación (también llamado vocabulario comercial). En la medida de lo posible, los diseñadores de esquemas deben aprovechar las definiciones de esquema de dominio vertical público ya definidas para promover una mayor aceptación e interoperabilidad entre los participantes previstos. Los diseñadores de nuevos esquemas deben tener en cuenta las cuestiones de interoperabilidad y tratar de tener en cuenta la reutilización y la extensibilidad. La figura 4.2 muestra el modelo UML de un esquema XML típico.

Figura 4.2. Modelo para un Esquema XML ( Factura.xsd )



La gran similitud entre el diseño orientado a objetos y el diseño de esquemas XML hace posible aplicar el modelado UML al diseñar esquemas XML. Los diseñadores pueden usar las herramientas de modelado de software disponibles para modelar esquemas XML como diagramas de clase UML y, a partir de estos diagramas, generar los esquemas reales en un lenguaje de esquema de destino como XSD. El ejemplo de código 4.1 muestra un ejemplo de un esquema basado en XSD.

Ejemplo de código 4.1. Un esquema basado en XSD de factura ( Factura.xsd )
<?versión xml="1.0" codificación="UTF-8"?>

<xsd:esquema xmlns:xsd="http://www.w3.org/2001/XMLSchema" ...>
   <xsd:nombre del elemento="Factura">
      <xsd:tipocomplejo>
         <xsd:secuencia>
            <xsd:nombre del elemento="IdPedido" tipo="xsd:cadena"/>
            ...
            <xsd:nombre del elemento="FechaEnvío" tipo="xsd:fecha" />
            <xsd:nombre del elemento="Elementos de línea">
               <xsd:tipocomplejo>
                  <xsd:secuencia>
                     <xsd:tipo de elemento="elemento de línea" minOccurs="1"
                     maxOccurs="ilimitado" />
                  </xsd:secuencia>
               </xsd:tipocomplejo>
               <xsd:nombre único="itemIdUniqueness">
                  <xsd:selector xpath="LineItem"/>
                  <xsd:campo xpath="@itemId"/>
               </xsd:único>

            </xsd:elemento>
         </xsd:secuencia>
      </xsd:tipocomplejo>
   </xsd:elemento>

   <xsd:complexType nombre="elemento de línea">
      <xsd:nombre del atributo="categoryId" tipo="xsd:cadena"
      use="requerido" />
      ...
      <xsd:nombre del atributo="PrecioUnitario" tipo="decimalpositivo"
      use="requerido" />
   </xsd:tipocomplejo>

   <xsd:simpleType nombre="decimalpositivo">
      <xsd:restricción base="xsd:decimal">
         <xsd:minValor inclusivo="0.0" />
      </xsd:restricción>
   </xsd:tiposimple>
</xsd:esquema>

Como ejemplo, considere la biblioteca Universal Business Language (UBL), que proporciona una biblioteca estándar de documentos comerciales XML, como órdenes de compra, facturas, etc. UBL es un modelo conceptual de una colección de clases de objetos y asociaciones, denominadas entidades de información empresarial (BIES). Estas entidades están organizadas en jerarquías específicas, a partir de las cuales se ensamblan tipos de documentos específicos. Como resultado, UBL es:

Un lenguaje de negocios basado en XML

Basado en intercambio electrónico de datos (EDI) existente y esquemas o vocabularios de empresa a empresa XML

Aplicable en todos los sectores industriales y dominios de comercio electrónico

Diseñado para ser modular, reutilizable y extensible

Además, como con cualquier diseño de software, debe haber un equilibrio entre la reutilización, la mantenibilidad y el rendimiento. Esto es válido tanto para el diseño del propio esquema XML como para el diseño lógico y físico de los documentos XML o las instancias del esquema. Por ejemplo, considere un esquema que reutilice definiciones de elementos y tipos de otros esquemas. La carga inicial de este esquema puede requerir numerosas conexiones de red para resolver estas definiciones externas, lo que genera una sobrecarga de rendimiento significativa. Aunque este problema se comprende bien y algunas tecnologías de procesamiento de XML pueden proporcionar soluciones en forma de catálogos de entidades XML, es posible que el desarrollador deba abordar este problema de manera explícita. Similarmente, La instancia de un documento generada dinámicamente se puede diseñar de manera que use referencias de entidades externas para incluir fragmentos estáticos o menos dinámicos en lugar de incrustar estos fragmentos. Este arreglo puede potencialmente requerir que el consumidor de este documento emita muchas conexiones de red para recuperar estos diferentes fragmentos. Aunque este tipo de modularización e inclusión puede generar una sobrecarga de red significativa, permite a los consumidores de instancias y esquemas de documentos ajustar con mayor precisión los mecanismos de almacenamiento en caché. Ver " permite a los consumidores de instancias y esquemas de documentos ajustar con mayor precisión los mecanismos de almacenamiento en caché. Ver " permite a los consumidores de instancias y esquemas de documentos ajustar con mayor precisión los mecanismos de almacenamiento en caché. Ver "Consideraciones de rendimiento ” en la página 182 .

En general, el diseño del esquema del documento y el diseño de las instancias del documento son muy similares al diseño orientado a objetos. Además, existen estrategias de diseño que identifican y brindan soluciones bien definidas a problemas recurrentes comunes en el diseño de esquemas de documentos.

Tenga en cuenta las siguientes recomendaciones al diseñar un esquema XML:

Adopte y desarrolle patrones de diseño, convenciones de nomenclatura y otras prácticas recomendadas similares a las que se utilizan en el modelado orientado a objetos para abordar los problemas de reutilización, modularización y extensibilidad.

Aproveche los esquemas horizontales existentes y los esquemas verticales definidos dentro de su industria, así como los esquemas personalizados ya definidos dentro de su empresa.

No confíe únicamente en elementos autodescriptivos y nombres de atributos. Comente y documente esquemas personalizados.

Utilice herramientas de modelado que admitan lenguajes de esquema conocidos, como XSD.

Tenga en cuenta que la reutilización de esquemas puede permitir la reutilización del código de procesamiento XML correspondiente.

4.3.2. Recepción y envío de documentos XML
Los esquemas XML de los documentos que se consumirán y producirán son parte de la interfaz general expuesta de una aplicación basada en XML. La interfaz expuesta abarca esquemas de todos los documentos pasados ​​junto con los mensajes entrantes y salientes, independientemente del protocolo de paso de mensajes: SOAP, HTTP simple o JMS.

Normalmente, una aplicación puede recibir o devolver documentos XML de la siguiente manera:

Recibido a través de un punto final de servicio web: un punto final de servicio JAX-RPC o un punto final de servicio EJB si la aplicación está expuesta como un servicio web. (Consulte el Capítulo 3 para obtener más información).

Devuelto a un cliente de servicio web: si la aplicación accede a un servicio web a través de JAX-RPC. (Consulte el Capítulo 5 para obtener más detalles).

A través de una cola o tema JMS (posiblemente adjunto a un bean controlado por mensajes en el nivel EJB) al implementar un flujo de trabajo de proceso comercial o implementar una arquitectura de servicio web asíncrona. (Consulte “ Delegación de solicitudes de servicios web a la capa de procesamiento ” en la página 92 ).

Tenga en cuenta que una aplicación genérica basada en XML también puede recibir y devolver documentos XML a través de un servlet sobre HTTP simple.

Recuerde del Capítulo 3 que una aplicación de servicio web debe manejar explícitamente ciertos esquemas XML: esquemas para parámetros SOAP que no están vinculados a objetos Java y esquemas de documentos XML pasados ​​como archivos adjuntos a mensajes SOAP. Dado que el tiempo de ejecución de JAX-RPC pasa valores de parámetros SOAP (aquellos que no están vinculados a objetos Java) como SOAPElementfragmentos de documentos, una aplicación puede consumirlos y procesarlos como árboles DOM, e incluso vincularlos mediante programación a objetos Java, utilizando técnicas de vinculación de datos XML como JAXB. Los documentos se pueden pasar como archivos adjuntos a los mensajes SOAP cuando son muy grandes, legalmente vinculantes o cuando el procesamiento de la aplicación requiere el conjunto de información del documento completo. Los documentos enviados como archivos adjuntos también pueden ajustarse a esquemas definidos en idiomas que no son compatibles directamente con el extremo del servicio web.

El ejemplo de código 4.2 y el ejemplo de código 4.3 ilustran el envío y la recepción de documentos XML.

Ejemplo de código 4.2. Envío de un documento XML a través de un resguardo de cliente de servicio web
public class ProveedorOrderSender {
   privado ProveedorServicio_Stub proveedorServicio;

   ProveedorOrderSender público (URL serviceEndPointURL) {
      // Crear un stub de cliente de servicio web de proveedor
      proveedorServicio = ...
      devolver;
   }
   // Envía un documento de orden de compra al servicio web del proveedor
   Public String submitOrder (origen proveedorOrder)
      lanza RemoteException, InvalidOrderException {
      Número de seguimiento de cadena
         = servicioproveedor.submitOrder(pedidoproveedor);
      número de seguimiento de retorno;
   }
}

Ejemplo de código 4.3. Recepción de un documento XML a través de un punto final de servicio web
clase pública ProveedorServicioImpl implementa ProveedorServicio, ... {

   Public String submitOrder (origen proveedorOrder)
      lanza InvalidOrderException, RemoteException {
      ProveedorOrderRcvr proveedorOrderRcvr
         = new ProviderOrderRcvr();
      // Delegar el procesamiento del documento entrante
      return orderOrderRcvr.receive(pedidoproveedor);
   }
}

JAX-RPC pasa documentos XML que son archivos adjuntos a mensajes SOAP como objetos fuente abstractos . Por lo tanto, no debe asumir ninguna implementación específica ( StreamSource , SAXSource o DOMSource ) para un documento entrante. Tampoco debe suponer que la implementación de JAX-RPC subyacente validará o analizará el documento antes de pasarlo al extremo del servicio web. El desarrollador debe asegurarse mediante programación de que el documento es válido y se ajusta a un esquema esperado. (Consulte la siguiente sección para obtener más información sobre la validación). El desarrollador también debe asegurarse de que se utilice la API óptima para establecer un puente entre la implementación de origen específica que se pasa al punto final y el modelo de procesamiento previsto. Ver "Utilice la API más adecuada ” en la página 184 .

La producción de documentos XML que se van a pasar como archivos adjuntos a las operaciones SOAP puede usar cualquier modelo de procesamiento XML, siempre que el documento resultante se pueda envolver en un objeto de origen . El JAX-RPC subyacente se encarga de adjuntar el documento pasado al mensaje de respuesta SOAP. Por ejemplo, el Ejemplo de código 4.4 y el Ejemplo de código 4.5 muestran cómo enviar y recibir documentos XML a través de una cola JMS.

Ejemplo de código 4.4. Envío de un documento XML a una cola JMS
clase pública ProveedorOrderRcvr {
   fábrica de conexiones de cola privada fábrica de colas;
   cola de cola privada;

   public ProviderOrderRcvr() lanza RemoteException {
      colaFábrica = ...; // Fábrica de colas de búsqueda 
      cola = ...; // Cola de búsqueda
      ...
   }

   cadena pública recibir (origen proveedorOrden)
      lanza InvalidOrderException {
      // Preprocesar (validar y transformar) el documento entrante
      Cadena documento = ...
      // Extrae el id del pedido del documento entrante
      Cadena orderId = ...
      // Reenviar el documento transformado a la capa de procesamiento 
						// usando JMS
      Conexión QueueConnection
         = queueFactory.createQueueConnection();
      Sesión QueueSession = conexión.createQueueSession(...);
      QueueSender queueSender = sesión.createSender(cola);
      Mensaje de mensaje de texto = session.createTextMessage();
      mensaje.setText(documento);
      queueSender.send(mensaje);
      devolver ID de pedido;
   }
}

Ejemplo de código 4.5. Recepción de un documento XML a través de una cola JMS
clase pública ProveedorPedidoMDB
       implementa MessageDrivenBean, MessageListener {
   privado OrderFulfillmentFacadeLocal poProcessor = null;

   ProveedorOrderMDB público () {}

   public void ejbCreate() {
      // Crear un procesador de órdenes de compra
      poProcesador = ...
   }
   // Recibe el documento de pedido de compra del proveedor desde el 
						// punto final del servicio web (capa de interacción) a través de una cola JMS
   public void onMessage(Mensaje msj) {
      Cadena documento = ((Mensaje de texto) msg).getText();
      // Procesa la orden de compra XML recibida por el proveedor
      Cadena factura = poProcessor.processPO(documento);
      ...
   }
}

Hay circunstancias en las que un servicio web puede intercambiar internamente documentos XML a través de una cola o un tema JMS. Al implementar una arquitectura asíncrona, la capa de interacción de un servicio web puede enviar documentos XML de forma asíncrona utilizando JMS a la capa de procesamiento. De manera similar, cuando un servicio web implementa un flujo de trabajo, los componentes que implementan las etapas individuales del flujo de trabajo pueden intercambiar documentos XML utilizando JMS. Desde el punto de vista de un desarrollador, recibir o enviar documentos XML a través de una cola o tema JMS es similar en principio al caso de pasar documentos como archivos adjuntos de mensajes SOAP. Los documentos XML se pueden pasar a través de una cola o tema JMS como mensajes de texto o en un formato serializado de Java cuando esos documentos se pueden vincular a objetos Java.

4.3.3. Validación de documentos XML
Una vez que se ha recibido o producido un documento, un desarrollador puede, y la mayoría de las veces debe, validar el documento contra el esquema al que se supone que se ajusta. La validación, un paso importante en el manejo de documentos XML, puede ser necesaria para garantizar la confiabilidad de una aplicación XML. Una aplicación puede confiar legítimamente en el analizador para realizar la validación y, por lo tanto, evitar realizar dicha validación por sí misma.

Sin embargo, debido a las capacidades limitadas de algunos lenguajes de esquema, un documento XML válido puede seguir siendo inválido en el dominio de la aplicación. Esto podría suceder, por ejemplo, cuando un documento se valida mediante DTD, porque este lenguaje de esquema carece de capacidades para expresar datos fuertemente tipados, unicidad compleja y restricciones de referencias cruzadas. Otros lenguajes de esquema modernos, como XSD, más rigurosamente, aunque todavía carecen de cierta expresividad de restricciones comerciales, reducen el conjunto de instancias de documentos válidos a aquellos que la lógica comercial puede procesar de manera efectiva. Independientemente del lenguaje del esquema, incluso cuando se realiza la validación XML, la aplicación es responsable de hacer cumplir las restricciones específicas del dominio descubiertas que, sin embargo, el documento puede violar. Eso es,

Para decidir dónde y cuándo validar documentos, puede tener en cuenta ciertas consideraciones. Suponiendo un sistema (por sistema nos referimos a un conjunto de aplicaciones que componen una solución y que definen un límite dentro del cual los componentes confiables pueden intercambiar información), uno puede imponer la validación de acuerdo con las siguientes observaciones. (Consulte la Figura 4.3 ).

Es posible que los documentos intercambiados dentro de los componentes del sistema no requieran validación.

Los documentos que provienen de fuera del sistema, especialmente cuando no se originan en fuentes externas confiables, deben validarse a la entrada.

Los documentos provenientes del exterior del sistema, una vez validados, podrán ser intercambiados libremente entre los componentes internos sin necesidad de validación adicional.

Figura 4.3. Validación de Documentos Entrantes



Por ejemplo, una aplicación de comercio electrónico de varios niveles que intercambia documentos con socios comerciales a través de un front-end impone la validez del documento en el front-end. No solo verifica la validez del documento contra su esquema, sino que la aplicación también asegura que el tipo de documento es un tipo de esquema que puede aceptar. Luego puede enrutar documentos a otras aplicaciones o servidores para que los servicios adecuados puedan manejarlos. Dado que ya han sido validados, los documentos no requieren una validación adicional. En un servicio web, la validación de los documentos entrantes normalmente se realiza en la capa de interacción. Por lo tanto, es posible que la capa de procesamiento no tenga que validar los documentos que recibe de la capa de interacción.

Es posible que algunas aplicaciones deban recibir documentos que se ajusten a diferentes esquemas o diferentes versiones de un esquema. En estos casos, la aplicación no puede hacer la validación por adelantado contra un esquema específico a menos que se le dé una directiva dentro de la solicitud sobre qué esquema usar. Si no se incluye ninguna directiva en la solicitud, la aplicación debe basarse en una pista proporcionada por el propio documento. Tenga en cuenta que para lidiar con versiones sucesivas del mismo esquema, donde las versiones realmente modifican la interfaz general de la aplicación, a veces puede ser más conveniente para una aplicación exponer un punto final separado para cada versión del esquema.

Para ilustrar, una aplicación debe verificar que el documento esté validado contra el esquema esperado, que no es necesariamente el que el documento declara que cumple. Con los esquemas DTD, esta verificación solo se puede realizar después de la validación. Cuando se usa DOM, la aplicación puede recuperar el sistema o el identificador público ( SystemID o PublicID ) de la DTD para garantizar que sea el identificador del esquema esperado ( Ejemplo de código 4.6 ), mientras que cuando se usa SAX, se puede hacer sobre la marcha. manejar el evento adecuado. Con JAXP 1.2 y XSD (u otros lenguajes de esquema que no sean DTD), la aplicación puede especificar por adelantado el esquema para validar ( Ejemplo de código 4.7 ); la aplicación puede incluso ignorar el esquema al que hace referencia el propio documento.

Ejemplo de código 4.6. Asegurar el tipo esperado de un documento conforme a DTD
booleano estático público checkDocumentType (documento documento,
       Cadena dtdPublicId) {
   DocumentType documentType = document.getDoctype();
   if (tipodocumento != nulo) {
       String publicId = documentType.getPublicId();
       return publicId != null && publicId.equals(dtdPublicId);
   }
   falso retorno;
}

Ejemplo de código 4.7. Configuración del analizador para la validación en JAXP 1.2
Cadena final estática pública W3C_XML_SCHEMA
   = "http://www.w3.org/2001/XMLSchema";
Cadena final estática pública JAXP_SCHEMA_LANGUAGE
   = "http://java.sun.com/xml/jaxp/properties/schemaLanguage";
Cadena final estática pública JAXP_SCHEMA_SOURCE
   = "http://java.sun.com/xml/jaxp/properties/schemaSource";

SAXParser estático público createParser (validación booleana,
       booleano xsdSupport, CustomEntityResolver entidadResolver,
       Cadena schemaURI) lanza ... {
   // Obtener un analizador SAX de una fábrica de analizadores SAX
   SAXParserFactory parserFactory
      = SAXParserFactory.newInstance();
   // Habilitar la validación
   parserFactory.setValidating(validando);
   parserFactory.setNamespaceAware(verdadero);
   Analizador SAXParser = parserFactory.newSAXParser();
   if (xsdSupport) { // Soporte de esquema XML
      intentar {
         // Habilitar la validación del esquema XML
         analizador.setProperty(JAXP_SCHEMA_LANGUAGE,
            W3C_XML_ESQUEMA);
         // Establecer el esquema de validación en el URI del esquema resuelto
         analizador.setProperty(JAXP_SCHEMA_SOURCE,
            entidadResolver.mapEntityURI(esquemaURI));
      } catch (excepción SAXNotRecognizedException) { ... }
   }
   analizador de retorno;
}

Cuando confíe en los esquemas a los que los documentos declaran internamente que se ajustan (a través de una declaración DTD o una sugerencia XSD), por seguridad y para evitar modificaciones maliciosas externas, debe conservar su propia copia de los esquemas y validar contra estas copias. Esto se puede hacer usando una resolución de entidades, que es una interfaz de la API de SAX ( org.xml.sax.EntityResolver ), que mapea con fuerza referencias a esquemas externos bien conocidos para copias seguras.

Para resumir estas recomendaciones:

Valide los documentos entrantes en el límite del sistema, especialmente cuando los documentos provienen de fuentes no confiables.

Cuando sea posible, imponga la validación por adelantado con respecto a los esquemas admitidos.

Cuando se confía en declaraciones de esquema interno (declaración DTD, sugerencia XSD, etc.):

Redirigir referencias de esquemas externos a copias seguras.

Compruebe que los esquemas de validación sean esquemas admitidos.

4.3.4. Asignación de esquemas al modelo de datos de la aplicación
Después de definir la interfaz de la aplicación y los esquemas de los documentos que se consumirán y producirán, el desarrollador debe definir cómo se relacionan o se asignan los esquemas de los documentos al modelo de datos en el que la aplicación aplica su lógica empresarial. Nos referimos a estos esquemas de documentos como esquemas externos. Estos esquemas pueden diseñarse específicamente para cumplir con los requisitos de la aplicación, como cuando no hay esquemas preexistentes disponibles, o pueden imponerse al desarrollador. Esta última situación, por ejemplo, puede ocurrir cuando la aplicación pretende ser parte de un grupo interactivo dentro de una industria que promueve esquemas verticales estándar. (Por ejemplo, esquemas UBL o ebXML).

4.3.4.1. Mapeo de estrategias de diseño
Según los requisitos de una aplicación, existen tres estrategias o enfoques de diseño principales para asignar esquemas al modelo de datos de la aplicación. (Consulte la Figura 4.4 ).

Un enfoque de "afuera a adentro" : el desarrollador diseña el modelo de datos interno en función de los esquemas externos.

Un enfoque de "reunión en el medio" : el desarrollador diseña el modelo de datos junto con un esquema de coincidencia genérico interno. Posteriormente, el desarrollador define transformaciones en el esquema interno para admitir los esquemas externos.

Un enfoque de "entrada a salida", o adaptador heredado : este enfoque en realidad se trata de cómo asignar un modelo de datos de aplicación a esquemas. El desarrollador diseña el esquema expuesto a partir de un modelo de datos existente.

Figura 4.4. Enfoque de afuera hacia adentro para mapear esquemas a las clases del modelo de datos



La Figura 4.4 , la Figura 4.5 y la Figura 4.6 muestran la secuencia de las actividades involucradas en el momento del diseño y los artefactos (esquemas y clases) utilizados o producidos por estas actividades. Las figuras también muestran las relaciones entre estos artefactos y las entidades en tiempo de ejecución (documentos y objetos), así como la interacción en tiempo de ejecución entre estas entidades.

Figura 4.5. Enfoque de encuentro en el medio para mapear esquemas a clases de modelos de datos



Figura 4.6. Enfoque de adaptador heredado (de adentro hacia afuera) para mapear esquemas a clases de modelos de datos



El primer enfoque ( Figura 4.4 ), que introduce una fuerte dependencia entre el modelo de datos y la lógica de la aplicación y los esquemas externos, es adecuado solo para aplicaciones dedicadas a admitir un modelo de interacción específico. Una fuerte dependencia como esta implica que la evolución o revisión de los esquemas externos afecta el modelo de datos de la aplicación y su lógica.

El segundo enfoque ( Figura 4.5), que introduce una capa de transformación o adaptación entre la lógica y el modelo de datos de la aplicación y los esquemas externos, es especialmente adecuado para aplicaciones que pueden tener que soportar diferentes esquemas externos. Tener una capa de transformación deja espacio para admitir esquemas adicionales y es una forma natural de dar cuenta de la evolución de un esquema particular. El desafío es diseñar un esquema interno que sea lo suficientemente genérico y que no solo proteja a la aplicación de cambios externos (en número y revisión), sino que también permita que la aplicación funcione e interopere por completo. Por lo general, dicho esquema interno se asigna a un subconjunto operativo mínimo o denominador común de los esquemas externos, o se asigna a un esquema universal genérico del dominio de la aplicación. (UBL es un ejemplo de este último caso. ) El desarrollador debe darse cuenta de que dicho enfoque tiene algunas limitaciones: es más fácil transformar una estructura que contiene más información a una con menos información que al revés. Por lo tanto, la elección del esquema interno genérico es clave para ese enfoque.El ejemplo de código 4.8 muestra cómo usar una hoja de estilo para transformar un esquema externo basado en XSD en un esquema interno basado en DTD.

Ejemplo de código 4.8. Hoja de estilo para la transformación de un esquema basado en XSD externo a un esquema basado en DTD interno
<?versión xml="1.0" codificación="UTF-8"?>

<xsl:hoja de estilo xmlns:xsl="http://www.w3.org/1999/XSL/Transformar"
   xmlns:so="http://blueprints.j2ee.sun.com/SupplierOrder" 
							xmlns:li="http://blueprints.j2ee.sun.com/LineItem" 
							xmlns:xsi="http://www.w3 .org/2001/XMLSchema-instancia"
   versión="1.0">

   <xsl:output method="xml" indent="yes" encoding="UTF-8"
       doctype-public="-//Sun Microsystems, Inc. - 
							J2EE Blueprints Group//DTD SupplierOrder 1.1//EN" 
							doctype-system ="/com/sun/j2ee/blueprints/ 
							proveedorpo/rsrc/schemas/SupplierOrder.dtd" />

   <xsl:coincidencia de plantilla="/">
      <Pedido de proveedor>
          <OrderId><xsl:value-of select="/
          so:OrdenProveedor/so:IdPedido" /></IdPedido>
          <FechaPedido><xsl:valor-de-seleccionar="/
             so:PedidoProveedor/so:FechaPedido" /></FechaPedido>
          <xsl:apply-templates select=".//
          so:Dirección de envío|.//li:Artículo de línea"/>
      </Pedido de proveedor>
   </xsl:plantilla>

   <xsl:template match="/so:OrdenProveedor/
          entonces:Dirección de envío">
      ...
   </xsl:plantilla>

   <xsl:template match="/so:SupplierOrder/so:LineItems/
          li:Elemento de Línea">
      ...
   </xsl:plantilla>
</xsl:hoja de estilo>

Normalmente, los desarrolladores deben comenzar este proceso de diseño a partir de la definición de la interfaz de la aplicación más los esquemas XML. En algunas situaciones, un desarrollador puede tener que trabajar a la inversa; es decir, comience desde adentro y trabaje. Vea el tercer enfoque, que se muestra en la Figura 4.6 .

Es posible que el desarrollador tenga que usar el modelo de datos de la aplicación para crear un conjunto de esquemas coincidentes, que luego se expondrán como parte de la interfaz de la aplicación. Este tercer enfoque se usa a menudo cuando las aplicaciones existentes o heredadas necesitan exponer una interfaz basada en XML para facilitar una integración débilmente acoplada en un sistema empresarial más amplio. Esta técnica también se conoce como adaptadores heredados o envoltorios. En estos casos, la implementación de la aplicación determina la interfaz y los esquemas a exponer. Además, este enfoque se puede combinar con el enfoque de encuentro en el medio para proporcionar una capa de adaptación adecuada, que a su vez pone a disposición una interfaz más interoperable, es decir, una interfaz que no está tan estrechamente vinculada a la aplicación heredada. Ver Capítulo 6para obtener más información sobre la integración de aplicaciones.

4.3.4.2. Mapeo flexible
Como complemento a estos enfoques, es posible mapear documentos completos o solo porciones de documentos. En lugar de un diseño centralizado para la asignación de un esquema externo a un esquema interno bien definido, los desarrolladores pueden usar un diseño descentralizado en el que los componentes asignan partes específicas de un documento a una representación interna adecuada por componente. Diferentes componentes pueden requerir diferentes representaciones de los documentos XML que consumen o producen. Tal diseño descentralizado permite un mapeo flexible donde:

Es posible que un componente no necesite conocer el documento XML completo. Un componente se puede codificar contra solo un fragmento del esquema general del documento.

El documento en sí puede ser la representación central persistente del modelo de datos. Cada componente asigna solo partes del documento a la representación transitoria para aplicar su lógica respectiva y luego modifica el documento en consecuencia.

Incluso si el modelo de procesamiento está globalmente centrado en el documento (consulte “ Elegir modelos de procesamiento ” en la página 151 ), cada componente puede, si es adecuado, implementar localmente un modelo de procesamiento más centrado en el objeto asignando partes del documento a objetos específicos del dominio.

Cada componente puede manejar el documento utilizando la técnica de procesamiento XML más efectiva o adecuada. (Consulte “ Elección de un modelo de programación de procesamiento XML ” en la página 164 ).

Esta técnica es particularmente útil para implementar un flujo de trabajo orientado a documentos donde los componentes intercambian o tienen acceso a documentos completos pero solo manipulan partes de los mismos. Por ejemplo, la figura 4.7 muestra cómo un documento de orden de compra puede pasar secuencialmente por todas las etapas de un flujo de trabajo. Cada etapa puede procesar información específica dentro del documento. Una etapa de procesamiento de tarjetas de crédito solo puede recuperar la tarjeta de créditoelemento del documento de orden de compra . Al finalizar, una etapa puede "sellar" el documento insertando información nuevamente en el documento. En el caso de una etapa de procesamiento de tarjeta de crédito, la fecha y el estado de autorización de la tarjeta de crédito pueden volver a insertarse en el documento de Orden de Compra .

Figura 4.7. Mapeo flexible aplicado a un escenario de servicio de viajes



4.3.4.3. Componentes XML
Para un modelo de procesamiento centrado en documentos, especialmente cuando se procesan documentos en el nivel EJB, es posible que desee crear componentes genéricos y reutilizables cuyo estado sea serializable hacia y desde XML. (Consulte “ Diseño de esquemas XML específicos de dominio ” en la página 131 .) Por ejemplo, suponga que su aplicación funciona con un bean de entidad de dirección cuyas instancias se inicializan con información recuperada de varios documentos XML, como órdenes de compra y facturas. Aunque los documentos XML se ajustan a diferentes esquemas, desea utilizar el mismo componente, el mismo bean de dirección , sin modificaciones, independientemente del esquema subyacente admitido.

Una buena manera de abordar este problema es diseñar un esquema XML genérico en el que se pueda serializar el estado de su componente. A partir de este esquema genérico, puede generar objetos de contenido o específicos del dominio serializables en XML que manejen la serialización del estado de su componente.

Puede generar los objetos de contenido de forma manual o automática utilizando tecnologías de enlace de datos XML como JAXB. Además, puede combinar estos componentes XML serializables en entidades compuestas con los esquemas compuestos correspondientes.

Cuando se combina con el enfoque de "reunión en el medio" discutido anteriormente, puede aplicar transformaciones XSLT para convertir documentos XML que se ajusten a esquemas verticales externos en esquemas genéricos internos compatibles con su aplicación. Las transformaciones también se pueden aplicar en la dirección opuesta para convertir documentos de esquemas genéricos internos a esquemas verticales externos.

Por ejemplo, la Figura 4.8 , que ilustra la creación de componentes XML, muestra una entidad compuesta de un BeanOrdenDeCompra y sus dos componentes, el AddressBean y el LineItemBean . Los esquemas de los componentes se componen de la misma manera y forman un esquema compuesto genérico. Se pueden aplicar transformaciones para convertir el esquema de orden de compra compuesto genérico interno en y desde varios esquemas verticales externos. Admitir un esquema externo adicional es solo cuestión de crear una nueva hoja de estilo.

Figura 4.8. Componente XML serializable compuesto



4.3.5. Elección de modelos de procesamiento
Una aplicación basada en XML puede aplicar su lógica comercial directamente en documentos consumidos o producidos, o puede aplicar su lógica en objetos específicos del dominio que encapsulan total o parcialmente el contenido de dichos documentos. Los objetos específicos del dominio son objetos Java que no solo pueden encapsular datos específicos del dominio de la aplicación, sino que también pueden incorporar un comportamiento específico del dominio de la aplicación.

La lógica empresarial de una aplicación puede manejar directamente los documentos que consume o produce, lo que se denomina modelo de procesamiento centrado en documentos, si la lógica:

Se basa tanto en el contenido como en la estructura del documento.

Debe modificar puntualmente los documentos entrantes conservando la mayor parte de su forma original, incluidos los comentarios, las referencias a entidades externas, etc.

En un modelo de procesamiento centrado en documentos, el procesamiento de documentos puede estar entrelazado con la lógica comercial y, por lo tanto, puede introducir fuertes dependencias entre la lógica comercial y los esquemas de los documentos consumidos y producidos: el enfoque de "encuentro en el medio" ( discutido en “ Asignación de esquemas al modelo de datos de la aplicación ” en la página 143 ) puede, sin embargo, aliviar este problema. Además, el modelo de procesamiento centrado en documentos no promueve una separación clara entre el negocio y las habilidades de programación XML, especialmente cuando un desarrollador de aplicaciones que está más enfocado en la implementación de la lógica comercial debe dominar adicionalmente una o varias de las API de procesamiento XML.

Hay casos que requieren un modelo de procesamiento centrado en documentos, como por ejemplo:

El esquema de los documentos procesados ​​solo se conoce parcialmente y, por lo tanto, no se puede vincular por completo a objetos específicos del dominio; la aplicación edita solo la parte conocida de los documentos antes de enviarlos para su posterior procesamiento.

Debido a que los esquemas de los documentos procesados ​​pueden variar o cambiar mucho, no es posible codificar o generar el enlace de los documentos a objetos específicos del dominio; se requiere una solución más flexible, como una que use DOM con XPath.

Un ejemplo típico centrado en documentos es una aplicación que implementa un flujo de trabajo basado en datos: cada etapa del flujo de trabajo procesa solo información específica del contenido del documento entrante y no hay una representación central del contenido de los documentos entrantes. Una etapa del flujo de trabajo puede recibir un documento de una etapa anterior, extraer información del documento, aplicar alguna lógica comercial en la información extraída y, potencialmente, modificar el documento antes de enviarlo a la siguiente etapa.

Por lo general, es mejor que la lógica empresarial de la aplicación maneje directamente los documentos solo en situaciones excepcionales y hacerlo con mucho cuidado. En su lugar, debe considerar aplicar la lógica comercial de la aplicación en objetos específicos del dominio que encapsulen total o parcialmente el contenido de los documentos consumidos o producidos. Esto ayuda a aislar la lógica comercial de los detalles del procesamiento XML.

Tenga en cuenta que las clases derivadas de esquemas, que son generadas por JAXB y otras tecnologías de enlace de datos XML (consulte “ Modelo de programación de enlace de datos XML ” en la página 169), normalmente encapsulan completamente el contenido de un documento. Si bien estas clases derivadas de esquemas aíslan la lógica empresarial de los detalles de procesamiento XML (específicamente el análisis, la validación y la creación de documentos XML), siguen introduciendo fuertes dependencias entre la lógica empresarial y los esquemas de los documentos consumidos y producidos. Debido a estas fuertes dependencias, y debido a que aún pueden conservar algunas características centradas en documentos (especialmente restricciones), las aplicaciones aún pueden considerarse centradas en documentos cuando aplican la lógica comercial directamente en las clases generadas por tecnologías de enlace de datos XML a partir de los esquemas de consumo y consumo. documentos elaborados. Para cambiar a un modelo centrado en objetos puro, el desarrollador puede reducir las dependencias de los esquemas asignando objetos derivados del esquema a objetos específicos del dominio. Las clases de objetos específicas del dominio exponen una interfaz constante y consistente a la lógica empresarial, pero internamente delegan los detalles del procesamiento XML a las clases derivadas del esquema. En general, esta técnica reduce el acoplamiento entre la lógica comercial y el esquema de los documentos procesados. “Abstraer el procesamiento XML de la lógica de la aplicación ” en la página 155 analiza una técnica genérica para desacoplar la lógica comercial y el esquema de los documentos procesados.

Un modelo de procesamiento centrado en objetos puro requiere que los problemas relacionados con XML se mantengan en la periferia de una aplicación, es decir, en la capa de interacción del servicio web más cercana al extremo del servicio o, para aplicaciones más clásicas, en el nivel web. En este caso, XML sirve únicamente como medio de presentación adicional para las entradas y salidas de la aplicación. Cuando se implementa un flujo de trabajo orientado a documentos en la capa de procesamiento de un servicio web, o cuando se implementa la capa de interacción de servicios web asincrónicos presentada en “ Delegación de solicitudes de servicios web a la capa de procesamiento ” en la página 92 , aún se puede aplicar un modelo de procesamiento centrado en objetos. manteniendo los problemas relacionados con XML dentro de los beans controlados por mensajes que intercambian documentos.

Tenga en cuenta que los modelos de procesamiento centrados en objetos y documentos pueden no ser exclusivos entre sí. Cuando se usa la técnica de mapeo flexible mencionada anteriormente, una aplicación puede estar globalmente centrada en documentos e intercambiar documentos entre sus componentes, y algunos componentes pueden procesar localmente parte de los documentos utilizando un modelo de procesamiento centrado en objetos. Cada componente puede utilizar el modelo de procesamiento más adecuado para realizar su función.

4.3.6. Fragmentación de documentos XML entrantes
Cuando la lógica comercial de su servicio opera en el contenido de un documento XML entrante, es una buena idea dividir los documentos XML en fragmentos lógicos cuando corresponda. La lógica de procesamiento recibe un documento XML que contiene toda la información para procesar una solicitud. Sin embargo, el documento XML suele tener segmentos bien definidos para diferentes entidades, y cada segmento contiene los detalles sobre una entidad específica.

En lugar de pasar el documento completo a diferentes componentes que manejan varias etapas del proceso comercial, es mejor si la lógica de procesamiento divide el documento en fragmentos y pasa solo los fragmentos necesarios a otros componentes o servicios que implementan partes de la lógica del proceso comercial.

Figura 4.9muestra cómo la capa de procesamiento podría procesar un documento XML que representa una orden de compra entrante para un servicio web de agencia de viajes. El documento contiene detalles como información de la cuenta, datos de la tarjeta de crédito, destinos de viaje, fechas, etc. La lógica comercial implica verificar la cuenta, autorizar la tarjeta de crédito y completar las partes de la orden de compra de la aerolínea y el hotel. No es necesario pasar todos los detalles del documento a una etapa del proceso comercial que solo realiza una parte del proceso comercial, como la verificación de la cuenta. Pasar el documento XML completo a todas las etapas del proceso comercial da como resultado flujos de información innecesarios y procesamiento adicional. Es más eficiente extraer los fragmentos lógicos: fragmento de cuenta, fragmento de tarjeta de crédito,

Figura 4.9. Fragmentación de un documento XML entrante para un servicio de viajes



Si bien es complementaria a la mayoría de las estrategias de diseño de mapas presentadas en “ Estrategias de diseño de mapas ” en la página 143 , esta técnica se compara mejor con la estrategia de diseño de mapas flexible. (Consulte “ Asignación flexible ” en la página 148.) El mapeo flexible aboga por un enfoque de mapeo descentralizado: cada componente o etapa en un flujo de trabajo maneja el documento entrante completo, pero cada etapa solo procesa la parte apropiada del documento. Fragmentar un documento entrante puede verse como una implementación centralizada del diseño de mapeo flexible. Fragmentar un documento entrante, al suprimir el análisis redundante del documento entrante y limitar los intercambios entre etapas a los datos estrictamente relevantes, mejora el rendimiento en comparación con una implementación sencilla de mapeo flexible. Sin embargo, pierde algo de flexibilidad porque se requiere que la lógica de envío del flujo de trabajo conozca específicamente (y por lo tanto dependa de) los fragmentos y formatos de documentos esperados por las diferentes etapas.

Fragmentar un documento tiene los siguientes beneficios:

Evita el procesamiento adicional y el intercambio de información superflua a lo largo del flujo de trabajo.

Maximiza la privacidad porque limita el envío de información confidencial a través del flujo de trabajo.

Centraliza algunas de las tareas de procesamiento XML del flujo de trabajo y, por lo tanto, simplifica la implementación general del flujo de trabajo.

Proporciona una mayor flexibilidad para el manejo de errores del flujo de trabajo, ya que cada etapa maneja solo los errores relacionados con la lógica comercial, mientras que la lógica de envío del flujo de trabajo maneja el análisis de documentos y los errores de validación.

4.3.7. Abstracción del procesamiento XML de la lógica de la aplicación
Como se mencionó anteriormente, el desarrollador de una aplicación basada en XML y, más específicamente, de una aplicación de servicio web, puede tener que manejar XML explícitamente en las siguientes capas de la aplicación:

En la capa de interacción de un servicio web para aplicar algún procesamiento previo o posterior, como la validación y transformación de XML a los documentos intercambiados. (Consulte “ Recepción de solicitudes ” en la página 89 y “ Formulación de respuestas ” en la página 98 ). Además, cuando la capa de procesamiento de un servicio web implementa un modelo de procesamiento centrado en objetos, es posible que la capa de interacción deba asignar documentos XML hacia o desde objetos específicos del dominio antes de delegar a la capa de procesamiento utilizando uno de los tres enfoques para asignar esquemas XML al modelo de datos de la aplicación presentado en “ Asignación de esquemas al modelo de datos de la aplicación ” en la página 143 .

En la capa de procesamiento de un servicio web al implementar un modelo de procesamiento centrado en documentos. (Consulte “ Manejo de documentos XML en un servicio web ” en la página 105 ). En tal caso, la capa de procesamiento puede usar técnicas como el mapeo flexible o la creación de componentes XML. Consulte “ Asignación flexible ” en la página 148 y “ Componentización XML ” en la página 149 .

Con el modelo de procesamiento centrado en objetos, cuando el contenido del documento XML se asigna a objetos específicos del dominio, la aplicación aplica su lógica de negocios a los objetos específicos del dominio en lugar de a los documentos. En este caso, solo la lógica de interacción puede manejar documentos. Sin embargo, en el modelo centrado en documentos, la propia lógica empresarial de la aplicación puede tener que manejar directamente los documentos. En otras palabras, algunos aspectos del modelo de negocios pueden expresarse en términos de los documentos a manejar.

Hay inconvenientes en expresar el modelo de negocio en términos de los documentos a manejar. Si lo hace, puede saturar la lógica comercial con lógica relacionada con el procesamiento de documentos, que debe ocultarse a los desarrolladores de aplicaciones que están más enfocados en la implementación de la lógica comercial. También introduce fuertes dependencias entre los esquemas del documento y la lógica de negocios, y esto puede causar problemas de mantenimiento, particularmente cuando se manejan esquemas adicionales o cuando se admiten nuevas versiones de un esquema original (aunque esos son solo esquemas internos a los que se han adaptado los documentos que originalmente se ajustaban a esquemas externos). sido convertido). Además, dado que hay una variedad de API que admiten varios modelos de procesamiento de XML, dicho diseño puede bloquear al desarrollador en una API de procesamiento de XML en particular. Puede que lo haga difícil,

Las mismas preocupaciones sobre la mantenibilidad frente a la evolución y la variedad de modelos de procesamiento XML o API se aplican hasta cierto punto a la lógica de la capa de interacción del servicio web, que puede estar a cargo de validar los documentos intercambiados, transformándolos a partir de esquemas externos. a esquemas internos y, en algunos casos, asignándolos a objetos específicos del dominio.

Por ejemplo, considere un sistema que procesa una orden de compra que envía la orden al almacén de un proveedor. El proveedor, para procesar el pedido, puede necesitar traducir el pedido de compra entrante del esquema externo acordado (como un esquema basado en XSD) a un esquema de pedido de compra interno diferente (como un esquema basado en DTD) sostenido por sus componentes. Además, es posible que el proveedor desee asignar el documento de orden de compra a un objeto comercial de orden de compra. La lógica comercial que maneja la orden de compra entrante debe usar una API de procesamiento XML para extraer la información del documento y asignarla a la entidad de la orden de compra. En tal caso, la lógica comercial puede mezclarse con la lógica de manejo de documentos. Si el esquema de pedido de compra externo evoluciona o si es necesario admitir un esquema de pedido de compra adicional, la lógica empresarial se verá afectada. Del mismo modo, si por motivos de rendimiento se le pide que vuelva a visitar su elección de la API de procesamiento de XML, la lógica empresarial también se verá afectada. La elección inicial de la API de procesamiento de XML puede dificultar la integración de otros componentes que necesitan recuperar parte o la totalidad del documento de pedido de compra de la entidad de pedido de compra.

El diseño que se muestra en la figura 4.10 , al que nos referimos como el diseño del editor de documentos XML (XDE), separa la lógica de la aplicación (lógica comercial o de interacción) de la lógica de procesamiento de documentos. Seguir un diseño como este ayuda a evitar los problemas que se acaban de describir.

Figura 4.10. Diseño básico de un editor de documentos XML
[Ver imagen a tamaño completo]


El término "Editor" que se usa aquí se refiere a la capacidad de crear, acceder y modificar mediante programación, es decir, editar, documentos XML. El diseño del editor de documentos XML es similar a la estrategia de diseño de objetos de acceso a datos, que abstrae el código de acceso a la base de datos de la lógica empresarial de un bean.

El editor de documentos XML implementa el procesamiento de documentos XML utilizando la API más relevante, pero expone solo los métodos relevantes para la lógica de la aplicación. Además, el editor de documentos XML debe proporcionar métodos para configurar u obtener documentos para que se procesen, pero no debe exponer la API de procesamiento XML subyacente. Estos métodos deben usar la clase Source abstracta (y Resultclass) de la API JAXP, de forma similar a JAX-RPC, para asegurarse de que la API de procesamiento XML subyacente permanezca oculta. Si los requisitos cambian, puede cambiar fácilmente a una técnica de procesamiento XML diferente sin modificar la lógica de la aplicación. Además, un objeto comercial (como un bean empresarial) que procesa documentos XML a través de un editor de documentos XML solo debe exponer métodos de acceso que usen el origen o el resultado abstractos de JAXP.clase. Además, un objeto comercial o un punto final de servicio puede usar diferentes estrategias de diseño de editor de documentos XML, combinadas con otras estrategias para crear métodos de fábrica o fábricas abstractas (estrategias para crear nuevos objetos donde la creación de instancias de esos objetos se transfiere a una subclase), para uniformar manipular documentos que se ajustan a diferentes esquemas. El objeto comercial puede invocar una clase de fábrica para crear instancias de diferentes implementaciones del editor de documentos XML según el esquema del documento procesado. Este es un enfoque alternativo para aplicar transformaciones para admitir varios esquemas externos.

La Figura 4.10 muestra el diagrama de clases para un diseño de editor de documentos XML básico, mientras que la Figura 4.11 muestra el diagrama de clases para un diseño de fábrica de editor de documentos XML. Debería considerar usar un diseño similar en las siguientes situaciones:

Cuando desee mantener los objetos comerciales enfocados en la lógica comercial y mantener el código para interactuar con documentos XML separados del código de lógica comercial.

De manera similar, cuando desee mantener los extremos del servicio web enfocados en la lógica de interacción y mantener el código para el procesamiento previo y posterior de los documentos XML separado del código de lógica de interacción.

Cuando desee implementar un diseño de mapeo flexible donde cada componente pueda manipular un documento común de la manera más adecuada para sí mismo.

Cuando los requisitos pueden evolucionar (como un nuevo esquema que se admitirá o una nueva versión del mismo esquema) hasta el punto en que requieran cambios en la implementación del procesamiento XML. Por lo general, no desea modificar la lógica de la aplicación para adaptarse a estos cambios de procesamiento XML. Además, dado que varias API de procesamiento XML (tecnología SAX, DOM, XSLT, JAXB, etc.) pueden ser relevantes, desea permitir cambios posteriores para abordar problemas como el rendimiento y la integración.

Cuando existen diferentes conjuntos de habilidades de desarrollador. Por ejemplo, es posible que desee que los expertos en procesamiento de XML y dominio empresarial trabajen de forma independiente. O bien, es posible que desee aprovechar conjuntos de habilidades particulares dentro de las técnicas de procesamiento de XML.

Figura 4.11. Factory Design para crear editores de documentos XML específicos de esquemas
[Ver imagen a tamaño completo]


La figura 4.12 y el ejemplo de código 4.9 brindan un ejemplo de un punto final de servicio web de un proveedor que utiliza un editor de documentos XML para preprocesar documentos de órdenes de compra entrantes.

Ejemplo de código 4.9. Punto final de servicio de proveedor mediante el editor de documentos XML
clase pública ProviderOrderXDE se extiende
          Editor de documentos XML.DefaultXDE {
   Cadena final estática pública DEFAULT_ENCODING = "UTF-8";
   fuente privada fuente = nulo;
   cadena privada orderId = nulo;


   public ProviderOrderXDE(validación booleana, ...) {
      // Inicializar la lógica de procesamiento XML
   }
   // Establece el documento a procesar
   public void setDocument(Source source) throws... {
      esta.fuente = fuente;
   }
   // Invoca la lógica de procesamiento XML para validar el documento de origen, 
						// extrae su ID de pedido, lo transforma en un formato diferente, 
						// y copia el documento resultante en el objeto Result
   copyDocument public void (resultado del resultado) arroja ... {
      ID de pedido = nulo;
      // procesamiento XML...
   }
   // Devuelve el documento procesado como un objeto de origen
   fuente pública getDocument() arroja ... {
      devuelve nuevo StreamSource (nuevo StringReader (
          getDocumentAsString()));
   }
   // Devuelve el documento procesado como un objeto String
   public String getDocumentAsString() lanza ... {
      flujo ByteArrayOutputStream = nuevo ByteArrayOutputStream();
      copyDocument(nuevo StreamResult(flujo));
      volver stream.toString(DEFAULT_ENCODING);
   }
   // Devuelve el valor de orderId extraído del documento fuente
   cadena pública getOrderId() {
      devolver ID de pedido;
   }
}

Para resumir, se recomienda que utilice un diseño similar al Editor de documentos XML presentado anteriormente para abstraer y encapsular todo el procesamiento de documentos XML. A su vez, el punto final de servicio o objeto de negocio que usa dicho editor de documentos solo invoca la API simple proporcionada por el editor de documentos. Esto oculta todas las complejidades y detalles de la interacción con el documento XML de los clientes de objetos comerciales.

Figura 4.12. Diagrama de clase del servicio del proveedor mediante el editor de documentos XML
[Ver imagen a tamaño completo]


Como se señaló anteriormente, este diseño no se limita al modelo de procesamiento centrado en documentos donde la aplicación aplica su lógica comercial en el documento mismo. En un modelo de procesamiento centrado en objetos, los editores de documentos pueden ser utilizados por la capa de interacción del servicio web más cercana al extremo del servicio para validar, transformar y asignar documentos hacia o desde objetos específicos del dominio. En este caso, el uso del editor de documentos aísla la lógica de interacción de la lógica de procesamiento XML.

4.3.8. Resumen de recomendaciones de diseño
Cuando diseña una aplicación basada en XML, específicamente una que es un servicio web, debe tomar ciertas decisiones relacionadas con el procesamiento del contenido de los documentos XML entrantes. Esencialmente, usted decide el "cómo, dónde y qué" del procesamiento: usted decide la tecnología que utilizará para este proceso, dónde realizar el procesamiento y la forma del contenido del procesamiento.

En resumen, ten en cuenta las siguientes recomendaciones:

Al diseñar esquemas específicos de aplicaciones, promueva la reutilización, la modularización y la extensibilidad, y aproveche los esquemas verticales y horizontales existentes.

Al implementar un modelo de procesamiento centrado en objetos puro, mantenga XML en el límite de su sistema tanto como sea posible, es decir, en la capa de interacción del servicio web más cercana al extremo del servicio o, para aplicaciones más clásicas, en la capa de presentación. Asigne el contenido del documento a objetos específicos del dominio lo antes posible.

Cuando implemente un modelo de procesamiento centrado en documentos, considere usar la técnica de mapeo flexible. Esta técnica permite que los diferentes componentes de su aplicación manejen XML de la manera más apropiada para cada uno de ellos.

Considere seriamente la validación en los puntos de entrada al sistema de su modelo de procesamiento, específicamente, la validación de documentos de entrada donde la fuente no es confiable.

Al consumir o producir documentos, en la medida de lo posible exprese sus documentos en términos de objetos de origen y resultado abstractos que sean independientes de la API de procesamiento XML real que está utilizando.

Considere una estrategia de diseño de mapeo de "reunión en el medio" cuando desee desacoplar el modelo de datos de la aplicación del esquema externo que desea admitir.

Procesamiento XML abstracto del procesamiento de la lógica de negocios utilizando la estrategia de diseño del editor de documentos XML. Esto promueve la separación de habilidades y la independencia de la API real utilizada.


## 4.4. Implementación de aplicaciones basadas en XML
Debe tomar algunas decisiones al formular la implementación de una aplicación basada en XML. En resumen, debe elegir los modelos de programación XML para su aplicación. Tenga en cuenta que hay varios modelos de programación disponibles y estos modelos pueden ser relevantes para diferentes situaciones; los modelos pueden ser complementarios o incluso competidores. Como tal, su aplicación puede usar diferentes modelos, a veces incluso en conjunto. Es decir, es posible que deba combinar modelos de programación en lo que se puede denominar canalizaciones de procesamiento XML.

Es posible que también deba considerar y abordar otros problemas. Por ejemplo, es posible que deba determinar cómo resolver las referencias a entidades externas de manera uniforme en toda su aplicación, independientemente de los modelos de programación utilizados.

4.4.1. Elegir un modelo de programación de procesamiento XML
Un desarrollador J2EE puede elegir entre cuatro modelos principales de procesamiento XML, disponibles a través de las siguientes API:

Simple API for XML Parsing (SAX), que proporciona un modelo de programación basado en eventos

Modelo de objeto de documento (DOM), que proporciona un modelo de programación de recorrido de árbol en memoria

Enlace de datos XML, que proporciona un modelo de programación enlazado a clases de contenido Java en memoria

Transformaciones de lenguaje de hoja de estilo extensible (XSLT), que proporciona un modelo de programación basado en plantillas

Los modelos de procesamiento más comunes son SAX y DOM. Estos dos modelos junto con XSLT están disponibles a través de las API de JAXP. (Consulte “ API de Java para el procesamiento de XML ” en la página 41 ). El modelo de enlace de datos XML está disponible a través de la tecnología JAXB. (Consulte “ Estándares emergentes ” en la página 40 ).

El procesamiento de un documento XML se divide en dos categorías. No solo abarca el análisis de un documento XML de origen para que el contenido esté disponible de alguna forma para que una aplicación lo procese, el procesamiento también implica escribir o producir un documento XML a partir del contenido generado por una aplicación. El análisis de una representación XML en una estructura de datos equivalente utilizable por una aplicación a menudo se denomina deserialización o desorganización. De manera similar, escribir una estructura de datos en una representación XML equivalente a menudo se denomina serialización o clasificación. Algunos modelos de procesamiento admiten ambos tipos de procesamiento, pero otros, como SAX, no.

Así como evitaría analizar manualmente documentos XML, debe evitar construir documentos XML manualmente. Es mejor confiar en API confiables de nivel superior (como DOM y API similares a DOM, o tecnología JAXB) para construir documentos XML, porque estas API imponen la construcción de documentos bien formados. En algunos casos, estas API también le permiten validar documentos XML construidos.

Ahora echemos un vistazo más de cerca a estas API de procesamiento XML.

4.4.1.1. Modelo de programación SAX
Cuando usa SAX para procesar un documento XML, debe implementar controladores de eventos para manejar los eventos generados por el analizador cuando encuentra los diversos tokens del lenguaje de marcado. Debido a que un analizador SAX genera un flujo transitorio de estos eventos, se recomienda procesar el documento de origen de la siguiente manera. Interceptar el tipo relevante de los eventos generados por el analizador. Puede usar la información pasada como parámetros de los eventos para ayudar a identificar la información relevante que debe extraerse del documento de origen. Una vez extraído del documento, la lógica de la aplicación puede procesar la información.

Por lo general, con el procesamiento SAX, es posible que una aplicación deba mantener algún contexto para que pueda agregar o consolidar lógicamente la información del flujo de eventos. Esta consolidación suele realizarse antes de invocar o aplicar la lógica de la aplicación. El desarrollador tiene dos opciones cuando utiliza el procesamiento SAX:

La aplicación puede invocar "sobre la marcha" la lógica empresarial sobre la información extraída. Es decir, la lógica se invoca tan pronto como se extrae la información o después de una consolidación mínima. Con este enfoque, denominado procesamiento continuo, el documento se puede procesar en un solo paso.

La aplicación invoca la lógica empresarial después de que completa el análisis del documento y ha consolidado por completo la información extraída. Este enfoque requiere dos pasos para procesar un documento.

Tenga en cuenta que a lo que nos referimos como información consolidada pueden ser, de hecho, objetos específicos del dominio que se pueden pasar directamente a la lógica empresarial.

El procesamiento de secuencias (el primer enfoque) permite que una aplicación comience a procesar inmediatamente el contenido de un documento de origen. La aplicación no solo no tiene que esperar a que se analice todo el documento, sino que, en algunas configuraciones, la aplicación no tiene que esperar a que se recupere todo el documento. Esto incluye recuperar el documento de una etapa de procesamiento anterior al implementar canalizaciones, o incluso recuperar el documento de la red al intercambiar documentos entre aplicaciones.

El procesamiento de secuencias, si bien ofrece algunas ventajas de rendimiento, también tiene algunas dificultades y problemas que deben tenerse en cuenta. Por ejemplo, un documento puede parecer bien formado e incluso válido para la mayor parte del procesamiento. Sin embargo, puede haber errores inesperados al final del documento que hagan que el documento se rompa o no sea válido. Una aplicación que usa el procesamiento de flujo nota estos problemas solo cuando se encuentra con tokens erróneos o cuando no puede resolver una referencia de entidad. O bien, la aplicación puede darse cuenta de que el documento está roto si la secuencia de entrada desde la que está leyendo el documento se cierra inesperadamente, como ocurre con una excepción de fin de archivo. Por lo tanto, una aplicación que desee implementar un modelo de procesamiento de flujo puede tener que realizar el análisis del documento y la lógica comercial de la aplicación dentro del contexto de una transacción.

Con el segundo enfoque, el análisis del documento y la aplicación de la lógica comercial se realizan en dos pasos separados. Antes de invocar la lógica comercial de la aplicación, la aplicación primero se asegura de que el documento y la información extraída del documento sean válidos. Una vez que se validan los datos del documento, la aplicación invoca la lógica comercial, que puede ejecutarse dentro de una transacción si es necesario.

El modelo de programación SAX no proporciona ninguna facilidad para producir documentos XML. Sin embargo, todavía es posible generar un documento XML iniciando una secuencia de eventos debidamente equilibrada (llamadas a métodos) en un controlador de serialización personalizado. El controlador intercepta los eventos y, mediante una operación de transformación de identidad XSLT, escribe los eventos en la sintaxis XML correspondiente. La dificultad para el desarrollador de aplicaciones radica en generar una secuencia de eventos debidamente equilibrada. Sin embargo, tenga en cuenta que la generación de esta secuencia de eventos es propensa a errores y debe considerarse solo con fines de rendimiento.

SAX generalmente es muy conveniente para extraer información de un documento XML. También es muy conveniente para el mapeo de datos cuando la estructura del documento se mapea bien con los objetos específicos del dominio de la aplicación; esto es especialmente cierto cuando solo se va a mapear una parte del documento. El uso de SAX tiene la ventaja adicional de evitar la creación de una representación intermedia que consuma recursos. Finalmente, SAX es bueno para implementar el procesamiento de flujo donde se invoca la lógica empresarial en medio del procesamiento de documentos. Sin embargo, SAX puede ser tedioso de usar para documentos más complejos que necesitan administrar un contexto sofisticado y, en estos casos, a los desarrolladores les puede resultar mejor usar DOM o JAXB.

En resumen, considere usar el modelo de procesamiento SAX cuando se dé alguna de las siguientes circunstancias:

Está familiarizado con la programación basada en eventos.

Tu aplicación solo consume documentos sin hacerles modificaciones estructurales.

El documento solo debe ser procesado una vez.

Tiene que extraer y procesar efectivamente solo partes del documento.

El uso de la memoria es un problema o los documentos pueden ser potencialmente muy grandes.

Desea implementar un procesamiento de flujo de alto rendimiento, como para tratar con documentos muy grandes.

La estructura de un documento y el orden de su información corresponden bien a los objetos específicos del dominio o corresponden al orden en el que se deben invocar los métodos discretos de la lógica de la aplicación. De lo contrario, es posible que deba mantener contextos bastante complicados.

Tenga en cuenta que el modelo SAX puede no ser el mejor candidato para los desarrolladores de aplicaciones que están más preocupados por implementar la lógica empresarial.

4.4.1.2. Modelo de programación DOM
Con el modelo de programación DOM, escribe código para atravesar una estructura de datos en forma de árbol creada por el analizador a partir del documento de origen. Normalmente, el procesamiento de los datos de entrada XML se realiza en un mínimo de dos pasos, de la siguiente manera:

1.
El analizador DOM crea una estructura de datos en forma de árbol que modela el documento fuente XML. Esta estructura se llama árbol DOM.

2.
El código de la aplicación recorre el árbol DOM en busca de información relevante que extrae, consolida y procesa aún más. Los desarrolladores pueden usar información consolidada para crear objetos específicos de dominio. El ciclo de búsqueda, extracción y procesamiento de la información puede repetirse tantas veces como sea necesario porque el árbol DOM persiste en la memoria.

Existen limitaciones en el modelo DOM. DOM fue diseñado para ser una interfaz neutral tanto en plataforma como en lenguaje. Debido a esto, el enlace Java de la API DOM no es particularmente compatible con Java. Por ejemplo, el enlace no utiliza la API java.util.Collection . En general, DOM es un poco más fácil de usar que el modelo SAX. Sin embargo, debido a la incomodidad del enlace Java de DOM, los desarrolladores de aplicaciones que se enfocan en la implementación de la lógica comercial aún pueden encontrar DOM difícil de usar de manera efectiva. Por esta razón, al igual que con SAX, los desarrolladores de aplicaciones deben protegerse tanto como sea posible del modelo DOM.

Además, la API de DOM anterior a la versión de nivel 3 no admite la serialización de árboles DOM a XML. Aunque algunas implementaciones proporcionan funciones de serialización, estas funciones no son estándar. Por lo tanto, los desarrolladores deberían confiar en cambio en las transformaciones de identidad XSLT, que proporcionan una forma estándar de lograr la serialización de vuelta a XML.

Los desarrolladores de Java también pueden usar otras tecnologías, como JDOM y dom4j, que tienen una funcionalidad similar a DOM. Las API de estas tecnologías tienden a ser más compatibles con Java que DOM, además de que interactúan bien con JAXP. Proporcionan un modelo de procesamiento más elaborado que puede aliviar algunos de los problemas inherentes de DOM, como su alto uso de memoria y la limitación de procesar el contenido del documento solo después de que se haya analizado un documento.

Aunque aún no es estándar para la plataforma Java (no hasta JAXP 1.3), la API Xpath permite usarla junto con el modelo de programación DOM. (La API Xpath se puede encontrar junto con algunas implementaciones DOM como Xerces o dom4j). Los desarrolladores usan Xpath para ubicar y extraer información del árbol DOM de un documento fuente. Al permitir que los desarrolladores especifiquen patrones de ruta para ubicar el contenido de los elementos, los valores de los atributos y los subárboles, Xpath no solo simplifica en gran medida, sino que incluso puede eliminar el código transversal del árbol. Dado que las expresiones XPath son cadenas, se pueden parametrizar y externalizar fácilmente en un archivo de configuración. Como resultado, los desarrolladores pueden crear programas de procesamiento de documentos más genéricos o reutilizables.

En resumen, considere usar DOM cuando se dé alguna de estas circunstancias:

Quiere consumir o producir documentos.

Desea manipular documentos y necesita un control detallado sobre la estructura del documento que desea crear o editar.

Desea procesar el documento más de una vez.

Desea acceso aleatorio a partes del documento. Por ejemplo, es posible que desee desplazarse hacia adelante y hacia atrás dentro del documento.

El uso de la memoria no es un gran problema.

Desea implementar el enlace de datos pero no puede utilizar la tecnología JAXB porque el documento no tiene esquema o se ajusta a una definición de esquema DTD en lugar de a una definición de esquema XSD. El documento también puede ser demasiado complejo para usar SAX para implementar el enlace de datos. (Consulte “ Modelo de programación SAX ” en la página 165 ).

Desea beneficiarse de la flexibilidad de Xpath y aplicar expresiones Xpath en árboles DOM.

4.4.1.3. Modelo de programación de enlace de datos XML
El modelo de programación de enlace de datos XML, a diferencia de los modelos SAX y DOM, permite al desarrollador programar el procesamiento del contenido de un documento XML sin preocuparse por las representaciones de documentos XML (conjuntos de información).

Utilizando un compilador de vinculación, el modelo de programación de vinculación de datos XML, tal como lo implementa JAXB, vincula los componentes de un esquema XSD de origen a las clases de contenido de Java derivadas del esquema. JAXB vincula un espacio de nombres XML a un paquete Java. Los documentos de instancia de esquema XSD se pueden descomponer en un árbol de objetos Java (denominado árbol de contenido), que son instancias de las clases de contenido Java generadas al compilar el esquema. Las aplicaciones pueden acceder al contenido de los documentos de origen utilizando métodos de acceso get y set al estilo JavaBeans. Además, puede crear o editar un árbol de contenido en memoria y luego combinarlo en una instancia de documento XML del esquema de origen. Ya sea ordenando o no ordenando, el desarrollador puede aplicar la validación para garantizar que el documento de origen o el documento que se va a generar satisfagan las restricciones expresadas en el esquema de origen.

Los pasos para usar clases derivadas de esquemas de tecnología JAXB para procesar un documento XML entrante son muy simples y son los siguientes:

1.
Configure el contexto JAXB ( JAXBContext ) con la lista de paquetes derivados del esquema que se utilizan para descomponer los documentos.

2.
Desmarque un documento XML en un árbol de contenido. La validación del documento se realiza si está habilitado por la aplicación.

3.
A continuación, puede aplicar directamente la lógica de la aplicación al árbol de contenido. O bien, puede extraer y consolidar información del árbol de contenido y luego aplicar la lógica de la aplicación en la información consolidada. Como se describe más adelante, esta información consolidada puede muy bien ser objetos específicos del dominio que pueden exponer una interfaz independiente del esquema más adecuada.

Este modelo de programación también admite la serialización en XML o la clasificación de un árbol de contenido en un formato XML. Marshalling de un documento tiene los siguientes pasos:

1.
Modifique un árbol de contenido existente o cree un nuevo árbol a partir de la salida de la lógica empresarial de la aplicación.

2.
Opcionalmente, valide en memoria el árbol de contenido contra el esquema de origen. La validación se realiza en memoria y se puede aplicar independientemente del proceso de clasificación.

3.
Ordene el árbol de contenido en un documento XML.

Hay varias formas en que un desarrollador puede diseñar una aplicación con las clases derivadas del esquema que genera JAXB:

El desarrollador puede usarlos directamente en la lógica empresarial, pero, como se indica en “ Elección de modelos de procesamiento ” en la página 151 , esto vincula estrechamente la lógica empresarial a los esquemas a partir de los cuales se generaron las clases. Este tipo de uso comparte la mayoría de los problemas de un modelo de procesamiento centrado en documentos.

El desarrollador puede usar las clases derivadas del esquema junto con un modelo de procesamiento centrado en objetos:

El desarrollador puede diseñar clases específicas de dominio cuyas instancias se completarán a partir de los objetos de contenido creados al desarmar un documento XML y viceversa.

El desarrollador puede diseñar clases específicas de dominio, que heredan de las clases derivadas del esquema, y ​​definir métodos adicionales orientados al dominio. El problema de este diseño es que estas clases están estrechamente relacionadas con la implementación de las clases derivadas del esquema y también pueden exponer los métodos de las clases derivadas del esquema como parte de la clase específica del dominio. Además, como efecto secundario, si el desarrollador no tiene cuidado, esto puede provocar que la lógica empresarial se vincule estrechamente a los esquemas a partir de los cuales se generaron las clases.

El desarrollador puede usar agregación o composición y diseñar clases específicas de dominio que solo expongan métodos orientados al dominio y deleguen a las clases derivadas del esquema. Dado que las clases específicas del dominio solo dependen de las interfaces de las clases derivadas del esquema, es posible que las interfaces de las clases específicas del dominio no sean tan sensibles a los cambios en el esquema original.

Tenga en cuenta que cuando no se dispone de un esquema bien definido o variable en naturaleza (resumen) o en número (incluidas las nuevas revisiones del esquema), JAXB puede ser engorroso de usar debido al estrecho acoplamiento entre los esquemas y las clases derivadas del esquema. También tenga en cuenta que cuanto más abstracto es el esquema, menos efectivo es el enlace.

Considere usar el modelo de programación de enlace de datos XML, como JAXB, cuando tenga alguna de las siguientes condiciones:

Quiere tratar directamente con objetos simples de Java y no le importa ni quiere manejar la representación de documentos.

Estás consumiendo o produciendo documentos.

No necesita mantener algunos aspectos de un documento, como comentarios y referencias a entidades. La especificación JAXB no requiere dar acceso a la representación del documento subyacente (conjunto de información). Por ejemplo, la implementación de referencia de JAXB se basa en SAX 2.0 y, por lo tanto, no mantiene una representación de documento subyacente. Sin embargo, otras implementaciones pueden superponerse a una representación DOM. Un desarrollador puede recurrir a esta representación DOM para acceder a elementos del conjunto de información no expuestos.

Desea procesar el árbol de contenido más de una vez.

Desea acceso aleatorio a partes del documento. Por ejemplo, es posible que desee desplazarse hacia adelante y hacia atrás dentro del documento.

El uso de la memoria puede ser un problema menor. Una implementación JAXB, como la implementación estándar, crea una representación Java del contenido de un documento que es mucho más compacta que el árbol DOM equivalente. La implementación estándar se superpone a SAX 2.0 y no mantiene una representación subyacente adicional del documento de origen. Además, donde DOM representa todos los tipos numéricos de esquema XML como cadenas, la implementación estándar de JAXB asigna estos valores directamente a tipos de datos numéricos de Java mucho más compactos. Esto no solo usa menos memoria para representar el mismo contenido, el enfoque JAXB ahorra tiempo, porque no es necesario convertir entre las dos representaciones.

Anteriormente estaba implementando el enlace de datos XML manualmente con DOM y hay disponible una definición de esquema XSD.

4.4.1.4. Modelo de programación XSLT
XSLT es un modelo de procesamiento de nivel superior que los modelos de enlace de datos SAX, DOM y XML. Aunque los desarrolladores pueden imitar XSLT mediante la implementación de transformaciones mediante programación sobre SAX, DOM o el modelo de enlace de datos XML, XSLT no se compara con otros modelos de procesamiento y debe considerarse complementario, para usarse junto con estos otros modelos.

XSLT implementa un modelo declarativo funcional en lugar de un modelo de procedimiento. Esto requiere habilidades que son bastante diferentes de las habilidades de programación de Java. En su mayor parte, XSLT requiere que los desarrolladores codifiquen reglas o plantillas que se aplican cuando se encuentran patrones específicos en el documento de origen. La aplicación de las reglas agrega nuevos fragmentos o copia fragmentos del árbol de origen a un árbol de resultados. Los patrones se expresan en el lenguaje Xpath, que se utiliza para localizar y extraer información del documento de origen.

En lugar de escribir código Java (como con SAX, DOM y el modelo de enlace de datos XML), los desarrolladores que usan XSLT escriben principalmente hojas de estilo, que son en sí mismos documentos XML. (Sin embargo, invocar el motor XSLT requiere que el desarrollador escriba código Java). En comparación con los otros modelos de programación, la programación XSLT brinda a los desarrolladores el tipo de flexibilidad que viene con las secuencias de comandos. En una aplicación basada en XML, el procesamiento XSLT generalmente se usa junto con los otros tres modelos de procesamiento. La API XSLT disponible con JAXP proporciona una abstracción para el origen y el resultado de las transformaciones, lo que permite al desarrollador no solo la capacidad de encadenar transformaciones, sino también de interactuar con otros modelos de procesamiento, como la tecnología SAX, DOM y JAXB. Para interactuar con SAX y DOM, use las clases SAXSource ,SAXResultado , DOMFuentey DOMResult proporcionado por JAXP. Para interactuar con JAXB, use las clases JAXBSource y JAXBResult .

Por definición, XSLT admite no solo el procesamiento de documentos de entrada XML, sino que también puede generar documentos XML. (Otros métodos de salida incluyen texto, HTML, etc.). Tenga en cuenta que aunque la API de nivel 2 de la versión DOM no admite la serialización, es decir, la transformación de un árbol DOM en un documento XML, la implementación JAXP de XSLT aborda la serialización de un árbol DOM utilizando un transformador de identidad. Un transformador de identidad copia un árbol de origen en un árbol de resultados y aplica el método de salida especificado, resolviendo así el problema de serialización de una manera sencilla e independiente de la implementación. Por ejemplo, para la salida en XML, el método de salida se establece en xml . XSLT también se puede utilizar para serializar en XML desde árboles DOM, eventos SAX, etc.

Considere usar XSLT cuando se dé alguna de las siguientes circunstancias:

Desea cambiar la estructura, insertar, eliminar, renombrar o filtrar el contenido de un documento XML.

Es posible que tenga más de una transformación para el mismo documento. Aunque una transformación se puede codificar a mano con otra API, las transformaciones múltiples, debido a la naturaleza de secuencias de comandos de las hojas de estilo, se realizan mejor con transformaciones XSLT.

Tienes que realizar transformaciones complejas. Debido al modelo declarativo funcional de XSLT, es más fácil diseñar transformaciones complejas mediante la codificación de reglas o plantillas individuales que mediante la codificación de procedimientos.

Quiere tener la capacidad de ser flexible y dejar espacio para futuros cambios en los esquemas de los documentos que está procesando.

Desea procesar documentos que contienen una cantidad significativa de datos para minimizar la sobrecarga de rendimiento.

Necesita transformar un documento para una presentación no interactiva o en modo por lotes. La sobrecarga de rendimiento de la transformación suele ser un problema menor con las presentaciones no interactivas. Dicho documento podría ser una orden de compra o una factura, por ejemplo.

Debe admitir varios esquemas externos, pero desea programar internamente solo contra un esquema genérico (adaptador de esquema).

Desea promover la separación de habilidades entre los desarrolladores de hojas de estilo de transformación XML y los desarrolladores de lógica empresarial.

En general, cuando debe lidiar con presentaciones no interactivas o debe integrar varias fuentes de datos XML o realizar intercambios de datos XML.

4.4.1.5. Resumen de recomendaciones
En resumen, elige el modelo de programación y procesamiento de API de acuerdo a tus necesidades. Si necesita lidiar con el contenido y la estructura del documento, considere usar DOM y SAX porque brindan más información sobre el documento en sí que lo que suele proporcionar JAXB. Por otro lado, si su atención se centra más en los objetos reales orientados al dominio que representa el documento, considere usar JAXB, ya que JAXB oculta los detalles de desorganización, clasificación y validación del documento. Los desarrolladores deben usar JAXB (enlace de datos XML) si el contenido del documento tiene una representación en Java que la aplicación puede usar directamente (es decir, cerca de objetos específicos del dominio).

DOM, cuando se usa junto con XPath, puede ser una herramienta muy flexible y poderosa cuando el foco está en el contenido y la estructura del documento. DOM puede ser más flexible que JAXB cuando se trata de documentos cuyos esquemas no están bien definidos.

Finalmente, use XSLT para complementar los otros tres modelos de procesamiento, particularmente en una etapa de procesamiento previo o posterior.

La figura 4.13 resume los diferentes modelos de programación entre los que el desarrollador puede elegir y destaca las representaciones intermedias (que tienen un impacto directo en el rendimiento) implícitas en cada uno de ellos. La Tabla 4.1 resume las características de los tres modelos de programación XML más predominantes.

Figura 4.13. Modelos de Programación y Representaciones Intermediarias Implícitas
[Ver imagen a tamaño completo]


Tabla 4.1. Modelos de programación de enlace de datos DOM, SAX y XML
DOM	SAXÓFONO	Enlace de datos XML
Modelo transversal de árbol	Modelo basado en eventos	Modelo de árbol de contenido vinculado a Java
Acceso aleatorio (estructura de datos en memoria) mediante API genérica (independiente de la aplicación)	Acceso serial (flujo de eventos) usando parámetros pasados ​​a eventos	Acceso aleatorio (estructura de datos en memoria) utilizando accesores de estilo Java-Beans
Alto uso de memoria (el documento a menudo se carga por completo en la memoria, aunque algunas técnicas, como la creación diferida o diferida de nodos DOM, pueden reducir el uso de memoria).	Bajo uso de memoria (solo se generan eventos)	Uso de memoria intermedio (el documento a menudo se carga por completo en la memoria, pero la representación Java del documento es más efectiva que una representación DOM. Sin embargo, algunas implementaciones pueden implementar técnicas para reducir el uso de la memoria).
Para editar el documento (procesando la estructura de datos en memoria)	Para procesar partes del documento (manejo de eventos relevantes)	Para editar el documento (procesando la estructura de datos en memoria)
Para procesar varias veces (documento cargado en memoria)	Procesar el documento una sola vez (flujo transitorio de eventos)	Para procesar varias veces (documento cargado en memoria)
Procesando una vez finalizado el análisis	Procesamiento de secuencias (comience a procesar antes de que finalice el análisis e incluso antes de que el documento se lea por completo)	Procesando una vez finalizado el análisis

4.4.2. Combinación de técnicas de procesamiento XML
La API JAXP proporciona soporte para encadenar procesos XML: Las interfaces JAXP javax.xml.Source y javax.xml.Result constituyen un mecanismo estándar para encadenar procesos XML. Hay implementaciones de estas dos interfaces para DOM, SAX e incluso flujos; JAXB y otras tecnologías de procesamiento XML, como JDOM y dom4j, también brindan sus propias implementaciones.

Básicamente, los procesamientos XML se pueden encadenar según dos diseños:

El primer diseño envuelve el resultado de un paso de procesamiento en un objeto de origen que puede procesarse en el siguiente paso. Las técnicas de procesamiento XML que pueden producir una representación en memoria de sus resultados, como DOM y JAXB, se prestan a este diseño. Este diseño a menudo se denomina "secuencial por lotes" porque cada paso de procesamiento es relativamente independiente y cada uno se completa hasta que comienza el siguiente paso.

El segundo diseño, llamado "procesamiento de flujo" o "tuberías y filtros", crea una cadena de filtros y cada filtro implementa un paso de procesamiento. Las técnicas de procesamiento XML como SAX funcionan bien con este diseño.

Los dos diseños pueden, por supuesto, combinarse. Cuando se combinan, las transformaciones y las transformaciones de identidad se convierten en técnicas útiles para usar cuando el resultado de un paso de procesamiento no se puede envolver directamente en un objeto de origen compatible con el siguiente paso. JAXP también proporciona soporte para encadenar transformaciones con el uso de javax.xml.transform.sax.SAXTransformerFactory .

El ejemplo de código 4.10 ilustra una canalización de procesamiento XML que combina SAX y XSLT para validar un documento de orden de compra entrante, extraer sobre la marcha el identificador de orden de compra y transformar el documento entrante de su esquema externo basado en XSD a DTD interno. -esquema basado en el apoyo de la lógica de negocio. El código utiliza una cadena de filtros SAX como origen de una transformación. Alternativamente, el código podría haber usado SAXTransformerFactory para crear un org.xml.sax.XMLFilter para manejar la transformación y luego encadenarlo al XMLFilter personalizado , que extrae el identificador de la orden de compra.

Ejemplo de código 4.10. Combinación de SAX y XSLT para realizar pasos de procesamiento XML
clase pública ProviderOrderXDE se extiende
          Editor de documentos XML.DefaultXDE {
   Cadena final estática pública DEFAULT_ENCODING = "UTF-8";
   filtro XMLFilter privado;
   Transformador transformador privado;
   fuente privada fuente = nulo;
   cadena privada orderId = nulo;

   public ProviderOrderXDE(validación booleana, ...) {
      // Crear un analizador SAX [de validación]
      analizador SAXParser = ...;
      filtro = nuevo XMLFilterImpl(parser.getXMLReader()) {
         // Implementa un SAX XMLFilter que extrae el 
						valor del elemento OrderID // y lo asigna al atributo orderId
      };
      // Recuperar la hoja de estilo como flujo
      Flujo InputStream = ...;
      // Crear un transformador a partir de la hoja de estilo
      transformador = FábricaTransformador.nuevaInstancia()
         .newTransformer(nuevo StreamSource(flujo));
   }
   // Establece el documento a procesar
   public void setDocument(Source source) throws... {
      esta.fuente = fuente;
   }
   // Construye una canalización de procesamiento XML (encadenando un analizador SAX y 
						// un transformador de hoja de estilo) que valida el documento de origen 
						// extrae su ID de pedido, lo transforma en un formato diferente, 
						// y copia el documento resultante en el objeto Result
   copyDocument public void (resultado del resultado) arroja ... {
      ID de pedido = nulo;
      fuente de entrada fuente de entrada
         = SAXSource.sourceToInputSource(fuente);
      SAXSource saxSource = new SAXSource (filtro, fuente de entrada);
      transformer.transform(transformador, saxSource, resultado);
   }
   // Devuelve el documento procesado como un objeto de origen
   fuente pública getDocument() arroja ... {
      devuelve nuevo StreamSource (nuevo StringReader (
         getDocumentAsString()));
   }
   // Devuelve el documento procesado como un objeto String
   public String getDocumentAsString() lanza ... {
      flujo ByteArrayOutputStream = nuevo ByteArrayOutputStream();
      copyDocument(nuevo StreamResult(flujo));
      volver stream.toString(DEFAULT_ENCODING);
   }
   // Devuelve el valor de orderId extraído del documento fuente
   cadena pública getOrderId() {
      devolver ID de pedido;
   }
}

4.4.3. Resolución de la entidad
Como se mencionó anteriormente en este capítulo, los documentos XML pueden contener referencias a otros fragmentos XML externos. El análisis reemplaza las referencias con el contenido real de estos fragmentos externos. De manera similar, los esquemas XML pueden hacer referencia a definiciones de tipos externos, y también se debe acceder a estas definiciones para que el esquema se interprete completamente. (Esto es especialmente cierto si sigue las recomendaciones de diseño modular sugeridas en " Diseño de esquemas XML específicos de dominio " en la página 131.) En ambos casos, un procesador XML, en el curso del procesamiento de un documento o esquema, necesita encontrar el contenido de cualquier entidad externa a la que se refiera el documento o esquema. Este proceso de asignación de referencias de entidades externas a su ubicación física real se denomina resolución de entidades. Tenga en cuenta que la resolución de entidades se aplica recursivamente a referencias de entidades externas dentro de entidades externas analizadas.

La resolución de entidades es particularmente crítica para administrar los esquemas XML en los que se basa su aplicación. Como se indica en “ Validación de documentos XML ” en la página 139 , la integridad y la confiabilidad de su aplicación pueden depender de la validación de los documentos entrantes contra esquemas específicos, por lo general, los mismos esquemas utilizados para diseñar inicialmente su aplicación. Por lo general, su aplicación no puede permitirse que estos esquemas se modifiquen de ninguna manera, ya sea mediante modificaciones maliciosas o incluso revisiones legítimas. (Para las revisiones, debe evaluar como mínimo el impacto de una revisión en su aplicación).

Por lo tanto, es posible que desee conservar sus propias copias de los esquemas subyacentes a su aplicación y redirigir las referencias a estas copias. O es posible que desee redirigir tales referencias a repositorios confiables. Una resolución de entidad personalizada le permite implementar el mapeo deseado de referencias de entidades externas a ubicaciones físicas confiables reales. Además, implementar un catálogo de entidades, incluso tan simple como el que se presenta en el ejemplo de código 4.12—le brinda más flexibilidad para administrar los esquemas de los que depende su aplicación. Tenga en cuenta que para lograr nuestro objetivo general, el catálogo de entidades debe estar adecuadamente protegido. Además, la redirección de referencias a copias locales de los esquemas puede mejorar el rendimiento en comparación con la referencia a copias remotas, especialmente para referencias remotas a través de Internet. Como se describe en “ Reduzca el costo de hacer referencia a entidades externas ” en la página 189 , el rendimiento se puede mejorar aún más almacenando en memoria caché las entidades resueltas .

El ejemplo de código 4.11 ilustra un solucionador de entidades que implementa una interfaz desde la API de SAX ( org.xml.sax.EntityResolver ). El solucionador de entidades utiliza un catálogo de entidades simple para asignar referencias de entidades externas a ubicaciones reales. El catálogo de entidades simplemente se implementa como un archivo de propiedades que se puede cargar desde una URL (consulte el Ejemplo de código 4.12). Cuando se invoca, este resolutor de entidades primero intenta usar el catálogo para asignar el identificador público declarado o URI de la entidad externa a una ubicación física real. Si esto falla, es decir, si no se define una asignación en el catálogo para este identificador público o URI, la entidad de resolución utiliza el identificador del sistema declarado o la URL de la entidad externa para su ubicación física real. En ambos casos, el resolutor interpreta la ubicación física real como una URL o, como respaldo, como un recurso de Java accesible desde la ruta de clase de la clase de resolución de entidades. El último caso permite empaquetar esquemas XML junto con su código de procesamiento XML dependiente. Este empaquetado puede ser útil cuando debe garantizar absolutamente la coherencia entre el código de procesamiento XML y los esquemas.

Ejemplo de código 4.11. Resolución de entidades mediante un catálogo de entidades simple
clase pública CustomEntityResolver implementa EntityResolver {
   propiedades privadas EntityCatalog = null;

   CustomEntityResolver público (entidad de URLCatalogURL)
          lanza IOException {
      EntityCatalog = nuevas propiedades (entityCatalog);
      EntityCatalog.load(entityCatalogURL.openStream());
   }
   // Abre la ubicación física como una URL simple o, si esto falla, 
						// como un recurso de Java accesible desde la vía de acceso de clases.
   fuente de entrada privada openLocation (ubicación de la cadena)
          lanza IOException {
      URL URL = nulo;
      InputStream entidadStream = nulo;
      prueba { // ¿URL bien formada?
         url = nueva URL (ubicación);
      } catch (excepción MalformedURLException) { ... }
      if (url != null) { // URL bien formada. 
         try { // Intenta abrir la URL.
            entidadStream = url.openStream();
         } catch (excepción IOException) { ... }
      }
      if (entityStream == null) { // No es una URL o no es accesible. 
         intente { // ¿Ruta de recursos?
            Cadena resourcePath = url != null
               ? url.getPath() : ubicación;
            entidadStream
               = getClass().getResourceAsStream(resourcePath);
         } catch (Excepción excepción1) { ... }
      }
      if (entityStream != null) { // URL legible o recurso.
         fuente InputSource = new InputSource(entityStream);
         source.setSystemId(ubicación);
         fuente de retorno;
      }
      devolver nulo;
   }
   // Asigna un URI de entidad externa o un identificador público a una 
						// ubicación física.
   public String mapEntityURI(String entidadURI) {
      devuelve EntityCatalog.getProperty(entityURI);
   }

   fuente de entrada pública resolveEntity (String entidadURI,
          Cadena URL de entidad) {
      fuente InputSource = nulo;
      intentar {
         // Intente primero mapear su URI/PublicId usando el catálogo.
         si (URI de entidad! = nulo) {
            String mappedLocation = mapEntityURI(entityURI);
            if (ubicación asignada! = nulo) {
               fuente = openLocation(mappedLocation);
               if (fuente! = nulo) { volver fuente; }
            }
         }
         // Intente luego acceder a la entidad utilizando su URL/ID del sistema.
         if (entityURL != null) {
            fuente = openLocation(entityURL);
            if (fuente! = nulo) { volver fuente; }
         }
      }
   } catch (excepción de excepción) { ... }
      devolver nulo; // Deje que el solucionador de entidades predeterminado lo maneje.
   }
}

Ejemplo de código 4.12. Un catálogo de entidades simple
						# Identificador público DTD para la ubicación física (URL o ruta del recurso) 
-//Sun Microsystems, Inc. - J2EE Blueprints Group//DTD LineItem 1.0//EN : /com/sun/j2ee
 /blueprints/xmldocuments/rsrc/schemas/LineItem .dtd
-//Sun Microsystems, Inc. - J2EE Blueprints Group//DTD Invoice 1.0//EN : /com/sun/j2ee
 /blueprints/xmldocuments/rsrc/schemas/Invoice.dtd
 # XSD URI a la ubicación física (URL o ruta del recurso ) 
http\://blueprints.j2ee.sun.com/LineItem : /com/sun/j2ee/blueprints/xmldocuments/rsrc
 /schemas/LineItem.xsd
http\://blueprints.j2ee.sun.com/Invoice : /com/sun/j2ee/blueprints/xmldocuments/rsrc
 /schemas/Invoice.xsd

Si bien implementaciones simples como el ejemplo de código 4.11 resuelven muchos de los problemas comunes relacionados con la administración de entidades externas, los desarrolladores deben tener en cuenta que hay mejores soluciones en el horizonte. Por ejemplo, organizaciones como Oasis Consortium están trabajando en especificaciones de catálogos XML formales. (Consulte el sitio web http://www.oasis-open.org para obtener más información sobre resolución de entidades y catálogos XML).

En resumen, es posible que desee considerar implementar una resolución de entidad personalizada o, mejor aún, recurrir a una solución de catálogo XML más elaborada, en las siguientes circunstancias:

Para proteger la integridad de su aplicación contra la modificación maliciosa de esquemas externos mediante la redirección de referencias a copias seguras (ya sean copias locales o aquellas en repositorios confiables)

Durante el diseño y, más aún, durante la producción, para proteger su aplicación contra la evolución legítima e inesperada de los esquemas en los que se basa. En su lugar, desea diferir la contabilidad de esta evolución hasta que haya evaluado correctamente su impacto en su aplicación.

Para mejorar el rendimiento manteniendo copias locales de esquemas accesibles de forma remota.




## 4.5. Consideraciones de rendimiento
Es importante tener en cuenta el rendimiento al procesar documentos XML. El procesamiento de documentos XML (el manejo del documento en una etapa previa o posterior al procesamiento de la lógica comercial de una aplicación) puede afectar negativamente el rendimiento de la aplicación porque dicho procesamiento es potencialmente muy intensivo en CPU, memoria y entrada/salida o red.

¿Por qué el procesamiento de documentos XML puede tener un impacto tan significativo en el rendimiento? Recuerde que el procesamiento de un documento XML entrante consta de varios pasos, incluido el análisis del documento; opcionalmente, validar el documento contra un esquema (esto implica analizar primero el esquema); reconocer, extraer y procesar directamente los contenidos de los elementos y los valores de los atributos; u opcionalmente mapear estos componentes a otros objetos específicos del dominio para su posterior procesamiento. Estos pasos deben ocurrir antes de que una aplicación pueda aplicar su lógica comercial a la información recuperada del documento XML. El análisis de un documento XML a menudo requiere una gran cantidad de codificación y decodificación de conjuntos de caracteres, junto con el procesamiento de cadenas. Dependiendo de la API que se utilice, el reconocimiento y la extracción de contenido puede consistir en recorrer una estructura de datos de árbol, o puede consistir en interceptar eventos generados por el analizador y luego procesar estos eventos de acuerdo con algún contexto. Una aplicación que utiliza XSLT para preprocesar un documento XML agrega más sobrecarga de procesamiento antes de que pueda llevarse a cabo el trabajo de lógica comercial real. Cuando se usa la API DOM, crea una representación del documento, un árbol DOM, en la memoria. Los documentos grandes dan como resultado grandes árboles DOM y el correspondiente consumo de grandes cantidades de memoria. El proceso de enlace de datos XML tiene, hasta cierto punto, el mismo inconveniente de consumo de memoria. Muchas de estas restricciones son válidas cuando se generan documentos XML. Cuando se usa la API DOM, crea una representación del documento, un árbol DOM, en la memoria. Los documentos grandes dan como resultado grandes árboles DOM y el correspondiente consumo de grandes cantidades de memoria. El proceso de enlace de datos XML tiene, hasta cierto punto, el mismo inconveniente de consumo de memoria. Muchas de estas restricciones son válidas cuando se generan documentos XML. Cuando se usa la API DOM, crea una representación del documento, un árbol DOM, en la memoria. Los documentos grandes dan como resultado grandes árboles DOM y el correspondiente consumo de grandes cantidades de memoria. El proceso de enlace de datos XML tiene, hasta cierto punto, el mismo inconveniente de consumo de memoria. Muchas de estas restricciones son válidas cuando se generan documentos XML.

Hay otros factores con el procesamiento de documentos XML que afectan el rendimiento. A menudo, las estructuras físicas y lógicas de un documento XML pueden ser diferentes. Un documento XML también puede contener referencias a entidades externas. Estas referencias se resuelven y sustituyen en el contenido del documento durante el análisis, pero antes de la validación. Dado que el documento puede originarse en un sistema diferente al sistema de la aplicación, y las entidades externas, e incluso el propio esquema, pueden estar ubicados en sistemas remotos, puede haber una sobrecarga de red que afecte el rendimiento. Para realizar el análisis y la validación, las entidades externas primero deben cargarse o descargarse en el sistema de procesamiento. Esta puede ser una operación intensiva de la red, o requerir una gran cantidad de operaciones de entrada y salida, cuando los documentos tienen una estructura física compleja.

En resumen, el procesamiento XML es potencialmente intensivo en CPU, memoria y red, por las siguientes razones:

Puede ser un uso intensivo de la CPU. Los documentos XML entrantes no solo deben analizarse, sino también validarse, y es posible que deban procesarse mediante API que, a su vez, pueden hacer un uso intensivo de la CPU. Es importante limitar al máximo el coste de la validación sin poner en peligro la tramitación de la solicitud y utilizar la API más adecuada para tramitar el documento.

Puede ser intensivo en memoria. El procesamiento de XML puede requerir la creación de una gran cantidad de objetos, especialmente cuando se trata de modelos de objetos de documentos.

Puede ser intensivo en la red. Un documento puede ser la agregación de diferentes entidades externas que durante el análisis puede ser necesario recuperar a través de la red. Es importante reducir en lo posible el costo de referenciar entidades externas.

A continuación, se incluyen algunas pautas para mejorar el rendimiento al procesar documentos XML. En particular, estas pautas examinan formas de mejorar la CPU, la memoria y el consumo de entrada/salida o red.

4.5.1. Limite el análisis de documentos XML entrantes
En general, es mejor analizar los documentos XML entrantes solo cuando la solicitud se haya formulado correctamente. En el caso de una aplicación de servicio web, si un documento se recupera como un parámetro de origen de una solicitud a un método de punto final, lo mejor es aplicar primero la seguridad y validar la metainformación que puede haberse pasado como parámetros adicionales con la solicitud.

En un escenario de mensajería más genérico, cuando un documento está envuelto dentro de otro documento (considerado un sobre) y el sobre contiene metainformación sobre seguridad y cómo procesar el documento interno, puede aplicar la misma recomendación: Extraiga la metainformación del sobre, luego haga cumplir la seguridad y valide la metainformación antes de continuar con el análisis del documento interno. Al implementar un controlador SAX y asumir que la metainformación se encuentra al principio del documento, si falla la seguridad o la validación de la metainformación, entonces el controlador puede lanzar una excepción SAX para cancelar inmediatamente el procesamiento y minimizar el impacto general. impacto en el rendimiento.

4.5.2. Utilice la API más adecuada
Es importante elegir la API de procesamiento XML más apropiada para su tarea en particular. En esta sección, analizamos los diferentes modelos de procesamiento en términos de las situaciones en las que funcionan mejor y en las que su rendimiento es limitado.

En general, sin considerar el consumo de memoria, el procesamiento con la API DOM tiende a ser más lento que el procesamiento con la API SAX. Esto se debe a que DOM puede tener que cargar todo el documento en la memoria para que el documento se pueda editar o recuperar los datos, mientras que SAX permite que el documento se procese a medida que se analiza. Sin embargo, a pesar de su lentitud inicial, es mejor usar el modelo DOM cuando el documento de origen debe editarse o procesarse varias veces.

También debe intentar usar JAXB siempre que el contenido del documento tenga una representación directa, como objetos específicos del dominio, en Java. Si no usa JAXB, debe asignar manualmente el contenido del documento a objetos específicos del dominio, y este proceso a menudo (cuando SAX es demasiado engorroso para aplicar; consulte la página 166) .) requiere una representación DOM intermedia del documento. Esta representación DOM intermedia no solo es transitoria, sino que consume recursos de memoria y debe atravesarse cuando se mapea a los objetos específicos del dominio. Con JAXB, puede generar automáticamente el mismo código, lo que ahorra tiempo de desarrollo y, según la implementación de JAXB, es posible que no cree una representación DOM intermedia del documento de origen. En cualquier caso, JAXB usa menos recursos de memoria ya que un árbol de contenido JAXB es por naturaleza más pequeño que un árbol DOM equivalente.

Cuando utilice tecnologías de nivel superior como XSLT, tenga en cuenta que pueden depender de tecnologías de nivel inferior como SAX y DOM, lo que puede afectar el rendimiento, posiblemente de manera adversa.

Al crear canalizaciones de transformación XML complejas, utilice la clase JAXP SAXTransformerFactory para procesar los resultados de una transformación de hoja de estilo con otra hoja de estilo. Puede optimizar el rendimiento, evitando la creación de estructuras de datos en memoria, como árboles DOM, trabajando con eventos SAX hasta la última etapa de la canalización.

Como alternativa, puede considerar el uso de API distintas de las cuatro discutidas anteriormente. JDOM y dom4j son particularmente apropiados para aplicaciones que implementan un modelo de procesamiento centrado en documentos y que deben manipular una representación DOM de los documentos.

JDOM, por ejemplo, logra los mismos resultados que DOM pero, debido a que es más genérico, puede abordar cualquier modelo de documento. No solo está optimizado para Java, sino que los desarrolladores consideran que JDOM es fácil de usar porque se basa en la API de colección de Java . Los documentos JDOM pueden crearse directamente a partir de eventos SAX y árboles DOM, y convertirse en ellos, lo que permite que JDOM se integre perfectamente en las canalizaciones de procesamiento XML y, en particular, como origen o resultado de las transformaciones XSLT.

Otra API alternativa es dom4j, que es similar a JDOM. Además de admitir el procesamiento de estilo de árbol, la API de dom4j tiene soporte integrado para Xpath. Por ejemplo, la interfaz org.dom4j.Node define métodos para seleccionar nodos según una expresión Xpath. dom4j también implementa un modelo de procesamiento basado en eventos para que pueda procesar de manera eficiente documentos XML grandes. Cuando las expresiones Xpath coinciden durante el análisis, se puede volver a llamar a los controladores registrados, lo que le permite procesar y desechar inmediatamente partes del documento sin esperar a que se analice y cargue todo el documento en la memoria.

Cuando se reciben documentos a través de un punto final de servicio (ya sea un punto final de servicio JAX-RPC o EJB), los documentos se analizan como objetos de origen abstractos. Como ya se señaló, no asuma una implementación específica ( StreamSource , SAXSource o DOMSource ) para un documento entrante. En su lugar, debe asegurarse de que se utilice la API óptima para establecer un puente entre el origen específicola implementación pasó al punto final y al modelo de procesamiento previsto. Tenga en cuenta que la API JAXP XSLT no garantiza que las transformaciones de identidad se apliquen de la forma más eficaz. Por ejemplo, al aplicar una transformación de identidad de un árbol DOM a un árbol DOM, la forma más eficaz es devolver el árbol de origen como el árbol de resultados sin más procesamiento; sin embargo, la especificación JAXP no impone este comportamiento.

Un desarrollador también puede querer implementar el procesamiento de flujo para la aplicación para que pueda recibir los requisitos de procesamiento como parte de la solicitud SOAP y comenzar a procesar el documento antes de que se reciba por completo. El procesamiento de documentos de esta manera mejora el rendimiento general y es útil cuando se pasan documentos muy grandes. Se debe tener mucho cuidado al hacer esto, ya que no hay garantía de que la implementación de JAX-RPC subyacente no esperará a recibir el documento completo antes de pasar el objeto de origen al punto final y que efectivamente pasará un objeto de origen que permita la transmisión. procesamiento, como StreamSource o SAXSource. Lo mismo ocurre cuando se implementa el procesamiento continuo de documentos salientes. Si bien puede pasar un objeto de origen que permita el procesamiento de secuencias, no hay garantía de cómo lo manejará realmente la implementación de JAX-RPC subyacente.

4.5.3. Elija implementaciones efectivas de hojas de estilo y analizador
Cada implementación de motor de hoja de estilo y analizador es diferente. Por ejemplo, uno podría enfatizar la funcionalidad, mientras que otro el rendimiento. Un desarrollador puede querer usar diferentes implementaciones dependiendo de la tarea a realizar. Considere usar JAXP, que no solo es compatible con muchos analizadores y motores de hojas de estilo, sino que también tiene una característica de capacidad de conexión que permite a un desarrollador cambiar entre implementaciones y seleccionar la implementación más efectiva para los requisitos de una aplicación. Cuando usa JAXP, puede cambiar más tarde la implementación del analizador subyacente sin tener que cambiar el código de la aplicación.

4.5.3.1. Ajustar las implementaciones del motor de hoja de estilo y el analizador subyacente
La API de JAXP define métodos para establecer y obtener características y propiedades para configurar las implementaciones subyacentes del motor de hojas de estilo y el analizador. Una implementación particular de analizador, generador de documentos o transformador puede definir características y propiedades específicas para activar o desactivar comportamientos específicos dedicados a la mejora del rendimiento. Estos son independientes de las propiedades y funciones estándar, como la función http://xml.org/sax/features/validation utilizada para activar o desactivar la validación.

Por ejemplo, Xerces define una característica de expansión diferida llamada http://apache.org/xml/features/dom/defer-node-expansion , que activa o desactiva un modo DOM perezoso. En modo perezoso (habilitado de forma predeterminada), los nodos del árbol DOM se evalúan de forma perezosa, su creación se aplaza: se crean solo cuando se accede a ellos. Como resultado, la construcción del árbol DOM a partir de un documento XML se devuelve más rápido, ya que solo se expanden los nodos a los que se accede. Esta característica es particularmente útil cuando se procesan solo partes del árbol DOM. El almacenamiento en caché de gramática, otra función disponible en Xerces, mejora el rendimiento al evitar el análisis repetido de los mismos esquemas XML. Esto es especialmente útil cuando una aplicación procesa un número limitado de esquemas, que suele ser el caso de los servicios web.

Tenga cuidado al establecer características y propiedades específicas para preservar la intercambiabilidad de la implementación subyacente. Cuando la implementación subyacente encuentra una característica o una propiedad que no admite o reconoce, SAXParserFactory , XMLReader o DocumentBuilderFactory pueden generar estas excepciones: una SAXNotRecognizedException , una SAXNotSupportedException o una IllegalArgumentException . Evite agrupar características y propiedades no relacionadas, especialmente las estándar frente a las específicas, en un solo intento/capturabloquear. En su lugar, maneje las excepciones de forma independiente para que las características o propiedades específicas opcionales no impidan cambiar a una implementación diferente. Puede diseñar su aplicación de tal manera que las características y propiedades específicas de las implementaciones subyacentes también puedan definirse externamente a la aplicación, como en un archivo de configuración.

4.5.3.2. Reutilización y agrupaciones de analizadores y hojas de estilo
Una aplicación XML puede tener que procesar diferentes tipos de documentos, como documentos que se ajusten a diferentes esquemas. Se puede usar un solo analizador (por hilo de ejecución) para manejar sucesivamente documentos de diferentes tipos simplemente reasignando los manejadores de acuerdo con los documentos de origen que se van a procesar. Los analizadores, que son objetos complejos, se pueden agrupar para que otros subprocesos de ejecución puedan reutilizarlos, lo que reduce la carga en la asignación de memoria y la recolección de elementos no utilizados. Además, si la cantidad de tipos de documentos diferentes es grande y los controladores son costosos de crear, los controladores también se pueden agrupar. Las mismas consideraciones se aplican a las hojas de estilo y transformadores.

Los analizadores, los generadores de documentos y los transformadores, así como las hojas de estilo, se pueden agrupar mediante un mecanismo de agrupación personalizado. O bien, si el procesamiento ocurre en el nivel EJB, puede aprovechar el mecanismo de agrupación de instancias del contenedor EJB implementando beans de sesión sin estado o beans controlados por mensajes dedicados a estas tareas. Dado que estos beans están agrupados por el contenedor EJB, los analizadores, los generadores de documentos, los transformadores y las hojas de estilo a las que tienen una referencia también se agrupan.

Las hojas de estilo se pueden compilar en objetos javax.xml.transform.Templates para evitar el análisis repetido de las mismas hojas de estilo. Los objetos de plantilla son seguros para subprocesos y, por lo tanto, son fácilmente reutilizables.

4.5.4. Reducir el costo de validación
No solo es importante, sino que puede ser necesaria la validación para garantizar la fiabilidad de una aplicación XML. Una aplicación puede confiar legítimamente en la validación del analizador para evitar la verificación doble de la validez del contenido del documento. La validación es un paso importante del procesamiento de XML, pero tenga en cuenta que puede afectar el rendimiento.

Considere el sistema confiable y confiable que se muestra en la figura 4.14 . Este sistema se compone de dos aplicaciones débilmente acopladas. La aplicación front-end recibe documentos XML como parte de las solicitudes y los reenvía a la aplicación del motor de reservas, que se implementa como un flujo de trabajo centrado en documentos.

Figura 4.14. Validar solo cuando sea necesario



Aunque debe validar documentos XML entrantes externos, puede intercambiar libremente, es decir, sin validación, documentos XML internos o documentos XML externos ya validados. En resumen, necesita validar solo en los límites del sistema y puede usar la validación internamente solo como un mecanismo de afirmación durante el desarrollo. Puede desactivar la validación cuando esté en producción y busque un rendimiento óptimo.

En otras palabras, cuando usted es tanto el productor como el consumidor de documentos XML, puede usar la validación como un mecanismo de afirmación durante el desarrollo y luego desactivar la validación cuando esté en producción. Además, durante la producción, la validación se puede utilizar como un mecanismo de diagnóstico al configurar la validación para que se active por ocurrencia de fallas.

4.5.5. Reduzca el costo de hacer referencia a entidades externas
Recuerde que un documento XML puede ser la agregación de una variedad de entidades externas y que es posible que sea necesario recuperar estas entidades a través de la red durante el análisis. Además, es posible que el esquema también deba recuperarse de una ubicación externa. Las entidades externas, incluidos los esquemas, deben cargarse y analizarse incluso cuando no se están validando para garantizar que se entregue la misma información a la aplicación, independientemente de cualquier validación posterior. Esto es especialmente cierto con respecto a los valores predeterminados que se pueden especificar en un esquema de documento entrante.

Hay dos formas complementarias de reducir el costo de referenciar entidades externas:

Almacenamiento en caché mediante un caché de proxy : puede mejorar la eficiencia de la ubicación de referencias a entidades externas que se encuentran en un repositorio remoto mediante la configuración de un proxy que almacena en caché las entidades externas recuperadas. Sin embargo, las referencias a entidades externas deben ser URL cuyos protocolos pueda manejar el proxy. (Consulte la Figura 4.15 , que debe verse en el contexto de la Figura 4.14 ).

Figura 4.15. Una arquitectura para almacenar en caché entidades externas


Almacenamiento en caché mediante un solucionador de entidades personalizado : los analizadores SAX permiten que las aplicaciones XML manejen entidades externas de forma personalizada. Estas aplicaciones deben registrar su propia implementación de la interfaz org.xml.sax.EntityResolver con el analizador mediante el método setEntityResolver . Luego, las aplicaciones pueden interceptar entidades externas (incluidos los esquemas) antes de que se analicen. De manera similar, JAXP define la interfaz javax.xml.transform.URIResolver . La implementación de esta interfaz le permite recuperar los recursos a los que se hace referencia en las hojas de estilo por xsl:import o xsl:includedeclaraciones. Para una aplicación que usa un gran conjunto de hojas de estilo divididas en componentes, esto se puede usar para implementar un caché de la misma manera que EntityResolver . Puede usar EntityResolver y URIResolver para implementar:

Un mecanismo de almacenamiento en caché en la propia aplicación, o

Un mecanismo de búsqueda de URI personalizado que puede redirigir el sistema y las referencias públicas a una copia local de un repositorio público.

Puede usar ambos enfoques de almacenamiento en caché juntos para garantizar un rendimiento aún mejor. Use un caché de proxy para entidades estáticas cuya vida útil sea mayor que la vida útil de la aplicación. Esto funciona particularmente con esquemas públicos, que incluyen el número de versión en su identificador público o de sistema, ya que evolucionan a través de versiones sucesivas. Un solucionador de entidades personalizadas puede asignar primero identificadores públicos (normalmente en forma de URI) a identificadores del sistema (normalmente en forma de URL). Posteriormente, aplica las mismas técnicas que un proxy de caché regular cuando se trata de identificadores de sistema en forma de URL, especialmente buscando actualizaciones y evitando el almacenamiento en caché de contenido dinámico. El uso de estos enfoques de almacenamiento en caché a menudo da como resultado una mejora significativa del rendimiento, especialmente cuando las entidades externas están ubicadas en la red.El ejemplo de código 4.13 ilustra cómo implementar un sistema de resolución de entidades de almacenamiento en caché mediante la API de SAX.

Ejemplo de código 4.13. Uso de la API de SAX para implementar un solucionador de entidad de almacenamiento en caché
importar java.util.Map;
importar java.util.WeakHashMap;
importar java.lang.ref.SoftReference;
importar org.xml.sax.*;

clase pública CachingEntityResolver implementa EntityResolver {
   public static final int MAX_CACHE_ENTRY_SIZE = ...;
   EntityResolver privado parentResolver;
   entidades de mapas privadas = new WeakHashMap();

   Entidad de clase privada estática {
      Nombre de cadena;
      byte[] contenido;
   }

   CachingEntityResolver público (EntityResolver parentResolver) {
      this.parentResolver = parentResolver;
      búfer = nuevo byte[MAX_CACHE_ENTRY_SIZE];
   }

   fuente de entrada pública resolveEntity(String publicId,
      String systemId) lanza IOException, SAXException {
      Flujo InputStream = getEntity(publicId, systemId);
      si (flujo! = nulo) {
         fuente InputSource = new InputSource(flujo);
         fuente.setPublicId(publicId);
         fuente.setSystemId(systemId);
         fuente de retorno;
      }
      devolver nulo;
   }

   privado InputStream getEntity(String publicId, String systemId)
          lanza IOException, SAXException {
      Entidad entidad = nulo;
      Referencia de SoftReference
         = (SoftReference) entidades.get(systemId);
      si (referencia! = nulo) {
         // Obtuve una referencia suave a la entidad, 
						// obtengamos la entidad real.
         entidad = (Entidad) referencia.get();
      }
      si (entidad == nulo) {
         // La entidad ha sido reclamada por el GC o 
						// nunca se creó, ¡vamos a descargarla de nuevo! Delegar en 
						// el solucionador principal que implementa la 
						// estrategia de resolución actual.
         fuente InputSource
            = parentResolver.resolveEntity(publicId, systemId);
         si (fuente! = nulo) {
            devolver cacheEntity(publicId, systemId,
               fuente.getByteStream());
         }
         devolver nulo;
      }
      devolver nuevo ByteArrayInputStream(entity.content);
   }
   // Intenta almacenar en caché una entidad; si es demasiado grande, simplemente 
						// devuélvale un flujo de entrada.
   privado InputStream cacheEntity(String publicId,
         String systemId, flujo InputStream) lanza IOException {
      flujo = new BufferedInputStream(flujo);
      conteo int = 0;
      for (int i = 0; cuenta < buffer.length; cuenta += i) {
         if ((i = stream.read(buffer, count,
            buffer.length - cuenta)) < 0) { descanso; }
      }
      byte[] contenido = nuevo byte[recuento];
      System.arraycopy(búfer, 0, contenido, 0, recuento);
      if (cuenta != buffer.longitud) {
         // Guarde en caché la entidad para usarla en el futuro, usando una referencia suave 
						// ​​para que el GC pueda recuperarla si 
						ya no se hace referencia a ella // y la memoria se está agotando.
         Entidad entidad = nueva Entidad();
         entidad.nombre = publicId != null ? publicId: systemId;
         entidad.contenido = contenido;
         entidades.put(entidad.nombre, nueva SoftReference(entidad));
         devolver nuevo ByteArrayInputStream(contenido);
      }
      // Entidad demasiado grande para ser almacenada en caché.
      devuelve nueva SequenceInputStream(
         nuevo ByteArrayInputStream(contenido), corriente);
   }
}

4.5.6. Caché de documentos generados dinámicamente
Los documentos generados dinámicamente generalmente se ensamblan a partir de valores devueltos por llamadas a la lógica empresarial. En general, es una buena idea almacenar en caché los documentos XML generados dinámicamente para evitar tener que recuperar el contenido del documento, lo que implica viajes de ida y vuelta adicionales a un nivel comercial. Esta es una buena regla a seguir cuando los datos son predominantemente de solo lectura, como los datos del catálogo. Además, si corresponde, puede almacenar en caché el contenido del documento (árbol DOM o árbol de contenido JAXB) en la sesión del usuario en la capa de interacción o presentación para evitar invocar repetidamente la lógica comercial.

Sin embargo, consume más memoria rápidamente cuando almacena en caché el resultado de una solicitud de usuario para atender solicitudes posteriores relacionadas. Cuando adopte este enfoque, tenga en cuenta que no debe hacerlo en detrimento de otros usuarios. Es decir, asegúrese de que la aplicación no falle debido a una escasez de memoria provocada por mantener los resultados almacenados en caché. Para ayudar con la administración de la memoria, use referencias suaves, que permiten una interacción más mejorada con el recolector de elementos no utilizados para implementar cachés.

Al almacenar en caché un árbol DOM en el contexto de un contenedor web distribuido, es posible que la referencia al árbol almacenado en una sesión HTTP deba declararse como transitoria . Esto se debe a que HttpSession requiere que los objetos que almacena sean serializables en Java, y no todas las implementaciones DOM son serializables en Java. Además, la serialización Java de un árbol DOM puede ser muy costosa, lo que contrarresta los beneficios del almacenamiento en caché.

4.5.7. Utilice XML con prudencia
El uso de documentos XML en un entorno de servicios web tiene sus ventajas y desventajas. Los documentos XML pueden mejorar la interoperabilidad de los servicios web: los sistemas heterogéneos y débilmente acoplados pueden intercambiar fácilmente documentos XML porque son documentos de texto. Sin embargo, los sistemas débilmente acoplados deben pagar el precio de esta facilidad de interoperabilidad, ya que el análisis que requieren estos documentos XML es muy costoso. Esto se aplica a los sistemas que están débilmente acoplados en un sentido técnico y empresarial.

Contraste esto con los sistemas fuertemente acoplados. Los componentes del sistema que están estrechamente acoplados pueden usar técnicas estándar no orientadas a documentos (como RMI) que son mucho más eficientes en términos de rendimiento y requieren mucha menos complejidad de codificación. Afortunadamente, con tecnologías como JAX-RPC y JAXB puede combinar lo mejor de ambos mundos. Se pueden desarrollar sistemas que estén estrechamente acoplados internamente y orientados a objetos, y que puedan interactuar de una manera débilmente acoplada y orientada a documentos.

En general, cuando utilice documentos XML, siga estas sugerencias:

Confíe en los protocolos XML, como los implementados por JAX-RPC y otros, para interoperar con sistemas heterogéneos y proporcionar puntos de integración poco acoplados.

Evite el uso de XML para interfaces no expuestas o para intercambios entre componentes que, de lo contrario, deberían estar estrechamente acoplados.

La serialización Java directa de objetos específicos del dominio suele ser más rápida que la serialización XML de un árbol DOM equivalente o incluso la serialización Java del propio árbol DOM (cuando la implementación DOM admite dicha serialización Java). Además, la serialización directa de Java de los objetos específicos del dominio generalmente da como resultado una forma de objeto serializado que es más pequeña que las formas serializadas de los otros dos enfoques. La serialización de Java del árbol DOM suele ser la más costosa en cuanto a tiempo de procesamiento y consumo de memoria; por lo tanto, debe usarse con extremo cuidado (si es que alguna vez lo hace), especialmente en un contexto EJB donde la serialización ocurre cuando se accede a beans empresariales remotos. Al acceder a beans empresariales locales, puede pasar árboles DOM o fragmentos de árboles DOM sin incurrir en este gasto de procesamiento. Tabla 4.2resume las pautas para usar XML para interacciones de componentes.

Tabla 4.2. Directrices para el uso juicioso de XML para la interacción de componentes
Transferencia de datos entre componentes	Componentes remotos	Componentes locales
Objetos Java	Eficiente	Altamente eficiente (acceso detallado)
Modelo de objeto de documento	Serialización no estándar muy costosa	Solo para arquitecturas centradas en documentos
XML serializado	Caro, pero interoperable	No hay razón para serializar XML para llamadas locales

Para resumir, cuando implemente una aplicación que abarque varios contenedores, tenga en cuenta los siguientes puntos (consulte también la Tabla 4.2 ).

Para la interacción de componentes remotos, los objetos Java son eficientes, XML serializado, aunque costoso, se puede usar para la interoperabilidad. DOM es muy costoso y la serialización Java de árboles DOM no siempre es compatible.

Para la interacción de componentes locales, los objetos Java son los más eficientes y se puede usar DOM cuando lo requiera el modelo de procesamiento de la aplicación. Sin embargo, debe evitarse el XML serializado.

Enlace a objetos Java específicos del dominio lo antes posible y procese estos objetos en lugar de documentos XML.


## 4.6. Conclusión
Este capítulo cubrió gran parte de las consideraciones que un desarrollador debe tener en cuenta al escribir aplicaciones, particularmente aplicaciones basadas en servicios web, que usan documentos XML. Una vez que se comprenden estos problemas y consideraciones, un desarrollador puede tomar decisiones informadas no solo sobre cómo diseñar e implementar estas aplicaciones basadas en XML, sino también sobre si las aplicaciones deberían estar basadas en XML. En cierto sentido, se anima al desarrollador a hacer esta pregunta primero: "¿Esta aplicación debería estar basada en XML?"

Una vez que el desarrollador decide que XML es apropiado para la aplicación, la siguiente tarea es que el desarrollador diseñe una arquitectura sólida y equilibrada. Tal arquitectura debe basarse en XML solo para lo que XML es bueno. Es decir, la arquitectura debe usar XML para comunicación abierta entre aplicaciones, descripciones de configuración, intercambio de información y, especialmente, para acceder a dominios para los que existen esquemas XML públicos. Al mismo tiempo, XML puede no ser la solución adecuada cuando las interfaces de las aplicaciones no están expuestas públicamente o para el intercambio de información entre componentes que deberían comunicarse de manera estrechamente acoplada.

El capítulo también consideró los factores que un desarrollador debe sopesar al decidir dónde y cómo realizar el procesamiento XML. ¿Debería limitarse el procesamiento de XML a la capa de interacción de un servicio web como una etapa previa o posterior al procesamiento de la lógica empresarial, o debería expresarse la propia lógica empresarial en términos de procesamiento XML? El capítulo ayudó a aclarar aún más cuándo tiene sentido implementar un modelo de procesamiento centrado en objetos o un modelo de procesamiento centrado en documentos.

Estas decisiones determinan la elección del desarrollador entre las diferentes implementaciones y API de procesamiento de XML. Además, el capítulo describió las compensaciones de rendimiento entre estas diferentes técnicas de procesamiento y comparó el rendimiento con la funcionalidad y la facilidad de uso. Indicó situaciones en las que y por qué una técnica podría ser superior a otra y ayudó a delinear la justificación de estas elecciones.
