# Introducción a JDBC

**Resumen**: en este tutorial, le daremos una breve descripción general de JDBC para que pueda usarlo para interactuar con bases de datos MySQL.

La **API de JDBC** proporciona una interfaz estándar para interactuar con cualquier sistema de administración de bases de datos relacionales (**RDBMS**). La **API de JDBC** consta de los siguientes componentes principales:

1. Controlador JDBC
2. Conexión
3. Declaración
4. Conjunto resultante

Echemos un vistazo a cada componente con más detalle.

## JDBC Driver

Un **JDBC Driver** es un conjunto de clases Java que implementan **interfaces JDBC** para interactuar con una base de datos específica. Casi todos los proveedores de bases de datos, como **MySQL**, **Oracle**, **Microsoft SQL Server**, proporcionan **drivers JDBC**. Por ejemplo, **MySQL** proporciona un **driver JDBC** llamado **MySQL Connection/J** que le permite trabajar con la base de datos **MySQL** a través de una **API JDBC** estándar.

Hay tres tipos de **drivers JDBC**, incluido el **JDBC-native API Driver**, **JDBC-net Driver** y **JDBC Driver**.

Discutiremos sobre el **JDBC Driver**, para obtener información más detallada sobre el otro tipo de driver, puede consultarlo en [JDBC Driver](https://en.wikipedia.org/wiki/JDBC_driver).

El **JDBC Driver** está escrito en Java puro. Traduce llamadas **JDBC** en llamadas específicas de **MySQL** y envía las llamadas directamente a una base de datos específica. Para usar un **JDBC Driver**, debe incluir el archivo **JAR** del driver en su aplicación. **MySQL Connector/J** es el **JDBC Driver**.

## Connection(Conexión)

El primer y más importante componente de **JDBC** es el **objeto `Connection`**. En una aplicación **Java**, primero carga un **JDBC Driver** y luego establece una conexión con la base de datos. A través del **objeto `Connection`**, puede interactuar con la base de datos, por ejemplo, creando una declaración para ejecutar consultas SQL en tablas. Puede abrir más de una conexión a una base de datos a la vez, etc..

## Statement(Declaración)

Para ejecutar una consulta SQL, por ejemplo, **`SELECT`**, **`INSERT`**, **`UPDATE`**, **`DELETE`**, etc., utiliza un **objeto `Statement`**. El objeto **`Statement`** se crea a través del **objeto `Connection`**. **JDBC** proporciona varios tipos de declaraciones para diferentes propósitos, como **`PreparedStatement`**, **`CallableStatement`**. Cubriremos los detalles de cada objeto en los próximos tutoriales.

## ResultSet(Conjunto resultante)

Después de consultar los datos de la base de datos, obtienes un **objeto `ResultSet`**. El **objeto `ResultSet`** proporciona un API que le permite recorrer el resultado de la consulta.

El flujo típico de usar JDBC es el siguiente:

1. Primero, cargue el **JDBC driver** y cree una conexión a la base de datos.
2. Luego, cree **`Statement`** y ejecute la consulta para obtener un **`ResultSet`**.
3. A continuación, recorra y procese el **`ResultSet`**.
4. Cierre el **`ResultSet`**, el **`Statement`** y la **`Connection`**.

Flujo de proceso MySQL JDBC

<img width="906" alt="image" src="https://user-images.githubusercontent.com/23094588/220721327-6e19395f-264d-4481-8e88-ff1d9484d70d.png">

En este tutorial, le presentamos información básica sobre **JDBC** y sus componentes principales: **JDBC Driver**, **Connection**, **Statement**, y **ResultSet**.
