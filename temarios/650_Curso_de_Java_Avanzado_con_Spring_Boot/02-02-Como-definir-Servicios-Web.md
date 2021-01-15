# 02 - Como definir Servicios Web

En esta lección vamos a ver los servición que vamos a crear en esta sección, vemos a continuación un resumen de todos ellos:

<hr>

## REST: Aproximación al diseño
La clave es el concepto de Recurso

### SHIELD DATABASE

#### Héroes
##### Obtener a todos los héroes
```
GET /hero
HTTResponseStatus: 200, 404, 500...
```
##### Insertar un nuevo héroe
```
POST /hero
Body: Información del héroe
HttpResponseStatus: 201, 404, 500...
```
##### Obtener a un héroe en concreto
```
GET /hero/{id} --> /hero/1
HttpResponseStatus: 200, 404, 500...
```
##### Borrar a un héroe
```
DELETE /hero/{id} --> /hero/1
HttpResponseStatus: 200, 202, 404, 500...
```

#### Poderes
##### Obtener todos los poderes de un héroe
```
GET /hero/{id}/power
```
##### Añadir un poder a un héroe
```
POST /hero/{id}/power
Body: Detalles del poder a añadir
```
##### Obtener un poder en concreto de un héroe
```
GET /hero/{id}/power/{powerId}
```

<hr>

Lo que vamos a crear es un Servicio RestFull, ***RestFull es una aproximación al diseño***, la clave de un Servicio RestFull esta en el concepto de ***Recurso***, por lo tanto todo el diseño de los servicios debe girar entorno a este concepto de recursos. 

El ejemplo que vamos a hacer es el diseño de un servicio que va a acceder a una BD SHIELD. (S.H.I.E.L.D. es una agencia ficticia de inteligencia, espionaje y antiterrorismo que aparece en los cómics estadounidenses de Marvel Comics.) En la BD vamos a almacenar a los heroes y a los poderes que tienen, los *Heroes* van a estar relacionados con los *Poderes* en una relación *UNO A MUCHOS* por lo tanto ***los poderes son exclusivos de los heroes***, **un Heroe puede tener muchos Poderes, pero cada uno de los Poderes solo puede pertenecer a uno de los Heroes**. 

Por lo tanto teniendo en cuenta todo lo anterior nuestros recursos serían:

* Los Heroes
* Los Poderes

Los distintos métodos que vamos a crear son de tipo ***obtener***, ***insertar*** y ***borrar*** va a ser prácticamente un CRUD, solo nos va a faltar la acción de *modificar*.

Para obtener los recursos usamos métodos `GET`, para insertar un recurso usamos el  métodos `POST` y para borrar un recurso usamos el métodos `DELETE`. Como respuesta ademas de los datos se nos devolverá un estado de la respuesta que puede ser `200` en caso que la respuesta sea satisfactoria y nos devuelva los datos solicitados, `201` para indicar que se a creado un nuevo recurso, puede regresar un `404` si ese recurso no estuviera disponible, podría devolver `500` si se produce un error en el servidor a la hora de realizar la petición.

Un recurso que esta definido por un EndPoint puede tener diferentes usos en función del método que se use:

```sh
GET /hero

POST /hero
```

En el caso de un método POST debemos enviarle un BODY con la información a insertar.

Si quiero recuperar o eliminar datos concretos se algun recurso debemos añadir un atributo que indique el recurso concreto que queremos obtener:

```sh
GET /hero/{id} --> /hero/1
DELETE /hero/{id} --> /hero/1
```

En el caso de los Poderes no tiene caso de que exista sino esiste el Heroe, por lo tanto el recurso Poder esta relacionado con el recurso Heroe, y lo lógico entonces que para obtener todos los Poderes de un Heroe o insertar el Poder de un Heroe, debieramos indicar anteriormente a que Heroe nos referimos, por lo tanto el acceso a este recurso es:

```sh
GET /hero/{id}/power
GET /hero/{id}/power/{id}

POST /hero/{id}/power
```
