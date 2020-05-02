# 2. Creación de un Diseño MVC 55:43

* El archivo WEB.xml 06:35
* Añadiendo más vistas al controlador 06:57
* Control de parámetros HTTP GET con Scriplets 09:24
* Control de parámetros HTTP POST mediante el Servlet 05:29
* Paso de parámetros desde Servlet hacia una vista JSP 13:49
* Uso de parámetros iniciales en el Servlet 07:10
* Mejorando el Controlador con un nuevo método de redirección 06:19

## El archivo WEB.xml 06:35

Cuando creamos el proyecto de la lección anterior se creo el archivo **web.xml** con el siguiente contenido.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5">
  <display-name>04-JSPServlet</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  <servlet>
    <description></description>
    <display-name>Servlet</display-name>
    <servlet-name>Servlet</servlet-name>
    <servlet-class>com.novellius.Servlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>Servlet</servlet-name>
    <url-pattern>/Servlet</url-pattern>
  </servlet-mapping>
</web-app>
```

El tag `<welcome-file-list>` se creo cuando creamos nuestro proyecto, posteriormente al crear nuestro Servlet inserto los tags `servlet` y `servlet-mapping`.

En el tag `<servlet>` definimos lo siguiente:

* Descripción del Servlet
* Nombre que se muestra
* Nombre del Servlet
* Clase que lo define

En el tag `<servlet-mapping>` es muy importante por que nos permite mapear o añadir una **raíz de contexto** al Servlet, definimos lo siguiente:

* Nombre del Servlet
* URL

#### ¿Qué es la Raíz de Contexto?

Cuando ejecutamos un proyecto se carga un URL por ejemplo:

### `http://localhost:8080/04-JSPServlet/`

En este caso la ***raíz de contexto*** es **`/04-JSPServlet/`** la cual puede servir para identificar alguna sección de la aplicación Web. Ya habíamos mencionado que esta ra´z de contexto la podemos eliminar, vamos a hacerlo:

![2-web-module-1](images/2-web-module-1.png)

Simplemente borramos el Path:

![2-web-module-2](images/2-web-module-2.png)

Al ejecutar el proyecto nuestra URL ya no presenta la raíz de contexto. 

`http://localhost:8080/`

![2-ejecucion-1](images/2-ejecucion-1.png)

Volviendo a nuestro `web.xml` observemos nuestro tag `<servlet-mapping>` actual:

```xml
<servlet-mapping>
    <servlet-name>Servlet</servlet-name>
    <url-pattern>/Servlet</url-pattern>
</servlet-mapping>
```

Podemos ver que el `<url-pattern>` esta mapeado con `/Servlet` por lo que si ejecutamos el URL `http://localhost:8080/Servlet` también se ejecutara nuestro proyecto:

![2-ejecucion-2](images/2-ejecucion-2.png)

Pero si usamos otro texto ya no encontrara nuestro Servlet y nos marcara lo siguiente:

`http://localhost:8080/OtraCosa`

![2-ejecucion-3](images/2-ejecucion-3.png)

En el mapeo que realicemos podemos poner un texto personalizado, si el Servlet lo usamos para Administrar nuestra web podríamos poner el siguiente mapeo:

```xml
<servlet-mapping>
    <servlet-name>Servlet</servlet-name>
    <url-pattern>/admin/*</url-pattern>
</servlet-mapping>
```

Tenemos `/admin/*` vemos que este mapeo a añadido `/*` lo cual permite insertar cualquier cosa despues de `/admin` esto por ejemplo nos permitira enviar parámetros. 

Los siguientes enlaces nos cargarán nuestro proyecto.

`http://localhost:8080`

![2-ejecucion-3-2](images/2-ejecucion-3-2.png)

`http://localhost:8080/admin`

![2-ejecucion-4](images/2-ejecucion-4.png)

`http://localhost:8080/admin?accion=inicio`

![2-ejecucion-5](images/2-ejecucion-5.png)

`http://localhost:8080/admin/contabilida`

![2-ejecucion-6](images/2-ejecucion-6.png)

Pero si usamos `http://localhost:8080/admin2` tendremos problemas:

![2-ejecucion-7](images/2-ejecucion-7.png)

Si no quisiera tener ningún tipo de mapeo y me acepte cualquier cosa podemos poner simplemente:

```xml
<servlet-mapping>
    <servlet-name>Servlet</servlet-name>
    <url-pattern>//*</url-pattern>
</servlet-mapping>
```

Con esto los únicos URL válidos son 

`http://localhost:8080`

`http://localhost:8080/`

![2-ejecucion-8](images/2-ejecucion-8.png)

Cualquier otro URL no nos permitira cargar nuestro Servlet:

![2-ejecucion-9](images/2-ejecucion-9.png)

El descriptor `web.xml` también nos va a permitir acceso a JNDI que nos permite acceder a una BD de forma sencilla, recordemos que para tener el archivo `web.xml` debemos crear nuestro proyecto con la versión 2.5 para el **Dynamic web module version**, si selecciónamos la versión 3.0 en lugar de el archivo `web.xml` usaremos notaciones, esto lo permite a partir de Tomcat 7, con Tomcat 6 no se permiten versiones superiores a 2.5.

![2-2-5](images/2-2-5.png)

## Añadiendo más vistas al controlador 06:57

En esta lección vamos a añadir un segundo JSP llamado `login.jsp`, actualmente tenemos el JSP `index.jsp` dentro de la carpeta `WebContent`.

![2-webcontent](images/2-webcontent.png)

Para organizar un poco nuestros JSPs dentro de la carpeta `WebContent` crearemos la carpeta `jsp` dentro de la cual moveremos el JSP `index.jsp` y crearemos el nuevo JSP `login.jsp`.

![2-webcontent-2](images/2-webcontent-2.png)

Listo, lo que hara nuestra aplicación es iniciar con la vista `index.jsp` y desde aquí nos permita movernos a la vista `login.jsp` una vez aquí tenemos tener la posibilidad de regresar a la vista `index.jsp`, todo esto siempre controlado por nuestro "Controlador".

Por lo que el código de nuestros archivos es el siguiente:

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   String accion = request.getParameter("accion");
		
   if (accion != null) {
      if(accion.equals("inicio")) {
         getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
      } else  if(accion.equals("login")) {
         getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(request, response);
      }
		
   }else {
      getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
   }
}
```
*Servlet.java*

Con `String accion = request.getParameter("accion");` recuperamos el parámetro `accion` que se envie al Servlet, y de acuerdo al valor recuperado redirecciona a una u otra Vista. 


```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Ménu</title>
</head>
<body>

   <h1 align="center">Ménu</h1>
 	
   <ol>
      <li><a href="?accion=login">Iniciar Sesión</a></li>
   </ol>
   
</body>
</html>
```
*index.jsp*

Con `href="?accion=login"` envíamos el parámetro `accion` con valor `login`.

```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Iniciar Sessión</title>
</head>
<body>

   <h1 align="center">Iniciar Sessión</h1>
	
   <p>
      <a href="?accion=inicio">&#60;&#60; Regresar</a>
   </p>
   
</body>
</html>
```
*login.jsp*

Con `href="?accion=inicio"` envíamos el parámetro `accion` con valor `inicio`.

Al Ejecutar nuestra aplicación tenemos el siguiente flujo, observe los diferentes URLs:

`http://localhost:8080`

![2-menu](images/2-menu.png)

`http://localhost:8080/?accion=login`
![2-login](images/2-login.png)

`http://localhost:8080/?accion=inicio`
![2-menu-2](images/2-menu-2.png)

## Control de parámetros HTTP GET con Scriplets 09:24

En esta lección vamos a controlar el paso de parámetros HTTP GET con Scriplets dentro de una vista JSP.

Modificaremos nuestra vista `login.jsp` para que reciba un *usuario* y un *password* y cuando pulsemos el botón de aceptar nos lleve a una vista que nos muestre los datos introducidos, para lo cual también debemos modificar el controlador para que tenga una nueva opción para redireccionar a la nueva vista que llamaremos `postLogin.jsp`.

Vemos los códigos:

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   String accion = request.getParameter("accion");
				
   if (accion != null) {
      if(accion.equals("inicio")) {
         getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
      } else  if(accion.equals("login")) {
         getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(request, response);
      } else  if(accion.equals("iniciarSesion")) {
         getServletContext().getRequestDispatcher("/jsp/postLogin.jsp").forward(request, response);
      }
   }else {
      getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
   }
}
```

*Servlet.java*

Aquí solo hemos añadido un `else if` para el caso donde la `accion=iniciarSesion` nos rediriga a la vista `postLogin.jsp`.

```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Iniciar Sessión</title>
</head>
<body>

   <h1 align="center">Iniciar Sessión</h1>
		
   <form method="get">
      <table>
         <tr>
	    <td>Usuario: </td>
	    <td><input type="text" name="usuario" /></td>
	 </tr>
	 <tr>
	    <td>Contraseña: </td>
	    <td><input type="password" name="contrasena" /></td>
	 </tr>
	 <tr>
	    <td><input type="hidden" name="accion" value="iniciarSesion"/></td>
	    <td><input type="submit" value="Iniciar Sesión" /></td>
	 </tr>
      </table>	
   </form>
	
   <p>
      <a href="?accion=inicio">&#60;&#60; Regresar</a>
   </p>
   
</body>
</html>
```

*login.jsp*

Aquí hemos añadido el formulario para leer los campos `usuario` y `contraseña`, además tenemos un campo adicional ***oculto** para envíar el párametro `accion` con el valor `iniciarSesion`.


```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>PostLogin</title>
</head>
<body>

   <h1>Sesión Iniciada</h1>
	
   <p>Los datos ingresados son:</p>
	
   <p>
   <%
      out.println("Usuario: " + request.getParameter("usuario"));
   %>
   </p>
	
   <!--  Otra forma de imprimir en un Scripler es la siguiente -->
   <p><%= "Contraseña: " + request.getParameter("contrasena") %></p>

</body>
</html>
```

*postLogin.jsp*

En esta vista mostramos los datos que se ingresarón en la vista `login.jsp` y que se mandan como parámetros a esta vista, si observamos el URL generado podemos verlos todos ya que se estan mandado a través de un método *get*. Otra cosa a recalcar se muestran dos formas de imprimir datos dentro de los de los scriplers, `<%= ...  %>` implicitamente tiene un `out.println` por lo que no es necesario ponerlo.

Al ejecutar nuestra aplicación tenemos:

`http://localhost:8080/`

![2-ejecucion-2-1](images/2-ejecucion-2-1.png)

`http://localhost:8080/?accion=login`

![2-ejecucion-2-2](images/2-ejecucion-2-2.png)

`http://localhost:8080/?usuario=adolfo%40gmail.com&contrasena=1234ABC&accion=iniciarSesion`

![2-ejecucion-2-3](images/2-ejecucion-2-3.png)

## Control de parámetros HTTP POST mediante el Servlet 05:29

En está lección vamos a ver como pasar parámetros HTTP POST al Servlet. Por lo cual tendremos que modificar nuestra vista `login.jsp` para que en lugar de usar el método `get` usar el método `post`, además de algunos cambios mas.

Vemos los códigos:

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Iniciar Sessión</title>
</head>
<body>
   
   <h1 align="center">Iniciar Sessión</h1>
		
   <form method="post" action="?accion=iniciarSesion">
      <table>
         <tr>
	    <td>Usuario: </td>
	    <td><input type="text" name="usuario" /></td>
	 </tr>
	 <tr>
	    <td>Contraseña: </td>
	    <td><input type="password" name="contrasena" /></td>
	 </tr>
	 <tr>
	    <td>&nbsp;</td>
	    <td><input type="submit" value="Iniciar Sesión" /></td>
	 </tr>
      </table>	
   </form>
	
   <p>
      <a href="?accion=inicio">&#60;&#60; Regresar</a>
   </p>
   
</body>
</html>
```

*login.jsp*

Básicamente hemos realizado dos cambios, cambiar el método `get` por `post` y hemos puesto el atributo `action="?accion=iniciarSesion"` dentro de el tag `form` por lo que eliminamos el campo oculto que hacia esa labor con `get`.


```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   String accion = request.getParameter("accion");
		
   if (accion != null) {
      if(accion.equals("inicio")) {
         getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
      } else  if(accion.equals("login")) {
         getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(request, response);
      }
   }else {
      getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
   }
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
      String accion = request.getParameter("accion");
				
      if (accion != null) {
         if(accion.equals("iniciarSesion")) {
	    System.out.println("Usuario: " + request.getParameter("usuario"));
	    System.out.println("Contraseña: " + request.getParameter("contrasena"));
	 }
      }else {
         getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
      }
		
}
```

*Servlet.java*

Aquí hemos eliminado del `doGet()` el manejo de la acción `iniciarSesion` que hemos implementado dentro del método `doPost()`, en caso de que esa opción sea invocada se pintarán en la conosola los parámetros `usuario` y `contrasena`, **no estamos redirigiendo a ninguna vista**.

Al ejecutar nuestra aplicación tenemos:

`http://localhost:8080/`

![2-ejecucion-2-1](images/2-ejecucion-2-1.png)

`http://localhost:8080/?accion=login`

![2-ejecucion-2-2](images/2-ejecucion-2-2.png)

Al pulsar el botón `Iniciar Sesión` invocamos el método `post` para el URL `http://localhost:8080/?accion=iniciarSesion`, es importante observar que como se esta usando el método `post` los parárametros `usuario` y `contrasena` ya no se muestran en el URL, solo se muestra `?accion=iniciarSesion` que es el valor del atributo `action` del tag `form`.

`http://localhost:8080/?accion=iniciarSesion`

![2-ejecucion-2-4](images/2-ejecucion-2-4.png)

Esta vista esta totalmente en blanco por que realmente no se invoco ningun JSP, solo se mando pintar los parámetros recibidos en la consola como podemos ver en la siguiente imágen.

![2-ejecucion-2-5](images/2-ejecucion-2-5.png)

## Paso de parámetros desde Servlet hacia una vista JSP 13:49

En esta lección vamos a ver como pasar parámetros desde el Servlet a los JSPs, de tres formas distintas:

* Paso de parámetros por el ***Ambito del Request***, solo sirve para una petición 
* Paso de parámetros por el ***Ambito de la Session***, es decir mientras la ventana del navegador este abierta o hasta destruir la sesión 
* Paso de parámetros por el ***Ambito del contexto o la aplicación***, hasta que el servlet no ejecute el método `Detroy`

Vemos los códigos:

```java
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
   String accion = request.getParameter("accion");
				
   if (accion != null) {
			
      if(accion.equals("iniciarSesion")) {
				
         //System.out.println("Usuario: " + request.getParameter("usuario"));
	 //System.out.println("Contraseña: " + request.getParameter("contrasena"));
				
	 String usuario = request.getParameter("usuario");
	 String contrasena = request.getParameter("contrasena");
				
	 // Ámbito Request
	 request.setAttribute("usuario", usuario);
	 request.setAttribute("contrasena", contrasena);
				
	 // Ámbito Sesión
	 HttpSession sesion = request.getSession();
	 sesion.setAttribute("usuario", usuario);
	 sesion.setAttribute("contrasena", contrasena);
				
	 // Ámbito Contexto
	 ServletContext contexto = getServletContext();
	 contexto.setAttribute("usuario", usuario);
	 contexto.setAttribute("contrasena", contrasena);
				
	 getServletContext().getRequestDispatcher("/jsp/postLogin.jsp").forward(request, response);
      }
			
   }else {
      getServletContext().getRequestDispatcher("/jsp/index.jsp").forward(request, response);
   }
		
}
```

*Servlet.java*

Los cambios los hemos hecho en el método `doPost()`, recuperamos los parámetros y los ponemos en los ambitos del request, sesión y contexto con el método `setAttribute` posteriormente redirigimos a la vista `postLogin.jsp`


```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostLogin</title>
</head>
<body>
	<h1>Sesión Iniciada</h1>
	
	<p>Los datos ingresados son:</p>
	
	<h2>Request</h2>
	
	<p>
	<%
		out.println("Usuario: " + request.getAttribute("usuario"));
	%>
	</p>
	
	<!--  Otra forma de imprimir en un Scripler es la siguiente -->
	<p><%= "Contraseña: " + request.getAttribute("contrasena") %></p>
	
	<h2>Sesión</h2>
	
	<p>
	<%
		out.println("Usuario: " + session.getAttribute("usuario"));
	%>
	</p>
	
	<!--  Otra forma de imprimir en un Scripler es la siguiente -->
	<p><%= "Contraseña: " + session.getAttribute("contrasena") %></p>
	
	
	<h2>Contexto</h2>
	
	<p>
	<%
		out.println("Usuario: " + application.getAttribute("usuario"));
	%>
	</p>
	
	<!--  Otra forma de imprimir en un Scripler es la siguiente -->
	<p><%= "Contraseña: " + application.getAttribute("contrasena") %></p>

</body>
</html>
```

*postLogin.jsp*

En esta vista recuperamos los parametros para cada ámbito con el método `getAttribute()` ya no usamos `getParameter`

Al ejecutar nuestra aplicación tenemos:

`http://localhost:8080/`

![2-ejecucion-2-1](images/2-ejecucion-2-1.png)

`http://localhost:8080/?accion=login`

![2-ejecucion-2-2](images/2-ejecucion-2-2.png)

`http://localhost:8080/?accion=iniciarSesion`

![2-ejecucion-2-6](images/2-ejecucion-2-6.png)

Si volvemos a cargar directamete el URL `http://localhost:8080/?accion=iniciarSesion` ¿Por qué
 nos muestra la vista en blanco?

![2-ejecucion-2-7](images/2-ejecucion-2-7.png)

#### Nota 

Una cosa importante al modificar nuestro código en la parte de los **src** será necesario reiniciar el servidor para que tome los cambios, cuando las modificaciones las hagamos en la sección **WebContent** con recargar el navegador será
![2-ejecucion-2-7](images/2-ejecucion-2-7.png) suficiente.

## Uso de parámetros iniciales en el Servlet 07:10

## Mejorando el Controlador con un nuevo método de redirección 06:19
