# 4. Seguridad con JWT 80m

* 15 ¿En qué consiste JWT? 11:10 
* 16 Librerías necesarias 4:07 
* 17 Implementación de la seguridad con JWT 6:37 
* 18 Customización del AuthenticationEntryPoint 4:37 
* 19 Modelo de usuario y UserDetailService 4:49 
* 20 Manejo del token JWT 15:07 
* 21 JWTAuthenticationFilter 10:51 
* 22 Modelo para el login y su respuesta 7:18 
* 23 Refactorización del controlador 11:58 
* 24 Despliegue y pruebas con JWT 4:12 
* Contenido adicional 9

# 15 ¿En qué consiste JWT? 11:10 

[PDF JWT_en_qué_consiste.pdf](pdfs/14_JWT_en_qué_consiste.pdf)

## Resumen Profesor

Puedes leer la información más completa sobre la especificación JWT aquí: https://tools.ietf.org/html/rfc7519.

Para depurar tus tokens JWT, puedes utilizar la siguiente herramienta: https://jwt.io/#debugger-io.

## Transcripción

# 16 Librerías necesarias 4:07 

[PDF JWT_Liberías_necesarias.pdf](pdfs/15_JWT_Liberías_necesarias.pdf)

## Resumen Profesor

Las dependencias a incluir para trabajar con JWT es:

```html
<!-- https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-impl -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-impl</artifactId>
    <version>0.10.7</version>
    <scope>runtime</scope>
</dependency>
<!-- https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-api -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.10.7</version>
</dependency>
<!-- https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-jackson -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-jackson</artifactId>
    <version>0.10.7</version>
    <scope>runtime</scope>
</dependency>
```

Puedes encontrar una documentación más extensa sobre esta librería en https://github.com/jwtk/jjwt. Tal y como indica dicha documentación, la mayor parte de la complejidad se oculta detrás de una interfaz fluida basada en un generador. Valga el siguiente ejemplo:

```java
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.security.Key;

// We need a signing key, so we'll create one just for this example. Usually
// the key would be read from your application configuration instead.
Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);

String jws = Jwts.builder().setSubject("Joe").signWith(key).compact();
```

El resultado parecerá algo así:

`eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJKb2UifQ.1KP0SsvENi7Uz1oQc07aXTL7kpQG5jBNIybqr60AlD4`

## Transcripción

# 17 Implementación de la seguridad con JWT 6:37 

[PDF JWT_seguridad.pdf](pdfs/16_JWT_seguridad.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 18 Customización del AuthenticationEntryPoint 4:37 

[PDF JWT_AuthenticationEntryPoint.pdf](pdfs/17_JWT_AuthenticationEntryPoint.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 19 Modelo de usuario y UserDetailService 4:49 

[PDF JWT_Users.pdf](pdfs/18_JWT_Users.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 20 Manejo del token JWT 15:07 

[PDF JWT_manejo_del_token.pdf](pdfs/19_JWT_manejo_del_token.pdf)

## Resumen Profesor

### Token `signWith`

La librería JJWT ha cambiado en sus últimas versiones, sobre todo con respecto a firmar el token.

Con el siguiente código, podemos generar una clave aleatoria:

```sh
Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
String jws = Jwts.builder().setSubject("Joe").signWith(key).compact();
```

Según la documentación, podemos la librería puede encargarse de determinar el mejor algoritmo en función de la longitud en bytes de la misma. Por ejemplo, si llamamos a `signWith` con una `SecretKey` de 32 bytes, no será suficientemente fuerte para el algoritmo `HS384` o `HS512`, por lo que la librería aplicará el algoritmo `HS256`. Además, cuando se firma, automáticamente se añade el algoritmo en el parámetro `alg` en el encabezado.

El método utilizado en el ejemplo es `HS512`, porque la longitud de la clave lo permite:

```java
return Jwts.builder.signWith(Keys.hmacShaKeyFor(jwtSecreto.getBytes()), SignatureAlgorithm.HS512)...
```

El método `hmacShaKeyFor` crea una nueva `SecretKey` para usar con algoritmos basados en HMAC-SHA, recibiendo la clave como un array de bytes.

### Descifrado del token

Podemos descifrar el token aplicamos de nuevo la clave secreta, y a partir de ahí podemos obtener el claim que necesitemos:

```java
public Long getUserIdFromJWT(String token) {
    Claims claims = Jwts.parser()
                        .setSigningKey(Keys.hmacShaKeyFor(jwtSecreto.getBytes()))
                        .parseClaimsJws(token)
                        .getBody();

    return Long.parseLong(claims.getSubject());
}
```

## Transcripción

# 21 JWTAuthenticationFilter 10:51 

[PDF JWT_AuthorizationFilter.pdf](pdfs/20_JWT_AuthorizationFilter.pdf)

## Resumen Profesor

Según la documentación de Spring Security, para realizar la autenticación basada en *usuario* y *contraseña*, podemos utilizar una instancia de `UsernamePasswordAuthenticationToken`. Se trata de una implementación de `Authentication`.

Si la autenticación se realiza correctamente (en nuestro caso, si el token es validado), debemos almacenar en el contexto de seguridad una instancia de dicha clase:

```java
if (StringUtils.hasText(token) && tokenProvider.validateToken(token)) {
    Long userId = tokenProvider.getUserIdFromJWT(token);

    UserEntity user = (UserEntity) userDetailsService.loadUserById(userId);
    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(user, user.getRoles(), user.getAuthorities());
    authentication.setDetails(new WebAuthenticationDetails(request));
    SecurityContextHolder.getContext().setAuthentication(authentication);

}
```

## Transcripción

# 22 Modelo para el login y su respuesta 7:18 

[PDF JWT_Modelo_de_login_y_respuesta.pdf](pdfs/21_JWT_Modelo_de_login_y_respuesta.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 23 Refactorización del controlador 11:58 

[PDF JWT_Controladores.pdf](pdfs/22_JWT_Controladores.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 24 Despliegue y pruebas con JWT 4:12 

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 9
