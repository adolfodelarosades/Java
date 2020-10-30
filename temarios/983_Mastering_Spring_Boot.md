# 983 Mastering Spring Boot 2.0

by Dinesh Rajput

Publisher: Packt Publishing

Release Date: May 2018

Pages 390

ISBN: 9781787127562

Topic: Spring

![portada]()

### Descripción del libro

*Aprenda a desarrollar, probar e implementar su aplicación distribuida Spring Boot y explorar varias mejores prácticas.*

#### Sobre este libro
* Cree e implemente su arquitectura de microservicios en la nube
* Cree sistemas resistentes impulsados ​​por eventos utilizando Hystrix y Turbine
* Explore herramientas de administración de API como KONG y herramientas de documentación de API como Swagger

#### Para quien es este libro

El libro está dirigido a desarrolladores experimentados de Spring y Java que tengan un conocimiento básico de trabajar con Spring Boot. El lector debe estar familiarizado con los conceptos básicos de Spring Boot y conocer sus beneficios sobre las aplicaciones tradicionales basadas en Spring Framework.

#### Lo que vas a aprender

* Cree aplicaciones Spring Boot estructuradas lógicamente y con un gran mantenimiento
* Configurar microservicios RESTful usando Spring Boot
* Facilite la producción y el funcionamiento de la aplicación con Spring Actuator
* Cree aplicaciones distribuidas modernas y de alto rendimiento utilizando patrones de nube
* Administre e implemente su aplicación Spring Boot en la nube (AWS)
* Monitorear aplicaciones distribuidas usando agregación de registros y ELK

#### En detalle

Spring es uno de los mejores marcos del mercado para desarrollar software listo para la web, la empresa y la nube. Spring Boot simplifica drásticamente la creación de software complejo al reducir la cantidad de código estándar y al proporcionar funciones listas para producción y un modelo de implementación simple.

Este libro abordará los desafíos relacionados con la energía que vienen con la gran capacidad de configuración y flexibilidad de Spring Boot. Comprenderá cómo funciona la configuración de Spring Boot bajo el capó, cómo sobrescribir las configuraciones predeterminadas y cómo usar técnicas avanzadas para preparar las aplicaciones de Spring Boot para que funcionen en producción. Este libro también presentará a los lectores un tema relativamente nuevo en el ecosistema de Spring: patrones nativos de la nube, programación reactiva y aplicaciones. Póngase al día con los microservicios con Spring Boot y Spring Cloud. Cada capítulo tiene como objetivo resolver un problema específico o enseñarle un conjunto de habilidades útiles. Al final de este libro, dominará la creación e implementación de su aplicación Spring Boot.

#### Estilo y enfoque

El libro adopta un enfoque práctico basado en ejemplos para enseñarle todas las funciones avanzadas de Spring Boot 2.0

Descarga del código de ejemplo para este libro Puede descargar los archivos de código de ejemplo para todos los libros Packt que haya comprado desde su cuenta en http://www.PacktPub.com. Si compró este libro en otro lugar, puede visitar http://www.PacktPub.com/support y registrarse para recibir los archivos por correo electrónico directamente.

#### Recursos para editores

Contenido complementario: https://github.com/PacktPublishing/Mastering-Spring-Boot-2.0

### Table of Contents

Title Page

Copyright and Credits

Mastering Spring Boot 2.0

Dedication

Packt Upsell

Why subscribe?

PacktPub.com

Contributors

About the author

About the reviewers

Packt is searching for authors like you

Preface

Who this book is for

What this book covers

To get the most out of this book

Download the example code files

Conventions used

Get in touch

Reviews

Getting Started with Spring Boot 2.0

Introducing Spring Boot

Simplifying Spring application development using Spring Boot

The essential key components of Spring Boot

Spring Boot Starters

Spring Boot Starter Parent POM

Spring Boot auto-configuration

Enabling Spring Boot auto-configuration

Spring Boot CLI

Spring Boot Actuator

Setting up a Spring Boot workspace

Setting up Spring Boot with Maven

Setting up Spring Boot with Gradle

Developing your first Spring Boot application

Using a web interface for Spring Initializr

Creating a Spring Boot project using the STS IDE

Implementing the REST service

New features in Spring Boot 2.0

Summary

Customizing Auto-Configuration in Spring Boot Application

Understanding auto-configuration

Learning how auto-configuration works

Customizing Spring Boot

Customizing using Spring Boot properties

Replacing generated beans

Disabling specific auto-configuration classes

Changing a library's dependencies

Externalizing configuration with properties

Order of evaluation for overridden properties

Renaming application.properties in the Spring application

Externally configuring application properties

Using the @EnableConfigurationProperties annotation

Fine-tuning with logging

Logging output

Using YAML for configuration

YAML for properties

Multiple profiles inside a single YAML file

Customizing application error pages

Summary

Getting Started with Spring CLI and Actuator

Getting started with using Spring Boot CLI

Installing the Spring Boot CLI

Manually installing from a downloaded distribution

Installation with SDKMAN!

Installing with OSX Homebrew

MacPorts installation

Command-line completion

Using the Initializr with the Spring Boot CLI

Spring Boot Actuator&#xA0;&#x2013; taking Application's Insights

Enabling Spring Boot's Actuator in your application

Analyzing the Actuator's endpoints

Exposing configuration details

Exposing metrics endpoints

Exposing application information

Shutting down your application

Customizing your Actuator endpoints

Enabling or disabling endpoints

Changing endpoint IDs

Changing the sensitivity of the Actuator's endpoints

Writing custom health indicators

Creating a custom endpoint

Securing the Actuator endpoints

The Actuator with Spring Boot 2.X

Summary

Getting Started with Spring Cloud and Configuration

Cloud-native application architecture

Microservices architecture

Microservice benefits

Microservice challenges

Introduction to Spring Cloud

Building blocks of the cloud and microservice applications

Usages of Spring Cloud

Configuring the Spring Cloud application

Creating the configuration producer Spring Cloud Config Server

Project setup and dependencies

Implementing Cloud Config Server

Configuring the application.properties file

Creating a Git repository as configuration storage

Running your configuration application

Configuring multiple repositories using patterns

Authentication

Force-pull property

Creating the configuration consumer Spring Cloud Config client

Summary

Spring Cloud Netflix and Service Discovery

Introduction to Spring Cloud Netflix

The need for Service Discovery in the microservices architecture

Implementing Service Discovery &#x2013; Eureka Server

The Maven build configuration file

The Gradle build configuration file

Enabling the Eureka server as a Discovery Service server

Implementing Service Discovery &#x2013; Eureka clients

Adding the Maven dependencies configuration

The Gradle build configuration

Registering a client with Eureka

Consuming the REST service

Using EurekaClient

Using DiscoveryClient

Client-side load balancing using Netflix Ribbon

Using the registry-aware Spring Cloud Netflix FeignClient client

Summary

Building Spring Boot RESTful Microservice

Microservices with Spring Boot

Brief introduction to bootstrap.yml and application.yml

A simple microservice example

Creating a discovery service

Creating a microservice (the Producer)

Creating microservice consumers

Load-balanced RestTemplate

Brief introduction to Spring Data

Apache Ignite repository

Spring Data MongoDB

Spring MongoDB data highlights

Spring Data JPA

Summary

Creating API Gateway with Netflix Zuul Proxy

The need for an API Gateway pattern

Pros of the API Gateway pattern

Cons of the API Gateway pattern

API Gateway pattern components

Implementing API Gateway using Netflix Zuul Proxy

Including Zuul using Maven dependency

Enabling the Zuul service proxy

Configuring Zuul properties

Adding Zuul filters

Registering Zuul filters

Summary

Simplify HTTP API with Feign Client

Declarative REST client&#xA0;&#x2013; Feign basics

Including Feign in the cloud application

Overriding Feign defaults

Creating Feign clients

Feign inheritance support

Multiple interfaces

Advanced usage of the Feign client

Feign logging

Exception handling

Custom encoders and decoders

Custom encoder

Custom decoder

Feign and Hystrix

Unit testing Feign clients

Summary

Building Event-Driven and Asynchronous Reactive Systems

Event-driven architecture patterns

Mediator topology

Broker topology

Introduction to reactive programming

Spring Reactive

ReactiveX

Introduction to Command Query Responsibility Segregation

Introduction to the Event Sourcing pattern

Introduction to Eventual consistency

Building an event-driven Reactive Asynchronous System

Introducing Spring Cloud Streaming

Adding Kafka to your application

Installing and running Kafka

Configuration properties for Kafka

Service used to write to Kafka

Rest API controller

Listening to a Kafka topic

Summary

Building Resilient Systems Using Hystrix and Turbine

Circuit-breaker pattern

Using the Hystrix library with a reference implementation

Configuring Hystrix in your application

Maven dependency

Enabling circuit-breaker

Adding the Hystrix annotation in services

Error propagation

Implementing a REST controller in customer service

Building and testing customer service

Customizing the default configuration

Hystrix Metrics Stream

Implementing Hystrix Dashboard in our project

Turbine dashboard

Turbine stream

REST consumer with Hystrix and Feign

Summary

Testing Spring Boot Application

Test-driven development

Unit testing

Advantages

Disadvantages

Other mock libraries

Integration testing

Benefits of testing with Spring

Activating profiles for a test class

JUnit tests for the Spring Boot application

Using Mockito for mocking services

Postman for testing RESTful service contracts

Summary

Containerizing Microservice

Introducing containers to the microservice architecture

Virtual machines versus containers

Benefits of a container-oriented approach

Drawbacks of a container-oriented approach

Key concepts of the containers-oriented approach

Getting started with Docker

Installing Docker

Installing Docker on Linux

Installing Docker on Windows

Docker commands

Container-specific commands

Docker architecture

Docker Engine

Docker container

Writing Dockerfile

Dockerizing any Spring Boot application

Creating a Docker image using Maven

Getting started with Docker Compose

Installing Docker Compose

Using Docker Compose

Writing a docker-compose file

Orchestration using a docker-compose file

Scaling containers using docker-compose and load balancing

Introducing Kubernetes

Summary

API Management

API Management

Advantages of using API Management software tools

API Management tools

Rate limiting

Implementing rate limiting

Learning about KONG

Microservice REST APIs with the KONG architecture

Using APIs without the KONG architecture

Installing KONG

Using the KONG API

Features of the KONG API

Swagger

Usage of Swagger

Using Swagger in a microservice

Adding a Maven dependency

Configuring Swagger 2 in your project

Configuring Swagger UI in your project

Customizing the Swagger UI meta-configuration

Filtering an API from Swagger's documentation

Customizing with Swagger annotations

Advantages of Swagger

Summary

Deploying in Cloud (AWS)

Spinning up an AWS EC2 instance

Microservices architecture on AWS

Publishing microservices to the Docker Hub

Installing Docker on AWS EC2

Running microservices on AWS EC2

Summary

Production Ready Service Monitoring and Best Practices

Monitoring containers

Logging challenges for the microservices architecture

Centralized logging solution for the microservices architecture

Log aggregation using the ELK stack

Install Elasticsearch

Install Logstash

Install Kibana

Requesting tracing using Sleuth

Requesting tracing with Zipkin

Adding the Zipkin server to your machine

Summary

Other Books You May Enjoy

Leave a review - let other readers know what you think
