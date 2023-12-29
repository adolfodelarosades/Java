# Introducción

## Atención al cliente

Bienvenido a Aprender Java Lambdas.

Java experimentó grandes cambios en su versión 8. Mucho fue impulsado por la percepción de que Java se estaba volviendo obsoleto. Para competir con los lenguajes de programación funcionales y modernos, Java 8 introdujo construcciones de programación funcional como lambdas para admitir mejor un estilo más funcional.

Este libro ofrece una explicación concisa de lambdas y otras características necesarias para que funcionen en Java. Además de ofrecer ejemplos de antecedentes, sintaxis y uso de lambdas, el libro describe otras características relacionadas, como interfaces funcionales e inferencia de tipos.

El camino hacia el Java moderno
Java 8 se lanzó el 18 de marzo de 2014, dos años y siete meses después del lanzamiento anterior. Estuvo plagado de retrasos y problemas técnicos, pero cuando finalmente llegó, representó uno de los mayores cambios en Java desde Java 5.

Los protagonistas fueron, por supuesto, lambdas y una modernización para respaldar ideas de programación funcional. Con lenguajes como Scala ocupando un lugar central y la tendencia moderna hacia la programación funcional, Java tenía que hacer algo para mantenerse al día.

Aunque Java no es ni será nunca un lenguaje de programación funcional puro , los cambios en Java 8 permitieron a los desarrolladores utilizar modismos funcionales más fácilmente que en versiones anteriores. Con disciplina y experiencia, ahora puedes obtener muchos de los beneficios de la programación funcional sin recurrir a bibliotecas de terceros.

Funciones modernas de Java
Para darle una idea de cuán grande fue el cambio de Java 8 y por qué marcó el comienzo de un Java nuevo y moderno, aquí hay una lista casi completa de las nuevas características que introdujo:

Soporte lambda.
Las API principales se actualizaron para aprovechar las lambdas, incluidas las API de colección y un nuevo paquete funcional para ayudar a crear construcciones funcionales.
Se desarrollaron API completamente nuevas que utilizan lambdas, cosas como la API de flujo que trajo un procesamiento de datos de estilo funcional. Por ejemplo, funciones como mapy flatMapdesde la API de flujo permiten una forma declarativa de procesar listas y pasar de la iteración externa a la iteración interna. Esto, a su vez, permite a los proveedores de bibliotecas preocuparse por los detalles y optimizar el procesamiento como quieran. Por ejemplo, Java ahora viene con una forma paralela de procesar flujos sin molestar al desarrollador con los detalles.
Cambios menores en las API principales; Se introdujeron nuevos métodos auxiliares para cadenas, colecciones, comparadores, números y matemáticas.
Algunas de las adiciones están cambiando la forma en que las personas codifican. Por ejemplo, la Optionalclase resultará familiar para algunos y permite una mejor manera de tratar los valores nulos.
Hubo varias mejoras en la biblioteca de concurrencia. Cosas como un mapa hash concurrente mejorado, futuros completables, acumuladores seguros para subprocesos, un bloqueo de lectura y escritura mejorado (llamado StampedLock), una implementación de un grupo de subprocesos de robo de trabajo y mucho más.
Soporte para agregar métodos estáticos a interfaces.
Métodos predeterminados (también conocidos como extensión virtual o métodos de defensa ).
Se mejoró la inferencia de tipos y se introdujeron nuevas construcciones como interfaces funcionales y referencias de métodos para admitir mejor lambdas.
Se introdujo una API de fecha y hora mejorada (similar a la Joda-timebiblioteca popular).
Los paquetes IOy NIOrecibieron adiciones bienvenidas para permitir trabajar con transmisiones IO utilizando la nueva API de transmisiones.
Se mejoraron la reflexión y las anotaciones.
Un motor JavaScript completamente nuevo incluido con Java 8. Nashorn reemplazó a Rhino, era más rápido y tenía mejor soporte para ECMA-Script.
mejoras de JVM; Se completó la integración con JRocket, creando una JVM más rápida.
La JVM abandonó la idea de la generación permanente y en su lugar utilizó la memoria nativa del sistema operativo para los metadatos de clase. Esto es muy importante y proporciona una mejor utilización de la memoria.
La integración de JRocket también trajo el control de misión (jmc) al JDK como estándar. Complementa JConsole y VisualVM con una funcionalidad similar pero agrega creación de perfiles muy económica.
Otras mejoras diversas, como mejoras en JavaFX, compatibilidad con codificación base64 y más.
