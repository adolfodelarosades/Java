# 2. Primer servicio REST con Spring Boot 76m

* 08 Mi primer servicio REST 9:33 
* 09 Puesta en marcha de la aplicación 7:48 
* 10 Estructura de las rutas 15:31 
* 11 Clases y anotaciones de Spring 14:25 
* 12 Uso del patrón Data Transfer Object (DTO) 11:25 
* 13 Implementando DTO con ModelMapper 17:58 
* 14 Contenido adicional 6
* 15 Manejo de errores y excepciones 64m

# 08 Mi primer servicio REST 9:33 

[PDF Mi_primer_servicio_REST.pdf](pdfs/07_Mi_primer_servicio_REST.pdf)

## Resumen Profesor

### Ejemplo

El ejemplo que se utiliza en esta lección está accesible desde la web de Spring en la siguiente url: https://spring.io/guides/gs/rest-service/.

También se puede descargar desde dentro del propio IDE, a través de *New > Import Spring Getting Started Content* y seleccionando **Rest Service**.

## Transcripción

<img src="images/08-01.png">
<img src="images/08-02.png">
<img src="images/08-03.png">
<img src="images/08-04.png">
<img src="images/08-05.png">
<img src="images/08-06.png">
<img src="images/08-07.png">
<img src="images/08-08.png">

Hola todo vamos a comenzar el segundo bloque íbamos a crear nuestra primera pirre vale nuestro primer servicio repara ello nos vamos a ir a la fuente vale nos vamos a ir directamente a la web de Sprint o directamente desde nuestro spring tool suite y vamos a ver un ejemplo muy básico que vamos a ir desgranando poco a poco de hecho vamos a traernos el código completo y lo vamos a ir analizando para aprender los distintos elementos que lo componen y en las siguientes lecciones bueno pues poder crearlo por nuestra cuenta ya digo desde esta web URL que podemos visitar pues tendríamos la posibilidad si queréis lo podemos buscar encontrar valen friv.io la tía y este primero cómo construir un servicio web vale ser hay que vayamos trabajando traernos el código de Spring tool suite no podríamos hacer así nos venimos a file mío import spring Getting Started content y lo podríamos buscar aquí sería si buscamos resto si no mal recuerdo es red service vale es el que no seríamos y nos traemos solamente el código completo vale le damos a fini no importaría no abre una ventana incluso con el tutorial no nos va a hacer falta y tendríamos el código fuente disponible por aquí vale cómo ir de gran ando lo poquito a poco vale primero nos vamos a lo que vamos a hacer vamos a implementar una aplicación de servidor que va a aceptar peticiones que en una determinada ruta barra griten y que nos va a devolver un Jason como este que tenemos aquí un mensaje de respuesta que vas a tener un nivel que va a ser de tipo numérico un lobo y un mensaje en una cadena de caracteres petición respuesta como hemos ido viendo y en una determinada en un determinado paz en una determinada URL devolveremos un Jason le proporcionamos como parámetro opcional name vale a este greeting de manera que podríamos tener una URL como está de abajo no con el de Niuserre cambiaremos en lugar de decir hola mundo Hello World haremos de manera que lo podemos cambiar la interacción cómo podemos ver va a ser hacer peticiones a barra crítico a localhost 2.80 que no te se va a ejecutar el servidor barras greeting y como respuesta deberíamos obtener un código 200 o que tiene el cuerpo de la respuesta deberíamos tener un Jason como el que hemos visto antes si pasamos el nene pues con el hello y el name en particular sino hello corto el objeto además llevará un nivel que veremos cómo se va incrementándose hacemos más de una petición este modelo de datos vamos a tener una clase modelo greeting vale que ya incluso la podemos ver por aquí y que incluye solamente los datos que sería un IDE y un contenido de tipo String y además tendríamos un controlador que para aquellos que tenga y algunos conocimientos de Spring MVC bueno puedo llamar a la atención que en lugar de ser con el robot controller vale esto ya lo comentamos también antes era@red controles esto es la combinación de Arroba controles y a robar responsebody tenemos también la versión con request mapping yo que tengo son arlyne me hace algunos análisis del código que voy poniendo y entonces no no invita que pongamos aquí el método no es obligatorio porque con el método que tiene por defecto no sería obligatorio lo podríamos poner esto esta manera como valió vale y el método o incluso podríamos ya lo tendríamos el método indicado o incluso podríamos hacerlo con la notación es Martín que francamente además podemos ver cómo este método para recibir un parámetro en la URL que será el parámetro name lo inyectamos con Rico es para vale recoger a de la parte query de la URL algo llamado name in os lo intentará aquí si no lo encuentras no inyectar a un valor por defecto que será vale y nos lo ingresará directamente aquí para que lo podamos utilizar en este mes no como decíamos como se devuelve Jason 7m todos está haciendo aquí un reto un de un objeto de tipo gripe bueno pues podemos verlo por aquí controles la combinación de controles y responsebody esta última lo que hace devolver en el método vale lo que se devuelven el método mejor dicho como cuerpo de la respuesta si recordáis el formato de los mensajes de respuesta como un cajón que tenía las cabeceras y el cuerpo pues dentro del cuerpo lo que se hace poner lo que nosotros devuelvan lo que pasa que pasa antes por el filtro de un HTTP mensaje Converter que lo que hace es transformarlo en un objeto Java Asia o un objeto de tipo Jason vale a una cadena estoy poniendo vamos a probar a ponerlo en ejecución puerto 8080 y en primera instancia podríamos comprobarlo desde el propio navegador localhost 8080 greeting y aquí tendríamos nuestro hello-world vale cómo podemos ver la creación de un servicio es bastante sencillo no es tan solo necesitaríamos tener una clase controladora anotada con red controller en la que tengamos algunos métodos anotado bien con request mapping y el método correspondiente cómo podría ser con quién muffin post mapping with mapping Odile te maten y en el cual pues podamos atender peticiones que recibirán o no alguna serie de argumentos y en la que podamos devolver valores que bueno dentro de está dentro de este método estamos devolviendo una clase Java que serán transformadas a través de un HTTP mensaje Converter aunque tengamos solamente el navegador y le damos a inspeccionar Network y hacemos y recargamos podríamos ver que ha sucedido por aquí detrás y si pinchamos en greeting vale si voy un poco regular sabemos algo más pero podemos ver como el navegador por detrás recibido todas en esa petición GET ha enviado alguna serie de elementos y ha recibido en la respuesta vale aquí tendremos un preview de lo que sería y aquí tendríamos incluso los encabezados de la respuesta así como de la petición vale como lo ha ido gestionando el propio navegador para que veamos que bueno que es que todo eso va sucediendo de verdad todas las anotaciones que hemos visto antes se van se van utilizando tanto vamos todas las los encabezados tanto en peticiones como en el tipo de contenido la fecha vale el código de estado 200 y no lo ponen verde como que lo que nosotros hemos enviado como parte de la petición vale algunas de ellas la íbamos viendo antes para que veamos que esto ha sucedido conforme a nosotros lo hemos lo hemos programado hasta aquí nuestro primer servicio vamos a ver ahora como con posma como cliente el lugar del propio navegador cómo poder interactuar con el

# 09 Puesta en marcha de la aplicación 7:48 

[PDF Puesta_en_marcha_de_la_aplicación.pdf](pdfs/08_Puesta_en_marcha_de_la_aplicación.pdf)

## Resumen Profesor

### Ejecución de la aplicación

Para ejecutar la aplicación desde el terminal, debemos ejecutar desde el directorio raíz de la misma:

```sh
mvn clean
mvn install
mvn spring-boot:run
```

## Transcripción

# 10 Estructura de las rutas 15:31 

[PDF Estructura_de_las_rutas.pdf](pdfs/09_Estructura_de_las_rutas.pdf)

## Resumen Profesor

### Mapeo de verbos HTTP a operaciones CRUD

Verbo HTTP | Anotación Spring | Operación CRUD
-----------|------------------|---------------
GET | `@GetMapping` | Read
POST | `@PostMapping` | Create
PUT | `@PutMapping` | Update
DELETE | `@DeleteMapping` | Delete

### Lombok en controladores y servicios

Desde la versión 5 de Spring, podemos ahorranos el uso de la anotación `@Autowired` para realizar la inyección automática entre beans. De hecho, la inyección por constructor sería a día de hoy la más recomendable.

Si unimos esto último, con el uso de Lombok, podemos *ahorrarnos* escribir los constructores de nuestras clases servicio, controladores, etc… si en ellos solo vamos a hacer una asignación o inicialización de los atributos en los cuales queremos inyectar la dependencia. Podemos aprovechar la potencia de lombok, a través de su anotación `@RequiredArgsConstructor`, para que sea quién se encargue de generar dicho constructor, y después Spring lo utilice para realizar la inyección automática.

```java
@RestController
@RequiredArgsConstructor
public class ProductoController {

    private final ProductoRepositorio productoRepositorio;

    // Resto del código

}
```

## Transcripción

# 11 Clases y anotaciones de Spring 14:25 

[PDF Algunas_clases_y_anotaciones.pdf](pdfs/10_Algunas_clases_y_anotaciones.pdf)

## Resumen Profesor

### Clases `HttpEntity`, `RequestEntity` y `ResponseEntity`

* `HttpEntity: representa una petición o respuesta HTTP, consistente en una serie de encabezados y un cuerpo.
* `RequestEntity: extensión de HttpEntity que añade un método (verbo HTTP) y una URI
* `ResponseEntity: extensión de HttpEntity que añade un código de respuesta (HttpStatus).

### Códigos de respuesta según petición

Verbo HTTP | Código operación correcta | Código operación incorrecta
-----------|---------------------------|----------------------------
GET	| `200 OK` | 404 Not Found
POST| `201 Create` | 	 
PUT	| `200 OK` | 404 Not Found
DELETE | `204 No Content` | 	 

## Transcripción

# 12 Uso del patrón Data Transfer Object (DTO) 11:25 

[PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 13 Implementando DTO con ModelMapper 17:58 

[PDF DTO_con_ModelMapper.pdf](pdfs/12_DTO_con_ModelMapper.pdf)

## Resumen Profesor

La dependencia a añadir en el `pom.xml` es:

```html
<dependency>
   <groupId>org.modelmapper</groupId>
   <artifactId>modelmapper</artifactId>
   <version>2.3.5</version>
</dependency>
```

Si queremos buscar la última dependencia disponible, podemos mirar en https://mvnrepository.com/artifact/org.modelmapper/modelmapper.

### Estrategia de asignación de propiedades

ModelMapper incluye tres tipos de estrategia a la hora de asignar valores entre clases:

* `Standard`: es la estrategia por defecto. Permite que las propiedades de origen coincidan de forma inteligente con las de destino.
* `Loose`: la estrategia flexible permite que las propiedades de origen coincidan libremente con las de destino.
* `Strict`: la estrategia estricta permite una precisión completa, asegurando que no se produzcan ambigüedades.

Para cambiar la estrategia, podemos usar el siguiente código:

```java
modelMapper.getConfiguration()
  .setMatchingStrategy(MatchingStrategies.LOOSE);
```

### Ajustando manualmente la transformación

En ocasiones, nos interesará ajustar manualmente la transformación entre dos objetos, bien porque no queramos cambiar la estrategia para todos los atributos, o porque se trate de una asignación muy particular. Para ello tenemos varios mecanismos, pero uno de ellos a través de la creación de un `PropertyMap<S,D>`.

Por ejemplo, si en nuestro ejemplo queremos que la clase DTO quede como sigue:

```java
@Getter
@Setter
public class ProductoDTO {

    private long id;
    private String nombre;
    private String categoria;

}
```

Podemos realizar *manualmente* la transformación de `categoria.nombre` en `Producto` a `categoria` en `ProductoDTO`. Para ello, podemos añadir este código en nuestro componente de conversión:

```java
@Component
@RequiredArgsConstructor
public class ProductoDTOConverter {

    private final ModelMapper modelMapper;


    @PostConstruct
    public void init() {
        modelMapper.addMappings(new PropertyMap<Producto, ProductoDTO>() {

            @Override
            protected void configure() {
                map().setCategoria(source.getCategoria().getNombre());
            }
        });
    }

    public ProductoDTO convertToDto(Producto producto) {
        return modelMapper.map(producto, ProductoDTO.class);

    }

}
```

## Transcripción

# 14 Contenido adicional 6

* [PDF Mi_primer_servicio_REST.pdf](pdfs/07_Mi_primer_servicio_REST.pdf)
* [PDF Puesta_en_marcha_de_la_aplicación.pdf](pdfs/08_Puesta_en_marcha_de_la_aplicación.pdf)
* [PDF Estructura_de_las_rutas.pdf](pdfs/09_Estructura_de_las_rutas.pdf)
* [PDF Algunas_clases_y_anotaciones.pdf](pdfs/10_Algunas_clases_y_anotaciones.pdf)
* [PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)
* [PDF DTO_con_ModelMapper.pdf](pdfs/12_DTO_con_ModelMapper.pdf)
