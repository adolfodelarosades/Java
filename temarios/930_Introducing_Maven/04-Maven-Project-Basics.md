# Chapter 4: Maven Project Basics

* Basic Project Organization
* Understanding the pom.xml File
* Building a Project
* Testing the Project
* Properties in pom.xml
   * Implicit Properties
   * User-Defined Properties
* Summary

Maven proporciona convenciones y un diseño de directorio estándar para todos sus proyectos. Como se discutió en el Capítulo 1, esta estandarización proporciona una interfaz de construcción uniforme y también facilita a los desarrolladores saltar de un proyecto a otro. Este capítulo explicará los conceptos básicos de un proyecto Maven y el archivo ` pom.xml`.

## Organización básica del proyecto

La mejor manera de comprender la estructura del proyecto Maven es mirar uno. La Figura 4-1 ilustra un proyecto Java básico basado en Maven.

![image](https://user-images.githubusercontent.com/23094588/118805639-71e75500-b8a6-11eb-81ee-1994e9bb3874.png)

***Figura 4-1*** Estructura del proyecto Java de Maven

Ahora veamos cada uno de los componentes del proyecto:

* El `gswm` es la carpeta raíz del proyecto. Normalmente, el nombre de la carpeta raíz coincide con el nombre del artefacto generado.
* La carpeta `src` contiene artefactos relacionados con el proyecto, como código fuente o archivos de propiedades, que normalmente le gustaría administrar en un *source control management* (SCM), como SVN o Git.
* La carpeta `src/main/java` contiene el código fuente de Java.
* La carpeta `src/test/java` contiene el código de prueba de unidad de Java.
* La carpeta `target` contiene artefactos generados, como archivos `.class`. Los artefactos generados normalmente no se almacenan en SCM, por lo que no compromete la carpeta target y su contenido en SCM.
* El archivo `LICENSE.txt` contiene información de licencia relacionada con el proyecto.
* El archivo `README.txt` contiene información/instrucciones sobre el proyecto.
* El archivo `NOTICE.txt` contiene avisos requeridos por libraries de terceros utilizadas por este proyecto.
* Cada proyecto de Maven tiene un archivo `pom.xml` en la raíz del proyecto. Contiene información sobre el proyecto y la configuración, como dependencias y complementos.

Además de los directorios `src/main` y `src/test`, Maven recomienda varios otros directorios para contener archivos y recursos adicionales. La Tabla 4-1 enumera esos directorios junto con el contenido que los incluye.

***Tabla 4-1*** Directorios Maven

Nombre del directorio | Descripción
----------------------|------------
`src/main/resources`  | Contiene recursos, como archivos de configuración de Spring y plantillas de velocity, que deben terminar en el artefacto generado.

## Understanding the pom.xml File
## Building a Project
## Testing the Project
## Properties in pom.xml
### Implicit Properties
### User-Defined Properties
## Summary
