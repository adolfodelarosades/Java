# 984 Spring Boot 2.0 Projects

by Mohamed Shazin Sadakath

Pages 336

Publisher: Packt Publishing

Release Date: July 2018

ISBN: 9781789136159

Topic: Spring

![portada](https://github.com/adolfodelarosades/Java/blob/master/temarios/984_Spring_Boot_2_0_Projects/images/984-portada.png)

### Descripción del libro

Desarrolle diversos proyectos de la vida real, incluidos la mayoría de los aspectos de Spring Boot

#### Características clave

* Ejecute aplicaciones basadas en producción utilizando el marco Spring WebFlux
* Aprenda a desarrollar aplicaciones asincrónicas de alto rendimiento con Spring Boot
* Cree aplicaciones robustas basadas en microservicios con Kotlin usando Spring Boot

#### Descripción del libro

Spring es una de las mejores herramientas disponibles en el mercado para desarrollar software web, empresarial y listo para la nube. El objetivo de Spring Boot es proporcionar un conjunto de herramientas para crear rápidamente aplicaciones Spring que sean fáciles de configurar y que faciliten la creación y ejecución de aplicaciones basadas en Spring de grado de producción. Spring Boot 2.0 Projects lo familiarizará con las características importantes de la última versión de esta herramienta de creación de aplicaciones y cubrirá temas básicos y avanzados.

El libro comienza enseñándole cómo crear una aplicación web usando Spring Boot, seguido de la creación de un sistema de administración de blogs simple basado en Spring Boot que usa Elasticsearch como el almacén de datos. A medida que avance en los capítulos, creará una aplicación de servicios web RESTful utilizando Kotlin y el marco Spring WebFlux. Spring WebFlux es un nuevo marco que ayuda a crear una aplicación reactiva de una manera funcional. Hacia el final del libro, creará una API de llamada de taxis con microservicios reactivos utilizando Spring Boot y un clon de Twitter con un backend Spring Boot. Por último, aprenderá a crear un formateador de correo electrónico asincrónico.

#### Lo que vas a aprender

* Conozca las características fundamentales de Spring Boot 2.0
* Personalice las aplicaciones Spring Boot 2.0
* Crea una aplicación web básica
* Utilice Redis para crear una API de llamada de taxis
* Crea un sistema de administración de blogs simple y un clon de Twitter
* Desarrolle un servicio web RESTful reactivo con Kotlin usando Spring Boot

#### Para quien es este libro
Este libro está destinado a los desarrolladores de Spring competentes que deseen comprender cómo desarrollar aplicaciones complejas pero escalables con Spring Boot. Debe tener un buen conocimiento de la programación Java y estar familiarizado con los conceptos básicos de Spring.

Descarga del código de ejemplo para este libro Puede descargar los archivos de código de ejemplo para todos los libros Packt que haya comprado desde su cuenta en http://www.PacktPub.com. Si compró este libro en otro lugar, puede visitar http://www.PacktPub.com/support y registrarse para recibir los archivos por correo electrónico directamente.

#### Recursos para editores

Contenido complementario: https://github.com/PacktPublishing/Spring-Boot-2.0-Projects

### Table of Contents

* Title Page
* Copyright and Credits
   * Spring Boot 2.0 Projects
* Dedication
* Packt Upsell
   * Why subscribe?
   * PacktPub.com
* Contributors
   * About the author
   * About the reviewers
   * Packt is searching for authors like you
* Preface
   * Who this book is for
   * What this book covers
   * To get the most out of this book
      * Download the example code files
      * Conventions used
   * Get in touch
      * Reviews

* Introduction
   * Technical requirements
   * Generating Spring Boot Projects
      * Opening the generated project with IntelliJ
      * Opening the generated project with STS
   * Getting started with Spring Boot
      * Learning about Spring Boot
         * Anatomy of a Spring Boot application
         * Supporting the Spring Framework ecosystem in Spring Boot
   * Changes since Spring Boot 1.x
      * Registering a Spring Bean using ApplicationContextInitializer
      * Configuration property binding
         * New property binding API
         * Property origin
         * Tightened rules for&#xA0;governing relaxed property binding
         * Environment variables with indices
         * Direct binding of property type&#xA0;java.time.Duration&#xA0;in the ISO-8601 form
      * Custom endpoints for Spring Boot Actuator using annotations
         * Exposing a custom Spring Boot Actuator endpoint
         * Extending a custom endpoint with a specialized implementation for the web
         * Connecting to a custom endpoint using monitoring and management tools
      * Custom metrics using Micrometer
      * Custom health indicator
      * Using the HTTP/2 protocol
      * Securing applications with Spring Security
   * The next milestone
   * Migration
      * Using the correct JDK and JVM
         * Running on Java 9
            * Tackling JAXBException
            * Using the correct AspectJ version
            * Being aware of limitations on Apache Cassandra drivers
            * Being aware of issues with the Maven Surefire Plugin
      * Using the upgraded Spring Framework 5.0
         * Modified CORS support behavior
         * Removed packages, classes, and methods
         * Dropped support for frameworks
      * Using the updated configuration properties
      * Using the changed servlet-specific server properties
      * Using the modified template engine extension handling
      * Using the changed actuator configuration properties
      * Using the changed actuator base path
      * Using the renamed actuator endpoints
      * Using the changed Embedded Container Configuration&#xA0;
      * Using the changed default behavior for path mapping
      * Using the changed default dispatcher types for the servlet filter&#xA0;
      * Using the modified transitive dependency to spring-boot-web-starter
      * Using the changed default proxying strategy&#xA0;
      * Using the modified configuration location strategy
      * Using the changed Jackson/JSON support
      * Using the changed Spring Boot Actuator security
      * Using the changed HikariCP default connection pool for JPA
      * Using the changed default database initialization strategy
      * Using the changed database schema creation strategy
      * Using the changed testing support
      * Using the revised Spring Security
         * Using the changed default security auto-configuration strategy
         * Spring Security OAuth2 is migrated to Spring Security core&#xA0;
         * Using the AuthenticationManager bean&#xA0;
      * Understanding removed features
   * Summary
   * Questions
   * Further reading

* Building a Basic Web Application
   * Technical requirements
   * Getting started
      * Web application architecture
         * Workflow of Spring Web MVC&#xA0;
      * Requirements for our web application
         * The use case diagram&#xA0;
   * Using Spring Data JPA for persistence
      * Understanding the Java Persistence API (JPA)
      * Understanding Spring Data JPA
      * Class diagram for the domain model
      * Implementation of the domain model using JPA annotations
         * Setting up dependencies and configuration
         * Implementing the domain model
      * Implementation of Spring Data JPA repositories
      * Testing Spring Data JPA repositories
         * Using Spring Boot Devtools for database visualization
      * Using Services to encapsulate business logic
      * Testing&#xA0;Services
   * Using Spring Thymeleaf for the view
      * Understanding template engines
      * Spring Thymeleaf&#xA0;
      * UI design for the Retro Board
      * UI implementation for the Retro Board&#xA0;using Spring Thymeleaf
   * Using Spring Web MVC with servlet 3.x for the controller
      * Implementation of Controllers annotations
      * Testing controllers
   * Using Spring Security for authentication and authorization
   * Demonstrating the Retro Board
   * Summary
   * Questions
   * Further reading

* Building a Simple Blog Management System
   * Technical requirements
   * Getting started
      * Web application architecture
         * Workflow of Spring WebFlux
      * Requirements of the Bloggest system
         * The use&#xA0;case diagram&#xA0;
   * Using Spring Data Elasticsearch for persistence
      * Understanding Elasticsearch
      * Understanding Spring Data Elasticsearch
      * Class diagram for the domain model
      * Implementation of the domain model using Spring Data Elasticsearch annotations
         * Setting up dependencies and configuration classes
         * Implementing the domain model
      * Implementation of Spring Data Elasticsearch repositories
   * Using Apache FreeMarker for the view
      * Understanding template engines
      * Apache FreeMarker
      * UI design for Bloggest
      * UI implementation for Bloggest using Apache FreeMarker
         * Implementing a common layout using Apache FreeMarker
         * Implementing a List Articles page
         * Implementing a Create Article page
         * Implementing a Show Article page
         * Implementing an error page
   * Using Spring WebFlux for controller
      * Implementation of controllers
      * Implementation of ControllerAdvice
   * Using Spring Security for authentication and authorization
   * Demonstrating Bloggest
   * Summary
   * Questions
   * Further reading

* Introduction to Kotlin
   * Technical requirements
   * Getting started with Kotlin
      * Default imports
      * Basic data types
         * Numeric data types
         * Learning numeric literals
         * Numeric representation
         * Numeric operations
         * String literals
      * The syntax for Kotlin code
         * The Kotlin packages
         * String interpolation
         * Functions in Kotlin
         * Variables in Kotlin
         * Conditional statements
            * The if statement
            * The when statement&#xA0;
         * Type checking and automatic casting
         * Nullable values and compile-time null safety&#xA0;
         * The for loop
            * The for loop with an array
            * The for loop with a&#xA0;collection
            * The for loop with a value range
         * The while loop
   * Object-oriented programming with Kotlin
      * Learning about visibility modifiers
      * Classes in Kotlin
         * Abstract classes
         * Concrete classes
      * The concept of interfaces in Kotlin
      * Learning about extensions
      * Generic types in Kotlin
      * Enums in Kotlin
      * Objects in Kotlin
         * Object expressions
         * Object declarations
         * Companion objects
   * Advanced programming with Kotlin
      * Functions
         * Infix notation in functions
         * Local functions in Kotlin
         * Default arguments in functions
         * Named arguments in functions
         * Generics in functions
         * Variable number of arguments (vararg) in functions
   * Summary
   * Questions
   * Further reading

* Building a Reactive Movie Rating API Using Kotlin
   * Technical requirements
   * Getting started
      * REST architecture
      * Requirements&#xA0;of REST architecture
         * The use case diagram
   * Using Spring Data MongoDB for persistence
      * Understanding&#xA0;MongoDB&#xA0;
      * Understanding Spring Data MongoDB
      * Class diagram for the domain model
      * Implementation of the domain model using Spring Data MongoDB annotations
         * Setting up dependencies and configuration
         * Implementing the domain model
      * Implementing of Spring Data MongoDB repositories
      * Using a service to encapsulate business logic
      * Testing Services
   * Using Spring WebFlux for controllers
      * Implementation of controllers
      * Testing controllers
   * Using Spring Security for basic authorization
   * Demonstrating Moviee
      * Integration testing
      * Demonstrating the use of Postman
         * Accessing the List Movies endpoint
         * Accessing the Get Movie endpoint
         * Accessing the Get Movie endpoint with an invalid Movie ID
         * Accessing the Rate Movie endpoint
   * Summary
   * Questions
   * Further reading

* Building an API with Reactive Microservices
   * Technical requirements
   * Getting started
      * Microservices architecture
      * The requirements of microservices architecture
         * The use case diagram
         * The project structure to develop microservices
   * Using Spring Data Redis for persistence
      * Understanding Redis
      * Understanding Spring Data Redis
      * Class diagram for the domain model
      * Implementation of domain model using Spring Data Redis annotations
         * Setting up dependencies and configuration
         * &#xA0;Implementing the domain model
      * Implementation of Spring Data Redis repositories
      * Using a Service to encapsulate business logic&#xA0;
   * Using Spring WebFlux for a controller
      * Implementation of controllers
   * Using asynchronous data transfer for cross-microservice communication
      * Asynchronous data transfer using Redis
   * Using Docker to support microservices
      * Understanding Docker
      * Using Maven to build Docker images
      * Building a system of microservices with Docker
      * Deploying microservices with Docker
   * Demonstrating Saber
      * Submitting to the Register Taxi endpoint
      * Submitting&#xA0;location to update Taxi Location endpoint
      * Submitting to Update Taxi Status endpoint
      * Accessing the Get Taxi Status endpoint
      * Accessing the GET available Taxis endpoint
      * Submitting to Book Taxi endpoint
      * Submitting to Accept Taxi Booking endpoint
      * Submitting to cancel Taxi Booking endpoint
      * Accessing Taxi Bookings endpoint
   * Summary&#xA0;
   * Questions
   * Further reading

* Building a Twitter Clone with Spring Boot
   * Technical requirements
   * Getting started
      * Beginning with the Tweety architecture
      * Tweety requirements
         * The use case diagram
   * Using Spring Data JPA for persistence
      * Class diagram for the domain model
      * Implementation of the domain model using Spring Data JPA annotations
         * Setting up dependencies and configuration
         * Implementing the domain model
      * Implementing Spring Data JPA repositories
         * Caveat for going reactive with blocking JDBC&#xA0;
      * Using&#xA0;Service to encapsulate business logic&#xA0;
   * Using Angular 5 for the frontend
      * Getting started with Angular 5 application development
      * Generating Angular services
         * Generating the users service
         * Generating Angular page components
         * Generating the Tweets Add page
         * Generating the User Profile page
   * Using Spring Web Flux for the REST controller
      * Implementing controllers
      * Enabling Angular frontend access to controllers
   * Using Spring Security for authentication and authorization
      * Understanding OAuth2&#xA0;
      * Setting up dependencies and configuration
         * Configuring the Resource Server
         * Configuring the Authorization Server
         * Configuring web security
         * Using an&#xA0;Angular service for OAuth2 authentication and authorization
   * Demonstrating Tweety
      * Accessing the login page
      * Accessing the List Tweets page
      * Accessing the Send Tweet page
      * Accessing the User Profile page
   * Summary
   * Questions
   * Further reading

* Introducing Spring Boot 2.0 Asynchronous
   * Technical requirements
   * Getting started
      * Synchronous applications
      * Asynchronous applications
      * The requirement of asynchronous applications
         * The use case diagram
      * The architecture of an image resizing application
   * Using Spring Kafka for communication
      * Understanding Apache Kafka
      * Setting up dependencies and configuration
      * Configuration for the Image Resize Request Producer
      * Configuration for Image Resize Request Consumer
      * Starting Spring Boot applications in a&#xA0;non-web mode
   * Using Quartz for scheduling
      * Understanding Quartz
      * Setting up dependencies and configuration
      * Configuration for Quartz scheduling
   * Demonstrating Image Resizer
      * Building all dependencies&#xA0;
      * Running Apache Kafka
         * Running Apache ZooKeeper on Windows
         * Running Apache Kafka on Linux/Unix
         * Running Apache Kafka on Windows
      * Running Image Resize Request Consumer
      * Running Image Resize Request Producer
   * Summary
   * Questions
   * Further reading

* Building an Asynchronous Email Formatter
   * Technical requirements
   * Getting started
      * Why Email Formatter is useful
         * The use case diagram
      * The architecture of the Email Formatter application
   * Using Spring Data JPA for persistence
      * Class diagram for the&#xA0;domain model
      * Implementation of the domain model using JPA annotations
         * Setting up dependencies and the configuration class
         * Implementing the domain model
      * Implementation of Spring Data JPA repositories
      * Using Services to encapsulate business logic
   * Using Apache FreeMarker for templates
   * Using Spring Kafka for communication
      * Setting up dependencies and the configuration class
      * Configuration for User Registration
      * Configuration for the Email Formatter consumer
         * Configuring Java Mail
   * Using Spring Web MVC for the REST controller
      * Implementation of controller annotations
   * Using Spring Security for authentication and authorization
   * Demonstrating Email Formatter
      * Building all dependencies&#xA0;
      * Running Apache Kafka
         * Running Apache ZooKeeper on Windows
         * Running Apache Kafka on Linux/Unix
         * Running Apache Kafka on Windows
      * Running SMTP server
      * Running the Email Formatter consumer
      * Running the User Registration microservice
   * Summary
   * Questions
   * Further reading

* Assessments
   * Chapter 1,&#xA0;Introduction
   * Chapter 2, Building a Basic Web Application
   * Chapter 3, Building a Simple Blog Management System
   * Chapter 4,&#xA0;Introduction to Kotlin
   * Chapter 5,&#xA0;Building a Reactive Movie Rating API Using Kotlin
   * Chapter 6,&#xA0;Building an API with Reactive Microservices
   * Chapter 7,&#xA0;Building a Twitter Clone with Spring Boot
   * Chapter 8,&#xA0;Introducing Spring Boot 2.0 Asynchronous
   * Chapter 9,&#xA0;Building an Asynchronous Email Formatter

* Other Books You May Enjoy
   * Leave a review - let other readers know what you think
