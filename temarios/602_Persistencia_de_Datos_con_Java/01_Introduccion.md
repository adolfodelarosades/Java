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

![image](https://user-images.githubusercontent.com/23094588/127199841-afba5087-2867-4ce3-88c5-20894dc5abbe.png)

bien tengo aquí una clase administrador es una clase aullaba.

Y como ves tiene algunas propiedades Leidi un nombre un cargo y una fecha de creación de tipo ta ta

ta tiene sus juguetes y sus Cetes.

Esto es modelar el objeto administrador pendiente en la clase.

Cuando en un método principal crea una nueva instancia de administrador debido a que estamos ejecutando

el programa en una máquina virtual de Java en in-memory que es una memoria volátil de Java se crea la

instancia del administrador con los datos 1 con lo preferente 5 de mayo 2015 y es el mediodía

pero yo necesito un método de almacenamiento porque en caso de que se pierda el estado del memorice

reinicie la máquina el equipo etc yo voy a perder el estado de este administrador que yo deseo conservar

entonces existen medios donde yo puedo hacer persistir el estado de este administrador y hacerlo dependiente

de la máquina virtual de Java para poder almacenarlo y leerlo en cualquier momento.

Estos pueden ser bases de datos pueden ser hojas de texto hojas de cálculo etc entonces cómo podríamos

definir persistencia de un objeto simplemente como la capacidad de salvar el estado de un objeto en

este caso un administrador en algún medio.

Una base de datos o una hoja de texto o un simple archivo de texto una hoja de cálculo y restaurarlo

en algún momento posteriormente nosotros trabajaremos con bases de datos esquivé en nuestra próxima

elección abordaremos sistema de bases de datos relacionales y como dijo.

Estas clases no me gustan porque son teóricas pero voy a tratar de hacerlas muy cortitas para que sean

lo menos tedioso posible hasta la próxima.



## Bases de Datos Relacionales I 02:37
## Bases de Datos Relacionales II 02:35
## Bases de Datos Relacionales III 03:44
## Frameworks de Persistencia de Datos 03:26
