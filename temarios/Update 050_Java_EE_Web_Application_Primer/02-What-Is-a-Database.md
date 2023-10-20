# 2. ¿Qué es una base de datos?
Dave Wolf1  y A. J. Henley2

(1)Nueva York, EE.UU.

(2)Washington, D.C., Distrito de Columbia, EE.UU.

Una base de datos es un lugar para almacenar datos permanentemente para recuperarlos de forma segura y eficiente. Una base de datos nos permite crear datos y guardarlos de forma permanente. Nos permite recuperar datos creados previamente, actualizar datos existentes o eliminar datos existentes.

Una transacción agrupa declaraciones SQL para que todas se apliquen a la base de datos. Si una declaración falla por algún motivo, todas las declaraciones se deshacen de la base de datos. Las transacciones garantizan la integridad de los datos. Las transacciones distinguen un sistema de gestión de bases de datos como Oracle de un sistema de archivos.

Las propiedades de una transacción de base de datos que garantizan la validez de los datos son atomicidad, coherencia, aislamiento y durabilidad.

La atomicidad se refiere al hecho de que en cada transacción de la base de datos se guarda toda la información o no se guarda nada.

La coherencia garantiza que una transacción funcione correctamente o que el conjunto de datos vuelva al estado en el que se encontraba antes de que se ejecutara la transacción.

El aislamiento se refiere a la capacidad de una base de datos para mantener una transacción que aún no se ha comprometido claramente separada de la base de datos de trabajo.

La durabilidad se refiere a la forma en que el sistema guarda los datos comprometidos, de modo que, incluso en caso de falla y reinicio del sistema, los datos estén disponibles en su estado correcto.

La base de datos almacena datos en conjuntos, que comúnmente se ven como tablas. Una fila de una tabla de base de datos representa un registro que contiene atributos relacionados, llamados campos. Los campos están representados por las columnas de una tabla.

Integridad referencial
Su sistema de gestión de bases de datos (DBMS) admite la integridad referencial. El objetivo de la integridad referencial es evitar tener datos “huérfanos”. Los datos huérfanos pueden ocurrir cuando elimina o actualiza los datos en sus tablas; por ejemplo, si tiene una publicación en su base de datos que no tiene un usuario coincidente. Esto no debería suceder y, a menudo, es el resultado de importar datos mal formateados o eliminar a un usuario sin darse cuenta. Un sistema de gestión de bases de datos como Oracle puede imponer la integridad referencial para evitar esto al negar cambios que resultarán en datos huérfanos.

Valores nulos
A veces no hay ningún valor en una columna de una fila. En este caso, la columna almacena un valor NULL. Puede pensar en esto como una bandera para indicar la ausencia de datos. NULL es diferente del valor numérico cero o de una cadena con una longitud de cero caracteres. No es ninguna de las dos cosas. No es nada, porque no se ha almacenado ningún valor en la columna de este registro. Resulta que NULL es muy útil. Puedes buscar un campo en registros que contengan NULL y saber que son los que no tienen valor en el campo.

Claves primarias, claves externas e índices
Las bases de datos son herramientas muy poderosas que nos permiten buscar y ordenar datos a velocidades increíbles. Un ingrediente esencial de la mecánica de una base de datos es que cada registro debe ser único. Para que cada registro sea único, utilice un campo existente que sea exclusivo para cada registro o agregue un campo a cada registro que contenga un número único.

Su DBMS puede generar un número único para cada registro. El número único de cada registro se convierte en su clave principal. Este campo distingue ese registro de cualquier otro en la tabla.

Cuando una segunda tabla contiene datos relacionados con los de la primera tabla, la segunda tabla puede hacer referencia a la original utilizando el campo de clave principal.

Una clave primaria utilizada como referencia en otra tabla se llama clave externa. Las claves externas definen una referencia de una tabla (la secundaria) a otra tabla (la primaria).

Para hacer más eficiente el acceso a una columna de datos, la base de datos creará un objeto llamado índice. Un índice contiene una entrada para cada valor en las columnas indexadas, lo que resulta en un acceso rápido a las filas. Al igual que un índice en un libro impreso, la base de datos puede buscar el valor solicitado en el índice y localizar rápidamente su fila correspondiente en la tabla.

Unir mesas
Las relaciones son un medio para unir datos a diferentes tablas. Esto le ayuda a evitar la redundancia en las tablas. Puede dividir sus datos en diferentes tablas (ingresándolos solo una vez) y luego hacer referencia a ellos desde otras tablas estableciendo relaciones.

Hay tres tipos de relaciones, de la siguiente manera:

Una relación uno a uno es donde cada registro de la primera tabla tiene solo un registro coincidente en la segunda tabla. Esto suele ocurrir cuando la información de una tabla se divide en varias tablas. Esto no es común.

Una relación de uno a muchos es donde cada registro de la primera tabla coincide con varios registros de la segunda tabla. Por ejemplo, un usuario puede tener varias publicaciones.

Una relación de muchos a muchos es donde cada registro de la primera tabla puede tener muchos registros correspondientes en la segunda tabla, y también cada registro de la segunda tabla puede tener muchos registros correspondientes en la primera tabla.

Normalización
En una estructura de datos normalizada, cada tabla contiene información sobre una sola entidad y cada pieza de información es
