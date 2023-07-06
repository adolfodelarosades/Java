# Tutorial: Primeros Pasos con XMLBeans

## Introducción

Este tutorial presenta los conceptos básicos de XMLBeans. A través de él, obtendrá una vista práctica de dos de las tres tecnologías que componen la versión 5.0.0 de XMLBeans: acceso fuertemente tipado a XML a través de un esquema compilado y acceso agnóstico de tipo a XML a través del cursor XML. Este tutorial describe qué es XMLBeans y presenta algunas de las herramientas que vienen con una instalación de XMLBeans.

Para comenzar, necesitará lo siguiente:

* JDK 1.8 para XMLBeans 5.0.0.
* Una instalación de XMLBeans 5.0.0. Si aún no tiene esto, encontrará instrucciones de instalación en Installing XMLBeans.
* Un entorno configurado de acuerdo con lo que se describe en Installing XMLBeans.
* Un editor para escribir código Java. Esto podría ser un editor de texto o su IDE de Java favorito.

Creará algunos archivos como parte de este tutorial. Comience creando un nuevo directorio **`tutorials`** justo debajo de su directorio **`XMLBEANS_HOME`**. Esto contendrá los archivos que cree en el curso de este tutorial. Mientras lo hace, cree los siguientes subdirectorios en el directorio de tutoriales: **`classes`**, **`instances`**, **`src`**, **`lib`**. Si está trabajando con XMLBeans versión 1.0.3, su jerarquía debería verse así:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/86a08883-9e48-4f9c-b3e0-b475aaf03464)

## Familiarícese con los conceptos básicos

XMLBeans 5.0.0 incluye múltiples tecnologías relacionadas para manejar XML. En pocas palabras, XMLBeans ofrece tres tecnologías complementarias:

* Un schema-oriented way para ver instancias XML a través de Java types basados ​​en schema.
* Un schema-agnostic way para recorrer el conjunto de información XML completo.
* Un schema object model a través del cual, en código Java, puede examinar un XML schema compilado. (Nota: este aspecto de XMLBeans no se trata en este tutorial. Para obtener más información, consulte [Introduction to the Schema Type System](https://xmlbeans.apache.org/guide/IntroSchemaType.html).

Hay mucho más, pero es un comienzo. Cada una de estas tres piezas es útil para diferentes objetivos, y es posible que se encuentre escribiendo código que use las tres en la misma aplicación. El resto de este tutorial le presentará estas tecnologías.

## Primeros pasos con el manejo de XML a través del Schema

Una de las cosas que XMLBeans hace mejor es proporcionarle una forma de manejar XML mediante el uso de un schema al que se ajusta el XML. Con XMLBeans puede compilar uno o más archivos de esquema (XSD) para generar tipos Java. Al vincular documentos de instancias XML a estos tipos de Java, se proporciona una forma de acceder a las instancias en Java de forma orientada a esquemas.

Pruebe esto ahora con XML que obtuvo cuando instaló XMLBeans. Para comenzar, abra un símbolo del sistema y cd al directorio que contiene su instalación de XMLBeans.

Si siguió las instrucciones de instalación en Instalación de XMLBeans, debería poder ejecutar los scripts que obtuvo en el directorio **`\bin`**. Use uno de estos ahora, **`xpretty`**, para echar un vistazo al ** easypo schema** contenido en **`easypo.xsd`**, así (si está usando un sistema operativo UNIX, este script no está disponible, por lo que deberá abrir el archivo en un editor):

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
* Tres de los cuatro child elements tienen sus propios children en una estructura particular, como se define en los elementos **`<complexType>`** respectivos del esquema.

Ahora eche un vistazo a un documento XML basado en este esquema. Copie el siguiente XML de esta página en un nuevo archivo XML llamado **`easypo.xml`**, luego coloque el archivo en el directorio **`tutorials\gettingstarted\instances`** que creó al comienzo de este tutorial.


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

Ahora, pruebe estos ejemplos con XMLBeans. Entre las herramientas incluidas con XMLBeans se encuentra **`scomp`**, un script que ejecuta el compilador de esquemas (parte de la API de XMLBeans) para compilar un esquema o directorio de esquemas. Use **`scomp`** para compilar el schema easypo. En Windows, use el siguiente comando (este script también está disponible en UNIX):

```sh
scomp -out tutorials\gettingstarted\lib\easypo.jar schemas\easypo\easypo.xsd
```

Terminará con **`easypo.jar`** en el directorio **`lib`** de la jerarquía de su tutorial.

**Nota**

Si usa Ant en su compilación, puede usar la tarea Ant de XMLBean en lugar de **`scomp`**.

## Resultados de compilar el Schema

***Esta sección describe las interfaces generadas por el compilador de Schemas. Si está familiarizado con esto, desea pasar a escribir código Java, vaya a Writing Code that Uses Generated Types.

La salida del compilador del schema está diseñada no solo para proporcionar una vista de su schema orientada a JavaBeans, sino también para anticipar los accesos directos(shortcuts) que es probable que desee. Si compara el contenido de **`easypo.xsd`** con los Java types generados al compilarlo, verá paralelismos obvios. Para cada uno de los elements y schema types definidos en el schema, el compilador del schema ha generado Java types. El package name corresponde al URI del namespace del schema.

Por ejemplo, observe de nuevo el elemento **`<purchase-order>`** definido en el esquema:

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

Este fragmento define el elemento **`<purchase-order>`** con un "local" complex type (también conocido como "anonymous" complex type). Este tipo incluye una secuencia de child elements (en el mundo del schema, **`<sequence>`** es un "compositor" y cada **`<element>`** es una "particle"). El elemento **`<date>`** se especifica como **`xs:dateTime`**, un tipo integrado definido por la especificación de tipo de datos de esquema del W3C; los otros tres elementos son tipos complejos definidos en otra parte de este esquema.

#### Opciones para acceder a Elements de Built-In Schema Types

Para representar al elemento **`<purchase-order>`**, el compilador del esquema ha generado una interfaz **`PurchaseOrder`** que extends **`java.lang.Object`** y **`org.apache.xmlbeans.XmlObject`**. Sin embargo, encontrará que esta interfaz en realidad está contenida dentro de una interfaz de **`PurchaseOrderDocument`**. XMLBeans hace esto para el elemento "**`global`**" y atributos: los definidos en el nivel superior del schema. Esto es para proporcionarle una forma de obtener y configurar el elemento **`global`** como una pieza completa, lo que sería difícil de hacer si no estuviera contenido por nada. En otras palabras, necesita un tipo en el que usar métodos como **`getPurchaseOrder`** y **`setPurchaseOrder`** y esta interfaz de "**`Document`**" cumple esa función.

Para cada uno de los cuatro elementos child de **`<purchase-order>`**, la interfaz de PurchaseOrder expone los accesores de acuerdo con las convenciones de JavaBeans. Por ejemplo, para el elemento <date> tienes lo siguiente:
