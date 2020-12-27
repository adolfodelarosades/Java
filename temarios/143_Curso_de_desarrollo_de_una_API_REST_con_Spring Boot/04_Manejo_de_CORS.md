# 4. Manejo de CORS 19m

* 20 ¿Qué es CORS y por qué me va a dar problemas? 6:28 
* 21 ¿Cómo habilitar a nivel de método? 4:51 
* 22 Configuración CORS global 8:22 
* Contenido adicional 3

# 20 ¿Qué es CORS y por qué me va a dar problemas? 6:28

[PDF 19_Qué_es_CORS.pdf](pdfs/19_Qué_es_CORS.pdf)

## Resumen Profesor

Si quieres saber más sobre CORS, puedes visitar la documentación (en castellano) de desarrolladores de Mozila (MDN web docs) en https://developer.mozilla.org/es/docs/Web/HTTP/Access_control_CORS.

## Transcripción

![20-01](images/20-01.png)

Vamos a comenzar un nuevo bloque en el que vamos a hacer tratamiento de un mecanismo de seguridad que se llama **CORS**, en principio será algo que nos va a dar problema, entonces vamos a ver que es CORS y qué problemas nos va a dar y cómo podemos hacer el tratamiento.

![20-02](images/20-02.png)

Hasta ahora hemos probado nuestra API con Postman o hicimos una prueba al principio con CURL y no hemos tenido ningún problema a la hora de consumir o producir datos, hemos pedido los productos nos los ha devuelto, hemos pedido uno y lo ha devuelto, le hemos pasado un producto y lo hemos podido crear, lo hemos podido modificar, lo hemos podido borrar y hasta ahora no hemos tenido problemas.

![20-03](images/20-03.png)

Sin embargo si queremos consumir nuestra API por ejemplo desde una aplicación Angular, JQuery, con JavaScript directamente a través de un objeto XHR, la respuesta del navegador va a ser distinta.

Vamos a hacer una prueba en directo.

### :computer: `143-10-ProblemasCORS`

Vamos a hacer una copia del proyecto `143-09-ResponseStatusException` y lo llamaremos `143-10-ProblemasCORS` es un proyecto exactamente igual, solo cambiamos el `pom.xml` para que tenga el nuevo nombre pero ningún cambio más.

#### 01. Modificar el `pom.xml`

```html
<artifactId>143-10-ProblemasCORS</artifactId>
<version>0.0.1-SNAPSHOT</version>
<name>143-10-ProblemasCORS</name>
<description>Ejemplo de problema provocado por la no configuración de CORS</description>
```

Este proyecto es nuestro BACK, necesitamos tener la aplicación Cliente.

### :computer: `143-10-ProblemasCORSCliente`

Vamos a descargar del repositorio del curso el proyecto `19_ProblemasCORSCliente` y lo copiamos con el nombre `143-10-ProblemasCORSCliente`. Su estructura es la siguiente:

![143-10-01](images/143-10-01.png)

Vamos a poner todo el código de este proyecto.

`pom.xml`

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.1.8.RELEASE</version>
      <relativePath /> <!-- lookup parent from repository -->
   </parent>
   <groupId>com.openwebinars.rest</groupId>
   <artifactId>143-10-ProblemasCORSCliente</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>143-10-ProblemasCORSCliente</name>
   <description>Ejemplo de problema provocado por la no configuración de CORS </description>

   <properties>
      <java.version>1.8</java.version>
   </properties>

   <dependencies>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
      </dependency>

      <dependency>
         <groupId>com.h2database</groupId>
         <artifactId>h2</artifactId>
         <scope>runtime</scope>
      </dependency>
      <dependency>
         <groupId>org.projectlombok</groupId>
         <artifactId>lombok</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-test</artifactId>
         <scope>test</scope>
      </dependency>
      <dependency>
         <groupId>org.modelmapper</groupId>
         <artifactId>modelmapper</artifactId>
         <version>2.3.5</version>
      </dependency>
   </dependencies>

   <build>
      <plugins>
         <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
         </plugin>
      </plugins>
   </build>

</project>
```

`application.properties`

```html
server.port=9001
```

`index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>Ejemplo de AJAX</title>

   <!-- Bootstrap core CSS -->
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet"
   	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
   <!-- Custom styles for this template -->
   <link href="style.css" rel="stylesheet" />
</head>
<body>
   <div class="container">
      <h1>Listado de productos</h1>		

      <div id="productos">
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>Id</th>
                  <th>Nombre</th>
                  <th>Categoría</th>
               </tr>
            </thead>
            <tbody id="productos-table-body">
				
            </tbody>
         </table>
      </div>
   </div>
   <!-- /container -->

   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="app.js"></script>
</body>
</html>
```

`style.css`

```css
body {
   padding-top: 20px;
   padding-bottom: 20px;
}

.navbar {
   margin-bottom: 20px;
}
```

`app.js`

```js
$(document).ready(function(){
	
   $.ajax({
      url: 'http://localhost:8080/producto/',
      type: 'GET',
      success: function(data) {
         var html = "";
         $.each(data, function(index, value){
            html += '<tr>';
            html += '<td>'+ value.id+'</td>';
            html += '<td>'+ value.nombre+'</td>';
            html += '<td>'+ value.categoria+'</td>';
            html += '</tr>';
         });
         $("#productos-table-body").append(html);
		   },
		error: function(error) {
			console.log("Error: " + error);
		}
	});
	
});
```

`Application`

```java
package com.openwebinars.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

   public static void main(String[] args) {
      SpringApplication.run(Application.class, args);
   }

}
```

Vamos a ejecutar la aplicación más bien las dos aplicaciones por un lado el API con la que veníamos trabajando hasta ahora y la otra una especie de aplicación cliente, aun que también sería una aplicación web. La aplicación cliente se va a ejecutar en el puerto 9001 y que sería una interfaz de usuario, un listado de los productos. 

Podríamos venir al navegador y cargar la URL `http://localhost:9001/` con el siguiente resultado:

![143-10-02](images/143-10-02.png)

¿Y donde estan nuestros productos?

Si inspeccionamos en la consola podemos ver que se ha producido un error:

![143-10-03](images/143-10-03.png)

```sh
Access to XMLHttpRequest at 'http://localhost:8080/producto/' from origin 'http://localhost:9001' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.
```
y que no permite que desde el origen `http://localhost:9001/` se haga una petición a `http://localhost:8080/producto/` no se detecta un determinado encabezado,  ¿y esto qué significa? estamos teniendo una dificultad a la hora de poder acceder.

![20-04](images/20-04.png)

¿Qué es lo que hemos hecho mal? para que nuestra API que venía funcionando con mucha alegría, ahora cuando de verdad queremos programar un cliente nos esté bloqueando por un problema. 

![20-05](images/20-05.png)

Por seguridad los navegadores prohíben las llamadas Ajax a recursos fuera del origen actual, ¿Por qué? bueno pues pongámonos en situación, supongamos que nosotros estamos con el navegador y varias pestañas abiertas, una de las pestañas que tenemos abiertas es nuestro banco online que estamos haciendo para hacer algún tipo de transacción y en otra pestaña sin querer tenemos abierto un sitio que tiene código malicioso llamémoslo ***evil.com***, los script de este sitio malicioso, si no existiera este bloqueo podrían acceder a otra pestaña del navegador, porque a través de JavaScript se podría y realizar algún tipo de solicitud AJAX podrían escanear los bancos más usuales, algún tipo de transacción y hacer solicitudes AJAXs a la API del banco para hacer que digo yo una transferencia, eso es peligroso, bueno pues esto no debería de poder hacerse, quién dice la transferencia de dinero podría ser simplemente de datos que en ocasiones puede ser tan o más dañina, entonces no debería poder hacerse ese tipo de peticiones porque si estamos logeados en el banco con nuestras credenciales a lo mejor si no está bien protegido el sitio del banco lo podría hacer. Bueno pues CORS lo prohíbe.


![20-06](images/20-06.png)

CORS es una especificación del Consorcio W3C que está implementada prácticamente en la totalidad de los navegadores y que permite especificar qué dominios podrán acceder a un determinado servidor, en nuestro caso a nuestra API REST  y para que estarán autorizados, para qué tipo de peticiones estarán autorizados, por tanto podemos decir que ***CORS es una política de seguridad** es decir una forma de entender que es ser seguro para unas determinadas entidades.


![20-07](images/20-07.png)

Veamoslo en un gráfico **CORS** significa ***Cross-Origin Resource Sharing*** en el que vamos a delimitar cómo se va a hacer el intercambio, el compartir los recursos entre distintos orígenes y este gráfico refleja la situación que hemos tenido antes, tenemos un servidor, tenemos otro servidor, en este caso la aplicación cliente se ha ejecutado en el contexto de otro servidor Tomcat que teníamos dentro del proyecto, el servidor de la App Cliente ha hecho una petición al servidor de la API y CORS lo ha bloqueado porque es un origen no permitido, todo ello nosotros lo hemos visto en nuestro navegador.

![20-08](images/20-08.png)

Postman sí que funciona porque es una herramienta de desarrollo y no un navegador al uso y entonces sí que utiliza algún tipo de mecanismo para que funcione, pero realmente ya digo que nuestro problema de CORS sigue ahí, si no lo sabemos manejar.

![20-09](images/20-09.png)

No es un problema realmente es una ventaja permite que nosotros protejamos nuestra API y permitamos indicar que orígenes sí que van a poder acceder a nuestros recursos, también nos permite segmentar qué tipo de métodos, de verbos, de HTTP, por ejemplo podríamos decir que cualquier origen pudiera hacer un GET, pero no el resto de verbos, podríamos decir que un origen si pudiera hacer un GET y POST pero no un PUT y DELETE y  deshabilitarlos, así que francamente sería bastante útil.

![20-10](images/20-10.png)

Toda esta cuestión de CORS veréis que se va a manejar al final a través de una serie de encabezados como `Access-Control-Allow-Origin` dónde se puede indicar el dominio, en carácter comodín, ojo con usar los comodines en casos específicos como los CDN. 

Hay una serie de encabezados más que vamos a ver en alguna de las lecciones próximas y que se utilizan con esto de CORS.

En las próximas lecciones vamos a ver cómo Spring nos permite gestionar esto de CORS, permitir determinados orígenes para que nuestras aplicaciones cliente pueden consumir desde nuestra API y lo podamos hacer con garantías.

![20-11](images/20-11.png)

# 21 ¿Cómo habilitar a nivel de método? 4:51 

[PDF CORS_mediante_anotación_CrossOrigin.pdf](pdfs/20_CORS_mediante_anotación_CrossOrigin.pdf)

## Resumen Profesor

La información sobre la anotación @CrossOrigin la puedes encontrar aquí: https://docs.spring.io/spring-framework/docs/5.2.0.RELEASE/javadoc-api/org/springframework/web/bind/annotation/CrossOrigin.html

## Transcripción

Hola a todos vamos a seguir hablando de coros y vamos a ver cómo podemos configurar cors en nuestro servidor en nuestra apired con la anotación crossorigin está disponible desde la versión 42 de Spring y la podemos utilizar a nivel de método o a nivel de una clase controladora y tiene una serie de atributos como pueden ser origin donde nos permite utilizar o bien un asterisco para indicar cualquier origen no sería una práctica sexualmente adecuada o una lista de orígenes que serían permitidos methods por si quisiéramos semental qué métodos se van a poder soportar me imaginado a nivel de una clase controladora podríamos decir que aplicará para un determinado origen vale para las peticiones que tipos y a lo mejor bueno pues luego a nivel de método podríamos permitirle otro tipo de odeleite a algún algún sitio en particular no también el atributo más age la duración máxima en segundos de la caché vale también lo podríamos lo podríamos indicar tiene otra serie de atributos como Halo credencial Head2Head vale que también tienen que ver con todo esto de curso y que os dejo que investigue un poco por la cuenta habla de Cuqui de encabezados que se pueden exponer que no vale que encabezados si nos permitiría un determinado origen enviar cuales no no vamos a entrar mucho en esa parte nos vamos a centrar en ver el nos permitiría un código así el que pudiéramos revisar course a nivel de un metro de un particular del get de producto para que lo dicen el proyecto como el que teníamos antes si pudiera hacer un tipo de petición que sobre este método vale vamos a ver cómo sería a nivel de clase vale no podremos tener igual y fijado como podríamos indicar también los métodos para este mismo origen que solamente se pudieran hacer peticiones que oposiciones post no merece la pena para añadir una sola línea de código que copiemos el proyecto y tal nos podemos venir aquí y ver cómo perdón este vez sería el 20 vale y aquí en el controlador podemos ver como tenemos el que vamos a permitir hacer las peticiones que para ello vamos a ejecutar el cliente que teníamos en el ejemplo anterior ejecutaría muestra servidor pero antes vamos a comentar esta línea de código vale y vamos a ver que si la comentamos seguimos teniendo el mismo problema de antes no estos ejecutaría en el puerto 8080 necesitaría vale y necesitaríamos una ventana de navegador si hacemos a localhost 9001 seguimos teniendo el mismo problema de sin embargo si aquí descomentamos lo volvemos a lanzar y refrescamos por aquí podemos ver como Justin no aparece nuestro listado de productos porque se ha hecho la petición AJAX a la URL de localhost 8080 barra producto se ha traído todo el Jason ha montado la tabla HTML y nos lo está pintando por aquí cómo podéis comprobar esas sola anotación ha marcado la diferencia para permitir al origen 9001 el hecho de que se pudiera hacer la petición si ahora el cliente vale lo tendremos por aquí si paramos el cliente y nos viniéramos a cambiar el puerto sobre el que se ejecuta teniendo el servidor ese gustado todavía que no tenemos por aquí está ejecutándose cambiamos para que el cliente se ejecute en el puerto 9002 comprobar los ejecutan en el 9002 ahora nosotros hiciéramos aquí desde 9002 a petición course vuelve activar vuelve a bloquear no es un origen que esté permitido y entonces no podríamos hacer la petición esta es un sencillo tratamiento de course a nivel de método de clase vamos a ver en la siguiente lección cómo podemos hacer un tratamiento global que nos va a permitir para diferentes controladores aplicar una política con


![21-01](images/21-01.png)
![21-02](images/21-02.png)
![21-03](images/21-03.png)
![21-04](images/21-04.png)
![21-05](images/21-05.png)

# 22 Configuración CORS global 8:22 

[PDF Configuración_CORS_Global.pdf](pdfs/21_Configuración_CORS_Global.pdf)

## Resumen Profesor

No existe.

## Transcripción

Hola hola a todos vamos a seguir hablando de course y en este caso vamos a hacer una configuración global la configuración en nivel de clase método y asumible sin número de método clase no es muy grande y si empieza a crecer pues se empieza a volver un poco y manejable imaginas por cada método de cada controlador de cena de controladores de cena de método en cada uno múltiples peticiones acordarnos de ir poniendo la notación no sería asumible si queremos actualizar la configuración y añadir un nuevo origen porque además de la aplicación angular tenemos una aplicación Android tampoco sería demasiado interesante no entonces quién dice una aplicación en lugar de Android podría ser de otro servidor vale o que nuestra API pues pudiera servir para de tercero no si tuviéramos la lista de orígenes sería difícilmente mantenible spring nos permite realizar una configuración global para todos los controladores que es similar al uso de filtros no es que funcionará básicamente cómo superar un filtro esto nos obliga a descartar crossorigin podemos definir elemento a nivel global y matizarlo a nivel local con la anotación cross origin of clans a nivel de método o a nivel de clase una configuración básica que está algo deprecada sería como en esta clase no tendríamos un método añadiendo un cos mapping y le daría tarifa plana a todo pero la configuración básica utilizando spring boot sería más recomendable de esta manera que tenemos por aquí no a diferencia del uso de la clase de web en bici configura after podríamos devolver un web en bici configure como un bin configurando Kors vale y esto sería una configuración que quizá nos valdría al inicio del desarrollo en el que nuestra fiesta todavía desplegada en algún tipo de servidor ciertamente local que le daremos acceso cualquiera una configuración más ajustada y que no invitaría que restringe éramos determinada ruta para permitir determinado orígenes solamente determinado un método quizá con una caché que dure un cierto tiempo y que nos permita pues sentar muy bien y proteger muy bien toda nuestra vamos a aprobar a alguno de estos códigos vale vamos a coger el proyecto 21 base y vamos a hacer una copia y bueno nos vamos a venir por aquí y vamos a crear vale en la clase de mi configuración esta misma clase con arroba configura eso que nos permite lanzar ping podemos crear un nuevo método vamos a hacer primero una configuración un poco más laxa que permita acceder a más gente con configure mamá de mar al metro está notado con el roba aquí tenemos que devolver un pin de este tipo como esto es una interfaz no vamos a crear este huevo en bici configure el vuelo y Aquiles sobre escribiríamos para equipo de amor el método addcorsmappings en el que no queríamos salir una configuración un poco más global vamos a ponernos este proyecto en funcionamiento



![22-01](images/22-01.png)
![22-02](images/22-02.png)
![22-03](images/22-03.png)
![22-04](images/22-04.png)
![22-05](images/22-05.png)
![22-06](images/22-06.png)

# Contenido adicional 3

* [PDF 19_Qué_es_CORS.pdf](pdfs/19_Qué_es_CORS.pdf)
* [PDF CORS_mediante_anotación_CrossOrigin.pdf](pdfs/20_CORS_mediante_anotación_CrossOrigin.pdf)
* [PDF Configuración_CORS_Global.pdf](pdfs/21_Configuración_CORS_Global.pdf)
