# 02 JUnit 5

* Introducción pruebas unitarias 09:14
* Introducción JUnit 5 10:31
* Creando y configurando el proyecto con JUnit 5 08:48
* Escribiendo y ejecutando primeras pruebas unitarias con Assertions 17:19
* Escribiendo test para el saldo 11:44
* Test driven development TDD con JUnit 10:13
* TDD para debito y crédito 11:12
* Probando y afirmando excepciones con **`assertThrows`** en JUnit 5 12:14
* Añadiendo la clase Banco y la realcion con las cuentas 09:55
* Probando y afirmando las realciones entre Banco y Cuenta 08:01
* Usando el método **`assertAll`** 07:10
* Agregando mensajes de falla en los métodos **`assertions`** 07:29
* Usando anotaciones **`@DisplayName`** y **`@Disabled`** 08:02
* Ciclo de vida anotaciones **`@AfterEach`** y **`@BeforeEach`** 11:12
* Ciclo de vida anotaciones **`@AfterAll`** y **`@BeforeAll`** 07:25
* Test condicionales **`@EnabledOnOs`**, **`@EnabledOnJre`**, **`@EnabledIfSystemProperty`** etc. 18:13
* Ejecuciones de test condicionales con **`@EnabledIfEnvironmentVariable`** 08:45
* Ejecución de test condicional con **`Assumptions`** programáticamente 10:17
* Clases de test anidadas usando **`@Nested`** 11:03
* Repitiendo pruebas con **`@RepeatedTest`** 08:36
* Escribiendo pruebas parametrizadas con **`@ParameterizedTest`** 10:50
* Pruebas parametrizadas con **`@ParameterizedTest`** parte 2 08:03
* Pruebas parametrizadas con **`@ParameterizedTest`** parte 3 11:15
* Tagging tests con anotación **`@Tag`** 06:47
* Inyección de Dependencia & componentes **`testInfo`** y **`TestReporter`** 12:38
* **`Timeout`** en JUnit 5 09:06
* Maven surefire plugin 09:50
* Descargar Código Fuente 00:03

## Introducción pruebas unitarias 09:14
## Introducción JUnit 5 10:31
## Creando y configurando el proyecto con JUnit 5 08:48

![image](https://user-images.githubusercontent.com/23094588/130349155-dda27d56-36e2-4fba-a3af-a0f39182adf2.png)

![image](https://user-images.githubusercontent.com/23094588/130349165-aba4c3f8-7671-4b6a-9bdc-db6f6d913687.png)

![image](https://user-images.githubusercontent.com/23094588/130349323-21141834-49d9-4f7c-8425-0f0eb98a3108.png)

![image](https://user-images.githubusercontent.com/23094588/130349395-a24bf3bb-2db4-4de9-a889-aae0258b93b7.png)

Con ALT + Insert podemos añadir dependencias o visitar https://mvnrepository.com/

![image](https://user-images.githubusercontent.com/23094588/130349558-14dd16a1-1304-4ae3-93e0-5d239333faaa.png)

![image](https://user-images.githubusercontent.com/23094588/130349591-969f5a05-1bf5-49a8-9cd1-2f522841ad1c.png)

![image](https://user-images.githubusercontent.com/23094588/130349764-4519465e-b8e7-4628-9538-b6cc7be00cea.png)

![image](https://user-images.githubusercontent.com/23094588/130349888-232e1cfd-a6bc-4ab4-bde1-060c3a9c208f.png)

Con IJ hay que presionar un botón para descargar las dependenias añadidas de Maven.

![image](https://user-images.githubusercontent.com/23094588/130349977-fc32802e-db9b-41a9-b263-088d77f9bab3.png)

![image](https://user-images.githubusercontent.com/23094588/130349998-904f1176-abee-4884-a3d2-8c23ac946838.png)

Dentro de **`src/main/java`** vamos a crear el paquete **`org.javaocio.junit5app.model`** y dentro la clase **`Cuenta`**

![image](https://user-images.githubusercontent.com/23094588/130350227-7fdeb62f-f767-4d83-9bfa-1d8eda87aae6.png)

Vamos a meter algunos atributos y sus métodos getters y setters:

![image](https://user-images.githubusercontent.com/23094588/130350318-96ad7db4-90c3-4509-8535-ee1cb2e424d4.png)

![image](https://user-images.githubusercontent.com/23094588/130350400-ab8ec228-9272-4c97-bbcb-70ddae9508b7.png)

![image](https://user-images.githubusercontent.com/23094588/130350408-357ee4a0-cf67-4ec1-929e-5b5e94ad765e.png)

![image](https://user-images.githubusercontent.com/23094588/130350444-76c232ff-fb24-4a48-bff2-11d82ee7138e.png)

![image](https://user-images.githubusercontent.com/23094588/130350457-b4368475-7bc6-42eb-871f-f882f72e3b35.png)

## Escribiendo y ejecutando primeras pruebas unitarias con Assertions 17:19

En esta lección vamos a probar la clase **`Cuenta`**.

![image](https://user-images.githubusercontent.com/23094588/130350566-3a542d42-86e5-42f5-b49e-2ff91562315f.png)

En **`src/main/java`** vamos a tener el código Java y en **`src/test/java`** tendremos las clases de Test, podemos crear manualmente el paquete y la clase de Test o podemos usar las ventajas del IDE para crear la clase de Test, nos colocamos en el nombre de la Clase y pulsamos ALT + Insert en MAC (Windows + N) otra forma es con ALT + ENTER

![image](https://user-images.githubusercontent.com/23094588/130350796-7ba64afd-e0ee-48cb-a84c-b2706ddabf57.png)

Y seleccionar **`Test...`**

![image](https://user-images.githubusercontent.com/23094588/130350931-770bf2cf-2a38-422f-b8b9-e5fda87247e5.png)

Aceptamos sin agregar nada.

![image](https://user-images.githubusercontent.com/23094588/130350956-3e779e05-efc2-4828-9dac-889479d16cb2.png)

Vamos a añadir un método **`test()`** y lo vamos a anotar con **`@Test`** del paquete **`org.junit.jupiter.api`** la cual indica que este método se debe ejecutar.

![image](https://user-images.githubusercontent.com/23094588/130351204-3fad0ea7-1347-4db6-9d21-54a85518cda4.png)

La clase creada es una clase de paquete (No **`public`**) lo que significa que solo se puede ejecutar dentro de los paquetes de Test. Otra forma de insertar un método de Test es usar ALT + Insert 

![image](https://user-images.githubusercontent.com/23094588/130351307-e29315e1-eb24-4f82-ac96-54fc6a0d69bf.png)

y seleccionar **`Test method`**

![image](https://user-images.githubusercontent.com/23094588/130351327-7154557e-afe2-4e2a-b342-7d8b263e8443.png)

Ya solo le ponemos el nombre que queramos. En algunos casos los nombres se ponen así **`test_nombre_cuenta`** para que en los reportes sea más facíl saber que método se ejecuto aun que hay otra opción mejor, nosotros le pondremos **`testNombreCuenta`**, vamos a meter el siguiente código.

![image](https://user-images.githubusercontent.com/23094588/130351587-8814d66a-2fcf-4ea4-9077-475f24c9ff73.png)

 Vamos a ejecutar hay varias formas con la flecha verde del método ejecutará solo ese método, con las dos flechas en el nombre de la clase ejecutará todos los métodos de la clase o con la combinación de teclas CTRL + SHIFT + F10.
 
 ![image](https://user-images.githubusercontent.com/23094588/130351663-222279ea-7219-4bb2-be98-33047915d84d.png)

#### `assertEquals`

Se ejecuto la clase sin ningún error, hemos ejecutado la clase Test pero realmente no estamos probando nada, debemos usar el API y los métodos estáticos de la clase **`Assertions`** (comentamos la clase importada para usarla como clase estática).

![image](https://user-images.githubusercontent.com/23094588/130352791-a7b908af-4ca5-44a0-96bf-aa2eb0ff1189.png)

Si ejecutamos nuevamente la Clase Test tenemos:

![image](https://user-images.githubusercontent.com/23094588/130352830-4ad8ddc0-ba1b-4cb6-9d6b-9ae6a4aea7af.png)

La ejecución ha ido bien, vamos a cambiar el código comentando el **`set`** y ejecutamos nuevamente:

![image](https://user-images.githubusercontent.com/23094588/130352889-9645b0fc-e682-45e8-8655-5219be43e396.png)

Aquí la cosa ya ha ido mal ya que el valor esperado (**`Expected :Adolfo`**) no es igual al valor real (**`Actual :null`**) es decir que comparamos **`Adolfo`** con **`null`** y como no son iguales no pasan la prueba de Test.

Vamos a regresar a la clase **`Cuenta`** con CTRL + TAB y le vamos a crear un constructor con ALT + Insert (Windows + N) 

![image](https://user-images.githubusercontent.com/23094588/130353058-a118c011-53c8-44ea-9918-f6186c73415c.png)
 
Pero solo con el atributo **`saldo`**

![image](https://user-images.githubusercontent.com/23094588/130353070-a61f26fe-970a-40fa-b08f-ec709caafd00.png)

Si ahora manualmente metemos en los parámetros a **`persona`** tenemos:

![image](https://user-images.githubusercontent.com/23094588/130353160-776417e4-9634-4399-940b-7e566d61e288.png)

Hemos olvidado asignar el parámetro **`persona`** al atributo **`persona`**(intencionalmente). El error que nos marca es por que en la clase Test estamos usando un constructor sin argumentos. Vamos a regresar a la clase **`CuentaTest`** y pasamos los valores en el Constructor.

![image](https://user-images.githubusercontent.com/23094588/130353444-429100f2-2f79-42b9-9632-377ef31554cd.png)

Vamos a ejecutar el Test.

![image](https://user-images.githubusercontent.com/23094588/130353466-c4542eb5-035a-4085-b53e-765b7a2a44d5.png)

Seguimos teniendo el mismo problema, pero en este caso es pq el código del Constructor de nuestr clase **`Cuenta`** no esta del todo bien, vamos a modificarlo.

![image](https://user-images.githubusercontent.com/23094588/130353525-be7c7554-f51c-4b2e-8d86-df9542c59cad.png)

Y volvemos a ejecutar el Test.

![image](https://user-images.githubusercontent.com/23094588/130353546-ad8c2afe-24cd-4f2c-acbe-abca067b94d8.png)

Ahora el Test a pasado la prueba.

Antes habíamos probado el método **`set`** ahora lo que estamos probando es el Constructor.

Vamos a dejar de usar la clase estática **`Assertions`** y vamos a importala para solo usar `assertEquals`.

![image](https://user-images.githubusercontent.com/23094588/130353698-aaf7cd2d-8bd2-42ca-96dc-31b72c43ae49.png)


#### `assertTrue`

Esto nos va a servir para evaluar una expresión booleana. 

![image](https://user-images.githubusercontent.com/23094588/130353765-7e575521-9961-49ba-9a8a-fdbecef41481.png)

Todo ha ido bien, vamos a cambiar el valor para que falle.

![image](https://user-images.githubusercontent.com/23094588/130353835-fa76b085-a2f2-4bab-827b-67c1ce8e9f9d.png)

Cuando tenemos varias Assertions todas ellas deben cumplirse para que pase el Test, en este caso el `assertTrue` falla ya que se esperaba verdadero(**`Expected :true`**) pero obtuvimos falso(**`Actual   :false`**).

Vamos a hacer una última modificación en la clase **`Cuenta`** para que regrese la **`persona`** siempre en mayúsculas.

![image](https://user-images.githubusercontent.com/23094588/130353975-b875303e-9503-4e18-95dc-aa3a80914456.png)

Y en Test ponemos lo siguiente y lo ejecutamos:

![image](https://user-images.githubusercontent.com/23094588/130354033-8a43b228-0221-4d50-bfe8-946710003231.png)

Aquí tenemos mal tanto el **`assertEquals`** y **`assertTrue`** pero solo nos esta marcando el primer fallo el de el **`assertEquals`** vamos a cambiar para comprobar esto.

![image](https://user-images.githubusercontent.com/23094588/130354099-71b07adb-6814-4467-8a9e-49adee40dbb9.png)

Ahora el error nos lo manda en el **`assertTrue`**, vamos a modificar el código para que pase la prueba

![image](https://user-images.githubusercontent.com/23094588/130354719-a5dc322a-20c7-4a80-8f2f-61e0a1adfb3f.png)

Pero realmente estamos modificando el valor que espera en el Test para que la pase, normalmente lo que vamos a corregir el código para que retorne lo que se espera, en este caso vamos a quitar el **`.toUpperCase()`** en la clase **`Cuenta`** y también vamos a modificar lo cambiado en el Test.

![image](https://user-images.githubusercontent.com/23094588/130354890-62efa2e7-0975-4036-a5d3-412c0f9e5fc5.png)

## Escribiendo test para el saldo 11:44

Ahora nos vamos a enfocar el **`saldo`**, para lo cual vamos a crear un nuevo método llamado **`testSaldoCuenta()`**

![image](https://user-images.githubusercontent.com/23094588/130355165-5ea6b3c5-afb5-4576-8b68-717767ae9baa.png)

Para que IJ nos cree la variable.

![image](https://user-images.githubusercontent.com/23094588/130355208-74bcdc59-a45a-4d3d-ba44-f9a17ee03d86.png)



## Test driven development TDD con JUnit 10:13
## TDD para debito y crédito 11:12
## Probando y afirmando excepciones con **`assertThrows`** en JUnit 5 12:14
## Añadiendo la clase Banco y la realcion con las cuentas 09:55
## Probando y afirmando las realciones entre Banco y Cuenta 08:01
## Usando el método **`assertAll`** 07:10
## Agregando mensajes de falla en los métodos **`assertions`** 07:29
## Usando anotaciones **`@DisplayName`** y **`@Disabled`** 08:02
## Ciclo de vida anotaciones **`@AfterEach`** y **`@BeforeEach`** 11:12
## Ciclo de vida anotaciones **`@AfterAll`** y **`@BeforeAll`** 07:25
## Test condicionales **`@EnabledOnOs`**, **`@EnabledOnJre`**, **`@EnabledIfSystemProperty`** etc. 18:13
## Ejecuciones de test condicionales con **`@EnabledIfEnvironmentVariable`** 08:45
## Ejecución de test condicional con **`Assumptions`** programáticamente 10:17
## Clases de test anidadas usando **`@Nested`** 11:03
## Repitiendo pruebas con **`@RepeatedTest`** 08:36
## Escribiendo pruebas parametrizadas con **`@ParameterizedTest`** 10:50
## Pruebas parametrizadas con **`@ParameterizedTest`** parte 2 08:03
## Pruebas parametrizadas con **`@ParameterizedTest`** parte 3 11:15
## Tagging tests con anotación **`@Tag`** 06:47
## Inyección de Dependencia & componentes **`testInfo`** y **`TestReporter`** 12:38
## **`Timeout`** en JUnit 5 09:06
## Maven surefire plugin 09:50
## Descargar Código Fuente 00:03

