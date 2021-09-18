# Curso de Java Fullstack Completo (springboot, hibernate, JWT, API Rest)

## Instalaciones

* JDK 
* IntelliJ IDEA https://www.jetbrains.com/es-es/
* Apache Maven https://maven.apache.org/download.cgi
* Modificar Variables de Entorno

## Estructura del Proyecto

![image](https://user-images.githubusercontent.com/23094588/132535285-7d790b05-e6e0-41b3-9adc-6375e2a3b956.png)

![image](https://user-images.githubusercontent.com/23094588/132535342-d0821516-993d-4653-9bc6-7c2eee983fa5.png)

### Abrir Proyecto `Curso`

![image](https://user-images.githubusercontent.com/23094588/132538994-8589f05a-382e-4d17-a352-3c69f7adef06.png)

Dar en la opción **`Trust Project`**

Al abrirse tenemos la siguiente estructura, entre los cuales se encuentra el archvo **`pom.xml`** para el manejo de las dependencias de Maven.

![image](https://user-images.githubusercontent.com/23094588/132540282-695da0c7-0d4d-4446-b048-f64fc7ff3a1b.png)

### `index.html`

En la carpeta **`src/resources/static`** vamos a crear el archivo **`index.html`**.

![image](https://user-images.githubusercontent.com/23094588/132542021-159d552b-69dd-4e78-8d7b-0547d5438f62.png)

Para ejecutar la aplicación Abrimos la pestaña de Maven que se encuentra a la Derecha.

![image](https://user-images.githubusercontent.com/23094588/132542235-33764e0d-882a-4183-8951-d8ac223b1297.png)

Vamos a abrir los ***Plugings / spring-boot / spring-boot:run*** con esto se ejecutara nuestra APP

![image](https://user-images.githubusercontent.com/23094588/132550608-0aff92a2-092b-477a-af89-99e70362f75e.png)

![image](https://user-images.githubusercontent.com/23094588/132550728-4546e076-a772-4042-8aa2-9b6e998707f7.png)

### Configurar Versiones de Java y Maven

Si necesitamos hacer ajustes en la versión de Java podemos entrar a la opción:

![image](https://user-images.githubusercontent.com/23094588/132553726-8cf3e76e-65b0-434a-a5fc-ce74db071d90.png)

Y ponemos la versión de Java que necesitemos.

![image](https://user-images.githubusercontent.com/23094588/132553872-98b491b9-476d-4e95-b469-72389a14be37.png)

Y desde aquí mismo podemos instalar una versión de Java con la opción **`Add SDK / Donwload SDK`**, esta opción instala todo automáticamente, debemos indicar versión y el servidor de donde lo vamos a descargar.

Detener el Servidor

![image](https://user-images.githubusercontent.com/23094588/132554972-a870c513-5534-46a9-9571-d5764fe1500d.png)

![image](https://user-images.githubusercontent.com/23094588/132555039-e6dbcbe7-5ca0-446f-a205-91f582b580e9.png)


### Detener el Proceso que se Ejecute en el Puerto 8080

Usar el comando en windows para ver que proceso se esta ejecutando en el puerto 8080:

```sh
>netstat -ano | findstr LISTENING | findstr 8080
```

Para matar el proceso es con:

```sh
>taskkill -PID 11808 -F
```

### Carga de Plantilla

Como hemos visto al cargar la URL http://localhost:8080 tenemos:

![image](https://user-images.githubusercontent.com/23094588/132550728-4546e076-a772-4042-8aa2-9b6e998707f7.png)

Vamos a meter la plantilla [Admin 2](https://startbootstrap.com/theme/sb-admin-2) a nuestro proyecto, para lo cual la descargamos y todo el contenido lo vamos a copiar dentro de la carpeta **`resources/static`** del proyecto, donde actualmente tenemos el archivo **`index.html`** que debemos eliminanar. La copia la tenemos que hacer desde el Explorador de Archivos por que no nos deja copiarlos directamente en el IJ, una vez copiados en IJ refrescamos para ver todo lo que copiamos.

![image](https://user-images.githubusercontent.com/23094588/133881774-268bb79b-1c92-4377-95f6-c10a7949c1e9.png)

Vamos a reiniciar el servidor y al cargarse lo que vamos a ver es lo siguiente:

![image](https://user-images.githubusercontent.com/23094588/133881794-56eac526-b895-4c92-8a00-1e1a1e47eaa4.png)

Es una plantilla la cual tiene varias opciones por las cuales podemos navegar.

### Creación del Controlador

Dentro del package **`com.cursojava.curso`** vamos a crear el paquete **`controllers`** y dentro de este paquete vamos a cerear la clase **`UsuarioController`**, esta clase la vamos a anotar con **`@RestController`** y dentro de ella vamos a crear un método 
**`prueba`** que nos va a retornar un texto, este método va a estar anotado con **`@RequestMapping(value = "prueba")`** esta anotación indica el nombre del URL que debemos indicar para llamar a este método, el código nos queda así:

![image](https://user-images.githubusercontent.com/23094588/133881276-c4112d26-501e-462c-9a44-433c736d45f1.png)

Ejecutamos el Servidor.

![image](https://user-images.githubusercontent.com/23094588/133881371-8650ebc9-11e6-4fe8-b2c6-671ff0eca39d.png)

Si cargamos la URL http://localhost:8080/prueba nos muestra el mensaje que retorna el método **`prueba`**

![image](https://user-images.githubusercontent.com/23094588/133881397-264bd427-efb3-4ff2-843c-0e2f7e9180bb.png)

Podemos cambiar el Controlador para que en lugar de devolver un String retorne una lista de valores.

![image](https://user-images.githubusercontent.com/23094588/133882060-20a4a99f-6131-4c7f-9e4e-c51268990010.png)

Al recargar el servidor tenemos:

![image](https://user-images.githubusercontent.com/23094588/133882070-68eb9ab1-cba1-4aeb-8994-14bfb177cda0.png)

### Creación del Modelo `Usuario` y Retorno del JSON de `Usuario`

Dentro del package **`com.cursojava.curso`** vamos a crear el paquete **`models`** y dentro vamos a crear la clase **`Usuario`** con sus correspondientes atributos junto con los Getters y Setters.

![image](https://user-images.githubusercontent.com/23094588/133882328-49a62870-ee10-4741-8982-f37d6917cda6.png)

En el Controlador vamos a a retornar un JSON de un **`Usuario`**. 

![image](https://user-images.githubusercontent.com/23094588/133882545-0fce4add-33c6-4919-845f-661622233b7c.png)

Al recargar el servidor e invocar la ruta **`http://localhost:8080/usuario`** tenemos:

![image](https://user-images.githubusercontent.com/23094588/133882590-4c3cc44f-0368-4da8-a056-a253864558d8.png)


### Creación de los métodos de CRUD para `Usuario`

Dentro del controlador **`UsuarioController`** vamos a crear los diferentes métodos para realizar un CRUD de **`Usuario`**.

Lo primero que vamos a hacer es añadir la propiedad **`id`** al modelo **`Usuario`**.

![image](https://user-images.githubusercontent.com/23094588/133883242-846138a8-8150-4a91-87f1-f1bd031ec3bf.png)

Ahora en el controlador **`UsuarioController`** vamos a implementar los diferentes métodos.

#### Método `getUsuario`

![image](https://user-images.githubusercontent.com/23094588/133883469-3368a2d9-071f-44d0-b268-b9e34a82dfed.png)

Como queremos recuperar un Usuario concreto, debemos mandar que usuario queremos recuperar y esto lo hacemos mandando en la URL el ID del usuario a recuperar, esto se lo indicamos en el valor de la ruta con **`@RequestMapping(value = "usuario/{id}")`**, ademas de esto el método ya recibe un parámetro **`id`** que indicamos con **`public Usuario getUsuario(@PathVariable Long id)`**, la anontación **`@PathVariable`** sobre el parámetro es necesaria. Por ahora lo que hacemos con el **`id`** es settearlo al **`Usuario`**. Al reiniciar el servidor invocamos la URL http://localhost:8080/usuario/123:

![image](https://user-images.githubusercontent.com/23094588/133884831-474ea52c-1034-4119-a71a-1f6247eaf6bd.png)

Cabe aclarar que valor que mandemos en este caso puede ser cualquiera siempre y cuando sea un número http://localhost:8080/usuario/999:

![image](https://user-images.githubusercontent.com/23094588/133884866-799a3426-8946-40ab-a60d-cf4a6198cba4.png)

Nuestro enlace http://localhost:8080/usuario ya no funciona por que no tenemos en el Controlador ningún método con esta URL:

![image](https://user-images.githubusercontent.com/23094588/133884946-272d8770-5a2a-4604-9523-cc9014e14da8.png)

### Uso de la Plantilla para mostrar Usuarios.

Si cargamos la página **`index.html`** en nuestro navegador tenemos:

![image](https://user-images.githubusercontent.com/23094588/133885054-94fdd252-a408-4fe9-ba99-a6b8b288a99d.png)

Vamos a navegar a ***Tables***

![image](https://user-images.githubusercontent.com/23094588/133885073-43e1522a-af34-4106-a072-6f119eef534a.png)

Vamos a basarnos en este diseño para mostrar nuestros usuarios, este diseño se encuentra en la página **`tables.html`** dentro de **`resources/static`**, vamos a copiar el archivo **`tables.html`** y lo vamos a llamar **`usuarios.html`** donde vamos a modificar la plantilla con el siguiente código:

![image](https://user-images.githubusercontent.com/23094588/133885490-06b58826-db7b-4dad-9120-da1f313cbcb6.png)

Si intentamos cargar la página no nos la carga:

![image](https://user-images.githubusercontent.com/23094588/133885395-a6aca8fe-8f51-45d9-ab73-156f77152aa1.png)

(NO SE MUY BIEN POR QUE, ya que la http://localhost:8080/tables.html si la carga) la vamos a abrir mediante el navegador para ver los cambios.

**LA RAZÓN POR LA QUE NO CARGA ES QUE CUANDO SE MODIFICA UN ARCHIVO EN LA CARPETA static HAY QUE REINICIAR EL SERVIDOR POR QUE SI NO NO RECONOCE LOS CAMBIOS, SERA COSA DE QUE ESTAMOS USANDO IJ Community**

![image](https://user-images.githubusercontent.com/23094588/133885436-88e750ff-cd64-49f9-b1c9-3f0c0bd7dc15.png)

![image](https://user-images.githubusercontent.com/23094588/133885462-a87d9644-809f-4860-a9c1-bf1109c4011f.png)


La idea es que cuando carguemos la página de usuarios, se llame a un servicio para recuperar todos los datos y una vez recuperados los rendericemos en esta página. Como pudimos observar la tabla esta identificada con **`id="dataTable"`** supongo que con este ID podemos de alguna manera inicializar esta tabla podemos este texto **`#dataTable`** con CTRL + SHIFT + F 

![image](https://user-images.githubusercontent.com/23094588/133885653-c22b8ce3-dd37-40e5-8ffe-473d3f65b5a4.png)

Para ver donde se ocupa, como podemos observar esto esta definido en un archivo llamado **`datatables-demo.js`** en la ruta **`src/main/resources/static/js/demo`**, el contenido es el siguiente: 

```js
// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});
```

Vamos a entender un poco que hace, como dijimos la tabla esta identificado con **`id="dataTable"`**, 

![image](https://user-images.githubusercontent.com/23094588/133885919-29258788-e1af-4281-b0cc-e5914dc2efba.png)


y al final del archivo **`usuarios.html`** tenemos la llamada al Script **`js/demo/datatables-demo.js`**:

![image](https://user-images.githubusercontent.com/23094588/133885906-ad7db018-9279-48ad-9519-935c75bb3646.png)

Si abrimos **`js/demo/datatables-demo.js`** tenemos:

![image](https://user-images.githubusercontent.com/23094588/133885948-cf763c59-f4f3-413b-8b6f-7e7ff5de1ec5.png)

Esto lo que hace es una vez cargada la página **`usuarios.html`**  ejecuta el **`$('#dataTable').DataTable();`** pero nosotros podemos meter más acciones que necesitemos.

Para no modificar los archivos de la plantilla vamos a realizar algunos cambios, primero la tabla la vamos a identificar como **`dataTableUsuarios`**. 

![image](https://user-images.githubusercontent.com/23094588/133886059-137b6997-65a6-44dd-bedf-1fadb785ad16.png)

Después al final del archivo ya no vamos a llamar al Script **`js/demo/datatables-demo.js`** sino que vamos a crear uno en la carpeta JS llamado **`js/datatables-usuarios.js`** que será el que incluiremos:

![image](https://user-images.githubusercontent.com/23094588/133886147-7e6bbf62-950d-4580-8fc7-847f51ee80fd.png)


El archivo **`js/datatables-usuarios.js`** tiene el contenido:

![image](https://user-images.githubusercontent.com/23094588/133886196-24220930-abcd-49d2-bc19-4e91c1468d93.png)

Para comprobar que realmente se esta llamando vamos a incluir en mensaje a la consola:

![image](https://user-images.githubusercontent.com/23094588/133886267-ec723d98-9c5d-42eb-b5fb-d8ff069543a9.png)

Al recargar la página vemos el mensaje en la consola apenas y termina de cargar la página:

![image](https://user-images.githubusercontent.com/23094588/133886281-83f03d62-aa97-488d-bf14-8d08a3c35f12.png)

### Llamada JS al Servicio de `getUsuario`

Realmente en nuestra tabla tendríamos que mostrar una lista de usuarios recuperar del Servicio, pero por ahora solo tenemos un Servicio que retorna un solo usuario, a modo de ejemplo vamos a llamar a ese Servicio desde JS con un ***Fetch***, con el siguiente código:

![image](https://user-images.githubusercontent.com/23094588/133886549-9afa610f-b679-4582-8d77-38dcd5faeab2.png)

Con **`await`** lo que hace es que espera al resultado del llamado del Servicio, el resultado se almacena en la variable **`request`**, pero cuando usamos **`await`** hay que indicar que la función es asincrona:

![image](https://user-images.githubusercontent.com/23094588/133886663-4db6b282-d4c5-4cf5-a048-99d0b9d6689c.png)

Al recargar el navegador tenemos:

![image](https://user-images.githubusercontent.com/23094588/133887111-0f9e3401-1598-4b2a-835c-4b985a5268ae.png)

Vemos la respuesta del servicio.












**``**
**``**
**``**
**``**
**``**
**``**
**``**
