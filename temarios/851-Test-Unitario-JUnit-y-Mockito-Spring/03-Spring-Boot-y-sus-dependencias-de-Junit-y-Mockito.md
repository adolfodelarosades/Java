# 03 Spring Boot y sus dependencias de Junit y Mockito • 6 clases • 19m 

* Creacion de proyectos en Spring 00:12
* Creando nuestro primer proyecto Maven con Spring Booot 06:33
* Creando nuestro primer proyecto Spring Booot desde la pagina de Spring 06:04
* ¿Diferencias entre Maven y Spring Boot? 02:22
* Dependencias de Junit y Mockito 02:43
* Instalando el Plugin de Coverage en nuestro IDE 01:13
* Maven 1 preguntas

## Creacion de proyectos en Spring 00:12
## Creando nuestro primer proyecto Maven con Spring Booot 06:33

<img width="948" alt="image" src="https://user-images.githubusercontent.com/23094588/201385407-7a92af94-afcb-49a5-8e2a-2fa7ef071dbf.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201386002-ad7335cb-ecf0-4615-b976-18884eb943bf.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201385688-dae8a251-0ffa-4786-9b65-2a311abb5adc.png">

Vamos a hacer unos pequeños cambios para que quede exactamente igual que el proyecto creado con STS.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201387379-130dc5c7-ffae-4df3-b87d-9a52603f3b79.png">

Al tratar de ejecutar la aplicación tal como esta marca un error.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201389264-8a8ccf49-8367-446e-a1b4-3026aca8b470.png">

Es posible que es por que he elegido la versión 17 de Java. Pulso en **`Update pom.xml and reload the project`** y me agrega unas etiquetas en el archivo **`pom.xml`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201389610-08559c11-deb6-44d8-888f-09ea10b8d297.png">

Actualizo las dependencias Maven y ejecuto nuevamente **`App`**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201389740-23cd36eb-e525-481d-a2c0-7640d9098337.png">

ya me muestra el **`Hello World!`**.

Pero observemos que no nos indica que se ha levanta el proyecto de Spring. 

Esto es por que realmente el proyecto Maven que creamos no es un Proyecto Spring, tendríamos que añadir varias cosas para convertirlo a un proyecto Spring. Lo primero es añadir la anotación **`@SpringBootApplication`** en nuestra clase **`App`**  

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201391688-e6555def-df4d-4bde-89cb-0cd4b48101ea.png">

Pero nos marca un error, por que no se encuentran las dependencias necesarias para usar estas anotaciones. 

Si revisamos algún proyecto Spring el **`pom.xml`** tiene un aspecto como:

<img width="1087" alt="image" src="https://user-images.githubusercontent.com/23094588/201392393-625507f5-96cd-450a-a6df-ed7b4eeb80de.png">









## Creando nuestro primer proyecto Spring Booot desde la pagina de Spring 06:04
## ¿Diferencias entre Maven y Spring Boot? 02:22
## Dependencias de Junit y Mockito 02:43
## Instalando el Plugin de Coverage en nuestro IDE 01:13
## Maven 1 preguntas
