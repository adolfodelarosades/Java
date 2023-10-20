# 2. ¿Qué es una base de datos?

Una base de datos es un lugar para almacenar datos permanentemente para recuperarlos de forma segura y eficiente. Una base de datos nos permite crear datos y guardarlos de forma permanente. Nos permite recuperar datos creados previamente, actualizar datos existentes o eliminar datos existentes.

Una transacción agrupa declaraciones SQL para que todas se apliquen a la base de datos. Si una declaración falla por algún motivo, todas las declaraciones se deshacen de la base de datos. Las transacciones garantizan la integridad de los datos. Las transacciones distinguen un sistema de gestión de bases de datos como Oracle de un sistema de archivos.

Las propiedades de una transacción de base de datos que garantizan la validez de los datos son atomicidad, coherencia, aislamiento y durabilidad.

* La *Atomicity-atomicidad* se refiere al hecho de que en cada transacción de la base de datos se guarda toda la información o no se guarda nada.

* La *Consistency-coherencia* garantiza que una transacción funcione correctamente o que el conjunto de datos vuelva al estado en el que se encontraba antes de que se ejecutara la transacción.

* El *Isolation-aislamiento* se refiere a la capacidad de una base de datos para mantener una transacción que aún no se ha comprometido claramente separada de la base de datos de trabajo.

* La *Durability-durabilidad* se refiere a la forma en que el sistema guarda los datos comprometidos, de modo que, incluso en caso de falla y reinicio del sistema, los datos estén disponibles en su estado correcto.

La base de datos almacena datos en conjuntos, que comúnmente se ven como tablas. Una fila de una tabla de base de datos representa un registro que contiene atributos relacionados, llamados campos. Los campos están representados por las columnas de una tabla.

## Integridad referencial

Su sistema de gestión de bases de datos (DBMS) admite la integridad referencial. El objetivo de la integridad referencial es evitar tener datos “huérfanos”. Los datos huérfanos pueden ocurrir cuando elimina o actualiza los datos en sus tablas; por ejemplo, si tiene una publicación en su base de datos que no tiene un usuario coincidente. Esto no debería suceder y, a menudo, es el resultado de importar datos mal formateados o eliminar a un usuario sin darse cuenta. Un sistema de gestión de bases de datos como Oracle puede imponer la integridad referencial para evitar esto al negar cambios que resultarán en datos huérfanos.

## Valores Null

A veces no hay ningún valor en una columna de una fila. En este caso, la columna almacena un valor NULL. Puede pensar en esto como una bandera para indicar la ausencia de datos. NULL es diferente del valor numérico cero o de una cadena con una longitud de cero caracteres. No es ninguna de las dos cosas. No es nada, porque no se ha almacenado ningún valor en la columna de este registro. Resulta que NULL es muy útil. Puedes buscar un campo en registros que contengan NULL y saber que son los que no tienen valor en el campo.

## Primary Keys, Foreign Keys, e Indexes

Las bases de datos son herramientas muy poderosas que nos permiten buscar y ordenar datos a velocidades increíbles. Un ingrediente esencial de la mecánica de una base de datos es que cada registro debe ser único. Para que cada registro sea único, utilice un campo existente que sea exclusivo para cada registro o agregue un campo a cada registro que contenga un número único.

Su DBMS puede generar un número único para cada registro. El número único de cada registro se convierte en su clave principal. Este campo distingue ese registro de cualquier otro en la tabla.

Cuando una segunda tabla contiene datos relacionados con los de la primera tabla, la segunda tabla puede hacer referencia a la original utilizando el campo de clave principal.

Una clave primaria utilizada como referencia en otra tabla se llama clave externa. Las claves externas definen una referencia de una tabla (la secundaria) a otra tabla (la primaria).

Para hacer más eficiente el acceso a una columna de datos, la base de datos creará un objeto llamado índice. Un índice contiene una entrada para cada valor en las columnas indexadas, lo que resulta en un acceso rápido a las filas. Al igual que un índice en un libro impreso, la base de datos puede buscar el valor solicitado en el índice y localizar rápidamente su fila correspondiente en la tabla.

## Joining Tables

Las relaciones son un medio para unir datos a diferentes tablas. Esto le ayuda a evitar la redundancia en las tablas. Puede dividir sus datos en diferentes tablas (ingresándolos solo una vez) y luego hacer referencia a ellos desde otras tablas estableciendo relaciones.

Hay tres tipos de relaciones, de la siguiente manera:

* Una **relación uno a uno - One-to-One relationship**  es donde cada registro de la primera tabla tiene solo un registro coincidente en la segunda tabla. Esto suele ocurrir cuando la información de una tabla se divide en varias tablas. Esto no es común.

* Una **relación de uno a muchos - One-to-Many relationship** es donde cada registro de la primera tabla coincide con varios registros de la segunda tabla. Por ejemplo, un usuario puede tener varias publicaciones.

* Una **relación de muchos a muchos - Many-to-Many relationship** es donde cada registro de la primera tabla puede tener muchos registros correspondientes en la segunda tabla, y también cada registro de la segunda tabla puede tener muchos registros correspondientes en la primera tabla.

## Normalización

En una estructura de datos normalizada, cada tabla contiene información sobre una sola entidad y cada pieza de información se almacena exactamente en un lugar.

La normalización es el proceso de organizar eficientemente los datos en una base de datos. Esto se hace organizando las columnas (campos o atributos) y tablas de una base de datos relacional para minimizar la redundancia de datos.

Los objetivos del proceso de normalización son eliminar datos redundantes y garantizar que las dependencias de datos tengan sentido.

## Structured Query Language (SQL)

Una base de datos tiene su propio lenguaje de programación, SQL (Structured Query Language). SQL es un lenguaje no procesal que proporciona acceso a bases de datos. Todas las operaciones de la base de datos se realizan utilizando SQL. Java puede comunicarse con el sistema de gestión de bases de datos mediante SQL. Esto se hace utilizando la API JDBC, que permite que su aplicación especifique qué registros recuperar según varios criterios. Por ejemplo, puede seleccionar registros creados entre determinadas fechas o actualizar solo los registros que cumplan con determinados criterios. SQL también se puede utilizar para crear objetos de base de datos, como tablas de usuario y consultas guardadas, que se conocen como vistas. Una vista no contiene datos en sí misma, sino que es simplemente la consulta almacenada cuyo uso simplifica el acceso a los datos.

SQL (pronunciado como letras S-Q-L o secuela) es un lenguaje de base de datos especializado que consta de declaraciones muy parecidas al inglés. SQL tiene un propósito: comunicarse con una base de datos. Nos comunicamos con la base de datos para agregar, actualizar o eliminar datos. También nos comunicamos con la base de datos para crear y modificar tablas y otros objetos de la base de datos.

Casi todos los DBMS importantes admiten SQL. Aprender SQL le permitirá interactuar con casi todas las bases de datos que pueda encontrar. SQL es fácil de aprender. Las declaraciones constan de palabras descriptivas en inglés. SQL es poderoso. El uso inteligente de los elementos del lenguaje le permite realizar operaciones complejas en la base de datos. SQL es un estándar regido por ANSI (American National Standards Institute). Además de la implementación estándar de SQL, la mayoría de los proveedores implementan sus propias extensiones propietarias. La versión de SQL que utiliza para Oracle puede diferir de la versión que utiliza para acceder a otras bases de datos.

## Trabajar con la base de datos Oracle

Así como usa un IDE (entorno de desarrollo integrado) para trabajar con programas Java, también puede usar un IDE para trabajar con bases de datos Oracle. Este IDE se llama SQL Developer. La máquina virtual ya tiene instalada una copia de SQL Developer.

### Cómo abrir y utilizar SQL Developer

Para abrir SQL Developer en la máquina virtual, simplemente haga clic en su icono en el escritorio.

<hr>

**Tip**

Oracle proporciona instrucciones paso a paso para usar SQL Developer en su sitio web technetwork. Si utiliza la máquina virtual, todo estará instalado por usted. Vaya a http://www.oracle.com/webfolder/technetwork/tutorials/obe/db/sqldev/r40/sqldev4.0_GS/sqldev4.0_GS.html.

<hr>
