# Web Services Testing with soapUI
By Charitha Kankanamge

![image](https://github.com/adolfodelarosades/Java/assets/23094588/3a232a07-2e92-482e-b7c4-720db2c9e03d)

* TIME TO COMPLETE: **7h 38m**
* TOPICS: **Automation Tools**
* PUBLISHED BY: **Packt Publishing**
* PUBLICATION DATE: **October 2012**
* PRINT LENGTH: **332 pages**

Comenzando con una descripción general de las pruebas de servicios web y SOA, esta guía lo lleva a través de una serie de ejercicios prácticos y proyectos para familiarizarse con soapUI. Una forma segura de elevar la calidad de sus servicios web.

* Sea más competente en la prueba de servicios web incluidos en sus soluciones orientadas a servicios
* Encuentre, analice y reproduzca errores de manera efectiva al adherirse a los mejores enfoques de prueba de servicios web
* Aprenda con instrucciones claras paso a paso y ejemplos prácticos sobre varios temas relacionados con las pruebas de servicios web usando soapUI

## En detalle

La calidad es la clave del éxito de los proyectos orientados a servicios. La utilización de herramientas adecuadas es importante para el resultado de la metodología de prueba de Servicios Web. Al ser la principal herramienta de prueba de Servicios Web de código abierto, **soapUI** ayuda a crear pruebas automatizadas sólidas y flexibles de manera productiva.

"Web Services Testing with soapUI" lo guía en la adopción de los mejores mecanismos de prueba de Servicios Web con la herramienta de prueba de código abierto líder en la industria, **SoapUI**. Aprenderá a usar **SoapUI** de manera efectiva para probar soluciones orientadas a servicios, centrándose en probar las características funcionales y no funcionales de los Servicios Web. **SoapUI** ***es capaz de probar fuentes de datos JDBC, aplicaciones web, servicios RESTful y Servicios Web expuestos en transportes como JMS***. El libro analiza todas estas características y muchas más, en detalle, a través de ejemplos prácticos y claros.

Este libro se centra en el aprendizaje de **SoapUI** para probar los Servicios Web de manera efectiva. Comienza con una introducción general a la **Service-Oriented Architecture - Arquitectura Orientada a Servicios (SOA)**, seguida de aspectos de prueba de soluciones orientadas a servicios. Este libro tiene como objetivo brindar a los lectores una descripción general completa del uso de **SoapUI** en **SOA** y proyectos de prueba de Servicios Web.

Comenzando con una descripción general de las pruebas de Servicios Web y **SOA**, rápidamente se ensuciará las manos con un proyecto de muestra que utiliza el motor de Servicios Web de código abierto, **Apache Axis2**. Todas las demostraciones y ejercicios prácticos se basan en este proyecto de muestra. Las pruebas en un proyecto de **SoapUI** se organizan en **TestSuites**, **TestCases** y **TestSteps**. También aprenderá cómo se puede usar **SoapUI** para pruebas funcionales y no funcionales. Luego, el libro enseña cómo, mediante el uso de secuencias de comandos maravillosas y la integración con **Junit** y **Maven**, **SoapUI** se puede usar fácilmente en pruebas de Servicios Web automatizados.

Al final, habrá aprendido a probar los aspectos funcionales y no funcionales de los Servicios Web y a automatizarlos integrándolos en sistemas de compilación continua mediante **SoapUI**.

## Table of Contents

* Web Services Testing with soapUI
* Credits
* About the Author
* Acknowledgement
* About the Reviewers
* www.PacktPub.com
   * Support files, eBooks, discount offers and more
      * Why Subscribe?
      * Free Access for Packt account holders
* Preface
   * What this book covers
   * What you need for this book
   * Who this book is for
   * Conventions
   * Reader feedback
   * Customer support
      * Downloading the example code
      * Errata
      * Piracy
      * Questions
### 1. Web Services Testing and soapUI

* SOA and web services
   * Service-oriented solutions
      * Case study
      * Building blocks of SOA
         * Web services
         * Mediation
         * Composition
* Simple Object Access Protocol
* Alternatives to SOAP
   * REST
   * Java Script Object Notation
* Web Services Description Language
* Message exchanging patterns
* SOAP Faults
* Approaches of testing web services
   * Unit testing of web services
   * Functional testing
      * Tool assisted testing
      * Using client APIs provided by service container middleware
   * Integration testing of web services
   * Performance testing of web services
   * The common challenges of Web services testing
      * Use of external web services
      * Implications of using complex standards and protocols
      * Headless nature of web services
* What is soapUI?
* Capabilities of soapUI
* Installing soapUI
   * System requirements
   * Installing soapUI on Linux
   * soapUI installation on Windows
   * Installing soapUI on MacOS
* A glance at soapUI user interface
* Summary

## 2. The Sample Project

* The problem domain
* Project pre-requisites
   * Java
   * Apache Ant
   * MySQL
   * Setting up Apache Axis2
   * Setting up project source directories
* Designing the web services
   * Creating the database
* Implementing the web services
   * Web services fault handling
   * Managing database operations
   * Completing the web service implementation classes
* Deploying web services
* Summary

## 3. First Steps with soapUI and Projects

* Understanding the web services definition
   * Schema
   * portType
   * binding
   * Service
* Creating a soapUI project
* Invoking the guest management web service
* A detailed look at SOAP requests and responses
* Generating SOAP Faults
* Summary

## 4. Working with Your First TestSuite

* A sample test scenario
* Creating a TestSuite
   * Adding TestCases
      * addRoom TestCase
      * getRoomDetails TestCase
      * deleteRoom TestCase
* Running the first TestSuite
   * Adding test assertions
      * Not SOAP Fault assertion
      * XPath Match assertion
      * The Contains assertion
* Adding properties to soapUI tests
   * Reading property values from a file
   * Transferring property values between TestSteps
* Summary

## 5. Load and Performance Testing with soapUI

* Non-functional testing of web services
   * Performance testing
* Planning for web service performance testing
* Using soapUI for performance testing
* Working with load tests in soapUI
   * Limit of a load test
   * Threads in a soapUI load test
   * Load test strategies of soapUI
      * Simple load strategy
      * Burst load strategy
      * Thread load strategy
      * Variance strategy
   * A closer look at the load test report and statistics of soapUI
   * Using load test assertions in soapUI
      * The Max Errors assertion
      * The Step Average assertion
      * Step TPS assertion
      * The Step Maximum assertion
      * The Step Status assertion
      * LoadTest options
* Summary

## 6. Web Service Simulation with soapUI

* Mocking in software testing
* Mocking in web services testing
   * Mock services and contract-first web service development
   * Simulating services that are not accessible
   * Dealing with test environmental restrictions
* Mock services with soapUI
   * The structure of soapUI MockService
      * MockService details
      * MockOperation details
      * Dispatching styles of MockOperation
      * MockResponse details
* soapUI mock services in action
   * Static responses – the basic scenario
      * Service chaining
      * Content-based routing
      * Message transformation
   * Using dynamic responses
* Summary

## 7. Advanced Functional Testing with soapUI

* Introduction to web services extensions
   * What is WS-Addressing
      * Endpoint references
      * Message addressing properties
   * What is WS-Security
      * WS-Policy
      * WS-SecurityPolicy
      * WS-Trust
      * WS-SecureConversation
* Configuring Apache Axis2 for WS-Addressing and WS-Security
   * WS-Addressing in Apache Axis2
   * WS-Security in Apache Axis2
   * Testing the WS-Addressing with soapUI
Validating the WS-Addressing responses
   * Testing WS-Security with soapUI
   * Web service authentication
      * Securing GuestManagementService
      * Testing the secured GuestManagementService with soapUI
   * Project level WS-Security configurations in soapUI
* Testing asymmetric binding policy with soapUI
   * Asymmetric binding
      * Signing SOAP messages
      * Securing RoomManagementService
      * Testing secured RoomManagementService with soapUI
         * Outgoing WS-Security configurations
         * Incoming WS-Security configurations
         * Applying WS-Security configurations to the SOAP request
* Validating WS-Security responses
* Summary

## 8. Getting Started with REST Testing

* Introduction to REST
   * Represent everything with URIs
   * Using standard HTTP methods
   * Linking resources together
   * Multiple representations of resources
   * Stateless communication
* Testing RESTful APIs using soapUI
* REST Services in soapUI
   * Request and response representation
   * Using POST or PUT requests in soapUI REST services
   * Reading POST message content from a file
   * Inserting the HTTP Basic Authentication header to requests
* REST parameters
   * Query parameters
   * Template parameters
   * Matrix parameters
   * Header parameters
* Functional testing of REST services
* WADL
* Summary

## 9. Testing Databases with soapUI

* Testing data in isolation
* Setting up soapUI to connect to the database
* JDBC Request TestStep
   * JDBC Request properties
* JDBC test assertions
   * Stored procedures with JDBC Request TestStep
   * Accessing soapUI properties from SQL query
* Summary

## 10. JMS Testing with soapUI

* Introduction to JMS
   * Setting up Apache ActiveMQ
* JMS integration in soapUI
   * Working with JMS messaging in soapUI
   * Validating JMS responses
   * Verifying end-to-end JMS message delivery using the sample project
      * Configuring JMS in Apache Axis2
   * Configuring a session in HermesJMS
   * Adding a JMS endpoint in soapUI
* Summary

## 11. Extending soapUI with Scripting

* Introduction to Groovy scripting language
   * What is Groovy?
   * HelloWorld with Groovy
   * Variable and object declaration in Groovy
   * Control structures in Groovy
   * Class and method declarations in Groovy
* Groovy scripting in soapUI
   * The context object
   * The testRunner variable
* soapUI ModelItems
   * Setup and TearDown scripts in soapUI
   * Load Script at soapUI project level
* Request and response handling using Scripts
   * Script assertion
* Summary

## 12. Automated Testing with soapUI
 
* Test automation
   * Why is test automation essential in SOA?
   * Continuous Integration (CI)
* soapUI JUnit integration
* soapUI command line executions
   * Invoking a soapUI command line functional test runner
   * Invoking test runners from the soapUI graphical user interface
* Maven soapUI plugin
* Summary

## 13. Miscellaneous Topics

* soapUI IDE plugins
   * soapUI Eclipse plugin
   * soapUI IntelliJ IDEA plug-in
* WS-I validation using soapUI
* soapUI integration with external web services' frameworks
* Sending attachments with SOAP messages using soapUI
   * Deploying an MTOM-enabled web service
   * Using soapUI to send an attachment to the web service
* Summary

## Index
