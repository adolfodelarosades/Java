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

Si revisamos algún proyecto Spring el **`pom.xml`** tiene el siguiente aspecto:

<img width="1087" alt="image" src="https://user-images.githubusercontent.com/23094588/201392393-625507f5-96cd-450a-a6df-ed7b4eeb80de.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201414315-977e8d77-5416-4ec4-b1b9-e68d048c0728.png">

Nosotros necesitamos el **`<parent>`** es el **`pom`** principal que proporciona gestión de complementos y dependencias para aplicaciones basadas en Spring. Vamos a copiar ese **`<parent>`** en nuestro proyecto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201415209-3acbf3a5-5226-4e2f-be8f-9b86b1f96712.png">

Pero si volvemos a la **`App`** aun no se ha solucionado el problema.

<img width="1236" alt="image" src="https://user-images.githubusercontent.com/23094588/201415469-1194ad10-b861-4639-a220-9c3597416303.png">

Nos falta copiar en el **`pom.xml`** la siguiete dependencia **`spring-boot-starter-web`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201416163-37637fd9-005c-40be-a6d5-369c6e4f48d5.png">

Con esto desaparece el error en **`App`**

<img width="1237" alt="image" src="https://user-images.githubusercontent.com/23094588/201416357-f5b134e5-45a3-4747-9845-8d1ddcc25444.png">

Solo nos queda copiar dentro de **`App`** la siguiente línea de código para ya tener un Proyecto Spring.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201417525-5cf36b09-dd64-475e-94d9-806eb766b9c0.png">

De hecho ya podemos arrancar la aplicación y nos levanta el proyecto Spring, sacando en la consola el **`Hello World!`** 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201421056-f49dab2f-0d5f-47e1-a020-ee3a93e9d730.png">

Incluso podemos eliminar ese mensaje.

<img width="1240" alt="image" src="https://user-images.githubusercontent.com/23094588/201421893-f54fbfa9-b9e8-44ec-9267-58ca7a7cec0f.png">

Y del quitamos la versión que nos esta marcando un error.

<img width="1240" alt="image" src="https://user-images.githubusercontent.com/23094588/201422065-78b63c43-88c2-40a5-849c-b51ca9382244.png">

Y actualizamos las dependencias Maven

<img width="1240" alt="image" src="https://user-images.githubusercontent.com/23094588/201422161-38f688f6-eaf3-4d6a-9045-af650e00e5c8.png">

Y con esto ya tenemos nuestro proyecto Spring creado desde cero a partir de un proyecto Maven incluyendo las dependencias necesarias.

## Creando nuestro primer proyecto Spring Booot desde la pagina de Spring 06:04

Aquí vamos a crear un Proyecto Spring desde la página oficial [spring initializr](https://start.spring.io/)

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201422568-326900f0-2e40-4a29-ab7c-46ef00703809.png">

Vamos a meter los siguientes datos para crear el proyecto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201423681-5a0c2eee-3f06-428e-8b11-749acf479d86.png">

Lo generamos y se descarga un ZIP, ese lo vamos a colocar y descomprimir en nuestra carpeta de proyectos.

<img width="924" alt="image" src="https://user-images.githubusercontent.com/23094588/201423964-8be97968-3139-46cb-9f6a-7b86fe900143.png">

Y vamos a proceder a abrir el archivo

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201424665-515ed3c0-66d1-42df-b8f3-3511fd48ba6d.png">

Se nos abre un proyecto con una estructura creada para un Proyecto Spring.

Tenemos nuestro **`pom.xml`** con sus dependencias, incluyendo una para Test Unitarios más actualizada que la que teniamos en el proyecto anterior.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201424899-c1ff3e87-9eed-4d4d-8ed5-d00d9eac847e.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201425303-f30a218f-8369-48c0-8360-42c2d3b52499.png">

Tenemos nuestra clase principal.

<img width="1281" alt="image" src="https://user-images.githubusercontent.com/23094588/201425512-688c0bad-4aa0-4b04-b42d-32b52f86e092.png">

Tenemos también nuestras clases de Test.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201425685-63be0f4f-fc81-4473-8a7d-5f4c179bed32.png">

La lista de dependencias descargadas es amplia por que son todas las que se necesitan para proyectos Web que fue la dependenci  ue incluimos al crear el proyecto.

<img width="673" alt="image" src="https://user-images.githubusercontent.com/23094588/201426031-867e6790-d5cd-4098-b204-07021b8089e8.png">

**NOTA**: Es posible que en algunos **`pom.xml`** nos marque algún error como el siguiente:

<img width="961" alt="image" src="https://user-images.githubusercontent.com/23094588/201426821-3e6bd277-b93a-4bde-ae1b-176449fb4df0.png">

Este error muchas veces se elimina modificando la versión del **`<parent>`** ya que puede ser una versión no soportada por el IDE.

<img width="966" alt="image" src="https://user-images.githubusercontent.com/23094588/201427040-8bf8f27f-b1a9-4e3a-b996-1559fcdc8880.png">

Incluso en nuestro **`pom.xml`** tenemos un fallo, el cual desaparecio cambiando la versión del **`<parent>`** y volviendo a poner la misma.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201428041-247cfc74-ca88-4532-9c5e-260277dbe510.png">

Vamos a ejecutar la aplicación.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201428424-0e2c5ea3-a21c-42e5-98a3-3934adad87ce.png">

Se levanta la aplicación Spring.

## ¿Diferencias entre Maven y Spring Boot? 02:22

<img width="1503" alt="image" src="https://user-images.githubusercontent.com/23094588/201428661-6d401e44-da96-4b49-9d8b-65cfbfe95270.png">

## Dependencias de Junit y Mockito 02:43

<img width="1452" alt="image" src="https://user-images.githubusercontent.com/23094588/201429333-c541807c-5352-4fab-87b5-840cf3c60146.png">

<img width="1492" alt="image" src="https://user-images.githubusercontent.com/23094588/201429409-7c2e6506-71b2-45ea-865d-93c10f24857a.png">

<img width="1496" alt="image" src="https://user-images.githubusercontent.com/23094588/201429002-4b2afb7d-3104-455f-873b-d8f9166c3e6c.png">

<img width="1338" alt="image" src="https://user-images.githubusercontent.com/23094588/201429126-e137dcca-14a3-4650-9557-591507bc08af.png">

<img width="1288" alt="image" src="https://user-images.githubusercontent.com/23094588/201429179-6118951d-1564-4e67-af24-301ed3d18e36.png">






## Instalando el Plugin de Coverage en nuestro IDE 01:13
## Maven 1 preguntas
