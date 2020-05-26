# 4. Manejo de formularios 55m

   * 20 Introducción al manejo de formularios 6:39 
   * 21 Campos de texto 8:25 
   * 22 Checkbox y radiobutton 8:52 
   * 23 Selectores 5:19 
   * 24 Borrado de datos 9:03 
   * 25 Edición de datos 6:07 
   * 26 Validación y mensajes de error 10:46 
   * Contenido adicional 7
   
# 20 Introducción al manejo de formularios 6:39

[PDF 13_Introduccion_a_los_formularios.pdf](pdfs/13_Introduccion_a_los_formularios.pdf)

## Resumen Profesor

### Formularios con Spring MVC

Spring ofrece funcionalidades para el manejo de formularios. Se realiza a través de un objeto, llamado *Command Object*, que es el bean que servirá para almacenar la información recogida en el formulario. Este objeto debe tener tantos atributos (con getters y setters) como campos tenga el formulario.

**En muchas ocasiones, podremos usar nuestras entidades como *command object***.

### Flujo de un formulario en Spring MVC

1. Enviar el objeto al formulario

   * Lo hacemos desde una petición GET
   * Añadimos al modelo un objeto (normalmente vacío)
   * Redirigimos hacia la plantilla del formulario

2. Formulario

   * Tomamos del contexto el *command object*
   * Asociamos los atributos con los campos del formulario
   * Dirigimos la acción del formulario hacia (3)

3. Procesamiento de los datos

   * Lo hacemos desde una petición POST
   * Recogemos el objeto enviado desde el formulario
   * Aplicamos la lógica de negocio correspondiente.
   * Redirigimos hacia otro controlador.

## Transcripción

# 21 Campos de texto 8:25 

[PDF 14_Formularios_2__Campos_de_texto.pdf](pdfs/14_Formularios_2__Campos_de_texto.pdf)

## Resumen Profesor

En Thymeleaf, los campos de un formulario debe usar siempre, para asociarse el atributo correspondiente del `th:object` (command object), el atributo `th:field`.

## Transcripción

# 22 Checkbox y radiobutton 8:52 

[PDF 15_Formularios_3__Radio_y_Check.pdf](pdfs/15_Formularios_3__Radio_y_Check.pdf)

## Resumen Profesor

En ocasiones, necesitaremos dibujar estos campos a partir de una lista de valores. Las expresiones de utilidad `#ids` nos serán de gran ayuda.

```html
<ul>
   <li th:each="tipo : ${tipos}">
      <input type="radio" th:field="*{tipoEnvio}" th:value="${tipo}" />
      <label th:for="${#ids.prev('tipoEnvio')}"
             th:text="${tipo.nombre}">Tipo de envío</label>
   </li>
</ul>
```

## Transcripción

# 23 Selectores 5:19 

[PDF 16_Formularios_4__Campos_de_seleccion.pdf](pdfs/16_Formularios_4__Campos_de_seleccion.pdf)

## Resumen Profesor

Tienen dos partes: `select` y un conjunto de etiquetas `option` anidadas. Solo el campo `select` necesita el atributo `th:field`. Las diferentes etiquetas option deberán tener su correspondiente atributo `th:value`.

Lo usual es que generemos las diferentes etiquetas `option` a partir de una lista de valores.

```html
<select th:field="*{categoria}" class="form-control">
   <option value="-1">---</option>
   <option th:each="categoria : ${categorias}"
           th:value="${categoria.id}"  
           th:text="${categoria.nombre}">
      Categoría
   </option>
</select>
```

## Transcripción

# 24 Borrado de datos 9:03 

[PDF 17_Formularios_5__Edicion_y_borrado.pdf](pdfs/17_Formularios_5__Edicion_y_borrado.pdf)

## Resumen Profesor

### Borrado de productos

El borrado de elementos es tarea, eminentemente, de Spring:

* Invocación de un controlador específico
* Desde ahí, invocar la lógica de negocio necesaria

Para realizar el borrado en cascada de las puntuaciones cuando se borre un producto, la asociación correspondiente está anotada de la siguiente forma:

```java
@OneToMany(mappedBy="producto", cascade=CascadeType.ALL, orphanRemoval=true, fetch=FetchType.EAGER)
private Set<Puntuacion> puntuaciones = ...;
```

### Borrado de categorías

[PDF 17_Formularios_5__Edicion_y_borrado.pdf](pdfs/17_Formularios_5__Edicion_y_borrado.pdf)

Al borrado de categorías le sucede algo parecido (es tarea eminentemente de Spring).

Decir que en esta parte, hemos incluido la lógica para gestionar que no se pueda borrar una categoría que tenga productos asociados.

Como siempre, podéis encontrar los ejemplos completos en el repositorio del curso.

## Transcripción

# 25 Edición de datos 6:07 

## Resumen Profesor

No existe.

## Transcripción

# 26 Validación y mensajes de error 10:46 

[PDF 18_Validacion_y_mensajes_de_error.pdf](pdfs/18_Validacion_y_mensajes_de_error.pdf)

## Resumen Profesor

### Validación en Spring

Spring permite usar el estándar *JSR-303/JSR-380 Bean Validation API*. Spring Boot configura por defecto la implementación de este estándar realizada por *hibernate*.
Permite realizar la validación añadiendo anotaciones en nuestras clases modelo.

### Algunas anotaciones de validación:

* `@NotNull`: el atributo no puede ser nulo
* `@Min`, `@Max`: mayor o igual (o menor o igual) que un valor determinado.
* `@NotEmpty`: el atributo no puede estar vacío (Strings, colecciones, arrays, …)
* `@Email`: el atributo debe ser un email válido.
* `@Size`: el atributo tiene que tener un tamaño según el indicado.

Puedes consultar toda la documentación en https://beanvalidation.org/2.0/spec/#builtinconstraints

### Formulario con validación

Para poder validar un formulario, tenemos que modificar el código del controlador, de forma que quede, por ejemplo, así:

```java
@PostMapping("/nuevo/submit")
public String submitNuevoProducto(@Valid Producto producto, BindingResult bindingResult, Model model) {

   if (bindingResult.hasErrors()) {
      model.addAttribute("categorias", categoriaService.findAll());
      return "admin/form-producto";
   } else {
      productoService.save(producto);
      return "redirect:/admin/producto/";
   }

}
```

### Visualización de los errores

Thymeleaf nos ofrece algunos elementos para gestionar los errores:

* Algunas funciones del objeto `#fields`: `#fields.hasError(‘...’)` y `#fields.errors(‘...’)`
* Atributos: `th:errors` y `th:errorclass`

## Transcripción

# Contenido adicional 7   

* [PDF 13_Introduccion_a_los_formularios.pdf](pdfs/13_Introduccion_a_los_formularios.pdf)
* [PDF 14_Formularios_2__Campos_de_texto.pdf](pdfs/14_Formularios_2__Campos_de_texto.pdf)
* [PDF 15_Formularios_3__Radio_y_Check.pdf](pdfs/15_Formularios_3__Radio_y_Check.pdf)
* [PDF 16_Formularios_4__Campos_de_seleccion.pdf](pdfs/16_Formularios_4__Campos_de_seleccion.pdf)
* [PDF 17_Formularios_5__Edicion_y_borrado.pdf](pdfs/17_Formularios_5__Edicion_y_borrado.pdf)
* [PDF 18_Validacion_y_mensajes_de_error.pdf](pdfs/18_Validacion_y_mensajes_de_error.pdf)
