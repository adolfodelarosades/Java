# Introducción a JDBC

Resumen : en este tutorial, le daremos una breve descripción general de JDBC para que pueda usarlo para interactuar con bases de datos MySQL.

La API de JDBC proporciona una interfaz estándar para interactuar con cualquier sistema de administración de bases de datos relacionales (RDBMS). La API de JDBC consta de los siguientes componentes principales:

Controlador JDBC
Conexión
Declaración
Conjunto resultante
Echemos un vistazo a cada componente con más detalle.

Controlador JDBC
Un controlador JDBC es un conjunto de clases Java que implementan interfaces JDBC para interactuar con una base de datos específica. Casi todos los proveedores de bases de datos, como MySQL, Oracle, Microsoft SQL Server, proporcionan controladores JDBC. Por ejemplo, MySQL proporciona un controlador JDBC llamado MySQL Connection/J que le permite trabajar con la base de datos MySQL a través de una API JDBC estándar.

Hay tres tipos de controladores JDBC, incluido el controlador API nativo de JDBC, el controlador JDBC-net y el controlador JDBC.

Discutiremos sobre el controlador JDBC, para obtener información más detallada sobre el otro tipo de controlador, puede consultarlo en el controlador JDBC .

El controlador JDBC está escrito en Java puro. Traduce llamadas JDBC en llamadas específicas de MySQL y envía las llamadas directamente a una base de datos específica. Para usar un controlador JDBC, debe incluir el archivo JAR del controlador con su aplicación. MySQL Connector/J es el controlador JDBC.

Conexión
El primer y más importante componente de JDBC es el objeto Connection. En una aplicación Java, primero carga un controlador JDBC y luego establece una conexión con la base de datos . A través del objeto Conexión, puede interactuar con la base de datos, por ejemplo, creando una Declaración para ejecutar consultas SQL en tablas. Puede abrir más de una conexión a una base de datos a la vez.

Declaración
Para ejecutar una consulta SQL, por ejemplo, SELECCIONAR , INSERTAR , ACTUALIZAR , ELIMINAR , etc., utiliza un Statementobjeto. El objeto Statement se crea a través del Connectionobjeto. JDBC proporciona varios tipos de declaraciones para diferentes propósitos, como PreparedStatement, CallableStatement . Cubriremos los detalles de cada objeto en los próximos tutoriales.

Conjunto resultante
Después de consultar los datos de la base de datos , obtienes un ResultSetobjeto. El ResultSetobjeto proporciona un conjunto de API que le permite atravesar el resultado de la consulta.

El flujo típico de usar JDBC es el siguiente:

Primero, cargue el controlador JDBC y cree una conexión a la base de datos.
Luego, cree Statementy ejecute la consulta para obtener un ResultSet .
A continuación, recorra y procese el archivo ResultSet.
Cierre ResultSet, Statementy Connection.
Flujo de proceso MySQL JDBC
En este tutorial, le presentamos información básica sobre JDBC y sus componentes principales: controlador JDBC, conexión, declaración y conjunto de resultados.
