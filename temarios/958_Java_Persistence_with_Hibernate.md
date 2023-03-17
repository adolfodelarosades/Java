# Java Persistence with Hibernate, Second Edition

<img width="579" alt="image" src="https://user-images.githubusercontent.com/23094588/226042497-dc10afd4-f3c9-47fb-b690-b40bac57659b.png">

Java Persistence with Hibernate, Second Edition explora Hibernate mediante el desarrollo de una aplicación que une cientos de ejemplos individuales. Inmediatamente profundizará en el rico modelo de programación de Hibernate, trabajando a través de asignaciones, consultas, estrategias de obtención, transacciones, conversaciones, almacenamiento en caché y más. A lo largo del camino, encontrará una discusión bien ilustrada de las mejores prácticas en el diseño de bases de datos y técnicas de optimización. En esta edición revisada, los autores Christian Bauer, Gavin King y Gary Gregory cubren Hibernate 5 en detalle con el estándar Java Persistence 2.1 (JSR 338). Todos los ejemplos se han actualizado para las últimas versiones de especificación de Hibernate y Java EE.

## Tabla de Contenido Resumido

Copyright

Brief Table of Contents

Table of Contents

[Praise for the First Edition](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-1.md)

[Foreword to the First Edition](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-2.md)

[Preface](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-3.md)

[Acknowledgments](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-4.md)

[About this Book](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-5.md)

[About the Cover Illustration](https://github.com/adolfodelarosades/Java/blob/master/temarios/958_Java_Persistence_with_Hibernate/0000-6.md)

### 1. Getting started with ORM

* Chapter 1. Understanding object/relational persistence

* Chapter 2. Starting a project

* Chapter 3. Domain models and metadata

### 2. Mapping strategies

* Chapter 4. Mapping persistent classes

* Chapter 5. Mapping value types

* Chapter 6. Mapping inheritance

* Chapter 7. Mapping collections and entity associations

* Chapter 8. Advanced entity association mappings

* Chapter 9. Complex and legacy schemas

### 3. Transactional data processing

* Chapter 10. Managing data

* Chapter 11. Transactions and concurrency

* Chapter 12. Fetch plans, strategies, and profiles

* Chapter 13. Filtering data

### 4. Writing queries

* Chapter 14. Creating and executing queries

* Chapter 15. The query languages

* Chapter 16. Advanced query options

* Chapter 17. Customizing SQL

### 5. Building applications

* Chapter 18. Designing client/server applications

* Chapter 19. Building web applications

* Chapter 20. Scaling Hibernate

References

Index

List of Figures

List of Tables

List of Listings

## Tabla de Contenido

Copyright

Brief Table of Contents

Table of Contents

Praise for the First Edition

Foreword to the First Edition

Preface

Acknowledgments

About this Book

About the Cover Illustration

### 1. Getting started with ORM

#### Chapter 1. Understanding object/relational persistence

* 1.1. What is persistence?

   * 1.1.1. Relational databases

   * 1.1.2. Understanding SQL

   * 1.1.3. Using SQL in Java

* 1.2. The paradigm mismatch

   * 1.2.1. The problem of granularity

   * 1.2.2. The problem of subtypes

   * 1.2.3. The problem of identity

   * 1.2.4. Problems relating to associations

   * 1.2.5. The problem of data navigation

* 1.3. ORM and JPA

* 1.4. Summary

#### Chapter 2. Starting a project

* 2.1. Introducing Hibernate

* 2.2. “Hello World” with JPA

   * 2.2.1. Configuring a persistence unit

   * 2.2.2. Writing a persistent class

   * 2.2.3. Storing and loading messages

* 2.3. Native Hibernate configuration

* 2.4. Summary

#### Chapter 3. Domain models and metadata

* 3.1. The example CaveatEmptor application

   * 3.1.1. A layered architecture

   * 3.1.2. Analyzing the business domain

   * 3.1.3. The CaveatEmptor domain model

* 3.2. Implementing the domain model

   * 3.2.1. Addressing leakage of concerns

   * 3.2.2. Transparent and automated persistence

   * 3.2.3. Writing persistence-capable classes

   * 3.2.4. Implementing POJO associations

* 3.3. Domain model metadata

   * 3.3.1. Annotation-based metadata

   * 3.3.2. Applying Bean Validation rules

   * 3.3.3. Externalizing metadata with XML files

   * 3.3.4. Accessing metadata at runtime

* 3.4. Summary

### 2. Mapping strategies

#### Chapter 4. Mapping persistent classes

* 4.1. Understanding entities and value types

   * 4.1.1. Fine-grained domain models

   * 4.1.2. Defining application concepts

   * 4.1.3. Distinguishing entities and value types

* 4.2. Mapping entities with identity

   * 4.2.1. Understanding Java identity and equality

   * 4.2.2. A first entity class and mapping

   * 4.2.3. Selecting a primary key

   * 4.2.4. Configuring key generators

   * 4.2.5. Identifier generator strategies

* 4.3. Entity-mapping options

   * 4.3.1. Controlling names

   * 4.3.2. Dynamic SQL generation

   * 4.3.3. Making an entity immutable

   * 4.3.4. Mapping an entity to a subselect

* 4.4. Summary

#### Chapter 5. Mapping value types

* 5.1. Mapping basic properties

   * 5.1.1. Overriding basic property defaults

   * 5.1.2. Customizing property access

   * 5.1.3. Using derived properties

   * 5.1.4. Transforming column values

   * 5.1.5. Generated and default property values

   * 5.1.6. Temporal properties

   * 5.1.7. Mapping enumerations

* 5.2. Mapping embeddable components

   * 5.2.1. The database schema

   * 5.2.2. Making classes embeddable

   * 5.2.3. Overriding embedded attributes

   * 5.2.4. Mapping nested embedded components

* 5.3. Mapping Java and SQL types with converters

   * 5.3.1. Built-in types

   * 5.3.2. Creating custom JPA converters

   * 5.3.3. Extending Hibernate with UserTypes

* 5.4. Summary

#### Chapter 6. Mapping inheritance

* 6.1. Table per concrete class with implicit polymorphism

* 6.2. Table per concrete class with unions

* 6.3. Table per class hierarchy

* 6.4. Table per subclass with joins

* 6.5. Mixing inheritance strategies

* 6.6. Inheritance of embeddable classes

* 6.7. Choosing a strategy

* 6.8. Polymorphic associations

   * 6.8.1. Polymorphic many-to-one associations

   * 6.8.2. Polymorphic collections

* 6.9. Summary

#### Chapter 7. Mapping collections and entity associations

* 7.1. Sets, bags, lists, and maps of value types

   * 7.1.1. The database schema

   * 7.1.2. Creating and mapping a collection property

   * 7.1.3. Selecting a collection interface

   * 7.1.4. Mapping a set

   * 7.1.5. Mapping an identifier bag

   * 7.1.6. Mapping a list

   * 7.1.7. Mapping a map

   * 7.1.8. Sorted and ordered collections

* 7.2. Collections of components

   * 7.2.1. Equality of component instances

   * 7.2.2. Set of components

   * 7.2.3. Bag of components

   * 7.2.4. Map of component values

   * 7.2.5. Components as map keys

   * 7.2.6. Collection in an embeddable component

* 7.3. Mapping entity associations

   * 7.3.1. The simplest possible association

   * 7.3.2. Making it bidirectional

   * 7.3.3. Cascading state

* 7.4. Summary

#### Chapter 8. Advanced entity association mappings

* 8.1. One-to-one associations

   * 8.1.1. Sharing a primary key

   * 8.1.2. The foreign primary key generator

   * 8.1.3. Using a foreign key join column

   * 8.1.4. Using a join table

* 8.2. One-to-many associations

   * 8.2.1. Considering one-to-many bags

   * 8.2.2. Unidirectional and bidirectional list mappings

   * 8.2.3. Optional one-to-many with a join table

   * 8.2.4. One-to-many association in an embeddable class

* 8.3. Many-to-many and ternary associations

   * 8.3.1. Unidirectional and bidirectional many-to-many associations

   * 8.3.2. Many-to-many with an intermediate entity

   * 8.3.3. Ternary associations with components

* 8.4. Entity associations with Maps

   * 8.4.1. One-to-many with a property key

   * 8.4.2. Key/Value ternary relationship

* 8.5. Summary

#### Chapter 9. Complex and legacy schemas

* 9.1. Improving the database schema

   * 9.1.1. Adding auxiliary database objects

   * 9.1.2. SQL constraints

   * 9.1.3. Creating indexes

* 9.2. Handling legacy keys

   * 9.2.1. Mapping a natural primary key

   * 9.2.2. Mapping a composite primary key

   * 9.2.3. Foreign keys in composite primary keys

   * 9.2.4. Foreign keys to composite primary keys

   * 9.2.5. Foreign key referencing non-primary keys

* 9.3. Mapping properties to secondary tables

* 9.4. Summary

### 3. Transactional data processing

#### Chapter 10. Managing data

* 10.1. The persistence life cycle

   * 10.1.1. Entity instance states

   * 10.1.2. The persistence context

   * 10.2. The EntityManager interface

   * 10.2.1. The canonical unit of work

   * 10.2.2. Making data persistent

   * 10.2.3. Retrieving and modifying persistent data

   * 10.2.4. Getting a reference

   * 10.2.5. Making data transient

   * 10.2.6. Refreshing data

   * 10.2.7. Replicating data

   * 10.2.8. Caching in the persistence context

   * 10.2.9. Flushing the persistence context

* 10.3. Working with detached state

   * 10.3.1. The identity of detached instances

   * 10.3.2. Implementing equality methods

   * 10.3.3. Detaching entity instances

   * 10.3.4. Merging entity instances

* 10.4. Summary

#### Chapter 11. Transactions and concurrency

* 11.1. Transaction essentials

   * 11.1.1. ACID attributes

   * 11.1.2. Database and system transactions

   * 11.1.3. Programmatic transactions with JTA

   * 11.1.4. Handling exceptions

   * 11.1.5. Declarative transaction demarcation

* 11.2. Controlling concurrent access

   * 11.2.1. Understanding database-level concurrency

   * 11.2.2. Optimistic concurrency control

   * 11.2.3. Explicit pessimistic locking

   * 11.2.4. Avoiding deadlocks

* 11.3. Nontransactional data access

   * 11.3.1. Reading data in auto-commit mode

   * 11.3.2. Queueing modifications

* 11.4. Summary

#### Chapter 12. Fetch plans, strategies, and profiles

* 12.1. Lazy and eager loading

   * 12.1.1. Understanding entity proxies

   * 12.1.2. Lazy persistent collections

   * 12.1.3. Lazy loading with interception

   * 12.1.4. Eager loading of associations and collections

* 12.2. Selecting a fetch strategy

   * 12.2.1. The n+1 selects problem

   * 12.2.2. The Cartesian product problem

   * 12.2.3. Prefetching data in batches

   * 12.2.4. Prefetching collections with subselects

   * 12.2.5. Eager fetching with multiple SELECTs

   * 12.2.6. Dynamic eager fetching

* 12.3. Using fetch profiles

   * 12.3.1. Declaring Hibernate fetch profiles

   * 12.3.2. Working with entity graphs

* 12.4. Summary

#### Chapter 13. Filtering data

* 13.1. Cascading state transitions

   * 13.1.1. Available cascading options

   * 13.1.2. Transitive detachment and merging

   * 13.1.3. Cascading refresh

   * 13.1.4. Cascading replication

   * 13.1.5. Enabling global transitive persistence

* 13.2. Listening to and intercepting events

   * 13.2.1. JPA event listeners and callbacks

   * 13.2.2. Implementing Hibernate interceptors

   * 13.2.3. The core event system

* 13.3. Auditing and versioning with Hibernate Envers

   * 13.3.1. Enabling audit logging

   * 13.3.2. Creating an audit trail

   * 13.3.3. Finding revisions

   * 13.3.4. Accessing historical data

* 13.4. Dynamic data filters

   * 13.4.1. Defining dynamic filters

   * 13.4.2. Applying the filter

   * 13.4.3. Enabling the filter

   * 13.4.4. Filtering collection access

* 13.5. Summary

### 4. Writing queries

#### Chapter 14. Creating and executing queries

* 14.1. Creating queries

   * 14.1.1. The JPA query interfaces

   * 14.1.2. Typed query results

   * 14.1.3. Hibernate’s query interfaces

* 14.2. Preparing queries

   * 14.2.1. Protecting against SQL injection attacks

   * 14.2.2. Binding named parameters

   * 14.2.3. Using positional parameters

   * 14.2.4. Paging through large result sets

* 14.3. Executing queries

   * 14.3.1. Listing all results

   * 14.3.2. Getting a single result

   * 14.3.3. Scrolling with database cursors

   * 14.3.4. Iterating through a result

* 14.4. Naming and externalizing queries

   * 14.4.1. Calling a named query

   * 14.4.2. Defining queries in XML metadata

   * 14.4.3. Defining queries with annotations

   * 14.4.4. Defining named queries programmatically

* 14.5. Query hints

   * 14.5.1. Setting a timeout

   * 14.5.2. Setting the flush mode

   * 14.5.3. Setting read-only mode

   * 14.5.4. Setting a fetch size

   * 14.5.5. Setting an SQL comment

   * 14.5.6. Named query hints

* 14.6. Summary

#### Chapter 15. The query languages

* 15.1. Selection

   * 15.1.1. Assigning aliases and query roots

   * 15.1.2. Polymorphic queries

* 15.2. Restriction

   * 15.2.1. Comparison expressions

   * 15.2.2. Expressions with collections

   * 15.2.3. Calling functions

   * 15.2.4. Ordering query results

* 15.3. Projection

   * 15.3.1. Projection of entities and scalar values

   * 15.3.2. Using dynamic instantiation

   * 15.3.3. Getting distinct results

   * 15.3.4. Calling functions in projections

   * 15.3.5. Aggregation functions

   * 15.3.6. Grouping

* 15.4. Joins

   * 15.4.1. Joins with SQL

   * 15.4.2. Join options in JPA

   * 15.4.3. Implicit association joins

   * 15.4.4. Explicit joins

   * 15.4.5. Dynamic fetching with joins

1   * 5.4.6. Theta-style joins

   * 15.4.7. Comparing identifiers

* 15.5. Subselects

   * 15.5.1. Correlated and uncorrelated nesting

   * 15.5.2. Quantification

* 15.6. Summary

#### Chapter 16. Advanced query options

* 16.1. Transforming query results

   * 16.1.1. Returning a list of lists

   * 16.1.2. Returning a list of maps

   * 16.1.3. Mapping aliases to bean properties

   * 16.1.4. Writing a ResultTransformer

* 16.2. Filtering collections

* 16.3. The Hibernate criteria query API

   * 16.3.1. Selection and ordering

   * 16.3.2. Restriction

   * 16.3.3. Projection and aggregation

   * 16.3.4. Joins

   * 16.3.5. Subselects

   * 16.3.6. Example queries

* 16.4. Summary

#### Chapter 17. Customizing SQL

* 17.1. Falling back to JDBC

* 17.2. Mapping SQL query results

   * 17.2.1. Projection with SQL queries

   * 17.2.2. Mapping to an entity class

   * 17.2.3. Customizing result mappings

   * 17.2.4. Externalizing native queries

   * 17.3. Customizing CRUD operations

   * 17.3.1. Enabling custom loaders

   * 17.3.2. Customizing creation, updates, and deletion

   * 17.3.3. Customizing collection operations

   * 17.3.4. Eager fetching in custom loaders

* 17.4. Calling stored procedures

   * 17.4.1. Returning a result set

   * 17.4.2. Returning multiple results and update counts

   * 17.4.3. Setting input and output parameters

   * 17.4.4. Returning a cursor

   * 17.5. Using stored procedures for CRUD

   * 17.5.1. Custom loader with a procedure

   * 17.5.2. Procedures for CUD

* 17.6. Summary

### 5. Building applications

#### Chapter 18. Designing client/server applications

* 18.1. Creating a persistence layer

   * 18.1.1. A generic data access object pattern

   * 18.1.2. Implementing the generic interface

   * 18.1.3. Implementing entity DAOs

   * 18.1.4. Testing the persistence layer

* 18.2. Building a stateless server

   * 18.2.1. Editing an auction item

   * 18.2.2. Placing a bid

   * 18.2.3. Analyzing the stateless application

* 18.3. Building a stateful server

   * 18.3.1. Editing an auction item

   * 18.3.2. Analyzing the stateful application

* 18.4. Summary

#### Chapter 19. Building web applications

* 19.1. Integrating JPA with CDI

   * 19.1.1. Producing an EntityManager

   * 19.1.2. Joining the EntityManager with transactions

   * 19.1.3. Injecting an EntityManager

* 19.2. Paging and sorting data

   * 19.2.1. Offset paging vs. seeking

   * 19.2.2. Paging in the persistence layer

   * 19.2.3. Querying page-by-page

* 19.3. Building JSF applications

   * 19.3.1. Request-scoped services

   * 19.3.2. Conversation-scoped services

* 19.4. Serializing domain model data

   * 19.4.1. Writing a JAX-RS service

   * 19.4.2. Applying JAXB mappings

   * 19.4.3. Serializing Hibernate proxies

* 19.5. Summary

### Chapter 20. Scaling Hibernate

* 20.1. Bulk and batch processing

   * 20.1.1. Bulk statements in JPQL and criteria

   * 20.1.2. Bulk statements in SQL

   * 20.1.3. Processing in batches

   * 20.1.4. The Hibernate StatelessSession interface

* 20.2. Caching data

   * 20.2.1. The Hibernate shared cache architecture

   * 20.2.2. Configuring the shared cache

   * 20.2.3. Enabling entity and collection caching

   * 20.2.4. Testing the shared cache

   * 20.2.5. Setting cache modes

   * 20.2.6. Controlling the shared cache

   * 20.2.7. The query result cache

* 20.3. Summary

References

Index

List of Figures

List of Tables

List of Listings


