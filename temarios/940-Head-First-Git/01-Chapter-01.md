# 1. Capítulo 1. Empezando con Git: *Ponerse en marcha con Git*

![image](https://user-images.githubusercontent.com/23094588/209468176-b93f5955-4101-46d8-a47a-9bf6e30f21c1.png)

**Necesitas control de versiones**. Todo proyecto de software comienza con una idea, implementada en código fuente. Estos archivos son la magia que impulsa nuestras aplicaciones, por lo que debemos tratarlos con cuidado. Queremos asegurarnos de mantenerlos seguros, conservar un historial de cambios y atribuir el crédito (¡o la culpa!) a los autores legítimos. También queremos permitir una colaboración fluida entre varios miembros del equipo.

Y queremos todo esto en una herramienta que se mantiene fuera de nuestro camino, entrando en acción solo en el momento de nuestra elección.

¿Existe tal **herramienta mágica**? Si estás leyendo esto, es posible que hayas adivinado la respuesta. Su nombre es **Git**! A los desarrolladores y organizaciones de todo el mundo les encanta Git. Entonces, ¿qué es lo que hace que Git sea tan popular?

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

Y hay más Un sistema de control de versiones como Git le permite colaborar con confianza con sus compañeros desarrolladores sobre el mismo conjunto de archivos, sin pisar los dedos de los demás. Entraremos en detalles sobre esto en capítulos posteriores, pero por ahora debería ser suficiente saber esto.

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

**Marge**: Un repositorio de Git es una carpeta administrada por Git. Déjame dar un paso atrás. Necesitará almacenar todos los archivos para este proyecto en algún lugar de su computadora, ¿verdad?

**Sangita**: Prefiero mantener todos los archivos relevantes relacionados con mi proyecto, incluida el código fuente, la compilación y la documentación, en una carpeta. De esa manera, son fáciles de encontrar.

**Marge**: Genial! Una vez que crees esa carpeta, usa Git para inicializar un repositorio dentro de la carpeta. Es así de simple.

**Sangita**: ¿Y eso qué hace?

**Marge**: Bueno, cada vez que inicia un nuevo proyecto que desea administrar con Git, ejecuta un comando de Git que prepara la carpeta para que pueda comenzar a usar otros comandos de Git dentro de esa carpeta. Piense en ello como girar la llave de su automóvil para arrancar el motor. Es el primer paso para que ya puedas empezar a utilizar tu coche.

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

Considere cualquier proyecto en el que haya trabajado; por lo general, involucra uno o más archivos; estos pueden ser archivos de código fuente, archivos de documentación, scripts de compilación, lo que sea. Si queremos gestionar estos archivos con Git, el primer paso es crear un repositorio Git.

Entonces, ¿qué es exactamente un repositorio de Git? Recuerde que una de las razones para usar un sistema de control de versiones es que podemos guardar las instantáneas de nuestro trabajo periódicamente. Por supuesto, Git necesita un lugar para almacenar estas instantáneas. Ese lugar estaría en el repositorio de Git.

La siguiente pregunta es: ¿dónde vive este repositorio? Por lo general, tendemos a guardar todos los archivos de un proyecto en una carpeta. Si vamos a usar Git como nuestro sistema de control de versiones para ese proyecto, primero creamos un repositorio *dentro de* esa carpeta para que Git tenga un lugar para almacenar nuestras instantáneas. La creación de un repositorio de Git implica ejecutar el comando **`git init`** dentro de la carpeta superior de su proyecto.

Profundizaremos en los detalles pronto, pero por ahora, todo lo que necesita saber es que, sin crear un repositorio de Git, realmente no puede hacer mucho con Git.

No importa cuán grande sea su proyecto (en otras palabras, no importa cuántos archivos o subdirectorios tenga su proyecto), la carpeta **superior** (o raíz) de ese proyecto debe haberse ejecutado **`git init`** para comenzar con Git.

![image](https://user-images.githubusercontent.com/23094588/209468959-896cef2e-363b-4673-95d9-8e9fa9068ab0.png)


### “Un recorrido rápido por la línea de comandos: saber dónde estás con `pwd`”

Una cosa que va a utilizar mucho mientras trabaja en los ejercicios de este libro es la línea de comandos, así que dediquemos un poco de tiempo a familiarizarnos con ella. Comience abriendo una ventana de terminal como hicimos en la introducción y navegue hasta una ubicación en su disco duro. Como recordatorio, en la Mac encontrarás la aplicación **`Terminal.app`** en la carpeta **`Applications > Utilities`**. En Windows, navegue con el botón Inicio y debería ver Git Bash en la opción de menú Git. Será recibido con un mensaje, y esa es su señal de que el terminal está listo para aceptar comandos.

<hr>

**NOTA**

Si esto no te suena familiar, asegúrate de volver a la introducción. Hemos enumerado algunas instrucciones para usted en la sección "Va a tener que instalar Git".

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476460-f34dabd6-4b39-477e-96b4-cbc711304308.png)

Comencemos con algo fácil. Escriba **`pwd`** y presione return; **`pwd`** significa "print working directory" y muestra la ruta del directorio en el que se está ejecutando actualmente el terminal. En otras palabras, si tuviera que crear un nuevo archivo o un nuevo directorio, aparecerían en este directorio.

![image](https://user-images.githubusercontent.com/23094588/209476505-108abc23-4bcb-44e1-9938-1031d54eea36.png)

<img width="1071" alt="image" src="https://user-images.githubusercontent.com/23094588/209476579-b02bafdc-8923-43fc-add9-60eb49517630.png">

<hr>

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

<hr>

**NOTA**

Encontrará las respuestas a los ejercicios de Sharpen Your Pencil al final de cada capítulo.

Usuarios de Windows: cuando decimos terminal, dicen... ¡¡Git Bash!!

<hr>

¡Es hora de ponerse a trabajar! Inicie la terminal y use el comando **`pwd`**. Anote el resultado que ve aquí: **`/Users/adulfodelarosa`**

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
 

## “¿Qué significa exactamente cometer?”
## "Mira antes de saltar"
## “Las tres etapas de Git”
## "Git en la línea de comando"
## “Un vistazo detrás de la cortina”
## “Los múltiples estados de archivos en un repositorio Git”
## “El índice es un “bloc de notas””
## “¡Computadora, informe de estado!”
## “¡Has hecho historia!”

Lapiz

![image](https://user-images.githubusercontent.com/23094588/209476616-33b37f9d-02db-4825-b5c3-344274c9a323.png)

Exercice
![image](https://user-images.githubusercontent.com/23094588/209477852-56e84a65-5e83-4ce3-a3eb-ebd2e27a797d.png)

