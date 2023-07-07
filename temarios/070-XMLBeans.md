# Bienvenido a XMLBeans

## Documentación

* Installing XMLBeans
* [Tutorial: First Steps](https://github.com/adolfodelarosades/Java/edit/master/temarios/070-XMLBeans/01-Tutorial.md)
* User Guide
   * [Getting Started II](https://github.com/adolfodelarosades/Java/blob/master/temarios/070-XMLBeans/02-Getting-Started-II.md)
   * Schema Type System
   * Generated Types
   * Generated Methods
   * Validation
   * Cursor Navigation
   * XPath / XQuery
   * XmlTokens
   * Bookmarks
   * Builtin Types
   * Handling xs:any
   * JPMS / Jigsaw support
   * Maven plugin
   * Tools
   * Ant Task
* Sample Code
* FAQ
* Javadocs
* Wiki Pages
  

## En esta sección

* Home
* Welcome
* What is XMLBeans?
* History
* Changes
* Overview
* Getting Started
* Sample Code
* FAQ
* Tutorial: First Steps
* v5.0.0 Javadoc

## ¿Qué es XMLBeans?

XMLBeans es una tecnología para acceder a XML vinculándolo a tipos Java. XMLBeans proporciona varias formas de acceder al XML, que incluyen:

* A través del XML schema que se ha compilado para generar tipos Java que representan tipos de esquema. De esta forma, puede acceder a las instancias del esquema a través de accesores de estilo JavaBeans al estilo de "getFoo" y "setFoo".
   La XMLBeans API también le permite reflejarse en el propio XML schema a través de un modelo XML Schema Object.

* Un modelo de cursor a través del cual puede recorrer el conjunto de información XML completo.

* Soporte para XML DOM.
  
Para obtener una introducción más completa, consulte [XMLBeans Overview](https://xmlbeans.apache.org/overview.html) o [Getting Started With XMLBeans](https://xmlbeans.apache.org/guide/GettingStarted.html).

Para obtener más detalles sobre XMLBeans, consulte [XMLBeans Wiki pages](https://cwiki.apache.org/confluence/display/xmlbeans/) o la documentación de XMLBeans (la pestaña Documentación de este sitio web).

## Release: Apache XMLBeans 5.1.1 (August 29, 2022)

Los archivos de la versión más reciente [están disponibles](https://xmlbeans.apache.org/download/index.html).

El proyecto Apache [POI](https://poi.apache.org/) ha retirado el código base de XMLBeans desde 3.0.0 y lo mantiene como un subproyecto.

Algunas correcciones de errores (para obtener una lista más completa de cambios, consulte [CHANGES](https://xmlbeans.apache.org/status.html) o [JIRA](https://issues.apache.org/jira/secure/ReleaseNote.jspa?projectId=10436&version=12351806)).

## CVE-2021-23926 - XML External Entity (XXE) Processing in Apache XMLBeans versions prior to 3.0.0 (January 13, 2021)

Descripción:

Al analizar archivos XML con XMLBeans 2.6.0 o anterior, el analizador subyacente creado por XMLBeans podría ser susceptible a ataques de entidad externa XML (XXE).

Este problema se solucionó hace algunos años, pero al revisarlo, decidimos que deberíamos tener un CVE para generar conciencia sobre el problema.

Mitigación:

Se recomienda a los usuarios afectados que actualicen a Apache XMLBeans 3.0.0 o superior, que corrige esta vulnerabilidad. Es preferible XMLBeans 4.0.0 o superior.

Referencias: [XML external entity attack](https://en.wikipedia.org/wiki/XML_external_entity_attack)

[Historial de versiones](https://xmlbeans.apache.org/history.html)

## Getting Started

### 

Si desea hacerlo directamente con su propio esquema e instancia XML, siga estos pasos básicos:

1. [Instale XMLBeans](https://xmlbeans.apache.org/documentation/conInstallGuide.html).
2. Compila tu esquema. Use [scomp](https://xmlbeans.apache.org/guide/Tools.html#scome) para compilar el esquema, generando y discordando tipos de Java. Por ejemplo, para crear un archivo **`employeeschema.jar`** a partir de un archivo **`employeeschema.xsd`**:

```sh
scomp -out empleadoschema.jar empleadoschema.xsd
```

3. Escribir código. Con el JAR generado en su classpath, escriba código para vincular una instancia XML a los tipos de Java que representan su esquema. Aquí hay un ejemplo que usaría tipos generados a partir de un esquema de empleados:

```java
File xmlFile = new File("c:\employees.xml");

// Bind the instance to the generated XMLBeans types (Vincule la instancia a los tipos de XMLBeans generados.).
EmployeesDocument empDoc = EmployeesDocument.Factory.parse(xmlFile);

// Get and print pieces of the XML instance (Obtenga e imprima partes de la instancia XML).
Employees emps = empDoc.getEmployees();
Employee[] empArray = emps.getEmployeeArray();
for (int i = 0; i < empArray.length; i++)
{
   System.out.println(empArray[i]);
}
```

## Leer un tutorial.

Lea nuestro [tutorial](https://xmlbeans.apache.org/documentation/tutorial_getstarted.html) para tener una idea de los conceptos básicos de XMLBeans.

## Lea la documentación y otra información.

En nuestra página de [documentación](https://xmlbeans.apache.org/documentation/index.html), encontrará vínculos a varios temas que describen las funciones de XMLBeans y cómo usarlas. También encontrará enlaces a la referencia de Javadoc en la API de XMLBeans.

También puede consultar las preguntas frecuentes [FAQ](https://cwiki.apache.org/confluence/display/xmlbeans/XmlBeansFaq), que se actualizan con nuevas respuestas a medida que se necesitan.

No se olvide de [XMLBeans Wiki](https://cwiki.apache.org/confluence/display/xmlbeans/), que recopila mucha información valiosa.

## Echa un vistazo a los ejemplos.

Muchas de las características de XMLBeans se ilustran en nuestros [ejemplos](https://xmlbeans.apache.org/samples/index.html).



