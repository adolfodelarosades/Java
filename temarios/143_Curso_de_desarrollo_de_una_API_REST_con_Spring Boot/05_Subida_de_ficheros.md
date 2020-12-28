# 5. Subida de ficheros 31m

* 23 Servicio de subida 8:07 
* 24 Implementación de la subida de ficheros 17:45 
* 25 Uso del servicio 5:13 
* Contenido adicional 3

# 23 Servicio de subida 8:07

[PDF Servicio_de_subida_de_ficheros.pdf](pdfs/22_Servicio_de_subida_de_ficheros.pdf)

## Resumen Profesor

El código en el que nos hemos basado para implementar este ejemplo es una guía oficial de Spring: https://spring.io/guides/gs/uploading-files/.

## Transcripción
![23-01](images/23-01.png)

Vamos a continuar con nuestro curso de desarrollo de un API REST con Spring Boots y vamos a abrir un nuevo bloque en el que vamos a poder implementar la subida de ficheros a nuestro API REST.

![23-02](images/23-02.png)

Vamos a implementar un servicio de subida de ficheros, tenemos que comenzar hablando entonces, en el marco del protocolo HTTP de las peticiones o ***Contenido Multiparte***, hasta ahora todos los mensajes que hemos hecho eran mensajes que en su cuerpo tenían un bloque, un monolito, una sola parte aunque fuesen diferentes campos, diferentes tipos de atributos, si queremos enviar diferentes tipo de contenido, contenido con diferente ***Content-Type*** deberíamos implementarlo a través de contenidos Multiparte, en realidad es otro tipo de contenido, el Multiparte, que nos permite definir en el cuerpo de una petición diferentes partes cada una de ellas con su Content-Type delimitada por una frontera y que nos permitiría enviar texto plano, nos permitiría enviar por ejemplo un fichero, más texto plano, otro fichero, otro tipo de tipo MIME una imagen, lo podríamos mezclar todo y dentro del cuerpo se irían estableciendo diferentes partes cada una delimitada por sus fronteras.

![23-03](images/23-03.png)

Spring nos permite implementar Multipart a través de dos anotaciones en este caso hablaremos con `@RequestParam` se podría hacer también con `@RequestPart` y nos va a permitir con `@RequestParam` y la clase `MultipartFile` el poder recibir, que nos inyecte en un método del controlador, en ese `MultipartFile` un fichero que hayamos subido desde una determinada petición.

Vamos a ver [la documentación de `MultipartFile`](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/multipart/MultipartFile.html)

![23-13](images/23-13.png)

Podemos ver qué es un fichero por ahora que esta en un sitio temporal y que nos debemos encargar de copiarlo en un sitio persistente o alla donde necesitemos, quizá también en otro sitio temporal y que nos permite acceder por diferentes vías al fichero y algunos de sus metadatos y de esta manera nosotros podremos recoger ese fichero y almacenarlo en un sitio conveniente.

![23-04](images/23-04.png)

¿Dónde lo almacenamos? bueno pues en el propio proyecto como haremos nosotros ahora es fácil para aprender, para poder separarnos de otro elemento cómo sería subirlo a un servicio externo, en una aplicación en producción sería lo ideal el tener algún tipo de nube ***Amazon***, ***Azure***, ***Drive*** a algún tipo de almacenamiento por ejemplo ***MongoDB*** tiene el ***GridFS*** si son solamente imágenes podríamos tener algún paquete contratado con ***Imgur*** o alguno de estos servidores de subida de imágenes que a través de su API nos permitirían rebotar la subida y guardarla allí, nosotros como nos vamos a centrar en la parte de los controladores lo haremos en el propio proyecto y lo haremos a partir de un ejemplo que Spring ofrece en su web.

![23-05](images/23-05.png)

Aquí tenéis el enlace de la guía https://spring.io/guides/gs/uploading-files/, los que vengáis de haber hecho también alguno de los cursos de Spring o Thymeleaf lo habréis encontrado por allí, porque es la misma implementación que vamos siguiendo y por lo menos lo que es la parte del servicio de implementacion la podríamos seguir a partir del código que nos ofrece este ejemplo, en el que tenemos un controlador dónde se suben los distintos ficheros y tendríamos una interfaz de almacenamiento de ficheros, esto nos va a permitir el que utilicemos ahora mismo un almacenamiento en el sistema de ficheros, mañana lo podemos cambiar por otro servicio que implemente estos mismos métodos pero lo haga quizás la nube o en otro tipo de almacenamiento y lo podamos subir. Vamos a ir analizando el código que vamos a utilizar en la lección siguiente.

![23-06](images/23-06.png)

Por lo pronto tenemos la interfaz `StorageService` que nos permite definir el contrato de un servicio de almacenamiento. Quizas sobre el ejemplo podemos hacer alguna modificación.

![23-07](images/23-07.png)

La implementación que haremos en el sistema de fichero nos obligara hacer un método de almacenamiento, en el cual lo que vamos a hacer es modificar el nombre del fichero que se nos suba, imaginar lo peculiar que sería que subiéramos un segundo fichero que se llame igual que el primero y machaque aquello en el servidor, lo deberíamos contemplar, cantidad de fotos que se suben en cualquier red social y que se llamen igual, por coincidencia en el tiempo en una red social global a nivel mundial con millones de usuarios seguro que hay dos IMG y un montón de numeritos, posiblemente coincidiera, no estaría bien que la foto de un usuario machacara la de otro, bueno pues lo sobreescribiremos, como en el nuestro ejemplo tenemos una previsión de un uso un poco menor le añadiremos solamente a ese nombre de fichero la fecha y hora como milisegundo para poder implementarlo. Este método ya digo que nos previene de problemas a la hora de subir dos ficheros que se llamen igual, si aún así ya coincidiera eso ya queda fuera del alcance de este curso, se podría definir algún otro tipo de mecanismo, podría comprobar, añadir una extensión 2, 3, algunos números, no vamos a entrar tampoco en hilar tan fino. Lo que haría este método es devolver el nombre del fichero, la ruta, para poder almacenarlo en el modelo.

![23-08](images/23-08.png)

Tendremos más métodos como el método de carga de un fichero (`load`) que devuelve la ruta de un fichero a partir de su nombre, cargar como un recurso (`loadAsResource`) que lo que hará será a través de la ruta de un fichero lo devuelve como una instancia de `Resource` qué es un envoltorio conveniente que noslo ofrece Spring para que después podamos devolver este fichero.

![23-09](images/23-09.png)

Tendremos también el mecanismo de error con las clases `StorageException` y `StorageFileNotFoundException` para ver si hay algún error a la hora de acceder al fichero, que no lo localicemos etc. 

![23-10](images/23-10.png)

Tendremos una inicializacion en la clase `Application`, hasta ahora hemos venido desarrollando y al igual que hemos utilizado un esquema de `Create-Drop` en nuestra base de datos en el cual se va borrando cuando paramos el proyecto y se vuelve a crear al principio del proyecto, que bueno que durante el desarrollo es quizá, sobre todo a principio de los primeros estadios un buen esquema en el que no nos centramos en que hay algún problema en la base de dato para ir solventando y lo dejamos para más adelante, pues vamos a también a añadir el código que inicializa el sistema de ficheros y cada vez que empecemos limpiaremos el directorio de ficheros subido anteriormente.

![23-11](images/23-11.png)

Por último tendremos un controlador específico que será el que se encargue de atender a la petición de obtener un fichero y devolverlo, este un controlador que de alguna manera encapsula el lugar en el que tenemos almacenados los ficheros, tendremos una interfaz común que será, simularemos que todos nuestros ficheros están en un determinado directorio jugando con que la URL se parece a un sistema de carpetas, pero realmente lo tendremos en un directorio un poco diferente y veremos como así hacemos peticiones GET a esa URL y podemos tenerlos diferentes ficheros.

![23-12](images/23-12.png)

Este código de base nos lo encontraremos en el siguiente ejemplo en el cual añadiremos los elementos que estrictamente nos hacen falta para que nuestra API REST poder incorporar la subida de ficheros y poder hacer el almacenamiento en local y guardar la ruta en nuestro Modelo para que cuando tengamos nuestro modelo nos devuelva la ruta del fichero que acabamos de subir, eso lo haremos en la próxima lección.

# 24 Implementación de la subida de ficheros 17:45 

[PDF Implementación_de_la_subida_de_ficheros.pdf](pdfs/23_Implementación_de_la_subida_de_ficheros.pdf)

## Resumen Profesor

No existe.

## Transcripción

![24-01](images/24-01.png)
![24-02](images/24-02.png)
![24-03](images/24-03.png)
![24-04](images/24-04.png)
![24-05](images/24-05.png)
![24-06](images/24-06.png)
![24-07](images/24-07.png)
![24-08](images/24-08.png)
![24-09](images/24-09.png)
![24-10](images/24-10.png)
![24-11](images/24-11.png)

# 25 Uso del servicio 5:13 

[PDF Uso_del_servicio.pdf](pdfs/24_Uso_del_servicio.pdf)

## Resumen Profesor

No existe.

## Transcripción

Hola hola todos vamos a cerrar este bloque de subida de ficheros haciendo la prueba del servicio que hemos implementado en el vídeo anterior recordemos la estructura de la petición tiene que recibir dos partes una llamado Nuevo de tipo application Jason y otra llamada file de tipo application octet-stream en recibir un fichero podemos probar día de URL object Postman vamos a empezar por cbrl tendríamos que hacer una petición como está en la que indiquemos qué es una petición de tipo post donde vamos a pasar contenido multiparte en el que vamos a mandar dos partes no la primera el fichero este arroba. Café. JPG porque por facilidad nos vamos a ubicar en la ruta donde esté el fichero y aquí mandaría más el objeto Jason que otra parte llamada nuevo fijado que aquí tenemos que parar escapar perdón las comillas para que no se metan dentro de la cadena de caracteres no que sería el el objeto en Jason yo lo tengo preparado por aquí vale sería lo que tendríamos que escribirse URL con las diferentes opciones fijaos como en la parte del fichero solamente tenemos que indicar el nombre igual y la ruta y sin embargo cuando estamos mandando aquí el Jason para indicar que es Jason tenemos que poner el objeto encerrado entre llave y terminar con un punto type application Jason para que sepa que eso que estamos mandando ahí no es una cadena de caracteres cualquiera sino que eso no es correcto Jason o si hacemos la petición vemos que la respuesta es 201 creado y que nos está devolviendo nuestro objeto con IDE 34 café con el precio y la URL de la imagen y además Manolo metido dentro de la categoría de bebida si nos vamos el proyecto en ejecución y refrescamos por aquí podemos comprobar como aquí nublado útil que es donde hemos configurado que suban los ficheros pues tendríamos nuestra imagen del café y se ha subido todo correctamente tanto que hiciéramos ahora bueno pues la petición del girl del producto 34 también lo podríamos tener etcétera etcétera vamos a ver cómo lo podríamos hacer compost tendríamos que hacer una petición de tipo post donde el cuerpo ya hemos visto que no puede ser con Raúl tiene que ser con data donde pasamos todas partes aquí tenemos la dificultad de que no vamos a poder escribir no lo podríamos hacer de una manera sencilla y es más fácil que hace que encapsular el Jason en un fichero tener en cuenta que no vamos a desarrollar nunca una API para qué se utiliza da solamente por Postma lo más normal es que desarrollen una API para que otra persona nosotros o un tercero pueda desarrollar una aplicación cliente en cualquier tecnología angular pues simplemente JavaScript para Android iOS cualquiera una aplicación cliente que interactúe con nuestro a ti vale y ya se encargará de montar en dicha tecnología la petición y pasar el Jason como corresponda vale pero para poder testearlo desde post no tendríamos que hacerlo pasándole el pizzero de café vale la imagen que corresponda y el Jason lo vamos a pasar en un fichero que tendrá solamente ese ese contenido Jason y que lo vamos a mandar en una parte que se llame nuevo si nos venimos a Postman sería aquí mismo en Fortnite a y entonces tendríamos que pasar la parte nuevo si no le cambiamos el tipo antes no suele dejar vale a tipo file nuevo ahora lo marcaremos buscamos por aquí café Jason que lo tenemos por aquí haciendo la prueba del servicio que me comentaron interior competición con


![25-01](images/25-01.png)
![25-02](images/25-02.png)
![25-03](images/25-03.png)
![25-04](images/25-04.png)
![25-05](images/25-05.png)

# Contenido adicional 3

* [PDF Servicio_de_subida_de_ficheros.pdf](pdfs/22_Servicio_de_subida_de_ficheros.pdf)
* [PDF Implementación_de_la_subida_de_ficheros.pdf](pdfs/23_Implementación_de_la_subida_de_ficheros.pdf)
* [PDF Uso_del_servicio.pdf](pdfs/24_Uso_del_servicio.pdf)
