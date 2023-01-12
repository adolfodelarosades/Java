# Spring Start Here

![image](https://user-images.githubusercontent.com/23094588/211873351-3e3f134a-9b48-45f6-b9ce-93568d288707.png)

* **TIME TO COMPLETE**: 11h 25m
* **TOPICS**: Spring
* **PUBLISHED BY**: Manning Publications
* **PUBLICATION DATE**: October 2021
* **PRINT LENGTH**: 416 pages

***Spring Start Here*** enseña a los desarrolladores de Java cómo crear aplicaciones utilizando el Spring framework. Los gráficos informativos, los ejemplos relevantes y la escritura clara y animada del autor Laurenţiu Spilcă facilitan la adquisición de las habilidades que necesita. Descubrirá cómo planificar, escribir y probar aplicaciones. Y al concentrarse en las características más importantes, este libro serio le brinda una base sólida para explorar el rico ecosistema de Spring.


### Recursos

[Contenido suplementario](https://www.manning.com/books/spring-start-here)

## Contenido

### [Introduction](https://github.com/adolfodelarosades/Java/blob/master/temarios/970_Spring_Start_Here/00_Introduction.md) 👍

* foreword
* preface
* acknowledgments
* about this book
* about the author
* about the cover illustration

### [Part 1 Fundamentals](https://github.com/adolfodelarosades/Java/blob/master/temarios/970_Spring_Start_Here/001_Part1.md) 👍

* [1 Spring in the real world](https://github.com/adolfodelarosades/Java/blob/master/temarios/970_Spring_Start_Here/01_Spring-in-the-real-world.md) 👍
   * 1.1 Why should we use frameworks?
   * 1.2 The Spring ecosystem
      * Discovering Spring Core: The foundation of Spring
      * Using Spring Data Access feature to implement the app’s persistence
      * The Spring MVC capabilities for developing web apps
      * The Spring testing feature
      * Projects from the Spring ecosystem
   * 1.3 Spring in real-world scenarios
      * Using Spring in the development of a backend app
      * Using Spring in a test automation app
      * Using Spring for the development of a desktop app
      * Using Spring in mobile apps
   * 1.4 When not to use frameworks
      * You need to have a small footprint
      * Security needs dictate custom code
      * Abundant existing customizations make a framework impractical
      * You won’t benefit from switching to a framework
   * 1.5 What will you learn in this book

* [2 The Spring context: Defining beans](https://github.com/adolfodelarosades/Java/blob/master/temarios/970_Spring_Start_Here/02_Spring-context.md)
   * 2.1 Creating a Maven project
   * 2.2 Adding new beans to the Spring context
      * Using the @Bean annotation to add beans into the Spring context
      * Using stereotype annotations to add beans to the Spring context
      * Programmatically adding beans to the Spring context

* 3 The Spring context: Wiring beans
   * 3.1 Implementing relationships among beans defined in the configuration file
      * Wiring the beans using a direct method call between the @Bean methods
      * Wiring the beans using the @Bean annotated method’s parameters
   * 3.2 Using the @Autowired annotation to inject beans
      * Using @Autowired to inject the values through the class fields
      * Using @Autowired to inject the values through the constructor
      * Using dependency injection through the setter
   * 3.3 Dealing with circular dependencies
   * 3.4 Choosing from multiple beans in the Spring context

* 4 The Spring context: Using abstractions
   * 4.1 Using interfaces to define contracts
      * Using interfaces for decoupling implementations
      * The requirement of the scenario      
      * Implementing the requirement without using a framework
   * 4.2 Using dependency injection with abstractions
      * Deciding which objects should be part of the Spring context
      * Choosing what to auto-wire from multiple implementations of an abstraction
   * 4.3 Focusing on object responsibilities with stereotype annotations

* 5 The Spring context: Bean scopes and life cycle
   * 5.1 Using the singleton bean scope
      * How singleton beans work
      * Singleton beans in real-world scenarios
      * Using eager and lazy instantiation
   * 5.2 Using the prototype bean scope
      * How prototype beans work
      * Prototype beans in real-world scenarios
      
* 6 Using aspects with Spring AOP
   * 6.1 How aspects work in Spring
   * 6.2 Implementing aspects with Spring AOP
      * Implementing a simple aspect
      * Altering the intercepted method’s parameters and the returned value
      * Intercepting annotated methods
      * Other advice annotations you can use
   * 6.3 The aspect execution chain

### Part 2 Implementation

* 7 Understanding Spring Boot and Spring MVC
   * 7.1 What is a web app?
      * A general overview of a web app
      * Different fashions of implementing a web app with Spring
      * Using a servlet container in web app development
   * 7.2 The magic of Spring Boot
      * Using a project initialization service to create a Spring Boot project
      * Using dependency starters to simplify the dependency management
      * Using autoconfiguration by convention based on dependencies
   * 7.3 Implementing a web app with Spring MVC

* 8 Implementing web apps with Spring Boot and Spring MVC
   * 8.1 Implementing web apps with a dynamic view
      * Getting data on the HTTP request
      * Using request parameters to send data from client to server
      * Using path variables to send data from client to server
   * 8.2 Using the GET and POST HTTP methods

* 9 Using the Spring web scopes
   * 9.1 Using the request scope in a Spring web app
   * 9.2 Using the session scope in a Spring web app
   * 9.3 Using the application scope in a Spring web app

* 10 Implementing REST services
   * 10.1 Using REST services to exchange data between apps
   * 10.2 Implementing a REST endpoint
   * 10.3 Managing the HTTP response
      * Sending objects as a response body
      * Setting the response status and headers
      * Managing exceptions at the endpoint level
   * 10.4 Using a request body to get data from the client

* 11 Consuming REST endpoints
   * 11.1 Calling REST endpoints using Spring Cloud OpenFeign
   * 11.2 Calling REST endpoints using RestTemplate
   * 11.3 Calling REST endpoints using WebClient

* 12 Using data sources in Spring apps
   * 12.1 What a data source is
   * 12.2 Using JdbcTemplate to work with persisted data
   * 12.3 Customizing the configuration of the data source
      * Defining the data source in the application properties file
      * Using a custom DataSource bean

* 13 Using transactions in Spring apps
   * 13.1 Transactions
   * 13.2 How transactions work in Spring
   * 13.3 Using transactions in Spring apps

* 14 Implementing data persistence with Spring Data
   * 14.1 What Spring Data is
   * 14.2 How Spring Data works
   * 14.3 Using Spring Data JDBC

* 15 Testing your Spring app
   * 15.1 Writing correctly implemented tests
   * 15.2 Implementing tests in Spring apps
      * Implementing unit tests
      * Implementing integration tests

* appendix A Architectural approaches
* appendix B Using XML for the context configuration
* appendix C A quick introduction to HTTP
* appendix D Using JSON formatting
* appendix E Installing MySQL and creating a database
* appendix F Recommended tools
* appendix G Recommended learning materials for further study


