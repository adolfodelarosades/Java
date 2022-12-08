# Beginning Hibernate: For Hibernate 5

<img width="294" alt="image" src="https://user-images.githubusercontent.com/23094588/206295851-e2be1643-cd0c-452b-bced-b4297db090b2.png">

* 4th ed.
* TIME TO COMPLETE: 7h 12m
* TOPICS: Hibernate
* PUBLISHED BY: Apress 
* PUBLICATION DATE: November 2016
* PRINT LENGTH:250 pages

Comience con la capa de persistencia de Hibernate 5 y obtenga una introducción clara al estándar actual para la persistencia relacional de objetos en Java. Esta edición actualizada incluye el nuevo marco Hibernate 5.0, así como la cobertura de NoSQL, MongoDB y otras tecnologías relacionadas, que van desde aplicaciones hasta big data. Comenzar Hibernate es ideal si tiene experiencia en Java con bases de datos (el enfoque tradicional o conectado), pero es nuevo en Hibernate ligero y de código abierto.

El libro mantiene su enfoque en Hibernate sin perder tiempo en herramientas de terceros no esenciales, por lo que podrá comenzar de inmediato a crear motores y aplicaciones basados en transacciones. Los autores experimentados Joseph Ottinger con Dave Minter y Jeff Linwood brindan ejemplos más detallados que cualquier otro libro para principiantes de Hibernate. Presentan su material de una manera animada, basada en ejemplos, no de una manera árida, teórica y difícil de leer.

### Lo que aprenderás

* Cree aplicaciones empresariales de tipo transacción basadas en Java que accedan a datos complejos con Hibernate
* Trabaje con Hibernate 5 utilizando un proceso de compilación actual
* Use las características de Java 8 con Hibernate
* Integrarse en el ciclo de vida de la persistencia
* Mapeando usando las anotaciones de Java
* Busca y consulta con la nueva versión de Hibernate
* Integrar con MongoDB usando NoSQL
* Realice un seguimiento de los datos versionados con Hibernate Envers

### Para quien es este libro

Desarrolladores de Java experimentados interesados en aprender a usar y aplicar la persistencia relacional de objetos en Java y que son nuevos en el marco de persistencia de Hibernate.

## Contents
### [Introduction](https://github.com/adolfodelarosades/Java/blob/master/temarios/959_Beginning_Hibernate_For_Hibernate_5/00_Introduction.md)
### [Chapter 1: An Introduction to Hibernate 5](https://github.com/adolfodelarosades/Java/blob/master/temarios/959_Beginning_Hibernate_For_Hibernate_5/01_An_Introduction_to_Hibernate_5.md)
* Plain Old Java Objects (POJOs)
* Origins of Hibernate and Object/Relational Mapping
* Hibernate as a Persistence Solution
* A Hibernate Hello World Example
* Mappings
* Persisting an Object
* Summary

### [Chapter 2: Integrating and Configuring Hibernate](https://github.com/adolfodelarosades/Java/blob/master/temarios/959_Beginning_Hibernate_For_Hibernate_5/02_Integrating_and_Configuring_Hibernate.md)
* The Steps Needed to Integrate and Configure Hibernate
* Understanding Where Hibernate Fits into Your Java Application
* Deploying Hibernate
* Installing Maven
* Connection Pooling
* Summary

### Chapter 3: Building a Simple Application
* A Simple Application
* A First Attempt
* Writing Data
* Reading Data
* Updating Data
* Persistence Contexts
* Removing Data
* A Note on Transactions
* Writing Our Sample Application
* Summary

### Chapter 4: The Persistence Life Cycle
* Introducing the Life Cycle
* Entities, Classes, and Names
* Identifiers
* Entities and Associations
* Saving Entities
* Object Equality and Identity
* Loading Entities
* Merging Entities
* Refreshing Entities
* Updating Entities
* Deleting Entities
* Cascading Operations
* Lazy Loading, Proxies, and Collection Wrappers
* Querying Objects
* Summary

### Chapter 5: An Overview of Mapping
* Why Mapping Cannot Easily Be Automated
* Primary Keys
* Lazy Loading
* Associations
* The One-to-One Association
* The One-to-Many and Many-to-One Association
* The Many-to-Many Association
* Applying Mappings to Associations
* Other Supported Features
* Specification of (Database) Column Types and Sizes
* The Mapping of Inheritance Relationships to the Database
* Primary Key
* The Use of SQL Formula–Based Properties
* Mandatory and Unique Constraints
* Summary

### Chapter 6: Mapping with Annotations
* Creating Hibernate Mappings with Annotations
* The Cons of Annotations
* The Pros of Annotations
* Choosing Which to Use
* JPA 2 Persistence Annotations
* Entity Beans with @Entity
* Primary Keys with @Id and @GeneratedValue
* Compound Primary Keys with @Id, @IdClass, or @EmbeddedId
* Database Table Mapping with @Table and @SecondaryTable
* Persisting Basic Types with @Basic
* Omitting Persistence with @Transient
* Mapping Properties and Fields with @Column
* Modeling Entity Relationships
* Inheritance
* Other JPA 2 Persistence Annotations
* Ordering Collections with @OrderColumn
* Configuring the Annotated Classes
* Hibernate-Specific Persistence Annotations
* @Immutable
* Natural IDs
* Summary

### Chapter 7: JPA Integration and Lifecycle Events
* The Java Persistence Architecture
* The Project Object Model
* The JPASessionUtil Class
* Testing JPASessionUtil
* Lifecycle Events
* External Entity Listeners
* Data Validation
* Summary

### Chapter 8: Using the Session
* Sessions
* Transactions and Locking
* Transactions
* Locking
* Deadlocks
* Caching
* Threads
* Summary

### Chapter 9: Searches and Queries
* Hibernate Query Language (HQL)
* Syntax Basics
* UPDATE
* DELETE
* INSERT
* SELECT
* Named Queries
* Logging and Commenting the Underlying SQL
* Logging the SQL
* Commenting the Generated SQL
* The from Clause and Aliases
* The select Clause and Projection
* Using Restrictions with HQL
* Using Named Parameters
* Paging Through the Result Set
* Obtaining a Unique Result
* Sorting Results with the order by Clause
* Associations
* Aggregate Methods
* Bulk Updates and Deletes with HQL
* Using Native SQL
* Summary

### Chapter 10: Advanced Queries Using Criteria
* Using the Criteria API
* Using Restrictions with Criteria
* Paging Through the Result Set
* Obtaining a Unique Result
* Sorting the Query’s Results
* Associations
* Projections and Aggregates
* Should You Use the Criteria API?​
* Summary

### Chapter 11: Filtering the Results of Searches
* When to Use Filters
* Defining and Attaching Filters
* Filters with Annotations
* Filters with XML Mapping Documents
* Using Filters in Your Application
* A Basic Filtering Example
* Summary

### Chapter 12: Leaving the Relational Database Behind: NoSQL
* Where Is Hibernate When It Comes to NoSQL?
* First Warning: NoSQL Is Not Relational, and Hibernate Is an ORM
* Hibernate Is not Perfect, or “Finished”
* Basic CRUD Operations
* The Tests
* Testing Create and Read
* Testing Updates
* Testing Removal
* Querying in OGM
* MongoDB
* What the Hibernate Native API for OGM Looks Like
* Summary

### Chapter 13: Hibernate Envers
* Making Envers Available to Your Project
* Storing a User Object
* Updating the User
* Accessing Envers Information
* Querying Audited Data
* Applying Audit Data
* Summary
