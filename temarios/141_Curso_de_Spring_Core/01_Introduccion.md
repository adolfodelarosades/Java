# 1. Introducción  60m

* 01 Presentación 4:31 
* 02 Introducción a Spring 14:25 
* 03 Instalación del entorno de trabajo 13:55 
* 04 Estructura de una aplicación empresarial y patrones de diseño 12:55 
* 05 Inversión de control e inyección de dependencias 15:09 
* Contenido adicional  5

# 01 Presentación 4:31

[PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/1-01.png">

<img src="images/1-02.png">

<img src="images/1-03.png">

<img src="images/1-04.png">

<img src="images/1-05.png">

<img src="images/1-06.png">

<img src="images/1-07.png">

<img src="images/1-08.png">

# 02 Introducción a Spring 14:25

[PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)

## Resumen Profesor

### Proyectos que conforman Spring

A día de hoy, Spring se considera algo más que un framework, ya que incluye una gran cantidad de proyectos que abarcan ámbitos diferentes. En este enlace, puedes encontrar un listado completo:

https://spring.io/projects

### Novedades de Spring 5

En este enlace podrás encontrar todas las novedades incluidas en las últimas versiones de Spring.

https://github.com/spring-projects/spring-framework/wiki/What's-New-in-Spring-Framework-5.x

### Transcripción

<img src="images/2-01.png">

<img src="images/2-02.png">

<img src="images/2-03.png">

<img src="images/2-04.png">

<img src="images/2-05.png">

<img src="images/2-06.png">

<img src="images/2-07.png">

<img src="images/2-08.png">

<img src="images/2-09.png">

<img src="images/2-10.png">

### [Spring Projects](https://spring.io/projects)

### [Spring Framework](https://spring.io/projects/spring-framework)

Spring Framework proporciona un modelo integral de programación y configuración para aplicaciones empresariales modernas basadas en Java, en cualquier tipo de plataforma de implementación.

Un elemento clave de Spring es el soporte de infraestructura a nivel de aplicación: Spring se enfoca en la "plomería" de aplicaciones empresariales para que los equipos puedan enfocarse en la lógica de negocios a nivel de aplicación, sin vínculos innecesarios con entornos de implementación específicos.

#### Caracteristicas

* [Core technologies](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html): dependency injection, events, resources, i18n, validation, data binding, type conversion, SpEL, AOP.
* [Testing](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/testing.html): mock objects, TestContext framework, Spring MVC Test, WebTestClient.
* [Data Access](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/data-access.html): transactions, DAO support, JDBC, ORM, Marshalling XML.
* [Spring MVC](https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html) y [Spring WebFlux](https://docs.spring.io/spring/docs/current/spring-framework-reference/web-reactive.html) web frameworks.
* [Integration](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/integration.html): remoting, JMS, JCA, JMX, email, tasks, scheduling, cache.
* [Languages](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/languages.html): Kotlin, Groovy, dynamic languages.

### [Spring Boot](https://spring.io/projects/spring-boot)

Spring Boot facilita la creación de aplicaciones independientes basadas en Spring de grado de producción que puede "simplemente ejecutar".

Tomamos una visión obstinada de la plataforma Spring y las bibliotecas de terceros para que pueda comenzar con un mínimo de alboroto. La mayoría de las aplicaciones Spring Boot necesitan una configuración mínima de Spring.

#### Caracteristicas

* Crear aplicaciones independientes de Spring
* Incrusta Tomcat, Jetty o Undertow directamente (no es necesario implementar archivos WAR)
* Proporcione dependencias "iniciales" obstinadas para simplificar su configuración de compilación
* Configura automáticamente las bibliotecas de Spring y de terceros siempre que sea posible
* Proporciona funciones listas para producción, como métricas, comprobaciones de estado y configuración externa.
* Absolutamente ninguna generación de código y ningún requisito para la configuración XML

### [Spring Data](https://spring.io/projects/spring-data)

La misión de Spring Data es proporcionar un modelo de programación familiar y consistente basado en Spring para el acceso a los datos, al mismo tiempo que conserva los rasgos especiales del almacén de datos subyacente.

Facilita el uso de tecnologías de acceso a datos, bases de datos relacionales y no relacionales, marcos de reducción de mapas y servicios de datos basados en la nube. Este es un proyecto general que contiene muchos subproyectos que son específicos de una base de datos determinada. Los proyectos se desarrollan trabajando en conjunto con muchas de las compañías y desarrolladores que están detrás de estas emocionantes tecnologías.

#### Caracteristicas

* Potente repositorio y abstracciones personalizadas de mapeo de objetos
* Consulta dinámica derivada de nombres de métodos de repositorio
* Implementación de clases base de dominio que proporcionan propiedades básicas
* Soporte para auditorías transparentes (creado, modificado por última vez)
* Posibilidad de integrar código de repositorio personalizado
* Fácil integración de Spring a través de JavaConfig y espacios de nombres XML personalizados
* Integración avanzada con controladores Spring MVC
* Soporte experimental para la persistencia entre tiendas

### [Spring Security](https://spring.io/projects/spring-security) 

Spring Security es un marco de autenticación y control de acceso potente y altamente personalizable. Es el estándar de facto para asegurar aplicaciones basadas en Spring.

Spring Security es un marco que se centra en proporcionar autenticación y autorización a las aplicaciones Java. Al igual que todos los proyectos de Spring, el verdadero poder de Spring Security se encuentra en la facilidad con que se puede extender para cumplir con los requisitos personalizados.

#### Caracteristicas

* Soporte completo y extensible para autenticación y autorización
* Protección contra ataques como session fixation, clickjacking, cross site request forgery, etc
* Integración API Servlet
* Integración opcional con Spring Web MVC
* Mucho más...

<img src="images/2-11.png">

[Framework Modules](https://docs.spring.io/spring/docs/5.0.0.RC2/spring-framework-reference/overview.html#overview-modules)

<img src="images/2-12.png">

<img src="images/2-13.png">

Actualmente 5.2.6 GA 27/05/2020

<img src="images/2-14.png">

# 03 Instalación del entorno de trabajo 13:55

[PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)

## Resumen Profesor

### Requisitos

Para poder trabajar con Spring, necesitamos que nuestro ordenador disponga de una instalación de JDK 8. Puedes encontrar la información en https://www.oracle.com/technetwork/java/javase/downloads/index.html.

### Spring Tool Suite

Nuestro IDE será Spring Tool Suite, que está basado en Eclipse, e incluye muchas facilidades para trabajar con la familia de proyectos de Spring. Se puede instalar como un plugin sobre una instalación de eclipse, pero si vas a comenzar desde cero, te recomendamos descargar el *bundle* disponible en https://spring.io/tools/sts.

### Instalación vía ubuntu-make

Ubuntu Make es una herramienta de línea de comandos que permite descargar e instalar la última versión de varios entornos de desarrollo. También se encarga de instalar las dependencias necesarias, así como de crear los lanzadores (accesos directos). Básicamente, se trata de un comando para poner tu sistema a punto para desarrollar.

Entre otras herramientas, *Ubuntu make* permite la instalación de *Spring Tool Suite*. Para ello, debemos seguir los siguientes pasos:

### Instalar Ubuntu Make

Añadimos el repositorio PPA a nuestro sistema

```sh
$ sudo add-apt-repository ppa:lyzardking/ubuntu-make
$ sudo apt-get update
```

Instalamos ubuntu make

```sh
$ sudo apt-get install ubuntu-make
```

Ya podemos usarlo para instalar Spring Tool Suite

```sh
$ umake ide spring-tools-suite
```

## Transcripción

<img src="images/3-01.png">

<img src="images/3-02.png">

<img src="images/3-03.png">

<img src="images/3-04.png">

<img src="images/3-05.png">

<img src="images/3-06.png">

<img src="images/3-07.png">

<img src="images/3-08.png">

<img src="images/3-09.png">

<img src="images/3-10.png">

<img src="images/3-11.png">

<img src="images/3-12.png">

<img src="images/3-13.png">

<img src="images/3-14.png">

<img src="images/3-15.png">

<img src="images/3-16.png">

# 04 Estructura de una aplicación empresarial y patrones de diseño 12:55

[PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/4-01.png">

<img src="images/4-02.png">

<img src="images/4-03.png">

<img src="images/4-04.png">

Algunos autores dividen una aplicación empresarial en varios bloques:

* Personas
   * Propietarios del sistema
   * Usuarios
   * Diseñadores
   * Desarrolladores
   * ...
* Datos: Materia prima usada por el sistema de información, permiten
   * Crear información útil
   * Toma de desiciones
   * etc.
* Procesos: Todas aquellas actividades que se llevan dentro de la empresa 
   * Procesan datos
   * Generan información
* Redes: Aquellos canales que vamos a utilizar y diferenciar a la hora de desplegar y utilizar la aplicación
   * Centros de produción
   * Oficinas
   * etc.
* Tecnología que soporta nuestro sistema de información
   * Hardware
   * Software
   
<img src="images/4-05.png">

A nivel de capas una aplicación empresarial esta formada por:

* Infraestructura del hardware
   * En que servidor va a recidir nuestra aplicación
   * Que tipo de conectividad tenemos para acceder a el
   * Plataforma que hay sobre ese hardware
* Infraestructura de la plataforma
   * Sistema operativo, versión de maquinas virtuales
* Datos
   * Relacional o no relacional
* Aplicación
* Interfaz de usuario

**Spring trabaja sobre todo el nivel de aplicación y sus fronteras**

<img src="images/4-06.png">

Aquí podemos verlo desglosado en aquellos componentes que seran habituales en Spring.

### Datos

Para acceder a la capa de Datos existen varias formas de hacerlo, existen dos grandes tipos:

* Relacionales
* NoSQL

En la frontera ente la capa de *Datos* y *Aplicación* vamos a tener unas clases especiales lladados ***Repositorios*** que nos permiten acceder a los datos desde la *Aplicación*.

### Aplicación

Dentro de la aplicación podemos dividirlos en tres grandes tipos:

* **Entidades** modelan el dominio de nuestra aplicación.
* **Servicios** tienen la lógica de negocio de nuestra aplicación
* **Controladores** son los que reciben las peticiones y son capaces de despacharlas delegando el trabajo en los servicios que sean necesarios.

### Interfaz de Usuario

Los *sistemas de plantillas* conectan la *Aplicación* y la *Interfaz de Usuario*.

<img src="images/4-07.png">

<img src="images/4-08.png">

<img src="images/4-09.png">

<img src="images/4-10.png">

<img src="images/4-11.png">

<img src="images/4-12.png">

# 05 Inversión de control e inyección de dependencias 15:09 

[PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/5-01.png">

<img src="images/5-02.png">

<img src="images/5-03.png">

<img src="images/5-04.png">

<img src="images/5-05.png">

<img src="images/5-06.png">

<img src="images/5-07.png">

<img src="images/5-08.png">

<img src="images/5-09.png">

<img src="images/5-10.png">

<img src="images/5-11.png">

<img src="images/5-12.png">

<img src="images/5-13.png">

<img src="images/5-14.png">

<img src="images/5-15.png">

# Contenido adicional  5

* [PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)
* [PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)
* [PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)
* [PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)
* [PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)
