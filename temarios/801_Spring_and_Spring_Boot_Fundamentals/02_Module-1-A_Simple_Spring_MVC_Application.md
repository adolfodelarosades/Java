# 2 Module 1: A Simple Spring MVC Application

### Descripción

La Introducción discute la historia de Spring y cómo Spring Boot hace que sea mucho más fácil crear y configurar aplicaciones Spring.

### Transcripción

Bienvenido al primer módulo en la ruta de aprendizaje Spring y Spring Boot. La idea en este módulo es que queremos construir una aplicación muy simple que utilice algunas de las funciones básicas de Spring. Ahora, para hablar sobre Spring, quiero mostrarles esta página aquí. 

https://spring.io/

Esta es la página de inicio del marco Spring. Esto es en spring.io. Todo lo que necesitará, en términos de documentación, API y todo, comienza en esta página. Ahora, esta página habla de todo lo relacionado con Spring, y si me desplazo hacia abajo, verá que hay mucha información sobre Boot and Cloud y otros problemas de Cloud, pero esta es la parte que quería mostrarle, esta figura en particular. 

Esta figura ilustra que hay dos formas diferentes, fundamentalmente diferentes, de construir una aplicación en Spring. Una es usar lo que se refieren aquí como la pila de servlets. La idea es construir una aplicación web tradicional, y hay un marco para eso en Spring llamado Spring MVC. 

Y la alternativa es usar esta pila reactiva en el otro lado. La idea es crear una aplicación basada en eventos basada en la especificación de flujo reactivo. En los módulos subsiguientes veremos ambos, pero para la introducción básica, quiero comenzar con la pila básica Spring MVC. El lugar en el que comienza a crear una aplicación es lo que llaman Spring Initializer, o en start.spring.io. 

Entonces esta es la página web, start.spring.io. Y para esta primera aplicación, voy a echar un vistazo a esto, pero déjenme decirles ahora que todos los IDE principales tienen este mecanismo incorporado. Quiero decir, IntelliJ Idea, las herramientas basadas en Eclipse como Spring Tool Suite o incluso NetBeans tienen un complemento que le permite acceder a este sitio desde el IDE. Pero en caso de que no esté utilizando un IDE o simplemente quiera ver el sitio en sí, aquí está. 

Y esto nos dará la oportunidad de ver qué hay disponible aquí. Entonces, la idea detrás del Initializer es que generes un proyecto, y los proyectos de Spring básicamente se construyen usando una herramienta de construcción, ya sea Maven o Gradle aquí. 

En estos videos voy a usar Gradle. No hay nada malo con Maven. Esta perfectamente bien. Pero estoy más cómodo con Gradle. Sé cómo solucionar problemas con él, así que me quedaré con eso. Tenemos una selección de idiomas, Java, Kotlin o Groovy. En este video vamos a seguir con Java, pero es perfectamente válido construir una aplicación usando Groovy o Kotlin. 

Spring tiene un excelente soporte para ambos. Y la versión actual de Spring Boot, en el momento de esta grabación, es 2.1.3, y siempre puede obtener la última versión directamente en la lista desplegable. Entonces, en este video, vamos a pasar por el proceso de construir una aplicación, ensamblarla, importarla a un IDE, agregar un controlador, agregar un servicio web RESTful, escribir algunas pruebas y construir todo para que Puede ver el proceso general de trabajar con Spring desde el Inicializador hasta el mecanismo de prueba. Y eso vendrá en todas las secciones posteriores de este módulo.

