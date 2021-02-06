# Capítulo 2: Análisis de documentos XML con SAX

* What Is SAX?
* Exploring the SAX API
   * Obtaining a SAX 2 Parser
   * Touring XMLReader Methods
   * Touring the Handler and Resolver Interfaces
* Demonstrating the SAX API
* Creating a Custom Entity Resolver
* Summary

Java proporciona varias API para analizar documentos XML. La más básica de estas API es SAX, que es el tema central del Capítulo 2.

## ¿Qué es SAX?

*Simple API for XML (SAX)* es una API Java basada en eventos para analizar un documento XML secuencialmente de principio a fin. Cuando un analizador orientado a SAX encuentra un elemento del conjunto de información del documento (un modelo de datos abstracto que describe la información de un documento XML, consulte http://en.wikipedia.org/wiki/XML_Information_Set), hace que este elemento esté disponible para una aplicación como un evento llamando a uno de los métodos en uno de los controladores de la aplicación (objetos cuyos métodos son llamados por el analizador para que la información del evento esté disponible), que la aplicación ha registrado previamente con el analizador. La aplicación puede consumir este evento procesando el elemento del conjunto de información de alguna manera.

Un analizador SAX es más eficiente en memoria que un analizador DOM (consulte el Capítulo 3) en el sentido de que no requiere que todo el documento quepa en la memoria. Este beneficio se convierte en un inconveniente para utilizar XPath (consulte el Capítulo 5) y XSLT (consulte el Capítulo 6), que requieren que todo el documento se almacene en la memoria.

NOTA De acuerdo con su sitio web oficial (www.saxproject.org), SAX se originó como una API de análisis XML para Java. Sin embargo, SAX no es exclusivo de Java. SAX también está disponible para el marco .NET de Microsoft (consulte http://saxdotnet.sourceforge.net).
Explorando la API de SAX
SAX existe en dos versiones principales: SAX 1 y SAX 2. Java implementa ambas versiones a través de las clases abstractas SAXParser y SAXParserFactory del paquete javax.xml.parsers. Los paquetes org.xml.sax, org.xml.sax.ext y org.xml.sax.helpers proporcionan varios tipos que aumentan ambas implementaciones de Java.

NOTA: exploro solo la implementación de SAX 2 porque SAX 2 pone a disposición elementos de conjunto de información adicionales sobre un documento XML (como comentarios y notificaciones de la sección CDATA).
Antes de Java 9, se podía usar la clase XMLReaderFactory del paquete org.xml.sax.helpers para obtener un analizador SAX 2. En Java 9, Oracle desaprobó XMLReaderFactory y recomienda usar SAXParserFactory en su lugar.

OBTENER UN PARSER DE SAX 2
Las clases que implementan la interfaz XMLReader describen analizadores basados ​​en SAX 2. Las instancias de estas clases se obtienen de la siguiente manera:
