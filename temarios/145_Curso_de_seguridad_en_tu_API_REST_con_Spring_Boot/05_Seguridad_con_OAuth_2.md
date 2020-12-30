# 5. Seguridad con OAuth 2 91m

* 25 ¿En qué consiste OAuth 2? 7:12 
* 26 Roles 4:25 
* 27 Flujo abstracto del protocolo 6:42 
* 28 Grant Types 11:28 
* 29 Implementando el servidor de autorización 14:46 
* 30 Implementando el servidor de recursos 5:33 
* 31 Reconfigurando CORS 9:19 
* 32 Despliegue y prueba de ejecución 12:25 
* 33 Tokens en base de datos 12:12 
* 34 Integrando OAuth 2 y JWT 7:28 
* Contenido adicional 10

# 25 ¿En qué consiste OAuth 2? 7:12 

[PDF OAuth2_En_qué_consiste.pdf](pdfs/24_OAuth2_En_qué_consiste.pdf)

## Resumen Profesor

La documentación oficial sobre OAuth 2.0 la podemos encontrar en https://oauth.net/2/.

En ella, se indican algunos RFCs útiles sobre dicho framework:

* RFC 6749: OAuth 2.0 Framework https://tools.ietf.org/html/rfc6749
* RFC 6750: Bearer Tokens https://oauth.net/2/bearer-tokens/
* RFC 6819: Threat Model and Security Considerations https://oauth.net/2/security-considerations/

Sobre Tokens y su gestión

* RFC 7662: Token Introspection https://oauth.net/2/token-introspection/
* RFC 7009: Token revocation https://oauth.net/2/token-revocation/
* RFC 7519: Json Web token https://oauth.net/2/jwt/

## Transcripción

![25-01](images/25-01.png)
![25-02](images/25-02.png)
![25-03](images/25-03.png)
![25-04](images/25-04.png)
![25-05](images/25-05.png)
![25-06](images/25-06.png)

# 26 Roles 4:25 

[PDF OAuth2_roles.pdf](pdfs/25_OAuth2_roles.pdf)

## Resumen Profesor

No existe.

## Transcripción

![26-01](images/26-01.png)
![26-02](images/26-02.png)
![26-03](images/26-03.png)
![26-04](images/26-04.png)
![26-05](images/26-05.png)
![26-06](images/26-06.png)
![26-07](images/26-07.png)

# 27 Flujo abstracto del protocolo 6:42 

[PDF OAuth2_Flujo_abstracto.pdf](pdfs/26_OAuth2_Flujo_abstracto.pdf)

## Resumen Profesor

No existe.

## Transcripción

![27-01](images/27-01.png)
![27-02](images/27-02.png)
![27-03](images/27-03.png)
![27-04](images/27-04.png)
![27-05](images/27-05.png)
![27-06](images/27-06.png)
![27-07](images/27-07.png)
![27-08](images/27-08.png)
![27-09](images/27-09.png)
![27-10](images/27-10.png)
![27-11](images/27-11.png)
![27-12](images/27-12.png)
![27-13](images/27-13.png)

# 28 Grant Types 11:28 

[PDF OAuth2_Grant_Types.pdf](pdfs/27_OAuth2_Grant_Types.pdf)

## Resumen Profesor

No existe.

## Transcripción

![28-01](images/28-01.png)
![28-02](images/28-02.png)
![28-03](images/28-03.png)
![28-04](images/28-04.png)
![28-05](images/28-05.png)
![28-06](images/28-06.png)
![28-07](images/28-07.png)
![28-08](images/28-08.png)
![28-09](images/28-09.png)
![28-10](images/28-10.png)
![28-11](images/28-11.png)
![28-12](images/28-12.png)
![28-13](images/28-13.png)
![28-14](images/28-14.png)
![28-15](images/28-15.png)
![28-16](images/28-16.png)
![28-17](images/28-17.png)
![28-18](images/28-18.png)
![28-19](images/28-19.png)
![28-20](images/28-20.png)

# 29 Implementando el servidor de autorización 14:46 

[PDF OAuth2_Servidor_de_autenticación.pdf](pdfs/28_OAuth2_Servidor_de_autenticación.pdf)

## Resumen Profesor

La dependencia necesaria para implementar nuestro servidor de autenticación es la siguiente:

```html
<dependency>
    <groupId>org.springframework.security.oauth.boot</groupId>    <artifactId>spring-security-oauth2-autoconfigure</artifactId>
    <version>2.X.Y.RELEASE</version>
</dependency>
```

donde `2.X.Y.RELEASE` es la versión de Spring Boot.

## Transcripción

![29-01](images/29-01.png)
![29-02](images/29-02.png)
![29-03](images/29-03.png)
![29-04](images/29-04.png)
![29-05](images/29-05.png)
![29-06](images/29-06.png)

# 30 Implementando el servidor de recursos 5:33 

[PDF OAuth2_Servidor_de_recursos.pdf](pdfs/29_OAuth2_Servidor_de_recursos.pdf)

## Resumen Profesor

No existe.

## Transcripción

![30-01](images/30-01.png)
![30-02](images/30-02.png)
![30-03](images/30-03.png)
![30-04](images/30-04.png)

# 31 Reconfigurando CORS 9:19 

[PDF OAuth2_Reconfigurando_CORS.pdf](pdfs/30_OAuth2_Reconfigurando_CORS.pdf)

## Resumen Profesor

No existe.

## Transcripción

![31-01](images/31-01.png)
![31-02](images/31-02.png)
![31-03](images/31-03.png)
![31-04](images/31-04.png)
![31-05](images/31-05.png)

# 32 Despliegue y prueba de ejecución 12:25 

[PDF OAuth2_Ejecución.pdf](pdfs/31_OAuth2_Ejecución.pdf)

## Resumen Profesor

No existe.

## Transcripción

![32-01](images/32-01.png)
![32-02](images/32-02.png)
![32-03](images/32-03.png)
![32-04](images/32-04.png)
![32-05](images/32-05.png)
![32-06](images/32-06.png)

# 33 Tokens en base de datos 12:12 

[PDF OAuth2_Base_de_datos.pdf](pdfs/32_OAuth2_Base_de_datos.pdf)

## Resumen Profesor

En el siguiente enlace podemos encontrar el DDL necesario para generar las tablas para persistir la información asociada a OAuth2.0: clientes, tokens, …

https://github.com/spring-projects/spring-security-oauth/blob/master/spring-security-oauth2/src/test/resources/schema.sql

```sql
-- used in tests that use HSQL
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication LONGVARBINARY,
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication LONGVARBINARY
);

create table oauth_code (
  code VARCHAR(256), authentication LONGVARBINARY
);

create table oauth_approvals (
    userId VARCHAR(256),
    clientId VARCHAR(256),
    scope VARCHAR(256),
    status VARCHAR(10),
    expiresAt TIMESTAMP,
    lastModifiedAt TIMESTAMP
);


-- customized oauth_client_details table
create table ClientDetails (
  appId VARCHAR(256) PRIMARY KEY,
  resourceIds VARCHAR(256),
  appSecret VARCHAR(256),
  scope VARCHAR(256),
  grantTypes VARCHAR(256),
  redirectUrl VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(256)
);
```

En esta web se indica que se ha probado con HSQL, y también funciona en H2.

## Transcripción

![33-01](images/33-01.png)
![33-02](images/33-02.png)
![33-03](images/33-03.png)
![33-04](images/33-04.png)
![33-05](images/33-05.png)
![33-06](images/33-06.png)
![33-07](images/33-07.png)

# 34 Integrando OAuth 2 y JWT 7:28 

[PDF OAuth2_JsonWebToken.pdf](pdfs/33_OAuth2_JsonWebToken.pdf)

## Resumen Profesor

No existe.

## Transcripción

![34-01](images/34-01.png)
![34-02](images/34-02.png)
![34-03](images/34-03.png)
![34-04](images/34-04.png)

# Contenido adicional 10

* [PDF OAuth2_En_qué_consiste.pdf](pdfs/24_OAuth2_En_qué_consiste.pdf)
* [PDF OAuth2_roles.pdf](pdfs/25_OAuth2_roles.pdf)
* [PDF OAuth2_Flujo_abstracto.pdf](pdfs/26_OAuth2_Flujo_abstracto.pdf)
* [PDF OAuth2_Grant_Types.pdf](pdfs/27_OAuth2_Grant_Types.pdf)
* [PDF OAuth2_Servidor_de_autenticación.pdf](pdfs/28_OAuth2_Servidor_de_autenticación.pdf)
* [PDF OAuth2_Servidor_de_recursos.pdf](pdfs/29_OAuth2_Servidor_de_recursos.pdf)
* [PDF OAuth2_Reconfigurando_CORS.pdf](pdfs/30_OAuth2_Reconfigurando_CORS.pdf)
* [PDF OAuth2_Ejecución.pdf](pdfs/31_OAuth2_Ejecución.pdf)
* [PDF OAuth2_Base_de_datos.pdf](pdfs/32_OAuth2_Base_de_datos.pdf)
* [PDF OAuth2_JsonWebToken.pdf](pdfs/33_OAuth2_JsonWebToken.pdf)
