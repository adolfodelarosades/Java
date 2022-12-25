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

<img width="1380" alt="image" src="https://user-images.githubusercontent.com/23094588/209477189-25d97ab6-f2cb-4cbe-b56e-3593a5cdc7bd.png">


## “Más en la línea de comandos (casi ahí): cambiando directorios con `cd”
## "Limpiar"
## “Creando tu primer repositorio”
## “Dentro del comando init”
## “Preséntate a Git”
## "Poniendo Git a trabajar"
## “Trabajando con el repositorio HawtDawg Git”
## “¿Qué significa exactamente cometer?”
## "Mira antes de saltar"
## “Las tres etapas de Git”
## "Git en la línea de comando"
## “Un vistazo detrás de la cortina”
## “Los múltiples estados de archivos en un repositorio Git”
## “El índice es un “bloc de notas””
## “¡Computadora, informe de estado!”
## “¡Has hecho historia!”
