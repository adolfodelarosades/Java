# Capítulo 3: Análisis(Parsing) y Creación de Documentos XML con DOM

* What Is DOM?
* A Tree of Nodes
* Exploring the DOM API
   * Obtaining a DOM Parser/Document Builder
   * Parsing and Creating XML Documents
* Demonstrating the DOM API
   * Parsing an XML Document
   * Creating an XML Document
* Working with Load and Save
   * Loading an XML Document into a DOM Tree
   * Configuring a Parser
   * Filtering an XML Document While Parsing
   * Saving a DOM Tree to an XML Document
* Working with Traversal and Range
   * Performing Traversals
   * Performing Range Operations
* Summary

<hr>

SAX puede analizar documentos XML pero no puede crearlos. Por el contrario, DOM puede analizar y crear documentos XML. El capítulo 3 le presenta DOM. 

<hr>

## ¿Qué es DOM?

*Document Object Model (DOM)* es una API de Java para analizar un documento XML en un árbol de nodos en memoria y para crear un documento XML a partir de un árbol de nodos. Después de que un analizador DOM crea un árbol, una aplicación utiliza la API DOM para navegar y extraer elementos del conjunto de información de los nodos del árbol.

DOM tiene dos grandes ventajas sobre SAX:

* DOM permite el acceso aleatorio a los elementos del conjunto de información de un documento, mientras que SAX solo permite el acceso en serie.

* DOM también le permite crear documentos XML, mientras que solo puede analizar documentos con SAX.

Sin embargo, SAX es ventajoso sobre DOM porque puede analizar documentos de tamaño arbitrario, mientras que el tamaño de los documentos analizados o creados por DOM está limitado por la cantidad de memoria disponible para almacenar la estructura de árbol basada en nodos del documento.

> **NOTA** DOM se originó como un modelo de objetos para los navegadores web Netscape Navigator 3 y Microsoft Internet Explorer 3. En conjunto, estas implementaciones se conocen como DOM Nivel 0. Debido a que la implementación DOM de cada proveedor era solo ligeramente compatible con la otra, el W3C posteriormente se hizo cargo del desarrollo de DOM para promover la estandarización y hasta ahora ha lanzado los niveles DOM 1, 2, 3 y 4. . Java 11 admite los tres primeros niveles DOM a través de su API DOM.

<hr>

## Un Árbol de Nodos

DOM ve un documento XML como un árbol que se compone de varios tipos de nodos. Este árbol tiene un solo *root node* (nodo raíz) y todos los nodos, excepto la raíz, tienen un *parent node* (nodo principal). Además, cada nodo tiene una lista de *child nodes* (nodos secundarios). Cuando esta lista está vacía, el nodo hijo se conoce como *leaf node* (nodo hoja).

> **NOTA** DOM permite que existan nodos que no forman parte de la estructura del árbol. Por ejemplo, los nodos de atributo de un nodo de elemento no se consideran nodos hijos del nodo de elemento. Además, los nodos se pueden crear pero no insertar en el árbol; también se pueden quitar del árbol.

Cada nodo tiene un *node name* (nombre de nodo), que es el nombre completo de los nodos que tienen nombres (como el nombre prefijado de un elemento o de un atributo) y `#node-type` para nodos sin nombre, donde el *node-type* (tipo de nodo) es uno de `cdata-section`, `comment`, `document`, `document-fragment`, o `text`. Los nodos también tienen *local names* - nombres locales (nombres sin prefijos), prefijos y namespace URIs (aunque estos atributos pueden ser nulos para ciertos tipos de nodos, como comentarios). Finalmente, los nodos tienen valores de cadena, que resultan ser el contenido de los nodos de texto, los nodos de comentarios y nodos similares orientados al texto; valores normalizados para atributos; y nulo para todo lo demás.

DOM clasifica los nodos en 12 tipos; la mayoría de ellos pueden considerarse parte de un *DOM tree* (árbol DOM). Todos estos tipos se describen a continuación:

* ***Attribute node***: uno de los atributos de un elemento. Tiene un nombre, un nombre local, un prefijo, un URI de espacio de nombres y un valor de cadena normalizado. El valor se *normaliza* resolviendo cualquier referencia de entidad y convirtiendo secuencias de espacios en blanco en un solo carácter de espacio en blanco. Un nodo de atributo tiene hijos, que son el texto y cualquier nodo de referencia de entidad que forme su valor. Los nodos de atributo no se consideran hijos de sus nodos de elementos asociados.

* ***CDATA section node***: el contenido de una sección CDATA. Su nombre es `#cdata-section` y su valor es el texto de la sección CDATA.

* ***Comment node***: comentario de un documento. Su nombre es `#comment` y su valor es el texto del comentario. Un nodo de comentario tiene un padre, que es el nodo que contiene el comentario.

* ***Document node***: la raíz de un árbol DOM. Su nombre es `#document`, siempre tiene un nodo hijo de un solo elemento, y también tendrá un nodo hijo de tipo de documento cuando el documento tenga una declaración de tipo de documento. Además, puede tener nodos secundarios adicionales que describen comentarios o instrucciones de procesamiento que aparecen antes o después de la etiqueta de inicio del elemento raíz. Solo puede haber un nodo de documento en el árbol.

* ***Document fragment node***: un nodo raíz alternativo. Su nombre es `#document-fragment` y contiene todo lo que puede contener un nodo de elemento (como otros nodos de elemento e incluso nodos de comentario). Un analizador nunca crea este tipo de nodo. Sin embargo, una aplicación puede crear un nodo de fragmento de documento cuando extrae parte de un árbol DOM para moverlo a otro lugar. Los nodos de fragmentos de documentos le permiten trabajar con subárboles.

* ***Document type node***: una declaración de tipo de documento. Su nombre es el nombre especificado por la declaración del tipo de documento para el elemento raíz. Además, tiene un identificador público (posiblemente nulo), un identificador de sistema requerido, un subconjunto DTD interno (que posiblemente sea nulo), un padre (el nodo de documento que contiene el nodo de tipo de documento) y listas de notaciones declaradas DTD y entidades generales. Su valor siempre se establece en nulo.

* ***Element node*** : elemento de un documento. Tiene un nombre, un nombre local, un prefijo (posiblemente nulo) y un URI de espacio de nombres, que es nulo cuando el elemento no pertenece a ningún espacio de nombres. Un nodo de elemento contiene hijos, incluidos nodos de texto e incluso nodos de comentarios e instrucciones de procesamiento.

* ***Entity node***: las entidades analizadas y no analizadas que se declaran en la DTD de un documento. Cuando un analizador lee un DTD, adjunta un mapa de nodos de entidad (indexados por nombre de entidad) al nodo de tipo de documento. Un nodo de entidad tiene un nombre y un identificador de sistema y también puede tener un identificador público si aparece alguno en la DTD. Finalmente, cuando el analizador lee la entidad, el nodo de la entidad recibe una lista de nodos secundarios de solo lectura que contienen el texto de reemplazo de la entidad.

* ***Entity reference node***: una referencia a una entidad declarada DTD. Cada nodo de referencia de entidad tiene un nombre y se incluye en el árbol cuando el analizador no reemplaza las referencias de entidad con sus valores. El analizador nunca incluye nodos de referencia de entidad para referencias de caracteres (como `&` o `Σ`) porque son reemplazados por sus respectivos caracteres y se incluyen en un nodo de texto.

* ***Notation node***: una notación declarada por DTD. Un analizador que lee la DTD adjunta un mapa de nodos de notación (indexados por nombre de notación) al nodo de tipo de documento. Cada nodo de notación tiene un nombre y un identificador público o un identificador del sistema, cualquiera que sea el identificador que se utilizó para declarar la notación en la DTD. Los nodos de notación no tienen hijos.

* ***Processing-instruction node***: una instrucción de procesamiento que aparece en el documento. Tiene un nombre (el objetivo de la instrucción), un valor de cadena (los datos de la instrucción) y un padre (su nodo contenedor).

* ***Text node***: contenido del documento. Su nombre es `#text` y representa una parte del contenido de un elemento cuando se debe crear un nodo intermedio (como un comentario). Los caracteres como `<` y `&` que se representan en el documento mediante referencias de caracteres se reemplazan por los caracteres literales que representan. Cuando estos nodos se escriben en un documento, estos caracteres deben escaparse.

Aunque estos tipos de nodos almacenan considerable información sobre un documento XML, existen limitaciones, como no exponer espacios en blanco fuera del elemento raíz. Además, la mayoría de la información de DTD o esquema, como los tipos de elementos (`<!ELEMENT...>`) y los tipos de atributos (`<xs:attribute...>`), no se puede acceder a través del DOM.

DOM Level 3 aborda algunas de las diversas limitaciones de DOM. Por ejemplo, aunque DOM no proporciona un tipo de nodo para la declaración XML, DOM Nivel 3 hace posible acceder a `version`, `encoding` y `standalone` de atributos independientes de la declaración XML a través de los atributos del nodo del documento.

> **NOTA** Los nodos Nonroot nunca existen de forma aislada. Por ejemplo, nunca se da el caso de que un nodo de elemento no pertenezca a un documento o a un fragmento de documento. Incluso cuando dichos nodos están desconectados del árbol principal, siguen siendo conscientes del documento o fragmento de documento al que pertenecen.

<hr>

## Explorando la API DOM

Java implementa DOM a través de las clases abstractas `DocumentBuilder` y `DocumentBuilderFactory` del paquete `javax.xml.parsers` y las clases no abstractas `FactoryConfigurationError` y `ParserConfigurationException`. Los `org.w3c.dom`, `org.w3c.dom.bootstrap`, `org.w3c.dom.events`, `org.w3c.dom.ls`, `org.w3c.dom.ranges`, `org.w3c.dom.traversal` y `org.w3c.dom.views` los paquetes proporcionan varios tipos que aumentan esta implementación.

### OBTENER UN DOM PARSER/DOCUMENT BUILDER

Un DOM parser también se conoce como *document builder* (creador de documentos) debido a su doble función en el análisis y la creación de documentos XML. Usted obtiene un DOM parser/document builder primero instanciando `DocumentBuilderFactory`, llamando a uno de sus métodos de clase `newInstance()`. Por ejemplo, el siguiente fragmento de código invoca el método de clase `DocumentBuilderFactory newInstance()` de `DocumentBuilderFactory`:

```java
DocumentBuilderFactory dbf =
   DocumentBuilderFactory.newInstance();
```

Detrás de escena, `newInstance()` sigue un procedimiento de búsqueda ordenado para identificar la clase de implementación `DocumentBuilderFactory` que se cargará. Este procedimiento primero examina la propiedad del sistema `javax.xml.parsers.DocumentBuilderFactory` y, por último, elige la clase de implementación `DocumentBuilderFactory` predeterminada de la plataforma Java cuando no se encuentra ninguna otra clase. Si una clase de implementación no está disponible (quizás la clase identificada por la propiedad del sistema `javax.xml.parsers.DocumentBuilderFactory` no existe) o no se puede instanciar, `newInstance()` arroja una instancia de la clase `FactoryConfigurationError`. De lo contrario, crea una instancia de la clase y devuelve su instancia.

Después de obtener una instancia de `DocumentBuilderFactory`, puede llamar a varios métodos de configuración para configurar la fábrica. Por ejemplo, puede llamar al método `void setNamespaceAware(boolean awareness)` de `DocumentBuilderFactory` con un argumento verdadero para decirle a la fábrica que cualquier constructor de documentos devuelto debe proporcionar soporte para espacios de nombres XML. También puede llamar a `void setValidating(boolean validating)` con `true` como argumento para validar documentos con sus DTD o llamar a `void setSchema(Schema schema)` para validar documentos con la instancia `javax.xml.validation.Schema` identificada por `schema`.

<hr>

#### VALIDATION API

`Schema` es un miembro de la API de validación de Java, que disocia el análisis de documentos de la validación, lo que facilita que las aplicaciones aprovechen las bibliotecas de validación especializadas que admiten lenguajes de esquema adicionales (como **Relax NG**; consulte http://en.wikipedia.org/wiki/RELAX_NG ) y facilita la especificación de la ubicación de un esquema.

La API de validación está asociada con el paquete `javax.xml.validation`, que también incluye `SchemaFactory`, `SchemaFactoryLoader`, `TypeInfoProvider`, `Validator` y `ValidatorHandler.Schema` es la clase central y representa una representación en memoria inmutable de una gramática.

DOM admite la API de validación a través de los métodos `void setSchema(Schema schema)` y `Schema getSchema()` de `DocumentBuilderFactory`. De manera similar, SAX admite la validación a través de los métodos `void setSchema(Schema schema)` y `Schema getSchema()` de `javax.xml.parsers.SAXParserFactory`.

El siguiente fragmento de código demuestra la API de validación en un contexto DOM:

```java
// Parse an XML document into a DOM tree.
DocumentBuilder parser = DocumentBuilderFactory.newInstance().newDocumentBuilder();
Document document = parser.parse(new File("instance.xml"));

// Create a SchemaFactory capable of understanding W3C XML Schema (WXS).
SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);

// Load a WXS schema, represented by a Schema instance.
Source schemaFile = new StreamSource(new File("mySchema.xsd"));
Schema schema = factory.newSchema(schemaFile);

// Create a Validator instance, which is used to validate an XML document.
Validator validator = schema.newValidator();

// Validate the DOM tree.
try{
   validator.validate(new DOMSource(document));
}catch (SAXException saxe){
   // XML document is invalid!
}
```

Este ejemplo se refiere a tipos XSLT como `Source`. Exploro XSLT en el Capítulo 6.

<hr>

Después de que se haya configurado la fábrica, llame a su método `DocumentBuilder newDocumentBuilder()` para devolver un generador de documentos que admita la configuración, como se muestra aquí:

```java
DocumentBuilder db = dbf.newDocumentBuilder();
```

Si no se puede devolver un document builder- generador de documentos (quizás la fábrica no pueda crear un generador de documentos que admita espacios de nombres XML), este método arroja(throws) una instancia `ParserConfigurationException`.

### PARSING Y CREAR DOCUMENTOS XML 

Suponiendo que haya obtenido con éxito un document builder, lo que suceda a continuación depende de si desea analizar o crear un documento XML.

`DocumentBuilder` proporciona varios métodos `parse()` sobrecargados para analizar un documento XML en un árbol de nodos. Estos métodos difieren en la forma en que obtienen el documento. Por ejemplo, `Document parse(String uri)` analiza el documento identificado por su argumento URI basado en string.

> **NOTA**: Cada método `parse()` lanza `java.lang.IllegalArgumentException` cuando se pasa `null` como primer argumento del método, `java.io.IOException` cuando se produce un error de entrada/salida y `org.xml.sax.SAXException` cuando el documento no se puede analizar. Este último tipo de excepción indica que los métodos `parse()` de `DocumentBuilder` se basan en SAX para hacerse cargo del trabajo de análisis real. Debido a que están más involucrados en la construcción del árbol de nodos, los analizadores DOM se conocen comúnmente como *document builders* (creadores de documentos).

`DocumentBuilder` también declara el método abstracto `Document newDocument()` para crear un árbol DOM.

El objeto devuelto `org.w3c.dom.Document` proporciona acceso a un documento analizado mediante métodos como `DocumentType getDoctype()`, que hace que la declaración del tipo de documento esté disponible a través de la interfaz `org.w3c.dom.DocumentType`. Conceptualmente, `Document` es la raíz del árbol de nodos del documento. También declara varios métodos de `“create”` y otros para crear un árbol de nodos. Por ejemplo, `Element createElement(String tagName)` crea un elemento nombrado por `tagName`, devolviendo un nuevo objeto `org.w3c.dom.Element` con el nombre especificado pero con su nombre local, prefijo y URI namespace establecido en `null`.

> **NOTA** Aparte de `DocumentBuilder`, `DocumentBuilderFactory` y algunas otras clases, DOM se basa en interfaces, de las cuales `Document` y `DocumentType` son ejemplos. Detrás de escena, los métodos DOM (como los métodos `parse()`) devuelven objetos cuyas clases implementan estas interfaces.

`Document` y todas las demás interfaces `org.w3c.dom` que describen diferentes tipos de nodos son subinterfaces de la interfaz `org.w3c.dom.Node`. Como tal, heredan las constantes y métodos de `Node`.

`Node` declara 12 constantes que representan los distintos tipos de nodos; `ATTRIBUTE_NODE` y `ELEMENT_NODE` son ejemplos. Para identificar el tipo de nodo representado por un objeto `Node` dado, llame al método `short getNodeType()` de `Node` y compare el valor devuelto con una de estas constantes.

> **NOTA** La razón fundamental para usar `getNodeType()` y estas constantes, en lugar de usar `instanceof` y un nombre de clase, es que DOM (el modelo de objeto, no la API DOM de Java) fue diseñado para ser independiente del lenguaje, y los lenguajes como AppleScript no tienen el equivalente de `instanceof`.

`Node` declara varios métodos para obtener y establecer propiedades de nodo comunes. Estos métodos incluyen `String getNodeName()`, `String getLocalName()`, `String getNamespaceURI()`, `String getPrefix()`, `void setPrefix(String prefix)`, `String getNodeValue()`, y `void setNodeValue(String nodeValue)`, que le permiten obtener y (para algunas propiedades) establecen el nombre de un nodo (como `#text`), nombre local, URI del espacio de nombres, prefijo y valor de cadena normalizado.

> **NOTA** Varios métodos de `Node` (como `setPrefix()` y `getNodeValue()`) lanzan(throw) una instancia de la clase `org.w3c.dom.DOMException` cuando algo sale mal. Por ejemplo, `setPrefix()` lanza esta excepción cuando el argumento `prefix` contiene un carácter ilegal, el nodo es de solo lectura o el argumento está mal formado. De manera similar, `getNodeValue()` arroja `DOMException` cuando `getNodeValue()` devolvería más caracteres de los que caben en una variable `DOMString` (un tipo W3C) en la plataforma de implementación. `DOMException` declara una serie de constantes (como `DOMSTRING_SIZE_ERR`) que clasifican el motivo de la excepción.

`Node` declara varios métodos para navegar por el árbol de nodos. Aquí se describen tres de sus métodos de navegación:

* `boolean hasChildNodes()` devuelve `true` cuando un nodo tiene nodos secundarios.

* `Node getFirstChild()` devuelve el primer hijo del nodo.

* `Node getLastChild()` devuelve el último hijo del nodo.

Para los nodos con varios hijos, encontrará útil el método `NodeList getChildNodes()`. Este método devuelve una instancia `org.w3c.dom.NodeList` cuyo método `int getLength()` devuelve el número de nodos en la lista y cuyo método `Node item(int index)` devuelve el nodo en la posición del índice (`index`th) en la lista (o `null` cuando el `index` el valor no es válido; es menor que cero o mayor o igual que el valor de `getLength()`).

`Node` declara cuatro métodos para modificar el árbol insertando, eliminando, reemplazando y agregando nodos secundarios:

* `Node insertBefore(Node newChild, Node refChild)` inserta `newChild` antes del nodo existente especificado por `refChild` y devuelve `newChild`.

* `Node removeChild(Node oldChild)` elimina el nodo secundario identificado por `oldChild` del árbol y devuelve `oldChild`.

* `Node replaceChild(Node newChild, Node oldChild)` reemplaza `oldChild` con `newChild` y devuelve `oldChild`.

* `Node appendChild(Node newChild)` agrega `newChild` al final de los nodos secundarios del nodo actual y devuelve `newChild`.

Finalmente, `Node` declara varios métodos de utilidad, incluido `Node cloneNode(boolean deep)` (crea y devuelve un duplicado del nodo actual, clonando recursivamente su subárbol cuando se pasa `true` a `deep`) y `void normalize()` (desciende el árbol desde el nodo y fusionar todos los nodos de texto adyacentes, eliminando los nodos de texto que están vacíos).

> **TIP** Para obtener los atributos de un nodo de elemento, primero llame al método `getAttributes()` de `NamedNodeMap` de `Node`. Este método devuelve una implementación `org.w3c.dom.NamedNodeMap` cuando el nodo representa un elemento; de lo contrario, devuelve `null`. Además de declarar métodos para acceder a estos nodos por nombre (como `Node getNamedItem(String name)`), `NamedNodeMap` declara métodos `int getLength()` y `Node item(int index)` para devolver todos los nodos de atributo por `index`. Luego obtendría el nombre del `Node` llamando a un método como `getNodeName()`.

Además de heredar las constantes y métodos de `Node`, `Document` declara sus propios métodos. Por ejemplo, puede llamar a los métodos `String getXmlEncoding()`, `boolean getXmlStandalone()` y `String getXmlVersion()` de `Document` para devolver los valores de los atributos de `encoding`, `standalone`y `version` de la declaración XML, respectivamente.

`Document` declara tres métodos para localizar uno o más elementos:

* `Element getElementById(String elementId)` devuelve el elemento que tiene un atributo `id` (como en `<img id=...>`) que coincide con el valor especificado por `elementId`.

* `NodeList getElementsByTagName(String tagname)` devuelve una lista de nodos de los elementos de un documento (en el orden del documento) que coinciden con el `tagName` especificado.

* `NodeList getElementsByTagNameNS(String namespaceURI,String localName)` es equivalente al segundo método, excepto que agrega a la lista de nodos solo los elementos que coinciden con los valores `localName` y `namespaceURI`. Pase `"*"` a `namespaceURI` para que coincida con todos los espacios de nombres; pase `"*"` a `localName` para que coincida con todos los nombres locales.

El nodo de elemento devuelto y cada nodo de elemento de la lista implementan la interfaz `Element`. Esta interfaz declara métodos para devolver listas de nodos de elementos descendientes en el árbol, atributos asociados con el elemento y más. Por ejemplo, `String getAttribute(String name)` devuelve el valor del atributo identificado por `name`, mientras que `Attr getAttributeNode(String name)` devuelve un nodo de atributo por nombre. El nodo devuelto es una implementación de la interfaz `org.w3c.dom.Attr`.

<hr>

## Demostrando la API DOM

Ahora tiene suficiente información para explorar aplicaciones para analizar y crear documentos XML. Esta sección le muestra cómo realizar estas tareas.

### PARSING UN DOCUMENTO XML

El Listado 3-1 presenta el código fuente a una aplicación de análisis basada en DOM que muestra brevemente cómo analizar un documento XML en un árbol DOM.


```java
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import static java.lang.System.*;
public class DOMDemo{
   public static void main(String[] args){
   
      if (args.length != 1){
         err.println("usage: java DOMDemo xmlfile");
         return;
      }
      
      try{
         DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
         dbf.setNamespaceAware(true);
         DocumentBuilder db = dbf.newDocumentBuilder();
         Document doc = db.parse(args[0]);
         out.printf("Version = %s%n", doc.getXmlVersion());
         out.printf("Encoding = %s%n", doc.getXmlEncoding());
         out.printf("Standalone = %b%n%n", doc.getXmlStandalone());
         if (doc.hasChildNodes()){
            NodeList nl = doc.getChildNodes();
            for (int i = 0; i < nl.getLength(); i++){
               Node node = nl.item(i);
               if (node.getNodeType() == Node.ELEMENT_NODE)
                  dump((Element) node);
            }
         }
      }catch (IOException ioe){
         err.printf("IOE: %s%n", ioe.toString());
      }catch (SAXException saxe){
         err.printf("SAXE: %s%n", saxe.toString());
      }catch (FactoryConfigurationError fce){
         err.printf("FCE: %s%n", fce.toString());
      }catch (ParserConfigurationException pce){
         err.printf("PCE: %s%n", pce.toString());
      }
   }
   static void dump(Element e){
      out.printf("Element: %s, %s, %s, %s%n",
                 e.getNodeName(), e.getLocalName(),
                 e.getPrefix(), e.getNamespaceURI());
      NamedNodeMap nnm = e.getAttributes();
      if (nnm != null)
         for (int i = 0; i < nnm.getLength(); i++){
            Node node = nnm.item(i) ;
            Attr attr = e.getAttributeNode(node.getNodeName());
            out.printf("  Attribute %s = %s%n",
                       attr.getName(), attr.getValue());
         }
      NodeList nl = e.getChildNodes();
      for (int i = 0; i < nl.getLength(); i++){
         Node node = nl.item(i);
         if (node instanceof Element)
            dump((Element) node);
      }
   }
}
```
***Listado 3-1*** `DOMDemo` (Versión 1)

El método `main()` de `DOMDemo` primero verifica que se haya especificado un argumento de línea de comando (el nombre de un documento XML). A continuación, crea una document builder factory (fábrica de creadores de documentos), informa a la fábrica que quiere un creador de documentos que tenga en cuenta el namespace (espacio de nombres) y hace que la fábrica devuelva este document builder(creador de documentos).

Continuando, `main()` analiza el documento en un árbol de nodos; genera el número de versión, la codificación y los valores de atributos independientes de la declaración XML; y vuelca recursivamente todos los nodos de elementos (comenzando con el nodo raíz) y sus valores de atributo.

Observe el uso de `getNodeType()` en una parte de este listado y de `instanceof` en otra parte. La llamada al método `getNodeType()` no es necesaria (solo está presente para demostración) porque en su lugar se puede usar `instanceof`. Sin embargo, la conversión de tipo de `Node` a tipo `Element` en las llamadas al método `dump()` es necesaria.

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

```java

```
