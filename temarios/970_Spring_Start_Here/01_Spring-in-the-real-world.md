# 1 Spring en el mundo real

* 1 Spring in the real world
   * 1.1 Why should we use frameworks?
   * 1.2 The Spring ecosystem
      * Discovering Spring Core: The foundation of Spring
      * Using Spring Data Access feature to implement the app’s persistence
      * The Spring MVC capabilities for developing web apps
      * The Spring testing feature
      * Projects from the Spring ecosystem
   * 1.3 Spring in real-world scenarios
      * Using Spring in the development of a backend app
      * Using Spring in a test automation app
      * Using Spring for the development of a desktop app
      * Using Spring in mobile apps
   * 1.4 When not to use frameworks
      * You need to have a small footprint
      * Security needs dictate custom code
      * Abundant existing customizations make a framework impractical
      * You won’t benefit from switching to a framework
   * 1.5 What will you learn in this book



Este capítulo cubre

* Que es un framework
* Cuándo usar y cuándo evitar el uso de frameworks
* Qué es el Spring framework
* Uso de Spring en escenarios del mundo real

**Spring Framework** (en breve, **Spring**) es un framework de aplicación que forma parte del ecosistema de Java. Un ***application framework(framework de aplicaciónes)*** es un conjunto de funcionalidades comunes de software que proporciona una estructura básica para desarrollar una aplicación. Un framework de aplicaciónes facilita el esfuerzo de escribir una aplicación al eliminar el esfuerzo de escribir todo el código del programa desde cero.

Usamos **Spring** en el desarrollo de muchos tipos de aplicaciones hoy en día, desde grandes soluciones de back-end hasta automatización de testing. Según muchos informes de encuestas sobre tecnologías **Java**(como este de JRebel de 2020: http://mng.bz/N4V7 ; o este de JAXEnter: http://mng.bz/DK9a ), Spring es el framework Java más utilizado actualmente.

**Spring** es popular y los desarrolladores han comenzado a usarlo con más frecuencia con otros lenguajes ***JVM*** además de **Java**. En los últimos años, observamos un crecimiento impresionante de desarrolladores que usan **Spring** con **Kotlin**(otro lenguaje apreciado de la familia JVM). En este libro, nos centraremos en los fundamentos de **Spring** y le enseñaré las habilidades esenciales para usar **Spring** en ejemplos del mundo real. Para que el tema le resulte más cómodo y le permita concentrarse en **Spring**, usaremos solo ejemplos de **Java**. A lo largo del libro, discutiremos y aplicaremos, con ejemplos, habilidades esenciales como conectarse a una base de datos, establecer comunicación entre aplicaciones y asegurar y probar una aplicación.

Antes de sumergirnos en más detalles técnicos en los próximos capítulos, hablemos sobre **Spring Framework** y dónde lo usará realmente. ¿Por qué **Spring** es tan apreciado y cuándo debería usarlo?

En este capítulo, nos centraremos en qué es un framework, refiriéndonos en particular al framework **Spring**. En la sección 1.1, discutimos las ventajas de usar un framework. En la sección 1.2, analizamos el ecosistema de **Spring** con los componentes que necesita aprender para comenzar con **Spring**. Luego, lo guiaré a través de los posibles usos del framework **Spring**, en particular, los escenarios del mundo real en la sección 1.3. En la sección 1.4, discutiremos cuándo usar frameworks podría no ser el enfoque correcto. Debe comprender todas estas cosas sobre **Spring Framework** antes de intentar usarlo. De lo contrario, podría intentar usar un martillo para cavar su jardín.

Dependiendo de tu nivel, puedes sentir que este capítulo es difícil. Podría introducir algunas nociones de las que no has oído hablar, y este aspecto podría perturbarte. Pero no te preocupes; incluso si no entiende algunas de las cosas ahora, se aclararán más adelante en el libro. A veces, a lo largo del libro, me referiré a algo dicho en capítulos anteriores. Uso este enfoque porque aprender un framework como **Spring** no siempre nos ofrece una ruta de aprendizaje lineal y, a veces, debe esperar hasta obtener más piezas del rompecabezas antes de ver la imagen completa. Pero al final, obtendrá una imagen clara y obtendrá las habilidades valiosas que necesita para desarrollar aplicaciones como un profesional.

## 1.1 ¿Por qué debemos usar frameworks?

En esta sección, discutimos los frameworks. ¿Qué son? ¿Cómo apareció este concepto y por qué? Para estar motivado para usar algo, necesita saber cómo ese algo le aporta valor. Y ese es también el caso de **Spring**. Te enseñaré estos detalles esenciales compartiendo el conocimiento que obtuve de mi propia experiencia y estudiando y usando varios frameworks en escenarios del mundo real, incluido **Spring**.

Un framework de aplicación es un conjunto de funcionalidades sobre las cuales construimos aplicaciones. El framework de la aplicación nos proporciona un amplio conjunto de herramientas y funcionalidades que puede utilizar para crear aplicaciones. No necesita usar todas las funciones que ofrece el framework. Dependiendo de los requisitos de la aplicación que cree, elegirá las partes correctas del framework para usar.

Aquí hay una analogía que me gusta para los frameworks de aplicación. ¿Alguna vez compraste un mueble en una tienda de bricolaje como Ikea? Supongamos que compra un guardarropa: no obtendrá un guardarropa ensamblado, sino los componentes correctos que necesita para construirlo y un manual sobre cómo ensamblar su mueble. Ahora imagine que ordenó un armario, pero en lugar de obtener solo los componentes correctos que necesita, obtiene todos los componentes posibles que puede usar para ensamblar cualquier mueble: una mesa, un armario, etc. Si quieres un armario, tienes que encontrar las piezas adecuadas y montarlas. Es como un framework de aplicación. El framework de la aplicación le ofrece varias piezas de software que necesita para crear su aplicación. Necesita saber qué características elegir y cómo ensamblarlas para lograr el resultado correcto (figura 1.1).

![image](https://user-images.githubusercontent.com/23094588/212039751-bf8d9c7f-04b6-40cd-944f-19cbf19d1cb0.png)

**Figura 1.1** David pidió un guardarropa de la tienda UAssemble. Pero la tienda (framework) no le entrega a David (el programador) solo los componentes(capacidades del software) que necesita para construir su nuevo guardarropa(la aplicación). La tienda le envía todas las piezas posibles que pueda necesitar para construir el guardarropa. Es decisión de David(el programador) decidir qué componentes (capacidades de software) son correctos y cómo ensamblarlos para obtener el resultado correcto(la aplicación).

La idea de un framework no es nueva. A lo largo de la historia del desarrollo de software, los programadores observaron que podían reutilizar partes del código que habían escrito en múltiples aplicaciones. Inicialmente, cuando no se implementaban tantas aplicaciones, cada aplicación era única y se desarrollaba desde cero utilizando un lenguaje de programación específico. Cuando el dominio del desarrollo de software se extendió y más y más aplicaciones comenzaron a publicarse en el mercado, se hizo más fácil observar que muchas de estas aplicaciones tenían requisitos similares. Vamos a nombrar algunos de ellos:

* Los mensajes de error, advertencia e información de registro ocurren en cada aplicación.
* La mayoría de las aplicaciones usan transacciones para procesar cambios de datos. Las transacciones representan un mecanismo importante que se ocupa de la coherencia de los datos. Discutiremos este tema en detalle en el capítulo 13.
* La mayoría de las aplicaciones utilizan mecanismos de protección contra las mismas vulnerabilidades comunes.
* La mayoría de las aplicaciones utilizan formas similares de comunicarse entre sí.
* La mayoría de las aplicaciones utilizan mecanismos similares para mejorar su rendimiento, como el almacenamiento en caché o la compresión de datos.

Y la lista continúa. Resulta que el código de lógica de negocios implementado en una aplicación es significativamente más pequeño que las ruedas y correas que forman el motor de la aplicación(también conocido como "la plomería").

Cuando digo "código de lógica empresarial", me refiero al código que implementa los requisitos empresariales de la aplicación. Este código es lo que implementa las expectativas del usuario en una aplicación. Por ejemplo, "hacer clic en un enlace específico generará una factura" es algo que los usuarios esperan que suceda. Parte del código de la aplicación que desarrolla implementa esta funcionalidad, y esta parte del código es lo que los desarrolladores llaman el código de lógica empresarial. Sin embargo, cualquier aplicación se ocupa de varios aspectos más: seguridad, registro, consistencia de datos, etc. (figura 1.2).

![image](https://user-images.githubusercontent.com/23094588/212040881-5f6563a2-c3b0-4916-a530-75b049401063.png)

**Figura 1.2** La perspectiva del usuario es similar a ver un iceberg. Los usuarios observan principalmente los resultados del código de lógica empresarial, pero esto es solo una pequeña parte de lo que construye la funcionalidad completa de la aplicación. Como un iceberg que está mayormente bajo el agua y oculto a la vista, no vemos la mayor parte del código en una aplicación empresarial porque lo proporcionan las dependencias.

Además, el código de lógica de negocios es lo que hace que una aplicación sea diferente de otra desde el punto de vista de la funcionalidad. Si toma dos aplicaciones diferentes, digamos un sistema de viaje compartido y una aplicación de red social, tienen diferentes casos de uso.

**NOTA** Un caso de uso representa la razón por la que una persona usa la aplicación. Por ejemplo, en una aplicación de viajes compartidos, un caso de uso es "solicitar un automóvil". Para una aplicación que gestiona la entrega de alimentos, un caso de uso es "pedir una pizza".

Realiza diferentes acciones, pero ambas necesitan almacenamiento de datos, transferencia de datos, registro, configuraciones de seguridad, probablemente almacenamiento en caché, etc. Varias aplicaciones pueden reutilizar estas implementaciones no comerciales. ¿Es entonces eficiente reescribir las mismas funcionalidades cada vez? Por supuesto no:

* Ahorra mucho tiempo y dinero al reutilizar algo en lugar de desarrollarlo usted mismo.
* Una implementación existente que ya utilizan muchas aplicaciones tiene menos posibilidades de introducir errores, ya que otros la han probado.
* Se beneficia de los consejos de una comunidad porque ahora tiene muchos desarrolladores que entienden la misma funcionalidad. Si hubiera implementado su propio código, solo unas pocas personas lo sabrían.

Una historia de transición

Una de las primeras aplicaciones en las que trabajé fue un enorme sistema desarrollado en **Java**. Este sistema estaba compuesto por múltiples aplicaciones diseñadas en torno a un servidor de arquitectura antigua, todas ellas escritas desde cero utilizando **Java SE**. El desarrollo de esta aplicación comenzó con el lenguaje hace unos 25 años. Esta fue la razón principal de su forma. Y casi nadie podría haber imaginado lo grande que llegaría a ser. En ese momento, no existían conceptos más avanzados de arquitecturas de sistemas y, en general, las cosas funcionaban de manera diferente a los sistemas individuales debido a la lentitud de la conexión a Internet.

Pero pasó el tiempo y, años después, la aplicación se parecía más a una gran bola de barro. Por razones válidas que no cubriré aquí, el equipo decidió que tenían que optar por una arquitectura moderna. Este cambio implicó primero limpiar el código, y uno de los pasos principales fue usar un framework. Decidimos ir con **Spring**. En ese momento, teníamos como alternativa **Java EE**(ahora llamado **Jakarta EE**), pero la mayoría de los miembros del equipo consideraron que era mejor optar por **Spring**, que ofrecía una alternativa más liviana, más fácil de implementar y que también consideramos más fácil de mantener. .

La transición no fue fácil. Junto con algunos colegas, expertos en su dominio y conocedores de la aplicación en sí, invertimos mucho esfuerzo en esta transformación.

¡El resultado fue increíble! Eliminamos más del 40 % de las líneas de código. Esta transición fue el primer momento en que comprendí cuán significativo podría ser el impacto de usar un framework.

**NOTA** La elección y el uso de un framework están relacionados con el diseño y la arquitectura de una aplicación. Le resultará útil aprender más sobre estos temas junto con el aprendizaje del framework **Spring**. En el ***apéndice A***, encontrará una discusión sobre arquitecturas de software con excelentes recursos si desea profundizardetalles.

### 1.2 El ecosistema Spring

En esta sección, discutiremos **Spring** y proyectos relacionados como **Spring Boot** o **Spring Data**. Aprenderá todo acerca de estos en este libro, y los enlaces entre ellos. En escenarios del mundo real, es común usar diferentes frameworks juntos, donde cada framework está diseñado para ayudarlo a implementar una parte específica de la aplicación más rápido.

Nos referimos a **Spring** como un framework, pero es mucho más complejo. **Spring** es un ecosistema de frameworks. Por lo general, cuando los desarrolladores se refieren al framework **Spring**, se refieren a una parte de las capacidades del software que incluyen lo siguiente:

1. **Spring Core** Una de las partes fundamentales de **Spring** que incluye capacidades fundamentales. Una de estas características es el ***Spring context(contexto Spring)***. Como aprenderá en detalle en el capítulo 2, el contexto Spring es una capacidad fundamental del framework Spring que permite que **Spring** administre instancias de su aplicación. Además, como parte de ***Spring Core***, encontrará la ***Spring aspects functionality(funcionalidad de aspectos de Spring)***. Los aspectos ayudan a **Spring** a interceptar y manipular los métodos que define en su aplicación. Discutimos más detalles de los aspectos en el capítulo 6. El ***Spring Expression Language (SpEL)(lenguaje de expresión Spring(SpEL))*** es otra capacidad que encontrará como parte de **Spring Core**, que le permite describir configuraciones para **Spring** usando un lenguaje específico. Todas estas son nociones nuevas, y no espero que las conozcas todavía. Pero pronto comprenderá que **Spring Core** contiene los mecanismos que **Spring** usa para integrarse en su aplicación.

2. **Spring model-view-controller (Spring MVC)**: la parte del framework **Spring** que le permite desarrollar aplicaciones web que atienden solicitudes **HTTP**. Usaremos **Spring MVC** a partir del capítulo 7.

3. **Spring Data Access** También una de las partes fundamentales de **Spring**. Proporciona herramientas básicas que puede usar para conectarse a bases de datos SQL para implementar la capa de persistencia de su aplicación. Usaremos **Spring Data Access** a partir del capítulo 13.

4. **Spring testing** La parte que contiene las herramientas que necesita para escribir pruebas para su aplicación **Spring**. Hablaremos de este tema en el capítulo 15.

Inicialmente, puede imaginar el framework **Spring** como un sistema solar, donde **Spring Core** representa la estrella en el medio, que mantiene unido todo el framework(figura 1.3).

![image](https://user-images.githubusercontent.com/23094588/212044462-6c21d2ef-72d9-4928-9593-b0cb88b9e068.png)

**Figura 1.3** Puede imaginar el framework **Spring** como un sistema solar con **Spring Core** en el centro. Las capacidades del software son planetas alrededor de **Spring Core** que se mantienen cerca de él por su campo gravitatorio.

#### 1.2.1 Descubriendo Spring Core: La base de Spring

**Spring Core** es la parte del framework **Spring** que proporciona los mecanismos básicos para integrarse en las aplicaciones. El resorte funciona según el ***inversion of control (IoC) (principio de inversión de control (IOC))***. Cuando usamos este principio, en lugar de permitir que la aplicación controle la ejecución, le damos el control a otra pieza de software, en nuestro caso, el framework Spring. A través de configuraciones, instruimos al framework sobre cómo administrar el código que escribimos, lo que define la lógica de la aplicación. Aquí es de donde proviene la ***"inversión" en IoC***: *no permite que la aplicación controle la ejecución por su propio código y use dependencias. En cambio, permitimos que el framework(la dependencia) controle la aplicación y su código* (figura 1.4).

![image](https://user-images.githubusercontent.com/23094588/212045935-5fd00264-f02b-4140-86e7-0317949d139f.png)

**Figura 1.4** ***Inversión de control***. En lugar de ejecutar su propio código, que hace uso de varias otras dependencias, en el caso de un escenario de IoC, la ejecución de la aplicación está controlada por la dependencia. El framework **Spring** controla una aplicación durante su ejecución. Por lo tanto, implementa un escenario IoC de ejecución.

**NOTA** En este contexto, el término "controles" se refiere a acciones como "crear una instancia" o "llamar a un método". Un framework puede crear objetos de las clases que defina en su aplicación. Según las configuraciones que escriba, **Spring** intercepta el método para aumentarlo con varias características. Por ejemplo, **Spring** puede interceptar un método específico para registrar cualquier error que pueda aparecer durante la ejecución del método.

Comenzará a aprender **Spring** con **Spring Core** discutiendo la funcionalidad ***Spring IoC*** en los capítulos 2 a 5. El contenedor IoC une los componentes **Spring** y los componentes de su aplicación al framework. Usando el ***contenedor IoC***, al que a menudo se refiere como el ***contexto de Spring***, le da a conocer ciertos objetos a **Spring**, lo que permite que el framework los use en la forma en que los configuró.

En el capítulo 6, continuaremos nuestra discusión con la ***programación orientada a aspectos de Spring(AOP)***. **Spring** puede controlar instancias agregadas a su contenedor IoC, y una de las cosas que puede hacer es interceptar métodos que representan el comportamiento de estas instancias. Esta capacidad se llama *aspecting the method*. **Spring AOP** es una de las formas más comunes en que el framework interactúa con lo que hace su aplicación. Este rasgo hace que **Spring AOP** también sea parte de los elementos esenciales. Parte del **Spring Core**, también encontramos *gestión de recursos*, *internacionalización(i18n)*, *conversión de tipo* y *SpEL*. Encontraremos aspectos de estas características en ejemplos a lo largo del libro.

#### 1.2.2 Uso de la función Spring Data Access para implementar la persistencia de la aplicación

Para la mayoría de las aplicaciones, es fundamental conservar parte de los datos que procesan. Trabajar con bases de datos es un tema fundamental y, en **Spring**, es el módulo de acceso a datos el que utilizará para cuidar la persistencia de los datos en muchos casos. **Spring Data Access** incluye el uso de **JDBC**, la integración con **object-relational mapping (ORM)** como **Hibernate** (no se preocupe si aún no sabe qué es un framework ORM o no ha oído hablar de **Hibernate**; discutiremos estos aspectos más adelante en el libro) y la gestión de transacciones. En los capítulos 12 a 14, cubriremos todo lo necesario para que pueda comenzar con **Spring DataAcceso**.

#### 1.2.3 Las capacidades de Spring MVC para desarrollar aplicaciones web

Las aplicaciones más comunes desarrolladas con **Spring** son aplicaciones web y, dentro del ecosistema **Spring**, encontrará un gran conjunto de herramientas que le permiten escribir aplicaciones web y servicios web de diferentes maneras. Puede usar **Spring MVC** para desarrollar aplicaciones utilizando una forma de servlet estándar, que es común en una gran cantidad de aplicaciones en la actualidad. En el capítulo 7, entraremos en más detalles sobre el uso de **SpringMVC**.

#### 1.2.4 La función de Spring testing

El módulo **Spring testing** nos ofrece un gran conjunto de herramientas que usaremos para escribir pruebas unitarias y de integración. Se han escrito muchas páginas sobre el tema de las pruebas, pero discutiremos todo lo que es esencial para comenzar con las pruebas de Spring en el capítulo 15. También me referiré a algunos recursos valiosos que necesita leer para obtener todos los detalles de este tema. Mi regla general es que no eres un desarrollador maduro si no entiendes las pruebas, por lo que este tema es uno que deberías preocuparte.

#### 1.2.5 Proyectos del ecosistema Spring

El ecosistema de **Spring** es mucho más que las capacidades discutidas anteriormente en esta sección. Incluye una gran colección de otros fraeworks que se integran bien y forman un universo más grande. Aquí tenemos proyectos como **Spring Data**, **Spring Security**, **Spring Cloud**, **Spring Batch**, **Spring Boot**, etc. Cuando desarrolla una aplicación, puede usar más de estos proyectos juntos. Por ejemplo, puede crear una aplicación utilizando todo **Spring Boot**, **Spring Security** y **Spring Data**. En los próximos capítulos, trabajaremos en proyectos más pequeños que hacen uso de varios proyectos del ecosistema **Spring**. Cuando digo proyecto, me refiero a una parte del ecosistema **Spring** que se desarrolla de forma independiente. Cada uno de estos proyectos tiene un equipo separado que trabaja para ampliar sus capacidades. Puede encontrar mayor información en la página oficial de **Spring** https://spring.io/projects.

De este vasto universo creado por **Spring**, también nos referiremos a **Spring Data** y **Spring Boot**. Estos proyectos se encuentran a menudo en las aplicaciones, por lo que es importante conocerlos desde el principio.

**EXTENDIENDO LAS CAPACIDADES DE PERSISTENCIA CON SPRING DATA**

El proyecto **Spring Data** implementa una parte del ecosistema **Spring** que le permite conectarse fácilmente a bases de datos y utilizar la capa de persistencia con un número mínimo de líneas de código escritas. El proyecto hace referencia a las tecnologías **SQL** y **NoSQL** y crea una capa de alto nivel que simplifica la forma en que trabaja con los datos de persistencia.

**NOTA** Tenemos **Spring Data Access**, que es un módulo de **Spring Core**, y también tenemos un proyecto independiente en el ecosistema de **Spring** llamado **Spring Data**. **Spring Data Access** contiene implementaciones fundamentales de acceso a datos como el mecanismo de transacción y las herramientas **JDBC**. **Spring Data** mejora el acceso a las bases de datos y ofrece un conjunto más amplio de herramientas, lo que hace que el desarrollo sea más accesible y permite que su aplicación se conecte a diferentes tipos de fuentes de datos. Hablaremos de este tema en el capítulo 14.

**SPRING BOOT**

**Spring Boot** es un proyecto que forma parte del ecosistema **Spring** que introduce el concepto de "convención sobre configuración". La idea principal de este concepto es que, en lugar de configurar usted mismo todas las configuraciones de un framework,**Spring Boot** le ofrece una configuración predeterminada que puede personalizar según sea necesario. El resultado, en general, es que escribe menos código porque sigue convenciones conocidas y su aplicación se diferencia de otras en pocas o pequeñas formas. Entonces, en lugar de escribir todas las configuraciones para todas y cada una de las aplicaciones, es más eficiente comenzar con una configuración predeterminada y solo cambiar lo que es diferente de la convención. Hablaremos más sobre **Spring Boot** a partir del capítulo 7.

El ecosistema de **Spring** es vasto y contiene muchos proyectos. Algunos de ellos se encuentran con más frecuencia que otros, y es posible que algunos no los use en absoluto si está creando una aplicación sin una necesidad particular. En este libro, nos referimos solo a los proyectos que son esenciales para comenzar: **Spring Core**, **Spring Data** y **Spring Boot**. Puede encontrar una lista completa de proyectos que forman parte del ecosistema **Spring**. Puede encontrar mayor información en la página oficial de **Spring**: https://spring.io/proyectos/.

Alternativas para usar Spring

Realmente no podemos discutir alternativas a **Spring** porque alguien podría malinterpretarlos como alternativas a todo el ecosistema. Pero para muchos de los componentes y proyectos individuales que crean el ecosistema **Spring**, puede encontrar otras opciones, como otros frameworks o bibliotecas comerciales o de código abierto.



Por ejemplo, tomemos el contenedor Spring IoC. Hace años, la especificación Java EE era una solución muy apreciada por los desarrolladores. Con una filosofía ligeramente diferente, Java EE (que en 2017 fue de código abierto y rehecho en Jakarta EE, https://jakarta.ee/ ) ofreció especificaciones como contexto e inyección de dependencia.(CDI) o Enterprise Java Beans(EJB). Puede usar CDI o EJB para administrar un contexto de instancias de objetos e implementar aspectos (llamados "interceptores" en la terminología de EE). Además, a lo largo de la historia, Google Guice ( https://github.com/google/guice ) fue un marco apreciado para la gestión de instancias de objetos en un contenedor.



Para algunos de los proyectos tomados individualmente, podría encontrar una o más alternativas. Por ejemplo, puede elegir usar Apache Shiro ( https://shiro.apache.org/ ) en lugar de Spring Security. O podría decidir implementar su aplicación web usando el marco Play ( https://www.playframework.com/ ) en lugar de Spring MVC y tecnologías relacionadas con Spring.



Un proyecto más reciente que parece prometedor es Red Hat Quarkus. Quarkus está diseñado para implementaciones nativas en la nube y se vuelve cada vez más maduro con pasos rápidos. No me sorprendería verlo como uno de los proyectos líderes en el desarrollo de aplicaciones empresariales en el ecosistema de Java en el futuro ( https://quarkus.io/ ).



Mi consejo para ti es que siempre tengas en cuenta tus alternativas. En el desarrollo de software, debe tener la mente abierta y nunca confiar en una solución como "la única". Siempre encontrará escenarios en los que una tecnología específica funciona mejor que otra.

1.3 Primavera en escenarios del mundo real
Ahoraque tiene una visión general de Spring, sabe cuándo y por qué debe usar un marco. En esta sección, le daré algunos escenarios de aplicación en los que el uso del marco Spring podría ser una excelente opción. Con demasiada frecuencia, he visto que los desarrolladores solo se refieren a las aplicaciones de back-end para usar un marco como Spring. Incluso he visto una tendencia de restringir, aún más, el escenario a las aplicaciones web de back-end. Si bien es cierto que en muchos casos vemos que Spring se usa de esta manera, es importante recordar que el marco no se limita a este escenario. He visto equipos que usan Spring con éxito en diferentes tipos de aplicaciones, como el desarrollo de una aplicación de prueba de automatización o incluso en escenarios de escritorio independientes.

Le describiré con más detalle algunos escenarios comunes del mundo real en los que he visto que Spring se usa con éxito. Estos no son los únicos escenarios posibles, y Spring podría no funcionar todo el tiempo en estos casos. Recuerde lo que discutimos en la sección 1.2: un marco no siempre es una buena opción. Pero estos son casos comunes en los que, por lo general, Spring encaja bien:

El desarrollo de una aplicación backend

El desarrollo de un marco de pruebas de automatización.

El desarrollo de una aplicación de escritorio.

El desarrollo de una aplicación móvil.

1.3.1 Uso de Spring en el desarrollo de una aplicación de backend
ALa aplicación backend es la parte de un sistema que se ejecuta en el lado del servidor y tiene la responsabilidad de administrar los datos y atender las solicitudes de las aplicaciones de los clientes. Los usuarios acceden a las funcionalidades utilizando directamente las aplicaciones cliente. Además, las aplicaciones cliente realizan solicitudes a la aplicación backend para trabajar con los datos de los usuarios. La aplicación de back-end puede usar bases de datos para almacenar datos o comunicarse con otras aplicaciones de back-end de diferentes maneras.

Puede imaginar, en un escenario del mundo real, que la aplicación sería la aplicación de back-end que administra las transacciones en sus cuentas bancarias. Los usuarios pueden acceder a sus cuentas y administrarlas a través de una aplicación web (banca en línea) o una aplicación móvil. Tanto las aplicaciones móviles como las aplicaciones web representan clientes para la aplicación de back-end. Para administrar las transacciones de los usuarios, la aplicación de back-end debe comunicarse con otras soluciones de back-end, y parte de los datos que administra deben conservarse en una base de datos. En la figura 1.5, puede visualizar la arquitectura de dicho sistema.

