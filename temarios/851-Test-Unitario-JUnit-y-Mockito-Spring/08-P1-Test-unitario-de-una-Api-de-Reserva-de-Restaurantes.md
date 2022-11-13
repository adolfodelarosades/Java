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

![image](https://user-images.githubusercontent.com/23094588/201517141-c36dd973-4e2a-447d-9422-4321eb92e999.png)




## Debugeando para entender la API a realizar el Test Unitario 11:34
## Test unitario de controlador de Restaurantes 05:16
## Creando el test del metodo buscar restaurantes por el id 05:33
## Mockeando nuestro Servicio de restaurante que trae un restaurante por id 07:26
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
