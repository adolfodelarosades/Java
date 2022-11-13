# 08 P1 - Test unitario de una Api de Reserva de Restaurantes • 21 clases • 2h 30m 

* Entendiendo la API para crear test unitario 04:55
* Debugeando para entender la API a realizar el Test Unitario 11:34
* Test unitario de controlador de Restaurantes 05:16
* Creando el test del metodo buscar restaurantes por el id 05:33
* Mockeando nuestro Servicio de restaurante que trae un restaurante por id 07:26
* Test unitario de Controlador de traer todos los Restaurantes 04:48
* Test Unitario de nuestro Servicio de traer Restaurante por Id 13:47
* Revisando el Coverage y Testeando toda la funcionalidad del Servicio 04:35
* Test Unitario del Servicio que trae todo los Restaurantes 07:10
* Test Unitario del Controlador de Reservas (Mockear el servicio) 11:12
* Test Unitario del Controlador de Reservas (Crear y testear el metodo) 02:59
* Test unitario del Servicio de Reservas (Inicio) 08:31
* Test unitario del Servicio de Reservas Mockear dependencias 05:57
* Test unitario del Servicio de Reservas Mockear Dependencias y revisar Coverage 07:36
* Probando el primer caso de prueba error en el Metodo CreateReservation 05:05
* Probando el segundo caso de prueba error en el Metodo CreateReservation 04:16
* Probando el tercer caso de prueba error en el Metodo CreateReservation 08:19
* Probando el ultimo caso de prueba error de reservation - Internal server error 03:54
* Test Unitario del Controlador de Cancelar reserva 10:11
* Test Unitario de nuestro Servicio de Cancelar Reserva 09:11
* Test unitario del caso de prueba error en el Metodo Cancel reservation 07:35

## Entendiendo la API para crear test unitario 04:55

API Rest Booking Restaurant

![image](https://user-images.githubusercontent.com/23094588/201516389-f78ef472-366e-458d-81c0-e755cabdcd00.png)

La API tiene:

* DELETE para cancelar una Reserva

* POST de Reservas
* GET de Reserva por ID

* GET de Restaurante por ID
* GET Listado de todos los Restaurantes

### Estructura del Proyecto

<img width="472" alt="image" src="https://user-images.githubusercontent.com/23094588/201516588-a029910c-3303-4c6c-a2b0-117198a514bb.png">


#### Controladores

<img width="1459" alt="image" src="https://user-images.githubusercontent.com/23094588/201516655-f7af0798-8dfa-4849-a2b4-686e7a52228e.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516702-a6639a25-89b5-4cb1-86d2-b49fd67158aa.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516761-663388ae-c36d-4666-a051-c5d86ab87f83.png">

#### Servicios

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516837-8fe3112f-1be3-463d-9543-cfa3a21bc451.png">


<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516856-4115d1fa-e6be-4b7d-9ff9-caf350940feb.png">
<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516863-fde1ffb3-7114-471e-8216-e52c42e91abf.png">
<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516871-a9813ddc-f1aa-4864-afff-53cbc20ea0f9.png">


<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516899-17c92c94-b676-49ea-b182-289a3b931f73.png">
<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516918-9ae96054-42d5-4ea2-bbba-325d56a11c49.png">

#### Base de Datos

![image](https://user-images.githubusercontent.com/23094588/201520658-e2c1ca25-9fde-4c33-be43-a20a6313f2f8.png)

![image](https://user-images.githubusercontent.com/23094588/201520820-33d1613f-1768-4ee2-adc2-7968591d3eb5.png)

<img width="1133" alt="image" src="https://user-images.githubusercontent.com/23094588/201520703-78daba42-d232-4a23-901c-17c95e4da9a4.png">

<img width="764" alt="image" src="https://user-images.githubusercontent.com/23094588/201520742-41e72125-d91b-4459-a708-09d88bac6eb7.png">

#### Funcionamiento de la API

Restaurantes

![image](https://user-images.githubusercontent.com/23094588/201521188-040a36e2-8a8d-4bb9-874b-c9245364b1b2.png)

Recuperar todos los Restaurantes.

![image](https://user-images.githubusercontent.com/23094588/201520964-666c71d4-689e-42e0-bc8e-de2c5ce9cb9a.png)

Recuperar Restaurante por ID

![image](https://user-images.githubusercontent.com/23094588/201521004-f5afaa13-f8b4-4e5a-88f4-173120182189.png)

Reservas

![image](https://user-images.githubusercontent.com/23094588/201521226-c01bbeb6-56fc-4fc8-a2e8-cac7657c4740.png)


Recuperar Reservas por ID

![image](https://user-images.githubusercontent.com/23094588/201521135-32efa38e-86b4-44a6-9cc6-c68532d15513.png)

Crear una Reserva

![image](https://user-images.githubusercontent.com/23094588/201521374-baf3bd35-98bb-49b0-bbf2-4dea995bdc67.png)

Teniamos 3 reservas al crear esta será la 4.

![image](https://user-images.githubusercontent.com/23094588/201521425-1cc979b1-d8ca-4276-a338-e76a6a4e1e32.png)

Y la podemos ver con Recuperar Reservas por ID

![image](https://user-images.githubusercontent.com/23094588/201521459-52456c26-8f73-44ca-83af-b44c8b908e5f.png)

Finalmente tenemos la opción de Cancelar una Reserva

![image](https://user-images.githubusercontent.com/23094588/201521535-8d8762ff-1d58-4755-9257-e47dfae56c59.png)

Tenemos que ingresar el Locator para localizarla, en el caso de la que añadimos es **`Calamar y Sazon3`**

![image](https://user-images.githubusercontent.com/23094588/201521572-ca8a043b-1841-4eb6-b6bc-aa70410105b1.png)

Al ejecutar el DELETE con **`Calamar y Sazon3`** la elimina.

![image](https://user-images.githubusercontent.com/23094588/201521605-23addae4-afed-4e04-bbdd-303628718f84.png)

![image](https://user-images.githubusercontent.com/23094588/201521659-56a32c7d-0c6a-4886-9800-8ee5fb7d0c42.png)

## Debugeando para entender la API a realizar el Test Unitario 11:34

## Test unitario de controlador de Restaurantes 05:16

Vamos a comenzar por testear **`RestaurantController`** por lo que vamos a crear **`RestaurantControllerTest`**

<img width="686" alt="image" src="https://user-images.githubusercontent.com/23094588/201525385-06e0039d-c7bd-4dd8-9d33-9317a42072c8.png">

Si vemos **`RestaurantController`** tenemos:

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201516761-663388ae-c36d-4666-a051-c5d86ab87f83.png">

Como podemos observar este controlador depende de **`RestaurantService restaurantService;`** para su funcionamiento, por lo que en el Test vamos tener que Mockear este Servicio para su simulación, además de inyectar nuestro Controlador.

<img width="729" alt="image" src="https://user-images.githubusercontent.com/23094588/201525770-4c2d8471-c0dd-49af-93cb-cf7763aeae16.png">

Posteriormente vamos a añadir el método **`before`** que se ejecuta antes del Test. Donde vamos a añadir los datos que queremos se ejecuten o inicialicen antes de ejecutar los Test. Vamos a inicializar las anotaciones del Test con Mockito.

<img width="811" alt="image" src="https://user-images.githubusercontent.com/23094588/201526247-1476fac5-40ea-4f89-97dd-a79c5d211c7b.png">

Esto se hace siempre para los Test Unitarios de Servicios o Controladores.

## Creando el test del metodo buscar restaurantes por el id 05:33

Si vemos el método que busca Restaurantes por ID tenemos:

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/201546646-3f0371d2-e404-4963-9527-cee3352ca22a.png">

Observamos que el método **`getRestaurantById(@PathVariable Long restaurantId)`** recibe como parámetro el ID y lo que retorna es **`BookingResponse<RestaurantRest>`**, si obsevamos la clase **`BookingResponse`** tenemos lo siguiente:

```java
package com.boot.bookingrestaurantapi.responses;

import java.io.Serializable;

public class BookingResponse<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String status;
	private String code;
	private String message;
	private T data;
	
	public BookingResponse(String status, String code, String message) {
		this.status = status;
		this.code = code;
		this.message = message;
	}
	
	public BookingResponse(String status, String code, String message, T data) {
		this.status = status;
		this.code = code;
		this.message = message;
		this.data = data;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
	

}
```

Es una clase generica con 4 campos:

```java
   private String status;
   private String code;
   private String message;
   private T data;
```

Si volvemos a ver el método que busca Restaurantes por ID tenemos:

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/201546646-3f0371d2-e404-4963-9527-cee3352ca22a.png">

Observamos que retorna:

```java
   return new BookingResponse<>("Succes", String.valueOf(HttpStatus.OK), "OK",
				restaurantService.getRestaurantById(restaurantId));
```

Esta retornando el Status, Código, Mensaje y los Datos que en este caso es lo que retorna el servicio:

<img width="783" alt="image" src="https://user-images.githubusercontent.com/23094588/201547149-2a7fdb00-980e-4c91-a589-073550e72f4d.png">

En resumen retorna un **`RestaurantRest`**

### Creación del Test Unitario

Una vez analizado lo que hace el método vamos a crear el Test para este método:

<img width="1241" alt="image" src="https://user-images.githubusercontent.com/23094588/201526968-3e5e20e1-ebe4-4ecb-9500-ad0da5776989.png">
<img width="1245" alt="image" src="https://user-images.githubusercontent.com/23094588/201526990-4c129e5d-cf11-4641-8e3a-e4c615255308.png">

Tenía varias diferencias en cuanto al código de la pantalla y el que finalmente se ejecuto, **uno de los errores que marcaba es que el nombre del método era getRestaurantById() y por alguna razón no aceptaba ese nombre lo tube que cambaiar a testRestaurantById()**, a continuación se muestra el código que funciona.

```java
package com.boot.bookingrestaurantapi.controllers;

import com.boot.bookingrestaurantapi.exceptions.BookingException;
import com.boot.bookingrestaurantapi.jsons.RestaurantRest;
import com.boot.bookingrestaurantapi.responses.BookingResponse;
import com.boot.bookingrestaurantapi.services.RestaurantService;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class RestaurantControllerTest {

    private static final Long RESTAURANT_ID = 1L;
    private static final String SUCCESS_STATUS = "Succes";
    private static final String SUCCESS_CODE = "200 OK";
    private static final String OK = "OK";


    @Mock
    RestaurantService restaurantService;

    @InjectMocks
    RestaurantController  restaurantController;

    @Before
    public void init() throws BookingException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testRestaurantById() throws BookingException {
        final BookingResponse<RestaurantRest> response = restaurantController.getRestaurantById(RESTAURANT_ID);

        //Expected , Actual
        assertEquals(SUCCESS_STATUS, response.getStatus());
        assertEquals(SUCCESS_CODE, response.getCode());
        assertEquals(OK, response.getMessage());
        //assertEquals(RESTAURANTE_REST, response.getData());
    }
}
```

Si ejecutamos hasta aquí el Test (comentando la última línea) tenemos:

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201529934-ea7d18e9-0acb-4446-9679-0f1d369c368d.png">

**EL TEST FUNCIONA YA QUE LOS VALORES COINCIDEN, PERO EL TEST ESTA MAL PORQUE LA PRUEBA REALMENTE VALIDA ES LA QUE TENEMOS COMENTADA Y ES DONDE COMPARAMOS LOS VALORES QUE SE RECUPERAN**.


## Mockeando nuestro Servicio de restaurante que trae un restaurante por id 07:26

Lo que toca ahora es dar valor a **`RESTAURANTE_REST`** la cual es de tipo **`RestaurantRest`** que si lo revisamos es una especie de DTO pero en en este caso es realmente un JSON, el código es el siguiente:

<img width="559" alt="image" src="https://user-images.githubusercontent.com/23094588/201542943-0cc5f0fd-e9ac-4550-8783-9da8ec61c684.png">

<img width="815" alt="image" src="https://user-images.githubusercontent.com/23094588/201542976-df630ca0-eef8-4f86-b54c-027bfb5ab848.png">

En nuestro Test vamos a crear una variable de tipo **`RestaurantRest`** con el nombre **`RESTAURANTE_REST`**
**`private static final RestaurantRest RESTAURANTE_REST = new RestaurantRest();`**. Una vez hecho esto tenemos que settear los valores a este **`RESTAURANTE_REST`**, esto lo haremos en el método **`@Before`**. 

Como hemos visto la clase **`RestaurantRest`** tiene los siguientes campos:

```java
    @JsonProperty("id")
	private Long id;

	@JsonProperty("name")
	private String name;

	@JsonProperty("address")
	private String address;

	@JsonProperty("description")
	private String description;

	@JsonProperty("image")
	private String image;

	@JsonProperty("turns")
	private List<TurnRest> turns;
```

Por lo que son los campos que tenemos que settear a **`RESTAURANTE_REST`**, vamos a necesitar los valores que vamos a settear por lo que primero vamos a definir los valores.

<img width="667" alt="image" src="https://user-images.githubusercontent.com/23094588/201543979-a76e81ad-cdb4-4366-8c36-5249dfe61c40.png">

Ahora ya definidos los valores vamos a proceder a settearlos en **`RESTAURANTE_REST`** como ya dijimos esto lo vamos a hacer en el método **`@Before`**.

<img width="528" alt="image" src="https://user-images.githubusercontent.com/23094588/201544142-dfc29c4b-5da2-4132-bb06-db94d16c8df6.png">

Una vez hecho esto ya podemos descomentar la línea en el Test y ejecutarlo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201544201-c72c3c3a-f3a7-469a-9afa-528ebf3e522b.png">

El Test no lo esta pasando, no coinciden los valores.

Si ejecutamos el Test en modo Debug podemos ir viendo lo que va pasanso.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201544505-b1aa9123-810f-49e1-a1ec-2fd91b4d6d0a.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201544676-1d82b7ec-5f8f-41a0-b511-5180e7629024.png">

Vemos que los 3 primeros valores si coinciden pero el cuarto ya no.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201544547-dea32572-4a87-4193-a95d-73e283c174ef.png">

Porque al ejecutar:

```java
final BookingResponse<RestaurantRest> response = restaurantController.getRestaurantById(RESTAURANT_ID);
```
 
recupera un valor **`null`** para el **`data`**.

**Esto es por que no tenemos el Servicio funcionando, nos queda añadir el Servicio con Mockito para que esto funcione correctamente**.

Después de Settear los datos vamos a simular la llamada a un Servicio con Mockito usando el método **`when`** donde indicamos el método del servicio que vamos a simular que vamos a llamar, en este caso **`restaurantService.getRestaurantById(RESTAURANT_ID)`** y entonces indicamos que datos queremos retornar en este caso será **`RESTAURANTE_REST`**.


```java
Mockito.when(restaurantService.getRestaurantById(RESTAURANT_ID)).thenReturn(RESTAURANTE_REST);
```

<img width="895" alt="image" src="https://user-images.githubusercontent.com/23094588/201545440-899e59c7-1ccc-40dc-8146-41b7a23b1f4d.png">

Una vez hecho esto vamos a ejecutar nuevamente el Test.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201545566-d93de7f6-0da9-404b-8c73-18fb8b4b792e.png">

Esta vez el Test a pasado.

Ahora vamos a ejecutar el coverage.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201545642-ad94778c-6e33-497e-8fe9-9eac5e8f2428.png">

Como podemos obaservar hemos cubierto uno de los dos métodos existentes.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201545712-7836aedb-2f42-412c-8e15-2ed43d9151d9.png">

El Test Unitario para nuestro primer método esta funcionando correctamente ya que hemos probado lo que entra al método y comprobado lo que retorna. En este caso esta retornado un STATUS, un CODIGO, un MENSAJE y una DATA donde tenemos los datos del Restaurante.

## Test unitario de Controlador de traer todos los Restaurantes 04:48
## Test Unitario de nuestro Servicio de traer Restaurante por Id 13:47
## Revisando el Coverage y Testeando toda la funcionalidad del Servicio 04:35
## Test Unitario del Servicio que trae todo los Restaurantes 07:10
## Test Unitario del Controlador de Reservas (Mockear el servicio) 11:12
## Test Unitario del Controlador de Reservas (Crear y testear el metodo) 02:59
## Test unitario del Servicio de Reservas (Inicio) 08:31
## Test unitario del Servicio de Reservas Mockear dependencias 05:57
## Test unitario del Servicio de Reservas Mockear Dependencias y revisar Coverage 07:36
## Probando el primer caso de prueba error en el Metodo CreateReservation 05:05
## Probando el segundo caso de prueba error en el Metodo CreateReservation 04:16
## Probando el tercer caso de prueba error en el Metodo CreateReservation 08:19
## Probando el ultimo caso de prueba error de reservation - Internal server error 03:54
## Test Unitario del Controlador de Cancelar reserva 10:11
## Test Unitario de nuestro Servicio de Cancelar Reserva 09:11
## Test unitario del caso de prueba error en el Metodo Cancel reservation 07:35
