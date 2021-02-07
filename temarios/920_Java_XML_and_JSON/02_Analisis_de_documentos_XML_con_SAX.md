# Capítulo 2: Análisis de documentos XML con SAX

* What Is SAX?
* Exploring the SAX API
   * Obtaining a SAX 2 Parser
   * Touring XMLReader Methods
   * Touring the Handler and Resolver Interfaces
* Demonstrating the SAX API
* Creating a Custom Entity Resolver
* Summary

<hr>

Java proporciona varias API para analizar documentos XML. La más básica de estas API es SAX, que es el tema central del Capítulo 2.

<hr>

## ¿Qué es SAX?

*Simple API for XML (SAX)* es una API Java basada en eventos para analizar un documento XML secuencialmente de principio a fin. Cuando un analizador orientado a SAX encuentra un elemento del *infoset* - conjunto de información del documento (un modelo de datos abstracto que describe la información de un documento XML, consulte http://en.wikipedia.org/wiki/XML_Information_Set), hace que este elemento esté disponible para una aplicación como un *evento* llamando a uno de los métodos en uno de los controladores de la aplicación (*handlers*) (objetos cuyos métodos son llamados por el analizador para que la información del evento esté disponible), que la aplicación ha registrado previamente con el analizador. La aplicación puede *consumir* este evento procesando el elemento del conjunto de información de alguna manera.

Un analizador SAX es más eficiente en memoria que un analizador DOM (consulte el Capítulo 3) en el sentido de que no requiere que todo el documento quepa en la memoria. Este beneficio se convierte en un inconveniente para utilizar XPath (consulte el Capítulo 5) y XSLT (consulte el Capítulo 6), que requieren que todo el documento se almacene en la memoria.

> **NOTA** De acuerdo con su sitio web oficial (www.saxproject.org), SAX se originó como una API de análisis XML para Java. Sin embargo, SAX no es exclusivo de Java. SAX también está disponible para el marco .NET de Microsoft (consulte http://saxdotnet.sourceforge.net).

<hr>

## Explorando la API de SAX

SAX existe en dos versiones principales: SAX 1 y SAX 2. Java implementa ambas versiones a través de las clases abstractas `SAXParser` y `SAXParserFactory` del paquete `javax.xml.parsers`. Los paquetes `org.xml.sax`, `org.xml.sax.ext` y `org.xml.sax.helpers` proporcionan varios tipos que aumentan ambas implementaciones de Java.

> **NOTA**: Exploro solo la implementación de SAX 2 porque SAX 2 pone a disposición elementos de conjunto de información adicionales sobre un documento XML (como comentarios y notificaciones de la sección CDATA).
>Antes de Java 9, se podía usar la clase `XMLReaderFactory` del paquete `org.xml.sax.helpers` para obtener un analizador SAX 2. En Java 9, Oracle desaprobó `XMLReaderFactory` y recomienda usar `SAXParserFactory` en su lugar.

### OBTENER UN SAX 2 PARSER

Classes que implementan la interfaz `XMLReader` describe los analizadores basados en SAX 2. Las instancias de estas clases se obtienen de la siguiente manera:

1. Llame al método estático `SAXParserFactory newInstance()` de `SAXParserFactory` para obtener una nueva instancia de subclase de `SAXParserFactory`. Alternativamente, es posible que desee llamar al método estático `SAXParserFactory newDefaultInstance()` (introducido por Java 9) para obtener una instancia de la implementación `SAXParserFactory` predeterminada del sistema. 

2. Configure el objeto `SAXParserFactory` llamando a varios métodos de configuración de `SAXParserFactory`, como `void setNamespaceAware(boolean awareness)`, que da como resultado un analizador que admite namespaces XML. 

3. Llame al método `SAXParser newSAXParser()` de `SAXParserFactory` para devolver una instancia de subclase `SAXParser`. 

4. Llame al método `getXMLReader()` de `XMLReader` de `SAXParser` para devolver una instancia de una clase que implementa `XMLReader`. 

El siguiente fragmento de código sigue estos pasos para crear y devolver un objeto `XMLReader` cuyo analizador es consciente de los namespaces:

```java
SAXParserFactory spf = SAXParserFactory.newInstance();
spf.setNamespaceAware(true);
SAXParser sp = spf.newSAXParser();
XMLReader xmlr = sp.getXMLReader();
```

> **NOTA** El método `newInstance()` de `SAXParserFactory` sigue un procedimiento de búsqueda ordenado para identificar la clase de implementación de `SAXParserFactory` a cargar. Primero, busca una propiedad del sistema `javax.xml.parsers.SAXParserFactory` y, cuando está presente, usa su valor como el nombre de la clase de implementación. Por último, invoca a `newDefaultInstance()` para devolver la implementación predeterminada del sistema.

> El método `newSAXParser()` crea un nuevo objeto de subclase `SAXParser` utilizando los parámetros de fábrica configurados actualmente. Lanza `javax.xml.parsers.ParserConfigurationException` cuando no se puede crear un analizador que satisfaga la configuración solicitada. Lanza `org.xml.sax.SAXException` cuando ocurre un error orientado a SAX.

### MÉTODOS DE TOURING XMLREADER

El objeto `XMLReader` devuelto pone a disposición varios métodos para configurar el analizador y analizar el contenido de un documento. Estos métodos se describen a continuación:

* `ContentHandler getContentHandler()` devuelve el controlador de contenido actual, que es una instancia de una clase que implementa la interfaz `org.xml.sax.ContentHandler`, o `null` cuando no se ha registrado ninguna.

* `DTDHandler getDTDHandler()` devuelve el controlador DTD actual, que es una instancia de una clase que implementa la interfaz `org.xml.sax.DTDHandler`, o `null` cuando no se ha registrado ninguno.

* `EntityResolver getEntityResolver()` devuelve el solucionador de entidades actual, que es una instancia de una clase que implementa la interfaz `org.xml.sax.EntityResolver`, o `null` cuando no se ha registrado ninguna.

* `ErrorHandler getErrorHandler()` devuelve el controlador de errores actual, que es una instancia de una clase que implementa la interfaz `org.xml.sax.ErrorHandler`, o `null` cuando no se ha registrado ninguno.

* `boolean getFeature(String name)` devuelve el valor Boolean que corresponde a la característica identificada por su `name`, que debe ser un URI completo. Este método arroja `org.xml.sax.SAXNotRecognizedException` cuando el nombre no se reconoce como una característica, y arroja(throws) `org.xml.sax.SAXNotSupportedException` cuando se reconoce el nombre, pero el valor asociado no se puede determinar cuando se llama a `getFeature()`. `SAXNotRecognizedException` y `SAXNotSupportedException` son subclases de `SAXException`.

* `Object getProperty(String name)` devuelve la instancia `java.lang.Object` que corresponde a la propiedad identificada por el `name`, que debe ser un URI completamente calificado. Este método arroja(throws) `SAXNotRecognizedException` cuando el nombre no se reconoce como una propiedad, y arroja(throws) `SAXNotSupportedException` cuando se reconoce el nombre, pero el valor asociado no se puede determinar cuando se llama a `getProperty()`.

* `void parse(InputSource input)` analiza un documento XML y no regresa hasta que el documento ha sido analizado. El parámetro de entrada almacena una referencia a un objeto `org.xml.sax.InputSource`, que describe la fuente del documento (como un objeto `java.io.InputStream` o incluso un identificador de sistema basado en `java.lang.String URI`). Este método lanza `java.io.IOException` cuando la fuente no se puede leer y `SAXException` cuando falla el análisis, probablemente debido a una violación de forma correcta.

* `void parse(String systemId)` analiza un documento XML ejecutando `parse(new InputSource(systemId));`.

* `void setContentHandler(ContentHandler handler)` registra el controlador de contenido identificado por el controlador(`handler`) con el analizador. La interfaz `ContentHandler` proporciona 11 métodos de devolución de llamada(callback) que se llaman para informar varios eventos de análisis (como el inicio y el final de un elemento).

* `void setDTDHandler(DTDHandler handler)` registra el manejador DTD identificado por `handler` con el analizador. La interfaz `DTDHandler` proporciona un par de métodos de devolución de llamada(callback) para informar sobre notaciones y entidades externas no analizadas.

* `void setEntityResolver(EntityResolver resolver)` registra la entidad de resolución identificada por `resolver` con el analizador. La interfaz `EntityResolver` proporciona un único método de devolución de llamada para resolver entidades.

* `void setErrorHandler(ErrorHandler handler)` registra el controlador de errores identificado por el `handler` con el analizador. La interfaz `ErrorHandler` proporciona tres métodos de devolución de llamada que informan *errores fatales* (problemas que impiden un análisis posterior, como violaciones de forma correcta), *errores recuperables* (problemas que no impiden un análisis posterior, como fallas de validación) y *advertencias(warnings)* (nonerrors que necesitan para ser direccionado, como prefijar un nombre de elemento con el prefijo `xml` reservado por W3C).

* `void setFeature(String name, boolean value)` asigna `value` a la característica identificada por su `name`, que debe ser un URI completamente calificado. Este método arroja(throws) `SAXNotRecognizedException` cuando el nombre no se reconoce como una característica, y arroja(throws) `SAXNotSupportedException` cuando se reconoce el nombre pero el valor asociado no se puede establecer cuando se llama a `setFeature()`.

* `void setProperty(String name, Object value)` asigna `value` a la propiedad identificada por `name`, que debe ser un URI completo. Este método arroja(throws) `SAXNotRecognizedException` cuando el nombre no se reconoce como una propiedad, y arroja(throws) `SAXNotSupportedException` cuando se reconoce el nombre, pero el valor asociado no se puede establecer cuando se llama a `setProperty()`.

Cuando un controlador(handler) no está instalado, todos los eventos pertenecientes a ese controlador se ignoran en silencio. No instalar un controlador de errores puede ser problemático porque es posible que el procesamiento normal no continúe y la aplicación no se dé cuenta de que algo salió mal. Cuando no se instala un solucionador de entidades, el analizador realiza su propia resolución predeterminada. Tendré más que decir sobre la resolución de entidades más adelante en este capítulo.

> **NOTA** Normalmente, instala un nuevo controlador de contenido, DTD, resolución de entidad o controlador de errores antes de analizar un documento, pero también puede hacerlo mientras se analiza el documento. El analizador comienza a utilizar el controlador cuando se produce el siguiente evento.

#### Configuración de Características y Propiedades

Después de obtener un objeto `XMLReader`, puede configurar ese objeto estableciendo sus características y propiedades. Una *característica* es un par de nombre/valor que describe un modo de analizador, como la validación. Por el contrario, una *propiedad* es un par de nombre/valor que describe algún otro aspecto de la interfaz del analizador, como un manejador léxico que aumenta el manejador de contenido proporcionando métodos de devolución de llamada para informar sobre comentarios, delimitadores CDATA y algunas otras construcciones sintácticas.

Las características y propiedades tienen nombres, que deben ser URIs absolutos que comienzan con el prefijo `http://`. El valor de una característica es siempre un valor booleano `true/false`. Por el contrario, el valor de una propiedad es un objeto arbitrario. El siguiente fragmento de código demuestra la configuración de una característica y una propiedad:

```java
String FEAT_VAL = "http://xml.org/sax/features/validation";
xmlr.setFeature(FEAT_VAL, true);

String PROP_LH = "http://xml.org/sax/properties/lexical-handler";
xmlr.setProperty(PROP_LH, new LexicalHandler() { /* ... */ });
```

La llamada `setFeature()` habilita las características de `validation` para que el analizador realice la validación. Los nombres de las funciones tienen el prefijo http://xml.org/sax/features/.

> **NOTA**: Los usuarios deben admitir las características de `namespaces` y `namespace-prefixes`. `namespaces` decide si los URI y los nombres locales se pasan a los métodos `startElement()` y `endElement()` de `ContentHandler`. El valor predeterminado es `true`: estos nombres se pasan. El analizador puede pasar cadenas vacías cuando es `false.namespace-prefixes` decide si los atributos `xmlns` y `xmlns:prefix` de una declaración de espacio de nombres se incluyen en la lista `org.xml.sax.Attributes` pasa a `startElement()`, y también decide si los nombres calificados se pasan como tercer argumento del método; un *qualified name* (nombre calificado) es un prefijo más un nombre local. Su valor predeterminado es `falso`, lo que significa que `xmlns` y `xmlns:prefix` no están incluidos y significa que los analizadores no tienen que pasar nombres calificados. Ninguna propiedad es obligatoria. La página del paquete `org.xml.sax` de la documentación de JDK enumera las características y propiedades estándar de SAX 2.

La llamada `setProperty()` asigna una instancia de una clase que implementa la interfaz `org.xml.sax.ext.LexicalHandler` a la propiedad `lexical-handler` para que los métodos de la interfaz puedan ser llamados para informar sobre comentarios, secciones CDATA, etc. Los nombres de propiedad tienen el prefijo http://xml.org/sax/properties/.

> **NOTA** A diferencia de `ContentHandler`, `DTDHandler`, `EntityResolver` y `ErrorHandler`, `LexicalHandler` es una extensión (no forma parte de la API SAX principal), por lo que `XMLReader` no declara un método `void setLexicalHandler(LexicalHandler handler)`. Si desea instalar un controlador léxico, debe usar el método `setProperty()` de `XMLReader` para instalar el controlador como el valor de la propiedad http://xml.org/sax/properties/lexical-handler.

Las características y propiedades pueden ser de solo lectura o de lectura y escritura. (En algunos casos raros, una característica o propiedad puede ser de solo escritura). Al configurar o leer una característica o propiedad, se pueden lanzar `SAXNotSupportedException` o `SAXNotRecognizedException`. Por ejemplo, si intenta modificar una característica/propiedad de solo lectura, se lanza una instancia de la clase `SAXNotSupportedException`. Además, esta excepción podría producirse si llama a `setFeature()` o `setProperty()` durante el análisis. Intentar configurar la característica de validación para un analizador que no realiza la validación es un escenario en el que se lanza una instancia de la clase `SAXNotRecognizedException`.

### TOURING THE HANDLER AND RESOLVER INTERFACES - VISITA A LAS INTERFACES HANDLER Y RESOLVER

Los controladores basados en interfaz instalados por `setContentHandler()`, `setDTDHandler()` y `setErrorHandler()`;  el resolver de entidades instalado por `setEntityResolver();` y el handler descrito por la propiedad `lexical-handler` proporciona varios métodos callback. Debe comprender estos métodos antes de poder codificarlos para responder eficazmente a los eventos de análisis.

#### Touring ContentHandler

`ContentHandler` declara los siguientes métodos callback informativos orientados al contenido:

* `void characters(char[] ch, int start, int length)` reporta los datos de caracteres de un elemento a través del array `ch`. Los argumentos que se pasan a `start` y a `length` identifican la parte del array que es relevante para esta llamada al método. Los caracteres se pasan a través de un array `char[]` en lugar de a través de un objeto `String` como una optimización del rendimiento. Los analizadores suelen almacenar una gran cantidad del documento en un array y pasan repetidamente una referencia a este array junto con los valores de `start` y `length` actualizados a los `characters()`.

* `void endDocument()` informa que se ha llegado al final del documento. Una aplicación puede utilizar este método para cerrar un archivo de salida o realizar alguna otra limpieza.

* `void endElement(String uri, String localName, String qName)` informa que se ha alcanzado el final de un elemento. `uri` identifica el URI del namespace del elemento o está vacío cuando no hay URI del namespace o no se ha habilitado el procesamiento del namespace. `localName` identifica el nombre local del elemento, que es el nombre sin prefijo (por ejemplo, el `html` en `html` o `h: html`). `qName` hace referencia al nombre calificado, por ejemplo, `h:html` o `html` cuando no hay prefijo. `endElement()` se invoca cuando se detecta una etiqueta final, o inmediatamente después de `startElement()` cuando se detecta una etiqueta de elemento vacío.

* `void endPrefixMapping(String prefix)` informa que se ha alcanzado el final de una asignación de prefijo de namespace (por ejemplo, `xmlns:h`), y el `prefix` informa de este prefijo (por ejemplo, `h`).

* `void ignorableWhitespace(char[] ch, int start, int length)` reporta *ignorable whitespace* (espacios en blanco ignorables) (espacios en blanco ubicados entre las etiquetas donde la DTD no permite contenido mixto). Este espacio en blanco se utiliza a menudo para sangrar etiquetas. Los parámetros tienen el mismo propósito que los del método `characters()`.

* `void processingInstruction(String target, String data)` informa una instrucción de procesamiento, en la cual el `target` (destino) identifica la aplicación a la que se dirige la instrucción y los datos proporcionan los datos de la instrucción (la referencia nula cuando no hay datos).

* `void setDocumentLocator(Locator locator)` informa un objeto `org.xml.sax.Locator` (una instancia de una clase que implementa la interfaz `Locator`) cuyos métodos `int getColumnNumber()`, `int getLineNumber()`, `String getPublicId()` y `String getSystemId()` pueden ser llamado para obtener información de ubicación en la posición final de cualquier evento relacionado con el documento, incluso cuando el analizador no informa un error. Este método se llama antes de `startDocument()` y es un buen lugar para guardar el objeto `Locator` para que se pueda acceder a él desde otros métodos callback.

* `void skippedEntity(String name)` informa todas las entidades omitidas. Los analizadores de validación resuelven todas las referencias de entidades generales, pero los analizadores de no validación tienen la opción de omitirlos porque los analizadores de no validación no leen DTD donde se declaran estas entidades. Si el analizador no validante no lee un DTD, no sabrá si una entidad está declarada correctamente. En lugar de intentar leer la DTD e informar el texto de reemplazo de la entidad, el analizador no validante llama a `skippedEntity()` con el nombre de la entidad.

* `void startDocument()` informa que se ha alcanzado el inicio del documento. Una aplicación puede utilizar este método para crear un archivo de salida o realizar alguna otra inicialización.

* `void startElement(String uri, String localName, String qName, Attributes attributes)` informa que se ha alcanzado el inicio de un elemento. `uri` identifica el URI del espacio de nombres del elemento o está vacío cuando no hay URI del namespace o no se ha habilitado el procesamiento del espacio de nombres. `localName` identifica el nombre local del elemento, `qName` hace referencia a su nombre calificado y `attributes` hace referencia a una lista de los atributos del elemento; esta lista está vacía cuando no hay atributos. `startElement()` se invoca cuando se detecta una etiqueta de inicio o una etiqueta de elemento vacío.

* `void startPrefixMapping(String prefix, String uri)` informa que se ha alcanzado el inicio de una asignación de prefijo de espacio de nombres (por ejemplo, `xmlns:h="http://www.w3.org/1999/xhtml"`), en el que el `prefix` informa de este prefix (como `h`) y `uri` informa el URI al que se asigna el prefijo (por ejemplo, http://www.w3.org/1999/xhtml).

Cada método, excepto `setDocumentLocator()`, se declara para lanzar `SAXException`, que un método de devolución de llamada primordial podría elegir lanzar cuando detecta un problema.

#### Touring DTDHandler

`DTDHandler` declara los siguientes métodos de devolución de llamada informativos orientados a DTD:

* `void notationDecl(String name, String publicId, String systemId)` informa una declaración de notación, en la que `name` proporciona el valor del atributo `name` de esta declaración, `publicId` proporciona el valor del atributo público de esta declaración (la referencia nula cuando este valor no está disponible) y `systemId` proporciona valor del atributo `system` de esta declaración.

* `void unparsedEntityDecl(String name, String publicId, String systemId, String notationName)` informa una declaración de entidad externa no analizada, en la que `name` proporciona el valor del atributo `name` de esta declaración, `publicId` proporciona el valor del atributo `public` (la referencia nula cuando este valor es no esta disponible), `systemId` proporciona el valor del atributo `system` y `notationName` proporciona el nombre `NDATA`.

Cada método se declara para lanzar(throw) `SAXException`, que un método overriding callback podría elegir lanzar cuando detecta un problema.

#### Touring ErrorHandler

`ErrorHandler` declara los siguientes métodos callback informativos orientados a errores:

* `void error(SAXParseException exception)` informa que se ha producido un error del analizador recuperable (normalmente el documento no es válido); los detalles se especifican mediante el argumento pasado a `exception`. Este método generalmente se anula para informar el error a través de una ventana de comando o para registrarlo en un archivo o base de datos.

* `void fatalError(SAXParseException exception)` informa que se ha producido un error irrecuperable del analizador (el documento no está bien formado); los detalles se especifican mediante el argumento pasado a `exception`. Este método generalmente se anula para que la aplicación pueda registrar el error antes de que deje de procesar el documento (porque el documento ya no es confiable).

* `void warning(SAXParseException e)` informa que se ha producido un error no grave (como el nombre de un elemento que comienza con la secuencia de caracteres `xml` reservada); los detalles se especifican mediante el argumento pasado a `exception`. Este método generalmente se anula para informar la advertencia a través de una consola o para registrarla en un archivo o base de datos.

Se declara que cada método arroja(throw) `SAXException`, que un método de devolución de llamada primordial podría elegir lanzar cuando detecta un problema.

#### Touring EntityResolver

EntityResolver declara el siguiente método de devolución de llamada:
Se llama a InputSource resolveEntity (String publicId, String systemId) para permitir que la aplicación resuelva una entidad externa (como un subconjunto DTD externo) al devolver un objeto InputSource personalizado que se basa en un URI diferente. Se declara que este método arroja SAXException cuando detecta un problema orientado a SAX y también se declara que arroja IOException cuando encuentra un error de E / S, posiblemente en respuesta a la creación de un objeto InputStream o un objeto java.io.Reader para InputSource siendo creado.


```java
```



```java
```


```java
```



```java
```


```java
```

```java
```













