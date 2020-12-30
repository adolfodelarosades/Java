# 3. Seguridad básica 48m

* 11 ¿En qué consiste la seguridad básica? 6:15 
* 12 Implementación de la seguridad básica 14:07 
* 13 Refactorización del controlador 15:01 
* 14 Despliegue y pruebas 12:46 
* Contenido adicional 4

# 11 ¿En qué consiste la seguridad básica? 6:15 

[PDF Seguridad_básica_en_qué_consiste.pdf](pdfs/10_Seguridad_básica_en_qué_consiste.pdf)

## Resumen Profesor

Estas podrían ser algunas pruebas realizadas sobre nuestra API Rest con cURL

*Si queremos codificar el `username:password` en base64, lo podemos hacer en alguna web como https://www.base64encode.org/

### Petición GET para obtener los productos

Nos autenticamos como `marialopez:Marialopez1`, que en Base64 equivale a `bWFyaWFsb3BlejpNYXJpYWxvcGV6MQ==` Al encauzar la salida de curl a `jq .` conseguimos que esta aparezca prettyficada.

```sh
curl -v -H "Authorization: Basic bWFyaWFsb3BlejpNYXJpYWxvcGV6MQ==" http://localhost:8080/producto/ | jq .
```

La salida debe ser algo así como:

```js
{
  "content": [
    {
      "id": 1,
      "nombre": "Juice - Orange, Concentrate",
      "imagen": "http://dummyimage.com/139x103.bmp/5fa2dd/ffffff",
      "precio": 91,
      "categoria": "Bebida"
    },
    {
      "id": 2,
      "nombre": "Beef - Ground, Extra Lean, Fresh",
      "imagen": "http://dummyimage.com/206x125.bmp/cc0000/ffffff",
      "precio": 87,
      "categoria": "Comida"
    },
    {
      "id": 3,
      "nombre": "Cheese - Parmesan Grated",
      "imagen": "http://dummyimage.com/133x134.bmp/dddddd/000000",
      "precio": 39,
      "categoria": "Comida"
    },
    {
      "id": 4,
      "nombre": "Cups 10oz Trans",
      "imagen": "http://dummyimage.com/245x246.jpg/dddddd/000000",
      "precio": 67,
      "categoria": "Comida"
    },
    {
      "id": 5,
      "nombre": "Wine - Beringer Founders Estate",
      "imagen": "http://dummyimage.com/139x103.bmp/5fa2dd/ffffff",
      "precio": 27,
      "categoria": "Bebida"
    },
    {
      "id": 6,
      "nombre": "Bread - Wheat Baguette",
      "imagen": "http://dummyimage.com/206x125.bmp/cc0000/ffffff",
      "precio": 82,
      "categoria": "Bebida"
    },
    {
      "id": 7,
      "nombre": "Un producto nuevo",
      "imagen": "http://dummyimage.com/133x134.bmp/dddddd/000000",
      "precio": 123.4,
      "categoria": "Bebida"
    },
    {
      "id": 8,
      "nombre": "Cheese - Mascarpone",
      "imagen": "http://dummyimage.com/245x246.jpg/dddddd/000000",
      "precio": 97,
      "categoria": "Bebida"
    },
    {
      "id": 9,
      "nombre": "Mace",
      "imagen": "http://dummyimage.com/139x103.bmp/5fa2dd/ffffff",
      "precio": 25,
      "categoria": "Bebida"
    },
    {
      "id": 10,
      "nombre": "Oil - Shortening - All - Purpose",
      "imagen": "http://dummyimage.com/206x125.bmp/cc0000/ffffff",
      "precio": 63,
      "categoria": "Bebida"
    },
    {
      "id": 11,
      "nombre": "Marjoram - Fresh",
      "imagen": "http://dummyimage.com/133x134.bmp/dddddd/000000",
      "precio": 60,
      "categoria": "Bebida"
    },
    {
      "id": 12,
      "nombre": "Turnip - White",
      "imagen": "http://dummyimage.com/245x246.jpg/dddddd/000000",
      "precio": 74,
      "categoria": "Bebida"
    },
    {
      "id": 13,
      "nombre": "Pork Salted Bellies",
      "imagen": "http://dummyimage.com/139x103.bmp/5fa2dd/ffffff",
      "precio": 38,
      "categoria": "Bebida"
    },
    {
      "id": 14,
      "nombre": "Longos - Greek Salad",
      "imagen": "http://dummyimage.com/206x125.bmp/cc0000/ffffff",
      "precio": 15,
      "categoria": "Bebida"
    },
    {
      "id": 15,
      "nombre": "Amaretto",
      "imagen": "http://dummyimage.com/133x134.bmp/dddddd/000000",
      "precio": 85,
      "categoria": "Bebida"
    },
    {
      "id": 16,
      "nombre": "Godiva White Chocolate",
      "imagen": "http://dummyimage.com/245x246.jpg/dddddd/000000",
      "precio": 97,
      "categoria": "Bebida"
    },
    {
      "id": 17,
      "nombre": "Tomatoes - Roma",
      "imagen": "http://dummyimage.com/139x103.bmp/5fa2dd/ffffff",
      "precio": 61,
      "categoria": "Bebida"
    },
    {
      "id": 18,
      "nombre": "Oven Mitt - 13 Inch",
      "imagen": "http://dummyimage.com/206x125.bmp/cc0000/ffffff",
      "precio": 1,
      "categoria": "Complementos"
    },
    {
      "id": 19,
      "nombre": "Vermouth - White, Cinzano",
      "imagen": "http://dummyimage.com/133x134.bmp/dddddd/000000",
      "precio": 72,
      "categoria": "Bebida"
    },
    {
      "id": 20,
      "nombre": "Club Soda - Schweppes, 355 Ml",
      "imagen": "http://dummyimage.com/245x246.jpg/dddddd/000000",
      "precio": 38,
      "categoria": "Bebida"
    }
  ],
  "pageable": {
    "sort": {
      "sorted": false,
      "unsorted": true,
      "empty": true
    },
    "pageSize": 20,
    "pageNumber": 0,
    "offset": 0,
    "paged": true,
    "unpaged": false
  },
  "last": false,
  "totalPages": 2,
  "totalElements": 30,
  "first": true,
  "sort": {
    "sorted": false,
    "unsorted": true,
    "empty": true
  },
  "numberOfElements": 20,
  "size": 20,
  "number": 0,
  "empty": false
}
```

### Petición GET para obtener los pedidos de un usuario

*Nos volvemos a autenticar como `marialopez:Marialopez1`, que en Base64 equivale a `bWFyaWFsb3BlejpNYXJpYWxvcGV6MQ==`*

```sh
curl -v -H "Authorization: Basic bWFyaWFsb3BlejpNYXJpYWxvcGV6MQ==" http://localhost:8080/pedido/ | jq .
```

### Petición GET para obtener todos los pedidos (como ADMIN)

Un administrador si será capaz de obtener todos los pedidos, independientemente del usuario que los haya realizado. Ejecutamos la misma petición, autenticados como un administrador.

*Para autenticarnos como administrador, lo hacemos con `admin:Admin1`, que en Base64 equivale a `YWRtaW46QWRtaW4x`

```sh
curl -v -H "Authorization: Basic YWRtaW46QWRtaW4x" http://localhost:8080/pedido/ | jq .
```

### Petición PUT para modificar un producto

Si en esta petición nos autenticamos como `marialopez:Marialopez1`, obtenedremos un error `403 Forbidden`.

Creamos un fichero json con el siguiente contenido (o uno parecido):

```js
{
    "nombre": "Producto nuevo",
    "precio": 12,
    "categoriaId": 1
}
```

*Lo más fácil es ejecutar este comando desde la ubicación del archivo*

```sh
curl -X PUT -H "Authorization: Basic YWRtaW46QWRtaW4x" -H "Content-Type: application/json" -d "@modificaproducto.json" http://localhost:8080/producto/7 | jq .
```

## Transcripción

![11-01](images/11-01.png)
![11-02](images/11-02.png)
![11-03](images/11-03.png)
![11-04](images/11-04.png)
![11-05](images/11-05.png)
![11-06](images/11-06.png)
![11-07](images/11-07.png)

# 12 Implementación de la seguridad básica 14:07 

[PDF Seguridad_básica_implementación.pdf](pdfs/11_Seguridad_básica_implementación.pdf)

## Resumen Profesor

No existe.

## Transcripción

![12-01](images/12-01.png)
![12-02](images/12-02.png)
![12-03](images/12-03.png)
![12-04](images/12-04.png)
![12-05](images/12-05.png)

# 13 Refactorización del controlador 15:01 

[PDF Seguridad_básica_refactorización.pdf](pdfs/12_Seguridad_básica_refactorización.pdf)

## Resumen Profesor

No existe.

## Transcripción

![13-01](images/13-01.png)
![13-02](images/13-02.png)
![13-03](images/13-03.png)
![13-04](images/13-04.png)
![13-05](images/13-05.png)
![13-06](images/13-06.png)

# 14 Despliegue y pruebas 12:46 

[PDF Seguridad_Despliegue_y_prueba.pdf](pdfs/13_Seguridad_Despliegue_y_prueba.pdf)

## Resumen Profesor

No existe.

## Transcripción

![14-01](images/14-01.png)
![14-02](images/14-02.png)
![14-03](images/14-03.png)
![14-04](images/14-04.png)
![14-05](images/14-05.png)
![14-06](images/14-06.png)

# Contenido adicional 4

* [PDF Seguridad_básica_en_qué_consiste.pdf](pdfs/10_Seguridad_básica_en_qué_consiste.pdf)
* [PDF Seguridad_básica_implementación.pdf](pdfs/11_Seguridad_básica_implementación.pdf)
* [PDF Seguridad_básica_refactorización.pdf](pdfs/12_Seguridad_básica_refactorización.pdf)
* [PDF Seguridad_Despliegue_y_prueba.pdf](pdfs/13_Seguridad_Despliegue_y_prueba.pdf)
