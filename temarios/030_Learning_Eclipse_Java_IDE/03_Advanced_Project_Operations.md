# 03 Advanced Project Operations

* Adding JUnit Tests 4m 11s
* Import A JAR File 1m 35s
* Deleting From Eclipse And Removing A Project From Disk 1m 38s
* Importing And Configuring An Existing Project 6m 14s
* Folding Code Regions 1m 54s

## Adding JUnit Tests 4m 11s

En esta lección, repasaremos cómo podemos usar pruebas unitarias en nuestro IDE de Eclipse para programación Java. 

Entonces, lo primero que debemos hacer es asegurarnos de identificar la clase que queremos probar. En este caso, vamos a probar la clase **Encriptor** que teníamos antes. Ahora bien, esta clase **Encriptor** actualmente no tiene nada. Entonces agreguemos un constructor. Y simplemente diremos **Encriptor** público. Y solo para que no sea solo el constructor predeterminado, agreguemos un **`int`** o un **`shift`** o un **`offset`** para el **Encriptor**. Así que seguimos adelante y guardamos eso. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/aabe1532-6b2a-44ce-a969-165fd270cdb6">

Y luego, si quisiera hacer un poco más aquí, simplemente podría agregar esa variable. Luego, podrías crear los métodos **`get`** y **`set`** y probarlos también, si quisieras practicar algunas pruebas. Aquí no vamos a llegar a ese nivel. 

Básicamente, solo cubriremos cómo seguir adelante y configurar la prueba. Entonces, por supuesto, hay dos formas diferentes de agregar pruebas a nuestro código. Lo primero que podemos hacer es seleccionar el archivo **Encriptor** y seleccionar **File, New, Junit Test Case**. 

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f948330d-3718-48f7-b0a8-1dc32f2077e9">

Ahora, una vez que hagamos esto, aparecerá un cuadro de diálogo. 

<img width="1504" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b114e014-b53e-4a46-9138-005aa747b5de">

Lo que podemos ver aquí es que podemos seleccionar pruebas **JUnit3** o **JUnit4**. Entonces usaremos **JUnit4** en este punto. El nombre de la clase de prueba que vamos a crear, que se llamará **EncriptorTest**, será simplemente el nombre del archivo o la clase que estás probando, seguido de prueba. Puedes cambiarlo, si lo deseas. 

Puede seleccionar métodos predeterminados para incorporar, como **setUpBeforeClass()** y **tearDownAfterClass()** o **setup()** y **tearDown()**, que, por supuesto, se ejecutaría antes de cada prueba. Puedes generar comentarios con **Generate comments**, si lo deseas. 

Y si desea cambiar la clase que está probando, por ejemplo, si no hizo clic exactamente en la que deseaba, puede buscar fácilmente la clase específica que desea probar con el botón **Browse** de **Class under test**.

O puede presionar **Finish** y simplemente dejar que se genere, pero continuaremos y presionamos **Next** para poder ver lo que hay en la página siguiente.

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f519c169-ab86-478b-af53-dae40c72e393">

Aquí lo que notaremos es que ahora existen métodos que podemos utilizar para nuestras pruebas. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6c3482ea-1da6-436a-b2ce-7aa8ea6e6134">

Esto es realmente útil si tenemos una clase realmente grande con muchos métodos. De esa manera, podríamos introducir fácilmente esos métodos de prueba, sin tener que escribir cada uno manualmente. Aquí tenemos nuestro constructor predeterminado. Así que sigamos adelante y seleccionemos eso. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/9125236c-6d63-4ee2-9aa1-9b72c82e2345">

Y tenemos todos los métodos del objeto, que heredamos. Por eso no vamos a probar nada de eso en este momento. Puede seleccionar **Create final method stubs** o **Create tasks for generated tests methods**. No necesitamos hacer eso. Así que seleccionemos **Finish**.

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8aa0bd1f-9a5e-452b-ae1c-f042ffbed557">

Notaremos una última cosa. Si esta es la primera prueba JUnit que agregamos a nuestro proyecto, debemos configurar la ruta de compilación para incluir la library **JUnit4**, ya que estamos usando pruebas JUnit4. Entonces continuaremos y seleccionaremos **Ok**.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/06331f37-8453-4cc1-bc69-d258359c6025">

Ahora, si nunca ha hecho esto antes, es posible que vea un cuadro de diálogo emergente que dice: ¿Le gustaría permitir que esto se comunique? Puedes continuar y seleccionar eso, si estás trabajando en Windows. Y adelante, permítelo. Realmente no es gran cosa. 


Pero aquí lo que vemos es que ahora tenemos nuestro **EncriptorTest** con un **`fail`** instalado automáticamente: tiene la prueba configurada para JUnit4. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6b08b039-1ea8-424c-ad9f-bedd7ac6f381">

Así que sigamos adelante y asegurémonos de que todos nuestros archivos estén guardados. 

Y lo que podemos hacer para ejecutar esto es lo mismo que hemos visto anteriormente. Podemos hacer clic derecho en **EncriptorTest** y seleccionar **Run As, JUnit Test**. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/67b5bb04-0120-4bce-9c45-4c237213312f">

Y esto ejecutará esa prueba y ejecutará la ejecución, y deberíamos ver que falla. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c4bf3b12-6f25-4ed2-a485-8945ced806eb">

Podemos verlo fallar. Y, por supuesto, la razón por la que falló es porque aún no se ha implementado. 

Y luego, la otra forma en que podríamos ejecutarlo es aquí en este botón que usamos para ejecutar antes, podríamos seleccionar **Run As, JUnit Test**. Y nuevamente, se ejecutará. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2e5a130d-09c1-4675-94dc-1ab0f865d7df">

Entonces hay dos maneras diferentes en que podemos ejecutar eso. Lo último que quiero ver es agregar rápidamente un caso de prueba a una clase existente. Así que agreguemos una vez más una nueva clase aquí. 

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0d2ee8cb-7b8e-4523-b5de-f3e0b1bdda99">

Y vamos a llamar a este **DataFileManipulator**. Y no haremos nada especial para esa clase en este momento. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/686b1fa5-b72a-4239-a8cf-b61822b5d46e">

Y realmente no necesitamos probar esto, así que no agregaré ningún código en este momento. 

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3db52299-9042-45f0-bab7-64849ab824bf">

Pero solo quiero mostrarles que pueden hacer clic derecho directamente aquí y seleccionar **New**. Y necesitamos buscar **Other**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/37b59785-9e31-49cb-a270-3caaf5bf7521">

Entonces necesitamos encontrar el asistente **JUnit** aquí. Lo que queremos hacer es navegar hacia abajo, encontrar **Java**, en **Java**, podemos encontrar **JUnit** y luego podemos hacer un **JUnit Test Case** o un **JUnit Test Suite**.

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/60a1daef-1a64-4cf3-940c-20d78879cf5c">

La otra cosa que podríamos haber podido hacer... aquí arriba, podríamos haber podido escribir JUnit. Y muy fácilmente, mostrará aquellos que coincidan con eso. 

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f3887917-37d3-4051-afe6-6213fa179991">

Así que sigamos adelante y seleccionemos el **JUnit Test Case**, **Next**.

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/673c1242-170a-46a6-b09a-7f4a252f4aee">

Y nuevamente, tuvimos el mismo cuadro de diálogo que vimos antes con la misma capacidad para seleccionar métodos. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/66c03a47-458a-47ad-be2a-80906cac063a">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/acb72f17-6f1d-4fe1-ad9e-48e0e485b7b2">


Y una vez más, ahora tenemos nuestra prueba configurada y lista para escribir nuestras pruebas unitarias. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5ce01804-755d-49b2-b0a7-becf783d4519">

Con esto concluye nuestro análisis de la creación de pruebas unitarias en el IDE de Java Eclipse.

## Import A JAR File 1m 35s

En esta lección, veremos cómo podemos importar un JAR a nuestro proyecto actual. Entonces, para nuestro código, usaremos un archivo JAR llamado quick-json. Así que vayamos a https://code.google.com/p/quick json/downloads/list. En esa página, sigamos adelante y seleccionemos descargar el archivo JAR Quick-Json. Y veremos que se descarga fácilmente. Y luego simplemente muevamos ese archivo JAR descargado directamente a la raíz de nuestro Administrador de contraseñas de Infinite Skills, para que viva allí con nuestro proyecto. Puedes ponerlo en la carpeta de origen si así lo deseas. Básicamente, sólo necesita colocarlo en algún lugar de su disco donde pueda consultarlo fácilmente. Ahora que tenemos ese archivo JSON JAR en nuestro directorio, sigamos adelante e importemoslo a nuestro proyecto. Ahora, la forma más sencilla de hacerlo es simplemente hacer clic derecho y seleccionar Ruta de compilación, Configurar la ruta de compilación. Y aquí lo que haremos es ir a Bibliotecas y seleccionaremos Agregar JARS externos. Y, por supuesto, hay múltiples opciones para agregar archivos JAR, pero lo que queremos hacer es buscar nuestra carpeta que contiene el archivo JAR descargado que acabamos de colocar en esa estructura de directorios. Y sigamos adelante, seleccionemos eso y seleccionemos Abrir. Puede ver que se hace referencia a quick-json-1.0.2.3.jar. Sigamos adelante y seleccionemos Aceptar. Y ves que ahora está aquí abajo. Y lo que sucederá es que podremos ver todas las diferentes cosas que existen dentro de ese paquete ahora que podemos usar y que se hacen públicas. Y podemos usar eso en nuestro código. Y eso es esencialmente todo lo que hay que hacer para importar un archivo JAR a un proyecto actual.

## Deleting From Eclipse And Removing A Project From Disk 1m 38s
## Importing And Configuring An Existing Project 6m 14s
## Folding Code Regions 1m 54s
