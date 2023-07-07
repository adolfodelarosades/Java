# Introducción al Schema Type System

## Schema Type Signatures - Firmas de Schema Type

Cuando compila el schema, la API generada a partir de su schema se integra con el sistema de tipos XMLBeans que representa el schema XML subyacente. Todos juntos, estos tipos conforman el ***schema type system*** al que tiene acceso su código. Cuando maneja XML basado en el schema, normalmente llama a los métodos de la API generados cuando compiló el schema. Sin embargo, para los casos en los que desea obtener información sobre el schema en sí, utilice la schema type system API.

En la API de XMLBeans, tiene acceso al propio sistema a través de [SchemaTypeSystem](https://xmlbeans.apache.org/docs/5.0.0/org/apache/xmlbeans/SchemaTypeSystem.html) y clases relacionadas. Estos constituyen una especie de "meta-API" o una vista del schema. Puede utilizar la API del sistema de tipos de schema para descubrir el sistema de tipos en tiempo de ejecución. Consulte el tema de referencia en esa interfaz para obtener una descripción general del sistema de tipo de schema.

Un schema se compone de componentes de schema. Los componentes del schema son las partes de un schema, como una definición de tipo, una declaración de elemento, una declaración de atributo, etc. Para reflejarlos en el sistema de tipo de schema, una instancia de [SchemaComponent](https://xmlbeans.apache.org/docs/5.0.0/org/apache/xmlbeans/SchemaComponent.html) representa un componente en el schema subyacente; los componentes separados tienen tipos correspondientes. Por ejemplo, tendría un objeto **SchemaType** para un **CustomerType** definido por su schema, o un objeto **SchemaGlobalElement** para un elemento de orden de compra global. También tendría un **SchemaType** para tipos de schema integrados, como **`xs:string`** o **`xs:datetime`**. XMLBean proporciona una "signature" para describir cada tipo. Puede recuperar esta firma llamando al método **`toString`** de la clase **`SchemaType`**.

El método **`toString`** devuelve la versión de XMLBeans de una firma única para un tipo de schema. Esta cadena es útil para la depuración porque describe un tipo dado incluso cuando el tipo no tiene nombre.

**Nota**: es importante recordar que esta firma es una convención de XMLBeans, en lugar de un estándar del grupo de trabajo de schema. El grupo de trabajo aún no ha estandarizado una firma para los tipos de schema XML. Como resultado, la firma que verá de XMLBeans está sujeta a cambios; cualquier cosa que el grupo de trabajo de schema presente al final (si es que algo) es probablemente lo que usará esta API. En otras palabras, no escriba un programa para decodificar la firma.

Puede usar la siguiente descripción para comprender cómo se construye una firma.

* **Global types**. Si el tipo tiene un nombre, es un tipo global. Se utiliza el siguiente formulario:
   `T=<localname>@<targetNamespace>`
   La "T" es para "tipo", por supuesto. "localname" es una convención utilizada por qnames (nombres calificados), que incluyen un nombre local y el URI del espacio de nombres (si lo hay). Así que un ejemplo podría ser:
   `T=customer@openuri.org`
  AQUIIIIIII
* **Document types and global attribute types**. Estos corresponden a un tipo anónimo especial que contiene un elemento o atributo global. XMLBeans genera estos tipos especiales para representar tipos globales declarados con la etiqueta <element> o <attribute> en el schema. Dado que tales tipos son tipos, pero se declaran como elementos o atributos, requieren un tratamiento especial. Se utiliza el siguiente formulario de firma:

D=<nombre-elemento-documento>@<espacioNombredestino>
R=<nombre-tipo-atributo>@<espacio de nombre de destino>
Tenga en cuenta que estas también son las firmas de un tipo devuelto por una llamada al método FooDocument.type o FooAttribute.type.

Tipos anónimos. Si el tipo es anónimo, se define como un elemento o atributo, o dentro de otro tipo anónimo. En este caso, la firma se construye estableciendo el contexto local (en otras palabras, ¿en qué está anidado el tipo anónimo?). A partir del contexto local, se construye recursivamente el contexto mayor. En otras palabras, la firma se construye dando no solo el tipo anónimo en sí mismo, sino también describiendo su contexto.
Las siguientes reglas se utilizan para crear una firma para un tipo anónimo.

Podría ser un tipo anónimo definido dentro de un elemento o atributo local, que a su vez está definido dentro de otra cosa:
Si el elemento es form="qualified" (el valor predeterminado habitual):

Nota
E=<eltname>|<firma del tipo dentro del cual se define el elt>
Si el elemento es form="no calificado" :
U=<eltname>|<firma del tipo dentro del cual se define el elt> Si el atributo es form="no calificado" (el valor predeterminado habitual):
A=<attrname>|<firma del tipo dentro del attr definido> si el atributo es form="qualified" :
Q=<attrname>|<firma del tipo dentro el atributo está definido>
Podría ser un tipo anónimo definido como una restricción simple, unión o definición de lista:
Nota
M=#|<firma del tipo de unión contenedora> (# es un número que indica qué miembro de unión es, por orden de origen, como 0, 1, 2, etc.)
B=|<firma del tipo base contenedor para una restricción>
I=|<firma del tipo de lista contenedora>
En el futuro, si se permiten tipos anónimos en algún otro contexto, puede haber más códigos.
Un ejemplo
Entonces, por ejemplo, si tiene un tipo que describe los elementos de la lista dentro de un atributo de una instancia que se ve así:

<raíz mylist="432 999 143 123">
El schema, si se hace con muchos tipos anidados, podría verse así:

<schema targetNamespace="myNamespace" elementFormDefault="calificado">
    <nombre del elemento="raíz">
        <tipocomplejo>
            <atributo nombre="milista">
                <tipo simple>
                    <lista>
                        <tipo simple>
                            <!--Este es el tipo para el que es la firma -->
                            <restricción base="xs:nonNegativeInteger">
                                <totalDigits value="3"/>..
La firma para el simpleType indicada en el ejemplo sería:

I=|A=mylist|E=root|D=root@myNamespace

Podrías leer esto como:

"El tipo del elemento de la lista | dentro del tipo del tipo de atributo mylist | dentro del tipo del elemento raíz | dentro del tipo de documento para documentos <raíz> | en el espacio de nombres myNamespace".

Tenga en cuenta que la estructura de la firma refleja la estructura de la clase Java generada por XMLBeans al compilar el schema. En otras palabras, si tuviera que compilar un schema que incluyera el fragmento anterior, podría acceder a una instancia del schema con código Java como el siguiente:

SchemaType sType = RootDocument.Root.MyList.Item.type;

Temas relacionados
Primeros pasos con XMLBeans

 
Última publicación: 05/01/2022 17:07:04
Copyright © 2004-2022 La Fundación de Software Apache
Env
