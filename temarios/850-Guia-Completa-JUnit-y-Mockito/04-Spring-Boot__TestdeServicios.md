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


AQUIIIIIIIIIIII

Da lo mismo.

Acá tengo otro proyecto, pero no importa.

No se preocupen por eso.

Simplemente voy a pegar.

Esto es primum test y lo descomprimir.

Entonces con clic derecho y les comprime con cualquier herramienta que tengan extraer acá y acá.

Tengo put test nuestro proyecto con Spring put para traja context como Akito.

De hecho ya se incluye todas las herramientas, librerías o framework de Yuni de Mosquito para traja

con Springwood.

No se preocupen como digo de este proyecto, estos son de otro curso, así que no se preocupen.

Como que no existen.

No lo tomen en cuenta, lo que importa es primm potest.

Bien, lo siguiente nos vamos a intelige.

Lo tenemos tal como lo teníamos en la última clase.

Último video vamos a cerrar todo foil.

Cerrar proyecto.

Voy a expandir acá.

Bien, Adaptemos, Yuni, tenemos a moquitos, vamos a crear.

No, en realidad el proyecto ya lo tenemos creado, vamos a ADRID de proyecto, hacemos un clic en Open.

Nos vamos a cursos yaba o la carpeta que tengan.

Seleccionamos Plim but test proyecto OK.

Llegarle Colocábamos que es un proyecto confiable tras proyecto OK.

Se fijan y así simple, estamos trabajando Spring Put@ dentro de inteligir community.

Es decir, es la forma.

Creamos el proyecto de forma eterna en la página Start Spring.

Punto IO Spring inicial Heisler y listo.

Lo.

Lo que si nos vamos al POM.

Lo único que tengo que cambiar es la versión de Yaba.

Se acuerdan que seleccioné el once, pero en realidad tengo la 14 o la 15, creo.

Si la 15 no tengo, instala la última.

Pero bueno, un detalle.

Finalmente el curso funciona desde la 1 8 o la 8 hasta la 16 o la última del JDK.

Entonces, este paso importante, si no aparece el JDK cuando crean el proyecto acá lo modifican, colocan

la 15 o la que tengan instalada.

Acá tienen la dependencia Trim Buds Tater Web para atacar con aplicaciones web.

Después en el curso.

En esta sección vamos a atajar también con otras herramientas otra librería para testing en Spring,

pero hoy lo vamos a ver después adelante.

Por ahora vamos a atacar con Yuni, como quito lo que hemos visto, pero integrado con Spring.

De hecho, ni siquiera necesitamos agregar ninguna librería, ninguna dependencia, porque todo se incluye,

todo está automatizado dentro de Spring Put@ es la gran ventaja que tiene lo siguiente importante hacer

un clic acá para cargar los cambios de Maven.

Como siempre, un clic.

Para que se descargue todo lo que se tenga que cargar.

Lo que no se descargó.

Estamos listos.

Acá tenemos esa receté main yaba.

En fin, nuestra estructura del proyecto con Spring, como expliqué al principio, es recomendable que

tengan una base de Spring.

Sería lo ideal, sino, como digo, igual pueden hacer esta sección, van a aprender y después profundizan

de esta forma rápidamente.

Porque yo sé, me imagino que muchos ya lo saben.

Vamos a ver la estructura del proyecto.

Acá tenemos el POM.

Ya lo vimos.

Acá tenemos archivo para traja con Maven.

De hecho integra Maven de forma automática.

Es un grapar para Maven.

Acá tenemos el S.

Recé.

Mayne y el contexto?

Test Hakata Todo nuestro contexto, de hecho, ya trae una clase testing para empezar a trabajar.

Se fijan spero input test.

De hecho, si ejecutamos con click derecho tenemos rrán.

Va a ejecutar nuestra unitaria y le va a pasar porque en realidad no tiene nada.

Se fijan todo bien.

Test result CONTEX Lott Bueno, no tiene nada, pero sólo pasa.

Llega hasta la consola y todo el log de sprint de sprint.

Cuando arranca.

Bueno, Sprint es para desarrollar aplicaciones empresariales con API, red, aplicaciones web o escritorio

o de consola, lo que queramos.

Integración también con persistencia, con JPA, con Internet, un montón de cosas.

Bueno, acá tiene todo lo que es test, pero en Main está todo nuestro código fuente.

Acá está la clase principal de Spring Put@ es una clase con el método Main se fijan.

Acá se configura todo y trae una anotación Springwood Ketcham, que en el fondo configura todo.

Todo lo que auto configuración de Spring Boot maneja un contexto de inyección dependencia.

Acá podemos registrar beans.

De hecho, se pueden escanear componen scan de forma automática.

Se van a leer.

Va a buscar en nuestro proyecto cierta clase con ciertas anotaciones como los servis, como los controller,

como los repository y los beans o component y lo va a registrar de forma automática en el contenedor

y después lo podemos inyectar en otro componente.

Inyección de dependencia en el fondo Spring Framework Spring Boot es muy amplio.

Me es imposible ver todo esto en este curso, así que nos vamos a enfocar a todo lo que puedas.

Unitaria a tste y en Resource acá tenemos.

Bueno para plantillas vistas HTML y Trojan con Tinduf archivo estáticos de contenido estático como una

aplicación web, por ejemplo hoja de estilos JavaScript, html estático, imágenes.

Todo lo que es frontend llega.

Tenemos el properties.

Acá podemos configurar nuestra aplicación, por ejemplo conexión en esa base de datos y un montón de

cosas.

Creo que ya me pandeo mucho.

Vamos a cerrar acá nuestra clase principal todo que auto configuración anotaciones el escán para registrar

los beans.

De hecho, en este curso también vamos a trabajar con eso, con inyección, dependencia o componente

con service, claro, porque vamos a crear una aplicación y vamos a probar.

Cerramos.

Y esta es la que más abierta y el POM lo podemos cerrar por ahora.

La siguiente clase vamos a comenzar con crear nuestra aplicación el models, el servis, los repositorios

para cuenta, para banco.

En fin, lo dejamos así y nos vemos en la siguiente clase.


## Creando las clases del modelo 10:31
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
