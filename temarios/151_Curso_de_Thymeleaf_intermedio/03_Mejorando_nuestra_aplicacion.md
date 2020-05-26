# 3. Mejorando nuestra aplicación 92m

   * 11 ¿Qué necesito saber de Spring Security? 10:09 
   * 12 Integración con Spring Security 19:10 
   * 13 Uso de enumeraciones 16:07 
   * 14 Manejo de fechas en Java 8 9:43 
   * 14 Paginación de resultados: Consulta 13:13 
   * 16 Paginación de resultados: Navegación 12:43 
   * 17 Atributos de HTML5 11:01 
   * Contenido adicional 7
   
# 11 ¿Qué necesito saber de Spring Security? 10:09

[PDF Que_necesito_saber_de_Spring_Security.pdf](pdfs/10_Que_necesito_saber_de_Spring_Security.pdf)

## Resumen Profesor

Se trata del estándar de-facto para manejar la seguridad en aplicaciones Spring. Es un framework amplio, *sencillo* y extensible que nos permite manejar los dos elementos básicos de la seguridad:

* **Autenticación**: ¿tú quién eres?
* **Autorización**: ¿tú qué puedes hacer?

Su integración a través de Spring Boot es muy sencilla.

Para utilizarlo, tan solo tenemos que añadir esta dependencia a nuestro `pom.xml`

```html
<dependency>  
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

Si quieres saber más sobre como empezar a integrar una aplicación Spring MVC con Spring Security, puedes visitar nuestro **curso de Spring Boot y Spring MVC**.

### *Password Encoder*

Cuando tenemos un sistema en producción, no es buena práctica que las contraseñas estén almacenadas como texto plano sin cifrar, ya que *cualquiera* podría verlas. Lo ideal es almacenarlas de forma cifrada.

Spring Security nos permite utilizar un bean de tipo *PasswordEncoder* para cifrar las contraseñas, y lo usa automáticamente al realizar la autenticación.

Sin embargo, cuando estamos en proceso de desarrollo, o de aprendizaje de la tecnología, es posible que nos interese almacenar estas contraseñas como texto plano. Para ello (ya que Spring Security nos obliga a establecer un *password encoder*) podemos usar el *NoOp Password Encoder* es uno que, en realidad, no hace nada.

En versiones anteriores de Spring Security, la forma de obtenerlo era la siguiente:

`NoOpPasswordEncoder.getInstance();`

Sin embargo, esta está deprecada para Spring Security 5.

Si queremos usar este cifrado de contraseña con usuarios almacenados en memoria (como digo, una práctica habitual durante el desarrollo, o cuando estamos aprendiendo la tecnología), Spring Security 5 nos ofrece la siguiente sintaxis:

```java
auth.inMemoryAuthentication()
    .withUser("admin").password("{noop}admin").roles("ADMIN");
```    

En realidad, ese `{noop}` es un *id* de *password encoder*. Algunos de los habituales son:

* `{noop}`: usaría `NoOpPasswordEncoder`.
* `{bcrypt}`: usaría `BCryptPasswordEncoder`.
* `{pbkdf2}`: usaría `Pbkdf2PasswordEncoder`.
* `{scrypt}`: usaría `SCryptPasswordEncoder`.
* `{sha256}`: usaría `StandardPasswordEncoder`.

*Puedes encontrar más información [aquí](https://docs.spring.io/spring-security/site/docs/current/reference/html5/#pe-dpe)*

## Transcripción

# 12 Integración con Spring Security 19:10 

[PDF Integracion_con_Spring_Security.pdf](pdfs/11_Integracion_con_Spring_Security.pdf)

## Resumen Profesor

Tenemos a nuestra disposición una librería que nos ofrece un *dialecto* para Thymeleaf con funciones de seguridad de Spring Security. Esto nos proporciona algunos objetos y atributos que nos harán la vida más fácil.

Para utilizar esta librería *extra*, tenemos que añadir la siguiente dependencia:

```html
<dependency>
    <groupId>org.thymeleaf.extras</groupId>
    <artifactId>thymeleaf-extras-springsecurity5</artifactId>
    <version>3.0.4.RELEASE</version>
</dependency>
```

*¡Ojo! Si estamos trabajando con otra versión de Spring Security diferente a la 5.X, tenemos que cambiar el artifactId `thymeleaf-extras-springsecurity5` por la versión concreta (4 o 3).*

Para poder utilizar las expresiones de esta librería, tenemos que añadir el espacio de nombres correspondiente en la etiqueta `<html>` de nuestras plantillas:

```html
<html … xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
```
  
### Configuración

**Si utilizamos Spring Boot, la configuración será automática**. Si no lo utilizamos, tenemos que configurar el dialecto como uno adicional. La configuración vía XML sería:

```html
<bean id="templateEngine" class="org.thymeleaf.spring5.SpringTemplateEngine">
  ...
  <property name="additionalDialects">
    <set>
      <!-- Note the package would change to 'springsecurity[3|4]' if you are using that version -->
      <bean class="org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect"/>
    </set>
  </property>
...
</bean>
```

Y a través de JavaConfig, sería:

```java
@Bean
public SpringTemplateEngine templateEngine(){
    SpringTemplateEngine templateEngine = new SpringTemplateEngine();
    Set<IDialect> additionalDialects = new Set<>();
    additionalDialects.add(new org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect);
    templateEngine.setAdditionalDialects(additionalDialects);
    // resto de la configuración.
    return templateEngine;
}
```

### Funcionalidades

Este dialecto incluye algunos nuevos objetos de utilidad:

* `#authentication`, que representa el objeto `org.springframework.security.core.Authentication` de Spring Security. Por ejemplo: 

```html
<div th:text="${#authentication.name}">  
   El valor de la propiedad "name" aparecería aquí.
</div>
```


* `#authorization`, un objeto con algunos métodos para chequear la autorización en base a expresiones, URLs o listas ACL.

También incluye algunos nuevos atributos:

* `sec:authentication="prop"`, que nos permite obtener la propiedad `prop` del objeto `Authentication`.
* `sec:authorize="expr"`, que renderiza el contenido está autorizado en base a la expresión utilizada. Por ejemplo:

```html
<div sec:authorize="hasRole('ROLE_ADMIN')">
  Solamente se muestra si el usuario tiene el rol ROLE_ADMIN.
</div>
```

* `sec:authorize-url="url"`, que renderiza el contenido si el usuario está autenticado a acceder a la URL especificada.

* `sec:authorize-acl="object::permissions"`, que renderiza el contenido si el usuario autenticado tiene los permisos específicos para dicho objeto según la lista ACL.

## Transcripción

# 13 Uso de enumeraciones 16:07 

[PDF Uso_de_enumeraciones.pdf](pdfs/12_Uso_de_enumeraciones.pdf)

## Resumen Profesor

Se trata de una forma de definir un nuevo tipo de dato a partir de un conjunto de constantes predefinidas. Una variable del tipo enumerado debe tener como valor una de esas constantes.

Los enumerados de Java dan más juego del que pensamos a priori. Si quieres saber más sobre los enums, puedes visitar nuestro curso de **Java 8 para programadores Java**.

### El operador `T`

El operador `T` *SpEL* nos permite especificar o cargar una determinada clase, y acceder a sus métodos. A través del método `values()` disponible en todas las enumeraciones, podemos usar el operador `T` para obtener una colección con todos los valores de la enumeración que necesitemos. Por ejemplo:

```html
<option th:each="disponibilidad : ${T(com.openwebinars.proyecto.modelo.Disponibilidad).values()}" ...></option>
```

*Para más información, puedes visitar la [documentación oficial de Spring Framework](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#expressions-types)*


### Comparaciones con una estructura *switch-case*

Podemos utilizar un tipo enumerado en una estructura switch-case de Thymeleaf, por si tiene más de 2 constantes como valores posibles:

```html
<div th:switch="${producto.disponibilidad}">
    <span th:case="${T(com.openwebinars.proyecto.modelo).SIN_STOCK}" ...>...</span>
    <span th:case="${T(com.openwebinars.proyecto.modelo).STOCK_BAJO}" ...>...</span>
    <!-- Resto del código ...-->
</div>
```

## Transcripción

# 14 Manejo de fechas en Java 8 9:43 

[PDF Manejo_de_fechas_de_Java_8.pdf](pdfs/13_Manejo_de_fechas_de_Java_8.pdf)

## Resumen Profesor

A partir de Spring Boot 2, la dependencia *starter* de Thymeleaf nos incluye la librería de extras para fechas de Java 8.

Si estamos trabajando con una versión anterior, tendríamos que añadir la siguiente dependencia:

```html
<dependency>
    <groupId>org.thymeleaf.extras</groupId>
    <artifactId>thymeleaf-extras-java8time</artifactId>
</dependency>
```

Si además, estamos trabajando sin Spring Boot, necesitamos configurar el dialecto que nos aporta esta librería de extras. Para hacerlo, operamos como en otras ocasiones:

```java
TemplateEngine templateEngine = new SpringTemplateEngine();
templateEngine.addDialect(new Java8TimeDialect());
```

En este [enlace](https://github.com/thymeleaf/thymeleaf-extras-java8time) podemos encontrar todas las clases de `java.time` con la que nos permite trabajar esta librería de extras, así como los métodos mas comunes.

## Transcripción

# 15 Paginación de resultados: Consulta 13:13

[PDF Paginacion_de_resultados_I.pdf](pdfs/14_Paginacion_de_resultados_I.pdf)

## Resumen Profesor

Cuando el número de resultados de una consulta a mostrar en una *pantalla* es grande, es necesario **dividirlo**. Las razones son la eficiencia, ya que una consulta con muchos resultados requiere de un gran tiempo de procesamiento de servidor y la transferencia de una gran cantidad de datos; así como por experiencia de usuario. ¿Te imaginas que twitter cargara todos los tuits de tu timeline desde que te diste de alta, y cada vez que entras en la app?

La solución para *dividir* estos resultados es la paginación; es decir, vamos a dividir el total de resultados de una consulta en lotes (o páginas) de un tamaño determinado. Por ejemplo, si una consulta devuelve 33 resultados, y estimamos como tamaño de página 12, obtendríamos 3 páginas (la última de ellas, no estaría completa, pero no pasa nada).

### Paginación con Spring

#### Spring Data JPA

Spring Data nos ofrece la posibilidad de realizar consultas paginadas. La interfaz que venimos utilizando para crear los repositorios es `JpaRepository`, que a su vez extiende de `PagingAndSortingRepository`. Esta última tiene métodos convenientes para poder realizar consultas paginadas. Además, también podemos paginar cualquier consulta que añadamos de nuestra cosecha.

Todo ello se consigue a través de dos interfaces, `Pageable` y `Page<T>`.

### Pageable

Se trata de un parámetro de entrada para la consulta. Indica qué tamaño y qué página queremos obtener. Puedes ver su documentación [aquí](https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/domain/Pageable.html)

### Page

Se trata del resultado de una consulta. Es un subconjunto de resultados, con la información sobre paginación. Puedes ver su documentación [aquí](https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/domain/Page.html).

### Spring Data Web Support

La paginación debe ser soportada por la capa de persistencia subyacente (cosa que conseguimos con Spring Data JPA); pero la debemos manejar desde los controladores. A ello nos ayuda *Spring Data Web Support*, que se configura automáticamente cuando utilizamos Spring Boot con las dependencias starter de web y data. De esta forma, podremos usar la interfaz `Pageable` en un controlador.

```java
@Controller
public class ProductoController {
    // resto del código
    @GetMapping("/")
    public String index(Model model, Pageable pageable) {
    model.addAttribute("productos", 
    productoService.findAllPaginated(pageable));
    return "admin/list-producto";
    }
    //resto del código

}
```

La firma del método anterior hace que Spring MVC intente construir una instancia de `Pageable` a partir de los parámetros de solicitud utilizando la siguiente configuración predeterminada.

* Parámetro `page`: número de página a rescatar (comenzando en cero)
* Parámetro `size`: tamaño de página. Por defecto es 20.
* Parámetro `sort`: propiedades sobre las que se aplicará el orden.

A partir del conjunto de esos 3 parámetros, Spring MVC construye el objeto `Pageable`.

### Algunas propiedades

Podemos configurar algunos parámetros de Spring Data Web Support a través de propiedades. El listado completo lo tenemos en https://docs.spring.io/spring-boot/docs/current/reference/html/common-application-properties.html.

*Las puedes encontrar rápidamente buscando por `spring.data.web`.*

## Transcripción

# 16 Paginación de resultados: Navegación 12:43 

[PDF Paginacion_de_resultados_II.pdf](pdfs/15_Paginacion_de_resultados_II.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 17 Atributos de HTML5 11:01 

[PDF Atributos_HTML5.pdf](pdfs/16_Atributos_HTML5.pdf)

## Resumen Profesor

### Atributos

Todas las etiquetas de HTML soportan un gran número de atributos.

*Si quieres consultar la lista completa, puedes visitarla en [w3schools](https://www.w3schools.com/tags/ref_attributes.asp)*

Thymeleaf nos proporciona un mecanismo genérico (pero algo tedioso) para establecer atributos, a través de `th:attr`.

```html
<img src="../images/logo.png" th:attr="src=@{/images/logo.png},title=#{logo},alt=#{logo}" />
```

*Una de las ventajas de `th:attr` es que nos permite establecer más de un atributo a la vez*

Normalmente, establecemos los atributos a través de `th:atributo`.

*La lista completa de atributos que podemos establecer con Thymeleaf la puedes consultar [aquí](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#setting-value-to-specific-attributes)*

### Algunos atributos especiales

Como norma general, **un atributo de Thymeleaf establece el valor de un solo atributo de HTML**, pero existen dos excepciones, `th:alt-title` y `th:lang-xmllang`. Por ejemplo, `th:alt-title` nos permite establecer los atributos `alt` y `title` de una imagen a la vez.

```html
<img src="../images/logo.png" th:src=”@{/images/logo.png}” th:alt-title=”#{logo}” />
```

produce

```html
<img src=”/app/images/logo.png” title=”Mi App” alt=”Mi App” />
```

### Atributos booleanos

HTML/XHTML tiene una serie de valores booleanos. La diferencia entre HTML5 y XHTML es que en el primero el atributo no toma valor, y con XHTML sí que lo tiene que tomar (un solo valor, que debe ser el mismo que el nombre del atributo)

```html
<input type="checkbox" name="op1" checked /> <!-- HTML -->
<input type="checkbox" name="op2" checked="checked" /> <!-- XHTML -->
```

Thymeleaf nos permite establecer estos atributos mediante la evaluación de una condición

```html
<input type="checkbox" name="op1" th:checked=”${condición}” />
```

La expresión renderizada con Thymeleaf será válida para HTML5 o para XTHML

*La lista completa de atributos booleanos que podemos establecer con Thymeleaf la puedes consultar [aquí](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#fixed-value-boolean-attributes)*

### Thymeleaf al estilo de HTML5

Thymeleaf nos permite cambiar la sintaxis de tipo `th:*` por una más del estilo HTML5, que es `data-th-*`. Se aprovecha de la sintaxis de los atributos propios de HTML5, que es `data-{prefijo}-{propiedad}`.

### Thymeleaf y los atributos `data-*`

No es lo mismo del apartado de antes. HTML5 permite extender los atributos de las etiquetas, creando atributos propios, con la sintaxis `data-*`. El nombre del atributo no puede contener mayúsculas y el valor puede ser una cadena de caracteres.

Thymeleaf nos permite establecer estos atributos con `th:data-*`. Podemos encontrar un ejemplo en la versión inicial del proyecto: necesitamos pasar a un modal el `id` de la categoría a borrar; usamos `data-id` para almacenar el valor

```html
<button type="button" class="btn btn-danger" 
        data-toggle="modal" data-target="#delete-modal" 
        th:data-id="${categoría.id}">Borrar</button>
```

## Transcripción

# Contenido adicional 7   

* [PDF Que_necesito_saber_de_Spring_Security.pdf](pdfs/10_Que_necesito_saber_de_Spring_Security.pdf)
* [PDF Integracion_con_Spring_Security.pdf](pdfs/11_Integracion_con_Spring_Security.pdf)
* [PDF Uso_de_enumeraciones.pdf](pdfs/12_Uso_de_enumeraciones.pdf)
* [PDF Manejo_de_fechas_de_Java_8.pdf](pdfs/13_Manejo_de_fechas_de_Java_8.pdf)
* [PDF Paginacion_de_resultados_I.pdf](pdfs/14_Paginacion_de_resultados_I.pdf)
* [PDF Paginacion_de_resultados_II.pdf](pdfs/15_Paginacion_de_resultados_II.pdf)
* [PDF Atributos_HTML5.pdf](pdfs/16_Atributos_HTML5.pdf)
