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

Hola todo como bonus track de este curso vamos a realizar un proyecto completo que integre todos los conocimientos que hemos ido adquiriendo a lo largo de las diferentes lesiones el proyecto consistía en un mercado de productos de segunda mano muy sencillos no pensáis que vamos a hacer un nuevo eBay sino que va a ser algo francamente fácil de implementar el modelo de datos va a ser sencillo vamos a trabajar solamente con tres clases la clase usuario que modelará puede un usuario con el cual además nos podremos bloquear vale la clase producto que serán los productos que nosotros queramos vender un usuario podrá poner en venta uno o más productos y la clase compra que permitirá que un usuario pueda comprar los productos de otra y que tendrá pues pocos datos esto será el modelo de datos con el que trabajaremos las funcionalidades descritas y son sencillas pero la iremos haciendo paso a paso por un lado tendremos el registro el login en logout vale de toda la parte que concierne a la seguridad que ya hablaremos de ella porque incluiremos algún cambio la gestión de los productos Mané el alta de nuevos productos consultar los que hay poder borrar el carrito de compra el decir por poder ir añadiendo producto al carrito y poder terminar de comprarlo y además en el catálogo de productos vale será público es decir que cualquier usuario aunque no esté autenticado podrá entrar a ver como elemento tecnológicos utilizaremos como es natural spring boot el servicio de Spring initializr crearemos controladores que manejarán peticiones get y post gestionaremos formularios con subida de ficheros la seguridad con una zona pública y privada además vamos a ver cómo implementar la seguridad con lo usuario en base de datos el manejo de sesiones vale para manejar el carrito y todo lo que hemos visto en la parte de Spring data JP sur entidad repositorio y consulta creando nuestro proyecto vale en este caso lo vamos a crear desde cero un proyecto de Spring JP a venta en Live vale H2 security Redis vale sesión todas las que hemos venido utilizando anteriormente no vamos a terminar de cenar vamos añadir algunas que no se añaden por por defecto vale como son las velas las huecas y los extras de Chinese vale cuando el proyecto este generado lo tenemos por aquí Alfon y podemos ver cómo están las de data de JP a IPR Disk Security en started the time link de web el sesión de lata revisaste los añade también los test y los test de Spring Security y vamos a copiar y pegar las dependencias de las webcam y los extras vale lo tenemos por aquí son dependencias que hemos venido utilizando anteriormente okay con lo cual a nivel de dependencia ya no tendríamos Tomás también añadir en el 60 de properties algunos cambios también me vais a permitir porque son los mismos que hemos venido utilizando anteriormente lo voy a copiar y pegar el puerto 9000 el almacenamiento de la sesión en Redis la ruta de la base de datos habilitar la consola de H2 mostrar las consultas SQL etcétera etcétera con lo cual tendríamos que como como punto de partida de nuestro proyecto ya todo totalmente creado en el siguiente vídeo vamos a ver cómo ir creando vale lo iremos haciendo paso a pasar lo siento el vídeo en el siguiente vamos a ir creando las diferentes entidades que vamos a manejar en nuestro proyecto


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
