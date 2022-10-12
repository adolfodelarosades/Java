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


## Instalación IntelliJ IDEA 04:39

Bien, continuamos con el ÍDE, nuestro entorno de desarrollo integrado para desarrollar, para crear

el código, vamos a utilizar inteligir hoy día uno de los más robustos que hay en el mercado.

Bueno, junto con Eclipse también uno de los dos más utilizados, pero intelige es más utilizado aún.

De Eclipse más o menos.

Se estima que el 60 por ciento de los desarrolladores en Java utilizan este IDE muy flexible y muy ruto,

cosa que vamos a ver en el curso.

Nos vamos a la página Nyet Brains PuntoCom.

Acá tenemos la ruta Jet Brains PuntoCom.

Nos vamos a Tools en IDE.

Acá tenemos intelige hoy día.

Entonces hacemos un click.

Esta es la página principal del IDE para Yaba de Nyet Brains y descargamos.

Nos vamos a Download y tenemos dos versiones la Ultimate, que es como la empresarial para desarrollar

que es de pago, solamente podemos descargar una versión de prueba limitada, pero tenemos la comunity,

que es la que vamos a usar en el curso.

Bueno, la comunity tiene todo lo necesario y lo suficiente para el curso.

Acá tiene las ventajas, lo que incluye y lo que no se incluye en el Open Source, en la versión comunity

versus la comercial.

Pero todo lo demás, es decir, lo que no se incluya en el IDE, lo puedo manejar con otras herramientas

open source, por supuesto, o con playing.

En fin, hay alternativas, pero elide la base que se incluye en la versión de Comunida con mi Unity

es más que suficiente para programar y trabajar en Java.

Bien, entonces nos vamos a descargar acá.

También pueden seleccionar el sistema operativo, por ejemplo, se van a Mackintosh o a Linux y también,

pero por defecto muestra el sistema operativo que detecta de forma automática.

Pueden descargar la versión ejecutable, instalarle de puntuó exe o en zip que es portable.

Vamos a descargar Download Puppets.

Perfecto.

Acá pide un registro.

Pero bueno, no necesario registrar el mail.

Simplemente hacen un clic en Descargar y de forma automática se comienza a descargar.

También me pueden demorar un rato de que son cerca de 600 mega, así que puede morar un rato según la

conexión y una vez que haya finalizado la carga, continuamos con la instalación.

Pegamos la descarga de download, la pegamos en nuestro directorio del curso curso YABA con doble clic.

Instalamos un Wistar bastante simple.

Colocamos siguiente la ruta por defecto pueden escoger la que quieran siguiente.

Acá seleccionamos que nos cree un atajo, ya sea en 64 o 32.

Bueno, voy a colocar 64 y también opciones lo pueden marcar, por ejemplo, que de forma automática

asocie este ensanchaba de Groovy de Kotlin para Android.

Enfín, siguiente instalas.

Esperamos un rato.

Bueno, básicamente por defecto, toda la configuración es por defecto, que viene en el IDE.

Bien, y al final da la opción para ejecutar, para correr, el IDE intelige la idea, lo seleccionamos

y finalizar acá nos pregunta si queremos compartir datos, colocar que sí o que no puede poner, que

no importar configuraciones de algún directorio o no importar por defecto.

En caso de que hayamos tenido instalado otra versión, ponemos ok, bien y al principio nos pregunta

qué tema o qué diseño queremos utilizar.

Por ejemplo alguno oscuro darks hola o light.

Bueno, light es como el diseño claro y por defecto que viene en el IDE, muy similar al que trae Eclipse

por defecto.

Bueno, para el curso voy a usar el oscuro, más que nada porque un poco más cómodo para la vista,

un poco más agradable, pero al final es un tema de gusto.

Pueden utilizar cualquiera todos siguiente acá pregunta sobre los plugins para customizar.

Dejamos todo por defecto, dejamos habilitado lo que viene y lo demás todo por defecto.

No tocamos nada.

Siguiente Instalar algunas herramientas por ejemplo para soporte a lenguaje Scala y otra cosa también

vamos a omitir.

Nos vamos a instalar nada más.

Solamente nuestro IDE y comenzar.

Acá tenemos nuestra ventana principal por defecto, que nos permite crear un proyecto, abrir un proyecto,

obtener desde versión de control, por ejemplo con IT, actualizar playing y configuraciones.

Pero bien, vamos a quedar hasta acá porque la siguiente clase vamos a comenzar con el curso, vamos

a comenzar con crear un proyecto.

Acá nos vemos en la siguiente clase.
