# 1. Introducción y configuración 1:08
   
   * 01 Presentación del curso y profesor 6:07 
   * 02 ¿Qué es Thymeleaf? Concepto de Natural Templating 11:40 
   * 03 Conceptos de Spring 10:25 
   * 04 Primer proyecto con Thymeleaf 11:55 
   * 05 Plantilla base de BootStrap 4:19 
   * 06 Implementación del controlador 11:49 
   * 07 Configuración de Thymeleaf vía JavaConfig 12:34 
   * Contenido adicional  7
   
# 01 Presentación del curso y profesor 6:07

[PDF 00_Presentacion_del_curso.pdf](pdfs/00_Presentacion_del_curso.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 02 ¿Qué es Thymeleaf? Concepto de Natural Templating 11:40 

[PDF 01_Introduccion.pdf](pdfs/01_Introduccion.pdf)

## Resumen Profesor

### ¿Qué es Thymeleaf?

Thymeleaf es un motor de plantillas, es decir, un software dedicado a combinar una plantilla con un modelo de datos, para producir un documento como resultado. Existen docenas de motores en el mercado, pero Thymeleaf, además de integrarse perfectamente con Spring (Boot), tiene la ventaja de permitirnos hacer *natural templating*.

### ¿Qué es el natural templating?

Muchos motores de plantillas que trabajan con HTML basan su funcionamiento en añadir nuevas etiquetas a las que ya define este lenguaje de marcado, para poder realizar su funcionamiento.

Por contra, Thymeleaf funciona añadiendo, a las etiquetas HTML estándar, una serie de atributos. Estos, en caso de visualizar estáticamente un documento, son descartados por el navegador. Esto aporta la ventaja de que podemos trabajar tanto el *diseño web* como la integración con el *aplicativo* sobre un mismo documento (cosa que no podríamos hacer, por ejemplo con JSP).

### Tipos de documentos

Thymeleaf permite el procesamiento de diferentes tipos de documentos:

* HTML: en sus versiones HTML4, HTML5 y XHTML. No realiza ninguna validación o comprobación de si está bien formado
* XML: espera que el documento esté bien formado (puede lanzar excepciones si no lo está). No hace validaciones frente a DTD o XML Schema.
* Texto: aplicado a un texto que no utiliza un lenguaje de marcado (HTML o XML). Sirve para emails, documentación, …
* Javascript y CSS: permite procesar estos ficheros del mismo modo que trabaja con HTML, si bien está realizando un tratamiento de tipo texto.
* RAW: es un modo en el que no se hace ningún tratamiento al documento. Sirve para insertar bloques sin procesar en plantillas sí procesadas.

### Dialectos

En Thymeleaf, llamados *procesador* a un objeto que realiza la transformación de una etiqueta, texto, comentario, ... aplicando una determinada lógica. Un *dialecto* es un conjunto de procesadores.

Thymeleaf ofrece un dialecto *standard*, que puede ser extendido por los programadores. De hecho, existen muchos derivados (como los de las versiones 3, 4 y 5 de Spring). La mayoría de ellos trabajan procesando atributos, permitiendo así el natural templating

```html
<span th:text="${usuario.nombre}">Pepe Pérez</span>
```

## Transcripción

# 03 Conceptos de Spring 10:25 

[PDF 02_Primer_proyecto.pdf](pdfs/02_Primer_proyecto.pdf)

## Resumen Profesor

### Nuestro IDE

Utilizaremos *Spring Tool Suite*. Podemos descargarlo, para diversos sistemas operativos y arquitecturas, en https://spring.io/tools/sts/all.

### Conceptos de repaso de Spring

Os recomendamos encarecidamente que podáis visitar nuestro **curso de Spring** antes de realizar este; con todo, repasamos algunos de los conceptos necesarios que vamos a utilizar en este proyecto de ejemplo y en las siguientes lecciones:

* **Spring Web MVC** es un framework para implementar apliaciones web bajo el patrón *Modelo-Vista-Controlador*. Nos permite (conjuntamente con ***Spring Core***) realizar inversión de control.

* **Spring Boot** nos permite configurar casi instantáneamente una aplicación Spring (por ejemplo, una aplicación web, que utilice un ORM, la base de datos, ...) aplicando el principio de *convención sobre configuración*.

* **Spring Data JPA** es una capa de abstración sobre JPA (*Java Persistence API*). Añade a esta algunas características, como CRUDs automáticos, generación sencilla de consultas, ...

* **h2 *database***: es una base de datos relacional muy sencilla. Se *embebe* como un jar dentro del proyecto, y el fichero con toda la información también reside en el mismo.

## Transcripción

# 04 Primer proyecto con Thymeleaf 11:55 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 05 Plantilla base de BootStrap 4:19 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 06 Implementación del controlador 11:49 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 07 Configuración de Thymeleaf vía JavaConfig 12:34 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional  7   
