# 04 Test Unitario con el Framework Junit • 8 clases • 28m 

* ¿Que es Junit? 01:57
* Nuestro primer test unitario con Junit 05:46
* Introducción a las anotaciones @Before y @After 03:23
* Test unitario con Junit - 1 preguntas
* Creando un Controlador Real para poder testearlo 05:23
* Testeando un Controlador o endpoind con Junit 05:39
* Testeando nuestro Controlador al 100% de Coverage 02:50
* Revisando mas anotaciones en Junit 01:49
* Test con Junit - 1 preguntas
* Anotaciones para ejecutar tests de error con Junit 01:30

## ¿Que es Junit? 01:57

<img width="1481" alt="image" src="https://user-images.githubusercontent.com/23094588/201431661-04dc9abb-333c-4e98-914d-21df4e393c5b.png">

<img width="1182" alt="image" src="https://user-images.githubusercontent.com/23094588/201431726-29135bdc-352a-4d5d-9543-6915691ec181.png">

<img width="1480" alt="image" src="https://user-images.githubusercontent.com/23094588/201431906-79c0d4f4-950b-499b-9380-f539dd6e683e.png">

## Nuestro primer test unitario con Junit 05:46

<img width="473" alt="image" src="https://user-images.githubusercontent.com/23094588/201432169-4581d958-9665-46d5-b422-0b21131b802e.png">

Creamos el package **`suma`** y dentro la clase **`Suma`**.

<img width="570" alt="image" src="https://user-images.githubusercontent.com/23094588/201433389-56cebfae-56dc-49af-b75a-feefee9f4ba6.png">

Para generar el Test de esta clase podemos Generarlo con el IDE.

<img width="744" alt="image" src="https://user-images.githubusercontent.com/23094588/201433550-41d772ff-ba5b-4cc3-a19c-78766ee43bce.png">

<img width="668" alt="image" src="https://user-images.githubusercontent.com/23094588/201433612-2508a80e-fcd3-40cc-9e64-98e880bbc5a2.png">

<img width="533" alt="image" src="https://user-images.githubusercontent.com/23094588/201433714-5ce8e7f2-6493-4879-9c30-b9265afbd66e.png">

<img width="1510" alt="image" src="https://user-images.githubusercontent.com/23094588/201471923-9200de5f-fc83-4536-a1a6-103c2f54caaf.png">

Metemos el siguiente código y ejecutamos el Test.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201472237-aaf1147c-9a50-405b-a55d-b3d114467bed.png">

El Test lo ha pasado, básicamente hemos usado la anotación **`@Test`** y el método **`assertEquals`** de JUnit, todo lo demás es código Java.

Podemos ejecutar las Pruebas Unitarias usando el **Coverage** con la siguiente opción.

<img width="766" alt="image" src="https://user-images.githubusercontent.com/23094588/201472341-0fc04716-1379-4dd2-b4b5-058490b49a85.png">

Al ejecutarlo con **Coverage** en la clase **`Suma`** nos marca en verde todo el código que hemos cubierto con las pruebas y en la parte derecha nos pone los porcentajes de código cubierto en las pruebas, en este caso es el 100%, en caso de que hubiera código sin probar se marcaría con una barra roja.

<img width="1086" alt="image" src="https://user-images.githubusercontent.com/23094588/201472390-1f9f3707-6dc2-430e-b934-344691a05e06.png">

## Introducción a las anotaciones **`@Before`** y **`@After`** 03:23

En esta lección vamos a ver las anotaciones **`@Before`** y **`@After`**.

![image](https://user-images.githubusercontent.com/23094588/201472572-29ad3e6f-e469-476b-8d4d-0d51851a3655.png)

### **`@Before`** o **`@BeforeAll`** 

**`@Before`** nos sirve para crear un método que se va a ejecutar antes de nuestro Test, normalmente sirve para inicializar variables o datos de entrada a los métodos usados en nuestro Test.

**`@Before`** pertenece a **`org.junit.*`** y **`@BeforeAll`** pertenece a **`org.junit.jupiter.api.`** por eso yo en mi proyecto uso **`@BeforeAll`**, pero en el curso usan **`@Before`**. Además de esto observese que el método esta declarado **`static`** no **`public`** como cuando se usan las dependencias de JUnit.

![image](https://user-images.githubusercontent.com/23094588/201472920-5aa71151-1b29-4a00-b52f-0411380ade7a.png)

<img width="710" alt="image" src="https://user-images.githubusercontent.com/23094588/201472971-b3e70e0a-4792-4090-9231-d86749e34175.png">

Al ejecutar el Test vemos como se ejecuta primero el **`@Before`** y luego el **`@Test`**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201472829-046b36a4-7798-48de-94bd-ea6c212e61f4.png">

No es por la posición de los métodos podríamos tener losiguiente y la ejecución sería la misma.

<img width="1178" alt="image" src="https://user-images.githubusercontent.com/23094588/201473069-a3fcccc9-77d8-4d39-a31e-20eaa1d96564.png">

### **`@After`** o **`@AfterAll`** 

**`@After`** nos sirve para ejecutar cosas después de nuestro  **`@Test`**.

**`@After`** pertenece a **`org.junit.*`** y **`@AfterAll`** pertenece a **`org.junit.jupiter.api.*`** por eso yo en mi proyecto uso **`@AfterAll`**, pero en el curso usan **`@After`**. Además de esto observese que el método esta declarado **`static`** no **`public`** como cuando se usan las dependencias de JUnit.

![image](https://user-images.githubusercontent.com/23094588/201473347-747a299a-ed3d-4807-b6e2-192e282ccbb4.png)

Al ejecutar la aplicación los mensajes se muestran en el orden de ejecución y no en el orden que ocupan en el código.

<img width="596" alt="image" src="https://user-images.githubusercontent.com/23094588/201473241-e828bb24-885c-4193-9c3a-ee34352e9fe1.png">

Por claridad en el código vamos a ponerlas en el orden de ejecución.

<img width="1170" alt="image" src="https://user-images.githubusercontent.com/23094588/201473435-5cc4263c-1eed-4ffe-9453-97ea83db4b27.png">


## Test unitario con Junit - 1 preguntas

![image](https://user-images.githubusercontent.com/23094588/201473480-f5357e85-4594-4e99-9e2a-004cbfc215b1.png)

## Creando un Controlador Real para poder testearlo 05:23
## Testeando un Controlador o endpoind con Junit 05:39
## Testeando nuestro Controlador al 100% de Coverage 02:50
## Revisando mas anotaciones en Junit 01:49
## Test con Junit - 1 preguntas
## Anotaciones para ejecutar tests de error con Junit 01:30

