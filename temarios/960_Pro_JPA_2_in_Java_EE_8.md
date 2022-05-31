# 960 Pro JPA 2 in Java EE 8: An In-Depth Guide to Java Persistence APIs

by Mike Keith, Merrick Schincariol, Massimo Nardone

Pages 759

Publisher: Apress

Release Date: February 2018

ISBN: 9781484234204

Topic: Java EE

![960-portada](https://github.com/adolfodelarosades/Java/blob/master/temarios/960_Pro_JPA_2_in_Java_EE_8/images/960-portada.png)

### Descripción del libro

Aprenda a utilizar la API de persistencia de Java (JPA) y otras API relacionadas que se encuentran en la plataforma Java EE 8 desde la perspectiva de uno de los creadores de la especificación. Este libro en profundidad, un recurso único en su tipo, proporciona una cobertura teórica y práctica del uso de JPA para desarrolladores experimentados de Java.

Los autores Mike Keith, Merrick Schincariol y Massimo Nardone adoptan un enfoque práctico, basado en su gran experiencia y conocimientos, dando ejemplos para ilustrar cada concepto de API y mostrando cómo se usa en la práctica. Los ejemplos usan un modelo común de una aplicación de muestra general, lo que le brinda un contexto desde el cual comenzar y lo ayuda a comprender los ejemplos dentro de un dominio ya familiar.

Después de completar Pro JPA 2 en Java EE 8, tendrá un conocimiento completo de JPA y podrá codificar aplicaciones con éxito utilizando sus anotaciones y API. El libro también sirve como una excelente guía de referencia.

#### Lo que vas a aprender

* Utilice JPA en el contexto de aplicaciones empresariales
* Trabaje con mapeos relacionales de objetos (ORM), mapeos de colección y más
* Cree aplicaciones Java empresariales complejas que conservan los datos mucho después de que finaliza el proceso
* Conéctese y conserve datos con una variedad de bases de datos, formatos de archivo y más
* Utilice consultas, incluido el lenguaje de consulta de persistencia de Java (JPQL)
* Realice ORM, consultas y mapeos XML avanzados
* Empaquete, implemente y pruebe sus aplicaciones empresariales habilitadas para la persistencia de Java


#### Para quien es este libro

Programadores y desarrolladores de Java experimentados con al menos algo de experiencia previa con las API de la plataforma J2EE o Java EE.

### Table of Contents

Cover

Front Matter

1. [Introduction](960_Pro_JPA_2_in_Java_EE_8/01_Introduction.md) 👍

2. [Getting Started](960_Pro_JPA_2_in_Java_EE_8/02_Getting_Started.md)

3. [Enterprise Applications](960_Pro_JPA_2_in_Java_EE_8/03_Enterprise_Applications.md)

4. [Object-Relational Mapping](960_Pro_JPA_2_in_Java_EE_8/04_Object-Relational_Mapping.md)

5. [Collection Mapping](960_Pro_JPA_2_in_Java_EE_8/05_Collection_Mapping.md)

6. [Entity Manager](960_Pro_JPA_2_in_Java_EE_8/06_Entity_Manager.md)

7. [Using Queries](960_Pro_JPA_2_in_Java_EE_8/07_Using_Queries.md)

8. [Query Language](960_Pro_JPA_2_in_Java_EE_8/08_Query_Language.md)

9. [Criteria API](960_Pro_JPA_2_in_Java_EE_8/09_Criteria_API.md)

10. [Advanced Object-Relational Mapping](960_Pro_JPA_2_in_Java_EE_8/10_Advanced_Object-Relational_Mapping.md)

11. [Advanced Queries](960_Pro_JPA_2_in_Java_EE_8/11_Advanced_Queries.md)

12. [Other Advanced Topics](960_Pro_JPA_2_in_Java_EE_8/12_Other_Advanced_Topics.md)

13. [XML Mapping Files](960_Pro_JPA_2_in_Java_EE_8/13_XML_Mapping_Files.md)

14. [Packaging and Deployment](960_Pro_JPA_2_in_Java_EE_8/14_Packaging_and_Deployment.md)

15. [Testing](960_Pro_JPA_2_in_Java_EE_8/15_Testing.md)

Back Matter

## TABLE OF CONTENTS

### Chapter 1 : Introduction

* Relational Databases
* Object-Relational Mapping
   * The Impedance Mismatch
* Java Support for Persistence
   * Proprietary Solutions
   * JDBC
   * Enterprise JavaBeans
   * Java Data Objects
* Why Another Standard?
* The Java Persistence API
   * History of the Specification
   * Overview
* Summary

### Chapter 2: Getting Started
* Entity Overview
   * Persistability
   * Identity
   * Transactionality
   * Granularity
* Entity Metadata
   * Annotations
   * XML
   * Configuration by Exception
* Creating an Entity
* Entity Manager
   * Obtaining an Entity Manager
   * Persisting an Entity
   * Finding an Entity
   * Removing an Entity
   * Updating an Entity
   * Transactions
   * Queries
* Putting It All Together
* Packaging It Up
   * Persistence Unit
   * Persistence Archive
* Summary

### Chapter 3: Enterprise Applications
* Application Component Models
* Session Beans
   * Stateless Session Beans
   * Stateful Session Beans
   * Singleton Session Beans
* Servlets
* Dependency Management and CDI
   * Dependency Lookup
   * Dependency Injection
   * Declaring Dependencies
* CDI and Contextual Injection
   * CDI Beans
   * Injection and Resolution
   * Scopes and Contexts
   * Qualified Injection
   * Producer Methods and Fields
   * Using Producer Methods with JPA Resources
* Transaction Management
   * Transaction Review
   * Enterprise Transactions in Java
* Putting It All Together
   * Defining the Component
   * Defining the User Interface
   * Packaging It Up
* Summary

### Chapter 4: Object-Relational Mapping
* Persistence Annotations
* Accessing Entity State
   * Field Access
   * Property Access
   * Mixed Access
* Mapping to a Table
* Mapping Simple Types
   * Column Mappings
   * Lazy Fetching
   * Large Objects
   * Enumerated Types
   * Temporal Types
   * Transient State
* Mapping the Primary Key
   * Overriding the Primary Key Column
   * Primary Key Types
   * Identifier Generation
* Relationships
   * Relationship Concepts
   * Mappings Overview
   * Single-Valued Associations
   * Collection-Valued Associations
   * Lazy Relationships
* Embedded Objects
* Summary

### Chapter 5: Collection Mapping
* Relationships and Element Collections
* Using Different Collection Types
   * Sets or Collections
   * Lists
   * Maps
   * Duplicates
   * Null Values
* Best Practices
* Summary

### Chapter 6: Entity Manager
* Persistence Contexts
* Entity Managers
   * Container-Managed Entity Managers
   * Application-Managed Entity Managers
* Transaction Management
   * JTA Transaction Management
   * Resource-Local Transactions
   * Transaction Rollback and Entity State
* Choosing an Entity Manager
* Entity Manager Operations
   * Persisting an Entity
   * Finding an Entity
   * Removing an Entity
   * Cascading Operations
   * Clearing the Persistence Context
* Synchronization with the Database
* Detachment and Merging
   * Detachment
   * Merging Detached Entities
   * Working with Detached Entities
* Summary

### Chapter 7: Using Queries
* Java Persistence Query Language
   * Getting Started
   * Filtering Results
   * Projecting Results
   * Joins Between Entities
   * Aggregate Queries
   * Query Parameters
* Defining Queries
   * Dynamic Query Definition
   * Named Query Definition
   * Dynamic Named Queries
* Parameter Types
* Executing Queries
   * Working with Query Results
   * Stream Query Results
   * Query Paging
   * Queries and Uncommitted Changes
   * Query Timeouts
* Bulk Update and Delete
   * Using Bulk Update and Delete
   * Bulk Delete and Relationships
* Query Hints
* Query Best Practices
   * Named Queries
   * Report Queries
   * Vendor Hints
   * Stateless Beans
   * Bulk Update and Delete
   * Provider Differences
* Summary

### Chapter 8: Query Language
* Introducing JP QL
   * Terminology
   * Example Data Model
   * Example Application
* Select Queries
   * SELECT Clause
   * FROM Clause
   * WHERE Clause
   * Inheritance and Polymorphism
   * Scalar Expressions
   * ORDER BY Clause
* Aggregate Queries
   * Aggregate Functions
   * GROUP BY Clause
   * HAVING Clause
* Update Queries
* Delete Queries
* Summary

### Chapter 9: Criteria API
* Overview
   * The Criteria API
   * Parameterized Types
   * Dynamic Queries
* Building Criteria API Queries
   * Creating a Query Definition
   * Basic Structure
   * Criteria Objects and Mutability
   * Query Roots and Path Expressions
   * The SELECT Clause
   * The FROM Clause
   * The WHERE Clause
   * Building Expressions
   * The ORDER BY Clause
   * The GROUP BY and HAVING Clauses
* Bulk Update and Delete
* Strongly Typed Query Definitions
   * The Metamodel API
   * Strongly Typed API Overview
   * The Canonical Metamodel
   * Choosing the Right Type of Query
Summary

### Chapter 10: Advanced Object-Relational Mapping
* Table and Column Names
* Converting Entity State
   * Creating a Converter
   * Declarative Attribute Conversion
   * Automatic Conversion
   * Converters and Queries
* Complex Embedded Objects
   * Advanced Embedded Mappings
   * Overriding Embedded Relationships
* Compound Primary Keys
   * ID Class
   * Embedded ID Class
* Derived Identifiers
   * Basic Rules for Derived Identifiers
   * Shared Primary Key
   * Multiple Mapped Attributes
   * Using EmbeddedId
* Advanced Mapping Elements
   * Read-Only Mappings
   * Optionality
* Advanced Relationships
   * Using Join Tables
   * Avoiding Join Tables
   * Compound Join Columns
   * Orphan Removal
   * Mapping Relationship State
* Multiple Tables
* Inheritance
   * Class Hierarchies
   * Inheritance Models
   * Mixed Inheritance
* Summary

### Chapter 11: Advanced Queries
* SQL Queries
   * Native Queries vs. JDBC
   * Defining and Executing SQL Queries
   * SQL Result Set Mapping
   * Parameter Binding
   * Stored Procedures
* Entity Graphs
   * Entity Graph Annotations
   * Entity Graph API
   * Managing Entity Graphs
   * Using Entity Graphs
* Summary

### Chapter 12: Other Advanced Topics
* Lifecycle Callbacks
   * Lifecycle Events
   * Callback Methods
   * Entity Listeners
   * Inheritance and Lifecycle Events
* Validation
   * Using Constraints
   * Invoking Validation
   * Validation Groups
   * Creating New Constraints
   * Validation in JPA
   * Enabling Validation
   * Setting Lifecycle Validation Groups
* Concurrency
   * Entity Operations
   * Entity Access
* Refreshing Entity State
* Locking
   * Optimistic Locking
   * Pessimistic Locking
* Caching
   * Sorting Through the Layers
   * Shared Cache
* Utility Classes
   * PersistenceUtil
   * PersistenceUnitUtil
* Summary

### Chapter 13: XML Mapping Files
* The Metadata Puzzle
* The Mapping File
   * Disabling Annotations
   * Persistence Unit Defaults
   * Mapping File Defaults
   * Queries and Generators
   * Managed Classes and Mappings
   * Converters
* Summary

### Chapter 14: Packaging and Deployment
* Configuring Persistence Units
   * Persistence Unit Name
   * Transaction Type
   * Persistence Provider
   * Data Source
   * Mapping Files
   * Managed Classes
   * Shared Cache Mode
   * Validation Mode
   * Adding Properties
* Building and Deploying
   * Deployment Classpath
   * Packaging Options
   * Persistence Unit Scope
* Outside the Server
   * Configuring the Persistence Unit
   * Specifying Properties at Runtime
   * System Classpath
* Schema Generation
   * The Generation Process
   * Deployment Properties
   * Runtime Properties
   * Mapping Annotations Used by Schema Generation
   * Unique Constraints
   * Null Constraints
   * Indexes
   * Foreign Key Constraints
   * String-Based Columns
   * Floating Point Columns
   * Defining the Column
* Summary

### Chapter 15: Testing
* Testing Enterprise Applications
   * Terminology
   * Testing Outside the Server
   * JUnit
* Unit Testing
   * Testing Entities
   * Testing Entities in Components
   * The Entity Manager in Unit Tests
* Integration Testing
   * Using the Entity Manager
   * Components and Persistence
   * Test Frameworks
* Best Practices
* Summary

#### Index
