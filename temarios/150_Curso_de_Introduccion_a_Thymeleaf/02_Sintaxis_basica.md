# 2. Sintaxis básica 1:04
   * 08 Texto y variables 10:57 
   * 09 Sintaxis básica: Expresiones 12:19 
   * 10 Sintaxis básica: Expresiones de utilidad 5:07 
   * 11 Operaciones aritméticas, condiciones y comparaciones 14:19 
   * 12 Bucles e iteraciones 10:22 
   * 13 Presentación del proyecto de ejemplo 11:01 
   * Contenido adicional 8
   
# 08 Texto y variables 10:57

[PDF 04_Texto_y_variables.pdf](pdfs/04_Texto_y_variables.pdf)

## Resumen Profesor

Lo podemos manejar mediante los atributos `th:text` y `th:utext`. Con ellos, podemos inyectar cualquier tipo de contenido textual.

```html
<span th:text="${nombre}">mundo</span>
```

Si el texto a inyectar incluye etiquetas HTML y queremos que estas sean procesadas, `th:text` no va a producir el resultado esperado. Para ello, deberíamos usar `th:utext`, que *mostrará* el texto sin procesarlas.

También podemos utilizar `th:text` y `th:utext` para inyectar valores numéricos. Se realizará el casting correspondiente para mostrarlo como texto.

## Transcripción

# 09 Sintaxis básica: Expresiones 12:19 

[PDF 05_Sintaxis_basica.pdf](pdfs/05_Sintaxis_basica.pdf)

## Resumen Profesor

### Lenguaje de expresión

Thymeleaf utiliza en su dialecto estándar el lenguaje OGNL (Object-Graph Navigation Language), un lenguaje de expresiones para Java, que permite trabajar con objetos, tomando y estableciendo propiedades, haciendo llamadas a métodos, manejo de arrays, ...

Sin embargo, el dialecto para Spring utiliza SpEL (Spring Expression Language), otro lenguaje de expresiones que es común a todos los módulos y tecnologías de Spring, con análgas funcionalidades.

En nuestro caso, dado que utilizaremos Thymeleaf con Spring (con su correspondiente dialecto), tendremos que hacer uso de SpEL, si bien, en la gran mayoría de los casos, las expresiones OGNL y SpEL serán iguales.

### Expresiones básicas

SpEL (y OGNL) nos proveen de diferentes tipos de expresiones. Algunas las dejaremos para el curso avanzado de Thymeleaf.

* **Expresiones variables**: `${...}`
* **Expresiones variables de selección**: `*{...}`
* Expresiones de mensaje: `#{...}`
* **Expresiones de enlaces**: `@{...}`
* Expresiones de fragmentos: `~{...}`

También podemos hacer uso de literales, como en otros lenguajes de expresión (textuales, numéricos, booleanos, nulos, …)

### Expresiones variables

Dada una expresión, como `${today}`, Thymeleaf buscará en el contexto una variable llamada *today*.

Tenemos también múltiples posibilidades, con la notación de punto (`${persona.nombre}`) o de corchete (`${persona['padre']['nombre']}`); así como la manipulación de *maps* (`${personas['Luismi'].edad}`) y arrays (`${arrayPersonas[0].nombre}`).

También podemos realizar llamadas a métodos definidos en los objetos (`${persona.nombreCompleto()}`).

### Expresiones de selección

Las expresiones de selección o expresiones en selección son expresiones variables que nos permiten ejecutarlas en el marco de un objeto, creando entonces expresiones más abreviadas.

Los siguientes fragmentos de una plantilla nos ilustrarán como ejemplo, y son equivalentes.

```html
<div th:object="${session.usuario}">
    <p>Nombre: <span th:text="*{nombre}">Luis Miguel</span>.</p>
    <p>Apellidos: <span th:text="*{apellidos}">López</span>.</p>
    <p>Nacionalidad: <span th:text="*{nacionalidad}">Español</span>.</p>
</div>
 
<div>
    <p>Nombre: <span th:text="${session.usuario.nombre}">Luis Miguel</span>.</p>
    <p>Apellidos: <span th:text="${session.usuario.apellidos}">López</span>.</p>
    <p>Nationality: <span th:text="${session.usuario.nacionalidad}">Español</span>.</p>
</div>
```

## Transcripción

# 10 Sintaxis básica: Expresiones de utilidad 5:07 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 11 Operaciones aritméticas, condiciones y comparaciones 14:19 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 12 Bucles e iteraciones 10:22 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 13 Presentación del proyecto de ejemplo 11:01 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 8   
