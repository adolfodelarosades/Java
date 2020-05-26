# 2. Algunas mejoras para nuestra API 62m

* 03 Paginación de resultados 20:46 
* 04 Manejo de parámetros en el Query (Parte I) 16:49 
* 05 Manejo de parámetros en el Query (Parte II) 17:25 
* 06 Soporte para XML 7:19 
* Contenido adicional 4

# 03 Paginación de resultados 20:46 

[PDF Paginación_de_resultados.pdf](pdfs/01_Paginación_de_resultados.pdf)

## Resumen Profesor

### Paginación

Algunas de las clases/interfaces que se utilizan durante esta lección son estas:

* PagingAndSortingRepository: https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/PagingAndSortingRepository.html
* Page: https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/domain/Page.html
* Pageable: https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/domain/Pageable.html.
* @PageableDefault: https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/web/PageableDefault.html

### RFC 5988

Según el *request for comments* 5988, en un API Rest paginado deberíamos incluir el encabezado link, siguiendo una estructura como la que sigue en el ejemplo:

<http://localhost:8080/producto/?page=2&size=10>; rel="next", <http://localhost:8080/producto/?page=0&size=10>; rel="prev", <http://localhost:8080/producto/?page=0&size=10>; rel="first", <http://localhost:8080/producto/?page=2&size=10>; rel="last"

## Transcripción

# 04 Manejo de parámetros en el Query (Parte I) 16:49 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción


# 05 Manejo de parámetros en el Query (Parte II) 17:25 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción

# 06 Soporte para XML 7:19 

[PDF ](pdfs/)

## Resumen Profesor

No existe.

## Transcripción


# Contenido adicional 4
