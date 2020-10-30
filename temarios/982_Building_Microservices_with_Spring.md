# 982 Building Microservices with Spring

by Dinesh Rajput, Rajesh R V

Publisher: Packt Publishing

Release Date: December 2018

Pages 502

ISBN: 9781789955644

Topic: Spring

![portada](https://github.com/adolfodelarosades/Java/blob/master/temarios/982_Building_Microservices_with_Spring/images/982-portada.png)

### Descripción del libro

Aprenda y use los patrones de diseño y las mejores prácticas en Spring para resolver problemas de diseño comunes y crear microservicios fáciles de usar

#### Características clave

* Estudie los beneficios de utilizar el patrón de diseño correcto en su kit de herramientas
* Administre su código fácilmente con el patrón de inyección de dependencia de Spring
* Explore las características de Docker y Mesos para crear microservicios exitosos

#### Descripción del libro

Comenzar con Spring Microservices comienza con una descripción general de Spring Framework 5.0, sus patrones de diseño y sus pautas que le permiten implementar microservicios receptivos a escala. Aprenderá a utilizar los patrones GoF en el diseño de aplicaciones. Comprenderá el patrón de inyección de dependencia, que es el principio principal detrás del proceso de desacoplamiento de Spring Framework y facilita la administración de su código. Luego, aprenderá a usar patrones de proxy en programación orientada a aspectos y comunicación remota. Continuando, comprenderá los patrones de plantilla JDBC y su uso para abstraer el acceso a la base de datos.

Después de comprender los conceptos básicos, pasará a temas más avanzados, como flujos reactivos y simultaneidad. Escrito con las últimas especificaciones de Spring que se enfocan en la programación reactiva, la ruta de aprendizaje le enseña cómo construir aplicaciones Java modernas a escala de Internet en poco tiempo.

A continuación, comprenderá cómo se usa Spring Boot para implementar servicios autónomos sin servidor al eliminar la necesidad de tener un servidor de aplicaciones pesado. También explorará formas de implementar sus microservicios en Docker y administrarlos con Mesos.

Al final de esta ruta de aprendizaje, tendrá la claridad y la confianza para implementar microservicios con Spring Framework.

Esta ruta de aprendizaje incluye contenido de los siguientes productos Packt:

* Microservicios Spring 5 de Rajesh R V
* Spring 5 Design Patterns de Dinesh Rajput

#### Lo que vas a aprender

* Desarrollar aplicaciones usando patrones de inyección de dependencia
* Cree aplicaciones web utilizando los patrones tradicionales de Spring MVC
* Utilice el patrón de programación reactiva para crear aplicaciones web reactivas
* Aprenda la simultaneidad y maneje múltiples conexiones dentro de un servidor web
* Utilice Spring Boot y Spring Cloud para desarrollar microservicios
* Aproveche la programación reactiva para crear aplicaciones nativas de la nube

#### Para quien es este libro

Getting Started with Spring Microservices es ideal para los desarrolladores de Spring que desean utilizar patrones de diseño para resolver problemas de diseño comunes y crear aplicaciones listas para la nube, a escala de Internet y servicios RESTful simples.

#### Recursos para editores

Contenido complementario: https://downloads.packtpub.com/code/9781789955644.zip

### Table of Contents

* Title Page
* Copyright
   * Building Microservices with Spring
* About Packt
   * Why subscribe?
   * Packt.com
* Contributors
   * About the authors
   * Packt is searching for authors like you
* Preface
   * Who this book is for
   * What this book covers
   * To get the most out of this book
      * Download the example code files
      * Conventions used
   * Get in touch
      * Reviews

* Getting Started with Spring Framework 5.0 and Design Patterns
   * Introducing Spring Framework
   * Simplifying application development using Spring and its pattern
      * Using the power of the POJO pattern
      * Injecting dependencies between POJOs
         *  How DI works and makes things easy for development and testing
         *  Using factory helper pattern for dependent components
      * Using DI pattern for dependent components
      * Applying aspects for cross cutting concerns
         * How Spring AOP works
      * Applying the template pattern to eliminate boilerplate code
         * The Template Design pattern in Spring
   * Using a Spring container to manage beans with the Factory pattern
      * Bean factory
      * Application contexts
      * Creating a container with an application context
   * Life of a bean in the container
   * Spring modules
      * Core Spring container
      * Spring's AOP module
      * Spring DAO - data access and integration
      * Spring's ORM
      * Spring web MVC
   * New features in Spring Framework 5.0
   * Summary

* Overview of GOF Design Patterns - Core Design Patterns
   * Introducing the power of design patterns
   * Common GoF Design Pattern overview
   * Creational design patterns
      * Factory design pattern
         * Implementing the Factory design pattern in Spring Framework
         * Sample implementation of the Factory design pattern
      * Abstract factory design pattern
         * Common problems where you should apply the Abstract factory design pattern
         * Implementing the Abstract factory design pattern in the Spring Framework
         * Sample implementation of the Abstract Factory design pattern
      * Singleton design pattern
         * Common problems where you should apply Singleton pattern
         * Singleton design pattern implementation in the Spring Framework
         * Sample implementation of the Singleton design pattern
      * Prototype design pattern
         * Benefits of the Prototype design pattern
         * UML class structure
         * Sample implementation of the Prototype design pattern
     * Builder design pattern
         * Benefits of the Builder pattern:
         * UML class structure
         * Implementing the Builder pattern in the Spring Framework
         * Common problems where you should apply Builder pattern
         * Sample implementation of the Builder design pattern
   * Summary

* Wiring Beans using the Dependency Injection Pattern
   * The dependency injection pattern
      * Solving problems using the dependencies injection pattern
         * Without dependency injection
         * With dependency injection pattern
   * Types of dependency injection patterns
      * Constructor-based dependency injection pattern
      * Setter-based dependency injection
   * Configuring the dependency injection pattern with Spring
   * Dependency injection pattern with Java-based configuration
      * Creating a Java configuration class - AppConfig.java
         * Declaring Spring beans into configuration class
         * Injecting Spring beans
         * Best approach to configure the dependency injection pattern with Java
   * Dependency injection pattern with XML-based configuration
      * Creating an XML configuration file
         * Declaring Spring beans in an XML file
         * Injecting Spring beans
            * Using constructor injection
            * Using setter injection
   * Dependency injection pattern with Annotation-based configuration
      * What are Stereotype annotations?
         * Creating auto searchable beans using Stereotype annotations
         * Searching beans using component scanning
         * Annotating beans for autowiring
            * Using @Autowired with setter method
            * Using @Autowired with the fields
   * The Autowiring DI pattern and disambiguation
      * Resolving disambiguation in Autowiring DI pattern
      * Implementing the Abstract Factory Pattern in Spring (FactoryBean interface)
         * Implementation of FactoryBean interface in Spring
         * Sample implementation of FactoryBean interface
   * Best practices for configuring the DI pattern
   * Summary

* Spring Aspect Oriented Programming with Proxy and Decorator pattern
   * Proxy pattern in Spring
      * Proxying classes using Decorator pattern in Spring
   * What are cross-cutting concerns?
   * What is Aspect-Oriented Programming?
      * Problems resolved by AOP
         * Code tangling
         * Code scattering
      * How AOP Works to solve problems
   * Core AOP terminology and concepts
       * Advice
       * Join Point
       * Pointcut
       * Aspect
       * Weaving
    * Defining pointcuts
       * Writing pointcuts
    * Creating aspects
       * Define aspects using Annotation
   * Implementing Advice
       * Advice type - Before
          * Before Advice example
       * Advice Types: After Returning
          * After Returning Advice example
       * Advice Types: After Throwing
          * After Throwing Advice example
       * Advice Types: After
          * After Advice example
       * Advice Types - Around
          * Around Advice example
   * Define aspects using XML configuration
   * Understanding AOP proxies
   * Summary

* Accessing a Database with Spring and JDBC Template Patterns
   * The best approach to designing your data-access
       * The resource management problem
       * Implementing the template design pattern
          * Problems with the traditional JDBC
          * Solving problems with Spring's JdbcTemplate
   * Configuring the data source and object pool pattern
       * Configuring a data source using a JDBC driver
       * Configuring the data source using pool connections
   * Implementing the Builder pattern to create an embedded data source
       * Abstracting database access using the DAO pattern
   * The DAO pattern with the Spring Framework
       * Working with JdbcTemplate
       * When to use JdbcTemplate
          * Creating a JdbcTemplate in an application
          * Implementing a JDBC-based repository
          * Jdbc callback interfaces
             * Creating a RowMapper class
             * Implementing RowCallbackHandler
             * Implementing ResultSetExtractor
   * Best practices for Jdbc and configuring JdbcTemplate
   * Summary

* Improving Application Performance Using Caching Patterns
   * What is cache?
      * Where do we use caching?
   * Understanding cache abstraction
   * Enabling caching via the Proxy pattern
      * Enabling the caching proxy using Annotation
      * Enabling the Caching Proxy using the XML namespace
   * Declarative Annotation-based caching
      * The @Cacheable annotation
      * The @CachePut annotation
         * Customizing the cache key
         * Conditional caching
      * The @CacheEvict annotation
      * The @Caching annotation
      * The @CacheConfig annotation
   * Declarative XML-based caching
   * Configuring the cache storage
      * Setting up the CacheManager
   * Third-party cache implementations
      * Ehcache-based cache
         * XML-based configuration
   * Creating custom caching annotations
   * Top caching best practices to be used in a web application
   * Summary

* Implementing Reactive Design Patterns
   * Understanding application requirement over the years
   * Understanding the reactive pattern
      * The reactive pattern traits
         * Responsiveness
         * Resilience
         * Scalable
         * Message-driven architecture
   * Blocking calls
   * Non-blocking calls
   * Back-pressure
   * Implementing reactive with the Spring 5 Framework
      * Reactive Streams
   * Spring Web reactive module
      * Implementing a reactive web application at the server side
      * The Annotation-based programming model
      * The functional programming model
      * Implementing a Reactive Client-Side application
   * Request and response body conversion
   * Summary

* Implementing Concurrency Patterns
   * Active object pattern
   * Monitor object pattern
   * Half-Sync/Half-Async patterns
   * Leader/follower pattern
   * Reactor pattern
   * Thread-specific storage pattern
      * Best practices for concurrency module
   * Summary

* Demystifying Microservices
   * Evolution of microservices
      * Business demand as a catalyst for microservices evolution
      * Technology as a catalyst for microservices evolution
      * Imperative architecture evolution
   * What are Microservices?
   * Microservices - The honeycomb analogy
   * Principles of microservices
      * Single responsibility per service
      * Microservices are autonomous
   * Characteristics of microservices
      * Services are first class citizens
         * Characteristics of service in a microservice
      * Microservices are lightweight
      * Microservices with polyglot architecture
      * Automation in microservices environment
      * Microservices with a supporting ecosystem
      * Microservices are distributed and dynamic
      * Antifragility, fail fast, and self healing
   * Microservices examples
      * An example of a holiday portal
      * An example of a travel agent portal
   * Microservices benefits
      * Supports polyglot architecture
      * Enables experimentation and innovation
      * Elastically and selectively scalable
      * Allows substitution
      * Enables to build organic systems
      * Helps managing technology debt
      * Allowing co-existence of different versions
      * Supporting building self-organizing systems
      * Supporting event-driven architecture
      * Enables DevOps
   * Summary

* Related Architecture Styles and Use Cases
   * Service-Oriented Architecture (SOA)
      * Service-oriented integration
      * Legacy modernization
      * Service-oriented application
      * Monolithic migration using SOA
   * Twelve-Factor Apps
      * Single code base
      * Bundle dependencies
      * Externalizing configurations
      * Backing services are addressable
      * Isolation between build, release, and run
      * Stateless, shared nothing processes
      * Expose services through port bindings
      * Concurrency for scale out
      * Disposability, with minimal overhead
      * Development, production parity
      * Externalizing logs
      * Package admin processes
   * Serverless computing
   * Lambda architecture
   * DevOps, Cloud, and Containers
      * DevOps as the practice and process for microservices
      * Cloud and Containers as the self-service infrastructure for microservices
   * Reactive microservices
      * A reactive microservice-based order management system
   * Microservice use cases
   * Microservices early adopters - Is there a common theme?
      * Monolithic migration as the common use case
   * Microservice frameworks
   * Summary

* Building Microservices with Spring Boot
   * Setting up a development environment
   * Spring Boot for building RESTful microservices
   * Getting started with Spring Boot
   * Developing a Spring Boot microservice
   * Developing our first Spring Boot microservice
      * Testing Spring Boot microservice
   * HATEOAS-enabled Spring Boot microservice
   * Reactive Spring Boot microservices
      * Reactive microservices using Spring WebFlux
         * Understanding Reactive Streams
            * Publisher
            * Subscriber
            * Subscription
            * Processor
      * Reactive microservices using Spring Boot and RabbitMQ
   * Implementing security
      * Securing a microservice with basic security
      * Securing microservice with OAuth2
   * Enabling cross origin for microservices interactions
   * Spring Boot actuators for microservices instrumentation
      * Monitoring using JConsole
      * Monitoring using ssh
      * Adding a custom health module
      * Building custom metrics
   * Documenting microservices
   * Putting it all together - Developing a customer registration microservice example
   * Summary

* Scale Microservices with Spring Cloud Components
   * What is Spring Cloud?
   * Spring Cloud releases
   * Setting up the environment for the BrownField PSS
   * Spring Cloud Config
      * Building microservices with Config Server
      * Setting up the Config Server
      * Understanding the Config Server URL
         * Accessing the Config Server from clients
      * Handling configuration changes
      * Spring Cloud Bus for propagating configuration changes
      * Setting up high availability for the Config Server
      * Monitoring Config Server health
      * Config Server for configuration files
      * Completing changes to use Config Server
   * Eureka for registration and discovery
      * Understanding dynamic service registration and discovery
      * Understanding Eureka
      * Setting up the Eureka Server
      * High availability for Eureka
   * Zuul proxy as the API Gateway
      * Setting up Zuul
      * High availability of Zuul
         * High availability of Zuul when the client is also a Eureka Client
         * High availability when client is not a Eureka Client
         * Completing Zuul for all other services
   * Streams for reactive microservices
   * Protecting microservices with Spring Cloud Security
   * Summarising the BrownField PSS architecture
   * Summary

* Logging and Monitoring Microservices
   * Understanding log management challenges
   * Centralized logging solution
   * Selection of logging solutions
      * Cloud services
      * Off-the-shelf solutions
      * Best of the breed integration
         * Log shippers
         * Log stream processors
         * Log storage
         * Dashboards
      * Custom logging implementation
      * Distributed tracing with Spring Cloud Sleuth
   * Monitoring microservices
      * Monitoring challenges
      * Monitoring tools
      * Monitoring microservice dependency
      * Spring Cloud Hystrix for fault-tolerant microservices
      * Aggregate Hystrix streams with Turbine
   * Data analysis using Data Lake
   * Summary

* Containerizing Microservices with Docker
   * Understanding gaps in the BrownField PSS microservices
   * What are containers?
   * Difference between VM and containers
   * Benefits of containers
   * Microservices and containers
   * Introduction to Docker
      * Key components of Docker
         * The Docker daemon
         * The Docker client
         * The Docker image
         * The Docker container
         * The Docker registry
         * Dockerfile
   * Deploying microservices into Docker
   * Running RabbitMQ on Docker
   * Using the Docker registry
      * Setting up the Docker Hub
      * Publish microservices to the Docker Hub
   * Microservices on Cloud
      * Installing Docker on AWS EC2
   * Running BrownField services on EC2
   * Future of containerization
   * Summary

* Scaling Dockerized Microservices with Mesos and Marathon
   * Scaling microservices
      * Understanding autoscaling
      * The missing pieces
   * Container orchestration
      * Why is container orchestration is important
      * What does container orchestration do?
      * Relationship with microservices
      * Relationship with virtualization
      * Container orchestration solutions
         * Docker Swarm
         * Kubernetes
         * Apache Mesos
         * HashiCorp Nomad
         * CoreOS Fleet
   * Container orchestration with Mesos and Marathon
      * Mesos in details
         * Mesos architecture
         * Marathon
   * Implementing Mesos and Marathon with DCOS
   * Implementing Mesos and Marathon for BrownField microservices
      * Installing Mesos, Marathon, and related components
      * Running Mesos and Marathon
   * Preparing BrownField PSS services
      * Deploying BrownField PSS services
   * Summary

* Other Books You May Enjoy
   * Leave a review - let other readers know what you think
