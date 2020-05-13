# 9. AJAX 01:24:27

* Introducción 02:01
* Creación del script AJAX para enviar una petición HTTP 12:41
* Enviando una petición asíncrona a un Servlet 11:36
* Creación de una función para cargar un archivo 14:26
* Creación de un método para validar una imagen y su tamaño máximo 12:14
* Informando al usuario el resultado de la carga de la imagen 10:43
* Como solucionar problemas de caché en Tomcat 02:53
* Almacenando la ruta de la imagen en la Base de Datos 10:59
* Mostrando al usuario la imagen almacenada en el servidor 06:54

## Introducción 02:01

En esta lección explicaremos lo que es AJAX.

AJAX = JavaScript asíncrono y XML.

AJAX no es un lenguaje de programación.

AJAX solo usa una combinación de:

* Un objeto incorporado XMLHttpRequest del navegador (para solicitar datos de un servidor web)
* JavaScript y HTML DOM (para mostrar o usar los datos)

AJAX es el sueño de un desarrollador, porque puedes:

* Leer datos de un servidor web: después de que la página se haya cargado
* Actualizar una página web sin volver a cargar la página
* Enviar datos a un servidor web: en segundo plano

## Creación del script AJAX para enviar una petición HTTP 12:41

En esta lección vamos a crear un archivo JS donde codificaremos una función para crear una petición HTTP y envviarla a un Servlet. 

1. Crear la carpeta `js` dentro de nuestra carpeta `webcontent`
2. Crear dentro de la carpeta `js` un archivo JS llamado `ajax.js`

   ![7-Logger](images/9-ajax-1.png)

   ![7-Logger](images/9-ajax-2.png)
   
3. Insertar el siguiente código:

```js
function cargarImagen(){
	//Crea un formulario con código
	var formdata = new FormData();
	//Permite elejir un archivo del ordenador.
	formdata.append("file", document.getElementById("file").files[0]); //0 indica que selecciona el primer archivo seleccionado
	
	//Construye petición HTTP
	var xhr = new XMLHttpRequest();
	//Establecer parámetros de la petición HTTP, método, url, asyncrono
	xhr.ope("post", "/ServletAjax?accion=cargarImagen", true);
	//Enviar el formulario a a la petición
	xhr.send(formdata);
	
	//Analisa el resultado de la petición
	xhr.onload = function(){
		if(this.status == 200){
			alert("Petición enviada correctamente");
		}
	};
}
```

## Enviando una petición asíncrona a un Servlet 11:36


## Creación de una función para cargar un archivo 14:26

En esta lección probaremos el Script hecho en `ajax.js` 

1. Añadiremos dos inputs en `registroAdministrador.jsp`

```html
<tr>
   <td>Selecciona una fotografía: </td>
	 <td>
	    <input type="file" id="file"/> 
			<input type="button" value="cargar" onclick="cargarImagen();" />
	 </td>
</tr>
```

El primer input de tipo file nos permite cargar un archivo del ordenador, el id debe ser el mismo `file` que se recupera en el script. El segundo input invoca a la función `argarImagen()` que se encuentra en el archivo `ajax.js`.

3. Debemos importar el archivo `ajax.js` dentro de nuestro archivo `registroAdministrador.jsp`. **Debemos tener en cuenta el CONTEXTO de la aplicación**, por lo cual usamos `<c:url` que añade el contexto a la ruta de nuestro archivo. 

```html
<head>
<meta charset="UTF-8">
<title>Registro de Administrador</title>
<!-- /04-JSPServlets/js/ajax.js -->
<script type="text/javascript" src='<c:url value="/js/ajax.js" /> '></script>
</head>
```

4. Creación de un nuevo Servlet llamado `ServletAjax.java` en la carpeta controlador. Cuando lo creamos en el archivo `web.xml` debería haberme metido el siguiente código:

```html
<servlet>
    <description></description>
    <display-name>ServletAjax</display-name>
    <servlet-name>ServletAjax</servlet-name>
    <servlet-class>com.novellius.controlador.ServletAjax</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>ServletAjax</servlet-name>
    <url-pattern>/ServletAjax</url-pattern>
  </servlet-mapping>
```

NOTA: Por mi configuración lo tuve que meter manualmente.

5. Ingresar el siguiente código en el método `doPost()` de `ServletAjax.java`

```java
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		
		if(accion != null) {
			if(accion.equals("cargarImagen")) {
				System.out.println("Petición AJAX recibida correctamente");
			}
		}
	}
```



## Creación de un método para validar una imagen y su tamaño máximo 12:14
## Informando al usuario el resultado de la carga de la imagen 10:43
## Como solucionar problemas de caché en Tomcat 02:53
## Almacenando la ruta de la imagen en la Base de Datos 10:59
## Mostrando al usuario la imagen almacenada en el servidor 06:54
