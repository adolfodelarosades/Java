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

Entonces nos vamos a ir a una página que es propia del equipo de Spring https://start.spring.io/. Esta página permite crear un proyecto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198337175-a2b0fda2-2bb8-4e18-bc58-cc405c16f5c5.png">

Esta página permite crear un proyecto Spring. Vamos a seleccionar las siguientes opciones:

* Maven
* Lenguaje Java
* La última versión estable hasta la fecha 2.7.5. Seleccionamos esa o la última, que NO diga SNAPSHOP, ni tampoco RC1 porque son versiones que todavía están en desarrollo. Solamente versiones finales. Por ejemplo 2.6.13.
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

**Spring Boot** ya incluye un servidor Tomcat para Aplicaciones Web. Es decir, cuando trabajamos con Spring MVC, Spring Web, para aplicaciones Web con API REST, enfín lo que queramos ya se incluye un servidor Tomcat que para publicar nuestra aplicación HTTP en un puerto 8080 por defecto. Es decir, no necesitamos tener que instalar un servidor aparte, ya se incluye.

La versión de Java 19, 17, 11 y 8 siempre hasta el 8, porque es la clásica y la mínima con la cual podemos trabajar en SpringBoot, todavía se utiliza mucho en producción y lo mismo la 11, la 11 también se utiliza mucho en producción y es una versión con soporte a largo plazo. Si quisiera trabajar con la 13 o la 14 que no aparece, puedo seleccionar cualquiera la 11 o las 17 y después modificamos el XML con la versión deseada, eso para que lo tenga claro.

El siguiente paso sería **Dependencias**. 

Vamos a trabajar con una aplicación Web, entonces vamos a agregar la dependencias **Spring Web** para construir Aplicaciones Web 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198374024-10e7dae9-761d-45af-b47a-102625930b1e.png">

incluye API REST, Spring MVC además incluye un servidor Tomcat Apache embebido dentro del contenedor de Spring, es decir, viene dentro del proyecto, que era justamente lo que explicaba anteriormente. 

Entonces se agrega Spring Web.

<img width="617" alt="image" src="https://user-images.githubusercontent.com/23094588/198375068-d9e12a11-15d1-447a-8ef2-1c0ba3f25b5b.png">

Por ahora nada más vamos a crear el proyecto, lo generamos, hacemos un clic en el botón **GENERATE**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198375603-25466f7f-bd2c-4bf4-aaf7-c4e6b19cc6c7.png">

Y se descarga, una vez que lo descargan, nos vamos a la carpeta del curso y descomprimimos la carpeta.

<img width="1227" alt="image" src="https://user-images.githubusercontent.com/23094588/198376275-6e60c50a-1864-43eb-bd35-f42334161b46.png">

Bien, lo siguiente nos vamos a **IntelliJ** y vamos a abrir el proyecto que acabamos de descomprimir, el proyecto ya esta creado por eso simplemente lo abrimos. Si nos pregunta indicamos que es un Proyecto Seguro **Trust Project**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198395025-ceab3656-3fac-4e96-9a39-677bafaff886.png">

Este proyecto Maven tiene el archivo **`pom.xml`** donde se encuentran todas las dependencias, la versión de Java que estamos usando, etc. Recordemos que si la versión de Java no es la correcta aquí la podemos modificar, en este caso esta correcta la versión 17.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198398247-d52305c9-d26a-4d66-a65b-43b585eeef2f.png">

en este caso al crear el proyecto en **Spring Inizializer** solo añadimos una dependencia **Spring Web**

<img width="498" alt="image" src="https://user-images.githubusercontent.com/23094588/198395588-783d846f-d7d4-487f-9dfc-9a3548bc7621.png">

pero como podemos ver en el **`pom.xml`** hay dos dependencias **`spring-boot-starter-web`** que es la que corresponde para **Spring Web**, pero también se ha incluido **`spring-boot-starter-test`** en esta dependecia se incluye **JUnit5** y **Mockito**

<img width="725" alt="image" src="https://user-images.githubusercontent.com/23094588/198399464-68bd76fc-dcef-4ac8-b9fa-44989071e187.png">

Vamos a ver la estructura del proyecto.

* Tenemos el **`pom.xml`**
* **`mvnw`** **`mvnw.cmd`** estos archivos sirven para traja con Maven, de hecho integra Maven de forma automática. Es un wrapper para Maven.
* **`src.main`** paquete para nuestro código
* **`src.test`** contexto para hacer nuestras Pruebas Unitarias., de hecho, ya trae una clase testing para empezar a trabajar. De hecho, si ejecutamos con click derecho tenemos **Run...**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198400882-bf6d3e05-e140-4239-a055-d17dabc4c5eb.png">

Va a ejecutar nuestra unitaria y le va a pasar porque en realidad no tiene nada.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/198401046-f9389170-422a-4234-9663-311a1c6ea76f.png">

Sprint Boot es para desarrollar aplicaciones empresariales con API, red, aplicaciones web o escritorio o de consola, lo que queramos, Integración también con persistencia, con JPA, con Hibernate, un montón de cosas.

En **`src.main`** está todo nuestro código fuente. 

<img width="1468" alt="image" src="https://user-images.githubusercontent.com/23094588/198401890-6919c594-fd52-4a04-9ef5-8cf0cdfe0bff.png">

Tenemos nuestra clase principal de Spring **`SpringbootTestApplication`**. Una clase con el método **`main`**. La clase se anota con **`@SpringBootApplication`**, que en el fondo configura todo. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199240638-855d971f-4d4b-488b-ab95-3310f496ff1a.png">

Toda la configuración de Spring Boot, maneja un ***Contexto de Inyección Dependencia***, podemos registrar ***Beans***, se pueden ***escanear componentes*** con la anotación **`@ComponentScan`**, de forma automática va a buscar en nuestro proyecto ciertas clases con ciertas anotaciones como los **`Services`**, los **`Controllers`**, los **`Repository`** y los **`Beans`** o **`Components`** y los va a registrar de forma automática en el Contenedor y después los podemos *Inyectar* en otros otros Componentes, lo que se conoce como ***Inyección Dependencia***.

Tenemos también la carpeta **`resource`**  tenemos **`template`** donde tendremos plantillas, vistas, HTML y containers. Tenemos también **`static`** para archivos estáticos, de contenido estático como una aplicación Web, por ejemplo hoja de estilos, JavaScript, html estático, imágenes, todo lo que es FrontEnd.

Y finalmente tenemos el archivo **`application.properties`** donde podemos configurar nuestra aplicación, por ejemplo conexión a la Base de Datos y un montón de cosas.

## Creando las clases del modelo 10:31

Ok, continuamos creando nuestra aplicación de prueba en Spring.

Vamos a continuar con las **Clases de Modelo** que serían nuestros datos de la aplicación. Probablemente estén en la persistencia, en alguna tabla de la BD. Así que lo vamos a representar con las clases **`Cuenta`** y **`Banco`**. Un ejemplo similar al que hemos visto, pero mucho más real, utilizando Repositorios, Services, integrado con Mockito todo en el Framework de Spring y después le vamos a agregar ***Persistencia*** es decir, vamos a probar ya en un contexto de Base Dato con integración.

Pero por ahora vamos a partir con lo que ya conocemos, con lo que manejábamos, con JUnit con Mockito.

Recordemos que tenemos el paquete principal **`org.javaocio.test.springboot.app`** el cual también se le conoce como **Paquete Raíz** y es donde tenemos ubicada nuestra clase principal **`SpringbootTestApplication`**. 

***Dentro de este Package Principal tenemos que tener todo nuestro código, todas nuestras clases o sub packages, es decir, todos los controladores, todos los servicios, toda la clases de modelo, repositorio siempre tienen que estar dentro de este package principal y eso se respeta***. No podemos crear una clase de Spring, una clase Java que esté fuera de este package, sino no lo va a reconocer bien. Un tema importante.

Entonces dentro del package **`org.javaocio.test.springboot.app`** vamos a crear los siguientes tres packages:

* **`org.javaocio.test.springboot.app.models`**, Los **`models`** van a ser nuestras clases DTO o Entity que representan los datos de la aplicación, que probablemente esten mapeados a tablas de la BD.
* **`org.javaocio.test.springboot.app.repositories`** para los Repositorios este package también lo podemos llamar **`org.javaocio.test.springboot.app.daos`** de Data Access Object. Los **`repositories`** van a ser nuestros MOCK.
* **`org.javaocio.test.springboot.app.services`**, las clases que coloquemos aquí son las clases que en el fondo vamos a probar.

<img width="374" alt="image" src="https://user-images.githubusercontent.com/23094588/199247093-318ede3d-a5eb-4b08-a5d6-dadcb4f59a7a.png">

### Crear clase **`Cuenta`**

Dentro del package **`org.javaocio.test.springboot.app.models`** vamos a crear la clase **`Cuenta`**, la cual va a contener:

* Atributos
* Constructor vacio
* Contructor con todos los atributos
* Métodos Setters y Getters
* Método Especiales
   * Método **`equals()`** 
   * Método **`hashCode()`**

   <img width="294" alt="image" src="https://user-images.githubusercontent.com/23094588/199249328-771fff3f-5ce3-4c64-bdb4-acd30cfc11d6.png">

   <img width="478" alt="image" src="https://user-images.githubusercontent.com/23094588/199249646-5e43dd0c-e8f1-4e69-af63-c97c0fe2be43.png">

   <img width="471" alt="image" src="https://user-images.githubusercontent.com/23094588/199249985-4266154e-1697-41c9-a6f4-58546df2a762.png">

   <img width="472" alt="image" src="https://user-images.githubusercontent.com/23094588/199250232-b2d20032-cdf5-4bd1-b7aa-e972f1d4884c.png">

  <img width="472" alt="image" src="https://user-images.githubusercontent.com/23094588/199250344-7910a1f3-626c-492f-bbd9-a717ff2fee07.png">

Estos métodos son muy importante para verificar, para validar si dos objetos son similares en sus atributos, son iguales en sus atributos. Típicamente cuando trabajamos con colecciones como ***listas***, con los ***set***, con los ***map*** y también con ***persistencia***, después con ***Hibernate***, con ***JPA***, son métodos requeridos.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199251931-998a67f6-00f2-40f1-8820-4ea33e8ac939.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199252082-9651bee9-d9a2-43d7-86c6-b450c36c04be.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199252201-88cf31fa-ad37-4ab7-a0ee-a8d32940090e.png">


```java
package org.javaocio.test.springboot.app.models;

import java.math.BigDecimal;
import java.util.Objects;

public class Cuenta {
    private Long id;
    private String persona;
    private BigDecimal saldo;

    public Cuenta() {
    }

    public Cuenta(Long id, String persona, BigDecimal saldo) {
        this.id = id;
        this.persona = persona;
        this.saldo = saldo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public BigDecimal getSaldo() {
        return saldo;
    }

    public void setSaldo(BigDecimal saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cuenta cuenta = (Cuenta) o;
        return Objects.equals(id, cuenta.id) && Objects.equals(persona, cuenta.persona) && Objects.equals(saldo, cuenta.saldo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, persona, saldo);
    }
}
```

### Crear clase **`Banco`**

Dentro del package **`org.javaocio.test.springboot.app.models`** vamos a crear la clase **`Banco`**, la cual va a contener:

* Atributos
* Constructor vacio
* Contructor con todos los atributos
* Métodos Setters y Getters

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199300101-bf9f1807-1f2e-4b03-a18b-46403ea8929d.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199300204-40695854-af07-43d9-8182-cdee0220ef7b.png">

```java
package org.javaocio.test.springboot.app.models;

public class Banco {
    private Long id;
    private String nombre;
    private int totalTransferencia;

    public Banco() {
    }

    public Banco(Long id, String nombre, int totalTransferencia) {
        this.id = id;
        this.nombre = nombre;
        this.totalTransferencia = totalTransferencia;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTotalTransferencia() {
        return totalTransferencia;
    }

    public void setTotalTransferencia(int totalTransferencia) {
        this.totalTransferencia = totalTransferencia;
    }
}
```

El atributo **`totalTransferencias`** le hemos puesto de tipo **`int`**, de tipo primitivo solamente para que por defecto sea cero. 

En esta clase no vamos a necesitar los métodos **`equals()`**  y **`hashCode()`**, para el ejemplo no es tan necesario, así que lo dejamos así. 

### Añadir métodos **`debito`** y **`credito`** en **`Cuenta`**

Vamos a crear un par de métodos en la clase **`Cuenta`** los métodos **`debito`** y **`credito`**. El método débito es cuando nos restan cierta cantidad de dinero del saldo. Es decir, cuando realizamos una transferencia a otra cuenta. Y el crédito todo lo contrario. Es cuando recibimos dinero de otra cuenta de una transferencia que nos hacen a nosotros.

Una primera versión de estos métodos puede ser la siguiente:

```java
    public void debito(BigDecimal monto) {
        this.saldo = this.saldo.subtract(monto);
    }

    public void credito(BigDecimal monto) {
        this.saldo = this.saldo.add(monto);
    }
```

Recuerden que **`BigDecimal`** es **inmutable**, porque lo que en cada operación aritmética o de cualquier tipo sobre este objeto, lo que hace devolver una instancia y esa es la que vale, la original se mantiene tal cual, no se cambia, no se modifica. Entonces, por eso tenemos que volver a asignar este cambio al atributo saldo.

Pero cuando restamos, cuando realizamos un depósito o transferencia a otra cuenta necesitamos validar, porque ¿Qué pasa si el monto es mayor a la cantidad de dinero que tenemos disponible en el saldo?

Debo manejar algún tipo de excepción y eso ya lo vimos y vamos a hacer más o menos lo mismo. Entonces, bueno, lo primero es crear una excepción personalizada en nuestro código.

Vamos a crear un nuevo Package solamente para organizar. No tiene por qué ser así, pero es para organizar. Vamos a crear un nuevo Package que vamos a llamar **`org.javaocio.test.springboot.app.exceptions`** y vamos a crear una nueva clase, la clase la vamos a llamar **`DineroInsuficienteException`**. Esta clase extendera de **`RuntimeException`** y vamos a implementarle un **`constructor`** al que se le pase un mensaje personalizado.

<img width="773" alt="image" src="https://user-images.githubusercontent.com/23094588/199304596-7655015a-fb99-4308-bb4a-8d0ad2e7cb9c.png">

La clase nos queda así:

<img width="1119" alt="image" src="https://user-images.githubusercontent.com/23094588/199304943-884676b8-6714-4de5-828a-ffb96f0dfb3a.png">


```java
package org.javaocio.test.springboot.app.exceptions;

public class DineroInsuficienteException extends RuntimeException{
    public DineroInsuficienteException(String message) {
        super(message);
    }
}
```

Nos vamos a **`Cuenta`** de regreso y vamos al método de débito donde vamos a hacer una modificación para que maneje la excepción en caso de que se obtenga un saldo negativo cuando intentamos hacer una transferencia.

```java
   public void debito(BigDecimal monto) {
      BigDecimal nuevoSaldo = this.saldo.subtract(monto);
      if (nuevoSaldo.compareTo(BigDecimal.ZERO) < 0){
         throw new DineroInsuficienteException("Dinero insuficiente en la cuenta.");
      }
      this.saldo = nuevoSaldo;
    }
```
Lo que hemos hecho es almacenar temporalmente el **`nuevoSaldo`** después de restar, pero antes de realizar la transacción, para poder saber si este es negativo, en tal caso lanzamos la excepción de lo contrario será nuestro nuevo saldo, por lo que hacemos una especie de "commit" asignando el **`nuevoSaldo`** al **`saldo`**.

Ya lo tenemos ahí tenemos nuestra lógica negocio en nuestros datos, la clase de modelo.

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
