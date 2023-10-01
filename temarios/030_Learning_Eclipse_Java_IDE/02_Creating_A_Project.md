# 02 Creating A Project

* Setting Preferences 1m 33s
* Eclipse IDE Perspectives 1m 34s
* Creating New Projects 2m 41s
* Creating Packages 1m 39s
* Creating Classes 4m 17s
* Running The Program 1m 37s
* Project Folder Structure 1m 40s

## Setting Preferences 1m 33s

En esta lección, antes de comenzar, quiero configurar algunas preferencias en nuestro IDE de Eclipse. Entonces lo que voy a hacer es ir a **Windows, Preferences**. 

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/632500a3-b083-426c-9d4d-a6d7e82c4340">

Y lo que puedes ver aquí es que hay diferentes **Fonts** y cosas que puedes configurar.

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/27b4b2e9-1c3b-4d35-9998-dbe009fc5e52">

Ahora, ya modifiqué esto para que se vean un poco más grandes y así sea más fácil verlos. Pero lo hice yendo a **General, Appearance, Colors and Fonts**. Y aquí configuré la **Dialog Font** en tamaño 12, mientras que la suya probablemente esté predeterminada en 10. 

<img width="1507" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0e45f447-4788-4e7c-bf16-15f254c981d4">

Y si desea cambiar eso, puede cambiarlo fácilmente seleccionando un tamaño de fuente diferente, seleccionando **OK** y presionando **Apply**. 

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a7826fc8-83ea-426d-86a2-188d2ee2cbc9">

Entonces, con eso, mis colores y fuentes se configuran un poco más grandes, nuevamente, solo para que podamos verlos. Entonces, si tiene problemas para ver su texto en los cuadros de diálogo que aparecen, como este cuadro de diálogo Preferencias, o en su editor mientras escribimos código, recuerde que puede regresar aquí, ir a **General, Appearance, Colors and Fonts**. y podrás configurar eso. 

Ahora, también notarás que hay muchas cosas diferentes con las que podemos trabajar aquí y que podemos cambiar en estas preferencias. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/afe32269-061b-40c6-9a12-99f7fa5bd772">

Ahora bien, no vamos a hacer nada de esto en este momento. Pero si desea cambiar cosas diferentes específicamente para la perspectiva Java o la perspectiva Java EE, puede venir aquí y encontrar la configuración que está buscando y poder modificar cómo aparecen las cosas o cómo se distribuyen o lo que sea, es lo que está buscando específicamente para que las cosas funcionen de la manera que necesita para su entorno. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/deeef732-9220-4e70-8d56-6463c6b5af45">

Así que este es un vistazo rápido a cómo configurar algunas preferencias y asegurarnos de que las cosas que queremos aparezcan como queremos mientras trabajamos con nuestro IDE de Eclipse.

## Eclipse IDE Perspectives 1m 34s

En esta lección, veremos cómo configurar la perspectiva para el tipo específico de programación Java que buscamos hacer. Entonces, lo que veremos aquí en la parte superior derecha, en mi editor, pueden ver que tengo Java EE, que actualmente está resaltado, Java y depuración. 

<img width="1506" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/97fbf6b9-9a9f-49fc-a145-af3bce4c0c9f">

Es posible que no veas todos estos en este momento. Esto se debe simplemente a que es posible que nunca hayas seleccionado esa perspectiva específica. Entonces, lo que podemos hacer, si no ve la perspectiva que está buscando, es hacer clic en el cuadro de diálogo **Open Perspective** y luego podrá encontrar la perspectiva diferente que le gustaría. 

<img width="278" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/da9bb6dc-9a8f-477a-a240-d61559e199c5">

Por ejemplo, si desea depurar o utilizar Java, puede seleccionar Java aquí y seleccionar Aceptar. 

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/74d5056c-24f1-46e6-988f-a67548f69081">

Y lo que sucederá es que verá que su perspectiva cambiará a su configuración actual de Java o lo que sea. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e3ed126d-658d-416f-946e-3fa50fb19d34">

Entonces, si había seleccionado **Java**, podría cambiar a **Java EE**. Luego también deberías ver el que has seleccionado, disponible para un cambio rápido haciendo clic en él. 

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a97c310f-24fa-4141-979d-7d5af31e0ccc">

Entonces esto simplemente nos permite movernos rápidamente entre perspectivas. **Java EE** es útil si intentamos crear componentes web, servicios web o servlets o incluso un bean Java empresarial. Y, por supuesto, Java sería más para nuestras aplicaciones de escritorio: nuestros programas simples que estamos escribiendo y que tal vez querríamos trabajar si estuviéramos trabajando en un entorno académico o simplemente un programa simple para nuestro propio escritorio. Y, por supuesto, el modo **Debug** nos permitiría recorrer el código y mirarlo para ver dónde están ocurriendo los problemas. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a254c617-a17f-490e-b9af-e4b68776ca24">

Y puedes ver que cada vez que hago clic en una perspectiva diferente, el entorno cambia para mostrar cosas específicas que son útiles en esa perspectiva específica. Y esto concluye nuestra mirada sobre el cambio de perspectivas y el uso de perspectivas para realizar nuestra programación en Java Eclipse IDE.

## Creating New Projects 2m 41s

En esta lección, vamos a crear nuestro primer proyecto. Para asegurarnos de que estamos configurados para nuestro tipo de proyecto correcto, queremos estar en la perspectiva **Java** para esto. Entonces, si está en **Java EE** o en **Debug** o en algún otro tipo de perspectiva, primero seleccionemos la perspectiva **Java**. 

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fd884708-c923-4807-9e39-605353667c5a">

Y podríamos notar que aquí a la izquierda, en este momento, es posible que solo veamos el **Package Explorer - Explorador de paquetes**  pero también existe un **Project Explorer** que por el momento no vemos. 

<img width="255" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/40059b60-c409-4b67-a13f-d9ecd68675fe">

Lo que queremos hacer es ir a **Window, Show View y seleccionar Project Explorer**, si no lo vemos. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0d4c24de-2aed-4ca5-a329-d1ede0ea5d29">

Así que aquí está nuestro **Project Explorer**. 

<img width="314" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/58ab04c6-6d7d-47b6-9cf1-6cf213ee04bd">

Y hay múltiples formas de crear nuevos proyectos. La forma más sencilla es seleccionar **File, New, Java Project**. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/4480df58-e36f-493e-96d7-061b8dbd6e21">

Ahora esto nos dará un diálogo. Así que llamemos a este **InfiniteSkillsPasswordManager**. 

Ahora puede ver que hay varias cosas que debemos seleccionar al crear este proyecto, como usar la ubicación predeterminada **Use default location**, que es **`C:/JavaProjects`** para Mi PC, o cualquiera que sea su ubicación predeterminada actual. Y puedes seleccionar qué entorno Java usar **JRE**, dependiendo de lo que tengas instalado. Entonces, si tengo instalado 1.8 o 1.7, sea cual sea el entorno que queramos tener. Entonces, si solo hemos configurado 1.8, continúe y selecciónelo. Si tiene otros configurados, entonces, por supuesto, puede seleccionarlo. Entonces, en este momento, mi JRE predeterminado en realidad es **JRE 7**, aunque tengo 8 instalado. Así que dejaré esto como 7. Y nuevamente, puedes seleccionar si **el proyecto será la raíz de las fuentes y los archivos de clase - Use project folder as root for sources and class files**  o si quieres carpetas separadas - **Create separate folders for sources and class files**. Recomiendo carpetas separadas. Simplemente es más fácil de administrar. Puede seleccionar **Next**. 

<img width="1508" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/649d37b1-c3e9-439d-9c62-1be6fdb2dc16">

y ver otra información, como la pestaña **Source**, las cosas que ya están en ella y los **Projects**. Si desea implementar algunas **Libraries**, como jars, llegaremos a eso. Diferentes cosas que hacer aquí con **Order and Export**, cómo se construye. Básicamente, este es sólo nuestro diseño de construcción. Entonces, si no hubieras dicho **Next**, habrías dicho simplemente **Finish** por defecto y sería exactamente igual a como lo dejo. Así que no es gran cosa. 

<img width="1502" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a322f235-15fe-4c05-b281-d607b3e3f14d">

Y aquí, por supuesto, vemos que ahora tenemos nuestra carpeta **src** y nuestra Library del sistema para **Java 1.7**, que seleccioné. 

<img width="311" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/24c5b51b-eb46-41ff-ad54-42250c57dd4c">


Si hubiera seleccionado **1.8**, por supuesto, todavía estaría usando ese o **1.6**, si todavía está usando **1.6**. Pero esencialmente, eso concluye creando nuestro proyecto usando el menú **File**. 

Por supuesto, podemos hacer clic derecho en esa área y seleccionar **New Project** también. 

<img width="1507" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/774ce2eb-a44b-4c45-88ff-432bfd550a80">

Y eso, nuevamente, nos dará los diferentes cuadros de diálogo para lo que queremos seleccionar. Entonces podríamos tener un proyecto Java, o podríamos hacer otros tipos diferentes de proyectos, si queremos hacer algo más. Esa es otra forma de crear proyectos. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/90b5f21d-c650-413f-bc65-6b00bb510e84">

Ahora no voy a crear más proyectos. Sólo vamos a usar este. Pero si quisiera, nuevamente, las dos formas son usar **File, New**, o puede presionar **Alt-Shift New** o **Alt-Shift-N** y seleccionar **Project Java** o cualquier otro tipo que desee. O puede hacer **clic derecho** en este menú aquí en el **Explorador de proyectos** y seleccionar **New** y el tipo de proyecto que desee. 

Esto concluye nuestra visión completa de la creación de proyectos en Java Eclipse IDE.

## Creating Packages 1m 39s

En esta lección, veremos cómo crear **Packages** en nuestros proyectos en Eclipse IDE. Una vez más, hemos creado el proyecto **InfiniteSkillsPasswordManager**, y debajo tenemos una carpeta **src** y nuestras **Libraries** que están actualmente incluidas en nuestra compilación. Por supuesto, hay dos formas de agregar paquetes. De una manera, podemos hacer clic derecho en **src** y seleccionar un **New Package**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/36237f76-9fa5-439f-8c81-4206b7d0a744">

Y aquí, una vez que tengamos esto en marcha, podemos decir que queremos que el nombre de nuestro paquete sea **`com.infiteSkills.program`**, y usted puede seleccionar si desea o no crear el **package-info.java`** y seleccionar **Finish**. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c050ffd8-e619-4795-b9a6-f50d9d77f6e3">

Y puedes ver que ahora tenemos nuestro paquete **`com.infiniteSkills.program`**. 

<img width="308" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e3880e53-54de-4da0-9fbb-7b0e4a5628b9">

La otra forma, por supuesto, es seleccionar del menú **File, New, Package**, tal como lo hicimos antes. 

Y podríamos presionar **Alt Shift N**, y eso abre el nuevo menú justo donde estamos, como si lo hubiéramos seleccionado desde el menú. 

<img width="1507" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/73e9994e-f048-4eb3-8fcb-55c243015945">

De cualquier manera funciona bien, pero si estás tratando de acostumbrarte a no usar el mouse, lo cual es una muy buena práctica, **Alt Shift N**, por supuesto, nos dará la posibilidad de hacer algo nuevo que queramos. De nuevo aquí podríamos hacer otro paquete. Aquí hagamos **`com.infiteSkills.utilities`**. Y nuevamente puede decidir si desea o no crear también **package-info.java**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/edd7eec0-459b-4644-9351-5798471739d9">

Ahora puede ver que hemos creado con éxito ambos paquetes dentro de nuestro proyecto utilizando cualquiera de los métodos. 

<img width="309" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b7975396-9224-4745-a3a3-d95941accee5">

Ya sea haciendo clic derecho en la carpeta **src**, seleccionando **New** y agregando el **Package** o seleccionando la carpeta, presionando **Alt Shift N** y seleccionando paquete o archivo, nuevo, paquete con el mouse. 

Y eso concluye nuestra mirada a la creación de paquetes en nuestros proyectos.

## Creating Classes 4m 17s

En esta lección, analizaremos las múltiples formas en que podemos agregar **clases** a nuestro proyecto. Con esto, para poder completar el código de este proyecto, vamos a tener dos archivos que debemos tener a mano. Estos deberían incluirse en los recursos de nuestro curso. El primero será **programcode.txt** y el siguiente será **passwordmanagercode.txt**. Ahora esos son resguardos de código que vamos a colocar directamente en nuestra clase para que nuestro código se ejecute al final de este video. 

Primero, antes de comenzar, quiero crear un nuevo **Package**. Así que seleccionaré **src** allí haciendo clic en ella y seleccionaré **Alt-Shift-N** y un **New Package**. 

<img width="415" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ddeaa002-d155-4a38-ae1c-8bb060de568d">

Y lo llamaremos **`com.infiniteskills.gui`**. Seguiremos adelante y presionamos **Finish**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8c4681ae-1bd0-49e5-a59c-dcc71b46627f">

<img width="229" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a3757e50-2647-4242-b3eb-b0bfbeb807be">

Y ahora debemos tener en cuenta que hay varias formas de agregar clases. Por supuesto, la forma más sencilla sería hacer **clic** en el paquete que estamos buscando, presionar **Alt-Shift-N** y luego seleccionar clase. 

<img width="477" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2f760370-8107-4255-949c-a6304b21203e">

Ahora esto abrirá el cuadro de diálogo para agregar una nueva clase. Puede ver que el paquete ya está preseleccionado porque hice clic en él de antemano. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/bc6e304c-fc71-4534-a5b8-22f08fd7226f">

Si no desea colocarlo en un paquete específico, puede seleccionar **src**. 

<img width="305" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/de5f4a7c-5c4d-4405-b3b8-889a0d22b7cb">

Y nuevamente, otra forma de agregar una clase para decir **File, New, Class**. 

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e5c522b5-e42a-445c-99bf-fc51eab60e41">

Y aquí puede ver que abre nuevamente el cuadro de diálogo de creación de clases y tenga en cuenta que está en el paquete **default** si no nombramos nada. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/14087510-a7e5-473a-9cc2-cbf6caf4da64">

Entonces definitivamente queremos nuestra clase dentro de nuestros paquetes para los propósitos de nuestro código. Entonces, una vez más, haré clic derecho aquí en ese paquete y seleccionaré **New, Class**. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ddf08103-1c07-4618-9226-8b1f0f6f5698">

Estas son las tres formas diferentes que puede ver para abrir el cuadro de diálogo de nueva clase: **Alt-Shift-N**, **Shift-clic derecho** en el paquete seleccionado o seleccione **File, New, Class** en el menú. Y por supuesto, también importa dónde hayas seleccionado previamente ese **File, New, Class**. 

Ahora el nombre de nuestra clase será **`PasswordManager`**. Y esa clase va a ser **public**. No es un **package**. No será **abstract** ni **final**. Heredará de la superclase **`Object`**. No se implementa ninguna interfaz. No vamos a insertar ningún código. Y podemos generar nuestros comentarios Java **Generate comments**, si así lo deseamos, así que sigamos adelante, hagamos eso y seleccionemos Finalizar. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/27266bc2-6ec6-40bd-b35a-942c5c3cb6b3">

Y lo que veremos aquí es que cuando se completa este cuadro de diálogo de creación, obtenemos una clase Java. Y ese código se insertará en **`PasswordManager`**. Y puede ver que ya está en el paquete correcto y que el autor y la información se completan desde **`java.comments`**.

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5bdb9f4d-1dd2-4f86-84a5-453f32e66518">

Sigamos adelante y vayamos a nuestro **PasswordManagerCode.txt** y simplemente seleccionemos todo eso y péguelo.

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3985767b-fd7d-4c51-90ea-2106607a7904">

Ahora eso nos da la información que estamos buscando para crear nuestra GUI para nuestro **`PasswordManager`**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c3fdd052-4871-4f6f-a438-51254966a0b4">

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/89b39eb4-9384-47c7-a736-d837cf7c4ab2">

Ahora, por supuesto, no tenemos ese código implementado. Entonces necesitamos un programa. Nuevamente, seleccionaré el paquete que estoy buscando, o podría comenzar en la **src** y buscarlo manualmente. Vamos a hacer eso. Entonces digamos que estoy en la **src** aquí y presionaré **Alt-Shift-N**. Y diré que quiero una **New Class**,

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6e65b91b-bbd7-4e0d-b247-b1710e5ac846">

y luego dirá que está en la configuración **default**. Pero no lo quiero por defecto. De hecho, quiero que esto esté en el paquete **program**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f39ba96b-fe48-492c-bde4-225ac229d140">

Así que voy a seleccionarlo presionando **Browse**.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c05a159c-798f-4581-b468-1eb0def23e61">

Nuevamente, podríamos agregar **Enclosing types**, si quisiéramos. Podemos convertirlo en un Modifiers **package**, **abstract** o **final**, agregarlo en cualquier interfaz, insertarlo en un archivo Main vacío. Entonces podemos hacer eso ya que este será nuestro **program file**. Y el nombre de este será simplemente **program**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/d3a16cae-308b-491f-bdbd-eb5a20563353">

Y entonces puedes ver que eso nos introduce el método **Main** vacío sin que tengamos que escribir nada en absoluto. Y ya tenemos nuestra clase **Program**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5b904f18-0260-417b-b596-e60d804d2e73">

Y hay una clase más que vamos a crear, 

<img width="1507" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ed45f019-d566-45f2-923d-a222018e3ea9">

que será un **`Encriptor`** (cifrador). Así que introduzcamos la siguiente información y presionemos **Finish**. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/1faf08f1-4dd0-487b-9df6-0183df2dae54">

Y ya tenemos la clase **`Encriptor`**. Ahora el **`Encriptor`** no tendrá nada en este momento. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/cb7bf99c-bee3-4688-a646-15e5093832d9">

Nuestro código de **program** debe corregirse para tener el código de programa real. Y puedes notar que nombré esto con una **`p`** minúscula en wl archivo **ProgramCode.txt** que copiaremos en la clase **Program.java**. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b8b45635-da90-45d2-86e4-a3340f72f165">

Entonces necesito arreglar eso en el nombre de la clase, lo que nos dará la oportunidad de verlo. Y como pueden ver aquí, mi código ya me está ladrando y diciéndome que **Program** no tiene el nombre correcto. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6684d7ae-04d3-4613-8862-e201332f3771">

Así que aquí puedo hacer clic con el botón derecho y seleccionar **Refactor** y **Rename**, 

<img width="1506" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7201a002-01f4-4aa6-85a6-d9cf44041700">

el nombre actual de la clase es **Program**.

<img width="931" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/646764a1-a00a-44b7-b540-b97bcf79a991">

lo cambiaremos por **program**.

<img width="944" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a1155bf8-cb13-4ec1-bae3-70bc715f9311">

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fff46f9d-5748-43ad-8d2e-4554fb5a91e0">

Ahora deberíamos ver que el **`PasswordManager`** se ha compilado completamente, como se requiere. El error ha desaparecido de las referencias al archivo de **program**. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/4ca304e0-4cd6-484e-9f05-1dd5f38a4131">

Esto completa nuestra visión de la creación de clases y la adición de clases a nuestros proyectos en el IDE de Java Eclipse.

## Running The Program 1m 37s

En esta lección, exploraremos cómo podemos ejecutar nuestros programas mientras continuamos trabajando con nuestro código. 

Hay dos formas en que podemos ejecutar nuestro código. El primero sería encontrar el archivo que contiene el método **Main**. Una vez que estemos allí, haga clic derecho en ese archivo y seleccione **Run As, Java Application**, en este caso. 

<img width="1507" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7fc77b08-c570-4741-ba66-52e94c039780">

Ahora llevará algún tiempo ejecutarlo la primera vez. Pero puedes ver que nuestro menú apareció, tenemos todo allí, podemos continuar y seleccionar si queremos salir o no. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/85e1d382-fa4f-41b5-985d-5a0c2792e231">

<img width="803" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ad27dfe3-ea4d-4799-866b-eac104d1fa2c">

Sigamos adelante y salgamos. 

<img width="1509" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6441aa1f-633e-46d9-841e-ec69f01eb5be">

Y la otra forma de ejecutar el programa sería simplemente subir a la parte superior y encontrar este botón de reproducción. Y pueden ver que mientras lo resalto, selecciona y dice, como información sobre herramientas, **Run program**. 

<img width="1503" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/d715eb80-d89c-4b8c-904d-dde179c56e45">

Puede observar que hay un menú desplegable y podemos cambiar la configuración de cómo se ejecuta si, por alguna razón, se va a ejecutar en un servidor en lugar de solo como una aplicación. Por supuesto, esto es sólo una aplicación, por lo que podemos seleccionar  **Run As, Java Application**, o simplemente podemos seleccionar el botón **Run program**.

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/35c3ae70-61cc-4f31-9262-4bc05c053e48">

Ahora que está construido, por supuesto, esta vez funciona un poco más rápido. Pero esencialmente esas son dos formas muy fáciles y rápidas de ejecutar el programa. 

Ahora también dice que puedes ejecutar como usando **Alt Shift X y luego R** para servidor o **J para aplicación**. Si estoy en el archivo aquí y presiono **Alt Shift X y luego J**, puedes ver que se ejecutará. 

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/12688d6c-e213-46a7-af60-ffec2694703a">

Y habrás notado que cuando presiono **Alt Shift X**, también aparece un menú aquí. 

<img width="1511" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/da5fdf7f-1b41-4c01-9a55-44722032e7e0">

Entonces, si quiero ejecutar esto como una aplicación Java, puedo presionar **J** o seleccionar eso. Haga doble clic en él y se ejecutará. 

<img width="1505" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f3c5f969-7fed-49f5-8397-0a58f558b932">

Y esto concluye nuestro análisis de las diferentes formas de ejecutar nuestro programa.

## Project Folder Structure 1m 40s

En esta lección, repasaremos la estructura de carpetas del proyecto tal como existe en nuestro disco y en la computadora. 

<img width="1510" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/d4517e18-071b-49ab-bb5a-e2638f1f6800">

Puede haber casos en los que debamos ser conscientes de esto. Por ejemplo, si estuviéramos entregando código en un entorno académico, o si íbamos a copiar algunos de los archivos y usarlos en un proyecto diferente en algún momento. 

Sólo quiero echar un vistazo rápido a eso fuera del IDE de Eclipse. Pero notarás que el IDE de Eclipse configura nuestra carpeta fuente y tiene diferentes paquetes con los archivos debajo de ellos. 

Ahora, cuando vayamos a la ubicación de nuestra unidad física, notaremos que tenemos el nombre de nuestro proyecto. Y dentro de allí tenemos una carpeta **.settings** de configuración que nos permitirá ver algunas preferencias tal como están configuradas para ese proyecto. 

<img width="867" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b0071c56-760e-4a12-86d3-aeac5986b3ea">

<img width="874" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/411c7342-f9e1-4bfb-9011-7b3af2b543c0">

Nuestra carpeta binaria o carpeta **bin** contiene las clases compiladas después de haber ejecutado el código. Verás que estos son archivos **`.class`**. Esos son los ejecutables reales. 

<img width="878" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/6a1223a4-8300-4fe5-97f7-724e1e7feb27">

Y dentro de nuestras carpetas aquí tenemos nuestra carpeta **src**. Ahora solo quiero señalar también que, si seleccionó no incluir la estructura de carpetas para los archivos fuente específicos, es posible que no vea un contenedor ni una **src**. Puede ver todos sus archivos directamente aquí. Debido a que seleccioné usar esas carpetas específicas, verás que de hecho se agregan nuestros archivos de código en sus propias carpetas específicas, lo cual es muy bueno, especialmente si solo necesitamos administrar dónde están nuestros archivos fuente o dónde está nuestra clase. Verás que cada paquete crea su propia carpeta. Aquí tenemos el **gui, program y utilities**.

<img width="873" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e6d9e585-5848-48d4-9e2f-9586c424a82b">

Y, por supuesto, el archivo fuente directo estará en la carpeta del paquete correspondiente. 

<img width="871" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/4331729f-5862-4115-ae34-8dc407316d27">

A medida que continuamos agregando más clases a nuestros paquetes y más clases a nuestro proyecto, verá que esta estructura de directorios de carpetas continúa expandiéndose como se esperaba. 

Y esto concluye nuestro vistazo rápido a la estructura de directorios físicos real de cómo se almacenan nuestros proyectos a medida que los usamos y los construimos en nuestro IDE de Eclipse.

## 💻 Proyecto InfiniteSkillsPasswordManager

### Crear el Proyecto InfiniteSkillsPasswordManager

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f82f25ff-525a-46db-a0b2-ca2f865da1ee">

Presionamos **Next**

Y tenemos las siguientes pestañas.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/671b8130-1de0-4b0d-a069-3d56bde974cf">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/777b5859-2f1d-424c-b035-734852e25d4c">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3f3adf55-d638-43dd-aa7a-bd8230295327">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0bc1f2e2-5150-4394-be7d-fd56248ad7b2">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a6c31480-359e-4d03-a99a-df09ec6ba342">

Presionamos **Finish**

y ya tenemos nuestro proyecto.

<img width="380" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/73cadaaa-1e43-4ee3-843f-28f5a4e460c4">

### Creación de Packages

**com.infiteSkills.program**

<img width="732" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7e736921-fec9-43c2-9c6d-858f1e5e9289">

**com.infiteSkills.utilities**

<img width="730" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/89968fb3-6284-4c9f-b7eb-b1bbbcd51e95">

**com.infiniteskills.gui**

<img width="731" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/b9b87cd6-a70e-4967-89d2-a4692e4f2b35">

Aquí podemos ver los paquetes creados.

<img width="379" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5a3a66dd-2b4c-489f-a400-0670de1d4949">

### Creación de Classes

**PasswordManager** en el paquete **gui**.

<img width="730" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/415553f3-5ad8-4742-960f-85ea6b8f1efe">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/d597bff0-bd78-4914-adb1-3df7330588ad">

**Program** en el paquete **program**.

<img width="731" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/16ce7fec-6da2-4f9e-a3bf-3b4ea98257e7">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e205ca5a-a5a6-43a4-8f52-97757f89e414">

**Encriptor** en el paquete **utilities**.

<img width="728" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e22bf43b-350f-4a5b-92bc-006b5a7f54f2">

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/262ae8d6-db36-436e-9615-13317cb9df60">


### Incorporar Código

Incorparemos el código en nuestras clases de acuerdo a los archivos de recursos.

**Program**

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/cef1bd52-ebb4-41e9-9dc0-9f1ab5a9bd1b">

En esta clase tenemos varios errores para empezar el **package** lo escribí con una **`S`** mayúscula lo voy a refactorizar.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/fa05f2d9-b6a5-4661-a3cd-5c016090a262">

Otro error es que la clase la escribi como **`Program`** pero el código la maneja como **`program`** por lo que también lo voy a refactorizar.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8cb3f1cb-e0e4-4a9f-b089-11677fe11f53">

Hemos solucionado algunos fallos pero seguimos con otros.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/72a938e6-d8da-466d-bb07-ef14c9db0dc5">

Voy a cambiar la versión de Java de 17 a 1.7.

**Nota:** Los módulos no se usan en 1.7 por lo que eliminamos el código insertado asociado al módulo.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/13d3f485-effa-441d-8cb8-301bb80ba034">

Con esto desaparecen todos los errores en **program**.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/38207f61-7496-4af6-af0f-3313f57062c8">

**PasswordManager**

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/59560606-e420-46c6-a669-8fcda640c381">

También han desapacecido los errores en **PasswordManager** al cambiar la versión de Java.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/391f976e-54f8-491a-9e8c-f28b36031337">


**Encriptor**

Ahora el **Encriptor** no tendrá nada en este momento.

<img width="1512" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/f1f62a30-89bd-4c5e-80da-8d999e08a1d6">


### Ejecutar la APP

<img width="688" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/ee48a0bb-040d-47d1-9f70-d77a28fcae94">

<img width="681" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/498a3f70-7060-4b85-9409-9aef8452780c">

<img width="675" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/88fedf58-ddbe-44cf-bc61-91c4c504f6dc">

### Código

**Program**

```java
package com.infiniteskills.program;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;

import com.infiniteskills.gui.*;

/**
 * Program to run the password manager application.
 * @author adulfodelarosa
 *
 */
public class program {

	public static final int WIDTH = 650;
	public static final int HEIGHT = 500;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					PasswordManager pm = new PasswordManager();
					pm.setLocation(150,25);
					pm.setSize(WIDTH +20,HEIGHT+60);
					pm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
					
					JPanel panel = new JPanel();
					panel.setBounds(0, 0, 600, 600);
					pm.getContentPane().add(panel);
					pm.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

}
```

**PasswordManager**

```java
package com.infiniteskills.gui;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import com.infiniteskills.program.*;

public class PasswordManager extends JFrame {
	private static final long serialVersionUID = 1L;
	JPanel contentPane = null;
	JDesktopPane desktopPane = null;

	/**
	 * Create the frame.
	 */
	public PasswordManager() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		
		desktopPane = new JDesktopPane();
		desktopPane.setBounds(0, 0, program.WIDTH, program.HEIGHT);
		getContentPane().add(desktopPane);
		
		JMenuBar mb = new JMenuBar();
		setJMenuBar(mb);
		
		JMenu mnFile = new JMenu("File");
		mb.add(mnFile);
		
		JMenuItem mntmExit = new JMenuItem("Exit");
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				//exit
				int close = JOptionPane.showConfirmDialog(null
									, "Are you sure you want to exit?"
									, "End Application?"
									, JOptionPane.YES_NO_OPTION
									, JOptionPane.INFORMATION_MESSAGE);
				if (close == 1) return;
				System.exit(0);
			}
		});
		mnFile.add(mntmExit);
		
		JMenu mnPasswords = new JMenu("Passwords");
		mb.add(mnPasswords);
		
		JMenuItem mntmPwdItems = new JMenuItem("Get");
		mntmPwdItems.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {

				//do something
			}
		});
		mnPasswords.add(mntmPwdItems);
	}
}
```

**Encriptor**

```java
/**
 * 
 */
package com.infiniteskills.utilities;

/**
 * @author adulfodelarosa
 *
 */
public class Encriptor {

}
```

