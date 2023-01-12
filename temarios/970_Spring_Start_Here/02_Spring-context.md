# 2 El Spring context: definición de beans

* 2 The Spring context: Defining beans
   * 2.1 Creating a Maven project
   * 2.2 Adding new beans to the Spring context
      * Using the @Bean annotation to add beans into the Spring context
      * Using stereotype annotations to add beans to the Spring context
      * Programmatically adding beans to the Spring context


Este capítulo cubre

* Comprender la necesidad del **Spring context(contexto Spring)**
* Agregar nuevas instancias de objetos al **Spring context**
 
En este capítulo, comenzará a aprender cómo trabajar con un elemento crucial del framework Spring: el **contexto**(también conocido como el contexto de la aplicación en una aplicación Spring). ***Imagine el contexto como un lugar en la memoria de su aplicación en el que agregamos todas las instancias de objetos que queremos que administre el framework. De forma predeterminada, Spring no conoce ninguno de los objetos que define en su aplicación. Para permitir que Spring vea sus objetos, debe agregarlos al contexto***. Más adelante en este libro, analizaremos el uso de diferentes capacidades proporcionadas por Spring en las aplicaciones. Aprenderá que la integración de tales características se realiza a través del contexto agregando instancias de objetos y estableciendo relaciones entre ellos. ***Spring usa las instancias en el contexto para conectar su aplicación a varias funcionalidades que proporciona***. Aprenderá los conceptos básicos de las funciones más importantes (p. ej. transactions, testing, etc.)

Aprender qué es el **contexto de Spring** y cómo funciona es el primer paso para aprender a usar Spring, porque sin saber cómo administrar el **contexto de Spring**, casi nada de lo que aprenderá a hacer con él será posible. El contexto es un mecanismo complejo que le permite a Spring controlar las instancias que defina. De esta manera, le permite utilizar las capacidades que ofrece el framework.

Comenzamos en este capítulo aprendiendo cómo agregar instancias de objetos al contexto de Spring. En el capítulo 3, aprenderá cómo referirse a las instancias que agregó y establecer relaciones entre ellas.

***Llamaremos a estas instancias de objetos*** **"beans"**. Por supuesto, para las sintaxis que necesita aprender, escribiremos fragmentos de código, y puede encontrar todos estos fragmentos en los proyectos proporcionados con el libro (puede descargar los proyectos de la sección "Recursos del libro"). Mejoraré los ejemplos de código con imágenes y explicaciones detalladas de los enfoques.

Como quiero que su introducción a Spring sea progresiva y tomar todo paso a paso, en este capítulo nos enfocamos en las sintaxis que necesita saber para trabajar con el **contexto de Spring**. Descubrirá más adelante que no todos los objetos de una aplicación deben ser administrados por Spring, por lo que no necesita agregar todas las instancias de objetos de su aplicación al **contexto de Spring**. Por el momento, lo invito a concentrarse en aprender los enfoques para agregar una instancia para que Spring la administre.

### 2.1 Creando un proyecto Maven

En esta sección, discutiremos la creación de un proyecto **Maven**. **Maven** no es un tema directamente relacionado con **Spring**, pero es una herramienta que usa para administrar fácilmente el proceso de compilación de una aplicación, independientemente del framework que use. Debe conocer los conceptos básicos del proyecto **Maven** para seguir los ejemplos de codificación. **Maven** es también una de las herramientas de construcción más utilizadas para proyectos de **Spring** en escenarios del mundo real (con **Gradle**, otra herramienta de construcción, ocupando el segundo lugar, pero no la discutiremos en este libro). Debido a que **Maven** es una herramienta tan conocida, es posible que ya sepa cómo crear un proyecto y agregarle dependencias usando su configuración. En este caso, puede saltarse esta sección e ir directamente a la sección 2.2.

Una herramienta de compilación es un software que usamos para crear aplicaciones más fácilmente. Configura una herramienta de compilación para realizar las tareas que forman parte de la compilación de la aplicación en lugar de realizarlas manualmente. Algunos ejemplos de tareas que a menudo forman parte de la creación de la aplicación son los siguientes:

* Descargar las dependencias que necesita tu aplicación
* Ejecutando pruebas
* Validar que la sintaxis sigue las reglas que defina
* Comprobación de vulnerabilidades de seguridad
* Compilando la aplicación
* Empaquetar la aplicación en un archivo ejecutable

Para que nuestros ejemplos puedan administrar fácilmente las dependencias, necesitamos usar una herramienta de compilación para los proyectos que desarrollamos. Esta sección enseña solo lo que necesita saber para desarrollar los ejemplos de este libro; iremos paso a paso a través del proceso de creación de un proyecto **Maven**, y te enseñaré lo esencial con respecto a su estructura. Si desea obtener más detalles sobre el uso de **Maven**, le recomiendo ***Introducing Maven: A Build Tool for Today’s Java Developers by Balaji Varanasi (APress, 2019)***.

Empecemos por el principio. Primero, como con el desarrollo de cualquier otra aplicación, necesita un entorno de desarrollo integrado (IDE). Cualquier IDE profesional hoy en día ofrece soporte para proyectos Maven, por lo que puede elegir el que desee: **IntelliJ IDEA**, **Eclipse**, **Spring STS**, **Netbeans**, etc. Para este libro, uso **IntelliJ IDEA**, que es el IDE que uso con más frecuencia. No se preocupe, la estructura del proyecto **Maven** es la misma independientemente del IDE que elija.

Comencemos creando un nuevo proyecto. Crea un nuevo proyecto en IntelliJ desde ***File > New > Project *** - ***Archivo > Nuevo > Proyecto***. Esto lo llevará a una ventana como la de la figura 2.1.

![image](https://user-images.githubusercontent.com/23094588/212072881-c918af0b-6bf2-4638-b838-d715674c6f7b.png)



