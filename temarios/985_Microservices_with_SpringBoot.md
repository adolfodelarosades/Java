# Microservices with Spring Boot and Spring Cloud - Second Edition

![image](https://user-images.githubusercontent.com/23094588/211580816-d05b62b4-29d8-4417-8b70-63bdbf5e15d8.png)

* **TIME TO COMPLETE**: 16h 47m
* **TOPICS**: Spring
* **PUBLISHED BY**: Packt Publishing
* **PUBLICATION DATE**: July 2021
* **PRINT LENGTH**: 774 pages

**Cree e implemente aplicaciones basadas en microservicios con calidad de producción: nueva edición actualizada para el buen funcionamiento de Spring, Java, Kubernetes e Istio, con una introducción a Helm 3 y soporte para Mac y Windows con WSL2**

### Características clave

Cree microservicios nativos de la nube listos para la producción con esta guía completamente actualizada
Comprender los desafíos de construir arquitecturas de microservicios a gran escala
Descubra cómo aprovechar al máximo Spring Cloud, Kubernetes e Istio en combinación

### Descripción del libro

¿Quiere crear e implementar microservicios, pero no sabe por dónde empezar? Bienvenido a Microservicios con Spring Boot y Spring Cloud.

Esta edición presenta las versiones más recientes de Spring, Java, Kubernetes e Istio, lo que demuestra un manejo más rápido y sencillo de Spring Boot, los clústeres locales de Kubernetes y la instalación de Istio. El alcance ampliado incluye compilación nativa de microservicios basados ​​en Spring, soporte para Mac y Windows con WSL2 y una introducción a Helm 3 para empaquetado e implementación. Un capítulo de seguridad renovado ahora sigue la especificación OAuth 2.1 y hace uso del servidor de autorización de Spring recientemente lanzado por el equipo de Spring.

Comenzará con un conjunto de microservicios cooperativos simples, luego agregará persistencia y resiliencia, hará que sus microservicios sean reactivos y documentará sus API usando OpenAPI.

A continuación, aprenderá cómo se aplican los patrones de diseño fundamentales para agregar funciones importantes, como el descubrimiento de servicios con Netflix Eureka y los servidores perimetrales con Spring Cloud Gateway. Implementará sus microservicios con Kubernetes y adoptará Istio, luego explorará la administración centralizada de registros con la pila de Elasticsearch, Fluentd y Kibana (EFK), y luego monitoreará los microservicios con Prometheus y Grafana.

Al final de este libro, estará creando microservicios escalables y sólidos con Spring Boot y Spring Cloud.

### Lo que vas a aprender

* Cree microservicios reactivos con Spring Boot
* Desarrolle microservicios resilientes y escalables usando Spring Cloud
* Utilice OAuth 2.1/OIDC y Spring Security para proteger las API públicas
* Implemente Docker para cerrar la brecha entre el desarrollo, las pruebas y la producción
* Implemente y administre microservicios con Kubernetes
* Aplique Istio para mejorar la seguridad, la visibilidad y la gestión del tráfico
* Escriba y ejecute pruebas de microservicio automatizadas con JUnit, testcontainers, Gradle y bash

### Para quien es este libro

Si es un desarrollador de Java o Spring Boot que está aprendiendo a crear entornos de microservicios desde cero, este libro es para usted. No necesita ningún conocimiento previo sobre la arquitectura de microservicios para comenzar, pero es imprescindible una comprensión sólida y suficiente experiencia en Java y Spring Boot para crear aplicaciones de forma autónoma.

<hr>

### Sobre el editor

Packt ayuda a los desarrolladores del mundo real a poner el software a trabajar de nuevas maneras con más de 7500 libros y videos prácticos que cubren más de 1000 tecnologías. Con una cobertura que va desde programación introductoria hasta tecnologías nuevas y emergentes, así como consejos expertos de figuras líderes de la industria, Packt tiene un excelente contenido para cualquier profesional técnico que busque mantenerse relevante y mantener sus habilidades actualizadas.

Más sobre Packt Publishing

<hr>

### Recursos

[Contenido suplementario](https://github.com/PacktPublishing/Microservices-with-Spring-Boot-and-Spring-Cloud-2E)

## Contents

### [Preface](https://github.com/adolfodelarosades/Java/blob/master/temarios/985_Microservices_with_SpringBoot/00_Preface.md)
* Who this book is for
* What this book covers
* To get the most out of this book
* Get in touch

### Part I: Getting Started with Microservice Development Using Spring Boot

### 1. Introduction to Microservices
* Technical requirements
* My way into microservices
   * Benefits of autonomous software components
   * Challenges with autonomous software components
   * Enter microservices
   * A sample microservice landscape
* Defining a microservice
* Challenges with microservices
* Design patterns for microservices
   * Service discovery
      * Problem
      * Solution
      * Solution requirements
   * Edge server
      * Problem
      * Solution
      * Solution requirements
   * Reactive microservices
      * Problem
      * Solution
      * Solution requirements
   * Central configuration
      * Problem
      * Solution
      * Solution requirements
   * Centralized log analysis
      * Problem
      * Solution
      * Solution requirements
   * Distributed tracing
      * Problem
      * Solution
      * Solution requirements
   * Circuit breaker
      * Problem
      * Solution
      * Solution requirements
   * Control loop
      * Problem
      * Solution
      * Solution requirements
   * Centralized monitoring and alarms
      * Problem
      * Solution
      * Solution requirements
* Software enablers
* Other important considerations
* Summary

### 2. Introduction to Spring Boot
* Technical requirements
* Spring Boot
   * Convention over configuration and fat JAR files
   * Code examples for setting up a Spring Boot application
      * The magic @SpringBootApplication annotation
      * Component scanning
      * Java-based configuration
* Spring WebFlux
   * Code examples of setting up a REST service
      * Starter dependencies
      * Property files
      * Sample RestController
* springdoc-openapi
* Spring Data
   * Entity
   * Repositories
* Spring Cloud Stream
   * Code examples for sending and receiving messages
* Docker
* Summary
* Questions

### 3. Creating a Set of Cooperating Microservices
* Technical requirements
* Introducing the microservice landscape
   * Information handled by the microservices
      * Product service
      * Review service
      * Recommendation service
      * Product composite service
      * Infrastructure-related information
   * Temporarily replacing service discovery
* Generating skeleton microservices
   * Using Spring Initializr to generate skeleton code
   * Setting up multi-project builds in Gradle
* Adding RESTful APIs
   * Adding an API and a util project
      * The API project
      * The util project
   * Implementing our API
* Adding a composite microservice
   * API classes
   * Properties
   * Integration component
   * Composite API implementation
* Adding error handling
   * The global REST controller exception handler
   * Error handling in API implementations
   * Error handling in the API client
* Testing APIs manually
* Adding automated microservice tests in isolation
* Adding semi-automated tests of a microservice landscape
   * Trying out the test script
* Summary
* Questions

### 4. Deploying Our Microservices Using Docker
* Technical requirements
* Introduction to Docker
   * Running our first Docker commands
* Challenges with running Java in Docker
   * Limiting available CPUs
   * Limiting available memory
* Using Docker with one microservice
   * Changes in source code
   * Building a Docker image
   * Starting up the service
   * Running the container detached
* Managing a landscape of microservices using Docker Compose
   * Changes in the source code
   * Starting up the microservice landscape
* Automating tests of cooperating microservices
   * Troubleshooting a test run
* Summary
* Questions

### 5. Adding an API Description Using OpenAPI
* Technical requirements
* Introduction to using springdoc-openapi
* Adding springdoc-openapi to the source code
   * Adding dependencies to the Gradle build files
   * Adding OpenAPI configuration and general API documentation to the ProductCompositeService
   * Adding API-specific documentation to the ProductCompositeService interface
* Building and starting the microservice landscape
* Trying out the OpenAPI documentation
* Summary
* Questions

### 6. Adding Persistence
* Technical requirements
* Chapter objectives
* Adding a persistence layer to the core microservices
   * Adding dependencies
   * Storing data with entity classes
   * Defining repositories in Spring Data
* Writing automated tests that focus on persistence
   * Using Testcontainers
   * Writing persistence tests
* Using the persistence layer in the service layer
   * Logging the database connection URL
   * Adding new APIs
   * Calling the persistence layer from the service layer
   * Declaring a Java bean mapper
   * Updating the service tests
* Extending the composite service API
   * Adding new operations in the composite service API
   * Adding methods in the integration layer
   * Implementing the new composite API operations
   * Updating the composite service tests
* Adding databases to the Docker Compose landscape
   * The Docker Compose configuration
   * Database connection configuration
   * The MongoDB and MySQL CLI tools
* Manual tests of the new APIs and the persistence layer
* Updating the automated tests of the microservice landscape
* Summary
* Questions

### 7. Developing Reactive Microservices
* Technical requirements
* Choosing between non-blocking synchronous APIs and event-driven asynchronous services
* Developing non-blocking synchronous REST APIs
   * An introduction to Project Reactor
   * Non-blocking persistence using Spring Data for MongoDB
      * Changes in the test code
   * Non-blocking REST APIs in the core services
      * Changes in the APIs
      * Changes in the service implementations
      * Changes in the test code
      * Dealing with blocking code
   * Non-blocking REST APIs in the composite services
      * Changes in the API
      * Changes in the service implementation
      * Changes in the integration layer
      * Changes in the test code
* Developing event-driven asynchronous services
   * Handling challenges with messaging
      * Consumer groups
      * Retries and dead-letter queues
      * Guaranteed order and partitions
   * Defining topics and events
   * Changes in the Gradle build files
   * Consuming events in the core services
      * Declaring message processors
      * Changes in the service implementations
      * Adding configuration for consuming events
      * Changes in the test code
   * Publishing events in the composite service
      * Publishing events in the integration layer
      * Adding configuration for publishing events
      * Changes in the test code
* Running manual tests of the reactive microservice landscape
   * Saving events
   * Adding a health API
   * Using RabbitMQ without using partitions
   * Using RabbitMQ with partitions
   * Using Kafka with two partitions per topic
* Running automated tests of the reactive microservice landscape
* Summary
* Questions

### Part II: Leveraging Spring Cloud to Manage Microservices

### 8. Introduction to Spring Cloud
* Technical requirements
* The evolution of Spring Cloud
* Using Netflix Eureka for service discovery
* Using Spring Cloud Gateway as an edge server
* Using Spring Cloud Config for centralized configuration
* Using Resilience4j for improved resilience
   * Sample usage of the circuit breaker in Resilience4j
* Using Spring Cloud Sleuth and Zipkin for distributed tracing
* Summary
* Questions

### 9. Adding Service Discovery Using Netflix Eureka
* Technical requirements
* Introducing service discovery
   * The problem with DNS-based service discovery
   * Challenges with service discovery
   * Service discovery with Netflix Eureka in Spring Cloud
* Setting up a Netflix Eureka server
* Connecting microservices to a Netflix Eureka server
* Setting up the configuration for development use
   * Eureka configuration parameters
   * Configuring the Eureka server
   * Configuring clients to the Eureka server
* Trying out the discovery service
   * Scaling up
   * Scaling down
   * Disruptive tests with the Eureka server
      * Stopping the Eureka server 
      * Stopping a review instance
      * Starting up an extra instance of the product service
* Starting up the Eureka server again
* Summary
* Questions

### 10. Using Spring Cloud Gateway to Hide Microservices behind an Edge Server
Technical requirements
Adding an edge server to our system landscape
Setting up Spring Cloud Gateway
Adding a composite health check
Configuring a Spring Cloud Gateway
Routing rules
Trying out the edge server
Examining what is exposed outside the Docker engine
Trying out the routing rules
Calling the product composite API through the edge server
Calling the Swagger UI through the edge server
Calling Eureka through the edge server
Routing based on the host header
Summary
Questions
Securing Access to APIs
Technical requirements
Introduction to OAuth 2.0 and OpenID Connect
Introducing OAuth 2.0
Introducing OpenID Connect
Securing the system landscape
Protecting external communication with HTTPS
Replacing a self-signed certificate at runtime
Securing access to the discovery server
Changes in the Eureka server
Changes in Eureka clients
Adding a local authorization server
Protecting APIs using OAuth 2.0 and OpenID Connect
Changes in both the edge server and the product-composite service
Changes in the product-composite service only
Changes to allow Swagger UI to acquire access tokens
Changes in the test script
Testing with the local authorization server
Building and running the automated tests
Testing the protected discovery server
Acquiring access tokens
Acquiring access tokens using the client credentials grant flow
Acquiring access tokens using the authorization code grant flow
Calling protected APIs using access tokens
Testing Swagger UI with OAuth 2.0
Testing with an external OpenID Connect provider
Setting up and configuring an account in Auth0
Applying the required changes to use Auth0 as an OpenID provider
Changing the configuration in the OAuth resource servers
Changing the test script so it acquires access tokens from Auth0
Running the test script with Auth0 as the OpenID Connect provider
Acquiring access tokens using the client credentials grant flow
Acquiring access tokens using the authorization code grant flow
Calling protected APIs using the Auth0 access tokens
Getting extra information about the user
Summary
Questions
Centralized Configuration
Technical requirements
Introduction to the Spring Cloud Configuration server
Selecting the storage type of the configuration repository
Deciding on the initial client connection
Securing the configuration
Securing the configuration in transit
Securing the configuration at rest
Introducing the config server API
Setting up a config server
Setting up a routing rule in the edge server
Configuring the config server for use with Docker
Configuring clients of a config server
Configuring connection information
Structuring the configuration repository
Trying out the Spring Cloud Configuration server
Building and running automated tests
Getting the configuration using the config server API
Encrypting and decrypting sensitive information
Summary
Questions
Improving Resilience Using Resilience4j
Technical requirements
Introducing the Resilience4j resilience mechanisms
Introducing the circuit breaker
Introducing the time limiter
Introducing the retry mechanism
Adding the resilience mechanisms to the source code
Adding programmable delays and random errors
Changes in the API definitions
Changes in the product-composite microservice
Changes in the product microservice
Adding a circuit breaker and a time limiter
Adding dependencies to the build file
Adding annotations in the source code
Adding fail-fast fallback logic
Adding configuration
Adding a retry mechanism
Adding the retry annotation
Adding configuration
Adding automated tests
Trying out the circuit breaker and retry mechanism
Building and running the automated tests
Verifying that the circuit is closed under normal operations
Forcing the circuit breaker to open when things go wrong
Closing the circuit breaker again
Trying out retries caused by random errors
Summary
Questions
Understanding Distributed Tracing
Technical requirements
Introducing distributed tracing with Spring Cloud Sleuth and Zipkin
Adding distributed tracing to the source code
Adding dependencies to build files
Adding configuration for Spring Cloud Sleuth and Zipkin
Adding Zipkin to the Docker Compose files
Trying out distributed tracing
Starting up the system landscape with RabbitMQ as the queue manager
Sending a successful API request
Sending an unsuccessful API request
Sending an API request that triggers asynchronous processing
Monitoring trace information passed to Zipkin in RabbitMQ
Using Kafka as a message broker
Summary
Questions
Part III: Developing Lightweight Microservices Using Kubernetes
Introduction to Kubernetes
Technical requirements
Introducing Kubernetes concepts
Introducing Kubernetes API objects
Introducing Kubernetes runtime components
Creating a Kubernetes cluster using Minikube
Working with Minikube profiles
Working with the Kubernetes CLI, kubectl
Working with kubectl contexts
Creating a Kubernetes cluster
Trying out a sample deployment
Managing a local Kubernetes cluster
Hibernating and resuming a Kubernetes cluster
Terminating a Kubernetes cluster
Summary
Questions
Deploying Our Microservices to Kubernetes
Technical requirements
Replacing Netflix Eureka with Kubernetes Services
Introducing how Kubernetes will be used
Using Spring Boot's support for graceful shutdown and probes for liveness and readiness
Introducing Helm
Running Helm commands
Looking into a Helm chart
Helm templates and values
The common library chart
The ConfigMap template
The Secrets template
The Service template
The Deployment template
The components charts
The environment charts
Deploying to Kubernetes for development and test
Building Docker images
Resolving Helm chart dependencies
Deploying to Kubernetes
Changes in the test script for use with Kubernetes
Testing the deployment
Testing Spring Boot's support for graceful shutdown and probes for liveness and readiness
Deploying to Kubernetes for staging and production
Changes in the source code
Deploying to Kubernetes
Cleaning up
Summary
Questions
Implementing Kubernetes Features to Simplify the System Landscape
Technical requirements
Replacing the Spring Cloud Config Server
Changes required to replace the Spring Cloud Config Server
Replacing the Spring Cloud Gateway
Changes required to replace the Spring Cloud Gateway
Automating certificate provisioning
Testing with Kubernetes ConfigMaps, Secrets, Ingress, and the cert-manager
Rotating certificates
Deploying to Kubernetes for staging and production
Verifying that the microservices work without Kubernetes
Changes in the Docker Compose files
Testing with Docker Compose
Summary
Questions
Using a Service Mesh to Improve Observability and Management
Technical requirements
Introducing service meshes using Istio
Introducing Istio
Injecting Istio proxies into microservices
Introducing Istio API objects
Simplifying the microservice landscape
Replacing Kubernetes Ingress controller with Istio ingress gateway
Replacing the Zipkin server with Istio's Jaeger component
Deploying Istio in a Kubernetes cluster
Setting up access to Istio services
Creating the service mesh
Source code changes
Content in the _istio_base.yaml template
Content in the _istio_dr_mutual_tls.yaml template
Running commands to create the service mesh
Observing the service mesh
Securing a service mesh
Protecting external endpoints with HTTPS and certificates
Authenticating external requests using OAuth 2.0/OIDC access tokens
Protecting internal communication using mutual authentication (mTLS)
Ensuring that a service mesh is resilient
Testing resilience by injecting faults
Testing resilience by injecting delays
Performing zero-downtime updates
Source code changes
Virtual services and destination rules
Deployments and services
Tying things together in the prod-env Helm chart
Deploying v1 and v2 versions of the microservices with routing to the v1 version
Verifying that all traffic initially goes to the v1 version of the microservices
Running canary tests
Running blue/green deployment
A short introduction to the kubectl patch command
Performing the blue/green deployment
Running tests with Docker Compose
Summary
Questions
Centralized Logging with the EFK Stack
Technical requirements
Introducing Fluentd
Overview of Fluentd
Configuring Fluentd
Deploying the EFK stack on Kubernetes
Building and deploying our microservices
Deploying Elasticsearch and Kibana
A walkthrough of the manifest files
Running the deploy commands
Deploying Fluentd
A walkthrough of the manifest files
Running the deploy commands
Trying out the EFK stack
Initializing Kibana
Analyzing the log records
Discovering the log records from microservices
Performing root cause analyses
Summary
Questions
Monitoring Microservices
Technical requirements
Introduction to performance monitoring using Prometheus and Grafana
Changes in source code for collecting application metrics
Building and deploying the microservices
Monitoring microservices using Grafana dashboards
Installing a local mail server for tests
Starting up the load test
Using Kiali's built-in dashboards
Importing existing Grafana dashboards
Developing your own Grafana dashboards
Examining Prometheus metrics
Creating the dashboard
Trying out the new dashboard
Exporting and importing Grafana dashboards
Setting up alarms in Grafana
Setting up a mail-based notification channel
Setting up an alarm on the circuit breaker
Trying out the circuit breaker alarm
Summary
Questions
Installation Instructions for macOS
Technical requirements
Installing tools
Installing Homebrew
Using Homebrew to install tools
Install tools without Homebrew
Post-installation actions
Verifying the installations
Accessing the source code
Using an IDE
The structure of the code
Installation Instructions for Microsoft Windows with WSL 2 and Ubuntu
Technical requirements
Installing tools
Installing tools on Windows
Installing WSL 2 – Windows Subsystem for Linux v2
Installing Ubuntu 20.04 on WSL 2
Installing Windows Terminal
Installing Docker Desktop for Windows
Installing Visual Studio Code and its extension for Remote WSL
Installing tools on the Linux server in WSL 2
Installing tools using apt install
Installing the Spring Boot CLI using sdk install
Installing the remaining tools using curl and install
Verifying the installations
Accessing the source code
The structure of the code
Native Compiled Java Microservices
Technical requirements
When to native compile Java source code
Introducing the GraalVM project
Introducing the Spring Native project
Compiling source code to a native image
Changes in the source code
Updates to the Gradle build files
Providing native hints as annotations
When underlying frameworks and libraries don't support native compilation
Installing the tracing agent
Installing the tracing agent on macOS
Installing the tracing agent on Ubuntu under WSL 2 in Microsoft Windows
Running the tracing agent
Creating the native images
Testing with Docker Compose
Testing with Kubernetes
Summary
Questions
Other Books You May Enjoy
Index
Landmarks
Cover
Index
