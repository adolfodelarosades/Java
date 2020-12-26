# 3. Manejo de errores y excepciones

* 14 Manejo básico de errores 14:40 
* 15 Modelo para la respuesta de un error 4:58 
* 16 Manejo de errores con @ExceptionHandler 12:25 
* 17 Manejo de errores con @ControllerAdvice (Parte I) 11:22 
* 18 Manejo de errores con @ControllerAdvice (Parte II) 8:06 
* 19 Novedades en Spring 5: ResponseStatusException 12:39 
* Contenido adicional 6

# 14 Manejo básico de errores 14:40 

[PDF Manejo_básico_de_errores.pdf](pdfs/13_Manejo_básico_de_errores.pdf)

## Resumen Profesor

La información sobre la anotación `@ResponseStatus` la puedes encontrar aquí :https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ResponseStatus.html.

## Transcripción

![14-01](images/14-01.png)

Vamos a continuar nuestro curso con un nuevo bloque en el que vamos a ir gestionando las posibles situaciones de error o de excepción que se nos pueden presentar, en esta lección vamos a hacer un manejo elemental de errores e iremos viendo como Spring nos ofrece diferentes alternativas para poder hacer dicha gestión.

![14-02](images/14-02.png)

La posibles situaciones de error que se nos pueden presentar pueden ser muy variopintas, algunas de ellas vendrán asociadas a la lógica de negocio, por ejemplo imaginemos que nosotros estamos gestionándo los usuarios y no queremos que se repita el nombre de usuario o el email o estamos haciendo un API dónde se gestionan ventas y entonces no queremos dar de alta una ventana vacía en la que no se compre ningún tipo de producto, esas serían situaciones de error asociadas a la lógica de negocio de nuestro sistema, otras también lo serán pero son mucho más comunes, por ejemplo el que vayamos a buscar un recurso, un elemento en nuestro caso por ejemplo un producto, véase por su ID o por algún atributo y que no lo encontremos, eso sería algo muy común, buscar un recurso o sobre un conjunto de recursos y no encontrarlos, es una situación que será bastante común. 

![14-03](images/14-03.png)

Hasta ahora el tratamiento que hemos hecho es francamente artesanal, si recordáis de las lecciones anteriores hemos ido modulando de alguna manera el `ResposeEntity` que se devolvía, para establecer nosotros el código y si no encontrábamos algo entonces estabamos devolviendo un error `404`, sin embargo eso no estaría excesivamente bien porque no nos deberíamos dedicar a eso, nos deberíamos dedicar a programar, a manejar situaciones excepcionales, posiblemente utilizando el mecanismo de Java y que fuese ese mecanismo de excepciones el que detectará, si no hemos encontrado un producto lanzamos una excepción de producto no encontrado y que a partir de eso se devuelva al cliente la respuesta más conveniente como un `404`, vamos a ver cómo podemos crear excepciones como en cualquier aplicación Java, las podemos aderezar un poco para que la respuesta que se vea sea con el código de respuesta que nosotros queramos.

![14-04](images/14-04.png)

Por ejemplo podríamos tener una excepción que fuera producto no encontrado, `ProductoNotFoundException` que suele ser un nombre común ese `NotFoundException` suele ser bastante habitual y en el que simplemente podríamos tener un constructor con un método que llame al constructor de la clase base `RuntimeException`  y qué le pasará un determinado mensaje muy sencillo, podríamos entrar en la internacionalización de estos mensajes a través de ficheros properties, yo los dejo a vosotros si queréis saber como internacionalizar podéis visitar el ***curso de Thymelife*** donde los elementos de internacionalización van a ser comunes y a través de las distintas propiedades poder ir rescatarlo, en este caso solo lo vamos a hacer simplemente en castellano y veremos cómo lo que esperamos que de alguna manera ese mensaje llegue al cliente creando una excepción cómo está, lo haremos ahora más adelante, esto nos podría venir bien para peticiones `GET`, peticiones `PUT` y peticiones `DELETE`.

![14-05](images/14-05.png)

Si lo implementamos vamos a ver como la respuesta al tratarse de una excepción será `500`, veíamos los códigos de respuesta por parte del servidor al cliente y veíamos que había un conjunto, yo os remitía al material adicional donde podéis encontrar una lista completa, les recuerdo que el conjunto `200` son respuesta correctas, el `OK`, `Created`, `Not Content` pero respuestas correctas, los de `400` eran errores por parte del cliente y lo de `500` errores de servidor, bueno en realidad aquí no es que se haya producido ningún tipo de error en el servidor, sino que simplemente no hay productos por el ID que hemos solicitado. Ya hemos visto que un código acertado serían `Not Found` el código con el número `404`, bueno pues vamos a ver cómo Spring tiene la solución para que aunque estemos lanzando una excepción se devuelva un código `404`.

![14-06](images/14-06.png)

A nivel elemental, es decir lo más básico que tiene Spring para que podamos hacer eso es la anotación `@ResponseStatus` que nos va a permitir anotar una excepción y cuando se lance esa excepción de alguna manera se va a capturar que la respuesta debe llevar un código de respuesta como el que le estamos proporcionando en la propia excepción, también podríamos añadir un mensaje, lo que pasa que aquí el mensaje lo estamos indicando dentro de la propia excepción así que por eso no lo vamos a hacer, pero anotando esta excepción, ahora lo vamos a hacer en un ejemplo, vamos a poder comprobar como el código de respuesta que obtendríamos sería un `404` y no un `500`, para ello vamos ir modificando el código que habíamos hecho en la lección anterior y en lugar de manejar con `if-else`y en función de una cosa u otra devolver dos tipos de `ResponseEntity` lo vamos a simplificar para que lo hagamos gestionando excepciones y de esa manera si por ejemplo no encontramos un producto devolvamos la excepción y sea la excepción la que devuelva la respuesta correcta.

### :computer: `143-05-ManejoBasicoErrores` Ejemplo para manejar Excepciónes

Partiendo del proyecto `143-04-ImplementacionDTO` vamos a hacer una copia y renombrar el proyecto como `143-05-ManejoBasicoErrores`

#### 01. Modificar `pom.xml`

Cambiar en el `pom.xml` el `artifactId` y el `name`

```html
...
<artifactId>143-05-ManejoBasicoErrores</artifactId>
<version>0.0.1-SNAPSHOT</version>
<name>143-05-ManejoBasicoErrores</name>
...
```

#### 02. Crear la Clase `ProductoNotFoundException`

Dentro del paquete `error` donde vamos ir poniendo cuestiones de error o de excepciones vamos a crear la clase `ProductoNotFoundException`.

`ProductoNotFoundException`

```java
@ResponseStatus(HttpStatus.NOT_FOUND)
public class ProductoNotFoundException extends RuntimeException{

   private static final long serialVersionUID = 1L;

   public ProductoNotFoundException(Long id) {
      super("No se puede encontrar el producto con el ID: " + id);
   }
}
```

Observaciones de `ProductoNotFoundException`

* Extiende a `RuntimeException`
* Añadimos el `serialVersionUID` por si la clase es serializable
* Creamos el constructor que recibe el ID del producto no encontrado y creamos un mensaje a partir de el.
* Anotamos la clase con `@ResponseStatus(HttpStatus.NOT_FOUND)` que nos permite indicar el estado `NOT_FOUND` que indicará que no hemos encontrado el producto.

De esta manera cuando devolvamos la excepción será un código `404` el que reciba el cliente.

#### 03. Modificar el Controlador 

![14-07](images/14-07.png)

Actualente tenemos nuestro método `obtenerUno` con el siguiente código:

```java
@GetMapping("/producto/{id}")
public ResponseEntity<?> obtenerUno(@PathVariable Long id) {
   Producto result = productoRepositorio.findById(id).orElse(null);
	if (result == null)
      return ResponseEntity.notFound().build();
   else
      return ResponseEntity.ok(result);
}
```

Lo vamos a refactorizar por lo siguiente:

```java
@GetMapping("/producto/{id}")
public Producto obtenerUno(@PathVariable Long id) {
   return productoRepositorio.findById(id)
              .orElseThrow(() -> new ProductoNotFoundException(id));
}
```

Observaciones.

* `findById(id)` nos devuelve un Optional por lo que si lo encuentra devolvemos el `Producto`
* Si no lo encuentra en lugar de usar el `.orElse(...)` normal, hay otro que es `.orElseThrow(...)`
* `.orElseThrow(...)` nos permite poder lanzar una excepción. 
* `.orElseThrow(...)` lo que espera es un `Supplier` es decir lo tenemos que realizar con una expresión lambda.
* Debemos devolver un `Producto` en lugar del `ResponseEntity` que usabamos antes.

Así que si encuentra el `Producto` lo devuelve con un código `200` y si no lanzará una excepción.

Vamos a comprobar que esto funciona y después hacemos el resto de cambios en el código.

![143-05-01](images/143-05-01.png)

Si nos venimos a Postman podríamos buscar el producto 4.

![143-05-01](images/143-05-01.png)

Lo encontraríamos perfectamente, si buscamos el 44.

![143-05-02](images/143-05-02.png)

Podemos ver cómo se ha producido una excepción, la respuesta es diferente nos da algo así como el momento en el que se produce la excepción, el código de estado, el error, el mensaje que le hemos proporcionado nosotros `"No se puede encontrar el producto con el ID: 44"`, y el `path` sobre el que se ha producido el error.

```html
{
   "timestamp": "2020-12-26T09:25:42.285+0000",
   "status": 404,
   "error": "Not Found",
   "message": "No se puede encontrar el producto con el ID: 44",
   "path": "/producto/44"
}
```

De esta manera podemos comprobar como estamos obteniendo un mensaje de error y el cliente lo podría aprovechar para incluso el mensaje `"No se puede encontrar el producto con el ID: 44"` poder imprimirlo al usuario, indicándole que no se han podido encontrar el producto con ese ID o alguna otra versión de este mismo mensaje.

El otro cambio que podemos hacer es sombre el método `editarProducto(...)` que actualmente lo tenemos así:

```java
@PutMapping("/producto/{id}")
public ResponseEntity<?> editarProducto(@RequestBody Producto editar, @PathVariable Long id) {

   return productoRepositorio.findById(id).map(p -> {
			p.setNombre(editar.getNombre());
			p.setPrecio(editar.getPrecio());
			return ResponseEntity.ok(productoRepositorio.save(p));
		}).orElseGet(() -> {
			return ResponseEntity.notFound().build();
   });
}
```

En lugar de devolver un `ResponseEntity` y hacer un `orElseGet(...)`, podemos cambiarlo por lo siguiente:

```java
@PutMapping("/producto/{id}")
public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {

   return productoRepositorio.findById(id).map(p -> {
			p.setNombre(editar.getNombre());
			p.setPrecio(editar.getPrecio());
			return productoRepositorio.save(p);
   }).orElseThrow(() -> new ProductoNotFoundException(id));
}
```

Observaciones:

* En caso de que lo encuentre en lugar de devolver el `ResponseEntity` devolvemos el `Producto` recien guardado.
* Si no lo encuentra devuelve un `ProductoNotFoundException`.
* El método ya no devuelve un `ResponseEntity` sino un `Producto`.

De esta forma si se encuentra el `Producto` se edita y se devuelve y sino lanzamos un `ProductoNotFoundException`.

Vamos a hacer también el codigo para el método `borrarProducto(...)` que actualmente lo tenemos así:

```java
@DeleteMapping("/producto/{id}")
public ResponseEntity<?> borrarProducto(@PathVariable Long id) {
   productoRepositorio.deleteById(id);
   return ResponseEntity.noContent().build();
}
```

Si queremos mamejar la situación de que no encontramos el `Producto` a eliminar vamos a cambiarlo como sigue:

```java
@DeleteMapping("/producto/{id}")
public ResponseEntity<?> borrarProducto(@PathVariable Long id) {
   Producto producto = productoRepositorio.findById(id)
				.orElseThrow(() -> new ProductoNotFoundException(id));
		
   productoRepositorio.delete(producto);
	return ResponseEntity.noContent().build();
}
```

Observaciones:

* Primero buscamos el `Producto` y si no lo encontramos devuelve un `ProductoNotFoundException`.
* Si lo encuentra lo elimina y devolvemos `ResponseEntity.noContent().build();`
* Estamos dejando como respuesta del método un `ResponseEntity` para la respuesta correcta.

Vamos a probar nuestros cambios.

Primero creamos un nuevo producto.

![143-05-03](images/143-05-03.png)

Ahora vamos a hacer el `PUT` para modificar el producto.

![143-05-04](images/143-05-04.png)

Si intentamos modificar un `Producto` que no existe tenemos:

![143-05-05](images/143-05-05.png)

Nos devuelve lo esperado.

Y si tratamos de eliminar el `Producto` 34

![143-05-06](images/143-05-06.png)

Lo elimina correctamente y si lo intento borrar nuevamente ya me devuelve un `404` que es lo correcto junto con el mensaje.

![143-05-07](images/143-05-07.png)

De esta manera como podemos comprobar podemos asociar el mecanismo de manejo de excepciones de Java cortocircuitandolo de determinada manera con Spring para que produzca una un mensaje, un código de respuesta más adecuada.

### :computer: Código Completo `143-05-ManejoBasicoErrores` Ejemplo para manejar Excepciónes

![143-05-08](images/143-05-08.png)

Vamos a poner solo el código de las clases nuevas o modificadas respecto al proyecto anterior.

`ProductoNotFoundException`

```java
package com.openwebinars.rest.error;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ProductoNotFoundException extends RuntimeException{

   private static final long serialVersionUID = 1L;

   public ProductoNotFoundException(Long id) {
      super("No se puede encontrar el producto con el ID: " + id);
   }
}
```

`ProductoController`

```java
package com.openwebinars.rest.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.openwebinars.rest.dto.CreateProductoDTO;
import com.openwebinars.rest.dto.ProductoDTO;
import com.openwebinars.rest.dto.converter.ProductoDTOConverter;
import com.openwebinars.rest.error.ProductoNotFoundException;
import com.openwebinars.rest.modelo.Categoria;
import com.openwebinars.rest.modelo.CategoriaRepositorio;
import com.openwebinars.rest.modelo.Producto;
import com.openwebinars.rest.modelo.ProductoRepositorio;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;
   private final CategoriaRepositorio categoriaRepositorio;
   private final ProductoDTOConverter productoDTOConverter;

   /**
    * Obtenemos todos los productos
    * 
    * @return 404 si no hay productos, 200 y lista de productos si hay uno o más
    */
   @GetMapping("/producto")
   public ResponseEntity<?> obtenerTodos() {
      List<Producto> result = productoRepositorio.findAll();

      if (result.isEmpty()) {
         return ResponseEntity.notFound().build();
      } else {

         List<ProductoDTO> dtoList = result.stream().map(productoDTOConverter::convertToDto)
					.collect(Collectors.toList());
         return ResponseEntity.ok(dtoList);
      }

   }

   /**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return 404 si no encuentra el producto, 200 y el producto si lo encuentra
    */
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      return productoRepositorio.findById(id)
				.orElseThrow(() -> new ProductoNotFoundException(id));
   }

   /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return 201 y el producto insertado
    */
   @PostMapping("/producto")
   public ResponseEntity<?> nuevoProducto(@RequestBody CreateProductoDTO nuevo) {
      // En este caso, para contrastar, lo hacemos manualmente
		
      // Este código sería más propio de un servicio. Lo implementamos aquí
      // por no hacer más complejo el ejercicio.
      Producto nuevoProducto = new Producto();
      nuevoProducto.setNombre(nuevo.getNombre());
      nuevoProducto.setPrecio(nuevo.getPrecio());
      Categoria categoria = categoriaRepositorio.findById(nuevo.getCategoriaId()).orElse(null);
      nuevoProducto.setCategoria(categoria);
      return ResponseEntity.status(HttpStatus.CREATED).body(productoRepositorio.save(nuevoProducto));
   }

   /**
    * 
    * @param editar
    * @param id
    * @return 200 Ok si la edición tiene éxito, 404 si no se encuentra el producto
    */
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {

      return productoRepositorio.findById(id).map(p -> {
			p.setNombre(editar.getNombre());
			p.setPrecio(editar.getPrecio());
			return productoRepositorio.save(p);
		}).orElseThrow(() -> new ProductoNotFoundException(id));
   }

   /**
    * Borra un producto del catálogo en base a su id
    * 
    * @param id
    * @return Código 204 sin contenido
    */
   @DeleteMapping("/producto/{id}")
   public ResponseEntity<?> borrarProducto(@PathVariable Long id) {
      Producto producto = productoRepositorio.findById(id)
				.orElseThrow(() -> new ProductoNotFoundException(id));
		
      productoRepositorio.delete(producto);
      return ResponseEntity.noContent().build();
   }

}
```

![14-08](images/14-08.png)

Llegado este punto os propongo como reto que podáis crear algún tipo de error más, por ejemplo uno que se lance cuando no haya productos en el catálogo y se solicite todos, es posible que podíamos devolver el `404`, podrían crear otra excepción que sería `CatalogoProductosVaciosException` o algo por el estilo o por ejemplo también podrían bien gestionar bien la creación de un nuevo producto y si hay algo, algún dato que esperamos y que no viene o algo por el estilo, crear una excepción también que devolviera el código correcto que en este caso sería un `Bad Request` un `400`. Esto como reto para que lo podáis ir haciendo vosotros.

En las siguientes lecciones de este bloque vamos a seguir manejando errores de otras maneras que nos ofrece Spring.

# 15 Modelo para la respuesta de un error 4:58 

[PDF Modelo_de_respuesta_para_un_error.pdf](pdfs/14_Modelo_de_respuesta_para_un_error.pdf)

## Resumen Profesor

### Modelo de error más complejo

Algunos autores, como `Bruno Leite`, proponen una implementación del modelo de respuesta más complejo como esta:

```java
class ApiError {

   private HttpStatus status;
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
   private LocalDateTime timestamp;
   private String message;
   private String debugMessage;
   private List<ApiSubError> subErrors;

   private ApiError() {
       timestamp = LocalDateTime.now();
   }

   ApiError(HttpStatus status) {
       this();
       this.status = status;
   }

   ApiError(HttpStatus status, Throwable ex) {
       this();
       this.status = status;
       this.message = "Unexpected error";
       this.debugMessage = ex.getLocalizedMessage();
   }

   ApiError(HttpStatus status, String message, Throwable ex) {
       this();
       this.status = status;
       this.message = message;
       this.debugMessage = ex.getLocalizedMessage();
   }
}
 
abstract class ApiSubError {

}

@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
class ApiValidationError extends ApiSubError {
   private String object;
   private String field;
   private Object rejectedValue;
   private String message;

   ApiValidationError(String object, String message) {
       this.object = object;
       this.message = message;
   }
}
```
## Transcripción

![15-01](images/15-01.png)

Vamos a seguir manejando errores en nuestra API REST, en este caso vamos a reflexionar un poco sobre la información que enviamos al cliente cuándo se produce un error, una excepción.

![15-02](images/15-02.png)

En el ejemplo anterior veíamos como podíamos utilizar con `@ResponseStatus(...)` determinadas excepciones y que se devolvierá un código de respuesta mas adecuado, pero la información que se devuelve en el mensaje de error por defecto lo fábrica Spring, contiene la *fecha*, el *estado*, el *nombre del error*, un *mensaje* y la *ruta* en la cual se ha producido. 

![15-03](images/15-03.png)

Podemos ver alguno como el anterior en el que nosotros habíamos modificado el mensaje, pero el resto de datos vienen tal cual. En realidad lo que nos está devolviendo es una especie de instancia de `DefaultErrorAttribute` que lo podemos ver en la [documentación oficial](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/web/servlet/error/DefaultErrorAttributes.html).

![15-11](images/15-11.png)

`DefaultErrorAttribute` es una clase que contiene todo lo que veniamos comentando. Tiene todos los campos de error que podemos ver en la imagen y es la implementación por defecto de la `Interface ErrorAttributes` que es la que utiliza Spring a la hora de devolver un error.

Una de las maneras que tendríamos lo podemos ver incluso más adelante de modificar lo que se devuelve como error sería hacer nuestra implementación de l`Interface ErrorAttributes` o extender la clase `DefaultErrorAttribute`. En este caso vamos a crear nosotros un modelo de error y lo haremos desde cero.

Nos interesaría customizarlo porque en realidad aquí hay determinados datos que bien son redundante como el tema de `404`, el `Not found` quizás si sea interesante pero el `404` lo podemos sacar desde el propio código de respuesta, la fecha viene en un formato que ciertamente es poco legible para nosotros.

![15-04](images/15-04.png)

Puede que nos interese customizarlo y agregar algunos campos nuevos, hacer algunos cambios, si estamos implementando un mecanismo de validación imaginos que mandamos un formulario entero en el cual se producen más de un error y queremos mandar de un golpe varios errores por que determinado campo lo han deja vacío y no debería o determinado campo numérico debería estar en un rango y no lo han puesto en su rango, nos podría interesar también tener una respuesta que tuviera adentro varios errores de alguna forma anidados o en alguna colección.

![15-05](images/15-05.png)

El modelo para un error que vamos implementar sería una clase plana de Java, de hecho vamos a poder utilizar Lombok si lo estimamos necesario y pondremos los campos que nosotros creamos conveniente.

![15-06](images/15-06.png)

Vamos a partir de un modelo base con el que solamente vamos a poner el *Estado* como en el de antes del `404` obviaríamos el número nos quedaríamos con el `Not Found`, ya digo el número lo podemos sacar del propio código de respuesta, la *Fecha* pero formateada de una forma adecuada a través de un `LocalDateTime` y un mensaje como `String`, ese sería un modelo en el que básicamente le podíamos decir este el tipo de error que ha sucedido en este momento con este mensaje de error. 

![15-07](images/15-07.png)

Podríamos pensar en algún modelo más complejo que incluyera además del *Estado* y la *Fecha* una lista de mensajes en lugar de indicar solamente un mensaje, como deciamos antes en una situación de validación podríamos devolver todos los mensajes de una vez y que el cliente ya se encargará de pintarlos.

![15-08](images/15-08.png)

Podríamos tener un modelo aún más complejo en el que tuviéramos varias clases anidadas, podríamos imaginarnos, aprovechando que las excepciones suelen tener también un mensaje corto y uno más largo, podríamos tener esos 2 mensajes, sobre todo por incluir el mensaje con mayor grado de descripción y tener una lista de sub-errores.

![15-09](images/15-09.png)

Y para cada sub-error pues posiblemente nos interesaría o bien definir uno Abstracto o tener uno Genérico o como decía tener uno Abstracto y crear subtipos, por ejemplo el de validación y en el que incluya, bueno esto ha sucedido en este objeto, sobre este campo o con determinado valor, toma este mensaje de validación, en el que lo podíamos dar de una forma un poco más completa.

![15-10](images/15-10.png)

Bueno pues vamos a ver en la próxima lección como incluirlo dentro de nuestro ejemplo, vamos a crear nuestro propio modelo para manejar las excepciones, en la respuesta que le vamos a dar al cliente y vamos a ver cómo implementarlo y cuál sería la respuesta que recibirían los clientes.

# 16 Manejo de errores con `@ExceptionHandler` 12:25 

[PDF ExceptionHandler.pdf](pdfs/15_ExceptionHandler.pdf)

## Resumen Profesor

La información sobre la anotación `@ExceptionHandler` la puedes encontrar aquí: https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/ExceptionHandler.html.

## Transcripción

![16-01](images/16-01.png)

Vamos a ver ahora en esta nueva lección cómo incorporar el modelo de error que teníamos antes y hacer el manejo de errores con `@ExceptionHandler`

![16-02](images/16-02.png)

Nuestro modelo de error que proponíamos en la clase anterior de manera teórica, lo vamos a implementar a través de una clase plana de Java, vamos a utilizar las anotaciones `@Getter` y `@Setter` de **Lombok** para poder incluirla y decíamos que iba a tener solamente tres atributos el `estado` que será el mensaje del Estado que podemos sacar de la enumeración `HttpStatus`, la `fecha` y hora y un `mensaje`. La fecha y hora aprovecharemos la ***anotaciones de Lombok*** `@JsonFormat` para indicar que la queremos obtener como un `String` con el patrón que indicamos a la derecha en pantalla el día barra mes barra año con cuatro cifras horas minutos y segundos que en el contexto por lo menos castellano a nivel europeo se utiliza mucho, lo podríamos cambiar si nuestro formato de hora fuese diferente lo podríamos cambiar en el patrón que utilizaría para enviarlo lo más acordé a lo que necesitamos, desde luego quizás sea un poco más interpretando que el formato que nos brinda por defecto Spring.

![16-03](images/16-03.png)

De manera que lo que buscamos sean errores de este tipo frente a los que veíamos en lecciones anteriores  donde el código de estado, bueno podemos aprovechar directamente la enumeración no tener que hacer una traducción, que bueno si alguien le interesara podría hacer una traducción de esa enumeración a algún otro texto, la fecha que podría ser con este formato día mes año hora minuto segundo y con el mensaje que sería el mismo de antes pero en un campo llamado mensaje.

![16-04](images/16-04.png)

Lo que tenemos que ver es cómo poder utilizar este modelo de excepción, como lo vamos a poder utilizar. Vamos a tener que tratar de encajar dos cosas, utilizar este mensaje personalizado y el tratamiento de excepciones y ellos lo vamos a hacer a través de la anotación `@ExceptionHandler` esa anotación aceptará un tipo o varios tipos de excepción y aunque una primera aproximación nos permite ubicarla en un método cualquiera del controlador, ya veremos que se puede poner en más sitios, en sitios quizás más adecuado y será la encargada de manejar las excepción de uno o varios tipos dependiendo de los que les hayamos asociados cuando se produzcan en un determinado controlador, esto nos va a permitir que el tratamiento de la excepción se cortocircuita, se haga a través de este método que hemos anotado con esta excepción y bueno pues ahí podemos hacer lo que estime conveniente como por ejemplo devolver una respuesta con el tipo de error que hemos definido antes.

![16-05](images/16-05.png)

Lo podemos hacer anotando un método del controlador, decir también que puede tener una firma bastante variopinta, es decir que lo podemos encontrar recibiendo diferentes tipos de argumento y devolviendo diferentes tipos de datos, puede recibir una instancia de una excepción que se haya producido, la propia excepción que queremos en ese sentido cortocircuitar y capturar, los objetos de petición y respuesta por si queremos sacar algo de información de la petición, aportar algo a la respuesta, si tenemos sesiones activas los objetos de sesión, si nos manejamos en un entorno internacionalizado el `Locale` para saber el idioma en el que se ha producido ese error.

![16-06](images/16-06.png)

Y como tipo de retorno puede volver vacío en un contexto en el que usemos un motor de plantillas cómo  Thymeleaf objetos `Model`, `ModelAndView`, `Map` que se utilizan, puede devolver una cadena de caracteres, puede devolver algo anotado con `@ResponseBody` o incluso un `HTTPEntity` o `ResponseEntity` y que será para nosotros francamente comodo. 

![16-07](images/16-07.png)

En definitiva vamos a ver qué podemos añadir a nuestro proyecto lo que vamos a hacer es tener dos métodos `handleProductoNotFoundException` para manejar excepciones de productos no encontrados y vamos a manejar otra excepción que aunque no sea nuestra también se puede producir que son errores en el Parseo a la hora de crear o editar un producto, a la hora de serializar o deserializar podemos encontrar algún tipo de problema, todo ello produciría un error de tipo `JsonMappingException` vamos a ver como capturarla y que entoces el error que produzca sea el que a nosotros nos pueda interesar.


### :computer: `143-06-ExceptionHandler` Manejo de errores con `@ExceptionHandler`

Partimos del proyecto `143-05-ManejoBasicoErrores` y realizamos una copia y le llamaremos `143-06-ExceptionHandler`.

#### 01. Modificar el `pom.xml`

```html
<artifactId>143-06-ExceptionHandler</artifactId>
<version>0.0.1-SNAPSHOT</version>
<name>143-06-ExceptionHandler</name>
<description>Ejemplo de manejo de errores con ExceptionHandler</description>
```

#### 02. Crear la Clase `ApiError`

Dentro del paquete `error` creamos la clase `ApiError`

`ApiError`

```java
@Setter @Getter
public class ApiError {
	
   private HttpStatus estado;
	
   @JsonFormat(shape = Shape.STRING, pattern="dd/MM/yyyy hh:mm:ss")
   private LocalDateTime fecha;
	
   private String mensaje;

}
```

Observaciones de `ApiError`

* Anotada con `@Setter` y `@Getter` de Lombok
* Usamos la anotación ` @JsonFormat` para dar un formato a nuestro `LocalDateTime`


Ya veríamos si nos puede interesar agregar un `Builder` o un constructor lo podríamos hacer si nos interesa más adelante.

#### 03. Modificar el Controlador

Vamos a añadir los métodos anotados con `@ExceptionHandler(...)`

```java
@ExceptionHandler(ProductoNotFoundException.class)
public ResponseEntity<ApiError> handleProductoNoEncontrado(ProductoNotFoundException ex) {
   ApiError apiError = new ApiError();
   apiError.setEstado(HttpStatus.NOT_FOUND);
   apiError.setFecha(LocalDateTime.now());
   apiError.setMensaje(ex.getMessage());
   return ResponseEntity.status(HttpStatus.NOT_FOUND).body(apiError);
}
```

Método `handleProductoNoEncontrado`

En el momento que se produzca una excepción del tipo `ProductoNotFoundException` en lugar de hacer el tratamiento de errores por defecto se vendrá a este método, pasará la excepción como argumento y regresamos una respuesta del tipo `ResponseEntity`.

* Anotado con `@ExceptionHandler(ProductoNotFoundException.class)`
* Retorna un `ResponseEntity<ApiError>`
* Recibe una excepción de tipo  `ProductoNotFoundException`
* Creamos el objeto `ApiError` y asignamos los valores a sus atributos
* Devolvemos un `ResponseEntity` con un estado `HttpStatus.NOT_FOUND` y en el cuerpo devolvemos el `apiError` que creamos.

De esta manera ahora comprobaremos que cuando vayamos a buscar un producto y no se encuentre, el error en lugar de ser el que veniamos teniendo hasta este momento será este que acabamos de definir.

Si volvemos a Postman este es el mensaje que mostrabamos antes:

![143-06-01](images/143-06-01.png)

Si probamos nuestro nueva aplicación al hacer lo mismo obtendremos lo siguiente:

![143-06-02](images/143-06-02.png)

La respuesta ya esta totalmente personalizada a nuestro gusto.

```json
{
    "estado": "NOT_FOUND",
    "fecha": "26/12/2020 03:05:35",
    "mensaje": "No se puede encontrar el producto con el ID: 34"
}
```

Vamos a realizar la implementación del otro método `handleJsonMappingException` el cual se va a parecer mucho.

```java
@ExceptionHandler(JsonMappingException.class)
public ResponseEntity<ApiError> handleJsonMappingException(JsonMappingException ex) {
   ApiError apiError = new ApiError();
   apiError.setEstado(HttpStatus.BAD_REQUEST);
   apiError.setFecha(LocalDateTime.now());
   apiError.setMensaje(ex.getMessage());
   return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(apiError);
}
```

Método `handleJsonMappingException`

* Anotado con `@ExceptionHandler(JsonMappingException.class)`
* Retorna un `ResponseEntity<ApiError>`
* Recibe una excepción de tipo  `JsonMappingException`
* Creamos el objeto `ApiError` y asignamos los valores a sus atributos
* Devolvemos un `ResponseEntity` con un estado `HttpStatus.BAD_REQUEST` y en el cuerpo devolvemos el `apiError` que creamos.

Ambos métodos son tan parecidos que nos da la pista para en un futuro optimizar nuestro código.

Vamos a probar nuestra aplicación en Postman comprobando que si damos de alta un producto correcto no pasaría nada.

![143-06-03](images/143-06-03.png)

Pero si en lugar de pasar un Producto correcto pasamos uno incorrecto donde los campos númericos los pasamos como `String` se nos indica lo siguiente:

![143-06-04](images/143-06-04.png)


Se nos produce un `BAD_REQUEST` donde el mensaje es el que se nos da por defecto:

```sh
"mensaje": "Cannot deserialize value of type `long` from String \"UNO\": not a valid Long value\n at [Source: (PushbackInputStream); line: 4, column: 19] (through reference chain: com.openwebinars.rest.dto.CreateProductoDTO[\"categoriaId\"])"
```

Es un mensaje de la propia librería Jackson de la excepción `JsonMappingException` que de alguna manera nos esta devolviendo este mensaje de error. Podríamos crear nosotros una excepción que la extendiera y así también customizar el mensaje de error para que fuera lo más adecuado posible.

Hasta aquí poco a poco vamos mejorando nuestro modelo de error, el tratamiento de errores, en las próximas lecciones vamos a ver que más alternativas para este tratamiento de errores nos ofrece Spring.

# 17 Manejo de errores con `@ControllerAdvice` (Parte I) 11:22 

[PDF ControllerAdvice.pdf](pdfs/16_ControllerAdvice.pdf)

## Resumen Profesor

La información sobre la clase `ResponseEntityExceptionHandler` la puedes encontrar aquí: https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/servlet/mvc/method/annotation/ResponseEntityExceptionHandler.html

## Transcripción
![17-01](images/17-01.png)


Vamos a continuar manejando los errores de nuestra API REST con Spring Boot y en este caso lo vamos a hacer utilizando `@ControllerAdvise`.

![17-02](images/17-02.png)

Hasta ahora hemos podido manejar excepciones lo cual ha estado bien, nuestro mensaje de error es personalizado y entonces nos podemos preguntar ¿y que nos falta? bueno el tema es que `@ExceptionHandler` ***solo nos permite manejar las excepciones que se escriben en ese controlador*** tal y como lo hemos planteado en la lección anterior, entonces si quisiéramos hacer una gestión global de errores, si tuviéramos diferentes controladores que en algún caso utilizan los productos, imaginado el propio controlador de producto y el controlador de ventas, y en las ventas necesitamos buscar algún tipo de producto también, utilizando el mismo servicio pero en controladores diferentes, allí el manejo del producto no encontrado debería ser el mismo, no deberíamos de tener porque replicar el manejo de error en uno y en otro y en otro controlador, porque eso sería inmantenible. Necesitamos de alguna manera una gestión global de errores. Si utilizamos `@ExceptionHandler` a nivel de un método de un controlador solamente funcionar allí.

![17-03](images/17-03.png)

Vamos a ver como la anotación `@ControllerAdvise` nos va a permitir aportar esa gestión global, se trata de una especialización de la anotación `@Component` que está orientada a tener métodos anotados a su vez con `@ExceptionHandler` que serán los que nosotros utilizamos y alguna otra anotación.

Existe también la especialización `@RestControllerAdvise` de hecho será la que utilicemos, sería también la combinación al igual que pasaba con `@RestController` es la combinación de `@ControllerAdvise` y `@ResponseBody` pensando en que lo que devuelvan los métodos será algo que se devuelva directamente al cliente.

Para manejar una determinada excepción, cómo estás clases podrán tener varios métodos, lo que hará Spring será el primer método que encuentre dentro de esa clase que esté anotado para tratar esa excepción será quién lo trate, ***tenemos que ser cuidadoso en ese sentido, en el orden.*** 

![17-04](images/17-04.png)
AQUIIIII
Podríamos tener más de una claseanotada con `@ControllerAdvise` si queremos tener diferentes prioridades o un orden determinado e indeterminado caso utiliza siempre y si no está otra y está otra podríamos anotar las con order of priority para que bueno pues pudiéramos establecer una secuencia en ese tratamiento de errores una presidencia y también tendremos que tener cuidado en las jerarquías de errores no por si estamos tratando antes la excepción qué es una excepción por ejemplo más general y entonces a lo mejor no va a entrar nunca hacer el tratamiento de un FileNotFoundException qué es no pues de alguna manera una hija de esta primera no de ellos de excepción tenemos que ser cuidadoso en el diseño de nuestras clases con controller advice or red controlled by y cómo van a hacer el tratamiento de él indicamos nada controller advice o red 3 controller advice Spain está notación hará que se traten las excepciones de cualquier controlador pero es verdad que lo podemos acotar lo podemos acotar a través de el nombre del paquete como como una cadena de caracteres vale las dos primeras son equivalentes con beige para kids el control a la Paix afectara al paquete de esta clase vale conecta con esta notación sino con los tipos que le podamos listar aquí o con aquellos controladores que tengan una determinada anotación como por ejemplo hoy puede darle tratamiento si tenemos controladores red y controladores normal es darle tratamiento solamente a los controladores que sean de tipo rescordera pero también lo podríamos hacer nosotros haremos un tratamiento para en principio todos los controladores que tengamos pero ya digo que podríamos acotar el uso que se pueda tener hola a todos vamos a continuar manejando lo errores de nuestra aburres con el Facebook y en este caso no vamos a hacer utilizando control era para ya está ahora hemos podido manejar es precioso para salud en nos lo mensaje de error es personalizado y entonces no podemos preguntar y que no jaja bueno el tema es que excepción Henderson no permite manejar las que se tiene que se escribe en ese controlador tal y como no hemos planteado en el la lección anterior entonces y quisiéramos hacer una gestión lo Valderrobres tuviéramos diferente controladores que en algún caso utilizar a producto imaginaba propio controlador de producto y el controlador de Versalles la ventaja necesitamos buscar algún tipo de productos también utilizando mismo servicio pero controladores diferente por a ir manejo del producto en encontrado de varios ser muy buenos deberíamos de tener porque réplica del manejo de error en uno y en otro y no te controlador porque su sería y mantener necesitamos de alguna manera la gestión global de errores y utilizamos excepción caldera nivel de un método controlado solamente funcionará bueno pues vamos a ver cómo la natación control estáis no va a permitir aportar esa gestión lugar se trata de una especialización de la anotación arroba componentes orientada a tener métodos a notado a su vez con excepción Harlem que será lo que nosotros empezamos y alguna otra anotación vale besitos también las tres habitaciones control era para ir al que podríamos utilizar hecho será la de utilizamos sería también la combinación al igual que pasaba con tres controles pues es la la combinación de control de la Paz si tres polvo día de pensando en que lo que devuelvan los métodos era algo que se devuelva directamente al cliente para manejar una determinada extensión como está la suegra no tener varios métodos lo que hará será lo creas trincheras el primer método que encuentre metro de esa clase que sea notado para trabajar la para tratar esa sección será que no te la cena tenemos que ser cuidadoso m s sentido en enorme podríamos tener más de una clase no está la con control de la vais si queremos tener diferente felicidades un orden he terminado de terminar unas utilizar para siempre si no está otra dictado trapo veremos a notar la honor de ser un poco frío ni ti para que bueno pues pudiéramos estar de ser una secuencia en eso tratamiento de terror es una presencia y también tendremos que tener cuidado en la jerarquía de errores no es por si estamos tratando antes la yo esté tío crea un s siempre Campomar general y y entonces a lo mejor no va a entrar nunca hacer el tratamiento de un fallo son excepción que no puede dar una manera una hija de p*** primera no me has leído que yo tengo que ser cuidados en el diseño de nuestra clase con control de nada y Torres controle gafas y cómo van a ser el el tratamiento de sino indica por nada controlar Advisor S3 controlar Advanced está noche a cenar a que se trata la sesión es de cualquier controlador empresa que lo podemos aportar no podemos aportar a través de él nombre del paquete como como una cadena de caracteres vale la tos primeras son equivalentes con veis Paqui se le controla la paisajes Arahal paquete de Bea clase malecón está con ella natación si no por los tipos de que le podamos estar aquí o con la que yo controladores de tengan una determinada natación como por ejemplo hoy pues dale tratamiento sin el controlador eres y hola a todos vamos a continuar manejando lo errores de nuestra aburres con el Facebook y en este caso no vamos a hacer utilizando control era para ya está ahora hemos podido manejar es precioso para salud en nos lo mensaje de error es personalizado y entonces no podemos preguntar y que no jaja bueno el tema es que excepción Henderson no permite manejar las que se tiene que se escribe en ese controlador tal y como no hemos planteado en el la lección anterior entonces y quisiéramos hacer una gestión lo Valderrobres tuviéramos diferente controladores que en algún caso utilizar a producto imaginaba propio controlador de producto y el controlador de Versalles la ventaja necesitamos buscar algún tipo de productos también utilizando mismo servicio pero controladores diferente por a ir manejo del producto en encontrado de varios ser muy buenos deberíamos de tener porque réplica del manejo de error en uno y en otro y no te controlador porque su sería y mantener necesitamos de alguna manera la gestión global de errores y utilizamos excepción caldera nivel de un método controlado solamente funcionará bueno pues vamos a ver cómo la natación control estáis no va a permitir aportar esa gestión lugar se trata de una especialización de la anotación arroba componentes orientada a tener métodos a notado a su vez con excepción Harlem que será lo que nosotros empezamos y alguna otra anotación vale besitos también las tres habitaciones control era para ir al que podríamos utilizar hecho será la de utilizamos sería también la combinación al igual que pasaba con tres controles pues es la la combinación de control de la Paz si tres polvo día de pensando en que lo que devuelvan los métodos era algo que se devuelva directamente al cliente para manejar una determinada extensión como está la suegra no tener varios métodos lo que hará será lo creas trincheras el primer método que encuentre metro de esa clase que sea notado para trabajar la para tratar esa sección será que no te la cena tenemos que ser cuidadoso m s sentido en enorme podríamos tener más de una clase no está la con control de la vais si queremos tener diferente felicidades un orden he terminado de terminar unas utilizar para siempre si no está otra dictado trapo veremos a notar la honor de ser un poco frío ni ti para que bueno pues pudiéramos estar de ser una secuencia en eso tratamiento de terror es una presencia y también tendremos que tener cuidado en la jerarquía de errores no es por si estamos tratando antes la yo esté tío crea un s siempre Campomar general y y entonces a lo mejor no va a entrar nunca hacer el tratamiento de un fallo son excepción que no puede dar una manera una hija de p*** primera no me has leído que yo tengo que ser cuidados en el diseño de nuestra clase con control de nada y Torres controle gafas y cómo van a ser el el tratamiento de sino indica por nada controlar Advisor S3 controlar Advanced está noche a cenar a que se trata la sesión es de cualquier controlador empresa que lo podemos aportar no podemos aportar a través de él nombre del paquete como como una cadena de caracteres vale la tos primeras son equivalentes con veis Paqui se le controla la paisajes Arahal paquete de Bea clase malecón está con ella natación si no por los tipos de que le podamos estar aquí o con la que yo controladores de tengan una determinada natación como por ejemplo hoy pues dale tratamiento sin el controlador eres y controladores normal es tan de tratamiento solamente a los controladores que ser de ti por recordármelo podemos estar


```java
```




![17-05](images/17-05.png)
![17-06](images/17-06.png)
![17-07](images/17-07.png)
![17-08](images/17-08.png)
![17-09](images/17-09.png)

# 18 Manejo de errores con `@ControllerAdvice (Parte II)` 8:06 

[PDF Controller_Advice_II.pdf](pdfs/17_Controller_Advice_II.pdf)

## Resumen Profesor

No existe.

## Transcripción

![18-01](images/18-01.png)
![18-02](images/18-02.png)
![18-03](images/18-03.png)
![18-04](images/18-04.png)

# 19 Novedades en Spring 5: ResponseStatusException 12:39 

[PDF ResponseStatusException.pdf](pdfs/18_ResponseStatusException.pdf)

## Resumen Profesor

La información sobre la clase `ResponseStatusException` la puedes encontrar aquí: https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/server/ResponseStatusException.html.

Puede ser interesante fijarse en algunas de sus subclases:

* `MediaTypeNotSupportedStatusException`: excepción que encaja con el código de respuesta 415.
* `MethodNotAllowedException`: excepción que encaja con el código de respuesta 405.
* `NotAcceptableStatusException`: excepción que encaja con el código de respuesta 406
* `ServerErrorException`: excepción para el código 500 que expone información extra.
* `ServerWebInputException`: excepción que encaja con el código de respuesta 400 para ser usada en aplicaciones web.
* `UnsupportedMediaTypeStatusException`: excepción que encaja con el código de respuesta 415.

## Transcripción

![19-01](images/19-01.png)
![19-02](images/19-02.png)
![19-03](images/19-03.png)
![19-04](images/19-04.png)
![19-05](images/19-05.png)
![19-06](images/19-06.png)
![19-07](images/19-07.png)
![19-08](images/19-08.png)
![19-09](images/19-09.png)
![19-10](images/19-10.png)

# Contenido adicional 6

* [PDF Manejo_básico_de_errores.pdf](pdfs/13_Manejo_básico_de_errores.pdf)
* [PDF Modelo_de_respuesta_para_un_error.pdf](pdfs/14_Modelo_de_respuesta_para_un_error.pdf)
* [PDF ExceptionHandler.pdf](pdfs/15_ExceptionHandler.pdf)
* [PDF ControllerAdvice.pdf](pdfs/16_ControllerAdvice.pdf)
* [PDF Controller_Advice_II.pdf](pdfs/17_Controller_Advice_II.pdf)
* [PDF ResponseStatusException.pdf](pdfs/18_ResponseStatusException.pdf)
