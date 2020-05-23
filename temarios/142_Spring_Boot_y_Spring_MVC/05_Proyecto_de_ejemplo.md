# 5. Proyecto de ejemplo 01:39

* 36 Presentación del proyecto de ejemplo 4:43 
* 37 Creación de las entidades 8:54 
* 38 Creación de los repositorios 6:13 
* 39 Aplicación de la seguridad 12:40 
* 40 Creación de los servicios 11:37 
* 41 Plantillas a utilizar 8:30 
* 42 Login y registro 5:13 
* 43 Listado de productos 9:55 
* 44 Comprar y carrito 9:27 
* 45 Finalizar compra y factura 5:03 
* 46 Gestión de productos 6:28 
* 47 Subida de imágenes y gestión del almacenamiento 10:55 
* Contenido adicional 5

# 36 Presentación del proyecto de ejemplo 4:43 

[PDF Proyecto_de_ejemplo.pdf](pdfs/25_Proyecto_de_ejemplo.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 37 Creación de las entidades 8:54 

## Resumen Profesor

No existe.

## Transcripción

# 38 Creación de los repositorios 6:13 

[TXT Pasos.txt](pdfs/27_Pasos.txt)

## Resumen Profesor

### Otras formas de generar la base de datos e insertar datos de ejemplo

Como muchos podréis suponer, la forma en que hemos ido generando la base de datos e insertando datos de ejemplo no es la más ortodoxa, aunque es muy útil mientras aprendemos a desarrollar. Sin embargo, con un sistema en producción, dicho esquema de trabajo no sería el más viable.

En el caso de usar un SGBD más potente y remoto, lo normal es generar el esquema de la base de datos utilizando *scripts* de sql. Estos scripts suelen ser acumulativos; es decir, para la versión 3, lo que hará el script es modificar lo necesario de la versión 2, y añadir todos los elementos nuevos. Además, también se suelen usar scripts de sql para hacer la inserción de los datos iniciales.

Spring Boot, como en otras ocasiones, nos ofrece facilidades para la creación del esquema y la inserción de datos iniciales.

* La propiedad `spring.jpa.hibernate.ddl-auto` (la cual es un atajo de la propiedad de hibernate `hibernate.hbm2ddl.auto`) toma el valor `create-drop` cuando se utiliza una base de datos embebida (por ejemplo H2) y no se le indica otra forma de trabajar. En otro caso, tomar el valor `none`. Si quisiéramos gestionar nosotros la creación de la base de datos, ese sería el valor que tendríamos que indicar

```html
spring.jpa.hibernate.ddl-auto=none
```

* El script de creación de la base de datos debe llamarse `schema.sql` y debe colocarse en algún lugar del classpath. Un buen sitio para ello podría ser la ruta `src/main/resources/`, donde está el propio fichero `application.properties`.

* El script de inicialización de datos debe llamarse `data.sql` y debe colocarse en el mismo lugar del fichero anterior.

## Transcripción

# 39 Aplicación de la seguridad 12:40 

[PDF Seguridad.pdf](pdfs/28_Seguridad.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 40 Creación de los servicios 11:37 

## Resumen Profesor

No existe.

## Transcripción

# 41 Plantillas a utilizar 8:30 

[ZIP plantillas.zip](pdfs/plantillas.zip)

## Resumen Profesor

### Plantillas

Puedes descargar el código fuente de las plantillas pulsando [aquí](pdfs/plantillas.zip)

## Transcripción

# 42 Login y registro 5:13 

## Resumen Profesor

No existe.

## Transcripción

# 43 Listado de productos 9:55 

## Resumen Profesor

No existe.

## Transcripción

# 44 Comprar y carrito 9:27 

## Resumen Profesor

No existe.

## Transcripción

# 45 Finalizar compra y factura 5:03 

## Resumen Profesor

No existe.

## Transcripción

# 46 Gestión de productos 6:28 

## Resumen Profesor

No existe.

## Transcripción

# 47 Subida de imágenes y gestión del almacenamiento 10:55 

[PDF Retos_para_el_alumno.pdf](pdfs/36_Retos_para_el_alumno.pdf)

## Resumen Profesor

### Posibles mejoras del proyecto que puedes hacer tú

* Añadir categorías a los productos (como una nueva entidad).
* Añadir la validación de entidades
* Añadir el tratamiento de errores
* Añadir asociaciones bidireccionales
* Definir más consultas, para tener mejores filtros.
* Utilizar Bootstrap 4 en lugar de 3.
* En la lista de compras, visualizar número de productos e importe total.
* Para l@s más valientes, implementar algún método de pago (¿qué tal Paypal?)
* Para l@s más valientes, implementar un servicio de subida de ficheros en la nube. (si van a ser imágenes, ¿qué tal imgur?)

## Transcripción

# Contenido adicional 5

* [PDF Proyecto_de_ejemplo.pdf](pdfs/25_Proyecto_de_ejemplo.pdf)
* [TXT Pasos.txt](pdfs/27_Pasos.txt)
* [PDF Seguridad.pdf](pdfs/28_Seguridad.pdf)
* [ZIP plantillas.zip](pdfs/plantillas.zip)
* [PDF Retos_para_el_alumno.pdf](pdfs/36_Retos_para_el_alumno.pdf)
