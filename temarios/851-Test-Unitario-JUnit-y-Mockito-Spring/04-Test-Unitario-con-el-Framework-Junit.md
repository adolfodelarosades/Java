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

En el curso se estan usando las dependencias de JUnit y Mockito no las de Spring-Test, es decir se ha cambiado la dependencia.

![image](https://user-images.githubusercontent.com/23094588/201473992-1118173e-4bf5-4b67-be94-f2c1945d20d5.png)

Por las siguientes

![image](https://user-images.githubusercontent.com/23094588/201474017-f8bb0d1b-6112-4e62-aba7-444b177dd822.png)

De esta manera se usan las de **JUnit** y **Moquito** originales.

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

<img width="658" alt="image" src="https://user-images.githubusercontent.com/23094588/201473781-071f8043-bc25-4b6a-a6a3-4ebe202cf4c3.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201473797-51b2f15e-d1d6-4267-848a-2b03ee7132d3.png">

## Creando un Controlador Real para poder testearlo 05:23

Vamos a crear una clase Controller que testearemos la cual tiene el siguiente código.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201475714-27b714c7-3666-43e6-92ef-7427c34fe8dd.png">

Es un Controlador al cual se le pasa un mensaje (array), este evalúa de que si este mensaje es nulo o no, en caso de que sea nulo, responde con el mensaje **`El array esta vacío`**. En caso de que este mensaje no sea nulo lo recorremos y vamos a retornar el mensaje que vamos armando.

Entonces, una vez que tenemos nuestro Controlador, vamos a pasar a testearlo y hacernos las preguntas a la hora de realizar Test Unitarios.

## Testeando un Controlador o endpoind con Junit 05:39

Vamos a realizar el Test Unitario del Controlador que creamos. Cuando hagamos Test solo debemos enfocarnos en el método las anotaciones previas del método no influyen en nada, **solo debemos enfocarnos en lo que entra y lo que sale del método**.

![image](https://user-images.githubusercontent.com/23094588/201474827-bf49372b-ad5c-4d00-b6ab-e9cca4c6cf47.png)

Al implementar un Test Unitario siempre nos debemos hacer la pregunta de que Test vamos a realizar, si miramos el código del Controlador nos damos cuenta que solo estamos trabajando con una clase, es decir no estamos llamando a ninguna clase dentro del Controlador, **por lo tanto como no necesitamos otras clases no haremos uso de Mockito** solo nos basta el uso de JUnit para testear este Controlador.


A partir del Controlador generamos el Test.

<img width="1101" alt="image" src="https://user-images.githubusercontent.com/23094588/201476002-d752934a-a360-4cb4-873f-caf104521d18.png">

<img width="558" alt="image" src="https://user-images.githubusercontent.com/23094588/201476042-a7d37b9e-3af4-4a05-b47d-f98f4040ad95.png">

<img width="677" alt="image" src="https://user-images.githubusercontent.com/23094588/201476062-ab102bcb-b40e-4529-8c87-e57824780d90.png">

Vamos a añadir el código necesario para probar nuestro controlador.

**`assertEquasl(long expected, long actual)`**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201476797-b130c5c3-c9f1-4dd8-bf56-a7a9dded593a.png">

Estamos mandando al Controlador un valor nulo, por eso estamos esperando como resultado el mensaje **`El array esta vacío`**.

Si vemos el método **`welcome`** de nuestra clase **`IndexController`** vemos que el Test cubre parte del código, concretamente el caso para cuando **`if(paramArray == null){`**, pero en el caso de que se le mande diferente de null no lo estamos probando.

<img width="1276" alt="image" src="https://user-images.githubusercontent.com/23094588/201476996-b0ba0920-6635-4e7c-b8d0-5376f34e05c3.png">

De hecho en el Coverage nos indica que tenemos cubiertos un 75% de las líneas del método.

No siempre será posible cubrir un 100% del código pero en este ejemplo si podemos probar el caso cuando recibe valor en el parámetro.

## Testeando nuestro Controlador al 100% de Coverage 02:50

Entonces lo correcto será analizar los casos que nosotros creemos que nos pueden generar errores y cubrirlos mediante el test.

Por ejemplo, qué pasaría si el array no es nulo pero NO contiene datos o en todo caso, si le pasamos los datos correctos, entonces para esos dos casos vamos a analizar otros métodos para poder evaluar en el TEST.

Nuestro primer Test **`welcomeTest()`** lo vamos a renombrar para que quede más claro que es el test para cuando el array es nulo lo llamaremos **`arrayNullTest()`**.

<img width="715" alt="image" src="https://user-images.githubusercontent.com/23094588/201477319-fc2476a1-346b-4c85-876f-04ea8fed6eec.png">

Y vamos a crear otro Test para cuando el Array es vacío.

<img width="927" alt="image" src="https://user-images.githubusercontent.com/23094588/201477565-aa35e63f-cd6c-413c-a030-cb2ec43a2164.png">

Estamos indicando que el array tiene tres elementos, por lo que nuestro resultado esperado tiene tres parametros con valores nulos es decir que el resultado esperado es **`String expectedResult = "param[0]null\n" + "param[1]null\n" + "param[2]null\n";`**, si ejecutamos el Test unitario de este método tenemos:

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201477749-89fd16d2-2647-4339-9628-d636e6c2876d.png">

Aquí no es tan claro ver el error entre lo que esperaba y lo que obtuvimos pero el IDE nos ayuda con el enlace **`Click to see difference`** que al pulsarlo vemos:

<img width="1175" alt="image" src="https://user-images.githubusercontent.com/23094588/201477881-77625a89-34e1-4b12-b0ec-076828352064.png">

Aquí es más claro ver lo que esperamos y lo que nos esta retornando el programa. Para solucionarlo podríamos poner como valor esperado lo siguiente **`String expectedResult = "param[0]null\n" + "param[0]null\n" + "param[0]null\n";`** pero el error real esta en el resultado que nos regresa el Controlador no esta incrementando el indice en ningún momento así que lo que realmente tenemos que hacer es revisar nuestro método **`welcome`** del **`IndexController`**.

<img width="1163" alt="image" src="https://user-images.githubusercontent.com/23094588/201478011-bf45f47f-d1c7-474d-9849-103e3581117b.png">

Como podemos observar inicializamos **`int i = 0;`** pero en ningún momento incrementamos su valor ese es el fallo, vamos a corregirlo.

<img width="1168" alt="image" src="https://user-images.githubusercontent.com/23094588/201478098-d62706ba-b668-44aa-b52b-cae8c8f1d18e.png">

Si ejecutamos el Test tenemos:

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201478126-244b29bb-cb55-422e-9fdb-80d4970e841b.png">

Y si ejecutamos el Coverage.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201478182-0194e84b-bd2b-4746-a484-6f7683959fc0.png">

Podemos ver que nos indica que nuestros dos métodos han pasado el Test y que hemos cubierto el 100% de las líneas de nuestro **`IndexController`**.

<img width="966" alt="image" src="https://user-images.githubusercontent.com/23094588/201478308-a8dc16d3-1593-424b-8e39-628e07e6cf12.png">

Pero este 100% realmente no esta cubriendo todos los casos posibles que podemos tener ya que nos falta el caso cuando mandamos un array con valores.

<img width="1025" alt="image" src="https://user-images.githubusercontent.com/23094588/201478535-21c3e4cd-2347-45b2-8e3c-0190de73deeb.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201478558-0c419a1f-d054-4368-9908-7be673aaf344.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201478606-148c8309-7e07-4936-a939-1ae1ada8d973.png">

Hemos realizado 3 métodos de Test

<img width="1254" alt="image" src="https://user-images.githubusercontent.com/23094588/201478690-da86c57e-3aee-46b0-8bb8-39142b48acde.png">

para comprobar el funcionamiento de nuestro Controlador.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/201478723-b7f6d974-a36c-45ef-903c-7bc79cefa95f.png">

**NOTA**: Cuando hemos llegado al 100% de cobertura en Coverage eso realmente no significa que hemos cubierto todas las pruebas posibles ya que los casos que podemos tener son varios. Entonces lo correcto será analizar los casos que nosotros creemos que nos pueden generar errores y cubrirlos con Tests independientemente que Coverage nos indique ya hemos cubierto el 100%.

## Revisando mas anotaciones en Junit 01:49

![image](https://user-images.githubusercontent.com/23094588/201475381-37f4f066-3bf1-4fac-b154-bc87de2cde76.png)

## Test con Junit - 1 preguntas

![image](https://user-images.githubusercontent.com/23094588/201475448-ec0e6db3-22e8-4d37-ab13-87cc1071212c.png)

## Anotaciones para ejecutar tests de error con Junit 01:30

![image](https://user-images.githubusercontent.com/23094588/201475472-44a78ee4-2475-4d7e-b091-352186e7dd11.png)




