# 5. Subida de ficheros 47m
   
   * 24 Elementos de Spring necesarios para las subidas de ficheros 8:19 
   * 25 Subida básica 9:22 
   * 26 Subida de múltiples ficheros 17:39 
   * 27 Drag & Drop 12:31 
   * Contenido adicional 4

# 24 Elementos de Spring necesarios para las subidas de ficheros 8:19 
 
[PDF Subida_de_ficheros_Elementos_de_Spring_necesarios.pdf](pdfs/23_Subida_de_ficheros_Elementos_de_Spring_necesarios.pdf)

## Resumen Profesor

Para integrar la subida de ficheros en nuestro proyecto nos hemos basado en el proyecto de ejemplo de Spring que puedes encontrar [aquí](https://spring.io/guides/gs/uploading-files/).

### Clase `MultipartFile`

Si quieres saber más sobre esta clase, y los métodos de que dispone, puedes ver su documentación [aquí](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/multipart/MultipartFile.html).

## Transcripción

# 25 Subida básica 9:22 

[PDF Subida_basica.pdf](pdfs/24_Subida_basica.pdf)

## Resumen Profesor

En el ejemplo de nuestro vídeo articulamos un mecanismo mediante Javascript para ir añadiendo nuevos controles `<input type="file" ...>` dinámicamente. De esta forma, podemos controlar el número de ficheros que se van a subir. Es más, podríamos incluir algún tipo de tope, que deshabilitara el botón de añadir más, para limitar el número de ficheros a subir.

HTML5 ofrece otra alternativa, que sería el uso del atributo `multiple`, de forma que podríamos tener un único control como el siguiente:

```html
<input type="file" name="file" multiple>
```

Esto produciría como resultado un único campo en el formulario, pero que nos permitiría seleccionar múltiples ficheros de una sola vez (haciendo uso de la tecla *Shift* al seleccionar los ficheros).

### Carrusel de fotos

Hemos tomado como base para adaptar a Thymeleaf el ejemplo de carrusel de fotos para bootstrap disponible en [w3schools](https://www.w3schools.com/bootstrap/bootstrap_carousel.asp).

## Transcripción

# 26 Subida de múltiples ficheros 17:39 

[PDF Subida_de_multiples_ficheros.pdf](pdfs/25_Subida_de_multiples_ficheros.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 27 Drag & Drop 12:31 

[PDF Drag_Drop.pdf](pdfs/26_Drag_Drop.pdf)

## Resumen Profesor

La librería utilizada en el ejemplo de este último vídeo es [dropzone.js](https://www.dropzonejs.com/). Es una librería de código abierto que proporciona subida de ficheros mediante pincha-arrastra-suelta con una previsualización de la misma.

Es ligera, no depende de otras librerías y es altamente personalizable.

## Transcripción

# Contenido adicional 4

* [PDF Subida_de_ficheros_Elementos_de_Spring_necesarios.pdf](pdfs/23_Subida_de_ficheros_Elementos_de_Spring_necesarios.pdf)
* [PDF Subida_basica.pdf](pdfs/24_Subida_basica.pdf)
* [PDF Subida_de_multiples_ficheros.pdf](pdfs/25_Subida_de_multiples_ficheros.pdf)
* [PDF Drag_Drop.pdf](pdfs/26_Drag_Drop.pdf)
