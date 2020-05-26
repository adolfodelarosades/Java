# 3. Modelos de datos más complejos 77m

* 07 Uso del patrón DTO en peticiones y respuestas 15:31 
* 08 Ajustando nuestras clases con JSONView 11:42 
* 09 Asociaciones many-to-one 8:42 
* 10 Asociaciones one-to-many 24:31 
* 11 Asociaciones many-to-many 17:13 
* Contenido adicional 5

# 07 Uso del patrón DTO en peticiones y respuestas 15:31 

[PDF Patrón_DTO_en_peticiones_y_respuetas.pdf](pdfs/05_Patrón_DTO_en_peticiones_y_respuetas.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 08 Ajustando nuestras clases con JSONView 11:42 

[PDF 06_JsonViews.pdf](pdfs/06_JsonViews.pdf)

## Resumen Profesor

### JsonView

*El ejemplo que se muestra a continuación se propone en el artículo* https://spring.io/blog/2014/12/02/latest-jackson-integration-improvements-in-spring

Supongamos que tenemos dos clases a utilizar en algunos *endpoints*. En uno de ellos queremos mostrar solamente un *resumen* de los datos, y en el otro, una vista más completa. `@JsonView` nos permite realizar esto. Primero, definimos una vista:

```java
public class View {
    interface Summary {}
}
```

Y a continuación, la utilizamos en nuestro modelo

```java
public class User {

    @JsonView(View.Summary.class)
    private Long id;

    @JsonView(View.Summary.class)
    private String firstname;

    @JsonView(View.Summary.class)
    private String lastname;

    private String email;
    private String address;
    private String postalCode;
    private String city;
    private String country;
}

public class Message {

    @JsonView(View.Summary.class)
    private Long id;

    @JsonView(View.Summary.class)
    private LocalDate created;

    @JsonView(View.Summary.class)
    private String title;

    @JsonView(View.Summary.class)
    private User author;

    private List<User> recipients;

    private String body;
}
```

De esta forma, podemos crear un controlador con dos *endpoints*, y en uno de ellos podemos usar la vista `Summary`.

```java
@RestController
public class MessageController {

    @Autowired
    private MessageService messageService;

    @JsonView(View.Summary.class)
    @RequestMapping("/")
    public List<Message> getAllMessages() {
        return messageService.getAll();
    }

    @RequestMapping("/{id}")
    public Message getMessage(@PathVariable Long id) {
        return messageService.get(id);
    }
}
```

El resultado que podríamos obtener si llamamos a `getAllMessages()` sería:

```js
[ {
  "id" : 1,
  "created" : "2014-11-14",
  "title" : "Info",
  "author" : {
    "id" : 1,
    "firstname" : "Brian",
    "lastname" : "Clozel"
  }
}, {
  "id" : 2,
  "created" : "2014-11-14",
  "title" : "Warning",
  "author" : {
    "id" : 2,
    "firstname" : "Stéphane",
    "lastname" : "Nicoll"
  }
}, {
  "id" : 3,
  "created" : "2014-11-14",
  "title" : "Alert",
  "author" : {
    "id" : 3,
    "firstname" : "Rossen",
    "lastname" : "Stoyanchev"
  }
} ]
```

Observemos que, para cada mensaje, se muestran solo los campos marcados con `@JsonView(Views.Summary.class`) en el modelo. Sin embargo, si obtenemos un mensaje específicamente:

```js
{
  "id" : 1,
  "created" : "2014-11-14",
  "title" : "Info",
  "body" : "This is an information message",
  "author" : {
    "id" : 1,
    "firstname" : "Brian",
    "lastname" : "Clozel",
    "email" : "bclozel@pivotal.io",
    "address" : "1 Jaures street",
    "postalCode" : "69003",
    "city" : "Lyon",
    "country" : "France"
  },
  "recipients" : [ {
    "id" : 2,
    "firstname" : "Stéphane",
    "lastname" : "Nicoll",
    "email" : "snicoll@pivotal.io",
    "address" : "42 Obama street",
    "postalCode" : "1000",
    "city" : "Brussel",
    "country" : "Belgium"
  }, {
    "id" : 3,
    "firstname" : "Rossen",
    "lastname" : "Stoyanchev",
    "email" : "rstoyanchev@pivotal.io",
    "address" : "3 Warren street",
    "postalCode" : "10011",
    "city" : "New York",
    "country" : "USA"
  } ]
}
```

Podemos utilizar herencia a la hora de definir las vistas. Supongamos que queremos tener una vista de resumen de los mensajes, pero con la lista de receptores:

```java
public class View {
    interface Summary {}
    interface SummaryWithRecipients extends Summary {}
}
```

Nuestros modelos estarían anotados ahora así:

```java
public class Message {

    @JsonView(View.Summary.class)
    private Long id;

    @JsonView(View.Summary.class)
    private LocalDate created;

    @JsonView(View.Summary.class)
    private String title;

    @JsonView(View.Summary.class)
    private User author;

    @JsonView(View.SummaryWithRecipients.class)
    private List<User> recipients;

    private String body;
}
```

En este caso, el controlador podría ser este:

```java
@RestController
public class MessageController {

    @Autowired
    private MessageService messageService;

    @JsonView(View.SummaryWithRecipients.class)
    @RequestMapping("/with-recipients")
    public List<Message> getAllMessagesWithRecipients() {
        return messageService.getAll();
    }
}
```

De esta forma, el resultado podría ser:

```js
[ {
  "id" : 1,
  "created" : "2014-11-14",
  "title" : "Info",
  "author" : {
    "id" : 1,
    "firstname" : "Brian",
    "lastname" : "Clozel"
  },
  "recipients" : [ {
    "id" : 2,
    "firstname" : "Stéphane",
    "lastname" : "Nicoll"
  }, {
    "id" : 3,
    "firstname" : "Rossen",
    "lastname" : "Stoyanchev"
  } ]

}, ... ]
```

## Transcripción

# 09 Asociaciones many-to-one 8:42 

[PDF 07_Asociaciones_ManyToOne.pdf](pdfs/07_Asociaciones_ManyToOne.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 10 Asociaciones one-to-many 24:31 

[PDF Asociaciones_OneToMany.pdf](pdfs/08_Asociaciones_OneToMany.pdf)

## Resumen Profesor

### Evitar errores en asociaciones bidireccionales

Los expertos en JPA e Hibernate suelen recomendar tratar de forma bidireccional las asociaciones. De esta forma, se suele diseñar un mejor DDL, sobre todo para asociaciones *one-to-many* o *many-to-many*. Sin embargo, el uso de asociaciones bidirecionales con Lombok puede llegar a provocar algunos problemas de **recursión infinita**. Esta viene provocada por la propia bidireccionalidad.

*Por ejemplo, un producto, asociado mediante many-to-one a una categoría, y esta a su vez asociada mediante one-to-many a un conjunto de productos. Cada uno de ellos, asociados, a su vez con la categoría, y así indefinidamente.*

De nuevo, los expertos en JPA e Hibernate nos recomiendan dar un tratamiento especial a los métodos `equals`, `hashCode` y `toString`. Con todo, entrar en profundidad en esta materia queda fuera del alcance del curso.

En el ámbito de este curso, tenemos que dar una solución en dos niveles:

### Solución a nivel de Lombok

Para solucionar el problema a nivel de lombok (métodos `equals`, `hashCode` y `toString`) podemos usar algunas anotaciones para excluir determinados campos de estos métodos, y cortar así la recursividad.

Estas anotaciones son `@EqualsAndHashCode.Exclude` y `@ToString.Exclude`. Deberíamos incluirlas en uno de los lados de la asociación (lo normal suele ser en el lado *mappedBy*).

```java
// Anotaciones
public class LineaPedido {

    @ManyToOne
    @JoinColumn(name = "pedido_id")
    private Pedido pedido;

    // resto de atributos y métodos
}


// Anotaciones
public class Pedido {

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @Builder.Default
    @OneToMany(mappedBy = "pedido", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<LineaPedido> lineas = new HashSet<>();

    // resto de atributos y métodos
}
```

### Solución a nivel de Jackson

Esta recursividad infinita también nos afecta en la transformación hacia/desde JSON. Jackson ofrece un par de anotaciones para solucionar el problema:

* `JsonManagedReference`: se coloca a nivel de atributo (que forme parte de una asociación bidireccional). Este será el lado que se serialice con normalidad.
* `JsonBackReference`: es la anotación complementaria a la anterior. Suele anotarse sobre un *bean*, y no una colección. Este lado no se serializa.

```java
// Anotaciones
public class LineaPedido {

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "pedido_id")
    private Pedido pedido;

    // resto de atributos y métodos
}


// Anotaciones
public class Pedido {

    @JsonManagedReference
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @Builder.Default
    @OneToMany(mappedBy = "pedido", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<LineaPedido> lineas = new HashSet<>();

    // resto de atributos y métodos
}
```

### Reto interesante

En esta lección nuestra aplicación ha crecido un poco (sobre todo en modelo). Se propone completar la parte del controlador, realizando algunas tareas de las lecciones anteriores.

1. Crear un DTO para las peticiones GET (todos los recursos) para Pedido y Línea de pedido. Se puede realizar la transformación en una nueva clase Converter, y usando Lombok.

2. Crear una vista con `@JsonView` para las peticiones GET por ID, de forma que en las líneas de venta, para el atributo producto, no se muestre el precio (lo tenemos en línea de venta), ni la imagen ni la categoría.

3. Crear la petición GET por ID en el controlador, siguiendo el ejemplo de las que ya hemos realizado anteriormente (`Producto`, `Categoría`).

4. Crear la petición POST para insertar un nuevo Pedido con sus Líneas de pedido. Para ello, vamos a crear un par de DTOs
 
   * `NuevoPedidoDTO`, con nombre y `Set<NuevaLineaPedidoDTO>`
   * `NuevaLineaPedidoDTO`, con el ID del producto y la cantidad. El conversor de `NuevaLineaPedidoDTO` a `LineaPedido` tendrá que usar el servicio de producto, para transformar un ID de producto en un `Producto`.

5. Crear la petición PUT, que será muy similar a las POST.

6. Crear la petición DELETE, que será muy parecida a la de producto (con la asociación bidireccional y el borrado en cascada, al borrar un `Pedido`, se borrarán sus `LineaPedido` asociadas).

## Transcripción

# 11 Asociaciones many-to-many 17:13 

[PDF Asociaciones_ManyToMany.pdf](pdfs/09_Asociaciones_ManyToMany.pdf)

## Resumen Profesor

### `@JsonIdentityInfo`

Según esta anotación, sirve para que los valores de tipo o propiedad anotados sean serializados para que las instancias contengan un identificador de objeto adicional, o como referencia que consiste en una identificación de objeto que se refiere a una serialización completa.

Se utiliza en asociaciones `@OneToMany` y `@ManyToMany` para romper referencias circulares o recursividad infinita.

Por ejemplo:

```java
@JsonIdentityInfo(
  generator = ObjectIdGenerators.PropertyGenerator.class, 
  property = "id")
// Resto de anotaciones
public class Categoria {

    private int id;
    private String nombre;
    private List<Producto> productos;

    // Resto de métodos

}


@JsonIdentityInfo(
  generator = ObjectIdGenerators.PropertyGenerator.class, 
  property = "id")
// Resto de anotaciones
public class Producto {

    private int id;
    private String nombre;

    // Resto de atributos y anotaciones

    private Categoria categoria;


}
```

Si tenemos una categoría llamada Comida con dos productos llamados Pan y Aceite, el JSON de resultado podría ser:

```js
{
    "id": 3,
    "nombre": "Aceite",
    "categoria": {
        "id": 1,
        "nombre": "Comida",
        "productos": [2, 3]
    }
}
```

Con todo, si se puede elegir, **yo personalmente prefiero el uso de las anotaciones `@JsonManagedReference` o `@JsonBackReference`, vistas en la lección anterior.**

## Transcripción

# Contenido adicional 5

* [PDF Patrón_DTO_en_peticiones_y_respuetas.pdf](pdfs/05_Patrón_DTO_en_peticiones_y_respuetas.pdf)
* [PDF 06_JsonViews.pdf](pdfs/06_JsonViews.pdf)
* [PDF 07_Asociaciones_ManyToOne.pdf](pdfs/07_Asociaciones_ManyToOne.pdf)
* [PDF Asociaciones_OneToMany.pdf](pdfs/08_Asociaciones_OneToMany.pdf)
* [PDF Asociaciones_ManyToMany.pdf](pdfs/09_Asociaciones_ManyToMany.pdf)


