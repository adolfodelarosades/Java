# 2. Elegir sus herramientas y comenzar

* ¿Maven o Gradle?
    * Apache Maven
    * Gradle
    * Elegir entre Maven y Gradle
* ¿Java o Kotlin?
    * Java
    * Kotlin
* Elegir entre Java y Kotlin
* Elegir una versión de Spring Boot
* El Spring Initializr
* Línea de comandos directa de Outta (Outta Commandline)
* Permanecer en entornos de desarrollo integrados (IDE)
* Cruising down main()
* Resumen

Comenzar a crear aplicaciones Spring Boot es fácil, como verá pronto. La parte más difícil puede ser decidir cuál de las opciones disponibles le gustaría elegir.

En este capítulo, examinaremos algunas de las excelentes opciones que tiene disponibles para crear aplicaciones Spring Boot: sistemas de compilación, lenguajes, cadenas de herramientas, editores de código y más.

¿Maven o Gradle?
Históricamente, los desarrolladores de aplicaciones Java han tenido algunas opciones para las herramientas de construcción de proyectos. Algunos han caído en desgracia con el tiempo, por una buena razón, y ahora nos hemos unido como una comunidad en torno a dos: Maven y Gradle. Spring Boot soporta ambos con igual aplomo.

Apache Maven
Maven es una opción popular y sólida para un sistema de automatización de construcción. Ha existido durante bastante tiempo, habiendo tenido su comienzo en 2002 y convirtiéndose en un proyecto de alto nivel en la Apache Software Foundation en 2003. Su enfoque declarativo era (y es) conceptualmente más simple que las alternativas de la época y de ahora: simplemente cree un archivo con formato XML llamado pom.xml con las dependencias y complementos deseados. Cuando ejecuta el comando mvn, puede especificar una "fase" para completar, que realiza una tarea deseada como compilar, eliminar resultados anteriores, empaquetar, ejecutar una aplicación y más.
