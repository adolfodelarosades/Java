Jeff Friesen

### Java XML and JSON
#### Document Processing for Java SE

2nd ed.

# Introducción

XML y (el más popular) JSON le permiten organizar datos en formatos textuales. Este libro le presenta estas tecnologías junto con las API de Java para integrarlas en su código Java. Este libro le presenta XML y JSON a partir de Java 11.

**El capítulo 1** presenta XML, donde aprenderá acerca de las características básicas del lenguaje (como la declaración XML, los elementos y atributos, y los namespaces (espacios de nombres)). También aprenderá sobre documentos XML bien formados y cómo validarlos a través de los lenguajes gramaticales ***Document Type Definition and XML Schema***.

**El capítulo 2** se centra en la ***API SAX de Java para analizar(parsing) documentos XML***. Aprenderá a obtener un analizador(parser) SAX 2; Luego recorrerá los métodos `XMLReader` junto con las interfaces de manejador y resolución de entidades. Finalmente, explora una demostración de esta API y aprende cómo crear un solucionador de entidades personalizado.

**El capítulo 3** trata sobre la ***API DOM de Java para analizar y crear documentos XML***. Después de descubrir los distintos nodos que forman un árbol de documentos DOM, explora la API DOM, donde aprende cómo obtener un DOM parser/document builder y cómo analizar(parser) y crear documentos XML. Luego, explora las API DOM de Java relacionadas con las especificaciones Load, Save, Traversal y Range.

**El capítulo 4** destaca la ***API StAX de Java para analizar(parsing) y crear documentos XML***. Aprenderá a utilizar StAX para analizar documentos XML con lectores basados en secuencias y basados en eventos y a crear documentos XML con escritores basados en secuencias y basados en eventos.

**El capítulo 5** presenta la ***API XPath de Java para simplificar el acceso a los nodos de un árbol DOM***. Recibe una introducción al lenguaje XPath, aprendiendo sobre expresiones de ruta de ubicación y expresiones generales. También explora características avanzadas comenzando con contextos de espacio de nombres (namespace).

**El capítulo 6** completa mi cobertura de XML apuntando a la ***API XSLT de Java. Aprenderá sobre transformadores y fábricas de transformadores, y mucho más***. También va más allá de las ***API XSLT 1.0 y XPath 1.0 compatibles con Java***.

**El capítulo 7** cambia de tema a JSON. Recibe una introducción a JSON, realiza un recorrido por su sintaxis, explora una demostración de JSON en un contexto de JavaScript (porque Java aún no es compatible oficialmente con JSON) y aprende a validar objetos JSON en el contexto de JSON Schema.

Deberá trabajar con bibliotecas de terceros para analizar y crear documentos JSON. **El capítulo 8** le presenta **la library mJson**. Después de aprender a obtener y usar mJson, explora la clase Json, que es el punto de entrada para trabajar con mJSon.

***Google ha lanzado una biblioteca aún más poderosa para analizar y crear documentos JSON***. **La library Gson** es el tema central del **Capítulo 9**. En este capítulo, aprenderá a analizar objetos JSON mediante la deserialización, cómo crear objetos JSON mediante la serialización y mucho más.

**El capítulo 10** se centra en ***la API de JsonPath*** para realizar operaciones similares a XPath en documentos JSON.

**El capítulo 11** le presenta ***Jackson, un popular conjunto de API para analizar y crear documentos JSON***.

**El capítulo 12** le presenta ***JSON-P, una API de Oracle que se planeó para su inclusión en Java SE, pero que en su lugar se puso a disposición de Java EE***.

Cada capítulo termina con una variedad de ejercicios diseñados para ayudarlo a dominar el contenido. Junto con las respuestas largas y las preguntas de verdadero/falso, a menudo se enfrenta a ejercicios de programación. El Apéndice A proporciona las respuestas y soluciones.

Gracias por comprar este libro. Espero que le resulte útil para comprender XML y JSON en un contexto Java.

Jeff Friesen (octubre de 2018)

**NOTA** Puede descargar el código fuente de este libro apuntando su navegador web a www.apress.com/9781484243299 y haciendo clic en la pestaña Código fuente seguida del enlace Descargar ahora.

<hr>

### TABLE OF CONTENTS
* Part I: Exploring XML
* Chapter 1: Introducing XML
   * What Is XML?
   * Language Features Tour
      * XML Declaration
      * Elements and Attributes
      * Character References and CDATA Sections
      * Namespaces
      * Comments and Processing Instructions
   * Well-Formed Documents
   * Valid Documents
      * Document Type Definition
      * XML Schema
   * Summary
* Chapter 2: Parsing XML Documents with SAX
   * What Is SAX?
   * Exploring the SAX API
      * Obtaining a SAX 2 Parser
      * Touring XMLReader Methods
      * Touring the Handler and Resolver Interfaces
   * Demonstrating the SAX API
   * Creating a Custom Entity Resolver
   * Summary
* Chapter 3: Parsing and Creating XML Documents with DOM
   * What Is DOM?
   * A Tree of Nodes
   * Exploring the DOM API
      * Obtaining a DOM Parser/Document Builder
      * Parsing and Creating XML Documents
   * Demonstrating the DOM API
      * Parsing an XML Document
      * Creating an XML Document
   * Working with Load and Save
      * Loading an XML Document into a DOM Tree
      * Configuring a Parser
      * Filtering an XML Document While Parsing
      * Saving a DOM Tree to an XML Document
   * Working with Traversal and Range
      * Performing Traversals
      * Performing Range Operations
   * Summary
* Chapter 4: Parsing and Creating XML Documents with StAX
   * What Is StAX?
   * Exploring StAX
      * Parsing XML Documents
      * Creating XML Documents
   * Summary
* Chapter 5: Selecting Nodes with XPath
   * What Is XPath?
   * XPath Language Primer
      * Location Path Expressions
      * General Expressions
   * XPath and DOM
   * Advanced XPath
      * Namespace Contexts
      * Extension Functions and Function Resolvers
      * Variables and Variable Resolvers
   * Summary
* Chapter 6: Transforming XML Documents with XSLT
   * What Is XSLT?
   * Exploring the XSLT API
   * Demonstrating the XSLT API
   * Going Beyond XSLT 1.0 and XPath 1.0
      * Downloading and Testing SAXON-HE 9.9
      * Playing with SAXON-HE 9.9
   * Summary
   
* Part II: Exploring JSON
* Chapter 7: Introducing JSON
   * What Is JSON?
   * JSON Syntax Tour
   * Demonstrating JSON with JavaScript
   * Validating JSON Objects
   * Summary
* Chapter 8: Parsing and Creating JSON Objects with mJson
   * What Is mJson?
      * Obtaining and Using mJson
   * Exploring the Json Class
      * Creating Json Objects
      * Learning About Json Objects
      * Navigating Json Object Hierarchies
      * Modifying Json Objects
      * Validation
      * Customization via Factories
   * Summary
* Chapter 9: Parsing and Creating JSON Objects with Gson
   * What Is Gson?
      * Obtaining and Using Gson
   * Exploring Gson
      * Introducing the Gson Class
      * Parsing JSON Objects Through Deserialization
      * Creating JSON Objects Through Serialization
      * Learning More About Gson
   * Summary
* Chapter 10: Extracting JSON Values with JsonPath
   * What Is JsonPath?
   * Learning the JsonPath Language
   * Obtaining and Using the JsonPath Library
   * Exploring the JsonPath Library
      * Extracting Values from JSON Objects
      * Using Predicates to Filter Items
   * Summary
* Chapter 11: Processing JSON with Jackson
   * What Is Jackson?
      * Obtaining and Using Jackson
   * Working with Jackson’s Basic Features
      * Streaming
      * Tree Model
      * Data Binding
   * Working with Jackson’s Advanced Features
      * Annotation Types
      * Custom Pretty Printers
      * Factory, Parser, and Generator Features
   * Summary
* Chapter 12: Processing JSON with JSON-P
   * What Is JSON-P?
      * JSON-P 1.0
      * JSON-P 1.1
      * Obtaining and Using JSON-P
   * Working with JSON-P 1.0
      * Working with the Object Model API
      * Working with the Streaming Model API
   * Working with JSON-P 1.1’s Advanced Features
      * JSON Pointer
      * JSON Patch
      * JSON Merge Patch
      * Editing/Transformation Operations
      * Java SE 8 Support
   * Summary
* Part III: Appendixes
* Appendix A: Answers to Exercises
   * Chapter 1: Introducing XML
   * Chapter 2: Parsing XML Documents with SAX
   * Chapter 3: Parsing and Creating XML Documents with DOM
   * Chapter 4: Parsing and Creating XML Documents with StAX
   * Chapter 5: Selecting Nodes with XPath
   * Chapter 6: Transforming XML Documents with XSLT
   * Chapter 7: Introducing JSON
   * Chapter 8: Parsing and Creating JSON Objects with mJson
   * Chapter 9: Parsing and Creating JSON Objects with Gson
   * Chapter 10: Extracting JSON Values with JsonPath
   * Chapter 11: Processing JSON with Jackson
   * Chapter 12: Processing JSON with JSON-P
*Index
