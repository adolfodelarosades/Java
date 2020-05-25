4. Manejo de formularios 55m
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
Spring ofrece funcionalidades para el manejo de formularios. Se realiza a través de un objeto, llamado Command Object, que es el bean que servirá para almacenar la información recogida en el formulario. Este objeto debe tener tantos atributos (con getters y setters) como campos tenga el formulario.

En muchas ocasiones, podremos usar nuestras entidades como command object.

Flujo de un formulario en Spring MVC
Enviar el objeto al formulario
Lo hacemos desde una petición GET
Añadimos al modelo un objeto (normalmente vacío)
Redirigimos hacia la plantilla del formulario
Formulario
Tomamos del contexto el command object
Asociamos los atributos con los campos del formulario
Dirigimos la acción del formulario hacia (3)
Procesamiento de los datos
Lo hacemos desde una petición POST
Recogemos el objeto enviado desde el formulario
Aplicamos la lógica de negocio correspondiente.
Redirigimos hacia otro controlador.

## Transcripción

# 21 Campos de texto 8:25 

[PDF 14_Formularios_2__Campos_de_texto.pdf](pdfs/14_Formularios_2__Campos_de_texto.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 22 Checkbox y radiobutton 8:52 

[PDF 15_Formularios_3__Radio_y_Check.pdf](pdfs/15_Formularios_3__Radio_y_Check.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 23 Selectores 5:19 

[PDF 16_Formularios_4__Campos_de_seleccion.pdf](pdfs/16_Formularios_4__Campos_de_seleccion.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 24 Borrado de datos 9:03 

[PDF 17_Formularios_5__Edicion_y_borrado.pdf](pdfs/17_Formularios_5__Edicion_y_borrado.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 25 Edición de datos 6:07 

## Resumen Profesor

No existe.

## Transcripción

# 26 Validación y mensajes de error 10:46 

[PDF 18_Validacion_y_mensajes_de_error.pdf](pdfs/18_Validacion_y_mensajes_de_error.pdf)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 7   

* [PDF 13_Introduccion_a_los_formularios.pdf](pdfs/13_Introduccion_a_los_formularios.pdf)
* [PDF 14_Formularios_2__Campos_de_texto.pdf](pdfs/14_Formularios_2__Campos_de_texto.pdf)
* [PDF 15_Formularios_3__Radio_y_Check.pdf](pdfs/15_Formularios_3__Radio_y_Check.pdf)
* [PDF 16_Formularios_4__Campos_de_seleccion.pdf](pdfs/16_Formularios_4__Campos_de_seleccion.pdf)
* [PDF 17_Formularios_5__Edicion_y_borrado.pdf](pdfs/17_Formularios_5__Edicion_y_borrado.pdf)
* [PDF 18_Validacion_y_mensajes_de_error.pdf](pdfs/18_Validacion_y_mensajes_de_error.pdf)
