# Spring 5.0 By Example

## Viaje al mundo Spring

Spring es un framework modular de código abierto para la plataforma JVM. ***Un framework es una colección de libraries cuyo objetivo principal es abordar problemas comunes de desarrollo de software***. El framework debería resolver estos problemas de forma genérica.

**Rod Johnson creó Spring Framework en 2002** junto con la publicación de su libro, que se llamó ***Expert One-on-One J2EE Design and Development***. La idea detrás de la creación del framework era abordar las complejidades de Java Enterprise Edition.

En ese momento, este tipo de solución se enfocaba mucho en los detalles de la infraestructura, y un desarrollador que usara la solución pasaría mucho tiempo escribiendo código para resolver problemas de infraestructura. Desde su creación, una de las principales preocupaciones de Rod Johnson ha sido aumentar la productividad de los desarrolladores.

El framework se vio por primera vez como un contenedor ligero para Java Runtime Environment y se hizo popular en la comunidad, especialmente debido a la ***función de inyección de dependencias***. El framework hizo que la inyección de dependencias fuera increíblemente fácil. Los desarrolladores no habían visto una característica de este tipo antes y, como consecuencia, personas de todo el mundo adoptaron el proyecto. Año tras año, su popularidad dentro del mundo del desarrollo de software ha ido aumentando.

En las primeras versiones, el framework tenía que trabajar con el ***archivo XML para configurar el contenedor***. En ese momento, esto era mucho mejor que las aplicaciones J2EE, donde era necesario crear muchos ***archivos Ant*** para crear las clases e interfaces estándar.

El framework siempre se consideró una tecnología avanzada para la plataforma Java, pero ***en 2014, el equipo de Spring lanzó la plataforma Spring Boot***. Esta plataforma tuvo un éxito increíble en el ecosistema de Java Enterprise y cambió la forma en que los desarrolladores crearon las aplicaciones de Java Enterprise.

Hoy, Spring es el framework de facto para el desarrollo de Java, y empresas de todo el mundo lo utilizan en sus sistemas. La comunidad es vibrante y contribuye al desarrollo de diferentes maneras, como abrir problemas, agregar el código y discutir el framework en las conferencias de Java más importantes del mundo. Veamos y juguemos con el famoso framework para desarrolladores de Java.

Cubriremos los siguientes temas en este capítulo:

* Módulos principales del Spring Framework
* Anotaciones de Spring para cada módulo
* Configurar el entorno de desarrollo
* Docker  y comandos Docker

## Modularidad de Spring

Desde su fundación, el framework se ha centrado especialmente en la modularidad. Es una característica importante del framework porque lo convierte en una excelente opción para diferentes estilos arquitectónicos y diferentes partes de aplicaciones.

Significa que el framework no es un framework completo y obstinado que dicta las reglas para que todo funcione. Podemos usar el framework según lo necesitemos e integrarlo con una amplia gama de especificaciones y libraries de terceros.

Por ejemplo, para aplicaciones web de portal, Spring MVC admite características como motores de plantilla y endpoints REST y los integra con el popular framework de JavaScript, AngularJS.

Además, si la aplicación necesita soporte para un sistema distribuido, el framework puede proporcionar un módulo asombroso llamado Spring Cloud, que tiene algunas características esenciales para entornos distribuidos, como el registro y descubrimiento de servicios, un disyuntor, enrutamiento inteligente y del lado del cliente, balanceo de carga.

Spring facilita las aplicaciones de desarrollo para Java Runtime con diferentes lenguajes, como Java, Kotlin y Groovy (con los que puede elegir el sabor y hacer que la tarea de desarrollo sea divertida).

Está dividido en varios módulos. Los módulos principales son los siguientes:

* Spring Core
* Spring Data
* Spring Security
* Spring Cloud
* Spring Web-MVC

En este libro, cubriremos las soluciones más comunes involucradas en las aplicaciones Java Enterprise, incluido el impresionante proyecto Spring Cloud. Además, podemos encontrar algunos proyectos interesantes como Spring Batch y Spring Integration, pero estos proyectos son para necesidades específicas.

## Spring Core Framework

Este módulo es la base del framework y contiene el soporte esencial para la inyección de dependencias, funciones web compatibles con Spring **MVC** (**modelo-vista-controlador**) y los frameworks WebFlux bastante nuevos, y programación orientada a aspectos. Además, este módulo apoya la base de JDBC, JMS, JPA y una forma declarativa de administrar transacciones. Lo exploraremos y entenderemos los principales proyectos de este módulo. ¡Hagamoslo!

## Core container

El contenedor Core (central )es la base de todo el ecosistema Spring y ***comprende cuatro componentes: núcleo(core), beans, contexto y lenguaje de expresión***.

***El core y los beans son responsables de proporcionar los fundamentos del framework y la inyección de dependencias***. Estos módulos son responsables de ***administrar el contenedor de IoC*** y ***las funciones principales son la creación de instancias, la configuración y la destrucción de los objeto residentes en el contenedor de Spring***.

> ℹ️ *Los contextos Spring también se denominan contenedores Spring IoC, que son responsables de crear instancias, configurar y ensamblar beans mediante la lectura de metadatos de configuración de XML, anotaciones Java y/o código Java en los archivos de configuración.

***Hay dos interfaces críticas dentro de estos módulos***: `BeanFactory` y `ApplicationContext`. ***`BeanFactory` se encarga del ciclo de vida del bean, instanciando, configurando, administrando y destruyendo, y `ApplicationContext` ayuda a los desarrolladores a trabajar con recursos de archivos de una manera genérica, habilitando la publicación de eventos para listeners registrados. Además, `ApplicationContext` admite la internacionalización y tiene la capacidad de trabajar con mensajes en diferentes Locales***.

Estos módulos ayudan al componente de contexto a proporcionar una forma de acceder a los objetos dentro del contenedor. El componente de contexto tiene la interfaz `ApplicationContext` con la clase esencial para el contenedor.

> ℹ️ Algunas anotaciones comunes son `@Service`, `@Component`, `@Bean` y `@Configuration`
