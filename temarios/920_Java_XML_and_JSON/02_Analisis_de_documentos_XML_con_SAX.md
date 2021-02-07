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

`EntityResolver` declara el siguiente método callback:

* `InputSource resolveEntity(String publicId, String systemId)` es llamado para permitir que la aplicación resuelva una entidad externa (como un subconjunto DTD externo) al devolver un objeto `InputSource` personalizado que se basa en un URI diferente. Se declara que este método arroja(throw) `SAXException` cuando detecta un problema orientado a SAX y también se declara que arroja(throw) `IOException` cuando encuentra un error de I/O, posiblemente en respuesta a la creación de un objeto `InputStream` o un objeto `java.io.Reader` para `InputSource` siendo creado.

#### Touring LexicalHandler

`LexicalHandler` declara los siguientes métodos callback adicionales informativos orientados al contenido:

* `void comment(char[] ch, int start, int length)` reporta un comentario a través del array `ch`. Los argumentos que se pasan `start` y `length` identifican la parte del array que es relevante para esta llamada al método.

* `void endCDATA()` informa el final de una sección CDATA.

* `void endDTD()` informa el final de una DTD.

* `void endEntity(String name)` informa el final de la entidad identificada por `name`.

* `void startCDATA()` informa el inicio de una sección CDATA.

* `void startDTD(String name, String publicId, String systemId)` informa el inicio de la DTD identificado por `name. publicId` especifica el identificador público declarado para el subconjunto DTD externo o es la referencia nula cuando no se declaró ninguno. De manera similar, `systemId` especifica el identificador del sistema declarado para el subconjunto DTD externo o es la referencia nula cuando no se declaró ninguno.

* `void startEntity(String name)` informa el inicio de la entidad identificada por `name`.

Se declara que cada método arroja(throw) `SAXException`, que un método de devolución de llamada primordial podría elegir lanzar cuando detecta un problema.

Debido a que puede ser tedioso implementar todos los métodos en cada interfaz, la API de SAX proporciona convenientemente la clase de adaptador `org.xml.sax.helpers.DefaultHandler` para aliviarlo de este tedio. `DefaultHandler` implementa `ContentHandler`, `DTDHandler`, `EntityResolver` y `ErrorHandler`. SAX también proporciona `org.xml.sax.ext.DefaultHandler2`, que es una subclase de `DefaultHandler` y que también implementa `LexicalHandler`.

<hr>

## Demostrando la API de SAX

El Listado 2-1 presenta el código fuente de `SAXDemo`, una aplicación que demuestra la API de SAX. La aplicación consta de una clase de punto de entrada `SAXDemo` y una subclase `Handler` de `DefaultHandler2`.

```java
import java.io.FileReader;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import static java.lang.System.*;

public class SAXDemo{
   
   final static String FEAT_NSP = "http://xml.org/sax/features/namespace-prefixes";
   final static String FEAT_VAL = "http://xml.org/sax/features/validation";
   final static String PROP_LH = "http://xml.org/sax/properties/lexical-handler";
   
   public static void main(String[] args){
   
      if (args.length < 1 || args.length > 2){
         err.println("usage: java SAXDemo xmlfile [v]");
         return;
      }
      try{
         SAXParserFactory spf = SAXParserFactory.newInstance();
         spf.setNamespaceAware(true);
         SAXParser sp = spf.newSAXParser();
         XMLReader xmlr = sp.getXMLReader();
         if (args.length == 2 && args[1].equals("v"))
            xmlr.setFeature(FEAT_VAL, true);
         xmlr.setFeature(FEAT_NSP, true);
         Handler handler = new Handler();
         xmlr.setContentHandler(handler);
         xmlr.setDTDHandler(handler);
         xmlr.setEntityResolver(handler);
         xmlr.setErrorHandler(handler);
         xmlr.setProperty(PROP_LH, handler);
         FileReader fr = new FileReader(args[0]);
         xmlr.parse(new InputSource(fr));
      }catch (IOException ioe) {
         err.printf("IOE: %s%n", ioe.toString());
      }catch (ParserConfigurationException pce) {
         err.printf("PCE: %s%n", pce.toString());
      }catch (SAXException saxe) {
         err.printf("SAXE: %s%n", saxe.toString());
      }
   }
}
```
***Listado 2-1*** SAXDemo

El método `main()` de `SAXDemo` primero verifica que se hayan especificado uno o dos argumentos de la línea de comandos (el nombre de un documento XML seguido opcionalmente por una letra minúscula `v`, que le dice a `SAXDemo` que cree un analizador de validación). Luego crea un objeto `XMLReader`; habilita condicionalmente la característica `validation` y habilita la característica de `namespace-prefixes`; crea una instancia de la clase `Handler` complementaria; instala este objeto `Handler` como el controlador de contenido del analizador, el DTD handler, el entity resolver(solucionador de entidades) y el error handler(controlador de errores); instala este objeto `Handler` como el valor de la propiedad `lexical-handler`; crea una fuente de entrada para leer el documento desde un archivo; y analiza el documento.

El código fuente de la clase `Handler` se presenta en el Listado 2-2.

```java
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.Locator;
import org.xml.sax.SAXParseException;
import org.xml.sax.ext.DefaultHandler2;
import static java.lang.System.*;
public class Handler extends DefaultHandler2{
   
   private Locator locator;
   
   @Override
   public void characters(char[] ch, int start, int length){
      out.print("characters() [");
      for (int i = start; i < start + length; i++)
         out.print(ch[i]);
      out.println("]");
   }
   
   @Override
   public void comment(char[] ch, int start, int length){
      out.print("characters() [");
      for (int i = start; i < start + length; i++)
         out.print(ch[i]);
      out.println("]");
   }
   
   @Override
   public void endCDATA(){
      out.println("endCDATA()");
   }
   
   @Override
   public void endDocument(){
      out.println("endDocument()");
   }
   
   @Override
   public void endDTD(){
      out.println("endDTD()");
   }
   
   @Override
   public void endElement(String uri, String localName, String qName){
      out.print("endElement() ");
      out.printf("uri=[%s], ", uri);
      out.printf("localName=[%s], ", localName);
      out.printf("qName=[%s]%n", qName);
   }
   
   @Override
   public void endEntity(String name){
      out.print("endEntity() ");
      out.printf("name=[%s]%n", name);
   }
   
   @Override
   public void endPrefixMapping(String prefix){
      out.print("endPrefixMapping() ");
      out.printf("prefix=[%s]%n", prefix);
   }
   
   @Override
   public void error(SAXParseException saxpe){
      out.printf("error() %s%n", saxpe.toString());
   }
   
   @Override
   public void fatalError(SAXParseException saxpe){
      out.printf("fatalError() %s%n", saxpe.toString());
   }
   
   @Override
   public void ignorableWhitespace(char[] ch, int start, int length){
      out.print("ignorableWhitespace() [");
      for (int i = start; i < start + length; i++)
         out.print(ch[i]);
      out.println("]");
   }
   
   @Override
   public void notationDecl(String name, String publicId, String systemId){
      out.print("notationDecl() ");
      out.printf("name=[%s], ", name);
      out.printf("publicId=[%s], ", publicId);
      out.printf("systemId=[%s]%n", systemId);
   }
   
   @Override
   public void processingInstruction(String target, String data){
      out.print("processingInstruction() ");
      out.printf("target=[%s], ", target);
      out.printf("data=[%s]%n", data);
   }
   
   @Override
   public InputSource resolveEntity(String publicId, String systemId){
      out.print("resolveEntity() ");
      out.printf("publicId=[%s], ", publicId);
      out.printf("systemId=[%s]%n", systemId);
      // Do not perform a remapping.
      InputSource is = new InputSource();
      is.setPublicId(publicId);
      is.setSystemId(systemId);
      return is;
   }
   
   @Override
   public void setDocumentLocator(Locator locator){
      out.print("setDocumentLocator() ");
      out.printf("locator=[%s]%n", locator);
      this.locator = locator;
   }
   
   @Override
   public void skippedEntity(String name){
      out.print("skippedEntity() ");
      out.printf("name=[%s]%n", name);
   }
   
   @Override
   public void startCDATA(){
      out.println("startCDATA()");
   }
   
   @Override
   public void startDocument(){
      out.println("startDocument()");
   }
   
   @Override
   public void startDTD(String name, String publicId, String systemId){
      out.print("startDTD() ");
      out.printf("name=[%s], ", name);
      out.printf("publicId=[%s], ", publicId);
      out.printf("systemId=[%s]%n", systemId);
   }
   
   @Override
   public void startElement(String uri, String localName, String qName, Attributes attributes){
      out.print("startElement() ");
      out.printf("uri=[%s], ", uri);
      out.printf("localName=[%s], ", localName);
      out.printf("qName=[%s]%n", qName);
      for (int i = 0; i < attributes.getLength(); i++)
         out.printf("  Attribute: %s, %s%n", attributes.getLocalName(i),
                            attributes.getValue(i));
      out.printf("Column number=[%d]%n", locator.getColumnNumber());
      out.printf("Line number=[%d]%n", locator.getLineNumber());
   }
   
   @Override
   public void startEntity(String name){
      out.print("startEntity() ");
      out.printf("name=[%s]%n", name);
   }
   
   @Override
   public void startPrefixMapping(String prefix, String uri){
      out.print("startPrefixMapping() ");
      out.printf("prefix=[%s], ", prefix);
      out.printf("uri=[%s]%n", uri);
   }
   
   @Override
   public void unparsedEntityDecl(String name,
                                  String publicId,
                                  String systemId,
                                  String notationName){
      out.print("unparsedEntityDecl() ");
      out.printf("name=[%s], ", name);
      out.printf("publicId=[%s], ", publicId);
      out.printf("systemId=[%s], ", systemId);
      out.printf("notationName=[%s]%n", notationName);
   }
   
   @Override
   public void warning(SAXParseException saxpe){
      out.printf("warning() %s%n", saxpe.toString());
   }
}
```
***Listado 2-2*** `Handler`

La subclase `Handler` es bastante sencilla; genera toda la información posible sobre un documento XML, sujeto a la configuración de características y propiedades. Esta clase le resultará útil para explorar el orden en el que ocurren los eventos junto con varias características y propiedades.

Suponiendo que los archivos basados en los listados 2-1 y 2-2 se encuentran en el mismo directorio, compílelos de la siguiente manera:

```sh
javac SAXDemo.java
```

Ejecute el siguiente comando para analizar el documento `svg-examples.xml` del Listado 1-4:

```sh
java SAXDemo svg-examples.xml
```

`SAXDemo` responde presentando la siguiente salida (el hashcode probablemente será diferente):

```sh
setDocumentLocator() locator=[com.sun.org.apache.xerces.internal.parsers.AbstractSAXParser$LocatorProxy@53b32d7]
startDocument()
startElement() uri=[], localName=[svg-examples], qName=[svg-examples]
Column number=[15]
Line number=[2]
characters() [
   ]
startElement() uri=[], localName=[example], qName=[example]
Column number=[13]
Line number=[3]
characters() [
      The following Scalable Vector Graphics document ]
characters() [
      describes a blue-filled and black-stroked
      rectangle.]
characters() [
      ]
startCDATA()
characters() [<svg width="100%" height="100%"
           version="1.1"
           xmlns="http://www.w3.org/2000/svg">
         <rect width="300" height="100"
               style="fill:rgb(0,0,255);stroke-width:1;
                      stroke:rgb(0,0,0)"/>
      </svg>]
endCDATA()
characters() [
   ]
endElement() uri=[], localName=[example], qName=[example]
characters() [
]
endElement() uri=[], localName=[svg-examples], qName=[svg-examples]
endDocument()
```

La primera línea de salida demuestra que `setDocumentLocator()` se llama primero. La segunda y tercera líneas también identifican el objeto `Locator` cuyos métodos `getColumnNumber()` y `getLineNumber()` son llamados para generar la ubicación del analizador cuando se llama a `startElement()`; estos métodos devuelven números de columna y línea que comienzan en 1.

Tal vez sienta curiosidad por las cuatro instancias del siguiente resultado:

```sh
characters() [
   ]
```

La instancia de esta salida que sigue a la salida `endCDATA()` informa una combinación de retorno de carro/salto de línea que no se incluyó en la llamada al método `characters()` anterior, que pasó el contenido de la sección CDATA menos estos caracteres de terminación de línea. Este es también el caso de la instancia de esta salida que sigue a la salida `rectangle.]`. En contraste, las instancias de esta salida que siguen a la llamada `startElement()` para `svg-examples` y siguen la llamada `endElement()`, por `example`, son algo curiosas. No hay contenido entre `<svg-examples>` y `<example>`, y entre `</example>` y `</svg-examples>`, ¿o sí?

Puede satisfacer esta curiosidad modificando `svg-examples.xml` para incluir un DTD interno. Coloque el siguiente DTD (que indica que un elemento `svg-examples` contiene uno o más elementos de ejemplo y que un elemento `example` contiene datos de caracteres analizados) entre la declaración XML y la etiqueta de inicio `<svg-examples>`:


```xml
<!DOCTYPE svg-examples [
<!ELEMENT svg-examples (example+)>
<!ELEMENT example (#PCDATA)>
]>
```

Continuando, ejecute el siguiente comando:

```sh
java SAXDemo svg-examples.xml
```

Esta vez, debería ver el siguiente resultado (aunque el hashcode probablemente será diferente):

```sh
setDocumentLocator() locator=[com.sun.org.apache.xerces.internal.parsers.AbstractSAXParser$LocatorProxy@53b32d7]
startDocument()
startDTD() name=[svg-examples], publicId=[null], systemId=[null]
endDTD()
startElement() uri=[], localName=[svg-examples], qName=[svg-examples]
Column number=[15]
Line number=[6]
ignorableWhitespace() [
   ]
startElement() uri=[], localName=[example], qName=[example]
Column number=[13]
Line number=[7]
characters() [
      The following Scalable Vector Graphics document
      describes a blue-filled and black-stroked ]
characters() [
      rectangle.
      ]
startCDATA()
characters() [<svg width="100%" height="100%"
           version="1.1"
           xmlns="http://www.w3.org/2000/svg">
         <rect width="300" height="100"
               style="fill:rgb(0,0,255);stroke-width:1;
                      stroke:rgb(0,0,0)"/>
      </svg>]
endCDATA()
characters() [
   ]
endElement() uri=[], localName=[example], qName=[example]
ignorableWhitespace() [
]
endElement() uri=[], localName=[svg-examples], qName=[svg-examples]
endDocument()
```

Esta salida revela que el método `ignorableWhitespace()` fue llamado después de `startElement()` para `svg-examples` y después de `endElement()` por `example`. Las dos primeras llamadas a `characters()` que produjeron la salida extraña informaban espacios en blanco ignorables.

Recuerde que anteriormente definí los *ignorable whitespace* (espacios en blanco ignorables) como espacios en blanco ubicados entre etiquetas donde la DTD no permite contenido mixto. Por ejemplo, la DTD indica que `svg-examples` debe contener solo elementos `example`, no elementos `example` y datos de caracteres analizados. Sin embargo, el terminador de línea que sigue a la etiqueta `<svg-examples>` y el espacio en blanco inicial antes de `<example>` son datos de caracteres analizados. El analizador ahora informa estos caracteres llamando a `ignorableWhitespace()`.

Esta vez, solo hay dos apariciones de la siguiente salida:

```sh
characters() [
   ]
```

La primera aparición informa el terminador de línea por separado del texto del elemento `example` (antes de la sección CDATA); no lo hizo anteriormente, lo que demuestra que se llama a `characters()` con todo o parte del contenido de un elemento. Una vez más, la segunda aparición informa del terminador de línea que sigue a la sección CDATA.

Validemos `svg-examples.xml` sin el DTD interno presentado anteriormente. Lo haremos ejecutando el siguiente comando; no olvide incluir el argumento de la línea de comando `v` o el documento no se validará:

```sh
java SAXDemo svg-examples.xml v
```

Entre su salida se encuentran el siguiente `error()` - líneas prefijadas:

```sh
error() org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 14; Document is invalid: no grammar found.
error() org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 14; Document root element "svg-examples", must match DOCTYPE root "null".
```

Estas líneas revelan que no se ha encontrado una gramática DTD. Además, el analizador informa una falta de coincidencia entre `svg-examples` (considera que el primer elemento encontrado es el elemento raíz) y `null` (considera `null` como el nombre del elemento raíz en ausencia de una DTD). Ninguna violación se considera fatal, por lo que se llama a `error()` en lugar de `fatalError()`.

Agregue el DTD interno a `svg-examples.xml` y vuelva a ejecutar `java SAXDemo svg-examples.xml v`. Esta vez, no debería ver ningún `error()` - líneas prefijadas en la salida.

> **TIP** La validación de SAX 2 tiene como valor predeterminado la validación contra una DTD. En su lugar, para validar con un esquema basado en XML Schema, agregue la propiedad `schemaLanguage` con el valor http://www.w3.org/2001/XMLSchema al objeto `XMLReader`. Realice esta tarea para `SAXDemo` especificando `xmlr.setProperty(" http://java.sun.com/xml/jaxp/properties/schemaLanguage ", " http://www.w3.org/2001/XMLSchema "); before xmlr.parse(new InputSource(new FileReader(args[0])));`.

<hr>

## Creación de Custom Entity Resolver

Mientras exploraba XML en el Capítulo 1, le presenté el concepto de *entities*, que son datos con alias. Luego discutí las entidades generales y las entidades paramétricas en términos de sus variantes internas y externas.

A diferencia de las entidades internas, cuyos valores se especifican en una DTD, los valores de las entidades externas se especifican fuera de una DTD y se identifican mediante identificadores públicos y/o del sistema. El identificador del sistema es un URI, mientras que el identificador público es un identificador público formal.

Un analizador XML lee una entidad externa (incluido el subconjunto DTD externo) a través de un objeto `InputSource` que está conectado al identificador del sistema apropiado. En muchos casos, pasa un identificador del sistema o un objeto `InputSource` al analizador y deja que descubra dónde encontrar otras entidades a las que se hace referencia desde la entidad del documento actual.

Sin embargo, por razones de rendimiento u otras razones, es posible que desee que el analizador lea el valor de la entidad externa de un identificador de sistema diferente, como un identificador de sistema de copia DTD local. Puede realizar esta tarea creando un sistema de resolución de entidades que utilice el identificador público para elegir un identificador de sistema diferente. Al encontrar una entidad externa, el analizador llama al solucionador de entidades personalizado para obtener este identificador.

Considere la especificación formal del Listado 2-3 de la receta de sándwich de queso a la parrilla del Listado 1-1.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE recipeml PUBLIC
   "-//FormatData//DTD RecipeML 0.5//EN"
   "http://www.formatdata.com/recipeml/recipeml.dtd">
<recipeml version="0.5">
   <recipe>
      <head>
         <title>Grilled Cheese Sandwich</title>
      </head>
      <ingredients>
         <ing>
            <amt><qty>2</qty><unit>slice</unit></amt>
            <item>bread</item>
         </ing>
         <ing>
            <amt><qty>1</qty><unit>slice</unit></amt>
            <item>cheese</item>
         </ing>
         <ing>
            <amt><qty>2</qty><unit>pat</unit></amt>
            <item>margarine</item>
         </ing>
      </ingredients>
      <directions>
         <step>Place frying pan on element and select
         medium heat.</step>
         <step>For each bread slice, smear one pat of
         margarine on one side of bread slice.</step>
         <step>Place cheese slice between bread slices with
         margarine-smeared sides away from the
         cheese.</step>
         <step>Place sandwich in frying pan with one
         margarine-smeared size in contact with pan.</step>
         <step>Fry for a couple of minutes and flip.</step>
         <step>Fry other side for a minute and
         serve.</step>
      </directions>
   </recipe>
</recipeml>
```
***Listado 2-3*** Receta basada en XML para un Sándwich de Queso a la Parrilla Especificado en el Lenguaje de Marcado de Recetas

El Listado 2-3 especifica la receta de sándwich de queso a la parrilla en *Recipe Markup Language* (*RecipeML*), un lenguaje basado en XML para marcar recetas. (Una empresa llamada FormatData [consulte www.formatdata.com] lanzó este formato en 2000).

La declaración de tipo de documento informa: `-//FormatData//DTD RecipeML 0.5//EN` como identificador público formal y http://www.formatdata.com/recipeml/recipeml.dtd como identificador del sistema. En lugar de mantener el mapeo predeterminado, mapeemos este identificador público formal a `recipeml.dtd`, un identificador del sistema para una copia local de este archivo DTD.

Para crear un resolutor de entidad personalizado para realizar esta asignación, declaramos una clase que implementa la interfaz `EntityResolver` en términos de su método `InputSource resolveEntity(String publicId, String systemId)`. Luego usamos el valor de `publicId` proporcionado como una clave en un mapa que apunta al valor de `systemId` deseado, y luego usamos este valor para crear y devolver un `InputSource` personalizado. El listado 2-4 presenta la clase resultante.

```java
import java.util.HashMap;
import java.util.Map;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import static java.lang.System.*;

public class LocalRecipeML implements EntityResolver{

   private Map<String, String> mappings = new HashMap<>();
   
   LocalRecipeML(){
      mappings.put("-//FormatData//DTD RecipeML 0.5//EN", "recipeml.dtd");
   }
   
   @Override
   public InputSource resolveEntity(String publicId, String systemId){
      if (mappings.containsKey(publicId)){
         out.println("obtaining cached recipeml.dtd");
         systemId = mappings.get(publicId);
         InputSource localSource = new InputSource(systemId);
         return localSource;
      }
      return null;
   }
}
```
***Listado 2-4*** `LocalRecipeML`

El Listado 2-4 declara `LocalRecipeML`. El constructor de esta clase almacena el identificador público formal para el DTD RecipeML y el identificador del sistema para una copia local del documento de este DTD en un mapa.

> **NOTA**: Aunque no es necesario utilizar un mapa en este ejemplo (un `if (publicId.equals("-//FormatData//DTD RecipeML 0.5//EN")) return new InputSource("recipeml.dtd") else return null;` declaración sería suficiente), he optado por utilizar un mapa en caso de que quiera ampliar el número de asignaciones en el futuro. En otro escenario, probablemente encontrará un mapa muy conveniente. Por ejemplo, es más fácil usar un mapa que usar una serie de declaraciones `if` en un entity resolver personalizado que mapea los identificadores públicos formales estrictos, de transición y de conjunto de marcos de XHTML y también asigna sus diversos conjuntos de entidades a copias locales de estos archivos de documentos.

El método overriding `resolveEntity()` usa el argumento de `publicId` para ubicar el identificador del sistema correspondiente en el mapa; el valor del parámetro `systemId` se ignora porque nunca se refiere a la copia local de `recipeml.dtd`. Cuando se encuentra la asignación, se crea y se devuelve un objeto `InputSource`. Si no se puede encontrar la asignación, se devolverá un valor `null`.

Para instalar este entity resolver personalizado en `SAXDemo`, especifique `xmlr.setEntityResolver(new LocalRecipeML());` antes de la llamada al método `parse()`. Después de recompilar el código fuente, ejecute el siguiente comando:

```sh
java SAXDemo gcs.xml
```

Aquí, `gcs.xml` almacena el texto de la Lista 2-3. En la salida resultante, debe observar el mensaje `“obtaining cached recipeml.dtd”` antes de la llamada a `startEntity()`.

> **TIP** La API SAX incluye una interfaz `org.xml.sax.ext.EntityResolver2` que proporciona un soporte mejorado para la resolución de entidades. Si prefiere implementar `EntityResolver2` en lugar de `EntityResolver`, reemplace la llamada `setEntityResolver()` para instalar el entity resolver con una llamada `setFeature()` cuyo nombre de característica es `use-entity-resolver2` (no olvide http://xml.org/sax/features/prefix).


#### EJERCICIOS

Los siguientes ejercicios están diseñados para evaluar su comprensión del contenido del Capítulo 2:

1. Defina SAX.
2. ¿Cómo se obtiene un analizador basado en SAX 2?
3. ¿Cuál es el propósito de la interfaz XMLReader?
4. ¿Cómo se le dice a un analizador SAX que realice la validación?
5. Identifique los cuatro tipos de excepciones orientadas a SAX que se pueden generar al trabajar con SAX.
6. ¿Qué interfaz implementa una clase de controlador para responder a eventos orientados al contenido?
7. Identifique las otras tres interfaces principales que es probable que implemente una clase de controlador.
8. Defina ignorable whitespace (espacios en blanco ignorables).
9. Verdadero o falso: se llama al `void error(SAXParseException exception)` para todo tipo de errores.
10. ¿Cuál es el propósito de la clase `DefaultHandler`?
11. ¿Qué es una entidad? ¿Qué es un solucionador de entidades?
12. Apache Tomcat es un servidor web de código abierto desarrollado por Apache Software Foundation. Tomcat almacena nombres de usuario, contraseñas y roles (con fines de autenticación) en su archivo de configuración `tomcat-users.xml`. Cree una aplicación `DumpUserInfo` que utilice SAX para analizar los elementos `user` en el siguiente archivo `tomcat-users.xml` de ejemplo y, para cada elemento `user`, descargue los valores de los atributos `username`, `password` y `roles` en la salida estándar en un formato *`key=value`*:

```xml
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
   <role rolename="dbadmin"/>
   <role rolename="manager"/>
   <user username="JohnD" password="password1"
         roles="dbadmin,manager"/>
   <user username="JillD" password="password2"
         roles="manager"/>
</tomcat-users>
```
 
13. Cree una aplicación `SAXSearch` que busque en el archivo `books.xml` del ejercicio 1-21 aquellos elementos `book` cuyos elementos hijos `publisher` contengan texto que sea igual al argumento del nombre del editor de la línea de comandos única de la aplicación. Una vez que haya una coincidencia, muestre el texto del elemento `title` seguido del valor del atributo `isbn` del elemento `book`. Por ejemplo, `java SAXSearch Apress` debería generar `title = Beginning Groovy and Grails, isbn = 9781430210450`, mientras que `java SAXSearch "Addison Wesley" should output title = Advanced C++, isbn = 0201548550` seguido de `title = Effective Java, isbn = 0201310058` en líneas separadas. No debe aparecer nada cuando el argumento del nombre del editor de la línea de comandos no coincide con el texto de un elemento `publisher`.

 
14. Utilice la aplicación `SAXDemo` del Listado 2-1 para validar el contenido `books.xml` del Ejercicio 1-22 con su DTD. Ejecute `java SAXDemo books.xml -v` para realizar la validación.

## Resumen

SAX es una API Java basada en eventos para analizar un documento XML de forma secuencial de principio a fin. Cuando un analizador orientado a SAX encuentra un elemento del conjunto de información del documento, hace que este elemento esté disponible para una aplicación como un evento llamando a uno de los métodos en uno de los controladores de la aplicación, que la aplicación ha registrado previamente con el analizador. La aplicación puede consumir este evento procesando el elemento del conjunto de información de alguna manera.

SAX existe en dos versiones principales: SAX 1 y SAX 2. Java implementa ambas versiones a través de las clases abstractas `SAXParser` y `SAXParserFactory` del paquete `javax.xml.parsers`. Los paquetes `org.xml.sax`, `org.xml.sax.ext` y `org.xml.sax.helpers` proporcionan varios tipos que aumentan ambas implementaciones de Java.

`XMLReader` pone a disposición varios métodos para configurar el analizador y analizar el contenido de un documento. Algunos de estos métodos obtienen y configuran el content handler, el DTD handler, el entity resolver y el error handler, que se describen en las interfaces `ContentHandler`, `DTDHandler`, `EntityResolver` y `ErrorHandler`. Después de aprender sobre los métodos de `XMLReader` y estas interfaces, aprendió sobre la interfaz `LexicalHandler` no estándar y cómo crear un custom entity resolver.

El Capítulo 3 presenta la API DOM de Java para parsing/creating (analizar/crear) documentos XML.
