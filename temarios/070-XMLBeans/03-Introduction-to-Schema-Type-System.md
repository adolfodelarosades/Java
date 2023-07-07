# ntroducción al sistema de tipo de esquema
Firmas de tipo de esquema
Cuando compila el esquema, la API generada a partir de su esquema se integra con el sistema de tipos XMLBeans que representa el esquema XML subyacente. Todos juntos, estos tipos conforman el sistema de tipo de esquema al que tiene acceso su código. Cuando maneja XML basado en el esquema, normalmente llama a los métodos de la API generados cuando compiló el esquema. Sin embargo, para los casos en los que desea obtener información sobre el esquema en sí, utilice la API del sistema de tipo de esquema.

En la API de XMLBeans, tiene acceso al propio sistema a través de SchemaTypeSystem y clases relacionadas. Estos constituyen una especie de "meta-API" o una vista del esquema. Puede utilizar la API del sistema de tipos de esquema para descubrir el sistema de tipos en tiempo de ejecución. Consulte el tema de referencia en esa interfaz para obtener una descripción general del sistema de tipo de esquema.

Un esquema se compone de componentes de esquema. Los componentes del esquema son las partes de un esquema, como una definición de tipo, una declaración de elemento, una declaración de atributo, etc. Para reflejarlos en el sistema de tipo de esquema, una instancia de SchemaComponent representa un componente en el esquema subyacente; los componentes separados tienen tipos correspondientes. Por ejemplo, tendría un objeto SchemaType para un CustomerType definido por su esquema, o un objeto SchemaGlobalElement para un elemento de orden de compra global . También tendría un SchemaType para tipos de esquema integrados, como xs:string o xs:datetime . XMLBean proporciona una "firma" para describir cada tipo. Puede recuperar esta firma llamando al método toString de la clase SchemaType .

El método toString devuelve la versión de XMLBeans de una firma única para un tipo de esquema. Esta cadena es útil para la depuración porque describe un tipo dado incluso cuando el tipo no tiene nombre.

Nota: es importante recordar que esta firma es una convención de XMLBeans, en lugar de un estándar del grupo de trabajo de esquema. El grupo de trabajo aún no ha estandarizado una firma para los tipos de esquema XML. Como resultado, la firma que verá de XMLBeans está sujeta a cambios; cualquier cosa que el grupo de trabajo de esquema presente al final (si es que algo) es probablemente lo que usará esta API. En otras palabras, no escriba un programa para decodificar la firma.

Puede usar la siguiente descripción para comprender cómo se construye una firma.

Tipos globales. Si el tipo tiene un nombre, es un tipo global. Se utiliza el siguiente formulario:

T=<nombre local>@<espacio de nombre de destino>

La "T" es para "tipo", por supuesto. "localname" es una convención utilizada por qnames (nombres calificados), que incluyen un nombre local y el URI del espacio de nombres (si lo hay). Así que un ejemplo podría ser:

T=cliente@openuri.org
Tipos de documentos y tipos de atributos globales. Estos corresponden a un tipo anónimo especial que contiene un elemento o atributo global. XMLBeans genera estos tipos especiales para representar tipos globales declarados con la etiqueta <element> o <attribute> en el esquema. Dado que tales tipos son tipos, pero se declaran como elementos o atributos, requieren un tratamiento especial. Se utiliza el siguiente formulario de firma:

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
El esquema, si se hace con muchos tipos anidados, podría verse así:

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

Tenga en cuenta que la estructura de la firma refleja la estructura de la clase Java generada por XMLBeans al compilar el esquema. En otras palabras, si tuviera que compilar un esquema que incluyera el fragmento anterior, podría acceder a una instancia del esquema con código Java como el siguiente:

SchemaType sType = RootDocument.Root.MyList.Item.type;

Temas relacionados
Primeros pasos con XMLBeans

 
Última publicación: 05/01/2022 17:07:04
Copyright © 2004-2022 La Fundación de Software Apache
Env
