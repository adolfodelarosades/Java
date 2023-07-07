# Primeros Pasos con XMLBeans

## Introducción

XMLBeans proporciona formas intuitivas de manejar XML que facilitan el acceso y la manipulación de datos y documentos XML en Java.

Características del enfoque de XMLBeans para XML:

Proporciona una vista familiar basada en objetos de Java de los datos XML sin perder el acceso a la estructura XML nativa original.
La integridad del XML como documento no se pierde con XMLBeans. Las API orientadas a XML comúnmente separan el XML para vincularlo a sus partes. Con XMLBeans, todo el documento de instancia XML se maneja como un todo. Los datos XML se almacenan en la memoria como XML. Esto significa que se conserva el orden del documento, así como el contenido del elemento original con espacios en blanco.
Con los tipos generados a partir del esquema, el acceso a las instancias XML se realiza a través de accesores similares a JavaBean, con métodos get y set.
Está diseñado teniendo en cuenta el esquema XML desde el principio: XMLBeans es compatible con todas las definiciones de esquema XML.
El acceso a XML es rápido.
El punto de partida de XMLBeans es el esquema XML.
Un esquema (contenido en un archivo XSD) es un documento XML que define un conjunto de reglas a las que deben ajustarse otros documentos XML. La especificación XML Schema proporciona un modelo de datos enriquecido que le permite expresar una estructura y restricciones sofisticadas en sus datos. Por ejemplo, un esquema XML puede imponer control sobre cómo se ordenan los datos en un documento o restricciones sobre valores particulares (por ejemplo, una fecha de nacimiento que debe ser posterior a 1900). Desafortunadamente, la capacidad de hacer cumplir reglas como esta normalmente no está disponible en Java sin escribir un código personalizado. XMLBeans respeta las restricciones del esquema.

Nota: Cuando un esquema XML define reglas para un documento XML, una instancia XML es un documento XML que se ajusta al esquema.

Compile un archivo de esquema (XSD) para generar un conjunto de interfaces Java que reflejen el esquema. Con estos tipos, procesa documentos de instancia XML que se ajustan al esquema. Vincule un documento de instancia XML a estos tipos; los cambios realizados a través de la interfaz de Java modifican la representación XML subyacente.

Las opciones anteriores para manejar XML incluyen el uso de interfaces de programación XML (como DOM o SAX) o una herramienta de vinculación/ordenación de XML (como JAXB). Debido a que carece de tipificación sólida orientada a esquemas, la navegación en un modelo orientado a DOM es más tediosa y requiere una comprensión del modelo de objetos completo. JAXB proporciona soporte para la especificación del esquema XML, pero solo maneja un subconjunto del mismo; XMLBeans lo admite todo. Además, al almacenar los datos en la memoria como XML, XMLBeans puede reducir la sobrecarga de clasificación y desclasificación.

Acceso a XML utilizando su esquema
Para echar un vistazo a los tipos de cosas que puede hacer con XMLBeans, eche un vistazo a un ejemplo usando XML para una orden de compra. El XML de la orden de compra contiene datos intercambiados por dos partes, como dos empresas. Ambas partes deben poder confiar en una forma de mensaje consistente, y un esquema especifica el terreno común.

Este es el aspecto que podría tener una instancia XML de orden de compra.
