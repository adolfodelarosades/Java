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
AQUIIIIIII
Detrás de escena, `newInstance()` sigue un procedimiento de búsqueda ordenado para identificar la clase de implementación DocumentBuilderFactory que se cargará. Este procedimiento primero examina la propiedad del sistema javax.xml.parsers.DocumentBuilderFactory y, por último, elige la clase de implementación DocumentBuilderFactory predeterminada de la plataforma Java cuando no se encuentra ninguna otra clase. Si una clase de implementación no está disponible (quizás la clase identificada por la propiedad del sistema javax.xml.parsers.DocumentBuilderFactory no existe) o no se puede instanciar, newInstance () arroja una instancia de la clase FactoryConfigurationError. De lo contrario, crea una instancia de la clase y devuelve su instancia.

Después de obtener una instancia de DocumentBuilderFactory, puede llamar a varios métodos de configuración para configurar la fábrica. Por ejemplo, puede llamar al método void setNamespaceAware (conocimiento booleano) de DocumentBuilderFactory con un argumento verdadero para decirle a la fábrica que cualquier constructor de documentos devuelto debe proporcionar soporte para espacios de nombres XML. También puede llamar a void setValidating (validación booleana) con true como argumento para validar documentos con sus DTD o llamar a void setSchema (esquema de esquema) para validar documentos con la instancia javax.xml.validation.Schema identificada por esquema.



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

```java

```
