# 4. Buenas prácticas diseñando formularios 75m

   * 18 Formularios "muchos a uno" 13:33 
   * 19 Practicando con formularios "muchos a uno" 13:30 
   * 20 Formularios "uno a muchos" 7:09 
   * 21 Practicando con formularios "uno a muchos" 19:25 
   * 22 Formularios "muchos a muchos" 5:13 
   * 23 Practicando con formularios "muchos a muchos" 16:37 
   * Contenido adicional 6
   
# 18 Formularios "muchos a uno" 13:33 

[PDF Formularios_muchos_a_uno.pdf](pdfs/17_Formularios_muchos_a_uno.pdf)

## Resumen Profesor

### Material visual para nuestras plantillas

Uno de los principios de la informática en general es *no reinventar la rueda*. En internet tenemos muchos sitios donde los usuarios comparten su código. Si trabajamos Thymeleaf conjuntamente con bootstrap, un buen sitio para encontrar snippets de código que nos puedan ilustrar es https://bootsnipp.com/. Como esta página encontrará muchas otras por internet, pero quería dejar al menos una que podáis utilizar para buscar snippets, generar un formulario rápidamente, etc…

## Transcripción

# 19 Practicando con formularios "muchos a uno" 13:30 

[PDF Formularios_muchos_a_uno_Ejemplo.pdf](pdfs/18_Formularios_muchos_a_uno_Ejemplo.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 20 Formularios "uno a muchos" 7:09

[PDF Formularios_uno_a_muchos.pdf](pdfs/19_Formularios_uno_a_muchos.pdf)

## Resumen Profesor

Si quieres aprender más sobre asociaciones entre entidades, puedes visitar nuestro **curso de Hibernate y JPA**.

## Transcripción

# 21 Practicando con formularios "uno a muchos" 19:25

[PDF Formularios_uno_a_muchos_Ejemplo.pdf](pdfs/20_Formularios_uno_a_muchos_Ejemplo.pdf)

## Resumen Profesor

Thymeleaf tiene la posibilidad de *preprocesar* expresiones. El preprocesamiento es una ejecución de las expresiones realizadas antes de la normal que permite la modificación de la expresión que finalmente se ejecutará. Las expresiones preprocesadas son exactamente como las normales, pero aparecen rodeadas por un símbolo de subrayado doble (como `__$ {expression}__`).

### Estado de la iteración

Al usar `th:each`, Thymeleaf ofrece un mecanismo útil para realizar un seguimiento del estado de su iteración: *la variable de estado*.

Las variables de estado se definen dentro de un atributo `th:*` y contienen los siguientes datos:

* `index`: El índice de iteración *actual*, que comienza con 0.
* `count`: El índice de iteración *actual*, que comienza con 1.
* `size`: La cantidad total de elementos en la variable iterada.
* `current`: La variable *iter* para cada iteración.
* `even/odd` (booleanas): Si la iteración actual es par o impar.
* `first/last` (booleanas): Si la iteración actual es la primera o la última.

## Transcripción

# 22 Formularios "muchos a muchos" 5:13 

[PDF Formularios_muchos_a_muchos.pdf](pdfs/21_Formularios_muchos_a_muchos.pdf)

## Resumen Profesor

Podemos encontrar una librería que nos permite implementar un datalist múltiple de una forma sencilla y visual en http://projects.sergiodinislopes.pt/flexdatalist/.

## Transcripción

# 23 Practicando con formularios "muchos a muchos" 16:37 

[PDF Formularios_muchos_a_muchos_Ejemplo.pdf](pdfs/22_Formularios_muchos_a_muchos_Ejemplo.pdf)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 6   

* [PDF Formularios_muchos_a_uno.pdf](pdfs/17_Formularios_muchos_a_uno.pdf)
* [PDF Formularios_muchos_a_uno_Ejemplo.pdf](pdfs/18_Formularios_muchos_a_uno_Ejemplo.pdf)
* [PDF Formularios_uno_a_muchos.pdf](pdfs/19_Formularios_uno_a_muchos.pdf)
* [PDF Formularios_uno_a_muchos_Ejemplo.pdf](pdfs/20_Formularios_uno_a_muchos_Ejemplo.pdf)
* [PDF Formularios_muchos_a_muchos.pdf](pdfs/21_Formularios_muchos_a_muchos.pdf)
* [PDF Formularios_muchos_a_muchos_Ejemplo.pdf](pdfs/22_Formularios_muchos_a_muchos_Ejemplo.pdf)

