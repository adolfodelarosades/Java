# Primeros Pasos con XMLBeans

## Introducción

XMLBeans proporciona formas intuitivas de manejar XML que facilitan el acceso y la manipulación de datos y documentos XML en Java.

Características del enfoque de XMLBeans para XML:

* Proporciona una vista familiar basada en objetos de Java de los datos XML sin perder el acceso a la estructura XML nativa original.
* La integridad del XML como documento no se pierde con XMLBeans. Las API orientadas a XML comúnmente separan el XML para vincularlo a sus partes. Con XMLBeans, todo el documento de instancia XML se maneja como un todo. Los datos XML se almacenan en la memoria como XML. Esto significa que se conserva el orden del documento, así como el contenido del elemento original con espacios en blanco.
* Con los tipos generados a partir del esquema, el acceso a las instancias XML se realiza a través de accesores similares a JavaBean, con métodos get y set.
* Está diseñado teniendo en cuenta el esquema XML desde el principio: XMLBeans es compatible con todas las definiciones de esquema XML.
* El acceso a XML es rápido.

## El punto de partida de XMLBeans es el esquema XML.

Un esquema (contenido en un archivo **XSD**) es un documento XML que define un conjunto de reglas a las que deben ajustarse otros documentos XML. La especificación XML Schema proporciona un modelo de datos enriquecido que le permite expresar una estructura y restricciones sofisticadas en sus datos. Por ejemplo, un esquema XML puede imponer control sobre cómo se ordenan los datos en un documento o restricciones sobre valores particulares (por ejemplo, una fecha de nacimiento que debe ser posterior a 1900). Desafortunadamente, la capacidad de hacer cumplir reglas como esta normalmente no está disponible en Java sin escribir un código personalizado. XMLBeans respeta las restricciones del esquema.

**Nota**: Cuando un esquema XML define reglas para un documento XML, una instancia XML es un documento XML que se ajusta al esquema.

Compile un archivo de esquema (**XSD**) para generar un conjunto de interfaces Java que reflejen el esquema. Con estos tipos, procesa documentos de instancia XML que se ajustan al esquema. Vincule un documento de instancia XML a estos tipos; los cambios realizados a través de la interfaz de Java modifican la representación XML subyacente.

Las opciones anteriores para manejar XML incluyen el uso de interfaces de programación XML (como **DOM** o **SAX**) o una herramienta de vinculación/ordenación de XML (como **JAXB**). Debido a que carece de tipificación sólida orientada a esquemas, la navegación en un modelo orientado a DOM es más tediosa y requiere una comprensión del modelo de objetos completo. **JAXB** proporciona soporte para la especificación del esquema XML, pero solo maneja un subconjunto del mismo; XMLBeans lo admite todo. Además, al almacenar los datos en la memoria como XML, XMLBeans puede reducir la sobrecarga de clasificación y desclasificación.

## Acceso a XML utilizando su esquema

Para echar un vistazo a los tipos de cosas que puede hacer con XMLBeans, eche un vistazo a un ejemplo usando XML para una orden de compra(purchase order). El XML de la orden de compra contiene datos intercambiados por dos partes, como dos empresas. Ambas partes deben poder confiar en una forma de mensaje consistente, y un esquema especifica el terreno común.

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

Este esquema describe la instancia XML de la  purchase order(orden de compra) definiendo lo siguiente:

* Definiciones para tres ***complex types***: **`customer`**, **`line-item`**, y **`shipper`**. Estos son los tipos utilizados para los children del elemento de purchase-order. En el esquema, un complex type es aquel que define un elemento que puede tener elementos child y atributos. El  sequence element anidado en el complex type lista sus elementos child.
* Estos también son ***global types***. Son globales porque están en el nivel superior del esquema (en otras palabras, justo debajo del elemento raíz del esquema ). Esto significa que se puede hacer referencia a ellos desde cualquier otro lugar del esquema.
* Uso de ***simple types*** dentro de los ***complex types***. Los elementos **`name`**, **`address`**, y **`description`** (entre otros) se escriben como ***simple types***. Da la casualidad de que estos también son ***built-in types - tipos incorporado***. Un ***built-in types*** (aquí, uno con el prefijo "**`xs`**") es parte de la especificación del esquema. (La especificación define 46 built-in types).
* Un elemento global llamado **purchase-order**. Esta definición de elemento incluye una definición de complex type anidado que especifica los elementos child para un elemento de **purchase-order**. Observe que el ***complex types*** incluye referencias a los otros ***complex types*** definidos en este esquema.

En otras palabras, el esquema define tipos para los elementos child  y describe su posición como subordinados al root element, **purchase-order**.

Cuando utiliza el compilador **XMLBean** con un archivo **XSD** como este, genera un archivo JAR que contiene las interfaces generadas a partir del esquema.

## Escribir código Java que utiliza las interfaces

Con las interfaces XMLBeans en su aplicación, puede escribir código que use los nuevos tipos para manejar XML según el esquema. Aquí hay un ejemplo que extrae información sobre cada uno de los ordered items(artículos pedidos) en el XML de la purchase order(orden de compra), cuenta los artículos y calcula un total de sus precios. En particular, observe el uso de tipos generados a partir del esquema e importados como parte del paquete **`org.openuri.easypo`**.

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

Tenga en cuenta que los tipos generados a partir del esquema reflejan lo que hay en el XML:

* Un **`PurchaseOrderDocument `** representa el elemento root global.
* Un método **`getPurchaseOrder`** devuelve un tipo **`PurchaseOrderDocument.PurchaseOrder`** que contiene elementos child, incluido el **`line-item`**. Un método **`getLineItemArray`** retorna un array **`LineItem`** que contiene los elementos **`line-item`**.
* Otros métodos, como **`getQuantity`**, **`getPrice`**, etc., se derivan naturalmente de lo que describe el esquema y devuelven los elementos children correspondientes del **`line-item`**.
El nombre del paquete que contiene estos tipos se deriva del espacio de nombres de destino del esquema.
Las mayúsculas y la puntuación de los nombres de tipos generados siguen la convención de Java. Además, aunque este ejemplo analiza el XML de un archivo, otros métodos de análisis admiten un objeto Java InputStream , un objeto Reader , etc.

El código Java anterior imprime lo siguiente en la consola:
