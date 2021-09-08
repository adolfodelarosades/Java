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



