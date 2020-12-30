# 1. Introducción 54m

* 01 Presentación 7:13 
* 02 Introducción a Spring Security 10:28 
* 03 Autenticación vs. autorización 10:34 
* 04 Clases e interfaces de Spring Security 14:22 
* 05 Posibilidades para implementar la seguridad de una API REST 12:21 
* Contenido adicional  5

# 01 Presentación 7:13

[PDF Presentacion.pdf](pdfs/00_Presentacion.pdf)

## Resumen Profesor

No existe.

## Transcripción

![01-01](images/01-01.png)
![01-02](images/01-02.png)
![01-03](images/01-03.png)
![01-04](images/01-04.png)
![01-05](images/01-05.png)
![01-06](images/01-06.png)

# 02 Introducción a Spring Security 10:28 

[PDF Introducción_a_Spring_Security.pdf](pdfs/01_Introducción_a_Spring_Security.pdf)

## Resumen Profesor

Puedes encontrar toda la documentación del proyecto Spring Security en https://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/

## Transcripción

![02-01](images/02-01.png)
![02-02](images/02-02.png)
![02-03](images/02-03.png)
![02-04](images/02-04.png)
![02-05](images/02-05.png)
![02-06](images/02-06.png)
![02-07](images/02-07.png)
![02-08](images/02-08.png)
![02-09](images/02-09.png)
![02-10](images/02-10.png)

# 03 Autenticación vs. autorización 10:34 

[PDF Autenticación_vs_Autorización.pdf](pdfs/02_Autenticación_vs_Autorización.pdf)

## Resumen Profesor

### ¿Qué es un `Principal`?

Según la wikipedia), un *Principal*, en el ámbito de la seguridad informática, es una entidad (persona, grupo, servicio, proceso, …) que puede ser autenticado en un sistema informático o red. En la literatura de Java y Microsoft suele encontrarse como *security principal*.

En Java, viene representado por la interfaz `java.security.Principal`.

### ¿Y un Authentication?

En Spring Security, la interfaz `org.springframework.security.core.Authentication`, que es nombrada en repetidas ocasiones durante esta lección, es una subinterfaz de `Principal`, proporcionando además de la información de esta, otra referente a *credenciales*, *authorities* y mecanismos para identificar si está autenticado o no.

En el mecanismo de autenticación, se utiliza en el método `AuthenticationManager.authenticate(Authentication)`.

## Transcripción

![03-01](images/03-01.png)
![03-02](images/03-02.png)
![03-03](images/03-03.png)
![03-04](images/03-04.png)
![03-05](images/03-05.png)
![03-06](images/03-06.png)
![03-07](images/03-07.png)
![03-08](images/03-08.png)
![03-09](images/03-09.png)
![03-10](images/03-10.png)
![03-11](images/03-11.png)
![03-12](images/03-12.png)
![03-13](images/03-13.png)

# 04 Clases e interfaces de Spring Security 14:22 

[PDF Algunas_clases_e_interfaces_de_Spring_Security.pdf](pdfs/03_Algunas_clases_e_interfaces_de_Spring_Security.pdf)

## Resumen Profesor

A continuación podemos ver el listado de enlaces a la documentación de las clases, interfaces y anotaciones que se explican en esta lección:

* `WebSecurityConfigurerAdapter: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/annotation/web/configuration/WebSecurityConfigurerAdapter.html`
* `@EnableWebSecurity: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/annotation/web/configuration/EnableWebSecurity.html`
* `Authentication: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/Authentication.html`
* `AuthenticationManagerBuilder: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/annotation/authentication/builders/AuthenticationManagerBuilder.html`
* `UserDetails: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetails.html`
* `User: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/User.html`
* `GrantedAuthority: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/GrantedAuthority.html`
* `SimpleGrantedAuthority: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/authority/SimpleGrantedAuthority.html`
* `UserDetailsService: https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetailsService.html`

## Transcripción

![04-01](images/04-01.png)
![04-02](images/04-02.png)
![04-03](images/04-03.png)
![04-04](images/04-04.png)
![04-05](images/04-05.png)
![04-06](images/04-06.png)
![04-07](images/04-07.png)
![04-08](images/04-08.png)
![04-09](images/04-09.png)
![04-10](images/04-10.png)
![04-11](images/04-11.png)

# 05 Posibilidades para implementar la seguridad de una API REST 12:21 

[PDF Posibilidades_para_implementar_la_seguridad_en_un_API_Rest.pdf](pdfs/04_Posibilidades_para_implementar_la_seguridad_en_un_API_Rest.pdf)

## Resumen Profesor

Si quieres saber más sobre los diferentes esquemas de autenticación, puedes visitar la siguiente documentación:

### Autenticación básica

Puedes leer algunos RFCs

* `RFC 1945: Hypertext Transfer Protocol`
* `RFC 2617: HTTP Authentication: Basic and Digest Access Authentication`

### Autenticación con JWT

JWT no es en sí un mecanismo de autenticación, aunque veremos que utilizando este estándar para la gestión de token podemos arreglárnoslas para poder hacer dicho proceso. Puedes leer más en:

* `RFC 7519: JSON Web Token (JWT)`
* `RFC 7797: JSON Web Signature (JWS) Unencoded Payload Option`

### OAuth 2.0

Puedes leer algunos RFCs

* `RFC 6749: The OAuth 2.0 Authorization Framework`
* `RFC 8252: OAuth 2.0 for Native Apps`
* `RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage`

También puedes encontrar más información en la web https://oauth.net/2/

## Transcripción

![05-01](images/05-01.png)
![05-02](images/05-02.png)
![05-03](images/05-03.png)
![05-04](images/05-04.png)
![05-05](images/05-05.png)
![05-06](images/05-06.png)
![05-07](images/05-07.png)
![05-08](images/05-08.png)
![05-09](images/05-09.png)
![05-10](images/05-10.png)

# Contenido adicional  5

* [PDF Presentacion.pdf](pdfs/00_Presentacion.pdf)
* [PDF Introducción_a_Spring_Security.pdf](pdfs/01_Introducción_a_Spring_Security.pdf)
* [PDF Autenticación_vs_Autorización.pdf](pdfs/02_Autenticación_vs_Autorización.pdf)
* [PDF Algunas_clases_e_interfaces_de_Spring_Security.pdf](pdfs/03_Algunas_clases_e_interfaces_de_Spring_Security.pdf)
* [PDF Posibilidades_para_implementar_la_seguridad_en_un_API_Rest.pdf](pdfs/04_Posibilidades_para_implementar_la_seguridad_en_un_API_Rest.pdf)
