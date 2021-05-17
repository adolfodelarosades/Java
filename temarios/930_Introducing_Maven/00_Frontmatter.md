# Frontmatter

Cualquier código fuente u otro material complementario al que el autor haga referencia en este libro está disponible para los lectores a través de la página del producto del libro, ubicada en www.apress.com/978-1-4842-5409-7. Para obtener información más detallada, visite http://www.apress.com/source-code.

ISBN 978-1-4842-5409-7e-ISBN 978-1-4842-5410-3 https://doi.org/10.1007/978-1-4842-5410-3

### Introducción

La introducción de Maven proporciona una introducción concisa a Maven, el estándar de facto para crear, administrar y automatizar proyectos basados en Java y JEE en empresas de todo el mundo. El libro comienza explicando los conceptos fundamentales de Maven y mostrándole cómo configurar y probar Maven en su máquina local. Luego, profundiza en conceptos como la administración de dependencias, las fases del ciclo de vida, los complementos y los objetivos. También analiza las convenciones de la estructura del proyecto, la creación de proyectos de inicio rápido utilizando arquetipos y la documentación y la generación de informes. Finalmente, concluye con una discusión sobre el proceso de lanzamiento de Maven y la integración con Jenkins.

### Cómo está estructurado este libro

El capítulo 1 comienza con una suave introducción a Maven. Analiza las razones para adoptar Maven y proporciona una descripción general de sus dos alternativas: Ant y Gradle.

El Capítulo 2 se enfoca en configurar Maven en su máquina y probar la instalación. También proporciona una descripción general del archivo `settings.xml` de Maven y le muestra cómo ejecutar Maven en un entorno habilitado para proxy HTTP.

El capítulo 3 profundiza en la gestión de la dependencia de Maven. A continuación, analiza las coordenadas GAV que utiliza Maven para identificar de forma única sus artefactos. Finalmente, cubre las dependencias transitivas y el impacto que tienen en las compilaciones.

El Capítulo 4 analiza la organización de un proyecto básico de Maven y cubre los elementos importantes de un archivo `pom.xml`. Luego, aprenderá a probar el proyecto con JUnit.

El Capítulo 5 proporciona una cobertura detallada del ciclo de vida, los complementos, las fases de compilación y los objetivos de Maven. Luego lo guía a través del proceso de creación y uso de un complemento simple de Maven.

El Capítulo 6 presenta las plantillas de proyectos de arquetipos que le permiten iniciar nuevos proyectos rápidamente. Los arquetipos incorporados se utilizan para generar un proyecto Java, un proyecto web y un proyecto de varios módulos. Luego, creará un arquetipo personalizado desde cero y lo usará para generar un nuevo proyecto.

El Capítulo 7 cubre los conceptos básicos de la generación de sitios usando Maven. Luego analiza la generación de informes y la documentación, como Javadocs, informes de cobertura de prueba e informes de SpotBugs y cómo integrarlos en un sitio de Maven.

El capítulo 8 comienza con una discusión sobre el administrador de repositorio de Nexus y le muestra cómo se puede integrar con Maven. Luego proporciona una cobertura completa del proceso de lanzamiento de Maven y sus diferentes fases.

El Capítulo 9 presenta conceptos de integración continua (CI) y analiza la instalación y configuración en Jenkins, una herramienta de código abierto para la integración continua.

### Público objetivo

La introducción de Maven está dirigida a desarrolladores e ingenieros de automatización que deseen comenzar rápidamente con Apache Maven. Este libro asume conocimientos básicos de Java. No se requiere experiencia previa con Maven.

### Descarga del código fuente

El código fuente de los ejemplos de este libro se puede descargar a través del botón Descargar código fuente ubicado en www.apress.com/978-1-4842-5409-7.

Una vez descargado, descomprima el código y coloque el contenido en la carpeta C:\apress\gswm-book. El código fuente está organizado por capítulos individuales. Cuando corresponda, las carpetas de los capítulos contienen el proyecto `gswm` con los archivos mínimos para comenzar con las listas de códigos de ese capítulo. Las carpetas de capítulos también contienen una carpeta denominada final, que contiene el estado final esperado de los proyectos.

## Table of Contents

### Chapter 1: Getting Started with Maven

* Standardized Directory Structure
* Declarative Dependency Management
* Plug-ins
* Uniform Build Abstraction
* Tools Support
* Archetypes
* Open Source
* Maven Alternatives
   * Ant + Ivy
   * Gradle
* Maven Components
   * Maven SCM
   * Maven Wagon
   * Maven Doxia
* Summary

### Chapter 2: Setting Up Maven

* Installing on Windows
* Installing on Mac
* Testing Installation
* Getting Help
* Additional Settings
* Setting Up a Proxy
   * Securing Passwords
* IDE Support
* Summary

### Chapter 3: Maven Dependency Management

* Using New Repositories
* Dependency Identification
* Transitive Dependencies
* Dependency Scope
* Manual Dependency Installation
* Summary

### Chapter 4: Maven Project Basics

* Basic Project Organization
* Understanding the pom.xml File
* Building a Project
* Testing the Project
* Properties in pom.xml
   * Implicit Properties
   * User-Defined Properties
* Summary

### Chapter 5: Maven Lifecycle

* Goals and Plug-ins
* Lifecycle and Phases
* Plug-in Development
* Summary

### Chapter 6: Maven Archetypes

* Built-in Archetypes
* Generating a Web Project
* Multimodule Project
* Creating an Archetype
* Using the Archetype
* Summary

### Chapter 7: Documentation and Reporting

* Using the Site Lifecycle
* Advanced Site Configuration
* Generating Javadoc Reports
* Generating Unit Test Reports
* Generating Code Coverage Reports
* Generating the SpotBugs Report
* Summary

### Chapter 8: Maven Release

* Integration with Nexus
* Project Release
* Git Client Installation
* Creating a GitHub Repository
* Checking in Source Code
* Maven Release
   * Prepare Goal
   * Clean Goal
   * Perform Goal
* Summary

### Chapter 9: Continuous Integration

* Installing Jenkins
* Maven Project
* Configuring Jenkins
* Triggering Build Job
* Summary

### Autor

http://blog.inflinx.com/

