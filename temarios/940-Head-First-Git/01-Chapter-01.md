# 1. Capítulo 1. Empezando con Git: *Ponerse en marcha con Git*

![image](https://user-images.githubusercontent.com/23094588/209468176-b93f5955-4101-46d8-a47a-9bf6e30f21c1.png)

**Necesitas control de versiones**. Todo proyecto de software comienza con una idea, implementada en código fuente. Estos archivos son la magia que impulsa nuestras aplicaciones, por lo que debemos tratarlos con cuidado. Queremos asegurarnos de mantenerlos seguros, conservar un historial de cambios y atribuir el crédito (¡o la culpa!) a los autores legítimos. También queremos permitir una colaboración fluida entre varios miembros del equipo.

Y queremos todo esto en una herramienta que se mantiene fuera de nuestro camino, entrando en acción solo en el momento de nuestra elección.

¿Existe tal ***herramienta mágica***? Si estás leyendo esto, es posible que hayas adivinado la respuesta. Su nombre es **Git**! A los desarrolladores y organizaciones de todo el mundo les encanta Git. Entonces, ¿qué es lo que hace que Git sea tan popular?

* “Why we need version control”
* “A quick tour of the command line: knowing where you are with pwd”
* “More on the command line: creating new directories with mkdir”
* “(Even) More on the command line: listing files with ls”
* “More on the command line (almost there): changing directories with cd”
* “Cleaning up”
* “Creating your first repository”
* “Inside the init command”
* “Introduce yourself to Git”
* “Putting Git to work”
* “Working with the HawtDawg Git repository”
* “What exactly does it mean to commit?”
* “Look before you leap”
* “The three stages of Git”
* “Git in the command line”
* “A peek behind the curtain”
* “The multiple states of files in a Git repository”
* “The index is a “scratch pad””
* “Computer, status report!”
* “You’ve made history!”

## “Por qué necesitamos el control de versiones”

![image](https://user-images.githubusercontent.com/23094588/209468196-4efd7170-9dbc-4a03-bf66-d5cab16b66a7.png)

Es posible que haya jugado videojuegos que requieren más de una sesión para completarse. A medida que avanzas en el juego, ganas y pierdes algunas batallas, y puedes adquirir algunas armas o un ejército. De vez en cuando puedes intentar más de una vez para terminar un desafío en particular. Muchos juegos te permiten guardar tu progreso. Así que ahora, digamos que acabas de matar al dragón de fuego, y lo siguiente en la agenda es abrirte camino hacia el enorme tesoro escondido.

Decides, solo para estar seguro, guardar tu progreso y luego continuar la aventura. Esto crea una "instantánea" del juego tal como está ahora. La buena noticia es que ahora, incluso si te encuentras con una muerte prematura cuando te encuentras con los miserables lagartos que escupen ácido, no tendrás que volver al punto de partida. En su lugar, simplemente vuelve a cargar la instantánea que tomó anteriormente y vuelve a intentarlo. ¡Ardientes dragones fuera!

El control de versiones le permite hacer lo mismo con su trabajo: le brinda una forma de guardar su progreso. Puede hacer un poco de trabajo, guardar su progreso y continuar trabajando. Esta "instantánea" es una forma de registrar un conjunto de cambios, por lo que incluso si ha realizado cambios en un montón de archivos en su proyecto, todo está en una instantánea.

Lo que significa que si comete un error o quizás no está satisfecho con la táctica actual, puede volver a su instantánea anterior. Por otro lado, si está contento, simplemente crea otra instantánea y sigue avanzando.

Y hay más. Un sistema de control de versiones como Git le permite colaborar con confianza con sus compañeros desarrolladores sobre el mismo conjunto de archivos, sin pisar los dedos de los demás. Entraremos en detalles sobre esto en capítulos posteriores, pero por ahora debería ser suficiente saber esto.

¡Puede pensar en Git como su banco de memoria, red de seguridad y plataforma de colaboración, todo integrado en uno!

Comprender el control de versiones, y Git en particular, comprender de lo que es capaz y el efecto que tiene en la forma en que trabajamos, puede ayudarnos a ser *realmente* productivos.

![image](https://user-images.githubusercontent.com/23094588/209468271-e70d32ee-e62b-4459-b944-4ef774c56abf.png)

***¡Felicidades!***

Su empresa acaba de obtener el contrato para crear **HawtDawg**, la primera aplicación de citas para el mejor amigo peludo de los humanos. Sin embargo, es un mundo de perro-come-perro(dog-eat-dog) por ahí, y con la competencia husmeando, ¡no tenemos mucho tiempo que perder!

![image](https://user-images.githubusercontent.com/23094588/209468409-cb0d49ab-c5e3-46e4-ae54-3931845d1189.png)

Felicitaciones por haber sido seleccionado para crear una aplicación móvil única en su tipo, cuyo nombre en código es HawtDawg.

Esta aplicación le permitirá a tu mejor amigo peludo expandir su red social, encontrar amigos, ¡tal vez incluso un compañero de por vida! Aprovechando lo último en aprendizaje automático y una interfaz intuitiva diseñada específicamente teniendo en cuenta las necesidades de su perro, nuestro objetivo es ser el líder de la industria en poco tiempo.

Creemos que hemos cronometrado esto en el momento adecuado, pero también somos muy conscientes de la competencia. Además, esta es la primera vez que se intenta algo así. Esto requiere que nos movamos rápidamente, pero también que estemos preparados para probar ideas. Anticipamos que trabajaremos en estrecha colaboración con usted y sus desarrolladores a medida que avanzamos hacia nuestro primer lanzamiento.

Esperamos ver su diseño inicial y su aplicación alfa muy pronto.

Atentamente,

![image](https://user-images.githubusercontent.com/23094588/209468474-fefd4853-54c3-46bd-907e-a09e30fb80b5.png)

### Conversación de cubículo

![image](https://user-images.githubusercontent.com/23094588/209468514-2da83cc2-e218-48ea-9b68-4d922b0db043.png)

**Marge**: Deberíamos considerar usar un sistema de control de versiones.

**Sangita**: He oído hablar de los sistemas de control de versiones, aunque nunca he tenido la oportunidad de utilizar uno. Pero no tenemos exactamente mucho tiempo aquí.

**Marge**: Comenzar con Git es súper fácil. Simplemente crea un repositorio de Git y estás listo para las carreras.

**Sangita**: ¿Creo uno ahora?

**Marge**: Un repositorio de Git es una carpeta administrada por Git. Déjame dar un paso atrás. Necesitarás almacenar todos los archivos para este proyecto en algún lugar de su computadora, ¿verdad?

**Sangita**: Prefiero mantener todos los archivos relevantes relacionados con mi proyecto, incluido el código fuente, la compilación y la documentación, en una carpeta. De esa manera, son fáciles de encontrar.

**Marge**: Genial! Una vez que crees esa carpeta, usa Git para inicializar un repositorio dentro de la carpeta. Es así de simple.

**Sangita**: ¿Y eso qué hace?

**Marge**: Bueno, cada vez que inicias un nuevo proyecto que deseas administrar con Git, ejecuta un comando de Git que prepara la carpeta para que pueda comenzar a usar otros comandos de Git dentro de esa carpeta. Piensa en ello como girar la llave de su automóvil para arrancar el motor. Es el primer paso para que ya puedas empezar a utilizar tu coche.

**Sanguita**: Hmm. DE ACUERDO...

**Marge**: Es solo un comando, y ahora tu carpeta está "habilitada para Git". Al igual que poner en marcha su motor, ahora puedes poner tu proyecto en marcha.

**Sanguita**: ¡Ah! Eso tiene sentido.

**Marge**: Contáctame si necesitas algo. Estaré aquí si me necesitas.

#### ¿Tienes Git?

![image](https://user-images.githubusercontent.com/23094588/209468620-167d4c2d-979f-499e-81f0-35060f94b49f.png)

**No avanzaremos mucho si aún no ha instalado Git**. Si no te has tomado el tiempo de instalar Git, ahora es el momento. Regrese a la sección titulada "Va a tener que instalar Git" en la introducción para comenzar.

Incluso si tiene Git instalado, será útil ponerse al día con una nueva versión de Git solo para asegurarse de que todo lo que discutimos en este libro funcione como se espera.

### Enciendan sus motores...

![image](https://user-images.githubusercontent.com/23094588/209468817-7ad065bb-b532-46e1-9af2-9c575c2dacd0.png)

Considere cualquier proyecto en el que haya trabajado; por lo general, involucra uno o más archivos; estos pueden ser archivos de código fuente, archivos de documentación, scripts de compilación, lo que sea. Si queremos gestionar estos archivos con Git, ***el primer paso es crear un repositorio Git***.

Entonces, ***¿qué es exactamente un repositorio de Git?*** Recuerde que una de las razones para usar un sistema de control de versiones es que podemos guardar las instantáneas de nuestro trabajo periódicamente. Por supuesto, Git necesita un lugar para almacenar estas instantáneas. Ese lugar estaría en el repositorio de Git.

La siguiente pregunta es: ***¿dónde vive este repositorio?*** Por lo general, tendemos a guardar todos los archivos de un proyecto en una carpeta. Si vamos a usar Git como nuestro sistema de control de versiones para ese proyecto, primero creamos un repositorio *dentro de* esa carpeta para que Git tenga un lugar para almacenar nuestras instantáneas. La creación de un repositorio de Git implica ejecutar el comando **`git init`** dentro de la carpeta superior de su proyecto.

Profundizaremos en los detalles pronto, pero por ahora, todo lo que necesita saber es que, sin crear un repositorio de Git, realmente no puede hacer mucho con Git.

No importa cuán grande sea su proyecto (en otras palabras, no importa cuántos archivos o subdirectorios tenga su proyecto), la carpeta **superior** (o raíz) de ese proyecto debe haberse ejecutado **`git init`** para comenzar con Git.

![image](https://user-images.githubusercontent.com/23094588/209468959-896cef2e-363b-4673-95d9-8e9fa9068ab0.png)


### “Un recorrido rápido por la línea de comandos: saber dónde estás con `pwd`”

Una cosa que va a utilizar mucho mientras trabaja en los ejercicios de este libro es **la línea de comandos**, así que dediquemos un poco de tiempo a familiarizarnos con ella. Comience abriendo una ventana de terminal como hicimos en la introducción y navegue hasta una ubicación en su disco duro. Como recordatorio, en la Mac encontrarás la aplicación **`Terminal.app`** en la carpeta **`Applications > Utilities`**. En Windows, navegue con el botón Inicio y debería ver Git Bash en la opción de menú Git. Será recibido con un mensaje, y esa es su señal de que el terminal está listo para aceptar comandos.

<hr>

**NOTA**

Si esto no te suena familiar, asegúrate de volver a la introducción. Hemos enumerado algunas instrucciones para usted en la sección "Va a tener que instalar Git".

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476460-f34dabd6-4b39-477e-96b4-cbc711304308.png)

Comencemos con algo fácil. Escriba **`pwd`** y presione return; **`pwd`** significa "print working directory" y muestra la ruta del directorio en el que se está ejecutando actualmente el terminal. En otras palabras, si tuviera que crear un nuevo archivo o un nuevo directorio, aparecerían en este directorio.

![image](https://user-images.githubusercontent.com/23094588/209476505-108abc23-4bcb-44e1-9938-1031d54eea36.png)

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

<hr>

**NOTA**

Encontrará las respuestas a los ejercicios de Sharpen Your Pencil al final de cada capítulo.

Usuarios de Windows: cuando decimos terminal, dicen... ¡¡Git Bash!!

<hr>

¡Es hora de ponerse a trabajar! 

<img width="1071" alt="image" src="https://user-images.githubusercontent.com/23094588/209476579-b02bafdc-8923-43fc-add9-60eb49517630.png">

Inicie la terminal y use el comando **`pwd`**. Anote el resultado que ve aquí: **`/Users/adulfodelarosa`**

¡Estupendo! Si es la primera vez que usa el terminal o no está muy familiarizado con él, entonces puede ser un poco desalentador. Pero sepa esto: lo guiaremos en cada paso del camino, no solo para este ejercicio, sino para todos los ejercicios de este libro.


-------> Respuestas en “Sharpen your pencil Solution”.

<hr>

## “Más sobre la línea de comandos: creando nuevos directorios con `mkdir`”

![image](https://user-images.githubusercontent.com/23094588/209476747-53443692-bc55-4e62-906c-e2864ab9428d.png)

Conocer la ubicación del directorio actual en el terminal usando **`pwd`** es muy útil porque casi todo lo que hace es relativo al directorio actual, lo que incluye la creación de nuevas carpetas. Hablando de nuevas carpetas, el comando para crear nuevas carpetas es **`mkdir`**, que significa "make directory".

A diferencia de **`pwd`**, que simplemente te dice la ruta del directorio actual, **`mkdir`** toma un *argumento*, que es el nombre del directorio que deseas crear:

![image](https://user-images.githubusercontent.com/23094588/209476863-39cf0660-e160-4041-a529-990abbf1e37c.png)

A diferencia de **`pwd`**, que simplemente te dice la ruta del directorio actual, **`mkdir`** toma un *argumento*, que es el nombre del directorio que deseas crear:

**`mkdir`, se producirá un error si intenta crear un directorio con un nombre que ya existe.** 

*Si intenta crear un nuevo directorio con el mismo nombre que uno que ya existe en el directorio actual,* **`mkdir`** *simplemente informará* **`File exists`** *y no hará nada. Además, no deje que el "file" en "File exists" lo confunda; en este caso, simplemente significa carpeta*.

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

<hr>

**NOTA**

Asegúrese de verificar su respuesta con nuestra solución al final del capítulo.

En mi caso trabajare dentro de la carpeta **`/Users/adulfodelarosa/Documents/PROYECTOS/VSC/940-Head-First-Git`** así que lo primero será cambiarme a esa carpeta.

<img width="1380" alt="image" src="https://user-images.githubusercontent.com/23094588/209477189-25d97ab6-f2cb-4cbe-b56e-3593a5cdc7bd.png">

<hr>

Tu turno. En la ventana de terminal que tiene abierta, continúe y use **`mkdir`** para crear un nuevo directorio llamado my-**`my-first-commandline-directory`**.

<hr>

**NOTA**

Recuerde, para Windows, terminal es igual a Git Bash.

<hr>

<hr>

**NOTA**

Escribe el comando y el argumento que usaste aquí. 

**`mkdir my-first-commandline-directory`**

<hr>

<img width="1384" alt="image" src="https://user-images.githubusercontent.com/23094588/209477221-7216e5c7-7f4a-433e-b074-3de69f1f0f8b.png">


A continuación, ejecute el mismo comando nuevamente, en el mismo directorio. Anota el error que ves aquí:

<hr>

**NOTA**

El error va aquí.

**`mkdir: my-first-commandline-directory: File exists`**

<hr>

<img width="1388" alt="image" src="https://user-images.githubusercontent.com/23094588/209477256-a79d9f5d-5e08-46e4-9c41-db37d3746b9d.png">

-------> Respuestas en “Sharpen your pencil Solution”.

<hr>

## “(Incluso) Más en la línea de comando: listado de archivos con `ls`”

El resultado de **`mkdir`** no es muy alentador, por decir lo menos. Pero mientras no obtuviera ningún error, hizo su trabajo. Para confirmar si sucedió algo, puede enumerar todos los archivos en el directorio actual. El comando de listado se llama **`ls`** (abreviatura de lista).

![image](https://user-images.githubusercontent.com/23094588/209477427-ccc6d454-d619-418f-8fb3-b79b2a66b777.png)

**`ls`** de forma predeterminada, solo enumera archivos y carpetas normales. De vez en cuando (y vamos a necesitar esto lo suficientemente pronto) querrás ver también los archivos y carpetas ocultos. Para hacer eso, puede proporcionar **`ls`** con una *bandera*. Los ***indicadores***, a diferencia de los ***argumentos***, tienen un *prefijo con un guión* (para diferenciarlos de los argumentos). Para ver "all(todos)" los archivos y carpetas (incluidos los ocultos) podemos usar el indicador "A" (¡Sí! Mayúscula "A"), así:

![image](https://user-images.githubusercontent.com/23094588/209477516-8750587f-18cc-406b-b5b5-fdda84cf3a6c.png)

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Use la terminal para enumerar todos los archivos en el directorio actual. Vea si puede encontrar su archivo **`my-first-commandline-directory`**.

Luego use la bandera **`-A`** y vea si hay carpetas ocultas en el directorio actual.

<img width="1390" alt="image" src="https://user-images.githubusercontent.com/23094588/209477682-d94ea450-1e6b-42b5-a28f-2ea22ad096c0.png">

-------> Respuestas en “Sharpen your pencil Solution”.

## “Más en la línea de comandos (casi ahí): cambiando directorios con `cd`”

![image](https://user-images.githubusercontent.com/23094588/209477713-8e859b40-bd46-4c71-84a1-2fd6efff966f.png)

A continuación, ¡muévete! Creamos un nuevo directorio, pero ¿cómo navegamos hasta él? Para eso, tenemos el comando **`cd`**, que significa "change directory". Una vez que cambiamos de directorio, podemos usar **`pwd`** para asegurarnos de que efectivamente cambiamos de ubicación.

![image](https://user-images.githubusercontent.com/23094588/209477779-f4557491-9446-463a-b559-c173b9af4c6e.png)

**`cd`** navega a un subdirectorio bajo el directorio actual. Para volver al directorio principal, también podemos usar **`cd`**, así:

![image](https://user-images.githubusercontent.com/23094588/209477795-89bea294-f592-4b54-8467-ef7cbfb0ba53.png)

**Mantenga siempre un registro de su directorio de trabajo (usando **`pwd`**)**; la mayoría de las operaciones en la línea de comando son *relativas* a este directorio**.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209477846-6e827ce1-1b85-47d2-917d-8b892a283ab0.png)

Adelante, prueba el cambio de directorios. Use **`cd`** para saltar a su carpeta **`my-first-commandline-director`** recién creada, luego use **`pwd`** para asegurarse de que cambió de directorio y luego use **`cd ..`** para volver a la carpeta principal. Use este espacio como un bloc de notas para practicar los comandos a medida que los usa.

<img width="1394" alt="image" src="https://user-images.githubusercontent.com/23094588/209477968-4289a3ae-6cc5-48f7-99fd-a225f87d9004.png">

-------> Respuestas en “Exercise Solution”.

<hr>

### No hay argumento allí

Las funciones de línea de comandos como **`pwd`** y **`mkdir`** son los "comandos" que estamos invocando. Algunos comandos, como **`mkdir`** y **`cd`**, esperan que les digas qué quieres crear o adónde ir. La forma en que los proporcionamos es mediante el uso de "argumentos".

![image](https://user-images.githubusercontent.com/23094588/209478039-258baf76-d354-4b0e-a052-fd90d4238d62.png)

Quizás se pregunte por qué elegimos usar guiones en lugar de espacios. Resulta que usar espacios en los argumentos puede ser bastante complicado. Verá, la línea de comando usa esto para separar el comando de sus argumentos. Por lo tanto, puede ser muy confuso para la línea de comando si sus argumentos también tienen espacios.

![image](https://user-images.githubusercontent.com/23094588/209478072-2ef2af7a-8ecd-415b-bfbe-74efd2d89c1a.png)

Para la línea de comando, el espacio en blanco actúa como separador. Pero si ponemos espacios en los argumentos, es difícil para la línea de comando discernir si está pasando varios argumentos o un argumento con varias palabras.

Por lo tanto, cada vez que tenga un espacio en blanco en un argumento y desee tratarlo como un solo argumento, debe usar comillas.

![image](https://user-images.githubusercontent.com/23094588/209478109-f43b526f-8a53-4c71-8ce7-e3d486666daf.png)

**Como puede ver, es fácil equivocarse cuando usa espacios en blanco en los argumentos. ¿Nuestro consejo? Intente evitar los espacios en blanco en los nombres de archivo y las rutas.**

<hr>

**NOTA**

Por ejemplo, es mejor tener **`C:\my-projects\`** que **`C:\my projects\`** como ruta.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209478170-7d01d699-6f5a-4699-995f-ad85dafbdd9e.png)

**Gran pregunta**. A la línea de comando realmente no le importa si usa comillas dobles o simples. Lo que hay que recordar es que hay que ser constante. Si comienza el nombre del argumento con comillas simples, termínelo con una comilla simple. Lo mismo para las comillas dobles.

Por lo general, la mayoría de las personas que usan la línea de comando tienden a preferir las comillas dobles y nosotros también; sin embargo, hay una situación en la que se verá obligado a usar comillas dobles, y es si su argumento tiene una comilla simple.

Tenga en cuenta que en este caso estamos usando una comilla simple en la palabra **`sangita’s`**:

![image](https://user-images.githubusercontent.com/23094588/209478216-91ea8721-ea35-477d-8d03-6cdc7ab7cdc1.png)

Lo contrario también es cierto si necesita usar comillas dobles en su argumento, en cuyo caso deberá rodear su argumento con comillas simples.

Sin embargo, a esto aludimos; es mejor si evitamos los espacios en blanco en nuestros argumentos, particularmente en los nombres de directorios y archivos. **Cada vez que necesite un espacio, simplemente use un guión o un guión bajo**. Esto le ayuda a evitar el uso de comillas (de cualquier tipo) al proporcionar argumentos.

<hr>

**¿QUIEN HACE QUE?**

Con la línea de comandos, hay muchos comandos y banderas ondeando. En este juego de quién hace qué, relaciona cada comando con su descripción.

![image](https://user-images.githubusercontent.com/23094588/209478279-4ca0d0cd-3bee-4e96-b12b-e3ab2bc09f7f.png)

**Solución:** **`pwd`**, **`mkdir`**, **`cd ..`**, **`cd`**, **`ls`** y **`ls -A`**

## "Limpiar"

![image](https://user-images.githubusercontent.com/23094588/209478365-496b1869-e280-40a5-91fb-7fd25e784c56.png)

Ahora que ha terminado con esta sección, le sugerimos que limpie las carpetas que creó como **`my-first-commandline-directory`** y cualquier otra. Para esto, simplemente use el Explorador o la ventana del Finder y elimínelos. Si bien la línea de comandos le ofrece formas de hacer esto, la eliminación de archivos mediante la línea de comandos generalmente pasa por alto la papelera. En otras palabras, es difícil de recuperar si elimina accidentalmente la carpeta incorrecta.

En el futuro, cuando se familiarice más con la línea de comandos, tal vez pueda usar el comando apropiado para eliminar archivos, pero por ahora, vayamos a lo seguro.

## “Creando tu primer repositorio”

Dediquemos un poco de tiempo a familiarizarnos con Git. Ya tiene Git instalado, por lo que esto nos dará la oportunidad de asegurarnos de que todo esté configurado y tener una idea de lo que se necesita para crear un repositorio de Git. Para hacer eso, necesitará una ventana de terminal. ¡Eso es!

Comience abriendo una ventana de terminal como hicimos en el ejercicio anterior. Solo para que las cosas sean más fáciles de administrar, le sugerimos que cree una carpeta **`my-headfirst-git-samples`** para albergar **todos** los ejemplos de este libro. Dentro, continúe y cree una nueva carpeta para nuestro primer ejercicio del **Capítulo 1**, llamada **`ch01_01`**.

![image](https://user-images.githubusercontent.com/23094588/209478506-840dabb4-e844-4761-be28-d4a603c0be38.png)

<img width="1396" alt="image" src="https://user-images.githubusercontent.com/23094588/209478551-7cbd119b-10c1-4816-8599-679fb18a06ae.png">

Ahora que estamos en un directorio completamente nuevo, creemos nuestro primer repositorio de Git. Para hacer esto, simplemente ejecutamos **`git init`** dentro de nuestra carpeta recién creada.

![image](https://user-images.githubusercontent.com/23094588/209478588-d67d5696-3c8e-49cd-846d-283cc5043e6f.png)

<img width="1384" alt="image" src="https://user-images.githubusercontent.com/23094588/209478653-f034a4c9-5174-4d4f-a786-5fef3b03c09a.png">

Eso fue bastante indoloro, ¿no? Y ahí lo tienes: tu primer repositorio de Git.

## “Dentro del comando `init`”

![image](https://user-images.githubusercontent.com/23094588/209478704-67a25317-6381-4340-9f56-9fbf6609dfe3.png)

Entonces, ¿qué acabamos de lograr exactamente? Puede que el comando **`git init`** no parezca gran cosa, pero seguro que tiene un gran impacto. Quitemos las tapas para ver lo que realmente hizo.

Para empezar, comenzamos con un directorio nuevo y vacío.

![image](https://user-images.githubusercontent.com/23094588/209478739-57cd9618-1f1f-446d-bc95-b1acd0d13e09.png)

Usando la terminal, navegamos a la ubicación de la carpeta e invocamos las palabras mágicas **`git init`**, donde **`init`** es la abreviatura de inicializar. Git se da cuenta de que le estamos pidiendo que cree un repositorio en esta ubicación y responde creando una carpeta oculta llamada **`.git`** y la rellena con algunos archivos de configuración y una subcarpeta donde almacenará nuestras instantáneas cuando se lo solicitemos.

![image](https://user-images.githubusercontent.com/23094588/209478780-7b92bd16-3d4d-4880-bf28-78bac8982bc2.png)

Una forma de confirmar que esto sucedió es hacer una lista de todos los archivos usando nuestra terminal, así.

![image](https://user-images.githubusercontent.com/23094588/209478799-e8c9c9b0-114f-4f4c-872d-7194776219eb.png)

Esta carpeta oculta representa el repositorio de Git. Su trabajo es almacenar todo lo relacionado con su proyecto, incluidas todas las confirmaciones, el historial del proyecto, los archivos de configuración, lo que tenga. También almacena cualquier configuración y configuración específica de Git que haya habilitado para este proyecto en particular.

<img width="1390" alt="image" src="https://user-images.githubusercontent.com/23094588/209478845-f3ed45b5-5401-4fa5-bd4b-d00770cc7c4d.png">

<img width="758" alt="image" src="https://user-images.githubusercontent.com/23094588/209478865-52b8c5c3-b3e8-457f-b081-1947a11045aa.png">

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: Prefiero usar mi explorador de sistema de archivos cuando navego por mi computadora. ¿Puedo usar eso para ver la `.git` carpeta?**

**R**: ¡Por supuesto! De forma predeterminada, la mayoría de los sistemas operativos no revelan archivos y carpetas ocultos en el explorador. Asegúrese de mirar sus preferencias y asegúrese de que puede ver los archivos y carpetas ocultos.

**P: ¿Qué sucede si alguien elimina accidentalmente este directorio?**

**R**: En primer lugar, no hagamos eso. En segundo lugar, este directorio es la "bóveda" en la que Git almacena toda su información, incluido el historial completo de su proyecto y un montón de otros archivos que Git necesita para el mantenimiento y algunos archivos de configuración que podemos usar para personalizar nuestra experiencia con Git. Esto significa que si elimina esta carpeta, perderá todo el historial del proyecto. Sin embargo, todos los demás archivos en la carpeta de su proyecto no se verán afectados.

**P: ¿Qué sucede si accidentalmente ejecuto `git init` más de una vez en la misma carpeta?**

**R**: Buena pregunta. Esto es completamente seguro. Git simplemente te dirá que está reiniciando el repositorio de Git, pero no perderás ningún dato ni dañarás nada. De hecho, deberías probarlo en **`ch01_01`**. Estamos al principio de nuestro viaje, y la mejor manera de aprender es experimentar. ¿Qué tienes que perder?

<img width="1388" alt="image" src="https://user-images.githubusercontent.com/23094588/209478980-56a71487-b174-4615-ae75-e74e41057abc.png">

**P: Otros sistemas de control de versiones que he usado tienen un componente de servidor. ¿No necesitamos eso aquí?**

**R**: Comenzar con Git es *muy* fácil. **`git init`** crea un repositorio de Git y puede ponerse a trabajar. Eventualmente, necesitará un mecanismo para compartir su trabajo con sus compañeros de equipo, y le prometemos que lo lograremos lo suficientemente pronto. Pero por ahora, ya está todo listo.

<hr>

### Imanes de código

![image](https://user-images.githubusercontent.com/23094588/209478993-4680e2c5-f522-4835-aa96-0361f40221c7.png)

Tenemos todos los pasos enumerados para crear una nueva carpeta, cambiarla e inicializar para crear un nuevo repositorio de Git. Al ser desarrolladores diligentes, a menudo comprobamos que estamos en el directorio correcto. Para ayudar a nuestros colegas, teníamos el código muy bien colocado en nuestra nevera con imanes, pero se cayeron al suelo. Tu trabajo es volver a armarlos. Tenga en cuenta que algunos imanes pueden usarse más de una vez.

![image](https://user-images.githubusercontent.com/23094588/209479028-17d8c810-400f-418f-b230-6739563407b5.png)

**Solución**: 

```sh
pwd
mkdir new-repository
cd new-repository
git init
ls -A
```

## “Preséntate a Git”

Hay un paso más antes de comenzar a trabajar con Git y los repositorios de Git. Git espera que le des algunos detalles sobre ti. De esta forma, cuando creas una "instantánea", Git sabe quién la creó. Y estamos a punto de comenzar a hablar sobre la creación de instantáneas, así que terminemos con esto ahora mismo. Solo tiene que hacer esto una vez, y esto se aplicará a todos y cada uno de los proyectos con los que trabaje en su máquina.

Comenzaremos con nuestro viejo amigo de confianza, la terminal, y seguiremos adelante. **¡Asegúrese de usar su nombre y correo electrónico en lugar de los nuestros!** (Sabemos que nos ama, ¡pero no nos gustaría atribuirnos el mérito de su trabajo!) Comience abriendo una nueva ventana de terminal. No se preocupe por cambiar de directorio; para esta parte de nuestra configuración, no importa dónde lo ejecute.

![image](https://user-images.githubusercontent.com/23094588/209479151-4b7439f6-1c60-4b37-8064-fbd3c00fa317.png)

<img width="1148" alt="image" src="https://user-images.githubusercontent.com/23094588/209479214-814cc9e5-3667-4621-a5a0-06dc445782df.png">

### Cómo usarás Git

Veamos cómo es una interacción típica con Git. ¿Recuerdas que hablamos sobre los videojuegos que te permiten guardar tu progreso? Bueno, pedirle a Git que "guarde su progreso" implica "enviar" su trabajo a Git. Básicamente, esto significa que Git almacena una revisión de su trabajo. Una vez que haga eso, puede continuar trabajando alegremente hasta que sienta que es hora de almacenar otra revisión, y el ciclo continúa. Veamos cómo funciona esto.

![image](https://user-images.githubusercontent.com/23094588/209479285-bf67b980-de8e-4ce1-8eab-a7e7f7becfaf.png)

## "Poniendo Git a trabajar"

Estamos seguros de que tienes muchas ganas de empezar (¡sabemos que lo estamos!). Hasta ahora, hemos inicializado un repositorio de Git, le hemos dicho a Git nuestro nombre y correo electrónico, y tenemos una idea de cómo solemos trabajar con Git. Entonces, ¿qué tal si realmente ponemos Git a trabajar? Comenzaremos poco a poco y simplemente pondremos a Git a prueba: veremos cómo "tomar una instantánea" en Git creando un "commit(confirmación)".

Por el bien de este ejercicio, supongamos que comenzamos a trabajar en un nuevo proyecto. Por lo general, comenzamos con una lista de verificación para que podamos realizar un seguimiento de todo lo que tenemos que hacer. A medida que avanzamos con el proyecto, seguimos marcando cosas (¡tenemos que mantener esa dopamina fluyendo!), y a medida que aprendemos más sobre el proyecto, seguimos agregando cosas. Naturalmente, este archivo tiene una versión controlada con el resto de los archivos del proyecto, para lo cual usaremos Git.

Analicemos lo que vamos a hacer, paso a paso.

**Paso uno**:

Cree una nueva carpeta de proyecto.

<hr>

**NOTA**

Estos dos pasos deberían ser bastante familiares para usted.

<hr>

**Segundo paso**:

Inicialice un repositorio de Git dentro de esa carpeta.

<hr>

**NOTA**

Estos dos pasos deberían ser bastante familiares para usted.

<hr>

**Paso tres**:

Cree nuestra lista de verificación(***checklist***) con algunos elementos para comenzar.

**Paso cuatro**:

Almacene una instantánea(***snapshot***) de nuestra lista de verificación en Git al confirmar(***committing***) el archivo.

<hr>

**NOTA**

Ahora eso es lo que hemos estado esperando!

<hr>

## “Trabajando con el repositorio HawtDawg Git”

![image](https://user-images.githubusercontent.com/23094588/209479465-51df594b-bf40-4b14-8990-30656c7db7ae.png)

<img width="1388" alt="image" src="https://user-images.githubusercontent.com/23094588/209479581-8406fd47-1922-450b-a0ea-4e965a96d05e.png">

### Trabajando con el repositorio HawtDawg Git

A continuación, cree un nuevo documento en su editor de texto favorito y escriba las siguientes líneas de texto. Si siguió las instrucciones en la introducción para instalar Visual Studio Code, al igual que el terminal, lo encontrará **`Visual Studio Code.app`** dentro de la carpeta **`Applications`**. En Windows, simplemente haga clic en el menú Inicio y debería ver Visual Studio Code en la lista de todas las aplicaciones instaladas en su máquina.

<hr>

**NOTA**

Para crear un nuevo archivo, simplemente haga clic en el elemento del menú Archivo en la parte superior y seleccione "Nuevo archivo".

<hr>

![image](https://user-images.githubusercontent.com/23094588/209479646-e24af375-9fde-4a97-93d8-5c67358cf7d6.png)

[Guía Markdown](https://www.markdownguide.org/)

Guarde el archivo como **`Checklist.md`** en el directorio **`HawtDawg`**.

<hr>

**NOTA**

Para guardar el archivo, seleccione Archivo en el menú superior, seleccione Guardar y luego navegue hasta donde creó el directorio **`HawtDawg`**.

<hr>

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/209489850-30159e8d-624f-443a-b49d-87a48224e7d4.png">

Ahora estamos listos para commit nuestro trabajo. Esto involucra dos comandos de Git, a saber **`git add`** y **`git commit`**.

<img width="1111" alt="image" src="https://user-images.githubusercontent.com/23094588/209490116-eb69c5c9-e7b0-4144-b4f7-66c466c0916e.png">

Observe que el comando **`git add`** toma como argumento el nombre del archivo que desea agregar a Git. Y el comando **`git commit`** tiene una bandera **`-m`**, seguida del mensaje de confirmación. La **`-m`** significa "message" y es un mecanismo para que proporcione un recordatorio significativo de por qué realizó este cambio.

<hr>

**NOTA**

También puede usar la versión larga de **`-m`**, así: **`git commit --message`** seguido del mensaje. Sin embargo, nos gusta la versión más corta.

<hr>

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/209490481-524a4091-9dd1-41a8-904a-703740596f4e.png">
 
### Hablando de...

¡Felicitaciones por tu primer compromiso!

<img width="368" alt="image" src="https://user-images.githubusercontent.com/23094588/209490557-69cd7e63-ca78-4f20-b459-baaf142bc511.png">

Has completado un recorrido relámpago por Git. Instaló Git, inicializó un repositorio de Git y envió un archivo a la memoria de Git. Esto nos brinda un excelente punto de partida y deberíamos estar listos para profundizar más en Git.

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Necesito usar archivos Markdown? Pensé que Git era una herramienta de control de versiones de propósito general.**

**R**: ¡Ay, no! Solo usamos archivos Markdown para facilitar las cosas. Los equipos usan Git para versionar todo tipo de archivos diferentes, incluido el código fuente, diarios, listas de tareas pendientes, publicaciones de blog, lo que sea. Verá, Git es excepcionalmente bueno para trabajar con archivos de texto sin formato, como Markdown, HTML, código fuente para lenguajes de programación como Python, a diferencia del texto enriquecido (como lo haría con Microsoft Word o Apple Pages). Solo sé que Git es extremadamente flexible y puede acomodar muchos tipos diferentes de archivos.

<hr>

**¡MÍRALO!**

<img width="275" alt="image" src="https://user-images.githubusercontent.com/23094588/209490747-763128c0-ee25-42c2-ad1f-746edd3fd2df.png">

**¿Obtuviste alguna salida diferente a la que te mostramos en el ejercicio anterior?**

*La línea de comando puede ser bastante implacable cuando se trata de errores tipográficos, espacios en blanco y mayúsculas y minúsculas. Si no obtuvo el mismo resultado que el nuestro, aquí hay algunas cosas que puede probar:*

* *Si ve un error como fatal: **`not a git repository`**, asegúrese de estar en el directorio **`HawtDawg`***.

* *Si recibe un error como este, **`command not found`**, asegúrese de verificar que las mayúsculas y minúsculas y la ortografía sean correctas. Por lo general, la línea de comando le dice qué comando no reconoció*.

* *Si ve un error similar a **`fatal: pathspec checklist.md did not match any files`** cuando probó un **`git add`**, sepa que el nombre de archivo que proporciona debe coincidir exactamente con el nombre de archivo, que en nuestro caso sería **`Checklist.md`** ("c" en mayúsculas)*.

* Si obtiene error: **`pathspec ‘-’ did not match any file(s) known to git`** al intentar **`git commit`**, asegúrese de que no haya espacio entre **`-`** y **`m`**.

* *Si la línea de comando informa un error como error: **`pathspec ‘first’ did not match any file(s) known to git`**, asegúrese de envolver el mensaje de commit "My first commit" entre comillas dobles*.

* Si obtiene un error como **`nothing added to commit but untracked files present`**, intente ejecutarlo **`git add Checklist.md`** nuevamente, esta vez asegurándose de obtener el nombre de archivo correcto, incluida el casing.

## “¿Qué significa exactamente commit?”

<img width="525" alt="image" src="https://user-images.githubusercontent.com/23094588/209491444-952604aa-4aa6-4c8b-9b40-abcd57482d77.png">

Aprendimos que committing con Git es un proceso de dos pasos. Primero **`add`** (añadimos) los archivos y luego **`commit`**.

Lo primero que debe saber es que solo se committed los archivos que agrega. Digamos que tiene dos archivos **`Checklist.md`** y **`README.md`**, pero solo agregó **`Checklist.md`**. Cuando crea un commit, Git solo almacenará los cambios realizados en **`Checklist.md`**.

Ahora, cuando commit (nos comprometemos), Git usa un algoritmo especializado para guardar de manera segura todo lo que agregamos a su memoria. Cuando decimos que "committed(commitimos)" nuestros cambios en Git, eso se traduce en que Git crea un **commit object(objeto de confirmación)** que almacena dentro de la carpeta **`.git`**. Este objeto de confirmación está "sellado(stamped)" por un identificador único. Tal vez recuerdes lo que obtuvimos **`513141d`** cuando hicimos nuestro commit en nuestro último ejercicio (ciertamente viste algo diferente): en realidad, esta es una cadena mucho más larga que contiene números y letras que se parece a esto:

<img width="798" alt="image" src="https://user-images.githubusercontent.com/23094588/209491999-baf17e5e-f3da-446d-98be-cd1ea83ead79.png">

**Este identificador se calcula utilizando una serie de metadatos**, incluido su nombre completo, la hora en que realizó la confirmación, el mensaje de confirmación que proporcionó y la información derivada de los cambios que realizó.

Exploremos un poco más lo que sucede en un commit.

<hr>

<img width="794" alt="image" src="https://user-images.githubusercontent.com/23094588/209492158-f639c8b3-9b0e-474e-8e73-01b9fd3c42f6.png">

Sorprendentemente, las posibilidades de que dos confirmaciones **alguna vez** tengan la mismo **ID** (y sí, eso es en todos los repositorios Git del mundo, los que existen y los que aún no se han creado) es menos de 1 en 10<sup>48</sup>. ¡Sí, eso es 10 seguido de 48 ceros!

<img width="783" alt="image" src="https://user-images.githubusercontent.com/23094588/209492287-8450552a-b56e-46fe-a19e-2b24715ea41e.png">

<hr>

El commit object(objeto de confirmación) en realidad **no** almacena sus cambios, bueno, no directamente, de todos modos. En su lugar, Git almacena sus cambios en una ubicación diferente en el repositorio de Git y simplemente registra (en el commit) dónde se han almacenado sus cambios. Además de registrar dónde almacenó sus cambios, el commit registra muchos otros detalles:

**Un puntero a la ubicación dentro de la carpeta `.git` donde Git ha almacenado sus cambios, llamado `tree`**.

Este es otro conjunto de caracteres alfanuméricos, cuyos detalles son un tema para otro libro.

<img width="814" alt="image" src="https://user-images.githubusercontent.com/23094588/209492561-d8d2dee0-59a5-4d49-a467-2da11ee92635.png">

Este es otro conjunto de caracteres alfanuméricos, cuyos detalles son un tema para otro libro.

**La información del "autor", es decir, su nombre y dirección de correo electrónico**.

En un ejercicio anterior le proporcionamos a Git nuestro nombre completo y nuestro correo electrónico. Esto también se registra en el Git para que pueda reclamar todo el crédito por el maravilloso trabajo que realizó.

<hr>

**NOTA**

Por eso es importante que te presentes a Git.

<hr>

**La hora en que se realizó el commit, representada en segundos transcurridos desde el 1 de enero de 1970**.

Git también registra la hora en que realizó el commit, junto con la zona horaria en la que se encuentra su máquina.

**El commit message que proporcionó cuando invocó `git commit -m`**.

<hr>

**NOTA**

Hay un poco más de lo que enumeramos aquí, pero podemos dejar eso de lado por ahora.

<hr>

**Los Commit objects son almacenados por Git en formato binario, lo que los hace muy difíciles de leer para los humanos, pero súper seguros y eficientes para Git.**

## "Mira antes de saltar"

<img width="651" alt="image" src="https://user-images.githubusercontent.com/23094588/209493024-74b065d4-edce-463b-8306-651382f439ca.png">

Acabas de hacer tu primer commit. Hacer un commit implica dos comandos separados, **`git add`** seguido de **`git commit`**. Probablemente se esté preguntando por qué se necesitan dos comandos para realizar un commit en Git. ¿Por qué Git nos hace pasar por todos estos aros para que podamos almacenar una revisión de nuestro trabajo en Git?

La respuesta está en el diseño del repositorio Git. Recuerde que el repositorio de Git se encuentra en la carpeta **`.git`** que se crea cuando ejecuta **`git init`**.

El repositorio de Git en sí está dividido en dos partes: la primera parte se denomina **"index"** y la segunda parte es a lo que nos referiremos como **"object database"**.

Cuando ejecutamos **`git add <filename>`**, Git hace una copia del archivo y lo coloca en el índice. Podemos pensar en el índice como el **"staging area(área de ensayo)"**, en el que podemos poner las cosas hasta que estemos seguros de que queremos comprometernos(commit) con ellas.

Ahora, cuando ejecutamos el comando **`git commit`**, toma el contenido del staging area(área de preparación) y lo almacena en la base de datos de objetos(object database), también conocida como banco de memoria de Git(**Git’s memory bank**). Dicho de otro modo, el índice es un lugar para albergar temporalmente los cambios. Por lo general, realiza algunos cambios, los agrega al índice y luego decide si está listo para confirmar; en caso afirmativo, realiza un commit. De lo contrario, puede continuar haciendo cambios, agregar más cambios al área de preparación(staging area) y luego, cuando sienta que está en un buen lugar, commit(comprométase).

<img width="837" alt="image" src="https://user-images.githubusercontent.com/23094588/209493738-5c53bd2e-4140-4eab-ae2e-8e5f7101df24.png">

## “Las tres etapas de Git”

1. Empecemos por arriba. Tenemos un directorio de trabajo con un solo archivo.

   <img width="792" alt="image" src="https://user-images.githubusercontent.com/23094588/209493907-9f04efa3-9216-481a-ab38-1bd025d18390.png">

2. Cuando pulsamos **`git add Checklist.md`**, Git almacena una copia de ese archivo en el index.

   <hr>

   **NOTA**
   
   Aférrate a este pensamiento; volveremos a él en las páginas siguientes.
    
   <hr> 
   
   <img width="767" alt="image" src="https://user-images.githubusercontent.com/23094588/209494104-2f591234-6d07-49a3-94d8-1ec60ffdadf2.png">

3. Finalmente, cuando hacemos commit, Git crea un objeto de commit que registra el estado del índice en su memoria.

   <img width="782" alt="image" src="https://user-images.githubusercontent.com/23094588/209494237-7ba083b0-d1d2-4ed6-a534-91ca21362fa8.png">

<img width="424" alt="image" src="https://user-images.githubusercontent.com/23094588/209494288-c20e1d35-d0ef-4fce-9ce8-cd7d7fb863c1.png">

### ¡Gran pregunta!

Mencionamos anteriormente que el índice puede considerarse como un área de preparación. Le brinda una manera de recopilar todo lo que necesita para la próximo commit, porque Git solo crea una instantánea de los cambios que ha agregado al índice.

Considere un escenario en el que está trabajando en una nueva función o corrigiendo un error. Mientras navega por el proyecto, nota un error tipográfico en un archivo de documentación y, siendo el buen compañero de equipo que es, lo corrige. Sin embargo, esta solución no tiene ninguna relación con su tarea original. Entonces, ¿cómo separa la corrección de la documentación de su tarea original?

Simple.

Termina la tarea en la que estaba trabajando y ***solo*** agrega los archivos que se vieron afectados por ese cambio al índice. Y luego commit, dándole un mensaje apropiado. Recuerde, Git solo commit los archivos que se agregaron al índice.

A continuación, **`git add`** el archivo en el que corrigió el error tipográfico y realiza otro commit, esta vez proporcionando un mensaje que describe su corrección.

¡Ves cómo esto te permite hacer un montón de cambios, algunos relacionados y otros no relacionados, y aún así elegir qué cambios componen el próximo commit!

Una analogía que podría ayudar sería la de cocinar. Estás invitando a amigos y estás preparando febrilmente un montón de platos deliciosos. Puede comenzar cortando todo lo que sabe que necesitará. Sin embargo, una vez que comience a poner cosas en la estufa, puede optar por recolectar todo lo que necesita para ese plato en particular para que esté allí cuando lo necesite. Dejas todo lo demás junto a la tabla de cortar. Los chefs se refieren a esto como ***mise en place***.

El índice es tu ***mise en place***.

<img width="1135" alt="image" src="https://user-images.githubusercontent.com/23094588/209494740-0e86ef58-e32f-497b-956b-0a84b37d3d55.png">

## "Git en la línea de comando"

<img width="630" alt="image" src="https://user-images.githubusercontent.com/23094588/209495025-f933fee8-8155-40ec-b839-014e534ff500.png">

Cubrimos algunas de las idiosincrasias de la línea de comandos anteriormente. Esta vez, asegurémonos de entender cómo usamos Git en la línea de comando. Como ha visto, Git usa el comando **`git`**, generalmente seguido de un "subcomando", como **`add`** o **`commit`**, y finalmente seguido de argumentos para el *subcomando*.

<img width="943" alt="image" src="https://user-images.githubusercontent.com/23094588/209495239-b1289765-6259-4664-842c-42f2d13894c7.png">

Como estamos usando la línea de comando, se aplican las mismas reglas que discutimos anteriormente. Cada vez que tenga un espacio en blanco en un argumento y desee tratarlo como *un solo* argumento, debe usar comillas. Considere un escenario muy diferente en el que llamamos a nuestro archivo "This is our Checklist.md". En este caso, tendremos que usar comillas al invocar **`git add`**, así:

<img width="952" alt="image" src="https://user-images.githubusercontent.com/23094588/209495399-15e35181-0a29-4b6f-bc82-3e5e2639b766.png">

Finalmente, **`git commit`** toma una bandera, **`-m`** y un mensaje. **`-m`** es una bandera, y aquí, no debemos poner un espacio entre el guión y **`m`**.

<hr>

**NOTA**

Como muchas banderas,**`-m`** es la abreviatura de **`--message`**. Puede usar cualquiera, pero somos flojos, así que preferimos la versión más corta.

<hr>

<img width="954" alt="image" src="https://user-images.githubusercontent.com/23094588/209495667-963f0a89-c846-4886-bc77-89b10636f630.png">

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Qué pasa si edité varios archivos? ¿Hay alguna manera de agregar varios archivos al índice?**

**R**: Puede proporcionar varios nombres de archivo separados por espacios en blanco al comando **`git add`**, así: **`git add file1 file2`**

**P: ¿Qué sucede si olvido agregar antes de commit?**

**R**: Git confirmará todo lo que ya se ha puesto en el índice. Sin embargo, si no ha agregado nada al índice, Git informará un error **`nothing added to commit but untracked files present (use “git add” to track)`**. Así que ahora sabes que necesitas agregar.

<hr>

## “Un vistazo detrás de la cortina”

Te vamos a contar el pequeño secreto de Git. Cuando agrega (uno o más archivos) al índice de Git, Git no toca ninguno de los archivos en su directorio de trabajo. En su lugar, copia el contenido de esos archivos en el índice. Este es un punto importante porque es crucial para la forma en que Git rastrea el contenido de nuestros archivos.

<hr>

**NOTA**

A esto aludimos en las páginas anteriores.

<hr>

<img width="965" alt="image" src="https://user-images.githubusercontent.com/23094588/209496029-19d41ca8-534f-4a99-8cf7-1fadc5725e19.png">

Entonces, ¿qué sucede cuando nos comprometemos(commit)? Bueno, como sabemos, Git toma el contenido del índice, lo coloca de manera segura en su banco de memoria y representa esa versión con un objeto de confirmación. ¡Esto significa que ahora Git tiene una tercera copia del contenido de sus archivos en su base de datos de objetos!

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/209496138-94e94beb-3454-4dc2-880c-cafbca9d2edc.png">

**Puede haber hasta tres copias de cualquier archivo en su directorio de trabajo.**

## “Los múltiples estados de archivos en un repositorio Git”

Así es como se ve una interacción típica con Git: realiza algunas ediciones en uno o más archivos, luego los agrega al índice y, cuando está listo, los committed. Ahora, mientras realiza este flujo de trabajo, Git intenta rastrear el estado de sus archivos para saber qué archivos son parte de su directorio de trabajo, qué archivos se agregaron al índice y qué archivos ya se committed en su object store.

En todo momento, tenga en cuenta que Git está moviendo *copias* de su archivo desde el directorio de trabajo, al índice, a su object database(base de datos de objetos).

<img width="740" alt="image" src="https://user-images.githubusercontent.com/23094588/209496445-fc1306c2-3b34-4621-a11a-7ec6f9475d42.png">

**Pero hay más. Un archivo puede pasar por todas las etapas, ¡pero podría estar en más de un estado simultáneamente!**

### Un día típico en la vida de un archivo nuevo

Cuando agregamos un nuevo archivo a un repositorio de Git, Git ve el archivo pero también elige **no** hacer nada hasta que se lo indiquemos explícitamente. Un archivo que Git nunca ha visto antes (es decir, un archivo que nunca se ha agregado al índice) se marca como **"untracked(sin seguimiento)"**. Agregar el archivo al índice es nuestra forma de decirle a Git: “¡Oye! Realmente nos gustaría que vigiles este archivo por nosotros”. Cualquier archivo que Git esté vigilando por nosotros se denomina archivo **"tracked(seguido)"**.

<img width="587" alt="image" src="https://user-images.githubusercontent.com/23094588/209570476-c7149af3-65f0-44e3-8c1c-4af599805d0a.png">

### La object database(base de datos de objetos) es la “fuente de la verdad”

Esta vez, considere agregar un archivo al índice y luego realizar un commit de inmediato. Git almacena el contenido del índice en su base de datos de objetos y luego marca el archivo como **"unmodified(sin modificar)".

¿Por qué unmodified(sin modificar), preguntas? Bueno, Git compara la copia que tiene en su base de datos de objetos con la del índice y ve que son iguales. También compara la copia en el índice con la del directorio de trabajo y ve que son iguales. Por lo tanto, el archivo no se ha modificado (o no se ha modificado) desde el último commit.

<img width="708" alt="image" src="https://user-images.githubusercontent.com/23094588/209570785-d1028a85-c8a8-411b-a321-19f8bc14b9e3.png">

Por supuesto, se deduce que si hiciéramos un cambio en un archivo que habíamos commiteado previamente, Git ve una diferencia entre el archivo en el directorio de trabajo y el índice, pero **ninguna diferencia** entre el index y la object database. Entonces, Git marca el archivo como **"modified"**, pero también lo marca como **"not staged(no preparado)"** porque aún no lo hemos agregado al index.

<img width="714" alt="image" src="https://user-images.githubusercontent.com/23094588/209571893-7413fc02-a081-4543-a43a-9d20e3f3589c.png">

Luego, si tuviéramos que agregar el archivo *modificado* nuevamente al índice, Git ve que el índice y el directorio de trabajo son los mismos, por lo que el archivo se marca como **"staged(preparado)"** o, en otras palabras, está **modified** y **staged**.

Y completamos el círculo: si hacemos commit, el contenido del índice se confirmará y el archivo se marcará como **"unmodified(sin modificar)"**.

<img width="624" alt="image" src="https://user-images.githubusercontent.com/23094588/209572119-498a7f00-e336-4ffb-976c-12203c9eff63.png">

<img width="801" alt="image" src="https://user-images.githubusercontent.com/23094588/209572169-64218fd4-068c-4e65-8c43-e893fb1dc79f.png">

**Recuerde que cualquier archivo en su directorio de trabajo puede ser untracked o tracked. Además, un archivo tracked puede ser staged, unmodified o modified.

**En este ejercicio, suponga que acaba de crear un nuevo repositorio. ¿Puede identificar el estado de los archivos para cada uno de los siguientes pasos?

----------> Respuestas en “BE Git Solution”.

**Creas un nuevo archivo en el repositorio llamado `Hello.txt`**.

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/209572454-a45a7b76-a210-441f-aef3-e0a9fb2f6c68.png">

**Untracked**

**Usted agrega `Hello.txt` al índice (usando `git add`)**.

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/209572454-a45a7b76-a210-441f-aef3-e0a9fb2f6c68.png">

**Tracked** y **Staged**

**Confirma todos los cambios que realizó (usando `git commit`)**.

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/209572454-a45a7b76-a210-441f-aef3-e0a9fb2f6c68.png">

**Tracked** y **Unmodified**

**Editas `Hello.txt` con algún contenido nuevo**.

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/209572454-a45a7b76-a210-441f-aef3-e0a9fb2f6c68.png">

**Tracked** y **Modified**

## “El index es un “bloc de notas””

Repasemos el papel del índice. Sabemos que a medida que editamos archivos en nuestro directorio de trabajo, podemos colocarlos en el índice con **`add`**, lo que marca el archivo como **"staged(preparado)"**.

<img width="702" alt="image" src="https://user-images.githubusercontent.com/23094588/209574445-0f9a8580-6c4a-4353-b488-0fa20185d03e.png">

Por supuesto, podemos continuar editando el archivo incluso después de agregarlo al índice. Ahora, tenemos dos versiones del archivo: una en el directorio de trabajo y otra en el índice.

<img width="707" alt="image" src="https://user-images.githubusercontent.com/23094588/209574533-3a937b7d-1ce8-4efb-bb7e-3fa3868f46ed.png">

Ahora, si agrega el archivo nuevamente, Git ***sobrescribe*** el índice con los últimos cambios reflejados en ese archivo. En otras palabras, el índice es un bloc de notas temporal, uno que puede usar para agregar ediciones hasta que esté seguro de que desea confirmar.

<hr>

**NOTA**

Estos son puntos importantes. Tómese un momento para que captar antes de continuar.

<hr>

Hay otro aspecto sutil del índice: **no hay ningún comando para "vaciar" el índice**. Cada vez que agrega un archivo, Git copia el archivo en el índice y, cuando confirma, Git vuelve a copiar los cambios. Lo que significa que, a medida que continúa agregando archivos al índice, está anulando una copia anterior de un archivo (si ya estaba allí) o está agregando nuevos archivos al índice. ¡Así que el índice sigue creciendo! Ahora, esto no es algo de lo que deba preocuparse, pero una vez que hablemos sobre el comando **`diff`** en el Capítulo 3, es algo que debe tener en cuenta.

<hr>

**NOTA**

Estos son puntos importantes. Tómese un momento para que captar antes de continuar.


<hr>

Para darle una idea de cómo tendemos a trabajar, generalmente agregamos los archivos que deseamos enviar al índice cuando creemos que estamos listos. Luego nos aseguramos de que todo se vea bien, y si es así, hacemos un commit. Por otro lado, si detectamos algo (como un error tipográfico o si nos perdimos un detalle menor), hacemos nuestras ediciones, agregamos esos archivos nuevamente al índice y luego commiteamos los archivos. Lave, enjuague, repita.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Hora de experimentar. Navegue hasta el directorio **`headfirst-git-samples`** y cree un nuevo directorio llamado **`play-with-index`**, y luego entre en este directorio con **`cd`**. Continúe e inicialice un nuevo repositorio usando **`git init`**. Usando su editor de texto, cree un nuevo archivo en el directorio **`play-with-index`** llamado **`multiple-add.txt`**. **Después de cada paso, dibuje cómo se ven el directorio de trabajo y el índice**:

1. El contenido inicial de **`multiple-add.txt`** debe ser **“`This is my first edit`”**. ¡Asegúrese de guardar el archivo!

   <img width="947" alt="image" src="https://user-images.githubusercontent.com/23094588/209575385-0299cc9b-a6a8-4e91-9b74-e16dace48554.png">

2. Vuelva a la terminal y use **`git add multiple-add.txt`** para añadirlo al índice.

<hr>

**NOTA**

Utilice este espacio para sus dibujos.

<hr>

3. De vuelta en el editor, cambie el texto del archivo a **“`This is my second edit`”**. Nuevamente, asegúrese de guardar.

<hr>

**NOTA**

Utilice este espacio para sus dibujos.

<hr>

4. De vuelta en la terminal, agregue el archivo al índice nuevamente.

<hr>

**NOTA**

Si se queda atascado, recuerde que nuestras soluciones se encuentran al final del capítulo.

<hr>

----------> Respuestas en “Sharpen your pencil Solution”.

### 💻

<img width="1383" alt="image" src="https://user-images.githubusercontent.com/23094588/209575810-f8d34938-536e-4fed-85d0-fcfd3905dde4.png">

<img width="1023" alt="image" src="https://user-images.githubusercontent.com/23094588/209575961-e4a8decb-5c49-4df0-be9b-8d48b97130a1.png">

<img width="1028" alt="image" src="https://user-images.githubusercontent.com/23094588/209576005-cf05a674-5403-43ef-8ac7-1409ba40c61f.png">

<img width="1378" alt="image" src="https://user-images.githubusercontent.com/23094588/209576080-c53ede67-3b42-4fc9-b8f4-a0b49d4d73a9.png">

<img width="1029" alt="image" src="https://user-images.githubusercontent.com/23094588/209576103-9c5271f5-f2b9-4742-bd73-fc2915acf14f.png">

<img width="1380" alt="image" src="https://user-images.githubusercontent.com/23094588/209576132-088bb1b5-eb3f-4c05-a2ec-fb95b92532ae.png">

<img width="1382" alt="image" src="https://user-images.githubusercontent.com/23094588/209576199-2f143470-c798-4e63-8a7b-feac417e0271.png">

## “¡Computadora, informe de estado!”

A medida que continúa trabajando con Git, a menudo es útil verificar el estado de los archivos en su directorio de trabajo. Uno de los comandos más útiles en tu arsenal de Git es el comando **`git status`**. Este comando es particularmente útil a medida que su proyecto crece en tamaño, con múltiples archivos.

<hr>

**NOTA**

Recuerde que el directorio de trabajo es el directorio que contiene la carpeta oculta **`.git`**.

<hr>

Entonces, exploremos cómo usar el comando de status: creará otro Git Repository, excepto que esta vez creará varios archivos en su repositorio. Esto le dará la oportunidad de ver qué informes proporciona **`git status`** y obtener una idea intuitiva de cómo funciona Git.

Como lo ha hecho antes, creará una nueva carpeta dentro de la carpeta **`headfirst-git-samples`** llamada **`ch01_03`** e inicializará un repositorio Git dentro de esa carpeta.

<hr>

**NOTA**

Dado que nuestro último ejercicio fue el segundo ejercicio, este es el número 3.

<hr>

<img width="955" alt="image" src="https://user-images.githubusercontent.com/23094588/209576492-d462ac5f-173c-4f3b-a0f0-70f10ed3c023.png">

A pesar de no haber hecho nada, aún puedes consultar el estado de nuestro repositorio. El comando, como otros que hemos usado, es un comando de Git, llamado **`status`**. Usemos eso.

<img width="973" alt="image" src="https://user-images.githubusercontent.com/23094588/209576547-a78aab12-42b2-40ae-9f59-e22c2b229787.png">

Su primer uso de **`git status`** puede parecer un poco decepcionante, pero le da la oportunidad de acostumbrarse a leer su salida. Git te dice amablemente que aún no has hecho confirmaciones y nos da una pista útil sobre lo que debes hacer a continuación.

A continuación, creará el primero de dos archivos. Abra un nuevo documento en su editor de texto y escriba las siguientes líneas de texto.

<hr>

**NOTA**

Hemos proporcionado todos los archivos que necesita en la carpeta **`chapter01`** en el código fuente que descargó para este libro. Asegúrese de revisar allí si no tiene ganas de escribir todo esto.

<hr>

<img width="951" alt="image" src="https://user-images.githubusercontent.com/23094588/209576663-ee8c8e0e-8d9c-499f-bb34-5840b41f2172.png">

Asegúrese de guardar el archivo como **`README.md`** en el directorio **`ch01_03`**.

Haga lo mismo para crear otro archivo llamado **`Checklist.md`** con el siguiente texto.

<img width="991" alt="image" src="https://user-images.githubusercontent.com/23094588/209576769-bee6e62e-962c-49f3-921a-0a0dcc2b4fb2.png">

### ¡Guau, tigre fácil!

<img width="258" alt="image" src="https://user-images.githubusercontent.com/23094588/209576817-3c370e21-ff85-48b8-bb1b-51d4fad124d2.png">

***Lo hemos hecho bastante rápido***. Recapitulemos lo que has hecho hasta ahora. Creaste una nueva carpeta e inicializaste un nuevo repositorio de Git dentro de esa carpeta. A continuación, creó dos nuevos archivos.

Ahora guiaremos a Git a través de sus pasos y, en cada paso, le preguntaremos a Git cuál cree que es el estado de los archivos. ¿Listo?

Ha configurado todo para empezar. Vamos a ver qué **`git status`** tiene que informar.

<img width="789" alt="image" src="https://user-images.githubusercontent.com/23094588/209576928-f04b6e31-320b-471b-a094-b6204bd7de7a.png">

**Que tenemos:**

<img width="784" alt="image" src="https://user-images.githubusercontent.com/23094588/209576971-36aba9fb-1df9-495c-aeff-988c7a87e649.png">

Recuerda que cuando le pides a Git el estado del repositorio, te dice el estado de todos los archivos en tu directorio de trabajo. En este caso, Git ve dos archivos nuevos que nunca antes había visto. Por lo tanto, los marca como **"untracked(sin seguimiento)"**; en otras palabras, Git no se ha introducido en estos archivos, por lo que aún no los está viendo. El índice está vacío ya que no hemos agregado ninguno de los archivos al índice y la base de datos de objetos no tiene commits, bueno, ya que aún no hemos confirmado. ¡Cambiemos eso!

<hr>

<img width="798" alt="image" src="https://user-images.githubusercontent.com/23094588/209577148-bd189c51-f659-46df-82bb-d7dcc10ed3ac.png">

El comando **`git status`** a menudo se conoce como un comando **"safe(seguro)"**, ya que simplemente le pide al repositorio información para mostrar y de ninguna manera afecta al repositorio (como, por ejemplo, crear un commit). Esto significa que puede y debe correr **`git status`** con frecuencia. Recomendamos ejecutarlo antes de ejecutar cualquier otro comando de Git.

<hr>

Comenzaremos presentando Git a uno de nuestros archivos. **Continúe y agregue `README.md` a Git**, y luego verifique el estado nuevamente.

<hr>

**NOTA**

Deje **`Checklist.md`** ser por ahora. Llegaremos a ello en breve.

<hr>

<img width="762" alt="image" src="https://user-images.githubusercontent.com/23094588/209577498-c24331d0-196d-4103-bfcb-ad094f8825b4.png">

Agregar el archivo **`README.md`** al índice de Git significa que ahora Git conoce este archivo. Dos cosas cambiaron: el archivo **`README.md`** ahora está siendo **tracked(rastreado)** por Git y está en el índice, lo que significa que también está **staged(preparado)**.

**Que tenemos**:

<img width="803" alt="image" src="https://user-images.githubusercontent.com/23094588/209577639-ae546208-5f8b-486c-8139-671174f59569.png">

El status de Git nos dice que si realiza un commit en este momento, solo **`README.md`** se confirmará(commit). Lo cual tiene sentido porque solo los cambios que estan en **staged** pueden participar en el próximo commit.

¡Así que commitemos!

<hr>

<img width="817" alt="image" src="https://user-images.githubusercontent.com/23094588/209577805-f5f6731c-9526-4b02-ae8f-1f8ef9a78644.png">

Antes de continuar, ¿puede visualizar qué cambiaría si hiciéramos un commit ahora mismo? Recuerde, hay dos archivos y solo uno está en el índice.

Los commits de Git requieren que pasemos un mensaje. Mantengámoslo simple y usemos **“`my first commit`”**. ¡Vuelve a la terminal, tú!

<img width="774" alt="image" src="https://user-images.githubusercontent.com/23094588/209577937-7be71a2d-009d-4761-b965-55baea92cd0a.png">

**Que tenemos:**

<img width="828" alt="image" src="https://user-images.githubusercontent.com/23094588/209577967-bb033fe4-4047-487a-9494-620480f82bb8.png">

<hr>

<img width="821" alt="image" src="https://user-images.githubusercontent.com/23094588/209578081-fe21f4c9-4da7-4366-8c46-816c913c626c.png">

El repositorio **`ch01_03`** todavía tiene un archivo sin seguimiento, a saber, **`Checklist.md`**. Edítalo para que se vea así.

<img width="806" alt="image" src="https://user-images.githubusercontent.com/23094588/209578151-454b6634-d95d-4a5e-9d17-ef5a38ac581c.png">

Realice cada uno de los pasos a continuación, anotando cada vez la salida de **`git status`**.

1. Agregar **`Checklist.md`** al índice (usando **`git add`**).

   <img width="759" alt="image" src="https://user-images.githubusercontent.com/23094588/209578227-6cbe5983-25be-4b4f-ab3a-e3a30d8b8a52.png">

2. Haz una confirmación con el mensaje de confirmación **“`my second commit`”**

   <img width="744" alt="image" src="https://user-images.githubusercontent.com/23094588/209578306-8dc736e7-5d8d-4d03-9418-9de1f108e14f.png">

**----------> Respuestas en “Test Drive Solution”.**


## “¡Has hecho historia!”

En el último ejercicio, realizó dos confirmaciones separadas a medida que hizo que los archivos **`README.md`** y **`Checklist.md`** pasaran de no ser **untracked(rastreados)** a ser **staged(preparados)** y finalmente **committed(comprometidos)** en la **Git’s object database(base de datos de objetos de Git)**. Al final de todo, su repositorio tiene dos commits.

Sabemos que los commits de Git registran los cambios que realizó y agregó al índice, junto con algunos metadatos, como información sobre el autor(usted), así como el mensaje de commit. Hay un último detalle sobre los commits que debe conocer. Para cada commit que realice (que no sea la primera vez en un repositorio), el commit también registra el **ID** de commit del commit que vino justo antes.

<img width="793" alt="image" src="https://user-images.githubusercontent.com/23094588/209578721-9935c340-094e-430a-a9b0-0ed9f75543bd.png">

Es decir, los commits forman una cadena, como la rama de un árbol o una cadena de luces navideñas. Esto significa que, dada una ID de commit, Git puede rastrear su linaje simplemente siguiendo el puntero "parent". Esto se conoce como **el historial de commits** y es una pieza integral de cómo funciona Git.

<hr>

**NOTA**

En caso de que se esté preguntando si esto es un presagio de lo que está por venir, ¡bueno, sí! ¡Qué astuto de tu parte!

<hr>

<img width="817" alt="image" src="https://user-images.githubusercontent.com/23094588/209578964-66872e8e-2367-442e-b061-37f75b2d3b10.png">

Solo sepa que los **child commits** se refieren a sus parents, pero los padres no se refieren a sus hijos. En otras palabras, **los punteros son unidireccionales**. Sin embargo, no hay nada que impida que un commit tenga varios hijos o un commit tenga varios padres, como veremos en el próximo capítulo.

<hr>

<img width="798" alt="image" src="https://user-images.githubusercontent.com/23094588/209577165-c9aad7e7-d089-44fe-923f-3d67f32f7e84.png">

El historial de confirmación(**commit history**) de Git a menudo se denomina gráfico acíclico dirigido , o DAG (**directed acyclic graph, or DAG**) para abreviar, en el que los commits forman los "nodos" y los punteros al padre forman los "bordes(edges)". Son ***dirigidos*** porque los children señalan a los parent y acíclicos porque los parent no señalan a sus children.

<hr>

**VIÑETAS**

* Un sistema de control de versiones como Git le permite almacenar instantáneas(**snapshots**) de su trabajo.
* Git es mucho más que una herramienta que te permite grabar instantáneas(**snapshots**). Git nos permite colaborar con confianza con otros miembros del equipo.
* El uso efectivo de Git requiere que te sientas cómodo con la línea de comandos.
* La línea de comandos ofrece una gran cantidad de otras capacidades, incluida la creación y navegación de directorios y listados de archivos.
* Git está disponible como ejecutable, que usted instala, y hace que Git esté disponible para usar en la línea de comandos con el nombre **`git`**.
* Una vez que instale Git, debe decirle a Git su nombre completo y su dirección de correo electrónico. Git usará esto cada vez que use Git para tomar una instantánea de su trabajo.
* Si desea que Git administre los archivos de cualquier proyecto, debemos inicializar un repositorio de Git en el nivel raíz del proyecto.
* Para inicializar Git, usa el comando **`init`**, así:**`git init`**
* El resultado de inicializar un nuevo repositorio de Git es que Git creará una carpeta oculta llamada **`.git`** en el directorio donde ejecutó el comando **`git init`**. Git utiliza esta carpeta oculta para almacenar sus instantáneas, así como algunas configuraciones para el mismo Git.
* Cualquier directorio administrado por Git se denomina directorio de trabajo.
* Git, por diseño, tiene un índice que actúa como un **"staging area(área de ensayo)"**. Para agregar archivos al índice, usa el comando **`git add <filename>`**.
* Committing en Git se traduce en tomar una instantánea de los cambios que se almacenaron en el índice. El comando para crear un commit es **`git commit`**, que requiere que le proporciones un mensaje de confirmación para describir los cambios que estás commiteando, usando el indicador **`-m`** o **`--message`**: **`git commit -m “some message”`**
* A cada archivo en el directorio de trabajo se le asigna uno o más estados.
* Un archivo completamente nuevo agregado al directorio de trabajo está marcado como **"untracked(sin seguimiento)"**, lo que sugiere que Git no conoce este archivo.
* Agregar un nuevo archivo al índice de Git hace dos cosas: marca el archivo como **"tracked(seguido)"** y crea una copia de ese archivo en el índice.
* Cuando realiza un commit, Git crea una copia de los archivos en el índice y los almacena en la base de datos de objetos. También crea un **commit object(objeto de confirmación)** que registra metadatos sobre el commit, incluido un puntero a los archivos que se acaban de almacenar, el nombre del autor y el correo electrónico, y la hora en que se realizó el commit, así como el mensaje de commit.
* Cada commit en Git se identifica mediante un identificador único, denominado **ID de commit**.
* En cualquier momento puedes preguntar a Git por el estado de los archivos en el directorio de trabajo y el repositorio de Git, usando el comando **`git status`**.
* Cada commit, excepto el commit inicial en Git, almacena el ID de commit del commit que apareció justo antes, creando así una cadena de commits, como hojas en una rama.
* Esta cadena de commits se denomina **commit history**.

### Inicio de crucigrama

¡Has hecho mucho en un capítulo! Felicitaciones por comenzar con Git. Es hora de relajarse con un crucigrama: encontrará todas las respuestas en algún lugar de este capítulo.

<img width="226" alt="image" src="https://user-images.githubusercontent.com/23094588/209580236-071182ad-e005-4d02-a229-ae0a4bf20c19.png">

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/209580294-d3176216-576e-4cdf-878c-4b1581eb5afc.png">

**Across**

1 What this book is all about

5 Git stores your commit message and other data in a commit _____

7 Command to list files

8 Marge is teaching her how to use Git

10 Where Git stores your files

11 Use a hyphen (or two) when you add it to a command

16 Command that tells Git to start tracking your file (2 words)

17 This is where your changes show up when you add them to Git

18 If Git isn’t watching it, your file is _____

**Down**

2 To get started, initialize a repository with the git _____ command

3 Take a “snapshot” of your work using the git ____ command

4 Git is a ___ control system

6 Every dog’s favorite dating app

9 Some commands need you to supply these

12 You can work with Git from the ____ line

13 Use the git ____ command to find out what’s going on

14 Terminal command to make a directory

15 Use this to find out where you are in the terminal

----------> Answers in “Crossword Init Solution”.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

¡Es hora de ponerse a trabajar! Inicie la terminal y use el comando **`pwd`**. Anote el resultado que ve aquí:

<img width="555" alt="image" src="https://user-images.githubusercontent.com/23094588/209580434-116b0d9a-e716-4ecb-b82a-057de8179679.png">

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Tu turno. En la ventana de terminal que tiene abierta, continúe y use **`mkdir`** para crear un nuevo directorio llamado **`my-first-commandline-directory`**.

<img width="956" alt="image" src="https://user-images.githubusercontent.com/23094588/209580518-e9d42908-ecd5-4fe4-8fd7-db444754dea2.png">

A continuación, ejecute el mismo comando nuevamente, en el mismo directorio. Anota el error que ves aquí:

<img width="959" alt="image" src="https://user-images.githubusercontent.com/23094588/209580561-107cbe1a-8653-40ad-9066-4498394852ca.png">

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Use la terminal para enumerar todos los archivos en el directorio actual. Vea si puede encontrar su archivo **`my-first-commandline-directory`**.

<img width="952" alt="image" src="https://user-images.githubusercontent.com/23094588/209580658-ed20f8c6-6600-42a1-bc13-a8463dc91cb5.png">

Luego use la bandera **`-A`** y vea si hay carpetas ocultas en el directorio actual.

<img width="919" alt="image" src="https://user-images.githubusercontent.com/23094588/209580706-25e108c8-2974-4a14-8646-442a0c4d48d9.png">

<hr>

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/209580760-bfadbbc2-55db-477c-8d47-ce4cd6548187.png">

Adelante, prueba el cambio de directorios. Juegue con **`cd`** para entrat a su carpeta **`my-first-commandline-directory`** recién creada, luego use **`pwd`** para asegurarse de que cambió los directorios y luego use **`cd ..`** para volver a la carpeta principal. Use este espacio como un bloc de notas para practicar los comandos a medida que los usa.

<img width="981" alt="image" src="https://user-images.githubusercontent.com/23094588/209580885-8c40d69d-c4bd-4f5e-85fc-634f8b5d479d.png">

<hr>

**¿QUIÉN HACE QUÉ SOLUCIÓN?**

De "¿Quién hace qué?" .

Con la línea de comandos, hay muchos comandos y banderas ondeando. En este juego de quién hace qué, relaciona cada comando con su descripción.

<img width="952" alt="image" src="https://user-images.githubusercontent.com/23094588/209580939-5510464c-d54b-4750-b4ec-9cf868e50bad.png">

<hr>

### Solución de imanes de código

<img width="223" alt="image" src="https://user-images.githubusercontent.com/23094588/209580965-a999ac4b-6b96-4e42-87ff-6cc758b4ecce.png">

Tenemos todos los pasos enumerados para crear una nueva carpeta, cambiarla e inicializar para crear un nuevo repositorio de Git. Al ser desarrolladores diligentes, a menudo comprobamos que estamos en el directorio correcto. Para ayudar a nuestros colegas, teníamos el código bien colocado en nuestro refrigerador usando imanes de refrigerador, pero se cayeron al suelo. Tu trabajo es volver a armarlos. Tenga en cuenta que algunos imanes pueden usarse más de una vez.

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/209581028-a925fcf0-4c90-4056-ac65-19ae0da31878.png">

<img width="1008" alt="image" src="https://user-images.githubusercontent.com/23094588/209581043-3bb756e8-4dae-440a-9217-cc089b0fc31a.png">

**Recuerde que cualquier archivo en su directorio de trabajo puede ser untracked o tracked. Además, un archivo tracked puede ser staged, unmodified o modified.

**En este ejercicio, suponga que acaba de crear un nuevo repositorio. ¿Puede identificar el estado de los archivos para cada uno de los siguientes pasos?**

**De "SER Git".**

**Creas un nuevo archivo en el repositorio llamado `Hello.txt`.**

<img width="930" alt="image" src="https://user-images.githubusercontent.com/23094588/209581256-79913d4d-cd63-4ece-b08f-e5ba052ec6d2.png">

**Usted agrega `Hello.txt` al índice (usando `git add`).**

<img width="916" alt="image" src="https://user-images.githubusercontent.com/23094588/209581305-2d3319de-6545-48e2-aa7e-62380bdb881a.png">

**Confirma todos los cambios que realizó (usando `git commit`).**

<img width="920" alt="image" src="https://user-images.githubusercontent.com/23094588/209581357-aa047746-1462-4488-831d-a41188931b81.png">

**Editas `Hello.txt` con algún contenido nuevo.**

<img width="931" alt="image" src="https://user-images.githubusercontent.com/23094588/209581426-67a23398-68b4-4a6d-912e-bc43576e450e.png">

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

<hr>

<img width="793" alt="image" src="https://user-images.githubusercontent.com/23094588/209572978-0f22d201-12db-4334-b22f-3c1420c5dcc0.png">

Hora de experimentar. Navegue hasta el directorio **`headfirst-git-samples`**, cree un nuevo directorio llamado **`play-with-index`** y luego con **`cd`** entre en este directorio. Continúe e inicialice un nuevo repositorio usando **`git init`**. Usando su editor de texto, cree un nuevo archivo llamado **`multiple-add.txt`** el el directorio **`play-with-index`**. Después de cada paso, dibuje cómo se ven el directorio de trabajo y el índice:

1. El contenido inicial de **`multiple-add.txt`** debe ser **“`This is my first edit`”**. ¡Asegúrese de guardar el archivo!

   <img width="736" alt="image" src="https://user-images.githubusercontent.com/23094588/209573537-ebab6744-4500-4740-81f9-e2dadc9c68dd.png">

2. Vuelva al terminal y use **`git add multiple-add.txt`** para añadirlo al índice.

   <img width="750" alt="image" src="https://user-images.githubusercontent.com/23094588/209573622-9a445790-25ea-4b3b-98af-14a215155f03.png">

3. De vuelta en el editor, cambie el texto del archivo a **“`This is my second edit`”**. Nuevamente, asegúrese de guardar.

   <img width="752" alt="image" src="https://user-images.githubusercontent.com/23094588/209573683-1bef531f-f00a-4d96-9ebb-efe7d916d5aa.png">

4. De vuelta en la terminal, agregue el archivo al índice nuevamente.

   <img width="778" alt="image" src="https://user-images.githubusercontent.com/23094588/209573731-d78594f0-54d1-4add-91ff-3e6cd687824b.png">

<hr>

<img width="811" alt="image" src="https://user-images.githubusercontent.com/23094588/209573785-d80491a3-f1f2-4215-bf26-21a8cc449d33.png">

El repositorio **`ch01_03`** todavía tiene un archivo sin seguimiento, a saber, **`Checklist.md`**. Edítalo para que se vea así.

<img width="807" alt="image" src="https://user-images.githubusercontent.com/23094588/209573953-d0b1fd30-1b1b-4317-bced-3c27e8dc6e40.png">

Realice cada uno de los pasos a continuación, anotando cada vez la salida de **`git status`**.

1. Agregue **`Checklist.md`** al índice.

   <img width="747" alt="image" src="https://user-images.githubusercontent.com/23094588/209574068-814befa6-9cfa-4d77-80d2-4fcdd718405c.png">

2. Haz una commit con el mensaje de confirmación **“`my second commit`”**.

   <img width="743" alt="image" src="https://user-images.githubusercontent.com/23094588/209574139-73d2c3aa-f135-4a32-8eb1-4b575554df4c.png">

<hr>

<img width="821" alt="image" src="https://user-images.githubusercontent.com/23094588/209578031-b07ee6ba-033e-477e-bee5-68dde4df50a2.png">


### Solución de inicialización de crucigramas

<img width="273" alt="image" src="https://user-images.githubusercontent.com/23094588/209581518-cd9788a9-77e5-4404-8044-ddcdce364fd0.png">

¡Has hecho mucho en un capítulo! Felicitaciones por comenzar con Git. Es hora de relajarse con un crucigrama: encontrará todas las respuestas en algún lugar de este capítulo.

<img width="614" alt="image" src="https://user-images.githubusercontent.com/23094588/209581582-fe229214-3c06-494e-8b7e-6a05f533f2ea.png">













Lapiz

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Exercice
![image](https://user-images.githubusercontent.com/23094588/209477852-56e84a65-5e83-4ce3-a3eb-ebd2e27a797d.png)

Gorra

<img width="798" alt="image" src="https://user-images.githubusercontent.com/23094588/209577165-c9aad7e7-d089-44fe-923f-3d67f32f7e84.png">

![image](https://user-images.githubusercontent.com/23094588/209477852-56e84a65-5e83-4ce3-a3eb-ebd2e27a797d.png)


Cerebro

<img width="817" alt="image" src="https://user-images.githubusercontent.com/23094588/209577818-67e2bb86-50f9-4350-9235-edbccea8b7db.png">

Coche

<img width="821" alt="image" src="https://user-images.githubusercontent.com/23094588/209578042-06521d42-74b1-4222-aead-bf7e716587d7.png">

Tenis

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/209580770-4020a2f7-c1ee-4038-8d2c-bc072faea156.png">



