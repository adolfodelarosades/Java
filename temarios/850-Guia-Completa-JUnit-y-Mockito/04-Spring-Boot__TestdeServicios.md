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

Bien, continuamos con los repositorios de **`Cuenta`** y **`Banco`**, típicamente para implementar un CRUD, por ejemplo, leer, obtener por ID, obtener todos y también para guardar, modificar, eliminar.

En el package de los repositorios vamos a crear una **Interfaz** que vamos a llamar **`CuentaRepository`** 

<img width="337" alt="image" src="https://user-images.githubusercontent.com/23094588/199315892-4fe0b7b7-3bf8-4f6d-873c-07822a33abf0.png">

con algún métodos el CRUD, por ejemplo, para obtener todas las cuentas. Vamos a utilizar nombres en inglés porque se utilizan por defecto y por convención en Spring Boot cuando implementamos nuestros repositorios mediante componentes Spring Data JPA.
En el package de los repositorios vamos a crear una **Interfaz** que vamos a llamar **`CuentaRepository`** con algún métodos el CRUD, por ejemplo, para obtener todas las cuentas. Vamos a utilizar nombres en inglés porque se utilizan por defecto y por convención en Spring Boot cuando implementamos nuestros repositorios mediante componentes Spring Data JPA.

También vamos a tener un método para obtener por ID. Otro método para actualizar **`update`**, típicamente se utiliza el método **`save`** tanto para insertar para crear un nuevo registro o también para actualizar. Entonces se utiliza **`save`** para ambos para insertar y actualizar. Pero para este ejemplo para que quede un poco más claro vamos a usar **`update`**.

<img width="733" alt="image" src="https://user-images.githubusercontent.com/23094588/199316559-f6aea795-d339-4ddd-a717-57bdfe3ce95a.png">

Ya tenemos el repositorio de **`Cuenta`**. Recuerden que después en nuestras Prueba Unitarias estos métodos van a ser Mock, los vamos a simular con datos de ejemplo, es decir, no se invoca, no van a realizar llamadas reales a una clase de un objeto, una instancia de repositorio que acceda y opere con los datos de una tabla. No solamente lo vamos a simular, lo dejamos así y continuamos con el siguiente repositorio.

Entonces nos vamos al paquete, vamos a crear otro Interfaz **`BancoRepository`** usando la la misma mecánica. 

<img width="693" alt="image" src="https://user-images.githubusercontent.com/23094588/199317867-32c4e5ff-5ca8-42b6-b6e7-31d6826717f4.png">

## Implementando la clase de servicio (Service) 06:15

Ahora vamos a crear las Interfaz del servicio **`Cuenta`** que llamaremos **`CuentaService`**.

<img width="1146" alt="image" src="https://user-images.githubusercontent.com/23094588/199319149-b4f995e8-036e-41f1-93b2-46499b905d73.png">

Ahora vamos a crear la clase que implemente la Interfaz **`CuentaService`** que llamaremos **`CuentaServiceImpl`**.

<img width="338" alt="image" src="https://user-images.githubusercontent.com/23094588/199320348-35d77494-2351-4807-ab5a-4b925a907a60.png">

<img width="1161" alt="image" src="https://user-images.githubusercontent.com/23094588/199320621-a334a450-6f55-4eee-b7ba-8b3285fcf863.png">

Nos apoyamos de las ventajas del IDE para implementar los métodos pulsando ALT + ENTER.

<img width="389" alt="image" src="https://user-images.githubusercontent.com/23094588/199320829-50363599-6a99-4a7d-916a-ea091a203867.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199320980-3995a5b8-548d-487e-8995-4c1fa61fcf08.png">

Ya tenemos el esqueleto de los métodos pero falta que los implementemos según nuestras necesidades, para lo cual vamos a necesitamos Dependencias que serían nuestros Repositorios. Recuerden que el Service siempre trabaja, opera con otros objetos de la Lógica Negocio que son los que acceden a los datos, típicamente los Repositories y los DAOs con consultas de cualquier tipo.

<img width="824" alt="image" src="https://user-images.githubusercontent.com/23094588/199322079-9a9a27c4-5cf8-45d0-876d-36c87cc3b009.png">

Y para que después se puedan inyectar de forma automática vía Mockito, vamos a implementar el constructor para  ambas Dependencia.

<img width="394" alt="image" src="https://user-images.githubusercontent.com/23094588/199322677-7e7eb75f-2654-40e7-9559-0209dc7a0b82.png">

<img width="1497" alt="image" src="https://user-images.githubusercontent.com/23094588/199322762-5a08fa3c-60f1-45b2-a999-8bb9cafd17bd.png">

Una vez hecho esto vamos a modificar el método **`findById`** quitamos el  **`null`** y lo dejamos que vamos es interactuar con **`cuentaRepository`** para recuperar una Cuenta por Id.

<img width="608" alt="image" src="https://user-images.githubusercontent.com/23094588/199323413-71906aea-f6b5-4636-82f5-e3144ef7e170.png">

Ahora vamos con el método **`revisarTotalTransferencias`**.

Lo primero que vamos a hacer es recuperar el Banco por ID y una vez hecho esto retornamos el total de transferencias.

<img width="762" alt="image" src="https://user-images.githubusercontent.com/23094588/199324523-9cd6811f-cb4e-4ff2-b0d0-18fa3565c758.png">

Ahora vamos con el método **`revisarSaldo`**.

La revisión del Saldo la vamos a hacer através de la **`Cuenta`**.

<img width="787" alt="image" src="https://user-images.githubusercontent.com/23094588/199325183-5a342c66-bb8b-489d-a042-0193e5b24b48.png">

Finalmente vamos a ver el método **`transferir`**.

Y acá necesitamos diferentes cosas. Primero, cada que se realiza la transferencia tenemos que actualizar el total de transferencia. Por lo tanto tenemos que actualizar el objeto **`Banco`** con una nueva transferencia y lo primero que vamos hacer, entonces primero incrementamos el número total de transferencia del banco.

Lo siguiente será realizar la trasferencia, es decir, a la Cuenta Origen restarle el Monto y actualizar la Cuenta Origen y la Cuenta Destino.

<img width="1181" alt="image" src="https://user-images.githubusercontent.com/23094588/199327444-9c5a4de5-6b50-4679-aece-a9770d076e35.png">

Viendo que estamos poniendo el **`Banco banco = bancoRepository.findById(1L);`**, es decir estamos HARDCODEANDO el valor del ID del Banco, realizaremos una pequeña modificación es decir, vamos a pasar ese valor como otro atributo del método.

<img width="1094" alt="image" src="https://user-images.githubusercontent.com/23094588/199331079-1210b658-b2b6-4657-8079-974cc76eefe0.png">

Como hemos modificado la firma del método, debemos modificar la Interfaz para añadir este mismo argumento.

<img width="1304" alt="image" src="https://user-images.githubusercontent.com/23094588/199331485-58465881-19ed-4255-9232-9627165ec0e9.png">


La clase completa **`CuentaServiceImpl`** es la siguiente:

```java
package org.javaocio.test.springboot.app.services;

import org.javaocio.test.springboot.app.models.Banco;
import org.javaocio.test.springboot.app.models.Cuenta;
import org.javaocio.test.springboot.app.repositories.BancoRepository;
import org.javaocio.test.springboot.app.repositories.CuentaRepository;

import java.math.BigDecimal;

public class CuentaServiceImpl implements CuentaService{

    private CuentaRepository cuentaRepository;
    private BancoRepository bancoRepository;

    public CuentaServiceImpl(CuentaRepository cuentaRepository, BancoRepository bancoRepository) {
        this.cuentaRepository = cuentaRepository;
        this.bancoRepository = bancoRepository;
    }

    @Override
    public Cuenta findById(Long id) {
        return cuentaRepository.findById(id);
    }

    @Override
    public int revisarTotalTransferencias(Long bancoId) {

        Banco banco = bancoRepository.findById(bancoId);
        return banco.getTotalTransferencia();

    }

    @Override
    public BigDecimal revisarSaldo(Long cuentaId) {

        Cuenta cuenta = cuentaRepository.findById(cuentaId);
        return cuenta.getSaldo();

    }

    @Override
    public void transferir(Long numCuentaOrigen, Long numCuentaDestino, BigDecimal monto,
                           Long bancoId) {

        Banco banco = bancoRepository.findById(bancoId);
        int totalTransferencias = banco.getTotalTransferencia();
        banco.setTotalTransferencia(++totalTransferencias);
        bancoRepository.update(banco);

        Cuenta cuentaOrigen = cuentaRepository.findById(numCuentaOrigen);
        cuentaOrigen.debito(monto);
        cuentaRepository.update(cuentaOrigen);

        Cuenta cuentaDestino = cuentaRepository.findById(numCuentaDestino);
        cuentaDestino.credito(monto);
        cuentaRepository.update(cuentaDestino);
        
    }
}
```

## Escribiendo nuestros tests con JUnit y Mockito 11:40

El siguiente paso sería comenzar con las Pruebas Unitarias con JUnit, así que nos tenemos que ir a nuestra clase de test **`SpringbootTestApplicationTests`** la cual se creo de forma automática. Recuerden que se encuentra dentro de **`test`** en lugar de **`main`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199940576-559fd79e-3bd2-4594-8245-aab3145b423f.png">


Antes que nada necesitamos datos de ejemplo por lo que en **`main`** vamos a crear una clase llamada **`Datos`**, con el siguiente código:

<img width="1489" alt="image" src="https://user-images.githubusercontent.com/23094588/199943406-e18ae02a-4e89-4b12-987f-33a43281863f.png">

<img width="1468" alt="image" src="https://user-images.githubusercontent.com/23094588/199945067-bc76d348-9797-4e27-82a9-069874ee2527.png">

Ahora que tenemos los datos de ejemplo, continuamos con la clase **`SpringbootTestApplicationTests`**  para poder integrar JUnit.

Entonces lo primero vamos a crear son dos atributos, nuestros mock y también nuestro service.

```java
  CuentaRepository cuentaRepository;
	BancoRepository bancoRepository;
	
	CuentaService service;
```

Ahí tenemos los atributos que vamos a utilizar.

Vamos a crear otro método ademas del **`contextLoads()`** que se creo automáticamente.

<img width="284" alt="image" src="https://user-images.githubusercontent.com/23094588/199946930-58407d9e-b2c5-48ff-95c8-9aaa2c958622.png">

Nuestro método **`setUp()`**

<img width="188" alt="image" src="https://user-images.githubusercontent.com/23094588/199947312-1298be27-5895-4d85-93a2-a407fea34f37.png">

Por cada método vamos a definir nuestro mock y la instancia del service.

<img width="409" alt="image" src="https://user-images.githubusercontent.com/23094588/199947880-1e7a9be8-d8b3-4766-b8e4-20865c5d4783.png">

Al insertar lo anterior nos inserta **`import org.mockito.Mockito;`** pero esto lo queremos utilizar de manera estatica por lo que lo vamos a cambiar a **`import static org.mockito.Mockito.*;`** y por organización lo movemos arriba.

<img width="1021" alt="image" src="https://user-images.githubusercontent.com/23094588/199949476-f40468ed-b8c9-47e5-a83d-524ccc143cd5.png">

Continuamos, ahora lo correcto sería:

<img width="731" alt="image" src="https://user-images.githubusercontent.com/23094588/199949664-e054463e-f6b8-49f9-8af3-d39eb613c96e.png">

<img width="999" alt="image" src="https://user-images.githubusercontent.com/23094588/199950201-7c37e06e-117d-44e1-b706-0f7838c34268.png">


Ya tenemos nuestros mocks y nuestro service que vamos a probar. Estamos listos, ahí podemos empezar a probar. Entonces lo primero con el **`when`** esto lo haremos en el método **`contextLoads()`**.

<img width="999" alt="image" src="https://user-images.githubusercontent.com/23094588/199954309-8b8102f9-513a-48f2-8cc5-9003ffcc4b21.png">

Lo que le estamos diciendo es que si buscamos la **`Cuenta`** con **`Id=1`** nos debe retornar **`CUENTA_001`** y así con los demás **`when`**. Con esto ya tenemos todo nuestro contexto configurado que sería nuestro Given dado a algún contexto.

Ahora lo que vamos a hacer es invocar el **`revisarSaldo(...)`** del servicio en cada cuenta, recordemos que **`revisarSaldo(...)`** regresa un **`BigDecimal`**.

<img width="903" alt="image" src="https://user-images.githubusercontent.com/23094588/199957415-5830ff5c-69a0-42a1-b47d-48546887731c.png">

Vamos a probar cómo están los saldos con el **`assertEquals();`** el cual tenemos que importar de forma estática. Presionamos ALT + ENTER para importarlo.

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/199958421-78cb1c90-3459-4394-b1ee-49c3a6e4567f.png">

<img width="1018" alt="image" src="https://user-images.githubusercontent.com/23094588/199958668-0b37392b-2c84-453b-b8d6-a0b3f1d4a6bf.png">

Vamos a cambiar **`assertEquals`** por un **`*`** para que importe todos los métodos no solo el **`assertEquals`**.

<img width="1019" alt="image" src="https://user-images.githubusercontent.com/23094588/199958897-2416a540-a765-4a9e-a0cc-86dd6667fac0.png">

Vamos a probar también el saldo de la otra cuenta, el método completo queda así:

<img width="923" alt="image" src="https://user-images.githubusercontent.com/23094588/199962943-fb857647-7610-425a-99b0-cbefcb471e87.png">

Vamos a ejecutar este método de prueba.

<img width="997" alt="image" src="https://user-images.githubusercontent.com/23094588/199963539-70021194-ad8f-456b-85ca-1039939d9dd7.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199964066-70b744cd-5609-4878-a70f-8d6f6a8c519b.png">

Observemos que al ejecutar la prueba nos falla y eso es por que en ambos **`when`** de la cuenta hemos puesto **`CUENTA_001`** vamos a corregirlo y a ejecutar nuevamente.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/199964663-1fe9c843-414b-41b6-a102-2b48856412c5.png">

Debería pasar está todo bien, de momento, ningún problema. Continuamos.

Ahora vamos a invocar otro método del service, que sería el de transferir. Ya probamos **`revisarSaldo(...)`** de cada cuenta.

Ahora realizamos transferencias en el service con el método **`transferir(...)`**.


<img width="1323" alt="image" src="https://user-images.githubusercontent.com/23094588/199966244-19050738-b7fb-4d42-9a12-3a28cc233660.png">


Punto.

Transferir acá número cuenta orijen l 1 l cierto número cuenta destino 2 l que corresponden a Leidy.

El monto que vamos a transferir un bit decimal new bit decimal vamos a transferir 100 y le agregamos

también acá como parámetro el Eddi del banco 1.

Entonces para resumir acá tenemos el Heidy 1 que corresponde a cuenta cero cero uno.

Acá tenemos el Heidy 2 que corresponde a la cuenta 0 0 2.

Destino.

Esta es la de origen destino.

El monto que va a transferir y el banco.

Eso sería.

Ahora tengo que volver a revisar el saldo y volver a probar.

De hecho, sería esto mismo.

Incluso podríamos subir acá.

Los seleccionamos, lo copiamos, bajamos y pegamos, pero quitamos esto, quitamos los tipos de acá.

También quitamos el tipo.

Entonces tenemos al origen y el destino.

Vamos a bajar y volvemos a probar con hacer equals.

En cuanto quedó el saldo en cada cuenta.

Después de realizar esa transferencia, entonces a ser iguales.

Vamos a decir que en la cuenta Orijen quedó €900, justamente porque le restamos 100.

Entonces mil ahora debiese ser 900.

Es el esperado 900 y el real.

Vamos a ver.

Saldo.

Origen, punto.

Plain string.

Perdón.

Acá puse saldo destinÃ y es saldo Orijen ese saldo origen.

Ahora vamos a duplicar controlde.

Acá sería saldo destino y acá debiese ser mil 100.

Perdón, 2100 2100.

Claro, porque 2000.

Si revisamos los datos nos vamos a datos.

Acá Andrés tiene 1000, le restamos 100.

Diría que el 900.

John tiene dos mil.

Le sumamos 100.

Debería quedar en 2100.

Eso es lo que vamos a probar.

Volvemos.

Y levantamos.

Esta fusión no bien nuestra aplicación ya está pasando las pruebas bien por ahora quedamos hasta acá

y en la próxima clase vamos a probar qué pasa si transferimos más del saldo que tienen la cuenta, por

ejemplo, la cuenta uno, la cuenta de origen obviamente se va a quedar sin saldo, va a ser negativo,

debería la acepcion se acuerdan?

Dinero insuficiente septón y podríamos probar si efectivamente se lanza o no se lanza esa sesión con

Azeroth.

FRU Si se lanza, perfecto, pasa la prueba.

Es decir, estarían probando en caso de que falle.

En caso de que falle la transferencia y por supuesto, también probar los saldos que nos haya modificado,

que nos haya realizado el ComitÃ que lanza la excepción.

Perfecto.

Y además, que los saldo se han quedado como están antes, porque la transferencia no se debiese haber

realizado.

Pero lo vemos a la siguiente clase.

Nos vemos.

## Test **`verify`** 05:31
## Escribiendo tests **`assertThrow`** para afirmar que la excepción lanzada sea correcta 12:21
## Escribiendo tests con **`assertSame`** 05:41
## Uso de anotaciones de spring **`@MockBean`** y **`@Autowired`** 04:46
## Introducción a la inyección de dependencia en Spring (Opcional) 10:09
## Deshabilitando la traza del logs de Spring en el contexto test 04:10
## Descargar Código Fuente 00:03
