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

### Creación de los Modelos

Dentro del package **`com.cursojava.curso`** vamos a crear el paquete **`models`** y dentro vamos a crear la clase **`Usuario`** con sus correspondientes atributos junto con los Getters y Setters.

![image](https://user-images.githubusercontent.com/23094588/133882328-49a62870-ee10-4741-8982-f37d6917cda6.png)

En el Controlador vamos a a retornar un JSON de un **`Usuario`**. 

![image](https://user-images.githubusercontent.com/23094588/133882545-0fce4add-33c6-4919-845f-661622233b7c.png)

Al recargar el servidor e invocar la ruta **`http://localhost:8080/usuario`** tenemos:

![image](https://user-images.githubusercontent.com/23094588/133882590-4c3cc44f-0368-4da8-a056-a253864558d8.png)




**``**
**``**
**``**
**``**
**``**
**``**
**``**
