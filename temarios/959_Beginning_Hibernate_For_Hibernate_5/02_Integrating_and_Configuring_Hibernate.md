# Chapter 2: Integrating and Configuring Hibernate

* The Steps Needed to Integrate and Configure Hibernate
* Understanding Where Hibernate Fits into Your Java Application
* Deploying Hibernate
* Installing Maven
* Connection Pooling
* Summary

Integrar Hibernate en una aplicación Java es fácil. Los diseñadores de Hibernate evitaron algunas de las trampas y problemas más comunes con las soluciones de persistencia de Java existentes y crearon una arquitectura limpia pero poderosa. En la práctica, esto significa que no tiene que ejecutar Hibernate dentro de ningún contenedor o marco Java EE en particular. A partir de Hibernate 5.2, se requiere Java 8 o posterior, gracias a la integración de la API de fecha y hora y otras características útiles.1

Al principio, agregar Hibernate a su proyecto Java parece intimidante: la distribución incluye un gran conjunto de bibliotecas. Para que su primera aplicación de Hibernate funcione, debe configurar las referencias de la base de datos y la configuración de Hibernate, lo que podría incluir la asignación de sus objetos a la base de datos. También debe crear sus POJO, incluido cualquier mapeo basado en anotaciones. ¡Después de haber hecho todo eso, necesita escribir la lógica en su aplicación que usa Hibernate para lograr algo! Pero una vez que aprenda cómo integrar Hibernate con su aplicación, los conceptos básicos se aplican a cualquier proyecto que use Hibernate.

Una de las características clave del diseño de Hibernate es el principio de mínima intrusión: los desarrolladores de Hibernate no querían que Hibernate se entrometiera en su aplicación más de lo necesario. Esto condujo a varias de las decisiones arquitectónicas que se tomaron para Hibernate. En el Capítulo 1, vio cómo se puede aplicar Hibernate para resolver problemas de persistencia utilizando objetos Java convencionales. En este capítulo, explicamos algunos de los detalles de configuración necesarios para soportar este comportamiento.

Los pasos necesarios para integrar y configurar Hibernate
Este capítulo explica la configuración y la integración en detalle, pero para obtener una descripción general rápida, consulte la siguiente lista para determinar qué debe hacer para poner en funcionamiento su primera aplicación Hibernate. Luego, el Capítulo 3 lo guiará a través de la construcción de un par de pequeñas aplicaciones de ejemplo que usan Hibernate. El primero de estos ejemplos es tan simple como podríamos hacerlo, por lo que es una excelente introducción a los siguientes pasos necesarios:

Identifique los POJO que tienen una representación de base de datos.

Identifique qué propiedades de esos POJO deben conservarse.

Anote cada uno de los POJO para mapear las propiedades de su objeto Java a columnas en una tabla de base de datos (tratado con más detalle en el Capítulo 6).

Cree el esquema de la base de datos con la herramienta de exportación de esquemas, use una base de datos existente o cree su propio esquema de base de datos.

Agregue las bibliotecas Java de Hibernate a la ruta de clases de su aplicación (que se tratan en este capítulo).

Cree un archivo de configuración XML de Hibernate que apunte a su base de datos y sus clases asignadas (cubierto en este capítulo).

En su aplicación Java, cree un objeto de configuración de Hibernate que haga referencia a su archivo de configuración XML (cubierto en este capítulo).

También en su aplicación Java, construya un objeto Hibernate SessionFactory desde el objeto Configuración (cubierto en este capítulo).

Recupere los objetos de sesión de Hibernate de SessionFactory y escriba su lógica de acceso a datos para su aplicación (crear, recuperar, actualizar y eliminar).

No se preocupe si no comprende todos los términos o conceptos mencionados en esta lista. Después de leer este capítulo y luego seguir el ejemplo en el próximo capítulo, sabrá qué significan estos términos y cómo encajan entre sí.

## The Steps Needed to Integrate and Configure Hibernate
## Understanding Where Hibernate Fits into Your Java Application
## Deploying Hibernate
## Installing Maven
## Connection Pooling
## Summary
