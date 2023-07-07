# Primeros Pasos con XMLBeans

## Introducción

XMLBeans proporciona formas intuitivas de manejar XML que facilitan el acceso y la manipulación de datos y documentos XML en Java.

Características del enfoque de XMLBeans para XML:

* Proporciona una vista familiar basada en objetos de Java de los datos XML sin perder el acceso a la estructura XML nativa original.
* La integridad del XML como documento no se pierde con XMLBeans. Las API orientadas a XML comúnmente separan el XML para vincularlo a sus partes. Con XMLBeans, todo el documento de instancia XML se maneja como un todo. Los datos XML se almacenan en la memoria como XML. Esto significa que se conserva el orden del documento, así como el contenido del elemento original con espacios en blanco.
* Con los types generated a partir del schema, el acceso a las instancias XML se realiza a través de accesores similares a JavaBean, con métodos get y set.
* Está diseñado teniendo en cuenta el schema XML desde el principio: XMLBeans es compatible con todas las definiciones de schema XML.
* El acceso a XML es rápido.

## El punto de partida de XMLBeans es el schema XML.

Un schema (contenido en un archivo **XSD**) es un documento XML que define un conjunto de reglas a las que deben ajustarse otros documentos XML. La especificación XML Schema proporciona un modelo de datos enriquecido que le permite expresar una estructura y restricciones sofisticadas en sus datos. Por ejemplo, un schema XML puede imponer control sobre cómo se ordenan los datos en un documento o restricciones sobre valores particulares (por ejemplo, una fecha de nacimiento que debe ser posterior a 1900). Desafortunadamente, la capacidad de hacer cumplir reglas como esta normalmente no está disponible en Java sin escribir un código personalizado. XMLBeans respeta las restricciones del schema.

**Nota**: Cuando un schema XML define reglas para un documento XML, una instancia XML es un documento XML que se ajusta al schema.

Compile un archivo de schema (**XSD**) para generar un conjunto de interfaces Java que reflejen el schema. Con estos tipos, procesa documentos de instancia XML que se ajustan al schema. Vincule un documento de instancia XML a estos tipos; los cambios realizados a través de la interfaz de Java modifican la representación XML subyacente.

Las opciones anteriores para manejar XML incluyen el uso de interfaces de programación XML (como **DOM** o **SAX**) o una herramienta de vinculación/ordenación de XML (como **JAXB**). Debido a que carece de tipificación sólida orientada a schemas, la navegación en un modelo orientado a DOM es más tediosa y requiere una comprensión del modelo de objetos completo. **JAXB** proporciona soporte para la especificación del schema XML, pero solo maneja un subconjunto del mismo; XMLBeans lo admite todo. Además, al almacenar los datos en la memoria como XML, XMLBeans puede reducir la sobrecarga de clasificación y desclasificación.

## Acceso a XML utilizando su schema

Para echar un vistazo a los tipos de cosas que puede hacer con XMLBeans, eche un vistazo a un ejemplo usando XML para una orden de compra(purchase order). El XML de la orden de compra contiene datos intercambiados por dos partes, como dos empresas. Ambas partes deben poder confiar en una forma de mensaje consistente, y un schema especifica el terreno común.

Este es el aspecto que podría tener una instancia XML de purchase order.

```xml
<po:purchase-order xmlns:po="http://openuri.org/easypo">
  <po:customer>
    <po:name>Gladys Kravitz</po:name>
    <po:address>Anytown, PA</po:address>
  </po:customer>
  <po:date>2003-01-07T14:16:00-05:00</po:date>
  <po:line-item>
    <po:description>Burnham's Celestial Handbook, Vol 1</po:description>
    <po:per-unit-ounces>5</po:per-unit-ounces>
    <po:price>21.79</po:price>
    <po:quantity>2</po:quantity>
  </po:line-item>
  <po:line-item>
    <po:description>Burnham's Celestial Handbook, Vol 2</po:description>
    <po:per-unit-ounces>5</po:per-unit-ounces>
    <po:price>19.89</po:price>
    <po:quantity>2</po:quantity>
  </po:line-item>
  <po:shipper>
    <po:name>ZipShip</po:name>
    <po:per-ounce-rate>0.74</po:per-ounce-rate>
  </po:shipper>
</po:purchase-order>
```

Este XML incluye un elemento raíz, **`purchase-order`**, que tiene tres tipos de elementos child: **`customer`**, **`date`**, **`line-item`**, y **`shipper`**. Una vista intuitiva basada en objetos de este XML proporcionaría un objeto que representaría el elemento **`purchase-order`** y tendría métodos para obtener la fecha y obtener objetos subordinados para los elementos **`customer`**, **`line-item`**, y **`shipper`**. Cada uno de los últimos tres tendría sus propios métodos para obtener los datos dentro de ellos también.

## Mirando el Schema

El siguiente XML es el schema del XML de **purchase order** anterior. Define la "shape" del XML: cuáles son sus elementos, en qué orden aparecen, cuáles son hijos de cuáles, etc.

```xml
<xs:schema targetNamespace="http://openuri.org/easypo"
    xmlns:po="http://openuri.org/easypo"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    elementFormDefault="qualified">
    <xs:element name="purchase-order">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="customer" type="po:customer"/>
                <xs:element name="date" type="xs:dateTime"/>
                <xs:element name="line-item" type="po:line-item" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="shipper" type="po:shipper" minOccurs="0"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
    <xs:complexType name="customer">
        <xs:sequence>
            <xs:element name="name" type="xs:string"/>
            <xs:element name="address" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name="line-item">
        <xs:sequence>
            <xs:element name="description" type="xs:string"/>
            <xs:element name="per-unit-ounces" type="xs:decimal"/>
            <xs:element name="price" type="xs:double"/>
            <xs:element name="quantity" type="xs:int"/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name="shipper">
        <xs:sequence>
            <xs:element name="name" type="xs:string"/>
            <xs:element name="per-ounce-rate" type="xs:decimal"/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>
```

Este schema describe la instancia XML de la  purchase order(orden de compra) definiendo lo siguiente:

* Definiciones para tres ***complex types***: **`customer`**, **`line-item`**, y **`shipper`**. Estos son los tipos utilizados para los children del elemento de purchase-order. En el schema, un complex type es aquel que define un elemento que puede tener elementos child y atributos. El  sequence element anidado en el complex type lista sus elementos child.
* Estos también son ***global types***. Son globales porque están en el nivel superior del schema (en otras palabras, justo debajo del elemento raíz del schema ). Esto significa que se puede hacer referencia a ellos desde cualquier otro lugar del schema.
* Uso de ***simple types*** dentro de los ***complex types***. Los elementos **`name`**, **`address`**, y **`description`** (entre otros) se escriben como ***simple types***. Da la casualidad de que estos también son ***built-in types - tipos incorporado***. Un ***built-in types*** (aquí, uno con el prefijo "**`xs`**") es parte de la especificación del schema. (La especificación define 46 built-in types).
* Un elemento global llamado **purchase-order**. Esta definición de elemento incluye una definición de complex type anidado que especifica los elementos child para un elemento de **purchase-order**. Observe que el ***complex types*** incluye referencias a los otros ***complex types*** definidos en este schema.

En otras palabras, el schema define tipos para los elementos child  y describe su posición como subordinados al root element, **purchase-order**.

Cuando utiliza el compilador **XMLBean** con un archivo **XSD** como este, genera un archivo JAR que contiene las interfaces generadas a partir del schema.

## Escribir código Java que utiliza las interfaces

Con las interfaces XMLBeans en su aplicación, puede escribir código que use los nuevos tipos para manejar XML según el schema. Aquí hay un ejemplo que extrae información sobre cada uno de los ordered items(artículos pedidos) en el XML de la purchase order(orden de compra), cuenta los artículos y calcula un total de sus precios. En particular, observe el uso de types generated a partir del schema e importados como parte del paquete **`org.openuri.easypo`**.

El método **`printItems`** recibe un objeto **`File`** que contiene el archivo XML de la purchase order.


```java
package docs.xmlbeans;
import java.io.File;
import org.apache.xmlbeans.*;
import org.openuri.easypo.PurchaseOrderDocument;
import org.openuri.easypo.PurchaseOrder;
import org.openuri.easypo.LineItem;
public class POHandler
{
    public static void printItems(File po) throws Exception
    {
        /*
         * All XMLBeans schema types provide a nested Factory class you can
         * use to bind XML to the type, or to create new instances of the type.
         * Note that a "Document" type such as this one is an XMLBeans
         * construct for representing a global element. It provides a way
         * for you to get and set the contents of the entire element.
         *
         * Also, note that the parse method will only succeed if the
         * XML you're parsing appears to conform to the schema.
         */
        PurchaseOrderDocument poDoc =
            PurchaseOrderDocument.Factory.parse(po);
        /*
         * The PurchaseOrder type represents the purchase-order element's
         * complex type.
         */
        PurchaseOrder po = poDoc.getPurchaseOrder();
        /*
         * When an element may occur more than once as a child element,
         * the schema compiler will generate methods that refer to an
         * array of that element. The line-item element is defined with
         * a maxOccurs attribute value of "unbounded", meaning that
         * it may occur as many times in an instance document as needed.
         * So there are methods such as getLineItemArray and setLineItemArray.
         */
        LineItem[] lineitems = po.getLineItemArray();
        System.out.println("Purchase order has " + lineitems.length + " line items.");
        double totalAmount = 0.0;
        int numberOfItems = 0;
        /*
         * Loop through the line-item elements, using generated accessors to
         * get values for child elements such a description, quantity, and
         * price.
         */
        for (int j = 0; j < lineitems.length; j++)
        {
            System.out.println(" Line item: " + j);
            System.out.println(
                "   Description: " + lineitems[j].getDescription());
            System.out.println("   Quantity: " + lineitems[j].getQuantity());
            System.out.println("   Price: " + lineitems[j].getPrice());
            numberOfItems += lineitems[j].getQuantity();
            totalAmount += lineitems[j].getPrice() * lineitems[j].getQuantity();
        }
        System.out.println("Total items: " + numberOfItems);
        System.out.println("Total amount: " + totalAmount);
    }
}
```

Tenga en cuenta que los types generated a partir del schema reflejan lo que hay en el XML:

* Un **`PurchaseOrderDocument `** representa el elemento root global.
* Un método **`getPurchaseOrder`** devuelve un tipo **`PurchaseOrderDocument.PurchaseOrder`** que contiene elementos child, incluido el **`line-item`**. Un método **`getLineItemArray`** retorna un array **`LineItem`** que contiene los elementos **`line-item`**.
* Otros métodos, como **`getQuantity`**, **`getPrice`**, etc., se derivan naturalmente de lo que describe el schema y devuelven los elementos children correspondientes del **`line-item`**.
* El nombre del package que contiene estos tipos se deriva del namespace de destino del schema.

Las mayúsculas y la puntuación de los nombres de types generated siguen la convención de Java. Además, aunque este ejemplo analiza el XML de un archivo, otros métodos **`parse`** admiten un objeto Java **`InputStream`**, un objeto **`Reader`**, etc.

El código Java anterior imprime lo siguiente en la consola:

```sh
Purchase order has 3 line items.
 Line item 0
   Description: Burnham's Celestial Handbook, Vol 1
   Quantity: 2
   Price: 21.79
 Line item 1
   Description: Burnham's Celestial Handbook, Vol 2
   Quantity: 2
   Price: 19.89
Total items: 4
Total amount: 41.68
```

## Creación de nuevas XML Instances a partir de un Schema

Como ha visto, XMLBeans proporciona una clase de "factory" ​​que puede usar para crear nuevas instancias. El siguiente ejemplo crea un nuevo elemento de **`purchase-order`** y agrega un elemento child **`customer`**. Luego inserta elementos child **`name`** y **`address`**, crea los elementos y establece sus valores con una sola llamada a sus métodos **`set`**.

```java
public PurchaseOrderDocument createPO() {
    PurchaseOrderDocument newPODoc = PurchaseOrderDocument.Factory.newInstance();
    PurchaseOrder newPO = newPODoc.addNewPurchaseOrder();
    Customer newCustomer = newPO.addNewCustomer();
    newCustomer.setName(&quot;Doris Kravitz&quot;);
    newCustomer.setAddress(&quot;Bellflower, CA&quot;);
    return newPODoc;
}
```

El siguiente es el XML que resulta. Tenga en cuenta que XMLBeans asigna el namespace correcto según el schema, utilizando un prefijo "**`ns1`**" (o "namespace 1"). A efectos prácticos, el prefijo en sí no importa: es el URI del namespace (http://openuri.org/easypo) el que define el namespace. El prefijo es simplemente un marcador que lo representa.

```xml
<ns1:purchase-order xmlns:ns1=&quot;http://openuri.org/easypo&quot;>
    <ns1:customer>
        <ns1:name>Doris Kravitz</ns1:name>
        <ns1:address>Bellflower, CA</ns1:address>
    </ns1:customer>
</ns1:purchase-order>
```

Tenga en cuenta que todos los tipos (incluidos los generados a partir del schema) se heredan de **`XmlObject`** y, por lo tanto, proporcionan una clase **`Factory`**. Para obtener una descripción general del sistema de tipos en el que encaja **`XmlObject`**, consulte XMLBeans Support for Built-In Schema Types. Para obtener información de referencia, consulte XmlObject Interface.

## XMLBeans Hierarchy

Los types generated que vio en el ejemplo anterior son en realidad parte de una jerarquía de tipos XMLBeans. Esta jerarquía es una de las formas en que XMLBeans presenta una vista intuitiva del schema. En la parte superior de la jerarquía se encuentra **`XmlObject`**, la interfaz base para los tipos XMLBeans. Debajo de este nivel, hay dos categorías principales de tipos: generated types(types generated) que representan tipos de schemas derivados del usuario y included types(tipos incluidos) que representan tipos de schemas integrados(built-in schema types).

Este tema ya ha introducido generated types. Para obtener más información, consulte Java Types Generated from User-Derived Schema Types.

## Soporte de Built-In Type

Además de los ypes generated a partir de un schema determinado, XMLBeans proporciona 46 Java types que reflejan los 46 Java types definidos por la especificación del schema XML. Donde el schema define **`xs:string`**, **`xs:decimal`** y **`xs:int`** , por ejemplo, XMLBeans proporciona **`XmlString`**, **`XmlDecimal`** y **`XmlInt`**. Cada uno de estos también hereda de **`XmlObject`**, que corresponde al tipo de schema integrado **`xs:anyType`**.

XMLBeans proporciona una forma de manejar datos XML como estos  built-in types. Cuando su schema incluya un elemento cuyo tipo sea, por ejemplo, **`xs:int`**, XMLBeans proporcionará un método generado diseñado para devolver un **`XmlInt`**. Además, como vio en el ejemplo anterior, para la mayoría de los tipos también habrá un método que devuelva un tipo Java natural como **`int`**. Las siguientes dos líneas de código devuelven el valor del elemento **`quantity`**, pero lo devuelven como tipos diferentes.

```java
// Methods that return simple types begin with an "x".
XmlInt xmlQuantity = lineitems[j].xgetQuantity();
// Methods that return a natural Java type are unadorned.
int javaQuantity = lineitems[j].getQuantity();
```

En cierto sentido, ambos métodos get navegan hasta el elemento **`quantity`**; el método **`getQuantity`** va un paso más allá y convierte el valor de los elementos al tipo de Java natural más apropiado antes de devolverlo. (XMLBeans también proporciona un medio para validar el XML mientras trabaja con él).

Si sabe un poco sobre el schema XML, los tipos de XMLBeans deberían parecer bastante intuitivos. Si no lo hace, aprenderá mucho experimentando con XMLBeans utilizando sus propios schemas e instancias XML basadas en ellos.

Para obtener más información sobre los métodos de los types generated a partir del schema, consulte Métodos para los types generated a partir del schema . Para obtener más información sobre cómo XMLBeans representa los tipos de schemas integrados, consulte Methods for Types Generated From Schema.

## Uso de XQuery Expressions

Con XMLBeans puede usar **XQuery** para consultar XML en busca de datos específicos. A veces se hace referencia a **XQuery como "SQL para XML"** porque proporciona un mecanismo para acceder a datos directamente desde documentos XML, al igual que SQL proporciona un mecanismo para acceder a datos en bases de datos tradicionales.

**XQuery** toma prestada parte de su sintaxis de **XPath**, una sintaxis para especificar datos anidados en XML. El siguiente ejemplo devuelve todos los **`line-item`** cuyos elementos child **`price`** tienen valores menores o iguales a 20,00:

```java
PurchaseOrderDocument doc = PurchaseOrderDocument.Factory.parse(po);

/*
 * The XQuery expression is the following two strings combined. They're
 * declared separately here for convenience. The first string declares
 * the namespace prefix that's used in the query expression; the second
 * declares the expression itself.
 */
String nsText = "declare namespace po = 'http://openuri.org/easypo'; ";
String pathText = "$this/po:purchase-order/po:line-item[po:price <= 20.00]";
String queryText = nsText + pathText;

XmlCursor itemCursor = doc.newCursor().execQuery(queryText);
System.out.println(itemCursor.xmlText());
```

Este código crea un nuevo cursor al inicio del documento. A partir de ahí, utiliza el método **`execQuery`** de la interfaz **`XmlCursor`** para ejecutar la query expression. En este ejemplo, el parámetro del método es una expresión XQuery que simplemente dice: "Desde mi ubicación actual, navegue por el elemento de **purchase-order** y recupere los elementos **line-item** cuyo valor sea menor o igual a 20,00". La variable **`$this`** significa "the current position - la posición actual".

Para obtener más información acerca de XQuery, consulte  XQuery 1.0: An XML Query Language en el sitio web de W3C.

## Uso de XML Cursors

En el ejemplo anterior, es posible que haya notado la interfaz **`XmlCursor`**. Además de proporcionar una forma de ejecutar la expresión XQuery, los cursores XML ofrecen un modelo detallado para manipular datos. La XML cursor API, análoga a la API de objetos del DOM, es simplemente una forma de señalar un dato en particular. Entonces, al igual que un cursor ayuda a navegar a través de un documento de procesamiento de textos, el cursor XML define una ubicación en XML donde puede realizar acciones en el XML seleccionado.

Los cursores son ideales para desplazarse por un documento XML cuando no hay un schema disponible. Una vez que tenga el cursor en la ubicación que le interesa, puede realizar una variedad de operaciones con él. Por ejemplo, puede establecer y obtener valores, insertar y eliminar fragmentos de XML, copiar fragmentos de XML a otras partes del documento y realizar otros cambios detallados en el documento XML.

El siguiente ejemplo utiliza un cursor XML para navegar al elemento child **`name`** del elemento **`customer`**.

```java
PurchaseOrderDocument doc = PurchaseOrderDocument.Factory.parse(po);

XmlCursor cursor = doc.newCursor();
cursor.toFirstContentToken();
cursor.toFirstChildElement();
cursor.toFirstChildElement();
System.out.println(cursor.getText());

cursor.dispose();
```

¿Qué esta pasando aqui? Al igual que con el ejemplo anterior, el código carga el XML desde un objeto **`File`**. Después de cargar el documento, el código crea un cursor al principio. Mover el cursor varias veces lo lleva al elemento anidado **`name`**. Una vez allí, el método **`getText`** recupera el valor del elemento.

Esta es solo una introducción a los cursores XML. Para obtener más información sobre el uso de cursores, consulte Navigating XML with Cursors.

## Dónde ir después

*  XMLBeans proporciona formas intuitivas de manejar XML, especialmente si está comenzando con un schema. Si está accediendo a XML que se basa en un schema, probablemente le resultará más eficiente acceder al XML a través de types generated específicos para el schema. Para hacer esto, comienza compilando el schema para generar interfaces. Para obtener más información sobre el uso de tipos de XMLBeans generados mediante la compilación de schemas, consulte Java Types Generated From User-Derived Schema Types y Methods for Types Generated From Schema.
* Es posible que le interese leer más sobre type system en el que se basa XMLBeans, especialmente si utiliza types generated a partir de un schema. XMLBeans proporciona un sistema jerárquico de tipos que refleja lo que encuentra en la propia especificación del schema XML. Si está trabajando con un schema, puede que le resulte útil comprender cómo funcionan estos tipos. Para obtener más información, consulte XMLBeans Support for Built-In Schema Types e Introduction to Schema Type Signatures..
* XMLBeans proporciona acceso a XML a través de XQuery, que toma prestada la sintaxis de ruta de XPath. Con XQuery, puede especificar fragmentos específicos de datos XML con o sin schema. Para obtener más información sobre el uso de XQuery y XPath en XMLBeans, consulte Selecting XML with XQuery and XPath.
* Puede usar la interfaz **XmlCursor** para una navegación detallada y manipulación de XML. Para obtener más información, consulte Navegación XML con cursores.


## Temas relacionados

Ejemplos de XMLBeans

