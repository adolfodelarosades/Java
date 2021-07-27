# 1. Introducción 29:13

* Presentación 06:13
* Instalación de Herramientas de Desarrollo 08:13
* Persistencia de un Objeto 02:25
* Bases de Datos Relacionales I 02:37
* Bases de Datos Relacionales II 02:35
* Bases de Datos Relacionales III 03:44
* Frameworks de Persistencia de Datos 03:26

## Presentación 06:13

![image](https://user-images.githubusercontent.com/23094588/127149024-a6b5cd4c-fb24-449d-b0a1-dc730ed7b0ab.png)

Hola bienvenido a este curso de persistencia de datos con Java.

Este curso está enfocado en que aprendas dos tecnologías **Hibernate** y **Spring Data API** esto con el propósito que tengas un conocimiento comprensivo un conocimiento conciso que hayas realizado y ejemplos que funcionen realmente y puedas incluirlo en cualquier tecnología Java de desarrollo web que tú ya conozcas anteriormente y puedes evitar así hacer esa tediosa tarea de tirar código MySQL, Oracle, o SQL Server que cómo consume tiempo como desarrollador y puedas aprovechar al máximo estos dos frameworks de persistencia que son maravillosos.

Vamos a abordar el contenido del curso, primero vamos a tratar Hibernate el framework que se ha tornado tan popular en los últimos años inclusive es ya requisito conocer Hibernate para cualquier empleo como desarrollador Java.

![image](https://user-images.githubusercontent.com/23094588/127149909-36829712-2de3-41c6-9781-9253415a2d0c.png)

Primero te voy a enseñar cómo configurar Hibernate 5 en el IDE Eclipse.

![image](https://user-images.githubusercontent.com/23094588/127150176-60e7ccb0-c4b2-49e3-85fd-75c96e0cc582.png)

Posteriormente vamos a hacer operaciones CRUD.

![image](https://user-images.githubusercontent.com/23094588/127150375-7a56fd61-38e6-496f-9eb4-4183eed06e73.png)

Posteriormente te voy a enseñar cómo hacer consultas anidadas consultas un poco complejas sin ningún código SQL.

![image](https://user-images.githubusercontent.com/23094588/127150551-684f9b01-9609-4d8f-af49-5c029f868d4d.png)

Ese es el propósito del curso ahorrar tiempo y aprovechar al máximo estos dos frameworks de persistencia.

Una vez que hayamos hecho estas consultas anidadas te voy a mostrar cómo manejar relaciones qué es lo más solicitado. 

![image](https://user-images.githubusercontent.com/23094588/127151003-b5ec1d13-6589-4dd6-bcc8-8cbd5667af97.png)

Te voy a enseñar cómo manejar tablas que se relacionan **Uno a Uno**, **Uno a Muchos** y **Muchos a Muchos** también cómo hacer inserciones, cómo hacer actualizaciones, cómo hacer consultas, reuniones naturales, etcétera.

Una vez que estés empapado, impregnado de Hibernate te voy a mostrar otra tecnología que todavía no es tan popular pero que es muy buena, yo la uso se llama **Spring Data API**.

![image](https://user-images.githubusercontent.com/23094588/127151468-fd5fba49-a414-4dd1-9900-6b7e4fc74b4a.png)

Es un proyecto de **Spring Framework** y nos va a ahorrar incluso más código que Hibernate inclusive las podemos combinar para hacer una capa de persistencia de datos increíble en cualquier proyecto empresarial.

Primero vamos a ver cómo configurar Spring Data API, te voy a enseñar una forma muy sencilla de descargar dependencias, de descargar paquetes y demás cosas que necesitamos de Internet sin entrar a un navegador y copiar y pegar descargar añadir importar nada de eso lo vamos a hacer una forma de sencillita muy fácil y sobre todo práctico.

![image](https://user-images.githubusercontent.com/23094588/127151839-b86bcb6d-2181-40e7-84d9-5c4e039edd0a.png)

Una vez que te enseña a configurar Spring Data te voy a enseñar que es un **CRUD Repository**, que es una interfaz que implementa automáticamente la funcionalidad CRUD.

![image](https://user-images.githubusercontent.com/23094588/127152128-873e142f-6952-4715-95e6-6800e61ca8d0.png)

Esto es para ahorrarnos muchísimo código cuando lo veas no lo vas a creer, así te lo garantizo, una vez que abordemos cómo hacer operaciones de una forma más minimizada, una forma sin tanto código, inclusive ahorrando mucho más código que Hibernate, te voy a enseñar cómo hacer consultas optimizadas. 


Aquí voy a incluir otra tecnología que se llama Query DSL y con ésta vamos a hacer también reuniones naturales, cómo hacer una consulta de una tabla que se relaciona Uno a Uno, Uno a Muchos y Muchos a Muchos.

![image](https://user-images.githubusercontent.com/23094588/127152821-4ac6ad9a-571c-4397-92be-134309afc3af.png)


Y finalmente te voy a enseñar algo súper útil que es indispensable que sepas, que amigos programadores lo hacen de una forma arcaica, funcional pero es arcaica y con esta tecnología lo haces rapidísimo hablamos de la ***paginación***.

![image](https://user-images.githubusercontent.com/23094588/127198858-e0605e4d-f88e-4f6f-af37-41f67f50d4db.png)

Por ejemplo en Google si hay 50,000 busquedas las devuelve en páginas de 20 resultados por ejemplo, te voy a enseñar a hacer eso con Spring Data de una forma sencillísima.

## Instalación de Herramientas de Desarrollo 08:13

![image](https://user-images.githubusercontent.com/23094588/127199192-9544aa45-d4a6-4790-be6c-3661a06d0f2c.png)

## Persistencia de un Objeto 02:25


¿Qué es persistencia de un objeto?.

![image](https://user-images.githubusercontent.com/23094588/127200061-27f18875-0f95-4550-979b-4b33af074d8d.png)

Tengo aquí una clase administrador es una clase Java, tiene algunas propiedades un **`idAd`**, un **`nombre`** un **`cargo`** y una **`fechaCreacion`** con sus respectivos tipos y con sis Getters y setters.

Esto es modelar el objeto **`Administrador`** mediante una clase Java.

![image](https://user-images.githubusercontent.com/23094588/127200513-5734a1e2-2811-418d-9ae6-87004d9f7643.png)

Cuando en un método principal creo una nueva instancia del objeto **`Administrador`**, debido a que estamos ejecutando el programa en una máquina virtual de Java en Heap memory que es una memoria volátil de Java.

![image](https://user-images.githubusercontent.com/23094588/127200735-3813eab1-8f30-4f60-9b85-ea769d130021.png)

se crea la instancia del **`Administrador`** con los datos **`1`**, **`Juan López`**, **`Gerente`** y **`2015-05-05 12:00:00`**, 
pero yo necesito un método de almacenamiento porque en caso de que se pierda el estado de la memoría, se reinicie la máquina, el equipo se apague, etc. voy a perder el estado de este **`Administrador`** que yo deseo conservar, entonces existen medios donde yo puedo hacer persistir el estado de este **`Administrador`**

![image](https://user-images.githubusercontent.com/23094588/127201212-fa83d1d3-bb63-4ee2-80fe-4c9c37a08a39.png)

para poder almacenarlo y leerlo en cualquier momento, estos pueden ser bases de datos, pueden ser hojas de texto, hojas de cálculo, etc. 

¿Cómo podríamos definir persistencia de un objeto? simplemente como la ***capacidad de salvar el estado de un objeto en este caso un `Administrador` en algún medio***. Una base de datos o una hoja de texto o un simple archivo de texto, una hoja de cálculo y restaurarlo en algún momento. 

Posteriormente nosotros trabajaremos con bases de datos MySQL.

## Bases de Datos Relacionales I 02:37

![image](https://user-images.githubusercontent.com/23094588/127201815-4b6465c6-73f3-4ecc-88d6-ff7318171785.png)

En esta lección hblaré acerca de ***Bases de Datos Relacionales***. Es una base de datos simplemente que representa esa información en forma de tablas con filas y columnas.

Aquí tengo nuevamente mi clase **`Administrador`** y yo lo que deseo hacer es presentar la información de este administrador en forma de una tabla con filas y columnas. ¿Qué necesito para hacer esto?. Lo primero que necesito es un **RDBMS** por sus siglas en inglés ***Relation Database Management System***. ¿Qué es esto?. Es simplemente un software diseñado para administrar bases de datos relacionales dentro de este software.

![image](https://user-images.githubusercontent.com/23094588/127202323-bb763fc0-073c-4727-a547-b72d6b7d68b1.png)

¿Qué necesito para hacer esto?. Yo puedo administrar esta base de datos de prueba que tiene tablas y que su información está representada en forma de filas y columnas obtengo esta otra que es mi base de datos donde hay tablas y tienen relaciones entre ellas cuando hablo de administrar me refiero a crear, eliminar, actualizar y realizar más operaciones con los datos de estas bases o colecciones de datos 

¿Qué ejemplos tenemos de RDBMS?

![image](https://user-images.githubusercontent.com/23094588/127202592-45eb1873-cd02-4fc9-8e0b-aba41142b118.png)


Regresando a la clase **`Administrador`** está en lenguaje Java y yo debo transportar esto a otro lenguaje, un lenguaje especializado que se usa dentro de los RDBMS de los sistemas gestores de bases de datos relacionales y este lenguaje es el lenguaje **SQL** por sus siglas en inglés ***Structured Query Language***.

![image](https://user-images.githubusercontent.com/23094588/127203007-be13b55d-b89c-4964-bef9-ac4deebc62e7.png)


Y qué significa o qué es, a qué hace referencia este lenguaje SQL, es un lenguaje usado para manipular datos dentro de un RDBMS. Lo que deseo hacer es trasladar esta información que está en lenguaje Java al lenguaje SQL.

## Bases de Datos Relacionales II 02:35


Cuál será el script SQL para crear la tabla con filas que me va a almacenar los datos del administrador.

![image](https://user-images.githubusercontent.com/23094588/127203634-bd94caac-1b28-49ed-85d9-063b87045c6d.png)


Bien tenemos el script SQL, me dice crea la tabla **`ADMINISTRADOR`** y como ven aquí tenemos también tipos de datos así como hay Java aunque no son equivalentes. Más bien son equivalentes pero no son literalmente los mismos. Por ejemplo tenemos el tipo **`int`** en Java y aquí va a ser un **`INTEGER`** y al decirle que es **`AUTOINCREMENT`** quiere decir que cuando yo inserte un dato automáticamente el **`ID`** se va a incrementar por ejemplo de 100 a 101 y va a estar listo para obtener el próximo dato. 

Tengo **`VARCHAR`** que sería el equivalente a **`String`** y el 100 es el número de caracteres.

En vez de **`Timestamp`** estoy usando un **`DATETIME`**  para la fecha y tengo que decirle que la ***llave primaria PRIMARY KEY*** es el **`ID`**.

Qué pasa cuando se ejecuta el script SQL este escrito. Se crea la tabla siguiente.

![image](https://user-images.githubusercontent.com/23094588/127204911-5c0bce0e-ae6e-4c8b-acba-10545bbf5e8b.png)


Esta es una tabla donde yo puedo tener un número de administradores que va a tener un ID, un nombre, un cargo y una fecha de creación dependiendo del tipo de RDBMS algunos datos estarán disponibles por ejemplo en MySQL tenemos 20 mientras que en SQL-Lite, esto es usado en programación móvil Android ya no está disponible.

![image](https://user-images.githubusercontent.com/23094588/127205090-0a047a6f-3cd2-4a2f-bcbb-73deb33e0ed6.png)

Deberá ser tu responsabilidad de investigar un poco acerca de que RDBMS estás usando para ver qué datos están disponibles y poder así hacer el script para generar una base de datos.

## Bases de Datos Relacionales III 03:44
## Frameworks de Persistencia de Datos 03:26
