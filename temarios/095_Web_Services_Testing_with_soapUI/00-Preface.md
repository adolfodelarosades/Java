# Prefacio
Este libro trata sobre el uso de soapUI para pruebas funcionales y de rendimiento de soluciones orientadas a servicios. soapUI se puede utilizar para probar varios aspectos de una solución orientada a servicios sin simplemente desempeñar el papel de una herramienta de invocación de servicios web. Seguiremos un enfoque de estilo de tutorial simple a lo largo del libro en el que exploraremos todas las funciones clave proporcionadas por soapUI basadas en un proyecto de servicios web de muestra. Este libro está idealmente diseñado para guiar a los lectores a obtener una visión más detallada de soapUI mediante la realización de muchos ejercicios prácticos.

## Lo que cubre este libro

**Capítulo 1**, ***Web Services Testing and soapUI - Pruebas de servicios web y soapUI***, presenta **soapUI** al brindar una descripción general de su historial, características e instalación de **soapUI** en su computadora. Comenzaremos nuestro viaje hacia el aprendizaje de **soapUI** discutiendo algunas características clave de **SOA**, servicios web(Web services) y pruebas de servicios web en general.

**Capítulo 2**, ***The Sample Project - El proyecto de muestra***, presenta el proyecto de servicios web de muestra que se utilizará como aplicación de destino para las pruebas funcionales y de rendimiento en los capítulos restantes del libro. En este capítulo, construiremos una aplicación simple basada en servicios web utilizando el marco de servicios web de código abierto **Apache Axis2**. El objetivo principal de crear esta aplicación de muestra es usarla en todas las demostraciones de funciones de **soapUI**. Como en este capítulo no trataremos ningún tema relacionado con **soapUI** o las pruebas de servicios web en general, puede omitir los detalles y descargar el proyecto de servicios web de muestra de http://www.PacktPub.com/support.

**Capítulo 3**, ***First Steps with soapUI and Projects - Primeros pasos con SOAPUI y Proyectos***, sirve como guía para comenzar con los proyectos **soapUI**. Basado en uno de los servicios web que creamos como parte del proyecto de servicios web de muestra en el Capítulo 2 El proyecto de muestra, discutiremos el ***schema*** y ***WSDL*** del servicio web en detalle. Usaremos **soapUI** para invocar las operaciones del servicio web de muestra y discutir las solicitudes, respuestas y fallas de **SOAP**.

**Capítulo 4**, ***Working with Your First TestSuite - Trabajar con su primer TestSuite***, demuestra las construcciones básicas de un proyecto de **soapUI** (**TestSuites**, **TestCases** y **TestSteps**) que lo preparan para los siguientes capítulos del libro. También analizaremos la validación de las respuestas mediante aserciones(assertions) y propiedades de **soapUI**.

El **Capítulo 5**, Pruebas de carga y rendimiento con SOAPUI, cubre los pasos que debe seguir al usar SOAPUI como una herramienta de prueba de carga y rendimiento. Demostraremos las estrategias de prueba de carga proporcionadas por soapUI y las afirmaciones específicas de la prueba de carga.

**Capítulo 6**, ***Load and Performance Testing with soapUI - Simulación de servicios web con soapUI***, describe brevemente cómo se pueden simular los servicios web mediante **soapUI**. Demostraremos el uso del modelo de servicios simulados de **soapUI** y las respuestas simuladas tanto estáticas como dinámicas.

**Capítulo 7**, ***Web Services Simulation with soapUI - Pruebas funcionales avanzadas con soapUI***, presenta los aspectos de prueba de las extensiones de servicios web como **WS-Security** y **WS-Addressing**. Usaremos una versión mejorada del proyecto de servicios web de muestra que creamos en el Capítulo 2, El proyecto de muestra para las demostraciones de este capítulo.

**Capítulo 8**, ***Getting Started with REST Testing - Primeros pasos con las pruebas REST***, presenta los conceptos relacionados con los servicios web **RESTful** y cómo se puede utilizar **soapUI** en las pruebas de servicios **RESTful**. Demostraremos el uso de **soapUI** en las pruebas de servicios **RESTful** mediante el uso de una aplicación web de muestra alojada públicamente.

**Capítulo 9**, ***Testing Databases with soapUI - Probar Bases de Datos con soapUI***, describe brevemente las invocaciones de consultas directas a bases de datos de **soapUI**. En este capítulo, analizaremos las funciones de prueba de la base de datos proporcionadas por **soapUI**, como las solicitudes y aserciones de **JDBC**.

**Capítulo 10**, ***JMS Testing with soapUI - Pruebas de JMS con soapUI***, demuestra el uso de **JMS** en **soapUI**. Al exponer uno de los servicios web de muestra sobre el transporte **JMS**, exploraremos las capacidades de prueba de **JMS** proporcionadas por **soapUI**.

**Capítulo 11**, ***Extending soapUI with Scripting - Ampliación de soapUI con secuencias de comandos***, presenta las scripting(funciones de secuencias de comandos) proporcionadas por **soapUI** para ampliar el comportamiento predeterminado de las pruebas de **soapUI**. Analizaremos el uso de los métodos API de **soapUI** a través de scripts **Groovy** dentro de nuestras pruebas.

El **Capítulo 12**, ***Automated Testing with soapUI - Pruebas automatizadas con soapUI***, demuestra varios enfoques de pruebas automatizadas con **soapUI**. En este capítulo, analizaremos la integración de las pruebas de **soapUI** con herramientas de compilación como **Apache Maven**.

El **Capítulo 13**, ***Miscellaneous Topics - Temas varios***, presenta algunas herramientas útiles integradas con **soapUI**, como la herramienta de validación **WS-I** y las utilidades proporcionadas por el framework de servicios web externos, como **Apache Axis2**. Este capítulo también demuestra el uso de **soapUI** al probar servicios mediante el envío de archivos adjuntos.
