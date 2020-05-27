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

# 26 Roles 4:25 

[PDF OAuth2_roles.pdf](pdfs/25_OAuth2_roles.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 27 Flujo abstracto del protocolo 6:42 

[PDF OAuth2_Flujo_abstracto.pdf](pdfs/26_OAuth2_Flujo_abstracto.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 28 Grant Types 11:28 

[PDF OAuth2_Grant_Types.pdf](pdfs/27_OAuth2_Grant_Types.pdf)

## Resumen Profesor

No existe.

## Transcripción

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

# 30 Implementando el servidor de recursos 5:33 

[PDF OAuth2_Servidor_de_recursos.pdf](pdfs/29_OAuth2_Servidor_de_recursos.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 31 Reconfigurando CORS 9:19 

[PDF OAuth2_Reconfigurando_CORS.pdf](pdfs/30_OAuth2_Reconfigurando_CORS.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 32 Despliegue y prueba de ejecución 12:25 

[PDF OAuth2_Ejecución.pdf](pdfs/31_OAuth2_Ejecución.pdf)

## Resumen Profesor

No existe.

## Transcripción

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

# 34 Integrando OAuth 2 y JWT 7:28 

[PDF OAuth2_JsonWebToken.pdf](pdfs/33_OAuth2_JsonWebToken.pdf)

## Resumen Profesor

No existe.

## Transcripción

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
