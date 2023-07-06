# Tutorial: Primeros Pasos con **XMLBeans**

## Introducción

Este tutorial presenta los conceptos básicos de ****XMLBeans****. A través de él, obtendrá una vista práctica de dos de las tres tecnologías que componen la versión 5.0.0 de **XMLBeans**: ***acceso fuertemente tipado(strongly-typed access) a XML a través de un schema compilado*** y ***type-agnostic access (acceso agnóstico de tipo) a XML a través del XML cursor***. Este tutorial describe qué es **XMLBeans** y presenta algunas de las herramientas que vienen con una instalación de **XMLBeans**.

Para comenzar, necesitará lo siguiente:

* JDK 1.8 para **XMLBeans** 5.0.0.
* Una instalación de **XMLBeans** 5.0.0. Si aún no tiene esto, encontrará instrucciones de instalación en Installing **XMLBeans**.
* Un entorno configurado de acuerdo con lo que se describe en Installing **XMLBeans**.
* Un editor para escribir código Java. Esto podría ser un editor de texto o su IDE de Java favorito.

Creará algunos archivos como parte de este tutorial. Comience creando un nuevo directorio **`tutorials`** justo debajo de su directorio **`**XMLBeans**_HOME`**. Esto contendrá los archivos que cree en el curso de este tutorial. Mientras lo hace, cree los siguientes subdirectorios en el directorio de tutoriales: **`classes`**, **`instances`**, **`src`**, **`lib`**. Si está trabajando con **XMLBeans** versión 1.0.3, su jerarquía debería verse así:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/86a08883-9e48-4f9c-b3e0-b475aaf03464)

## Familiarícese con los conceptos básicos

**XMLBeans** 5.0.0 incluye múltiples tecnologías relacionadas para manejar XML. En pocas palabras, **XMLBeans** ofrece tres tecnologías complementarias:

* Un schema-oriented way para ver instancias XML a través de Java types basados ​​en schema.
* Un schema-agnostic way para recorrer el conjunto de información XML completo.
* Un schema object model a través del cual, en código Java, puede examinar un XML schema compilado. (Nota: este aspecto de **XMLBeans** no se trata en este tutorial. Para obtener más información, consulte [Introduction to the Schema Type System](https://**XMLBeans**.apache.org/guide/IntroSchemaType.html).

Hay mucho más, pero es un comienzo. Cada una de estas tres piezas es útil para diferentes objetivos, y es posible que se encuentre escribiendo código que use las tres en la misma aplicación. El resto de este tutorial le presentará estas tecnologías.

## Primeros pasos con el manejo de XML a través del Schema

Una de las cosas que **XMLBeans** hace mejor es proporcionarle una forma de manejar XML mediante el uso de un schema al que se ajusta el XML. Con **XMLBeans** puede compilar uno o más archivos de schema (XSD) para generar tipos Java. Al vincular documentos de instancias XML a estos tipos de Java, se proporciona una forma de acceder a las instancias en Java de forma orientada a schemas.

Pruebe esto ahora con XML que obtuvo cuando instaló **XMLBeans**. Para comenzar, abra un símbolo del sistema y cd al directorio que contiene su instalación de **XMLBeans**.

Si siguió las instrucciones de instalación en Instalación de **XMLBeans**, debería poder ejecutar los scripts que obtuvo en el directorio **`\bin`**. Use uno de estos ahora, **`xpretty`**, para echar un vistazo al ** easypo schema** contenido en **`easypo.xsd`**, así (si está usando un sistema operativo UNIX, este script no está disponible, por lo que deberá abrir el archivo en un editor):

```sh
xpretty schemas\easypo\easypo.xsd
```

Después del texto de copyright, debería ver lo siguiente:

```xsd
<xs:schema
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:po="http://openuri.org/easypo"
    targetNamespace="http://openuri.org/easypo"
    elementFormDefault="qualified">
    <xs:element name="purchase-order">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="customer" type="po:customer"/>
                <xs:element name="date" type="xs:dateTime"/>
                <xs:element name="line-item" type="po:line-item" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="shipper" type="po:shipper" minOccurs="0" maxOccurs="1"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
    <xs:complexType name="customer">
        <xs:sequence>
            <xs:element name="name" type="xs:string"/>
            <xs:element name="address" type="xs:string"/>
        </xs:sequence>
        <xs:attribute name="age" type="xs:int"/>
        <xs:attribute name="moo" type="xs:int" default="100"/>
        <xs:attribute name="poo" type="xs:int" fixed="200"/>
    </xs:complexType>
    <xs:complexType name="line-item">
        <xs:sequence>
            <xs:element name="description" type="xs:string"/>
            <xs:element name="per-unit-ounces" type="xs:decimal"/>
            <xs:element name="price" type="xs:decimal"/>
            <xs:element name="quantity" type="xs:integer"/>
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

Si no sabe nada sobre el schema, aquí hay algunos conceptos básicos para este:

* Este schema es un blueprint que define las reglas para crear una determinada "forma" de XML para purchase orders(órdenes de compra).
* El purchase order XML definido aquí tendría un elemento **`<purchase-order>`** que tiene cuatro elementos secundarios inmediatos: **`<customer>`**, **`<date>`**, **`<line-item>`**, y **`<shipper>`**, en esa secuencia.
* Tres de los cuatro child elements tienen sus propios children en una estructura particular, como se define en los elementos **`<complexType>`** respectivos del schema.

Ahora eche un vistazo a un documento XML basado en este schema. Copie el siguiente XML de esta página en un nuevo archivo XML llamado **`easypo.xml`**, luego coloque el archivo en el directorio **`tutorials\gettingstarted\instances`** que creó al comienzo de este tutorial.

```xml
<purchase-order xmlns="http://openuri.org/easypo">
    <customer>
        <name>Gladys Kravitz</name>
        <address>Anytown, PA</address>
    </customer>
    <date>2003-01-07T14:16:00-05:00</date>
    <line-item>
        <description>Burnham's Celestial Handbook, Vol 1</description>
        <per-unit-ounces>5</per-unit-ounces>
        <price>21.79</price>
        <quantity>2</quantity>
    </line-item>
    <line-item>
        <description>Burnham's Celestial Handbook, Vol 2</description>
        <per-unit-ounces>5</per-unit-ounces>
        <price>19.89</price>
        <quantity>2</quantity>
    </line-item>
    <shipper>
        <name>ZipShip</name>
        <per-ounce-rate>0.74</per-ounce-rate>
    </shipper>
</purchase-order>
```

Este XML representa una orden de compra(purchase order) a través de la cual Gladys, una astrónoma aficionada, compra dos libros para usarlos como referencia en su observación de estrellas (junto con una copia adicional de cada uno para su sobrina). Dado que este XML es una instancia del schema, reconocerá el elemento <purchase-order> y sus children, **`<customer>`**, **`<date>`**, **`<line-item>`** y **`<shipper>`**.

Ahora, pruebe estos ejemplos con **XMLBeans**. Entre las herramientas incluidas con **XMLBeans** se encuentra **`scomp`**, un script que ejecuta el compilador de schemas (parte de la API de **XMLBeans**) para compilar un schema o directorio de schemas. Use **`scomp`** para compilar el schema easypo. En Windows, use el siguiente comando (este script también está disponible en UNIX):

```sh
scomp -out tutorials\gettingstarted\lib\easypo.jar schemas\easypo\easypo.xsd
```

Terminará con **`easypo.jar`** en el directorio **`lib`** de la jerarquía de su tutorial.

**Nota**

Si usa Ant en su compilación, puede usar la tarea Ant de XMLBean en lugar de **`scomp`**.

## Resultados de compilar el Schema

***Esta sección describe las interfaces generadas por el compilador de Schemas. Si está familiarizado con esto, desea pasar a escribir código Java, vaya a Writing Code that Uses Generated Types.***

La salida del compilador del schema está diseñada no solo para proporcionar una vista de su schema orientada a JavaBeans, sino también para anticipar los accesos directos(shortcuts) que es probable que desee. Si compara el contenido de **`easypo.xsd`** con los Java types generados al compilarlo, verá paralelismos obvios. Para cada uno de los elements y schema types definidos en el schema, el compilador del schema ha generado Java types. El package name corresponde al URI del namespace del schema.

Por ejemplo, observe de nuevo el elemento **`<purchase-order>`** definido en el schema:

```xml
<xs:element name="purchase-order">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="customer" type="po:customer"/>
            <xs:element name="date" type="xs:dateTime"/>
            <xs:element name="line-item" type="po:line-item" minOccurs="0" maxOccurs="unbounded"/>
            <xs:element name="shipper" type="po:shipper" minOccurs="0" maxOccurs="1"/>
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

Este fragmento define el elemento **`<purchase-order>`** con un "local" complex type (también conocido como "anonymous" complex type). Este tipo incluye una secuencia de child elements (en el mundo del schema, **`<sequence>`** es un "compositor" y cada **`<element>`** es una "particle"). El elemento **`<date>`** se especifica como **`xs:dateTime`**, un tipo integrado definido por la especificación de tipo de datos de schema del W3C; los otros tres elementos son tipos complejos definidos en otra parte de este schema.

#### Opciones para acceder a Elements de Built-In Schema Types

Para representar al elemento **`<purchase-order>`**, el compilador del schema ha generado una interfaz **`PurchaseOrder`** que extends **`java.lang.Object`** y **`org.apache.**XMLBeans**.XmlObject`**. Sin embargo, encontrará que esta interfaz en realidad está contenida dentro de una interfaz de **`PurchaseOrderDocument`**. **XMLBeans** hace esto para el elemento "**`global`**" y atributos: los definidos en el nivel superior del schema. Esto es para proporcionarle una forma de obtener y configurar el elemento **`global`** como una pieza completa, lo que sería difícil de hacer si no estuviera contenido por nada. En otras palabras, necesita un tipo en el que usar métodos como **`getPurchaseOrder`** y **`setPurchaseOrder`** y esta interfaz de "**`Document`**" cumple esa función.

Para cada uno de los cuatro elementos child de **`<purchase-order>`**, la interfaz de **`PurchaseOrder`** expone los accesores de acuerdo con las convenciones de JavaBeans. Por ejemplo, para el elemento **`<date>`** tienes lo siguiente:

```java
public abstract java.util.Calendar getDate()
public abstract void setDate ( java.util.Calendar )
```

Esta es una de las dos formas en que el compilador de schema proporciona acceso al elemento **`<date>`**, una forma nativa de Java más conveniente, se podría decir. Estos accesores son una especie de par de conveniencia (es probable que desee una instancia **`Calendar`** cuando trabaje con una **`date`**). Sin embargo, debido a que el tipo del elemento **`<date>`**, **`xs:dateTime`**, es un tipo de schema integrado, el compilador de schema proporciona accesores que obtienen y establecen su valor con otro tipo de Java que define **XMLBeans**:

```java
public abstract org.apache.**XMLBeans**.XmlDateTime xgetDate()
public abstract void xsetDate( org.apache.**XMLBeans**.XmlDateTime )
```

**`XmlDateTime`** se puede ver como una Rosetta Stone. Con él, puede obtener y establecer el valor del elemento mediante **`java.util.Calendar`**, **`java.util.Date`** y **`org.apache.**XMLBeans**.GDate`**. (Para obtener una lista completa de cómo schema types son mapped a Java types por el compilador, consulte **XMLBeans** Support for Built-In Schema Types).

#### Acceso para Elements de User-Defined Schema Types

Para los tres elementos cuyos tipos están definidos dentro del schema, el compilador genera separados Java types y los usa en los descriptores de acceso, como se muestra a continuación para el tipo **`customer`** del elemento **`<customer>`**.

```java
public abstract org.openuri.easypo.Customer getCustomer()
public abstract void setCustomer( org.openuri.easypo.Customer )
```

En otras palabras, puede llamar a **`getCustomer`** para recuperar su instancia **`Customer`** y luego actualizar el contenido de la instancia, que es como actualiza el contenido del elemento **`<customer>`** que representa.

Del mismo modo, obtiene un método de conveniencia para tipos complejos como customer , así:

```java
public abstract org.openuri.easypo.Customer addNewCustomer()
```

A través de un método **`add*`** como este, puede agregar un nuevo elemento **`<customer>`** al elemento **`<purchase-order>`**. El método devuelve una instancia de **`Customer`** para que pueda actualizar el contenido del nuevo elemento.

Se proporcionan otros métodos convenientes para elementos y atributos que el schema define como opcionales. El elemento **`<shipper>`** es opcional porque el schema especifica el valor de su atributo **`minOccurs`** como **`0`** (el valor predeterminado para este atributo es **`1`** ). Como resultado, no es necesario que el elemento exista en el XML para que la instancia sea válida. Para averiguar si está allí y eliminarlo si lo está, obtiene estos métodos:

```java
public boolean isSetShipper ( )
public abstract void unsetShipper ( )
```

#### Arrays para acceder a elementos que pueden aparecer más de una vez

Otro elemento opcional definido por el schema es **`<line-item>`**. Sin embargo, hay una diferencia importante para **`<line-item>`**: el valor de su atributo **`maxOccurs`** es "unbounded", lo que significa que puede ocurrir varias veces como child de **`<purchase-order>`** (como **`minOccurs`**, el valor predeterminado de **`maxOccurs`** es **`1`** ). Una forma común de Java de manejar múltiples instancias del mismo tipo es a través de un array de ese tipo, y eso es exactamente lo que le brinda el compilador de schemas:

```java
// Get or set the whole array.(Obtener o establecer todo el array)
public abstract org.openuri.easypo.LineItem[] getLineItemArray ( )
public abstract void setLineItemArray ( org.openuri.easypo.LineItem[] )

// Get or set a single item.(Obtener o establecer un solo elemento)
public abstract org.openuri.easypo.LineItem getLineItemArray ( int )
public abstract void setLineItemArray( int, org.openuri.easypo.LineItem )

// Add or remove an item.(Agregar o eliminar un item.)
public abstract org.openuri.easypo.LineItem insertNewLineItem( int )
public abstract void removeLineItem( int )

// Get the array's size (without having to get the array, then call .length).
// Obtener el tamaño del array (sin tener que obtener el array y luego llamar a .length).
public abstract int sizeOfLineItemArray()
```

Finalmente, notará que el compilador del schema ha generado un campo :

```java
public static final org.apache.**XMLBeans**.SchemaType type
```

Puede usar este campo para acceder a una instancia de **`SchemaType`** que representa el propio schema type subyacente. Esto se tratará en la última parte de este tutorial.

**Nota**

Para obtener más información sobre los tipos generados a partir del schema, consulte  Java Types Generated from User-Derived Schema Types. Para obtener más información sobre los métodos generados, consulte Methods for Types Generated from Schema. Además, **XMLBeans** proporciona sus propios Java types para schema data types integrados, como **`xs:dateTime`**, **`xs:decimal`**, etc. Para obtener más información sobre estos, consulte  **XMLBeans** Support for Built-In Schema Types.

## Escribir código que usa tipos generados

Vas a escribir un poco de código para agregar una nueva línea de pedido a la purchase order. Resulta que Gladys quiere agregar otro libro a su pedido. Su código aceptará el pedido existente junto con los datos sin procesar para el nuevo artículo, luego agregará el artículo y devolverá el XML actualizado.

Comience creando un archivo **`POUpdater.java`** en el directorio **`tutorials\gettingstarted\src`**. Agregue el siguiente código a ese archivo:

```java
import java.io.*;
import java.math.*;
import org.apache.**XMLBeans**.*;
import org.openuri.easypo.*;
public class POUpdater
{
    private static String addLineItem(File purchaseOrder, String itemDescription,
                                      String perUnitOuncesString,
                                      String itemPriceString, String itemQuantityString)
    {
        // Bind the incoming XML to an **XMLBeans** type.
        PurchaseOrderDocument poDoc = null;
        try
        {
            poDoc = PurchaseOrderDocument.Factory.parse(purchaseOrder);
        } catch (XmlException e)
        {
            e.printStackTrace();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        return poDoc.toString();
    }
}
```

Hasta ahora, el método **`addLineItem`** vincula el XML entrante a un tipo **XMLBeans** generado al compilar el schema. Este fragmento crea un método que recibe una instancia de **`File`** que representa el XML de la purchase order(orden de compra), así como strings que contienen los datos sin procesar(raw data) que comprenderán el nuevo item agregado. Vincule el *documento* XML (el root element y sus children ) a la interfaz **`PurchaseOrderDocument`**. Esta interfaz, como todos los tipos que extienden **`XmlObject`** (incluidos todos los tipos generados a partir del schema), proporciona una clase **`Factory`** con la que crear nuevas instancias. La clase **`Factory`** proporciona varias versiones del método **`parse`**, cada una de las cuales recibe el código fuente XML como un  Java type diferente.

El siguiente fragmento de código del método, que se muestra a continuación, convierte los datos sin procesar entrantes en tipos que se pueden usar al crear el nuevo elemento **`<line-item>`**. Luego agrega el nuevo elemento y establece los valores children de ese elemento. Recuerde que, en **XMLBeans**, obtiene el tipo que representa un elemento global pasando por el tipo "**`Document`**" que lo contiene, aquí, con el método **`getPurchaseOrder`**.

```java
BigDecimal perUnitOunces = new BigDecimal(perUnitOuncesString);
BigDecimal itemPrice = new BigDecimal(itemPriceString);
BigInteger itemQuantity = new BigInteger(itemQuantityString);

LineItem newItem = poDoc.getPurchaseOrder().addNewLineItem();
newItem.setDescription(itemDescription);
newItem.setPerUnitOunces(perUnitOunces);
newItem.setPrice(itemPrice);
newItem.setQuantity(itemQuantity);
```

Eso es prácticamente todo lo que hay que hacer. El acceso estilo JavaBeans proporcionado al compilar su schema simplifica enormemente su acceso a instancias XML basadas en el schema.

Aquí hay una versión completa de la clase **`POUpdater`**, con el método **`addLineItem`** accesible a través de un método **`main `**.

```java
import java.io.*;
import java.math.*;
import org.apache.**XMLBeans**.*;
import org.apache.easypo.*;
public class POUpdater
{
    public static void main(String[] args)
    {
        File poXmlFile = new File(args[0]);
        String updatedPoXml = addLineItem(poXmlFile, args[1], args[2],
            args[3], args[4]);
        System.out.println(updatedPoXml);
    }
    private static String addLineItem(File purchaseOrder, String itemDescription,
                                      String perUnitOuncesString,
                                      String itemPriceString, String itemQuantityString)
    {
        PurchaseOrderDocument poDoc = null;
        try
        {
            // Bind the incoming XML to an **XMLBeans** type.
            poDoc = PurchaseOrderDocument.Factory.parse(purchaseOrder);
        } catch (XmlException e)
        {
            e.printStackTrace();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        // Convert incoming data to types that can be used in accessors.
        BigDecimal perUnitOunces = new BigDecimal(perUnitOuncesString);
        BigDecimal itemPrice = new BigDecimal(itemPriceString);
        BigInteger itemQuantity = new BigInteger(itemQuantityString);
        // Add the new <line-item> element.
        LineItem newItem = poDoc.getPurchaseOrder().addNewLineItem();
        newItem.setDescription(itemDescription);
        newItem.setPerUnitOunces(perUnitOunces);
        newItem.setPrice(itemPrice);
        newItem.setQuantity(itemQuantity);
        return poDoc.toString();
    }
}
```

Ahora, compile la nueva clase con un comando como el siguiente (la línea está partida para facilitar la lectura):

```sh
javac -classpath %**XMLBeans**_HOME%\lib\xbean.jar;tutorials\gettingstarted\lib\easypo.jar
    -d tutorials\gettingstarted\classes tutorials\gettingstarted\src\POUpdater.java
```

Después de compilar, puede probar la clase con el siguiente comando (nuevamente, roto para facilitar la lectura):

```sh
java -cp tutorials\gettingstarted\classes;%**XMLBeans**_HOME%\lib\xbean.jar;tutorials\gettingstarted\lib\easypo.jar
    POUpdater tutorials\gettingstarted\instances\easypo.xml "a new item" 5.0 20.00 6
```

El resultado debería verse como el resultado de la instancia anterior, pero con lo siguiente agregado como el último elemento **`<line-item>`**, inmediatamente antes del elemento **`<shipper>`**.

```xml
<line-item>
    <description>Backyard Astronomer's Guide, The</description>
    <per-unit-ounces>5.0</per-unit-ounces>
    <price>49.95</price>
    <quantity>2</quantity>
</line-item>
```

Obviamente, necesita un schema para usar este aspecto de **XMLBeans**. Pero puede encontrarse creando un schema en el que solo tiene instancias para que pueda compilarlo para generar esos Java types, solo para facilitarle un poco la vida.

## Primeros pasos con el XML Cursor

El XML Cursor, representado en la API por la interfaz **`org.apache.**XMLBeans**.XmlCursor`**, está diseñado para (entre otras cosas) complementar el acceso estilo JavaBeans que obtiene de los tipos generados al compilar el schema. El cursor brinda la capacidad de moverse sobre el XML de una manera más detallada. Por ejemplo, en el código anterior agregó un nuevo elemento **`<line-item>`**, pero no tenía control sobre dónde iba el nuevo elemento. **XMLBeans** acaba de insertarlo como el último **`<line-item>`**. La simplicidad que brindan los pares get/set es claramente una ventaja con los Java types que obtiene del schema, pero cuando se preocupa por un control más preciso, como el orden de los elementos, recurra a **`XmlCursor`**.

Se podría decir que **`XmlCursor`** proporciona una vista del XML independiente del schema. Desde la perspectiva de un cursor, el XML es una serie de *tokens*. Estos tokens se dividen en categorías llamadas ***token types*** representados por constantes de **`org.apache.**XMLBeans**.XmlCursor.TokenType`**. Los Token types incluyen **`START`** (para el comienzo de un elemento), **`END`** (para su final), **`ATTR`** (para un atributo) y **`TEXT`** (para el contenido de texto de un elemento). Con un cursor, navega a través de XML moviendo el cursor de un token a otro.

## Adición de un nuevo elemento **`<line-item>`**, Cursor-Style

En esta sección, insertará el mismo elemento nuevo **`<line-item>`**, pero esta vez con cuidado para asegurarse de que esté en el lugar correcto de la lista, en orden alfabético. En aras de la simplicidad, asuma que los elementos **`<line-item>`** en el documento que recibe ya están en orden alfabético (lo cual sucede que lo están). Solo necesita asegurarse de que la adición siga su ejemplo.

Cree un nuevo método llamado **`addLineItemWithCursor`**. Usarás esto como una alternativa al método anterior. Al igual que en el método **`addLineItem`**, deberá analizar el XML entrante en los tipos que generó, por lo que su nuevo método debería comenzar con este aspecto:

```java
private static String addLineItemWithCursor(File purchaseOrder, String itemDescription,
    String perUnitOunces, String itemPrice, String itemQuantity)
{
    PurchaseOrderDocument poDoc = null;
    try
    {
        poDoc = PurchaseOrderDocument.Factory.parse(purchaseOrder);
    } catch (XmlException e)
    {
        e.printStackTrace();
    } catch (IOException e)
    {
        e.printStackTrace();
    }
    PurchaseOrderDocument.PurchaseOrder po = poDoc.getPurchaseOrder();
}
```

A continuación, deberá agregar algo a través del cual pueda verificar el orden alfabético. Para esto, puede usar una clase que implemente **`java.text.Collator`**. Resulta que **`java.text.RuleBasedCollator`** hace justo lo que necesita comparando palabras para averiguar si una debe preceder a la otra. Creará una instancia de **`RuleBasedCollator`** con el siguiente código:

```java
RuleBasedCollator intercalador =
        (RuleBasedCollator)Collator.getInstance(new Locale("en", "US", ""));
```

Ahora es el momento de comenzar con el cursor. Puede agregar un nuevo cursor a cualquier tipo de **XMLBeans** que amplíe **`XmlObject`**, incluidos los tipos generados que representan su schema. Cuando agrega un cursor con el método **`newCursor`**, el cursor se crea al comienzo del XML representado por el tipo en el que está llamando al método. Por ejemplo, la siguiente línea de código creará un cursor que precede inmediatamente al XML representado por **`PurchaseOrder`**:

```java
XML cursorCursor = po.newCursor();
```

En otras palabras, después de este código, el cursor precederá inmediatamente al elemento **`<purchase-order>`**: estará en el token **`START`** de ese elemento. El elemento **`<purchase-order>`** tiene un atributo **`xmlns `**, por lo que si llamó a **`cursor.toNextToken()`**, movería el cursor a un token **`ATTR`** que representa el atributo, como se ilustra aquí.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/8ffa50b8-b62d-4b52-901d-ddf645952e93)

Pero por el momento, el código dejará el cursor donde está. En su lugar, llamará a otro método para obtener el URI para el namespace predeterminado; lo necesitará al agregar nuevos elementos, como verá.

```java
String namespaceUri = cursor.namespaceForPrefix("");
```

Para hacer el trabajo real, escribirá código para obtener, al estilo de JavaBeans, el array que representa los elementos **`<line-item>`** y recorrerá  el array para encontrar el primer elemento line cuya descripción pertenezca después de la que desea insertar. Luego, su código insertará la nueva línea de pedido antes de la que encontró.

En particular, reasignará la instancia de cursor existente a un nuevo cursor en el elemento **`<line-item>`** antes del cual desea insertar.

```java
cursor = lineItem.newCursor();
```

Luego comenzará un nuevo elemento allí; darle al nuevo elemento el URI de namespace predeterminado garantizará que el elemento pertenezca al mismo namespace que el XML que lo rodea.

```java
cursor.beginElement("line-item", namespaceUri);
```

El método **`beginElement`** crea un nuevo elemento donde está el cursor (si hacerlo resultará en un XML bien formado) y deja el cursor entre los tokens **`START`** y **`END`** del nuevo elemento.

Finalmente, su código llenará el nuevo elemento **`<line-item>`** con elementos child a través de más llamadas a **`beginElement`** e insertando texto para los valores de los elementos. Aquí hay un fragmento para mostrar cómo funciona esto:

```java
cursor.beginElement("description", namespaceUri);
cursor.insertChars(itemDescription);
cursor.toNextToken();
cursor.beginElement("per-unit-ounces", namespaceUri);
// ... and so on for the other children...
```

A continuación, se ilustra el cambio y movimiento de tokens que se produce entre la inserción de un nuevo cursor y el comienzo de un nuevo elemento.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/16ae5371-1a4b-4d20-a294-4b3be9aed7c4)

Las operaciones del cursor son así. Mueve el cursor de un token a otro token como si fuera de un vagón de tren a otro. Copiar, mover o eliminar elementos shifts tokens para dejar espacio a otros o para cerrar un espacio dejado atrás.

**Nota**

Los nombres de los tipos de tokens ( **`START`**, **`END`**, **`ATTR`**, etc.) lo tentarán a equiparar los tokens con partes reales del XML markup; resista la tentación. Los tokens son abstracciones, no tags. Por ejemplo, un elemento expresado en un documento de instancia como **`<foo bar="baz"/>`** tendrá un token **`START`** , **`ATTR`** y **`END`** aunque no tenga una tag final. Puede obtener más información sobre los tipos de tokens en Understanding XML Tokens.

Aquí está el código completo del método:

```java
private static String addLineItemWithCursor(File purchaseOrder, String itemDescription,
    String perUnitOunces, String itemPrice, String itemQuantity)
{
    PurchaseOrderDocument poDoc = null;
    try
    {
        poDoc = PurchaseOrderDocument.Factory.parse(purchaseOrder);
    } catch (XmlException e)
    {
        e.printStackTrace();
    } catch (IOException e)
    {
        e.printStackTrace();
    }
    PurchaseOrderDocument.PurchaseOrder po = poDoc.getPurchaseOrder();
    // Set up the collator for alphabetizing.
    RuleBasedCollator collator =
        (RuleBasedCollator)Collator.getInstance(new Locale("en", "US", ""));
    XmlCursor cursor = po.newCursor();
    // Get the document's URI so you can use it to insert.
    String namespaceUri = cursor.namespaceForPrefix("");
    // Get the array of <line-item> elements.
    LineItem[] lineItems = po.getLineItemArray();
    // Loop through the element array to discover where to insert the new one.
    for (int i = 0; i < lineItems.length; i++)
    {
        LineItem lineItem = lineItems[i];
        // Find out if the new line item's description belongs before the
        // current line item's.
        int comparison = collator.compare(itemDescription, lineItem.getDescription());
        // If the comparison returns -1, then insert the new line item (and
        // its children) before the current one.
        if (comparison < 0)
        {
            cursor = lineItem.newCursor();
            // Begin the new <line-item> element.
            cursor.beginElement("line-item", namespaceUri);
            // Begin the new <description> element and insert its text value.
            cursor.beginElement("description", namespaceUri);
            cursor.insertChars(itemDescription);
            // Move on and do the same for the other elements.
            cursor.toNextToken();
            cursor.beginElement("per-unit-ounces", namespaceUri);
            cursor.insertChars(perUnitOunces);
            cursor.toNextToken();
            cursor.beginElement("prices", namespaceUri);
            cursor.insertChars(itemPrice);
            cursor.toNextToken();
            cursor.beginElement("quantity", namespaceUri);
            cursor.insertChars(itemQuantity);
            break;
        }
    }
    // Speed the cursor's garbage collection and return the updated XML.
    cursor.dispose();
    return poDoc.toString();
}
```

Antes de realizar la prueba, querrá actualizar su método **`main`** para que llame al método **`addLineItemCursor`** en lugar del método **`addLineItem`** que usó anteriormente.

```java
public static void main(String[] args)
{
    File poXmlFile = new File(args[0]);
    // String updatedPoXml = addLineItem(poXmlFile, args[1], args[2],
    //     args[3], args[4]);
    String updatedPoXml = addLineItemWithCursor(poXmlFile, args[1], args[2],
        args[3], args[4]);
    System.out.println(updatedPoXml);
} 
```

Finalmente, antes de compilar, deberá agregar dos declaraciones de importación más para admitir el código de alfabetización:

```java
import java.text.*;
import java.util.*;
```

Pruebe la clase **`POUpdater`** tal como lo hizo antes. Esta vez, debería ver el nuevo elemento **`<line-item>`** agregado como el primero en el conjunto, en lugar de al final.

Antes de continuar, debe reflexionar sobre otro aspecto del trabajo con cursores. El soporte del cursor para cambiar el XML fuera de las restricciones del schema también significa que, sin cuidado, puede desviarse mucho de la validez del schema. Si la validez importa, asegúrese de considerar llamar al método **`validate`** antes de pasar el XML editado.

**Nota**

Para obtener más información sobre el uso de la interfaz **`XmlCursor`**, consulte Navigating XML with Cursors.

### A dónde ir desde aquí

Asegúrese de consultar la [**XMLBeans** documentation](https://**XMLBeans**.apache.org/documentation/index.html).
La página [**XMLBeans** Resources](https://**XMLBeans**.apache.org/resources/index.html) proporciona enlaces a muchos artículos.
