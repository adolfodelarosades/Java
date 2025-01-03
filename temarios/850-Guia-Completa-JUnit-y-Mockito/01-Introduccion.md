# 1. Introducción - 3 clases • 24 min

* Introducción al curso 06:05
* Instalación JDK (opcional) 13:40
* Instalación IntelliJ IDEA 04:39

## Introducción al curso 06:05

Bienvenidos al curso de pruebas unitarias con **JUnit5** y **Mockito** en Java.

Este curso está orientado a estudiantes que quieren aprender solamente **JUnit5** y **Mockito** nada más. Pero también aquellos que quieran aprender todo lo que es pruebas en **Sprint**.

Por lo tanto, vamos a ver dos grandes parte del curso partiendo desde la base, desde cero y después vamos a ver cómo se trabaja, como se integran también estas dos herramientas en **Spring Boots**.

![image](https://user-images.githubusercontent.com/23094588/195302668-c94ac9ec-215f-4fe4-b095-395d5f5b8456.png)

Bien, los componentes que vamos a ver son los siguientes por el lado de **JUnit5**.  

Comenzando con un ***desarrollo guiado por pruebas unitarias que se le conoce como TDD***, antes siquiera de haber comenzado a escribir el código, vamos a comenzar a realizar nuestras pruebas unitarias y a medida que vamos probando nuestro código que vamos escribiendo, vamos implementando los métodos, nuestro código, las clases y dando funcionalidad.

Vamos a ver todo lo que es ***Assertions***, la clase más importante de **JUnit5** para las afirmaciones con diferentes tipos afirmaciones por ejemplo **`assertEquals`**, **`assertTrue`**, **`assertFalse`**, **`assertNull`** en fin, afirmar nuestro código, nuestras variables y objetos.

Y también todo lo el manejo de errores con **`assertThrows`**, manejo de excepciones. Afirmar, por ejemplo, que nuestro código lance una excepción esperada, validar que nuestro manejo de error sea el correcto.

**`assertAll`** ejecutar un grupo de ***Assertions*** de afirmaciones.

***Anotaciones*** como ***`@DisplayName`*** y ***`@Disabled`***.

El ***ciclo de vida de una clase*** de test de unit ***`@AfterEach`***, ***`@BeforeEach`***, ***`@AfterAll`*** y ***`@BeforeAll`***, lo vamos a ver en detalle en el curso.

También tenemos los ***test condicionales*** utilizando anotaciones ***`@EnabledOnOs`***, ***`@EnabledOnJre`***, etc.

También tenemos ***Assumptions***, que nos permite suponer que cierta condición se cumple, muy parecido a las anotaciones condicionales que tenemos arriba, pero esto es a nivel de código, un poco más programático.

***Test anidados***, clases de tests que se anotan con **`@Nested`** para dar una jerarquía, una organización, una estructura a nuestras pruebas unitarias, utilizando clases anidadas que también se les conoce como ***Inner class***.

**`@RepeatedTest`** para crear ***tests repetidos***.

También tenemos los ***tests parametrizados*** con la anotación **`@ParameterizedTest`**.

Uso de etiquetas **`@Tag`** para categorizar, etiquetar nuestros métodos, nuestras pruebas unitarias.

***Independencia***, en fin y mucho más.


![image](https://user-images.githubusercontent.com/23094588/195310958-3d4a7c6d-63f0-4bbb-a667-7a935ea9dfd7.png)

Temas que vamos a ver en **Mockito**.

***Dependencias mock***, vamos a realizar un test a una clase, podría ser un **`service`** que tiene dependencia, tiene otras instancias de objetos que se utilizan, pero estas dependencias las vamos a emular, porque lo que nos interesa realmente es probar la clase en cuestión, la clase por ejemplo **`service`** que contiene esta dependencia. La dependencias, simplemente las implementamos como un mock, la simulamos de una forma simple utilizando este framework. 

Vamos a utilizar los ***verify*** para ver qué métodos se están invocando, que se están llamando de estas dependencias.

Anotacion como **`@Mock`**, **`@InjectMock`** y **`@Captor`**.

**`@ExtendWith`** para ejecutar una prueba unitaria con una extensión.

***Exepciones*** con **`thenThrow`**.

**`Argument matchers`** que nos permite validar que se están ejecutando los métodos con cierto tipo de argumento, con cierto patrón de argumento y si es que coinciden.

**`Argument capture`** tiene fondo para capturar un argumento.

***Familias de métodos*** **`do`**...,  do algo por ejemplo **`doThrow`** para manejo de excepciones, **`doReturn`** en fin, para dar un comportamiento para simular los métodos mock cuando no devuelven nada, cuando son vacíos, son **`void`**.

También se utiliza mucho en conjunto con los espías, vienen a continuación los **`Spy`**, que es un híbrido entre un mock, un objeto simulado y el objeto real. Por lo tanto, también nos permite invocar los métodos reales, no necesariamente simular el comportamiento de un método, sino también hasta la llamada real a un método y mucho más.


![image](https://user-images.githubusercontent.com/23094588/195316482-7a524388-4151-4d74-b0ae-bc405d693867.png)

Por el lado de **Spring Boot Test**.

***Integración con JUnit 5 y Mockito***, este curso está orientado a personas que quieren aprender **JUnit 5** y **Mockito** desde cero, es decir sin **Spring Boot**, por lo tanto vamos a aprender desde cero, desde la base con estos dos Frameworks y después vamos a ir a una sección aparte de todo lo que hemos visto de **JUnit 5** y **Mockito** y lo vamos a integrar, lo vamos a trabajar en una aplicación con **Spring Boot**.

También se incluyen anotaciones como **`@MockBean`** y **`@Autowired`** que es para inyección de dependencia, **`@MockBean`** es para registrar un componente Spring, pero que es un Mock, no es objeto real, de una implementación por ejemplo, es un mock que está simulado. En realidad no queremos probar el objeto real de esa dependencia de terceros, lo que queremos realmente es probar en nuestro propio código, nuestra clase **`service`**, que depende de **`@MockBean`**.

También vamos a ver todo lo que es ***prueba de integración***, por ejemplo, para trabajar con controladores con MockMVC usando la anotación **`@WebMvcTest`**, **`@DataJpaTest`**, también toda la integración con persistencia y mucho más, todo lo relacionado con **Spring Boot**.


## Instalación JDK (opcional) 13:40

Continuamos con la descarga de la instalación del **JDK**, el JDK es el kit de desarrollo para Java, contiene todas las clases y librerías para poder escribir y desarrollar nuestras aplicaciones en **Java**.

Vamos a ir a la página [https://www.oracle.com/java/](https://www.oracle.com/java/) 

![image](https://user-images.githubusercontent.com/23094588/195322014-2ea2faf6-0df3-40dd-84c6-0506322ef176.png)

Si damos en el botón Download Java vemos:

![image](https://user-images.githubusercontent.com/23094588/195322517-b863d534-d369-4dcb-becd-32492d8ab331.png)

Actualmente la versión más reciente de Java es la 19 la última disponible hasta el momento, como nueva política de Oracle va sacando versiones cada seis meses, en seis meses más la versión va a ser la 20, pero hasta el momento es la 19.

Pero todas las aplicaciones que vamos a ver en el curso van a funcionar con la versión 19 en adelante, sin ningún problema. Es compatible con versiones posteriores, incluso también pueden usar versiones anteriores, por ejemplo la 12, la 11 y ningún problema.

Actualmente las últimas versiones es decir, desde la 10 en adelante solamente se ejecutan y se pueden instalar máquinas de 64 bits.

Pero ¿qué pasa si tengo un equipo en 32 bits?, en vez de utilizar la 14 tienen que descargar y configurar la 8.

Para descargar el JDK de Java vamos a los enlaces de descarga según versión y sistema operativo que corresponda.

![image](https://user-images.githubusercontent.com/23094588/195324715-71fe3367-bf54-4061-bb8c-04da6759f1f9.png)

Si observamos el siguiente parrafo en la Web vemos que la versión más reciente es la 19 pero la LST es la 17, siempre será mejor instalar una versión LST ya que tiene más soporte a mediano plazo.

![image](https://user-images.githubusercontent.com/23094588/195328717-5d375923-e20e-41bc-99a1-2a770b644dc9.png)

> **Nota**: Si deseamos desinstalar Java consultar el siguiente [enlace](https://www.javaprogramto.com/2021/11/uninstall-java-mac.html)

Por lo que vamos a la zona de descargas de JDK 17 y al sistema correspondiente.

![image](https://user-images.githubusercontent.com/23094588/195331603-322a8195-3d1c-4970-8ccd-1e873b5f1eae.png)

Podemos observar dos versiones **Arm 64** y **x64** en el caso de la Mac si tienes el Chip M1 tendras que descargar la versión **Arm 64**. Además puedes descargar un archivo comprimido **`.gz`** o un **`.dmg`** que siempre es más comodo de instalar.

Después de todo lo anterior me descargo la versión:

![image](https://user-images.githubusercontent.com/23094588/195332731-399d1a45-cf72-4b30-a51a-a4fea73562e7.png)

También podemos descargar la documentación asociada a esa versión la cual esta empaquetada en un archivo **`zip`**.

### JDK vs OpenJDK

Pero, hay otra cosa que debemos considerar tenemos dos tipos de versiones el **JDK** o el **OpenJDK**. 

La versión **JDK** es para Clientes de Oracle e ISV que apuntan a versiones de Oracle LTS. Oracle JDK es la versión Java SE compatible de Oracle para clientes y para desarrollar y probar aplicaciones Java

La versión **OpenJDK** es para Usuarios finales y desarrolladores que buscan versiones gratuitas de JDK: Oracle OpenJDK ofrece las mismas funciones y rendimiento que Oracle JDK bajo la licencia GPL.

En la página de descargas tenemos el botón **OpenJDK Early Access Builds**.

![image](https://user-images.githubusercontent.com/23094588/195334009-a10e264d-33ee-4115-a1b5-aa57f2f60a44.png)

Que al pulsarlo tenemos.

![image](https://user-images.githubusercontent.com/23094588/195334171-aee17a2d-914d-460a-ad6d-9f6ba557c4f0.png)

Y si pulsamos en JDK 19 tenemos:

![image](https://user-images.githubusercontent.com/23094588/195336962-61d69965-9b79-4e7c-b28d-e53ebff5dcb0.png)

Para ver versiones anteriores podemos pulsar en **Archive**

![image](https://user-images.githubusercontent.com/23094588/195352081-b5988e26-f708-40b4-91f4-aa56f12ae3e8.png)

Pero en el caso de OpenJDK es recomendable descargarse la última versión la versión JDK 19. Vamos a seleccionar

![image](https://user-images.githubusercontent.com/23094588/195337964-0933eb95-7252-4918-8063-2e2041014780.png)

Por ahora hemos descargado tanto OpenJDK y JDK con la documentación correspondiente.

¿Cual versión debemos instalar OpenJDK o JDK?

Para desarrollar programas tanto OpenJDK como JDK son totalmente gratuitas no hay licencias. 

Sin embargo si colocamos nuestra aplicación en producción, para un tema comercial y ha sido desarrollada con **JDK**, se recomienda utilizar la versión oficial, si que debemos pagar una licencia. A parte del soporte, incluye parte de seguridad y actualizaciones.

Mientras que si utilizamos **Open JDK** para producción lo podemos hacer sin casi ningún problema, sin pagar licencia total es Open Source JDK, no hay licencia, pero el problema es que no trae parches de seguridad para producción, no trae nuevas actualizaciones. Es un tema importante a toman en cuenta.


### Instalando Java en Windows

En el caso de Windows descargamos el archivo **`zip`**.

IMAGEN

Una vez que se descarga vamos a configurarlo, para el curso vamos a ocupar un directorio, por ejemplo en mi caso **`C:\Cursos\Java`**. Lo importante es que sea lo más simple posible, que no tenga caracteres especiales, que no tenga espacios en blanco, ni acentos, ni eñes, ningún carácter especial, solamente alfanumérico y todo juntos sin espacios, es muy importante porque después podríamos tener muchos errores y problemas cuando queramos ejecutar nuestras aplicaciones.

Dentro de esta carpeta hemos colocado el archivo descargado, lo copiamos de descargas, lo pegan y lo descomprime utilizando cualquier herramienta, en mi caso **7-zip**. Una vez que se descomprime está el directorio **`jdk-14.0.1`**.

IMAGEN

Dentro tenemos la carpeta más importante **`bin`**, que contiene todos los ejecutables. Esto es lo que se tienen que configurar en nuestro sistema operativo.

Entonces vamos a copiar la ruta **`C:\Cursos\Javajdk-14.0.1\bin`**. 

En el caso que hayamos intalado la versión Instaler de Windos Java se ha instalado en **`C:\Archivos de Programas\Java\Javajdk-14.0.1\bin`** y este caso esta es la ruta que copiamos.

#### Configurando las Variables de Entorno PATH y JAVA_HOME

Entonces, tanto para Open JDK comprimido como para la versión de Oracle de Java, hay que configurar la variable ambiente, nos vamos a buscar en el sistema operativo. En el buscador colocan *variables* o *variables de entorno* o de *ambiente* y damos click, se abre esta ventana.

IMAGEN

Nos vamos en ***opciones avanzadas - variable entorno***.

IMAGEN

Y tenemos dos tipos de variables del usuario y del sistema, del sistema operativo de forma global. Lo vamos a configurar solamente para el ***usuario***, pero también lo pueden hacer para el ***sistema***, no hay ningún problema.

Nos vamos a **PATH**.

IMAGEN

y con ***Doble clic*** o ***Editar*** nos aparece una nueva ventana

IMAGEN

Y con ***Doble clic*** o ***Nuevo*** pegamos la ruta, incluyendo el **`bin`** que contiene los ejecutables.

IMAGEN

Bien, y eso sería todo.

Ahora, otro detalle importante, puede que tengan instalado una versión del JDK o del JRE que sea más antigua y puede que esté configurado en el **`PATH`**, entonces lo que tienen que hacer es eliminar cualquier versión de Java anterior y dejar la que hemos copiado. También revisamos si existe alguna versión anterior en las ***Variables del Sistema*** para eliminarla. Siempre una porque si no, si tenemos la 14 y la 1.8, por supuesto que vamos a tener conflicto.

Damos en el botón ***Aceptar***.

Lo siguiente es configurar la variable de entorno **`JAVA_HOME`** también en cualquiera de las dos Variables de Entorno la del Usuario o la del Sistea. Como nosotros estamos trabajando con las Variables de Entorno del Usuario lo vamos hacer aquí, pulsamos en el botón ***Nuevo***.

IMAGEN

Ponemos el ***Nombre*** y ***Valor*** de la variable, observe como la ruta que pegamos en ***Valor*** no lleva **`\bin`** el valor será **`C:\Cursos\Javajdk-14.0.1`**

IMAGEN

damos en el botón **Aceptar**.

IMAGEN

Ya tenemos la variable **`JAVA_HOME`**. Presionamos el botón **Aceptar** en nuestras ventanas.

Vamos a la terminal a probar, por ejemplo a la **PowerSchell** o al **CMD**.

Ejecuta el comando **`java -version`** o **`java --version`**.

IMAGEN

Si aparece la última versión, la 14 es porque quedó bien configurado en el **`PATH`**.

También podemos probar el compilador Java con **`javac -version`**.

IMAGEN


### Instalar JDK 17 DMG en Mac

Voy a instalar la versión JDK 17 con el archivo **`.dmg`** que es una forma más sencilla.

<img width="759" alt="image" src="https://user-images.githubusercontent.com/23094588/195353368-36b0fc76-2494-4efe-ab91-062bd7deed8a.png">

Vamos a dar doble click en el archivo **jdk-17_macos-aarch64_bin.dmg**.

![image](https://user-images.githubusercontent.com/23094588/195353892-d768bcef-65a6-4d9e-a04f-dbf7d2259127.png)

Al dar doble click sobre el archivo nos sale el Instalador JDK 17.0.4.1

![image](https://user-images.githubusercontent.com/23094588/195355860-06a990f6-d0d9-43e2-a361-df698e611c12.png)

<img width="625" alt="image" src="https://user-images.githubusercontent.com/23094588/195356054-8ff089c6-5869-4363-92c2-1bd232d80791.png">

<img width="622" alt="image" src="https://user-images.githubusercontent.com/23094588/195356269-c2e8c986-2d23-4bdb-955e-2523026c75ef.png">

La parte de Destino no me la mostro así que no se en que lugar del ordenador lo instalo.

Si abrimos consola y escribimos el comando **`java -version`** nos muestra la versión de Java instalada.

<img width="572" alt="image" src="https://user-images.githubusercontent.com/23094588/195357476-b0844106-6326-4556-8ebd-a5ec27e1c431.png">

#### Configurando las Variables de Entorno PATH y JAVA_HOME en Linux y Mac

Veamos ahora cómo configurar las Variables de Entorno en Linux y Mac.

IMAGEN LINUX

En el caso de Linux también es muy simple, vamos al archivo **`profile`** o **`environment`**, que son los archivos globales para configurar variables de ambiente o usar el archivo **`bashrc`** solamente para el usuario.

Entonces, dependiendo de si lo queremos hacer global o por usuario editamos el archivo correspondiente para añadir las dos variables de entorno como se muestra en la imagen, guardamos y cerramos el archivo.

El siguiente paso es ejecutar el comando **`source ~/.bashrc`** o con el archivo editado.

Y el ultimo paso es revisar los valores de las variables de entorno con los comandos:

```sh
echo $PATH
echo $JAVA_HOME
```

IMAGEN MAC OS X

Para el caso de **Mac OS X** es muy similar.

Se utiliza el archivo **`profile`** de forma global o **`bash_profile`** solamente para el usuario y 
también con cualquier editor lo modificamos. Agregamos los **`export`** de las dos variables de entorno **`JAVA_HOME`** y **`PATH`** como se muestra en la imagen.

Observemos que en **`export JAVA_HOME=$(/usr/libexec/java_home)`** donde **`/usr/libexec/java_home`** es la ubicación generica o base de Java en la Mac, incluso si lo instalamos con [Homebrew](https://brew.sh/index_es), si no colocamos la ruta que corresponda.

Una vez añadidas las dos variables de entorno en el archivo lo guardamos y cerramos.

El siguiente paso sería ejecutar el comando **`source ~/.bash_profile`** en caso de haber editado el archivo **`bash_profile`**.

Finalmente revisamos en el terminal los valores de las variables de entorno con los comandos:

```sh
echo $PATH
echo $JA_VA_HOME
```

Y para finalizar un tema importante que es solamente para la versión del JDK 8 no incluye el JRE. Por lo tanto tenemos que instalar el **JRE** para ejecutar las aplicaciones Java, lo tenemos que instalar de forma separada del JDK, mientras que en versiones posteriores la 11, la 12 hasta la 19, el JDK viene con el JRE todo junto, es decir, el JDK ya incluye el JRE. No se tiene que instalar a parte, de hecho no existe el JRE para instalar aparte en la versión 14, solo en la versión 8 e inferiores incluso eso lo podemos ver en la página.

Si nos vamos a la pagina de Oracle y va a la 14 solamente existe el JDK porque ya incluye JRE, pero si bajamos a Java 8, donde tenemos JDK y JRE, ambos se descargan y se instalan de forma independiente.

Pero esto solamente en caso de que tengan 32 bits y utilicen Java 8.

IMAGEN DEL JAVA JDK uNico y JRE EN JAVA 8

Recuerden el JDK es el Kit de Desarrollo de Java incluye todas las librerías y clases para desarrollar y escribir aplicaciones en Java.

El JRE es el Runtime para ejecutar nuestras aplicaciones en Java, en la máquina virtual de Java.


#### Configurando las Variables de Entorno PATH y JAVA_HOME en mi Portatil Mac

Hemos histalado el JDK 17 en el portatil como se puede ver en la siguiente imagen.

<img width="897" alt="image" src="https://user-images.githubusercontent.com/23094588/195443723-73b038f6-90e7-4a2f-9919-c10230e7b8d1.png">

Podemos ver el valor actual de las variables de entorno **`PATH`** y **`JAVA_HOME`**.

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/195444120-7c6df1f2-3ab4-4a39-84a9-c3873fc54a95.png">

Podemos observar que la variable de entorno **`PATH`** existe y podemos ver su valor, sin embargo la variable **`JAVA_HOME`** ni si quiera existe.

Vamos a proceder a seguir los pasos explicados anteriormente.

Vamos a definir las variables de entorno a nivel de usuario por lo que vamos a usar el comando **`vim .bash_profile`**

<img width="973" alt="image" src="https://user-images.githubusercontent.com/23094588/195445223-d0465f8a-d536-43d0-ade2-77e77b2a92f4.png">

Nos aparece el editor **vim** con el archivo vacio, vamos a incluir las dos variables de entorno, debemos pulsar **`i`** para ponernos en modo de Insersión.

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/195447225-e8eb6b9a-c609-4fa9-a57e-0c78001fdd3c.png">

Una vez añadidas las variables de entorno pulsamos **`ESC`** para salir del modo de Insersión y pulsamos **`:wq`** para salvar el archivo.

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/195448354-969d3c94-96ff-488c-b76b-8095ccb93809.png">

Nos regresa a la consola ahora vamos a pulsar el comando **`source ~/.bash_profile`**.

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/195448786-f1a6f707-aac6-4e90-95e4-1443d22285ab.png">

Finalmente vamos a verificar el valor de las variables de entorno.

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/195449101-66028919-67c4-4d77-8f5c-9ae7012f47e1.png">


## Instalación IntelliJ IDEA 04:39

Continuamos con el **IDE**, nuestro **Entorno de Desarrollo Integrado** para desarrollar, para crear
el código, vamos a utilizar **IntelliJ** hoy día uno de los más robustos que hay en el mercado, junto con **Eclipse** también uno de los dos más utilizados, pero **IntelliJ** es más utilizado aún. Se estima que el 60% de los desarrolladores en Java utilizan este IDE, muy flexible y robusto

Vamos a la página [https://www.jetbrains.com/es-es/](https://www.jetbrains.com/es-es/)

<img width="1509" alt="image" src="https://user-images.githubusercontent.com/23094588/195535417-37734b8f-9eef-4782-be0e-582372ad51c7.png">

Tenemos que buscar en los IDEs [IntelliJ IDEA](https://www.jetbrains.com/es-es/idea/)

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/23094588/195536099-d8c580ae-bd64-40cd-9af3-994c4981066e.png">

Esta es la página principal del IDE para Java de **JET Brains**, pulsamons en el botón ***descargar*** y descargamos.

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/23094588/195536517-d9d682c1-1539-4dda-8371-ad360670167b.png">

Tenemos dos versiones la **Ultimate**, que es la empresarial para desarrollar y que es de pago, solamente podemos descargar una versión de prueba limitada, y por otro lado tenemos la **Community** que es la que vamos a usar en el curso.

La **Community** tiene todo lo necesario y lo suficiente para el curso.

<img width="842" alt="image" src="https://user-images.githubusercontent.com/23094588/195551096-a7924b84-b377-4145-85cf-d32e9eeaec6a.png">

Aquí vemos todas las caracteríosticas de una y otra versión, lo que no se incluye en el Open Source, en la versión **Community** lo puedo manejar con otras herramientas Open Source o con Plugings.

Pero con la versión **Community** es más que suficiente para programar y trabajar en Java.

Vamos a descargar la versión **Community** para nuestro sistema operativo.

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/23094588/195553257-730c1e15-dc5a-4ce0-b3a4-c2be31314f69.png">

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/23094588/195553101-2987633f-2dd1-4787-90f2-df87ca4000b1.png">

Damos click en el archivo descargado para instalarlo.

<img width="459" alt="image" src="https://user-images.githubusercontent.com/23094588/195557695-5186186a-a09b-4e2a-a671-27572c9d3f9f.png">

Arrastramos el icono a Aplicaciones para instalarlo.

<img width="1357" alt="image" src="https://user-images.githubusercontent.com/23094588/195558779-7718a563-d55b-4bd4-bc73-c1574377ade3.png">

Ya nos aparece dentro de nuestras aplicaciones, vamos a dar doble clic para abrir el IDE de IntelliJ IDEA CE. Lo primero que nos sale es:

<img width="602" alt="image" src="https://user-images.githubusercontent.com/23094588/195560589-3421b818-2a9a-476a-a872-de0577457735.png">

<img width="604" alt="image" src="https://user-images.githubusercontent.com/23094588/195560722-b86a931f-b27e-4ba6-9a58-7cb7831c217e.png">

Finalmente se abre el IDE.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/195560883-3b84906c-13ed-4f84-9d85-e14aa77742ab.png">

Tenemos nuestra ventana principal por defecto, que nos permite crear un proyecto nuevo, abrir un proyecto, u obtener un proyecto desde el VCS (Sistema de Control de Versiones).

Tenemos un botón **Start Tour** al pulsarlo tenemos:

<img width="265" alt="image" src="https://user-images.githubusercontent.com/23094588/195563289-898407ea-4e4d-49c3-bc5e-2437ab6dccba.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/195563040-26cb0b12-ef99-41ba-8588-f24789c1d132.png">

Cuando sea posible hacerlo.

