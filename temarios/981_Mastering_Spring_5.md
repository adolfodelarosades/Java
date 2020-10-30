# 981 Mastering Spring 5

by Ranga Rao Karanam

Publisher: Packt Publishing

Release Date: July 2019

Pages 496

ISBN: 9781789615692

Topic: Spring

![portada](https://github.com/adolfodelarosades/Java/blob/master/temarios/981_Mastering_Spring_5/images/981-portada.png)

### Descripción del libro

Cree microservicios y API Rest escalables y flexibles con las últimas versiones de Spring y Spring Boot

Características clave

* Cree aplicaciones empresariales basadas en Java con Spring 5.1 y Spring Boot 2.1
* Cree aplicaciones Java empresariales de alto rendimiento, reutilizables y escalables que sean fáciles de probar
* Obtenga información valiosa sobre los conceptos avanzados de Spring y Spring Boot para desarrollar aplicaciones de manera efectiva

Descripción del libro

Spring 5.1 es la última versión del Spring Framework ampliamente utilizado. Este libro lo lleva a través de la evolución de la creación de aplicaciones listas para la empresa con Spring y Spring Boot.

Dominar Spring 5 comienza con una descripción general de algunas de las características importantes de Spring Framework relacionadas con la programación orientada a aspectos, la programación de tareas y la creación de scripts con la ayuda de ejemplos prácticos. Aprenderá sobre la especificación de inyección de dependencia estándar para contextos Java y CDI y cómo Spring Framework la admite. Obtendrá una comprensión de cómo las arquitecturas de aplicaciones han evolucionado de monolitos a microservicios y podrá crear sus propios microservicios con Spring Boot. Completo con ejemplos del mundo real, este libro lo ayudará a obtener información valiosa sobre Spring Boot 2.1 y a aprender cómo desarrollar microservicios nativos de la nube con Spring Cloud. Incluso explorará cómo proteger una API REST con Spring Security y comenzará con su primera aplicación de pila completa usando React. Además, conocerá los fundamentos de Kotlin y creará un proyecto de Kotlin en Eclipse.

Al final de este libro, estará equipado con todos los conocimientos necesarios para desarrollar microservicios y aplicaciones de pila completa con Spring Framework.

Lo que vas a aprender

* Explore las características de Spring Framework 5.1 como AOP, administración de transacciones, programación de tareas y secuencias de comandos
* Cree API REST y microservicios con Spring y Spring Boot
* Desarrolle una API REST segura con Spring Security
* Cree su primera aplicación React de pila completa
* Escriba pruebas unitarias eficientes con Spring y Spring Boot
* Comprender las funciones avanzadas que ofrece Spring Boot para desarrollar y monitorear aplicaciones
* Use Spring Cloud para implementar y administrar aplicaciones en la nube

Para quien es este libro

Este libro está dirigido a desarrolladores y programadores experimentados de Java y Java empresarial que tienen un conocimiento básico de Spring Framework.

Descarga del código de ejemplo para este libro electrónico: puede descargar los archivos de código de ejemplo para este libro electrónico en GitHub en el siguiente enlace: https: //github.com/PacktPublishing/Mastering-Spring-5.1. 

### Table of Contents

* Title Page
* Copyright and Credits
   * Mastering Spring 5 Second Edition
* About Packt
   * Why subscribe?
* Contributors
   * About the author
   * About the reviewers
   * Packt is searching for authors like you
* Preface
   * Who this book is for
   * What this book covers
   * To get the most out of this book
      * Download the example code files
      * Download the color images
      * Conventions used
   * Get in touch
      * Reviews
* Section 1: [Getting Started with Spring and Spring Boot](981_Mastering_Spring_5/Seccion_01.md)
* Spring Landscape - Framework, Modules, and Projects
   * Exploring Spring and its evolution
      * Beginning with the first version of the Spring Framework
         * Loose coupling and testability
         * Architectural flexibility
         * Reduction in plumbing code
      * Learning about the early years of the Spring Framework &#x2013; Spring Projects
         * Staying ahead of Java EE
      * Evolution toward microservices&#xA0;&#x2013; Spring Boot and Spring Cloud
         * Building microservices quickly with Spring Boot
         * Connecting microservices with the cloud using Spring Cloud
      * Quickly revising what we learned
   * Learning about Spring Modules
      * Spring Core Container
      * Cross-cutting concerns
      * Web &#x2013; Spring MVC
      * The business layer
      * The data layer
   * Beginning with Spring Projects
      * Spring Boot
      * Spring Cloud
      * Spring Data
      * Beginning with Spring Batch
      * Spring Security
      * Spring HATEOAS
   * New features in Spring Framework 5.0 and 5.1
      * Baseline upgrades
      * Java 11 Support
      * Usage of JDK 8 features in the Spring Framework code
      * Reactive programming support
      * Functional web framework
      * Java modularity with Jigsaw
      * Kotlin support
      * Dropped features
   * Learning about new features in Spring Boot 2.0 and 2.1&#xA0;
   * Summary
   * Further reading
* Dependency Injection and Unit Testing
   * Technical requirements
   * Understanding&#xA0;a dependency
      * Why do we have dependencies?
   * What is DI?
      * Loose and tight coupling
      * Eliminating tight coupling and making code loosely coupled
         * Creating an interface for DataServiceImpl
         * Moving creation of a dependency outside&#xA0;BusinessServiceImpl
         * Creating an interface for BusinessServiceImpl
         * Understanding terminology &#x2013; beans, wiring, and DI
   * What does the Spring Framework do?
      * Question 1 &#x2013; how does Spring IoC container know which beans to create?
      * Question 2&#xA0;&#x2013; how does the Spring IoC container know the dependencies of the bean?
      * Launching a Spring IoC container
         * Creating a Java configuration for the application context
         * Launching a Java configuration
         * Defining a component scan
            * Running the application context
         * What's happening in the background?
   * Understanding the Spring Framework in depth
      * Container Managed Beans
      * Java versus XML configuration
         * Using XML configuration for the application context
            * Defining the XML Spring configuration
            * Launching an application context with the XML configuration
      * The @Autowired annotation in depth
         * The @Primary annotation
         * The @Qualifier annotation
      * Understanding DI options
         * The setter injection
         * The constructor injection
         * Constructor versus setter injection
      * Customizing Spring beans &#x2013; scope
      * Other important Spring annotations
   * Exploring CDI
      * An example of CDI
   * Unit testing the Spring application context
      * What is unit testing?
      * Writing JUnit using the Spring context
      * Unit testing with mocks
   * Summary
   * Further reading

* Building Web Applications with Spring MVC
   * Technical requirements
   * Understanding the architectures of Java servlet web applications
      * Model 1 architecture
      * Model 2 architecture
      * Model 2 FrontController architecture
   * Learning Spring MVC with six basic flow examples
      * Setting up a Spring MVC application
         * Adding dependency for Spring MVC
         * Adding DispatcherServlet to web.xml
         * Creating a Spring context
      * Flow 1 &#x2013; simple controller flow without View
         * Creating a Spring MVC controller
         * Running the web application
      * Flow 2 &#x2013; creating a simple controller flow with a View &#x2013; JSP
         * Creating a Spring MVC controller
         * Creating a View &#x2013;&#xA0;a JSP
            * Configuring a View resolver
      * Flow 3 &#x2013; controller redirecting to a View with a model
         * Spring MVC controller
         * Creating a View
      * Flow 4 &#x2013; controller redirecting to a View with ModelAndView
         * Spring MVC controller
         * Creating a View
      * Flow 5 &#x2013; controller redirecting to a View with a form
         * Creating a command or form-backing object
         * The controller method to show the form
         * Creating the View with a form
         * Controller get method to handle form submit
      * Flow 6 &#x2013; adding validation to the previous flow
         * Adding the Hibernate Validator dependency
         * Defining simple validations on the bean
         * Implementing custom validations
   * An overview of Spring MVC
      * Understanding the important features
      * Working with Spring MVC
   * Important concepts behind Spring MVC
      * RequestMapping
         * Examples of request mapping
            * Example 1
            * Example 2
            * Example 3
         * RequestMapping methods &#x2013; supported method arguments
         * RequestMapping methods &#x2013; supported return types
      * Exploring View resolution
         * Configuring the JSP View resolver
         * Configuring Freemarker
      * Exploring handler mappings and interceptors
         * Defining a HandlerInterceptor
         * Mapping HandlerInterceptor to handlers
      * Using model attributes
      * Using session attributes
         * Putting an attribute in the session
         * Reading an attribute from the session
         * Removing an attribute from the session
      * Understand the need for InitBinders
      * Implementing common features using the&#xA0;@ControllerAdvice annotation
   * A quick look at Spring MVC advanced features
      * Implementing exception handling
         * Common exception handling across controllers
            * Defining the error View
         * Creating specific exception handling in a Controller
      * Internationalizing your application
         * Setting up the message bundle&#xA0;
         * Configuring SessionLocaleResolver
         * Configuring CookieLocaleResolver
      * Serving static resources
         * Exposing static content
         * Caching static content
         * Enabling gzip compression of static content
      * Integrating Spring MVC with Bootstrap
         * Defining Bootstrap WebJar as a Maven dependency
         * Configuring the Spring MVC resource handler to deliver WebJar static content
         * Using Bootstrap resources in JSP
      * Unit testing Spring MVC applications &#x2013; basic flows
         * Flow 1 &#x2013; simple controller flow without View
            * Setting up the controller to test
            * Writing the Test method
         * Flow 2 &#x2013; simple controller flow with a View
            * Setting up the controller to test
            * Writing the Test method
         * Flow 3 &#x2013; controller redirecting to a View with Model
            * Setting up the controller to test
            * Writing the Test method
         * Flow 4 &#x2013; controller redirecting to a View with ModelAndView
         * Flow 5 &#x2013; controller redirecting to a View with a form
         * Flow 6 &#x2013; adding validation to the previous flow
            * Controller setup
            * The Test method
   * Writing integration tests for Spring MVC controllers
   * Spring Security
      * Adding the Spring Security dependency
      * Configuring a filter to intercept all requests
      * Logout
   * Summary
   * Further reading

* Getting Started with Spring Boot
   * Technical requirements
   * What is Spring Boot?
      * Steps involved in building a quick prototype for an application
      * Primary goals of Spring Boot
      * Understanding Spring Boot's non-functional features
   * Building a Hello World application with Spring Boot
      * Creating pom.xml with&#xA0;spring-boot-starter-parent
         * Understanding spring-boot-starter-parent
      * Configuring pom.xml with starter projects
         * Understanding starter projects
      * Configuring spring-boot-maven-plugin
      * Creating your first Spring Boot launch class
         * Understanding the SpringApplication class
         * Requirements for the @SpringBootApplication annotation
      * Running our Hello World application
      * Understanding the magic of AutoConfiguration
      * Exploring Spring Boot starter projects
   * Getting started with SPRING INITIALIZR
      * Creating your first SPRING INITIALIZR project
         * Exploring pom.xml
         * Understanding the FirstSpringInitializrApplication.java class
         * Looking at the tests &#x2013; the FirstSpringInitializrApplicationTests class
   * A quick peek into AutoConfiguration
   * Externalizing application configuration
      * Getting started with application.properties
      * Customizing frameworks through application.properties
         * Configuring logging
         * Customizing the embedded server configuration
         * Configuring Spring MVC
         * Configuring Spring starter security
         * Customizing data sources, JDBC, and JPA
         * Looking at other configuration options
      * Defining application-specific, custom-defined properties
         * Providing type-safe configuration through configuration properties&#xA0;
      * Creating profiles for different environments
         * Configuring dynamic beans based on active profiles
      * Other options for providing application configuration
      * Exploring the YAML configuration
   * Understanding embedded servers
      * Understanding traditional Java application deployment
      * Understanding embedded servers
      * Switching to Jetty and Undertow embedded servers
      * Building a traditional WAR file instead of using a JAR
   * Using developer tools to improve productivity
      * Enabling live reload on a browser
   * Using Spring Boot Actuator for application monitoring
      * Using the HAL browser to browse actuator endpoints
      * Looking at application configuration
      * Getting environment details
      * Monitoring application health
      * Getting mapping information
      * Debugging with the bean configuration
      * Exploring important metrics
      * Getting debug information about AutoConfiguration
      * Debugging
   * Summary

* Digging Deeper into the Spring Framework

   * Technical requirements
   * Exploring AOP with Spring and AspectJ
      * Exploring cross-cutting concerns and AOP
      * Understanding important AOP terminology
         * Understanding weaving
      * AOP frameworks
      * Getting hands-on with AOP
         * Setting up a simple business scenario
            * Identifying the PointCut
            * Defining the aspect
            * Understanding @After advice
            * Understanding @AfterReturning advice
            * Understanding @Around advice
         * PointCut best practices
         * Defining custom AOP annotations
   * Scheduling tasks with Spring
      * Scheduling tasks with @Scheduled
      * Running tasks asynchronously using @Async
         * Returning values from @Async methods
      * Understanding task executors
   * Scripting with the Spring Framework
      * JSR 223&#xA0;&#x2013;&#xA0;scripting for the JavaTM platform
         * Executing JavaScript code in Java
         * Executing Groovy code in Java
      * Executing Groovy code in Spring enterprise applications
         * Inlining Groovy code into Spring context XML
   * Summary

* Section 2: Building a REST API and Full Stack Applications with Spring

* Building REST APIs with Spring Boot
   * Understanding REST
   * Designing your first REST API
      * Deciding on request methods and URIs for REST API operations
      * Understanding the high-level approach for creating APIs
   * Creating a Hello World API with Spring Boot
      * Creating an API that returns a Hello World string
      * Creating a REST API that returns a welcome JSON response
         * Executing a request
      * Creating a welcome message with a name path variable
         * Executing a request
   * Creating a todo REST API
      * Setting up beans and services
      * Retrieving a todo list
         * Executing the service
      * Retrieving details for a specific Todo
         * Executing the service
      * Adding a Todo
         * Introducing Postman &#x2013; a REST API client
         * Executing the POST service using Postman
      * Updating a Todo
         * Executing the PUT service using Postman
      * Deleting a Todo
         * Executing the DELETE service using Postman
   * Implementing exception handling for REST APIs
      * Understanding Spring Boot default exception handling
         * What happens when a resource doesn't exist?
         * What happens when service code throws a runtime exception?
         * What happens when the service method throws a custom exception?
      * Customizing the exception response
         * Defining the exception response structure
         * Defining custom exception handling advice for TodoNotFoundException
         * Defining global default exception handling advice for all other exceptions
         * Mapping response statuses for different scenarios
   * Exploring HATEOAS
      * Sending HATEOAS links in response
         * Spring Boot starter HATEOAS
   * Implementing validation for REST APIs
      * Enabling validation on the controller method
      * Defining validations on the bean
   * Documenting REST services using the OpenAPI Specification
      * Generating a Swagger specification
      * Exploring the Swagger specification
         * Using the Swagger UI to navigate the Swagger documentation
         * Customizing the Swagger documentation using annotations
   * Implementing internationalization for REST APIs
   * Implementing caching for REST APIs
      * Exploring a starter project for caching &#x2013; spring-boot-starter-cache
      * Enabling caching on the application
      * Caching data
      * JSR-107 caching annotations
         * Understanding the auto-detection order of caching providers
   * Deploying Spring Boot applications to the cloud
      * Deploying applications to Cloud Foundry
   * Summary

* Unit Testing REST API with Spring Boot
   * Technical requirements
   * Unit testing REST API with Spring Boot
      * Adding dependency on Spring Boot Starter Test
      * Unit tests for the BasicController API
         * Setting up the basic unit test
         * Writing a unit test for the Hello World API returning a string
         * Writing a unit test for the Hello World API returning a JSON
         * Writing a unit test for the Hello World API with a path parameter
      * Unit tests for the TodoController API
         * Setting up unit tests for the TodoController API
         * Writing a unit test to retrieve all todos &#x2013; the GET method
         * Writing a unit test for retrieving a specific todo &#x2013; the GET method
         * Writing a unit test for creating a todo &#x2013; the POST method
         * Writing a unit test for creating a todo with validation errors
         * Writing a unit test for updating a todo &#x2013; the PUT method
         * Writing a unit test for deleting a todo &#x2013; the DELETE method
   * Integration testing REST API with Spring Boot
      * Writing integration tests for BasicController
         * Writing an integration test for the Hello World API returning a string
         * Writing an integration test for the Hello World API returning a JSON
         * Writing an integration test for the Hello World API with a path parameter
      * Integration tests for the TodoController API
         * Todo API integration testing setup
         * Writing an integration test to retrieve all todos &#x2013; the GET method
         * Writing an integration test for creating a todo &#x2013; the POST method
         * Writing an integration test for updating a todo &#x2013; the PUT method
         * Writing an integration test for deleting a todo&#xA0;&#x2013; the DELETE method
   * Unit and integration testing best practices
   * Summary
   * Further reading

* Securing REST API with Spring Security
   * Technical requirements
   * Security REST API with Spring Security
      * Securing the REST API basics
         * Authentication
         * Authorization
      * Implementing security for REST API
      * Adding Spring Security to the Todo API
         * Adding Spring Security Starter
            * Spring Boot Starter security dependencies
            * Spring Boot Starter security auto-configuration
            * Updating an integration test with basic authentication credentials
            * Updating a unit test to disable security
            * A quick review of the chapter until now
   * Understanding Spring Security
      * Reviewing the log
      * Understanding Spring Security filters
      * Understanding authentication in Spring Security
         * Understanding authentication managers
            * Understanding provider managers
            * Understanding authentication providers
            * Implementing the UserDetailsService
         * Managing users with a UserDetailsManager
      * Understanding authentication extension points in Spring Security
         * Providing a custom implementation of the Use DetailsService
         * Extending the web security configurer adapter to configure a global authentication manager
         * Using the web security configurer adapter to configure web security
      * Understanding authorization in Spring Security
         * Using access decision manager to support authorization
      * Understanding authentication extension points in Spring Security
         * Using the web security configurer adapter to configure HTTP security
      * Providing secured annotations on service methods
      * Providing JSR-250 annotations on service methods
      * Using Spring Security pre and post annotations
      * Implementing security best practices with Spring Security
   * Exploring OAuth2 authentication
      * Understanding OAuth2 high-level flow
         * Exploring Authorization Grant Flow
         * Resource Access Flow
      * Creating the OAuth2 Server
         * Setting up the authorization server
            * Configuring the user credentials for REST API
            * Configuring the authorization server with third-party client credentials
            * Obtaining an access token
         * Setting up the resource server
            * Executing the request using the access token
         * Updating the integration test
   * Authentication with JWT
      * Introducing JWT
         * JWT payload
         * JOSE header
         * JWT signing and token creation
         * Using JWT for REST API authentication
      *  Using JWT with OAuth2
   * Summary
   * Further reading

* Full Stack App with React and Spring Boot
   * Technical requirements
   * Understanding full stack architecture
      * Understanding the need for full stack architecture
   * Introducing React
      * Components of a frontend application
      * JSX
      * Combining JSX and components
         * Creating a Header component
         * Creating a Footer component
         * Creating a Todo component
   * Building your first React application
      * Using create-react-app
      * Importing a React application into Visual Studio Code IDE
         * Quick introduction to the folder structure
      * Initializing the React framework&#xA0;
      * Creating a Todo component
      * Adding basic Todo management features
         * Validations
         * Loading Todos from the API with the axios framework
      * Adding todos invoking the RESTful API
      * Authentication
         * Basic authentication
         * JWT token-based authentication
   * Summary
   * Further reading

* Managing Data with Spring Data
   * Technical requirements
   * Challenges with a variety of data stores
   * Communicating with relational databases
   * Introducing Spring Data
      * Understanding Spring Data Commons
         * Exploring the Repository interface
         * Exploring the CrudRepository interface
         * Exploring the PagingAndSortingRepository interface
   * Connecting to relational databases using Spring Data JPA
      * Understanding Spring Data JPA with an example
         * Create a new project with a starter data JPA
         * Defining entities
         * Creating the SpringBootApplication class
         * Populating some data
         * Creating a simple repository
            * Creating a unit test
         * Create a repository extending the CrudRepository interface
            * Testing using a unit test
         * Creating a repository extending the PagingAndSortingRepository interface
            * Exploring using unit tests
         * Writing custom query methods
         * Writing custom JPQL queries
            * Using named parameters
            * Using named queries
            * Executing native SQL queries
      * Getting started with transaction management
         * Understanding the Spring @Transactional annotation
         * Understanding Spring Boot auto-configuration for transactions
   * Interacting with MongoDB using Spring Data
      * Setting up the dependencies
      * Creating a Person entity
      * Creating a Person repository
      * Testing the repository in a unit test
   * Using Spring Data REST to create REST APIs
      * Exploring the GET method
      * Exploring the POST method
      * Using the search resource
   * Summary

* Section 3: Cloud, Microservices, and Best Practices with Spring

* Getting Started with Microservices
   * Understanding the goals of application development
      * Developing applications quickly &#x2013; speed
      * Building dependable applications &#x2013; safety
         * Reliability &#x2013; does the application behave as expected?
         * Availability &#x2013; is your application available all the time?
         * Security &#x2013; is your application secure?
         * Performance &#x2013; is your application quick enough?
         * High resilience &#x2013; does your application react well to failures?
         * Scalability &#x2013; what is needed to support a drastic increase in application load?
   * Challenges with monolithic applications
      * Challenges in releasing updates &#x2013; long release cycles
      * Difficulties with scaling up
      * Difficulties with adapting new technologies
      * Difficulties with adapting new methodologies
      * Challenges in adapting modern development practices
   * Getting started with microservices
      * What is a microservice?
      * Understanding the big idea of microservice architecture
      * Understanding microservice characteristics
         * Small and lightweight microservices
         * Interoperability with message-based communication
         * Capability-aligned microservices
         * Independently deployable microservices
         * Stateless microservices
         * Completely automated build and release process
         * Adherence to event-driven architectures
            * Approach 1&#xA0;&#x2013; The sequential approach
            * Approach 2 &#x2013;&#xA0; The event-driven approach
         * Independent teams developing and supporting microservices&#xA0;&#x2013; DevOps
      * Understanding the advantages of microservice architectures
         * Faster time to market
         * Quick adaptation to technology evolution
         * Ability to easily scale
         * Compatibility with current development methodologies
      * Exploring microservice challenges
         * Increased need for automation
         * Challenges in defining the boundaries of subsystems
         * Increased need for visibility and monitoring
         * Increased need for fault tolerance
         * Maintaining consistency across microservices
            * Establishing standardized shared capabilities (enterprise level)
         * Increased need for operations teams
   * Understanding cloud-native applications
      * What is the Twelve-Factor App?
         * Maintain one code base
         * Explicit declaration of dependencies
         * Application configuration stored in an environment
         * All dependencies are treated as backing services
         * Clear separation between build, release, and run phases
         * Applications do not store states &#x2013; stateless
         * All the services are exposed with port binding
         * Possibility to scale horizontally &#x2013; concurrency
         * Each application instance is disposable
         * Achieving environmental parity &#x2013; all environments are the same
         * Treating all logs as event streams
         * No distinction for admin processes
   * Exploring Spring projects for microservices
      * Getting an overview of Spring Boot
      * Getting started with Spring Cloud
         * Exploring Spring Cloud Netflix
   * Summary
   * Further reading

* Building Microservices with Spring Boot and Spring Cloud
   * Technical requirements
   * Understanding the microservices we will build
      * Setting up Microservice A
         * Step 1 &#x2013; initializing Microservice A using SPRING INITIALIZR
         * Step 2 &#x2013; creating the random list service in Microservice A
      * Building the Service Consumer microservice
         * Creating the method to consume the random list service (from Microservice A)
         * Testing the Service Consumer microservice
         * Standardizing ports that are used for different microservices
   * Using recommended versions for Spring Boot and Spring Cloud
   * Exploring centralized microservice configuration
      * Problem statement
      * Solution
      * Options
      * Spring Cloud Config
         * Implementing Spring Cloud Config Server
            * Setting up Spring Cloud Config Server
            * Creating a service in Microservice A to return a message from the application configuration
            * Connecting Spring Cloud Config Server to a local Git repository
            * Creating a development environment-specific configuration for Microservice A
            * Enhancing Microservice A to make it a Spring Cloud Config Client
   * Getting an overview of event-driven approaches
      * Understanding&#xA0;Spring JMS using the JMS API
      * AMQP&#xA0;
   * Getting started with Spring Cloud Bus
      * The need for Spring Cloud Bus
      * Propagating configuration changes using Spring Cloud Bus
      * Implementing Spring Cloud Bus&#xA0;
   * Declarative REST client &#x2013; Feign
   * Implementing load balancing for microservices
      * Ribbon for client-side load balancing
         * Implementing Ribbon in the Service Consumer microservice
   * Understanding the need for a naming server
      * Limitations of hardcoding microservice URLs
   * The working of a naming server
      * Naming server options supported by Spring Cloud
      * Implementing the Eureka naming service
         * Setting up Eureka Server
         * Registering microservices with Eureka
         * Connecting the Service Consumer microservice with Eureka
   * Understanding API gateways
      * Implementing API gateway with Zuul
         * Setting up a new Zuul API gateway server
            * Configuring Zuul custom filters for logging every request
            * Invoking microservices through Zuul
         * Configuring Service Consumer to use the Zuul API gateway
   * Understanding distributed tracing
      * Implementing Spring Cloud Sleuth and Zipkin
         * Integrating microservice components with Spring Cloud Sleuth
         * Setting up a Zipkin distributed tracing server
         * Integrating microservice components with Zipkin
   * Implementing fault tolerance with Hystrix
      * Integrating Hystrix into the Service Consumer microservice
   * Summary
   * Further reading

* Reactive Programming
   * Technical requirements
   * The reactive manifesto
      * Characteristics of reactive systems
   * Reactive use case &#x2013; a stock price page
      * A quick look at the traditional approach&#xA0;
      * How&#xA0;is the reactive approach different?
      * Comparing traditional and reactive approaches
   * Implementing reactive programming in Java
      * Understanding Reactive Streams
      * Exploring the Reactor framework
         * Using Mono to emit one element
         * Using Flux to emit multiple elements
      * Creating Reactive web applications with Spring Web Reactive
         * Creating a project using Spring Initializr
         * Creating a reactive controller &#x2013; StockPriceEventController
         * Creating an HTML view &#x2013; stock-price.html
         * Launching SpringReactiveExampleApplication
      * Integrating with reactive databases
         * Integrating the Spring Boot Reactive MongoDB starter
         * Creating a model object &#x2013; a stock document
         * Creating ReactiveCrudRepository
         * Initializing stock data using CommandLineRunner
         * Creating reactive methods in the REST controller
         * Updating the view to subscribe to the event stream
         * Launching SpringReactiveExampleApplication
   * Summary

* Spring Best Practices
   * Adhering to Maven's standard directory layout
   * Building applications using a layered architecture
   * Having separate context files for different layers
   * Separating api and impl for important layers
   * Understanding exception handling best practices
      * Spring's approach to exception handling
      * The recommended approach
   * Keeping your Spring configuration light
   * Using the basePackageClasses attribute in ComponentScan
   * Not using version numbers in schema references
   * Preferring constructor injection for mandatory dependencies
   * Managing dependency versions for Spring projects
   * Exploring unit testing best practices
      * Writing tests for the business layer
      * Writing tests for the web layer
      * Writing tests for the data layer
      * Other application development best practices
   * Exploring integration testing best practices
      * Using Spring Session to manage session
      * Implementing Spring Session with Redis
         * Adding dependencies for Spring Session
         * Configuring the filter to replace a HttpSession with Spring Session
         * Enabling filtering for Tomcat by extending AbstractHttpSessionApplicationInitializer
   * Exploring caching best practices
      * Adding the spring-boot-starter-cache dependency
      * Adding caching annotations
   * Understanding best practices for logging
      * Using the Logback framework
      * log4j2
      * Providing framework independent configuration
   * Summary

* Working with Kotlin in Spring
   * Technical requirements
   * Getting started with Kotlin
   * Comparing Kotlin and Java
      * Creating variables and understanding type inference
      * Understanding the immutability of variables
      * A quick look at the type system
      * Understanding null safety
      * Defining functions in Kotlin
      * Playing with arrays
      * Exploring Kotlin collections
      * No checked exceptions
      * Using a data class for beans
   * Creating a Kotlin project in Eclipse
      * Kotlin plugin
      * Creating a Kotlin project
      * Creating a Kotlin class
      * Running a Kotlin class
   * Creating a Spring Boot project using Kotlin
      * Adding dependencies and plugins to pom.xml
      * Spring Boot application class
      * Spring Boot application test class
   * Implementing the REST service using Kotlin
      * A simple method returning a string
         * Writing a unit test
         * Writing an integration test
      * Simple REST method returning an object
         * Executing a request
         * Writing a unit test
         * Writing an integration test
      * GET method with path variables
         * Executing a request
         * Writing a unit test
         * Writing an integration test
   * Summary

* Other Books You May Enjoy
   * Leave a review - let other readers know what you think

