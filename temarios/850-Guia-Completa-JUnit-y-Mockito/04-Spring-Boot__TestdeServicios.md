# 4. Spring Boot: Test de Servicios (Mockito) - 12 clases • 1 h 29 min

* Introducción y creando el proyecto Spring 11:52
* Creando las clases del modelo 10:31
* Creando los repositorios 05:34
* Implementando la clase de servicio (Service) 06:15
* Escribiendo nuestros tests con JUnit y mockito 11:40
* Test **`verify`** 05:31
* Escribiendo tests **`assertThrow`** para afirmar que la excepción lanzada sea correcta 12:21
* Escribiendo tests con **`assertSame`** 05:41
* Uso de anotaciones de spring **`@MockBean`** y **`@Autowired`** 04:46
* Introducción a la inyección de dependencia en Spring (Opcional) 10:09
* Deshabilitando la traza del logs de Spring en el contexto test 04:10
* Descargar Código Fuente 00:03

## Introducción y creando el proyecto Spring 11:52

Comenzamos con la tercera parte del curso, vamos a llevar todo lo que hemos aprendido de **JUnit** de **Mockito** en un proyecto más real con **Spring Boot**, cómo se integran estas herramientas de testing dentro de una aplicación con **Spring Boot**. Pero tenga presente que **Spring Framework**, **Spring Boot**, es demasiado amplio, es decir, es para un curso completo. Por lo tanto, voy a explicar lo justo y necesario. No puedo entrar mucho en detalle. No es porque no quiera, sino porque este curso es de **Pruebas Unitarias**.

Entonces, para esta parte del curso recomiendo que tengan cierta experiencia con **Spring Boot**, alguna base en el Framework. Si no la tienen, no importa, igual lo pueden hacer, igual van a aprender, pero no voy a entrar mucho en detalle. Luego, si quieren profundizar mucho más de **Spring Boot** tengo otro curso, otro curso que van desde cero para que lo tengan presente.

Entonces, dicho esto, vamos a comenzar como estamos trabajando con **IntelliJ** la versión Comunity no integra todo **Spring Boot** no viene en forma nativa, solamente la versión de pago que es **IntelliJ Ultimate**, pero no la **IntelliJ Comunity**. Entonces estamos obligados a crear el proyecto por fuera. 

Entonces nos vamos a ir a una página que es propia del equipo de Spring https://start.spring.io/. Esta página permite crear un proyecto vamos a hacer un clic.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198337175-a2b0fda2-2bb8-4e18-bc58-cc405c16f5c5.png">

Esta página permite crear un proyecto Spring. Vamos a seleccionar las siguientes opciones:

* Maven
* Lenguaje Java
* La última versión estable hasta la fecha 2.7.5. Seleccionamos esa o la última, que nos diga SNAPSHOP, ni tampoco RC1 porque son versiones que todavía están en desarrollo. Solamente versiones finales. Por ejemplo 2.6.13.
* Como hemos seleccioonado un proyecto Maven tenemos que poner:
   * Group: **org.javaocio.test.springboot.app**
   * Artifict: **springboot_test**
   * Name: **springboot_test**
   * Description: **Demo project for Spring Boot**
   * Package name: **org.javaocio.test.springboot.app**
   * Packaging: **jar**
   * Version: 17
* Dependencias
   * Spring Web

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198375220-1d24e913-8c90-4d73-ab6e-f9dd71a43f3c.png">

<img width="696" alt="image" src="https://user-images.githubusercontent.com/23094588/198373795-f6b8c871-d8af-4816-88ca-a05c795bf822.png">

Como cualquier proyecto Maven, el grupo Heidy, se acuerdan el que hemos estado trabajando Orth punto. En mi caso a Guzmán Test le veo colocar punto todo junto. Spring Boot Punto App de aplicación en nombre proyecto te vas a colocar Spring Boot Test.

Con guión bajo test se fijan el ati fact Heidy Rainbow Test, que corresponde también al nombre proyecto, alguna descripción importante que le queramos dar en nombre del package de Yaba? Esta importante or punto a Guzmán a.3 springwood app esto acá le quitamos lo dejamos solamente en espiritud app. Lo dejamos ahí mismo que el grupo ITÍ. Bueno, no tiene por qué ser el mismo, pero lo dejamos de esa forma.

**Spring Boot** ya incluye un servidor Tomcat para aplicaciones web. Es decir, cuando trabajamos con Spring MVC, Spring Web, para aplicaciones Web con API REST, enfín lo que queramos ya se incluye un servidor Tomcat que para publicar nuestra aplicación HTTP en un puerto 8080 por defecto. Es decir, no necesitamos tener que instalar un servidor aparte, ya se incluye.

La versión de Java 19, 17, 11 y 8 siempre hasta el 8, porque es la clásica y la mínima con la cual podemos trabajar en SpringBoot, todavía se utiliza mucho en producción y lo mismo la 11, la 11 también se utiliza mucho en producción y es una versión con soporte a largo plazo. Si quisiera trabajar con la 13 o la 14 que no aparece, puedo seleccionar cualquiera la 11 o las 17 y después modificamos el XML con la versión deseada. Eso para que lo tenga claro.

El siguiente paso sería **Dependencias**. 

Vamos a trabajar con una aplicación Web, entonces vamos a agregar la dependencias **Spring Web** para construir Aplicaciones Web 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198374024-10e7dae9-761d-45af-b47a-102625930b1e.png">

incluye API REST, Spring MVC además incluye un servidor Tomcat Apache embebido dentro del contenedor de Spring, es decir, viene dentro del proyecto, que era justamente lo que explicaba anteriormente. 

Entonces se agrega Spring Web.

<img width="617" alt="image" src="https://user-images.githubusercontent.com/23094588/198375068-d9e12a11-15d1-447a-8ef2-1c0ba3f25b5b.png">

Por ahora nada más vamos a crear el proyecto, lo generamos, hacemos un clic en el botón **GENERATE**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198375603-25466f7f-bd2c-4bf4-aaf7-c4e6b19cc6c7.png">

Y se descarga, una vez que lo descargan, nos vamos a la carpeta del curso y lo descomprimimos la carpeta.

<img width="1227" alt="image" src="https://user-images.githubusercontent.com/23094588/198376275-6e60c50a-1864-43eb-bd35-f42334161b46.png">

Bien, lo siguiente nos vamos a **IntelliJ** y vamos a abrir el proyecto que acabamos de descomprimir.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198395025-ceab3656-3fac-4e96-9a39-677bafaff886.png">

Este proyecto Maven tiene el archivo **`pom.xml`** donde se encuentran todas las dependencias, la versiíon de Java que estamos usando, etc.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198398247-d52305c9-d26a-4d66-a65b-43b585eeef2f.png">

en este caso al crear el proyecto en **Spring Inizializer** solo añadimos una dependencia **Spring Web**

<img width="498" alt="image" src="https://user-images.githubusercontent.com/23094588/198395588-783d846f-d7d4-487f-9dfc-9a3548bc7621.png">

Pero como podemos ver en el **`pom.xml`** hay dos dependencias **`spring-boot-starter-web`** que es la que corresponde para **Spring Web**, pero también se ha incluido **`spring-boot-starter-test`** en esta dependecia se incluye **JUnit5** y **Mockito**


<img width="725" alt="image" src="https://user-images.githubusercontent.com/23094588/198399464-68bd76fc-dcef-4ac8-b9fa-44989071e187.png">


Vamos a ver la estructura del proyecto.

* Tenemos el **`pom.xml`**
* **`mvnw`** **`mvnw.cmd`** Estos archivos sirven para traja con Maven. De hecho integra Maven de forma automática. Es un grapar para Maven.
* **`src.main`** paquete para nuestro código
* **`src.test`** contexto para hacer nuestras Pruebas Unitarias., de hecho, ya trae una clase testing para empezar a trabajar. De hecho, si ejecutamos con click derecho tenemos **Run...**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198400882-bf6d3e05-e140-4239-a055-d17dabc4c5eb.png">

Va a ejecutar nuestra unitaria y le va a pasar porque en realidad no tiene nada.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198401046-f9389170-422a-4234-9663-311a1c6ea76f.png">

Sprint Boot es para desarrollar aplicaciones empresariales con API, red, aplicaciones web o escritorio o de consola, lo que queramos, Integración también con persistencia, con JPA, con Internet, un montón de cosas.

En **`src.main`** está todo nuestro código fuente. Acá está la clase principal de Spring.

<img width="1468" alt="image" src="https://user-images.githubusercontent.com/23094588/198401890-6919c594-fd52-4a04-9ef5-8cf0cdfe0bff.png">

Una clase con el método **`main`**. La clase se anota con **`@SpringBootApplication`**, que en el fondo configura todo. Toda la configuración de Spring Boot, maneja un contexto de inyección dependencia, podemos registrar beans, se pueden escanear componentes, scan de forma automática.

Tenemos también la carpeta **`resource`**  acá tenemos **`template`** donde tendremos plantillas, vistas, HTML y containers. Tenemos también **`static`** para archivos estáticos, de contenido estático como una aplicación Web, por ejemplo hoja de estilos, JavaScript, html estático, imágenes, todo lo que es FrontEnd.

Y finalmente tenemos el archivo **`application.properties`** donde podemos configurar nuestra aplicación, por ejemplo conexión a la Base de Datos y un montón de cosas.

## Creando las clases del modelo 10:31

Ok, continuamos creando nuestra aplicación de prueba en Sprint.

Vamos a continuar con las clases de modelo que serían nuestros datos de la aplicación.

Probablemente estén en la persistencia en alguna tabla de hace rato.

Así que lo vamos a representar con la clase, cuenta y banco.

Un ejemplo similar al que hemos visto, pero mucho más real, ya utilizando repositorio servis como

Akihito y por supuesto integrado con el framework.

Y después le vamos a agregar persistencia.

Es decir, vamos a probar ya en un contexto de base dato con integración.

Pero por ahora vamos a partir con lo que ya conocemos, con lo que manejábamos, con Yuni como Akito.

Así que nos vamos a package importante en Main Yaba.

Es importante que sea en Main y no en texto, porque acabamos de crear nuestro código en nuestra aplicación

y acá vamos a probar.

Entonces en nuestro package principal A y otro punto importante en Spring, me imagino que muchos ya

lo saben, pero para los que no saben este tema es que acá tenemos la clase principal.

Se acuerdan que esta anotada con Springwood?

Apliqué Schon y está dentro de un package principal.

Este sería el package raíz de nuestra aplicación y dentro сбербанк principal tenemos que tener todo

nuestro código, todas nuestras clases o sub package.

Es decir, todos los controladores, todos los servi, toda la clase models repositorio siempre tienen

que estar dentro de este package principal y eso se respeta.

No podemos crear una clase de Spring, una clase Java que esté fuera de este pacato, sino no lo va

a reconocer bien.

Un tema importante.

Entonces dentro Estepa Cazzo vamos a crear otro Pacaya New Package Models también otro más con Alt Insert

nos vamos a ir acá a package repositorios de repositorios.

También le podríamos colocar datos de Data Access Object.

Lo mismo vamos a crear otro más package.

Voy a quitar repositorios y vamos a crear los servicios para la clase de servicios que en el fondo hace

la clase.

Quedamos a probar y los repositorios van a ser nuestros mock y los mails.

Bueno, si de nuestras clases de TEÓ o Entity que representa los datos de la aplicación que probablemente

estén mapeado a tablas de la base datos se fijan bien con estos pacato nos vamos a ir a Models al INSER,

vamos a crear una clase, le vamos a llamar cuenta perfecto con atributos, vamos a tener el Heidy del

tipo long private long Heidy pues el tipo long o del tipo integer, pero ojalas que sea del tipo de

referencia de la clase rapper de Java con mayúscula.

Por eso puse mayúscula ni no primitivo.

El siguiente nombre la persona private string nombre o persona mejor

privé también bi decimal.

Saldo el saldo de la cuenta, lo siguiente vamos a crear constructores, entonces también con clic derecho

o con al insert constructor primero sin campo, sin nada.

Select nón.

Se fijan un conductor vacío, pero después vamos a crear un constructor con parámetros, con el Heidy,

con persona y con saldo.

Bien, lo siguiente sería lo lletra ctes.

Para todos seleccionamos los tres OK.

Ya casi tenemos nuestra cuenta.

Lo siguiente vamos a crear métodos especiales.

El recuas y el Ascot.

Y Quarts y gasco siguiente.

Con los tres atributos.

En el fondo, temeroso, muy importante para verificar, para validar si dos objetos son similares en

sus atributos, son iguales en sus atributos.

Típicamente cuando trabajamos con colecciones como listas, con los set, con los MAP y también con

persistencia, después con IBEN, con JPA, son métodos requeridos.

Importante siguiente.

Lo mismo acá no es todo, acá no es importante que sea para el asco y parali cuesta la tremas, el método

equals los 3 y el asco los 3.

Siguiente y finalizar acá no colocamos nada.

Vigen y ajja implementarlos equals y Alcott por nosotros.

En el fondo, para comprar valores, atributos en nuestros objetos, cuenta este caso bien lo siguiente

nos vamos a ir al Package Explorer, vamos a ir al Models, vamos a crear otro más ya class banco ok,

lo mismo Leydi del tipo lo Heidy.

Nombre del banco.

Y qué más podríamos tener un atributo del tipo entero.

Total transferencia que lleve una contabilidad de la cantidad.

Transferencia que se realizó en el banco de Veidt del tipo Integer.

Total transferencia.

Lo mismo.

Lo siguiente constructor.

Vacío.

Select nón después tenemos otro constructor con los campos los 3.

Y lo que tras Etter bien, pero antes dije tras setter vuestro un cambio en el tipo.

Total transferencia lo dejas de tipo primitivo solamente para que por defecto sea cero.

Y tampoco no vamos a necesitar los métodos de la clase Rapper Integer solamente para a cero para que

partan cero por defecto.

Acá cambiamos también acá.

Int.

Aunque en detalle, y luego con este cambio de transceptor.

Oden.

Ya tenemos una clase y tem. podremos tener el Ascot y el equals para Vanko, aunque no lo vamos a utilizar.

Pero bueno, para el ejemplo no es tan necesario, así que lo dejamos así.

Qué más tenemos en cuenta?

Vamos a crear un par de métodos control TAB.

Nos vamos a ir a cuenta y por acá unos métodos.

El método débito y el crédito débito es cuando nos restan cierta cantidad de dinero del saldo.

Es decir, cuando realizamos una transferencia a otra cuenta.

Y el crédito todo lo contrario.

Es cuando recibimos dinero de otra cuenta de una transferencia que nos hacen a nosotros.

Entonces.

Public void débito y public void crédito.

Partiríamos con débito.

Viven mal el monto bien y crédito.

Décima.

También monto.

Recuerden que V decimal e inmutable no es que tenga que invocar el método, por ejemplo, para sumar,

que es el método AB o para restar el método substrato.

No, porque lo que hace en cada operación aritmética o de cualquier tipo sobre este objeto, lo que

hace devolver una instancia y esa es la que vale, la original se mantiene tal cual, no se cambia,

no se modifica.

Entonces, por eso tenemos que volver a asignar este cambio al atributo saldo.

Entonces, por ejemplo, di saldo, punto, saldo, igual diez puntos, saldo también punto.

Cuando débito restamos entonces substrato sobre el monto se fijan y acá en crédito similar diez punto

saldo.

Ser el saldo o saldo.

Simplemente da lo mismo punto AB.

Para sumar sumamos el monto de origen bien crédito perfecto.

Solamente suma y no hay nada que validar.

Pero cuando restamos, cuando realizamos un depósito o transferencia a otra cuenta, necesitamos balear.

Claro, porque qué pasa si el monto es mayor a la cantidad de dinero que tenemos disponible en el saldo?

Debo manejar algún tipo de excepción y eso ya lo vimos y vamos a hacer más o menos lo mismo.

Entonces, bueno, lo primero es crear una excepción Exception personalizada en nuestro código.

Nos vamos a ir al Package Explorer.

Vamos a crear un nuevo pacatos solamente para organizar.

No tiene por qué ser así, pero es para organizar.

Vamos a crear un nuevo pacato que vamos a llamar except John's.

Decepciones y acá vamos a crear una nueva clase, la clase le vamos a llamar dinero suficiente septón.

Ok.

Stents Reineta Ranta.

Es hecho, vamos a implementar un constructor donce con al inser constructor que pase el mensaje.

Un mensaje personalizado.

Volvemos.

Tab Nos vamos a cuenta de regreso y valíamos en débito.

Nos vamos a débito.

Acá vamos a cambiar.

Vamos a quitar esto.

Quitábamos vamos a colocar bien décima.

Perfecto nuevo salvo validamos con un if nuevo saldo punto comparto.

Convives y Mercero?

Decimal punto cero.

Esto no lo explica porque ya lo vimos.

Pero básicamente, si quedamos con un saldo negativo menor que cero, entonces ahí lanzamos la acepción

después de restar, después de la transferencia.

Pero antes de realizar la transacción, es decir, el comit, por ejemplo, como si hicieran un commit

enlace atto.

Antes de eso, antes de asignar el nuevo saldo al salto a la cuenta valíamos.

Entonces es cierto, es menor que 0.

La samma la acepción con constru niu dineroy insuficiente exception.

Ya.

Y si todo está bien, hacemos el ComitÃ.

Es decir, 10 punto saldo le asignamos en un saldo.

Ya lo tenemos ahí tenemos nuestra lógica negocio en otros datos, la clase de modelo.

Falta acá un punto y coma.

Importante dinero insuficiente septón.

Acá estamos listos.

Bueno, lo dejamos así y continuamos en la siguiente clase con los repositorios, los servis, el resto

de nuestra aplicación.

## Creando los repositorios 05:34
## Implementando la clase de servicio (Service) 06:15
## Escribiendo nuestros tests con JUnit y mockito 11:40
## Test **`verify`** 05:31
## Escribiendo tests **`assertThrow`** para afirmar que la excepción lanzada sea correcta 12:21
## Escribiendo tests con **`assertSame`** 05:41
## Uso de anotaciones de spring **`@MockBean`** y **`@Autowired`** 04:46
## Introducción a la inyección de dependencia en Spring (Opcional) 10:09
## Deshabilitando la traza del logs de Spring en el contexto test 04:10
## Descargar Código Fuente 00:03
