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

**Spring Framework** (en breve, **Spring**) es un framework de aplicación que forma parte del ecosistema de Java. Un marco de aplicaciónes un conjunto de funcionalidades comunes de software que proporciona una estructura básica para desarrollar una aplicación. Un marco de aplicación facilita el esfuerzo de escribir una aplicación al eliminar el esfuerzo de escribir todo el código del programa desde cero.

Usamos Spring en el desarrollo de muchos tipos de aplicaciones hoy en día, desde grandes soluciones de back-end hasta aplicaciones de prueba de automatización. Según muchos informes de encuestas sobre tecnologías Java (como este de JRebel de 2020: http://mng.bz/N4V7 ; o este de JAXEnter: http://mng.bz/DK9a ), Spring es el Java más utilizado. marco hoy.

Spring es popular y los desarrolladores han comenzado a usarlo con más frecuencia con otros lenguajes JVM además de Java. En los últimos años, observamos un crecimiento impresionante de desarrolladores que usan Spring con Kotlin (otro lenguaje apreciado de la familia JVM). En este libro, nos centraremos en los fundamentos de Spring y le enseñaré las habilidades esenciales para usar Spring en ejemplos del mundo real. Para que el tema le resulte más cómodo y le permita concentrarse en Spring, usaremos solo ejemplos de Java. A lo largo del libro, discutiremos y aplicaremos, con ejemplos, habilidades esenciales como conectarse a una base de datos, establecer comunicación entre aplicaciones y asegurar y probar una aplicación.

Antes de sumergirnos en más detalles técnicos en los próximos capítulos, hablemos sobre Spring Framework y dónde lo usará realmente. ¿Por qué Spring es tan apreciado y cuándo debería usarlo?

En este capítulo, nos centraremos en qué es un framework, refiriéndonos en particular al framework Spring. En la sección 1.1, discutimos las ventajas de usar un marco. En la sección 1.2, analizamos el ecosistema de Spring con los componentes que necesita aprender para comenzar con Spring. Luego, lo guiaré a través de los posibles usos del marco Spring, en particular, los escenarios del mundo real en la sección 1.3. En la sección 1.4, discutiremos cuándo usar marcos podría no ser el enfoque correcto. Debe comprender todas estas cosas sobre Spring Framework antes de intentar usarlo. De lo contrario, podría intentar usar un martillo para cavar su jardín.

Dependiendo de tu nivel, puedes sentir que este capítulo es difícil. Podría introducir algunas nociones de las que no has oído hablar, y este aspecto podría perturbarte. Pero no te preocupes; incluso si no entiende algunas de las cosas ahora, se aclararán más adelante en el libro. A veces, a lo largo del libro, me referiré a algo dicho en capítulos anteriores. Uso este enfoque porque aprender un marco como Spring no siempre nos ofrece una ruta de aprendizaje lineal y, a veces, debe esperar hasta obtener más piezas del rompecabezas antes de ver la imagen completa. Pero al final, obtendrá una imagen clara y obtendrá las habilidades valiosas que necesita para desarrollar aplicaciones como un profesional.

1.1 ¿Por qué debemos usar marcos?
EnEn esta sección, discutimos los marcos. ¿Qué son? ¿Cómo apareció este concepto y por qué? Para estar motivado para usar algo, necesita saber cómo ese algo le aporta valor. Y ese es también el caso de Spring. Te enseñaré estos detalles esenciales compartiendo el conocimiento que obtuve de mi propia experiencia y estudiando y usando varios marcos en escenarios del mundo real, incluido Spring.

Un marco de aplicación es un conjunto de funcionalidades sobre las cuales construimos aplicaciones. El marco de la aplicación nos proporciona un amplio conjunto de herramientas y funcionalidades que puede utilizar para crear aplicaciones. No necesita usar todas las funciones que ofrece el marco. Dependiendo de los requisitos de la aplicación que cree, elegirá las partes correctas del marco para usar.

Aquí hay una analogía que me gusta para los marcos de aplicación. ¿Alguna vez compraste un mueble en una tienda de bricolaje como Ikea? Supongamos que compra un guardarropa: no obtendrá un guardarropa ensamblado, sino los componentes correctos que necesita para construirlo y un manual sobre cómo ensamblar su mueble. Ahora imagine que ordenó un armario, pero en lugar de obtener solo los componentes correctos que necesita, obtiene todos los componentes posibles que puede usar para ensamblar cualquier mueble: una mesa, un armario, etc. Si quieres un armario, tienes que encontrar las piezas adecuadas y montarlas. Es como un marco de aplicación. El marco de la aplicación le ofrece varias piezas de software que necesita para crear su aplicación. Necesita saber qué características elegir y cómo ensamblarlas para lograr el resultado correcto (figura 1.1).
