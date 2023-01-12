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

**Figura 2.1** Creando un nuevo proyecto **Maven**. Después de ir a ***Archivo > Nuevo > Proyecto***, llega a esta ventana, donde debe seleccionar el tipo de proyecto en el panel izquierdo. En nuestro caso, elegimos **Maven**. En la parte superior de la ventana, seleccione el JDK que desea usar para compilar y ejecutar el proyecto.

Una vez que hayas seleccionado el tipo de tu proyecto, en la siguiente ventana (figura 2.2) necesitas darle un nombre. Además del nombre del proyecto y de elegir la ubicación en la que almacenarlo, para un proyecto **Maven** también puede especificar lo siguiente:

* Un ID de grupo, que usamos para agrupar varios proyectos relacionados
* Un ID de artefacto, que es el nombre de la aplicación actual
* Una versión, que es un identificador del estado de implementación actual

![image](https://user-images.githubusercontent.com/23094588/212097704-7717bcf9-dcda-4bb0-9bff-a35f7b9614cc.png)

**Figura 2.2** Antes de terminar de crear su proyecto, debe darle un nombre y especificar dónde desea que su IDE almacene el proyecto. Opcionalmente, puede darle a su proyecto una ID de grupo, una ID de artefacto y una versión. Luego presiona el ***botón Finalizar*** en la esquina inferior derecha para completar la creación del proyecto.

En una aplicación del mundo real, estos tres atributos son detalles esenciales y es importante proporcionarlos. Pero en nuestro caso, debido a que solo trabajamos con ejemplos teóricos, puede omitirlos y dejar que su IDE complete algunos valores predeterminados para estas características.

Una vez que haya creado el proyecto, encontrará que su estructura se parece a la que se presenta en la figura 2.3. Nuevamente, la estructura del proyecto **Maven** no depende del IDE que elija para desarrollar sus proyectos. Cuando miras tu proyecto por primera vez, observas dos cosas principales:

* La carpeta **“`src`”** (también conocida como la carpeta fuente), donde colocarás todo lo que pertenece a la aplicación.
* El archivo **`pom.xml`**, donde escribe las configuraciones de su proyecto **Maven**, como agregar nuevas dependencias.

![image](https://user-images.githubusercontent.com/23094588/212102290-c542e11c-5797-4244-9691-6e721f046be8.png)

**Figura 2.3** Cómo se organiza un proyecto **Maven**. Dentro de la carpeta **`src`**, agregamos todo lo que pertenece a la aplicación: el código fuente de la aplicación va en la carpeta **`main`** y el código fuente de las pruebas unitarias va en la carpeta **`test`**. En el archivo **`pom.xml`** escribimos configuraciones para el proyecto **Maven**(en nuestros ejemplos lo usaremos principalmente para definir las dependencias).

Maven organiza la carpeta **“`src`”** en las siguientes carpetas:

* La carpeta **`main`**, donde almacena el código fuente de la aplicación. Esta carpeta contiene el código **Java** y las configuraciones por separado en dos subcarpetas diferentes denominadas **`java`** y **`resources`**.

La carpeta **`test`**, donde almacena el código fuente de las pruebas unitarias (discutimos más sobre las pruebas unitarias y cómo definirlas en el capítulo 15).

La Figura 2.4 le muestra cómo agregar un nuevo código fuente a la carpeta **`main/java`** del proyecto **Maven**. Las nuevas clases de la aplicación van a esta carpeta.

![image](https://user-images.githubusercontent.com/23094588/212103679-27c15eba-c036-4d3b-8042-f380306f4283.png)

**Figura 2.4** Dentro de la carpeta **`java`**, crea los paquetes y clases de **Java** habituales de su aplicación. Estas son las clases que definen toda la lógica de su aplicación y hacen uso de las dependencias que proporciona.

En los proyectos que creamos en este libro, usamos muchas dependencias externas: libraries(bibliotecas) o framworks que usamos para implementar la funcionalidad de los ejemplos. Para agregar estas dependencias a sus proyectos de **Maven**, debemos cambiar el contenido del archivo **`pom.xml`**. En la siguiente lista, encontrará el contenido predeterminado del archivo **`pom.xml`** inmediatamente después de crear el proyecto Maven.

**Listado 2.1** El contenido predeterminado del archivo **`pom.xml`**

```xml
<?versión xml="1.0" codificación="UTF-8"?> 
<proyecto xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3 .org/2001/XMLSchema-instance" 
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0     
         http://maven.apache.org/xsd/maven-4.0.0.xsd"> 
    
  <modelVersion>4.0.0</modelVersion> 
 
  <groupId>org.example</groupId> 
  <artifactId>sq-ch2-ex1</artifactId> 
  <version>1.0-SNAPSHOT</version>
 
</proyecto>
```

Con este archivo **`pom.xml`**, el proyecto no utiliza ninguna dependencia externa. Si buscas en la carpeta de dependencias externas del proyecto, solo deberías ver el JDK (figura 2.5).

![image](https://user-images.githubusercontent.com/23094588/212104951-de803dae-8f99-4528-a38e-3c8e080a03ab.png)

**Figura 2.5** Con un archivo **`pom.xml`** predeterminado, su proyecto solo usa el JDK como una dependencia externa. Una de las razones por las que cambia el archivo **`pom.xml`**(y el que usaremos en este libro) es para agregar nuevas dependencias que necesita su aplicación.

La siguiente lista le muestra cómo agregar dependencias externas a su proyecto. Escribes todas las dependencias entre las etiquetas **`<dependencies> </dependencies>`**. Cada dependencia está representada por un grupo de etiquetas **`<dependency> </dependency>`** donde se escriben los atributos de la dependencia: el ID de grupo de la dependencia, el nombre del artefacto y la versión. Maven buscará la dependencia por los valores que proporcionó para estos tres atributos y descargará las dependencias de un repositorio. No entraré en detalles sobre cómo configurar un repositorio personalizado. Solo debe tener en cuenta que **Maven** descargará las dependencias (generalmente archivos **`jar`**) de forma predeterminada desde un repositorio llamado **Maven central**. Puede encontrar los archivos **`jar`** descargados en la carpeta de dependencias externas de su proyecto, como se muestra en la figura 2.6.

**Listado 2.2** Agregando una nueva dependencia en el archivo **`pom.xml`**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0    
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    
  <modelVersion>4.0.0</modelVersion>
 
  <groupId>org.example</groupId>
  <artifactId>sq_ch2_ex1</artifactId>
  <version>1.0-SNAPSHOT</version>
 
  <dependencies>                                 ❶
    <dependency>                                 ❷
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <version>5.2.6.RELEASE</version>
    </dependency>
  </dependencies>
 
</project>
```

❶ Debe escribir las dependencias del proyecto entre las etiquetas **`<dependencies>`** y **`</dependecies>`**.

❷ Una dependencia está representada por un grupo de etiquetas **`<dependency> </dependency>`**.

Una vez que haya agregado la dependencia en el archivo **`pom.xml`**, como se presenta en la lista anterior, el IDE las descarga y ahora encontrará estas dependencias en la carpeta "External Libraries" (figura 2.6).

![image](https://user-images.githubusercontent.com/23094588/212109065-ee27cb61-459a-4ab0-b878-d49714b67fb7.png)

