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

Una vez que haya agregado la dependencia en el archivo **`pom.xml`**, como se presenta en la lista anterior, el IDE las descarga y ahora encontrará estas dependencias en la carpeta "**`External Libraries`**" (figura 2.6).

![image](https://user-images.githubusercontent.com/23094588/212109065-ee27cb61-459a-4ab0-b878-d49714b67fb7.png)

**Figura 2.6** Cuando agrega una nueva dependencia al archivo **`pom.xml`**, **Maven** descarga los archivos **`jar`** que representan esa dependencia. Puede encontrar estos archivos **`jar`** en la carpeta **`External Libraries`** del proyecto.

Ahora podemos pasar a la siguiente sección, donde discutimos los conceptos básicos del **contexto Spring**. Creará proyectos de **Maven** y aprenderá a usar una dependencia de **Spring** llamada **`spring-context`** para administrar Spring context.

### 2.2 Agregar nuevos beans al Spring context

En esta sección, aprenderá cómo agregar nuevas instancias de objetos (es decir, **beans**) al **contexto de Spring**. Descubrirá que tiene varias formas de agregar **beans** en el **contexto de Spring**, de modo que Spring pueda administrarlos y conectar las funciones que proporciona en su aplicación. Dependiendo de la acción, elegirá una forma específica de agregar el **beans**; discutiremos cuándo seleccionar uno u otro. Puede agregar **beans** en el **contexto** de las siguientes maneras (que describiremos más adelante en este capítulo):

* Usando la anotación **`@Bean`**
* Uso de anotaciones de estereotipos
* Programáticamente

Primero vamos a crear un proyecto sin referencia a ningún framewok, ni siquiera a Spring. Luego agregaremos las dependencias necesarias para usar el **contexto Spring** y crearlo (figura 2.7). Este ejemplo servirá como requisito previo para agregar **beans** a los ejemplos de **contexto de Spring** en los que vamos a trabajar en las secciones 2.2.1 a 2.2.3.

![image](https://user-images.githubusercontent.com/23094588/212112386-82918827-4937-4c98-a6b2-c6a6e8a55886.png)

**Figura 2.7** Para comenzar, creamos una instancia de objeto y el **contexto Spring** vacío.

Creamos un proyecto **Maven** y definimos una clase. Como es gracioso imaginarlo, consideraré una clase llamada **`Parrot`** con solo un atributo **`String`** que represente el nombre del loro(listado 2.3). Recuerde, en este capítulo, solo nos enfocamos en agregar **beans** al **contexto de Spring**, por lo que está bien usar cualquier objeto que lo ayude a recordar mejor las sintaxis. Encontrará el código para este ejemplo en el proyecto **"sq-ch2-ex1"** (puede descargar los proyectos desde la sección "Recursos" del libro). Para su proyecto, puede usar el mismo nombre o elegir el que prefiera.

**Listado 2.3** La clase **`Parrot`**

```java
public class Parrot {
 
  private String name;
 
  // Omitted getters and setters
}
```

Ahora puede definir una clase que contenga el método **`main`** y crear una instancia de la clase **`Parrot`**, como se presenta en la siguiente lista. Normalmente llamo a esta clase **`Main`** .

**Listado 2.4** Creando una instancia de la clase **`Parrot`**

```java
public class Main {
 
  public static void main(String[] args) {
    Parrot p = new Parrot();
  }
}
```

Ahora es el momento de agregar las dependencias necesarias a nuestro proyecto. Debido a que estamos usando **Maven**, agregaré las dependencias en el archivo **`pom.xml`**, como se presenta en la siguiente lista.

**Listado 2.5** Agregando la dependencia para el **contexto de Spring**

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0     
  http://maven.apache.org/xsd/maven-4.0.0.xsd">
 
  <modelVersion>4.0.0</modelVersion>
 
  <groupId>org.example</groupId>
  <artifactId>sq-ch2-ex1</artifactId>
  <version>1.0-SNAPSHOT</version>
 
  <dependencies>
     <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-context</artifactId>
        <version>5.2.6.RELEASE</version>
     </dependency>
  </dependencies>
    
</project>
```

Una cosa crítica a observar es que Spring está diseñado para ser modular. Por modular, me refiero a que no necesita agregar todo Spring a su aplicación cuando usa algo fuera del ecosistema Spring. Solo necesita agregar las partes que usa. Por esta razón, en el listado 2.5, verá que solo agregué la dependencia **`spring-context`**, que le indica a **Maven** que extraiga las dependencias necesarias para que podamos usar el **contexto Spring**. A lo largo del libro, agregaremos varias dependencias a nuestros proyectos de acuerdo con lo que implementemos, pero siempre agregaremos solo lo que necesitamos.

**NOTA** Quizás se pregunte cómo supe qué dependencia de **Maven** debería agregar. La verdad es que los he usado tantas veces que me los sé de memoria. Sin embargo, no es necesario memorizarlos. Siempre que trabaje con un nuevo proyecto de Spring, puede buscar las dependencias que necesita agregar directamente en la referencia de Spring ( https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core .html ). Generalmente, las dependencias de Spring son parte del ID de grupo(group ID) **`org.springframework`**.

Con la dependencia agregada a nuestro proyecto, podemos crear una instancia del **contexto Spring**. En la siguiente lista, puede ver cómo cambié el método **`main`** para crear la instancia de **contexto de Spring**.

**Listado 2.6** Creando la instancia del **contexto Spring**

```java
public class Main {
 
  public static void main(String[] args) {
    var context = 
       new AnnotationConfigApplicationContext();     ❶
 
    Parrot p = new Parrot();
  }
}
```

❶ Crea una instancia del **Spring context**

**NOTA** Usamos la clase **`AnnotationConfigApplicationContext`** para crear la instancia de **contexto Spring**. Spring ofrece múltiples implementaciones. Debido a que en la mayoría de los casos utilizará la clase **`AnnotationConfigApplicationContext`**(la implementación que utiliza el enfoque más utilizado hoy en día: **anotaciones**), nos centraremos en esta en este libro. Además, solo te digo lo que necesitas saber para la discusión actual. Si recién está comenzando con Spring, mi recomendación es evitar entrar en detalles con las implementaciones de contexto y las cadenas de herencia de estas clases. Lo más probable es que, si lo hace, se pierda con detalles sin importancia en lugar de concentrarse en las cosas esenciales.

Como se muestra en la figura 2.8, creó una instancia de **`Parrot`**, agregó las dependencias del **contexto Spring** a su proyecto y creó una instancia del **contexto Spring**. Su objetivo es agregar el objeto **`Parrot`** al **contexto**, que es el siguiente paso.

![image](https://user-images.githubusercontent.com/23094588/212127693-5516a6b1-4a97-4080-b8d2-560e8a183f00.png)

**Figura 2.8** Ha creado la instancia de **contexto de Spring** y una instancia de **`Parrot`**. Ahora, desea agregar la instancia de **`Parrot`** dentro del **contexto de Spring** para que Spring sea consciente de esta instancia.

Acabamos de terminar de crear el proyecto de requisitos previos (esqueleto), que usaremos en las siguientes secciones para comprender cómo agregar **beans** al **contexto de Spring**. En la sección 2.2.1, continuamos aprendiendo cómo agregar la instancia al **contexto Spring** usando la anotación **`@Bean`**. Además, en las secciones 2.2.2 y 2.2.3, también aprenderá las alternativas de agregar la instancia usando anotaciones de estereotipo y hacerlo mediante programación. Después de discutir los tres enfoques, los compararemos y aprenderá las mejores circunstancias para usar cada uno.

#### 2.2.1 Usando la anotación **`@Bean`** para agregar beans al contexto Spring

En esta sección, discutiremos cómo agregar una instancia de objeto al **contexto de Spring** usando la anotación **`@Bean`**. Esto le permite agregar las instancias de las clases definidas en su proyecto (como **`Parrot`** en nuestro caso), así como las clases que no creó usted mismo pero que usa en su aplicación. Creo que este enfoque es el más fácil de entender al empezar. Recuerde que la razón por la que aprende a agregar **beans** al **contexto de Spring** es que Spring solo puede administrar los objetos que forman parte de él. Primero, le daré un ejemplo directo de cómo agregar un **bean** al **contexto Spring** usando la anotación **`@Bean`**. Luego, le mostraré cómo agregar varios **beans** del mismo tipo o de otro tipo.

Los pasos que debe seguir para agregar un **bean** al **contexto Spring** usando la anotación **`@Bean`** son los siguientes (figura 2.9):

1. Defina una clase de configuración (anotada con **`@Configuration`**) para su proyecto, que, como veremos más adelante, usamos para configurar el **contexto de Spring**.
2. Agregue un método a la clase de configuración que devuelva la instancia del objeto que desea agregar al contexto y anote el método con la anotación **`@Bean`**.
3. Haga que Spring use la clase de configuración definida en el paso 1. Como aprenderá más adelante, usamos clases de configuración para escribir diferentes configuraciones para el framework.

![image](https://user-images.githubusercontent.com/23094588/212130229-9baa090e-9368-4189-aea5-aaf3e66f4422.png)

**Figura 2.9** Pasos para agregar el **bean** al **contexto** usando la anotación **`@Bean`**. Al agregar la instancia al contexto de Spring, hace que el framework sea consciente del objeto, lo que le permite administrar la instancia.

Sigamos estos pasos y apliquémoslos en el proyecto llamado **"sq-c2-ex2"**. Para mantener separados todos los pasos que discutimos, le recomiendo que cree nuevos proyectos para cada ejemplo.

**NOTA** Recuerda que puedes encontrar los proyectos del libro en la sección "Recursos".

**NOTA** Una clase de configuración es una clase especial en las aplicaciones de Spring que usamos para indicarle a Spring que realice acciones específicas. Por ejemplo, podemos decirle a Spring que cree **beans** o que habilite ciertas funcionalidades. Aprenderá diferentes cosas que puede definir en las clases de configuración a lo largo del resto del libro.

**PASO 1: DEFINICIÓN DE UNA CLASE DE CONFIGURACIÓN EN SU PROYECTO**

El primer paso es crear una clase de configuración en el proyecto. Una clase de configuración de Spring se caracteriza por el hecho de que está anotada con la anotación **`@Configuration`**. Usamos las clases de configuración para definir varias configuraciones relacionadas con Spring para el proyecto. A lo largo del libro, aprenderá diferentes cosas que puede configurar usando las clases de configuración. Por el momento nos enfocamos solo en agregar nuevas instancias al **contexto Spring**. La siguiente lista le muestra cómo definir la clase de configuración. Llamé a esta clase de configuraciónConfiguración del proyecto .

**Listado 2.7** Definiendo una clase de configuración para el proyecto

```java
@Configuration                    ❶
public class ProjectConfig {
}
```

❶ Usamos la anotación **`@Configuration`** para definir esta clase como una clase de configuración Spring.

**NOTA** Separo las clases en diferentes paquetes para que el código sea más fácil de entender. Por ejemplo, creo las clases de configuración en un paquete llamado **`config`** y la clase principal en un paquete llamado **`main`**. Organizar las clases en paquetes es una buena práctica; Le recomiendo que lo siga en sus implementaciones del mundo real también.

**PASO 2: CREE UN MÉTODO QUE DEVUELVA EL BEAN Y ANOTE EL MÉTODO CON `@BEAN`**

Una de las cosas que puede hacer con una clase de configuración es agregar **beans** al **contexto Spring**. Para hacer esto, necesitamos definir un método que devuelva la instancia del objeto que deseamos agregar al contexto y anotar ese método con la anotación **`@Bean`**, lo que le permite a Spring saber que necesita llamar a este método cuando inicializa su contexto y agrega el valor devuelto al contexto. La siguiente lista muestra los cambios en la clase de configuración para implementar el paso actual.

**NOTA** Para los proyectos de este libro, utilizo **Java 11**: la última versión de Java compatible a largo plazo. Cada vez más proyectos están adoptando esta versión. Generalmente, la única característica específica que uso en los fragmentos de código que no funciona con una versión anterior de Java es el nombre de tipo reservado **`var`**. Uso **`var`** aquí y allá para hacer el código más corto y más fácil de leer, pero si desea usar una versión anterior de Java (por ejemplo, Java 8), puede reemplazar **`var`** con el tipo inferido. De esta manera, hará que los proyectos funcionen también con Java 8.

**Listado 2.8** Definiendo el método **`@Bean`**

```java
@Configuration
public class ProjectConfig {
 
  @Bean                        ❶
  Parrot parrot() {
    var p = new Parrot();
    p.setName("Koko");         ❷
    return p;                  ❸
  }
}
```

❶ Al agregar la anotación **`@Bean`**, le indicamos a Spring que llame a este método cuando esté en la inicialización del **contexto** y agregue el valor devuelto al **contexto**.

❷ Establezca un nombre para el loro que usaremos más adelante cuando probemos la aplicación.

❸ Spring agrega a su **contexto** la instancia de **`Parrot`** devuelta por el método.

Observe que el nombre que usé para el método no contiene un verbo. Probablemente aprendió que ***una mejor práctica de Java es poner verbos en los nombres de los métodos porque los métodos generalmente representan acciones***. Pero para los métodos que usamos para agregar **beans** en el **contexto de Spring**, no seguimos esta convención. Dichos métodos representan las instancias de objetos que devuelven y que ahora serán parte del **contexto de Spring**. ***El nombre del método también se convierte en el nombre del bean***(como en el listado 2.8, ***el nombre del bean ahora es “parrot”***). Por convención, puede usar sustantivos, y la mayoría de las veces tienen el mismo nombre que la clase.

**PASO 3: HAGA QUE SPRING INICIALICE SU CONTEXTO USANDO LA CLASE DE CONFIGURACIÓN RECIÉN CREADA**

Hemos implementado una clase de configuración en la que le decimos a Spring la instancia del objeto que necesita convertirse en un **bean**. Ahora debemos asegurarnos de que Spring use esta clase de configuración al inicializar su contexto. La siguiente lista muestra cómo cambiar la creación de instancias del **contexto Spring** en la clase principal para usar la clase de configuración que implementamos en los dos primeros pasos.

**Listado 2.9** Inicializando el **contexto Spring** basado en la clase de configuración definida

```java
public class Main {
 
  public static void main(String[] args) {
    var context = 
      new AnnotationConfigApplicationContext(
            ProjectConfig.class);                ❶
  }
}
```

❶ Al crear la instancia de **contexto de Spring**, envíe la clase de configuración como un parámetro para indicarle a Spring que la use.

Para verificar que la instancia de **`Parrot`** sea parte del **contexto** ahora, puede referirse a la instancia e imprimir su nombre en la consola, como se presenta en la siguiente lista.

**Listado 2.10** Haciendo referencia a la instancia de **`Parrot`** desde el **contexto**

```java
public class Main {
 
  public static void main(String[] args) {
    var context = 
      new AnnotationConfigApplicationContext(
        ProjectConfig.class);
 
    Parrot p = context.getBean(Parrot.class);    ❶
 
    System.out.println(p.getName());
  }
}
```

❶ Obtiene una referencia de un **bean** de tipo **`Parrot`** del **contexto Spring**

Ahora verás el nombre que le diste al loro que agregaste en el contexto en la consola, en mi caso **`Koko`**.

**NOTA** En escenarios del mundo real, usamos pruebas unitarias y de integración para validar que nuestras implementaciones funcionan como se desea. Los proyectos en este libro implementan pruebas unitarias para validar el comportamiento discutido. Debido a que este es un libro de "inicio", es posible que aún no esté al tanto de las pruebas unitarias. Para evitar crear confusión y permitirle concentrarse en el tema discutido, no discutiremos las pruebas unitarias hasta el capítulo 15. Sin embargo, si ya sabe cómo escribir pruebas unitarias y leerlas lo ayuda a comprender mejor el tema, *puede encontrar todas las pruebas unitarias implementadas en la carpeta de prueba de cada uno de nuestros proyectos **Maven***. Si aún no sabe cómo funcionan las pruebas unitarias, le recomiendo centrarse solo en el tema discutido.

Como en el ejemplo anterior, puede agregar cualquier tipo de objeto al **contexto Spring**(figura 2.10). Agreguemos también un **`String`** y un **`Integer`** y veamos que funciona.

![image](https://user-images.githubusercontent.com/23094588/212135724-b7e6fc46-463e-435c-a730-f7713f40d3cb.png)

**Figura 2.10** Puede agregar cualquier objeto al **contexto de Spring** para que Spring lo sepa.

La siguiente lista muestra cómo cambié la clase de configuración para agregar también un **bean** de tipo **`String`** y un **bean** de tipo **`Integer`**.

**Listado 2.11** Agregando dos **beans** más al **contexto**

```java
@Configuration
public class ProjectConfig {
 
  @Bean
  Parrot parrot() {
    var p = new Parrot();
    p.setName("Koko");
    return p;
  }
 
  @Bean                  ❶
  String hello() {
    return "Hello";
  }
 
  @Bean                  ❷
  Integer ten() {
    return 10;
  }
}
```

❶ Agrega la cadena **“`Hello`”** al **contexto de Spring**

❷ Agrega el **`integer 10`** al **contexto de Spring**

**NOTA** Recuerde el propósito del **contexto de Spring**: agregamos las instancias que esperamos que Spring necesite administrar. (De esta manera, conectamos las funcionalidades que ofrece el framework). En una aplicación del mundo real, no agregaremos todos los objetos al **contexto de Spring**. Comenzando con el capítulo 4, cuando nuestros ejemplos se acerquen más al código en una aplicación lista para producción, también nos enfocaremos más en los objetos que Spring necesita administrar. Por el momento, concéntrese en los enfoques que puede usar para agregar **beans** al **contexto de Spring**.

Ahora puedes referirte a estos dos nuevos **beans** de la misma manera que hicimos con el parrot. La siguiente lista le muestra cómo cambiar el método **`main`** para imprimir los valores de los nuevos **beans**.

**Listado 2.12** Imprimiendo los dos nuevos **beans** en la consola


```java
public class Main {
 
  public static void main(String[] args) {
    var context = new AnnotationConfigApplicationContext(
                   ProjectConfig.class);
 
    Parrot p = context.getBean(Parrot.class);    ❶
    System.out.println(p.getName());
 
    String s = context.getBean(String.class);
    System.out.println(s);
 
    Integer n = context.getBean(Integer.class);
    System.out.println(n);
  }
}
```

❶ No necesitas hacer ningún casting explícito. Spring busca un **bean** del tipo que solicitó en su contexto. Si tal **bean** no existe, Spring lanzará una excepción.

Al ejecutar la aplicación ahora, los valores de los tres beans se imprimirán en la consola, como se muestra en el siguiente fragmento de código.

```sh
Koko
Hello
10
```

Hasta ahora, agregamos uno o más **beans** de diferentes tipos al **contexto Spring**. Pero, ***¿podríamos agregar más de un objeto del mismo tipo (figura 2.11)?*** En caso afirmativo, ***¿cómo podemos referirnos individualmente a estos objetos?*** Vamos a crear un nuevo proyecto, **"`sq-ch2-ex3`"**, para demostrar cómo puede agregar varios **beans** del mismo tipo al **contexto de Spring** y cómo puede hacer referencia a ellos después.

<img width="965" alt="image" src="https://user-images.githubusercontent.com/23094588/212411857-9c3c1834-a8fb-42a4-948c-d3a2091b7f61.png">

**Figura 2.11** Puede agregar más **beans** del mismo tipo al **contexto de Spring** usando múltiples métodos anotados con **`@Bean`**. Cada instancia tendrá un identificador único. Para referirse a ellos posteriormente, deberá usar los identificadores de los **beans**.

**NOTA** No confundas el nombre del **bean** con el nombre del parrot. En nuestro ejemplo, los nombres (o identificadores) de los **beans** en el **contexto Spring** son **`parrot1`**, **`parrot2`** y **`parrot3`** (como el nombre de los métodos **`@Bean`** que los definen). Los nombres que les di a los loros son **`Koko`**, **`Miki`** y **`Riki`**. El nombre del loro es solo un atributo del objeto **`Parrot`** y no significa nada para Spring.

Puede declarar tantas instancias del mismo tipo como desee simplemente declarando más métodos anotados con la anotación **`@Bean`**. La siguiente lista muestra cómo he declarado tres **beans** de tipo **`Parrot`** en la clase de configuración. Encuentra este ejemplo con el proyecto **"`sq-ch2-ex3`"**.

**Listado 2.13** Agregando múltiples **beans** del mismo tipo al **contexto Spring**

```java
@Configuration
public class ProjectConfig {
 
  @Bean
  Parrot parrot1() {
    var p = new Parrot();
    p.setName("Koko");
    return p;
  }
 
  @Bean
  Parrot parrot2() {
    var p = new Parrot();
    p.setName("Miki");
    return p;
  }
 
  @Bean
  Parrot parrot3() {
    var p = new Parrot();
    p.setName("Riki");
    return p;
  }
}
```

Por supuesto, ya no puede obtener los **beans** del **contexto** especificando solo el tipo. Si lo hace, obtendrá una excepción porque Spring no puede adivinar a qué instancia ha declarado que se refiere. Mira el siguiente listado. La ejecución de dicho código arroja una excepción en la que Spring le dice que debe ser preciso, cuál es la instancia que desea usar.

**Listado 2.14** Refiriéndose a una instancia de **`Parrot`** por tipo

```java
public class Main {
 
  public static void main(String[] args) {
    var context = new 
      AnnotationConfigApplicationContext(ProjectConfig.class);
 
    Parrot p = context.getBean(Parrot.class);    ❶
 
    System.out.println(p.getName());
 
  }
}
```

❶ Obtendrá una excepción en esta línea porque Spring no puede adivinar a cuál de las tres instancias de **`Parrot`** se refiere.

Al ejecutar su aplicación, obtendrá una excepción similar a la que se presenta en el siguiente fragmento de código.

```sh
Exception in thread "main" org.springframework.beans.factory.NoUniqueBeanDefinitionException: No qualifying bean of type 'main.Parrot' available: expected single matching bean but found 3: 
     parrot1,parrot2,parrot3    ❶
     at ...
```

❶ Nombres de los **Parrot beans** en el **contexto**

Para resolver este problema de ambigüedad, debe referirse precisamente a una de las instancias utilizando el nombre del **bean**. De forma predeterminada, Spring usa los nombres de los métodos anotados con **`@Bean`** como los nombres de los mismos **beans**. Recuerde que es por eso que no nombramos los métodos **`@Bean`** usando verbos. En nuestro caso, los **beans** tienen los nombres **`parrot1`**, **`parrot2`** y **`parrot3`** (recuerde, el método representa al **bean**). Puede encontrar estos nombres en el fragmento de código anterior en el mensaje de la excepción. ¿Los localizaste? Cambiemos el método **`main`** para referirnos a uno de estos **beans** explícitamente usando su nombre. Observe cómo me refiero al **bean `parrot2`** en el siguiente listado.

**Listado 2.15** Refiriéndose a un **bean** por su identificador

```java
public class Main {
 
  public static void main(String[] args) {
    var context = new 
      AnnotationConfigApplicationContext(ProjectConfig.class);
    
    Parrot p = context.getBean("parrot2", Parrot.class);    ❶
    System.out.println(p.getName());
 
  }
}
```

❶ El primer parámetro es el nombre de la instancia a la que nos referimos

Al ejecutar la aplicación ahora, ya no obtendrá una excepción. En su lugar, verás en la consola el nombre del segundo loro, **`Miki`**.

Si desea dar otro nombre al **bean**, puede usar uno de los atributos **`name`** o **`value`** de la anotación **`@Bean`**. Cualquiera de las siguientes sintaxis cambiará el nombre del **bean** a **"`miki`"**:

* **`@Bean(name = "miki")`**
* **`@Bean(value = "miki")`**
* **`@Bean("miki")`**


En el siguiente fragmento de código, puede observar el cambio tal como aparece en el código y, si desea ejecutar este ejemplo, lo encontrará en el proyecto llamado **“`sq-ch2-ex4`”**:

```java
@Bean(name = "miki")    ❶
Parrot parrot2() {
  var p = new Parrot();
  p.setName("Miki");    ❷
  return p;
}
```

❶ Establece el nombre del **bean**

❷ Establece el nombre del loro

2.2.2 Uso de anotaciones de estereotipos para agregar beans al contexto de Spring
EnEn esta sección, aprenderá un enfoque diferente para agregar beans al contexto de Spring (más adelante en este capítulo, también comparamos los enfoques y discutimos cuándo elegir uno u otro). Recuerde, agregar beans al contexto de Spring es esencial porque es la forma en que hace que Spring conozca las instancias de objetos de su aplicación, que deben ser administradas por el marco. Spring le ofrece más formas de agregar frijoles a su contexto. En diferentes escenarios, encontrará que usar uno de estos enfoques es más cómodo que otro. Por ejemplo, con las anotaciones de estereotipos, observará que escribe menos código para indicarle a Spring que agregue un bean a su contexto.

Definiendo un bean como primario

Anteriormente en esta sección, discutimos que podría tener varios beans del mismo tipo en el contexto de Spring, pero debe referirse a ellos usando sus nombres. Hay otra opción cuando se refiere a frijoles en el contexto cuando tiene más del mismo tipo.



Cuando tiene varios beans del mismo tipo en el contexto de Spring, puede hacer que uno de ellos sea el principal . Marcas el bean que quieres que sea primario usando la anotación @Primary. Un bean principal es el que Spring elegirá si tiene varias opciones y no especifica un nombre; el bean principal es simplemente la opción predeterminada de Spring. El siguiente fragmento de código muestra cómo se ve el método @Bean anotado como principal:

@Bean 
@Primary 
Parrot loro2() { 
  var p = nuevo Loro(); 
  p.setName("Miki"); 
  devolver p; 
}
Si se refiere a un loro sin especificar el nombre, Spring ahora seleccionará a Miki de forma predeterminada. Por supuesto, solo puede definir un bean de un tipo como principal. Encuentra este ejemplo implementado en el proyecto "sq-ch2-ex5".

Más adelante aprenderá que Spring ofrece múltiples anotaciones de estereotipos. Pero en esta sección, quiero que se concentre en cómo usar una anotación de estereotipo en general. Tomaremos el más básico de estos, @Component , y lo usaremos para demostrar nuestros ejemplos.

Con las anotaciones de estereotipos, agrega la anotación sobre la clase para la que necesita tener una instancia en el contexto de Spring. Al hacerlo, decimos que ha marcado la clase como un componente. Cuando la aplicación crea el contexto Spring, Spring crea una instancia de la clase que marcó como componente y agrega esa instancia a su contexto. Todavía tendremos una clase de configuración cuando usemos este enfoque para decirle a Spring dónde buscar las clases anotadas con anotaciones de estereotipo. Además, puede usar ambos enfoques (usando @Bean y anotaciones estereotipadas juntas; trabajaremos en este tipo de ejemplos complejos en capítulos posteriores).

Los pasos que debemos seguir en el proceso son los siguientes (figura 2.12):

Usando la anotación @Component, marque las clases para las que desea que Spring agregue una instancia a su contexto (en nuestro caso, Parrot ).

Uso de la anotación @ComponentScansobre la clase de configuración , indique a Spring dónde encontrar las clases que marcó.



Figura 2.12 Al usar anotaciones de estereotipos, considere dos pasos. Primero, use la anotación de estereotipo ( @Component ) para anotar la clase para la que desea que Spring agregue un bean a su contexto. En segundo lugar, use la anotación @ComponentScan para decirle a Spring dónde buscar clases anotadas con anotaciones de estereotipo.

Tomemos nuestro ejemplo con la clase Parrot . Podemos agregar una instancia de la clase en el contexto de Spring al anotar la clase Parrot con una de las anotaciones de estereotipo, digamos @Component .

La siguiente lista le muestra cómo usar la anotación @Component para la clase Parrot . Puede encontrar este ejemplo en el proyecto "sq-ch2-ex6".

Listado 2.16 Usando una anotación de estereotipo para la clase Parrot

@Component                ❶ 
public class Parrot { 
 
  private String nombre; 
 
  public String getName() { 
    devolver nombre; 
  } 
 
  public void setName(String nombre) { 
    this.name = nombre; 
  }
}
❶ Al usar la anotación @Component sobre la clase, le indicamos a Spring que cree una instancia de esta clase y la agregue a su contexto.

¡Pero espera! Este código no funcionará todavía. De forma predeterminada, Spring no busca clases anotadas con anotaciones estereotipadas, por lo que si dejamos el código como está, Spring no agregará un bean de tipo Parrot en su contexto. Para decirle a Spring que necesita buscar clases anotadas con anotaciones estereotipadas, usamos la anotación @ComponentScan sobre la clase de configuración. Además, con la anotación @ComponentScan , le decimos a Spring dónde buscar estas clases. Enumeramos los paquetes donde definimos las clases con anotaciones estereotipadas. La siguiente lista le muestra cómo usar la anotación @ComponentScan sobre la clase de configuración del proyecto. En mi caso, el nombre del paquete es "principal".

Listado 2.17 Usando la anotación @ComponentScan para decirle a Spring dónde buscar

@Configuration 
@ComponentScan(basePackages = "main")      ❶ 
clase pública ProjectConfig {
 
}
❶ Usando el atributo basePackages de la anotación, le decimos a Spring dónde buscar clases anotadas con anotaciones estereotipadas.

Ahora le dijiste a Spring lo siguiente:

Qué clases agregar una instancia a su contexto ( Parrot )

Dónde encontrar estas clases (usando @ComponentScan )

NOTA Ya no necesitamos métodos para definir los beans. Y ahora parece que este enfoque es mejor porque se logra lo mismo escribiendo menos código. Pero espere hasta el final de este capítulo. Aprenderá que ambos enfoques son útiles, según el escenario.

Puede continuar escribiendo el método principal como se presenta en la siguiente lista para probar que Spring crea y agrega el bean en su contexto.

Listado 2.18 Definición del método principal para probar la configuración de Spring

public class Main { 
 
  public static void main(String[] args) { 
    var context = new 
      AnnotationConfigApplicationContext(ProjectConfig.class); 
 
      Parrot p = context.getBean(Parrot.class); 
 
      Sistema.out.println(p);             ❶ 
      System.out.println(p.getName());   ❷ 
  }
}
❶ Imprime la representación String predeterminada de la instancia tomada del contexto Spring

❷ Imprime nulo porque no asignamos ningún nombre a la instancia de loro agregada por Spring en su contexto

Al ejecutar esta aplicación, observará que Spring agregó una instancia de Parrot a su contexto porque el primer valor impreso es la representación de cadena predeterminada de esta instancia. Sin embargo, el segundo valor impreso es nulo porque no le asignamos ningún nombre a este loro. Spring solo crea la instancia de la clase, pero sigue siendo nuestro deber si queremos cambiar esta instancia de alguna manera después (como asignarle un nombre).

Ahora que hemos cubierto las dos formas más frecuentes de agregar beans al contexto de Spring, hagamos una breve comparación de ellas (tabla 2.1).

Tabla 2.1 Ventajas y desventajas: una comparación de las dos formas de agregar beans al contexto de Spring, que le indica cuándo usaría cualquiera de ellos

Usando la anotación @Bean

Uso de anotaciones de estereotipos

Tiene control total sobre la creación de instancias que agrega al contexto de Spring. Es su responsabilidad crear y configurar la instancia en el cuerpo del método anotado con @Bean . Spring solo toma esa instancia y la agrega al contexto tal cual.

Puede usar este método para agregar más instancias del mismo tipo al contexto Spring. Recuerde, en la sección 2.1.1 agregamos tres instancias de Parrot en el contexto de Spring.

Puede usar la anotación @Bean para agregar al contexto Spring cualquier instancia de objeto. No es necesario definir la clase que define la instancia en su aplicación. Recuerde, anteriormente agregamos un String y un Integer al contexto de Spring.

Debe escribir un método separado para cada bean que cree, lo que agrega código repetitivo a su aplicación. Por esta razón, preferimos usar @Bean como segunda opción para estereotipar anotaciones en nuestros proyectos.

Solo tiene control sobre la instancia después de que el marco la crea.

De esta manera, solo puede agregar una instancia de la clase al contexto.

Puede usar anotaciones de estereotipo solo para crear beans de las clases que posee su aplicación. Por ejemplo, no podría agregar un bean de tipo String o Integer como hicimos en la sección 2.1.1 con la anotación @Bean porque no posee estas clases para cambiarlas agregando una anotación de estereotipo.

El uso de anotaciones de estereotipos para agregar beans al contexto de Spring no agrega código repetitivo a su aplicación. Preferirá este enfoque en general para las clases que pertenecen a su aplicación.

Lo que observará es que en escenarios del mundo real usará anotaciones de estereotipo tanto como sea posible (porque este enfoque implica escribir menos código), y solo usará el @Bean cuando no pueda agregar el bean de otra manera (por ejemplo, crea el bean para una clase que es parte de una biblioteca, por lo que no puede modificar esa clase para agregar el estereotipoanotación).

Uso de @PostConstruct para administrar la instancia después de su creación

Como hemos discutido en esta sección, al usar anotaciones de estereotipos, le indica a Spring que cree un bean y lo agregue a su contexto. Pero, a diferencia de usar la anotación @Bean , no tiene control total sobre la creación de la instancia. Usando @Bean , pudimos definir un nombre para cada una de las instancias de Parrot que agregamos al contexto de Spring, pero usando @Component , no tuvimos la oportunidad de hacer nada después de que Spring llamara al constructor de la clase Parrot . ¿Qué sucede si queremos ejecutar algunas instrucciones justo después de que Spring cree el bean? Podemos usar la anotación @PostConstruct .



Spring toma prestada la anotación @PostConstruct de Java EE. También podemos usar esta anotación con Spring beans para especificar un conjunto de instrucciones que Spring ejecuta después de la creación del bean. Solo necesita definir un método en la clase de componente y anotar ese método con @PostConstruct , que le indica a Spring que llame a ese método después de que el constructor finalice su ejecución.



Agreguemos a pom.xml la dependencia de Maven necesaria para usar la anotación @PostConstruct :

<dependencia> 
   <groupId>javax.annotation</groupId> 
   <artifactId>javax.annotation-api</artifactId> 
   <version>1.3.2</version> 
</dependency>
No necesita agregar esta dependencia si usa una versión de Java más pequeña que Java 11. Antes de Java 11, las dependencias de Java EE eran parte del JDK. Con Java 11, el JDK se limpió de las API no relacionadas con SE, incluidas las dependencias de Java EE.



Si desea utilizar funcionalidades que formaban parte de las API eliminadas (como @PostConstruct ), ahora debe agregar explícitamente la dependencia en su aplicación.

Ahora puede definir un método en la clase Parrot , como se presenta en el siguiente fragmento de código:

@Component 
public class Parrot { 
 
  private String name; 
 
  @PostConstruct 
  public void init() { 
    this.name = "Kiki"; 
  } 
 
  // Código omitido 
}
Encontrará este ejemplo en el proyecto "sq-ch2-ex7". Si ahora imprime el nombre del loro en la consola, observará que la aplicación imprime el valor Kiki en la consola.



De manera muy similar, pero menos encontrada en aplicaciones del mundo real, puede usar una anotación llamada @PreDestroy. Con esta anotación, define un método que Spring llama inmediatamente antes de cerrar y borrar el contexto. La anotación @PreDestroytambién se describe en JSR-250 y Spring lo tomó prestado. Pero, en general, recomiendo a los desarrolladores que eviten usarlo y busquen un enfoque diferente para ejecutar algo antes de que Spring borre el contexto, principalmente porque puede esperar que Spring no borre el contexto. Digamos que definió algo confidencial (como cerrar una conexión de base de datos) en el método @PreDestroy ; si Spring no llama al método, puede tener grandes problemas.

2.2.3 Agregar beans programáticamente al contexto de Spring
EnEn esta sección, analizamos la adición de beans mediante programación al contexto de Spring. Hemos tenido la opción de agregar beans mediante programación al contexto de Spring con Spring 5, que ofrece una gran flexibilidad porque le permite agregar nuevas instancias en el contexto directamente llamando a un método de la instancia de contexto. Usaría este enfoque cuando desee implementar una forma personalizada de agregar beans al contexto y las anotaciones @Bean o estereotipo no son suficientes para sus necesidades. Digamos que necesita registrar beans específicos en el contexto de Spring dependiendo de las configuraciones específicas de su aplicación. Con @Bean y las anotaciones de estereotipos, puede implementar la mayoría de los escenarios, pero no puede hacer algo como el código que se presenta en el siguiente fragmento:

if (condición) {   
   registerBean(b1);    ❶
   
} más { 
 
   registrarseBean(b2);    ❷
 
}
❶ Si la condición es verdadera, agregue un bean específico al contexto Spring.

❷ De lo contrario, agregue otro bean al contexto Spring.

Para seguir usando nuestro ejemplo de loros, el escenario es el siguiente: La aplicación lee una colección de loros. Algunos de ellos son verdes; otros son de color naranja. Desea que la aplicación agregue al contexto Spring solo los loros que son verdes (figura 2.13).



Figura 2.13 Uso del método registerBean() para agregar instancias de objetos específicos al contexto de Spring

Veamos cómo funciona este método. Para agregar un bean al contexto de Spring usando un enfoque programático, solo necesita llamar al método registerBean() de la instancia de ApplicationContext. registerBean() tiene cuatro parámetros, como se presenta en el siguiente fragmento de código:

<T> void registerBean( 
  String beanName, 
  Class<T> beanClass, Provider 
  <T> proveedor,
  BeanDefinitionCustomizer... personalizadores);
Use el primer parámetro beanName para definir un nombre para el bean que agrega en el contexto de Spring. Si no necesita dar un nombre al bean que está agregando, puede usar nulo como valor cuando llame al método.

El segundo parámetro es la clase que define el bean que agrega al contexto. Digamos que desea agregar una instancia de la clase Parrot ; el valor que le das a este parámetro es Parrot.class.

El tercer parámetro es una instancia de Proveedor . La implementación de este proveedor debe devolver el valor de la instancia que agrega al contexto. Recuerde, Proveedor es una interfaz funcional que encontrará en el paquete java.util .function . El propósito de la implementación de un proveedor es devolver un valor que defina sin tomar parámetros.

El cuarto y último parámetro es un varargs de BeanDefinitionCustomizer. (Si esto no le suena familiar, está bien; BeanDefinitionCustomizer es solo una interfaz que implementa para configurar diferentes características del bean; por ejemplo, convertirlo en primario ) . Al estar definido como un tipo varargs, puede omitir este parámetro por completo, o puede darle más valores de tipo BeanDefinitionCustomizer .

En el proyecto "sq-ch2-ex8", encontrará un ejemplo del uso del método registerBean() . Observa que la clase de configuración de este proyecto está vacía, y la clase Parrot que usamos para nuestro ejemplo de definición de bean es simplemente un objeto Java antiguo.(POYO); no usamos ninguna anotación con él. En el siguiente fragmento de código, encontrará la clase de configuración tal como la definí para este ejemplo:

@Configuración 
clase pública ProjectConfig {
}
Definí la clase Parrot que usamos para crear el bean:

Loro de clase pública { 
 
  Nombre de cadena privado; 
 
  // captadores y definidores omitidos
}
En el método principal del proyecto, he usado el método registerBean() para agregar una instancia de tipo Parrot al contexto de Spring. El siguiente listado presenta el código del método principal. La figura 2.14 se centra en la sintaxis para llamar al método registerBean() .



Figura 2.14 Llamar al método registerBean() para agregar un bean al contexto Spring programáticamente

Listado 2.19 Usando el método registerBean() para agregar un bean al contexto Spring

public class Main { 
 
  public static void main(String[] args) { 
    var context = 
      new AnnotationConfigApplicationContext( 
          ProjectConfig.class); 
 
      Loro x = nuevo Loro();                     ❶ 
      x.setName("Kiki"); 
 
      Proveedor<Loro> loroProveedor = () -> x;   ❷
  
      context.registerBean("loro1", 
        Parrot.class, loroSupplier);             ❸
  
      Parrot p = context.getBean(Parrot.class);    ❹ 
      System.out.println(p.getName());             ❹ 
  }
}
❶ Creamos la instancia que queremos agregar al contexto Spring.

❷ Definimos un Proveedor para devolver esta instancia.

❸ Llamamos al método registerBean() para agregar la instancia al contexto Spring.

❹ Para verificar que el bean está ahora en el contexto, nos referimos al frijol loro e imprimimos su nombre en la consola.

Utilice una o más instancias del configurador de beans como los últimos parámetros para establecer diferentes características de los beans que agrega. Por ejemplo, puede hacer que el bean sea el principal cambiando la llamada al método registerBean() , como se muestra en el siguiente fragmento de código. Un bean principal define la instancia que Spring selecciona de forma predeterminada si tiene varios beans del mismo tipo en el contexto:

context.registerBean("parrot1", 
                Parrot.class, 
                loroSupplier,
                bc -> bc.setPrimary(true));
Acabas de dar un primer gran paso en el mundo de Spring. Aprender a agregar beans al contexto de Spring puede no parecer mucho, pero es más importante de lo que parece. Con esta habilidad, ahora puede proceder a referirse a los beans en el contexto de Spring, que discutimosenCapítulo 3.

NOTA En este libro, solo utilizamos enfoques de configuración modernos. Sin embargo, me parece esencial que también esté al tanto de cómo los desarrolladores configuraron el marco en los primeros días de la primavera. En ese momento, usábamos XML para escribir estas configuraciones. En el apéndice B, se proporciona un breve ejemplo para darle una idea de cómo usaría XML para agregar un bean al contexto de Spring.

Resumen
Lo primero que debe aprender en Spring es agregar instancias de objetos (que llamamos beans) al contexto de Spring. Puede imaginar el contexto de Spring como un depósito en el que agrega las instancias que espera que Spring pueda administrar. Spring solo puede ver las instancias que agrega a su contexto.

Puede agregar beans al contexto Spring de tres maneras: usando la anotación @Bean , usando anotaciones estereotipadas y haciéndolo mediante programación.

El uso de la anotación @Bean para agregar instancias al contexto de Spring le permite agregar cualquier tipo de instancia de objeto como un bean e incluso varias instancias del mismo tipo al contexto de Spring. Desde este punto de vista, este enfoque es más flexible que el uso de anotaciones estereotipadas. Aún así, requiere que escriba más código porque necesita escribir un método separado en la clase de configuración para cada instancia independiente agregada al contexto.

Usando anotaciones de estereotipo, puede crear beans solo para las clases de aplicación con una anotación específica (por ejemplo, @Component ). Este enfoque de configuración requiere escribir menos código, lo que hace que su configuración sea más cómoda de leer. Preferirá este enfoque sobre la anotación @Bean para las clases que defina y pueda anotar.

El uso del método registerBean() le permite implementar una lógica personalizada para agregar beans al contexto de Spring. Recuerde, puede usar este enfoque solo con Spring 5 yluego.
