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

**Sangita**: ¿Creo un qué ahora?

**Marge**: Un repositorio de Git es una carpeta administrada por Git. Déjame dar un paso atrás. Necesitará almacenar todos los archivos para este proyecto en algún lugar de su computadora, ¿verdad?

**Sangita**: Prefiero mantener todos los archivos relevantes relacionados con mi proyecto, incluida la fuente, la compilación y la documentación, en una carpeta. De esa manera, son fáciles de encontrar.

**Marge**: genial! Una vez que crea esa carpeta, usa Git para inicializar un repositorio dentro de la carpeta. Es así de simple.

**Sangita**: ¿Y eso qué hace?

**Marge**: Bueno, cada vez que inicia un nuevo proyecto que desea administrar con Git, ejecuta un comando de Git que prepara la carpeta para que pueda comenzar a usar otros comandos de Git dentro de esa carpeta. Piense en ello como girar la llave de su automóvil para arrancar el motor. Es el primer paso para que ya puedas empezar a utilizar tu coche.

**Sanguita**: Hmm. DE ACUERDO...

Marge: Es solo un comando, y ahora su carpeta está "habilitada para Git". Al igual que poner en marcha su motor, ahora puede poner su proyecto en marcha.

Sanguita: ¡Ah! Eso tiene sentido.

Marge: Contáctame si necesitas algo. Estaré aquí si me necesitas.

#### ¿Tienes Git?

![image](https://user-images.githubusercontent.com/23094588/209468620-167d4c2d-979f-499e-81f0-35060f94b49f.png)



## “Un recorrido rápido por la línea de comandos: saber dónde estás con pwd”
## “Más sobre la línea de comandos: creando nuevos directorios con mkdir”
## “(Incluso) Más en la línea de comando: listado de archivos con ls”
## “Más en la línea de comandos (casi ahí): cambiando directorios con cd”
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
