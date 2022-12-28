# 940 Head First Git

![image](https://user-images.githubusercontent.com/23094588/207152567-d3559297-7094-414c-bafb-d95db8305ebb.png)

* TIME TO COMPLETE: 12h 43m
* TOPICS: Git
* PUBLISHED BY: O'Reilly Media, Inc.
* PUBLICATION DATE: January 2022
* PRINT LENGTH: 506 pages

### ¿Qué aprenderás de este libro?

Muchas personas que usan Git confían en las "recetas": copiar y pegar comandos que encuentran en Internet sin comprender realmente cómo funciona Git. Pero, ¿qué haces si te encuentras en un aprieto? No puedes simplemente improvisar. Con esta guía práctica única, aprenderá las formas de Git y se divertirá mientras lo hace. Raju Gandhi retira las capas para revelar el motor simple pero poderoso que impulsa a Git, para que entiendas no solo el cómo, sino también el por qué. Dominará las ramas, las fusiones, los mensajes de confirmación, la búsqueda, las utilidades y más; aprender las mejores prácticas para el trabajo colaborativo; y desbloquea todo el potencial de Git.

### ¿Qué tiene de especial este libro?

Si ha leído un libro Head First, sabe qué esperar: un formato visualmente rico diseñado para la forma en que funciona su cerebro. Si no lo has hecho, estás de enhorabuena. Con este libro, aprenderá Git a través de una experiencia multisensorial que involucra su mente en lugar de un enfoque de texto pesado que lo pone a dormir.

### Resources

* [Errata Page](https://www.oreilly.com/catalog/errata.csp?isbn=0636920452058)
* [Supplemental Content](https://i-love-git.com/)

## Table of Contents (the real thing)

### [0. How to use this Book: Intro](https://github.com/adolfodelarosades/Java/blob/master/temarios/940-Head-First-Git/00-Intro.md) 👍

Tu cerebro en Git . Aquí estás tratando de aprender algo, mientras que tu cerebro te está haciendo un favor al asegurarse de que el aprendizaje no se quede estancado. Tu cerebro está pensando: "Mejor deja espacio para cosas más importantes, como qué animales salvajes evitar y si hacer snowboard desnudo es una mala idea". Entonces, ¿cómo engañas a tu cerebro para que piense que tu vida depende de conocer Git?

* “Who is this book for?”
* “We know what you’re thinking”
* “Metacognition: thinking about thinking”
* “Here’s what WE did”
* “Here’s what YOU can do to bend your brain into submission”
* “You’re going to have to install Git (macOS)”
* “You’re going to have to install Git (Windows)”
* “You’re going to need a text editor (macOS)”
* “You’re going to need a text editor (Windows)”
* “You’re (definitely) going to need a GitHub account”
* “A word on organizing your files and projects”
* “The technical review team”
* “Acknowledgments”

### [1. Chapter 1](https://github.com/adolfodelarosades/Java/blob/master/temarios/940-Head-First-Git/01-Chapter-01.md) :+1:

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

### [Chapter 2](https://github.com/adolfodelarosades/Java/blob/master/temarios/940-Head-First-Git/02-Chapter-02.md)

**Puede caminar y mascar chicle al mismo tiempo**. Los veteranos de Git le dirán, mientras se reclinan en sus sillas de jardín (sorbiendo su té verde hecho a mano), que uno de los mayores puntos de venta de Git es la facilidad con la que puede crear ramas. Tal vez le hayan asignado una nueva función y, mientras trabaja en ella, su gerente le pide que corrija un error en producción. O tal vez acaba de dar los últimos toques a su último cambio, pero se le ha ocurrido la inspiración y acaba de pensar en una forma mejor de implementarlo. Las ramas le permiten trabajar en múltiples piezas de trabajo completamente desconectadas en la misma base de código al mismo tiempo, independientemente unas de otras. ¡Veamos cómo!

* “It all started with an email”
* “Updating the restaurant menu”
* “Choices...so many choices!”
* “Switching tracks”
* “Send it back!”
* “Visualizing branches”
* “Branches, commits, and the files contained within”
* “Working in parallel”
* “What is a branch, really?”
* “Switching branches, or switching directories?”
* “Bring it in!”
* “Read the #&$!@ manual (git branch edition)”
* “Some merges are fast-forward”
* “It doesn’t quite work the other way”
* “A little more Git setup”
* “Wait! You moved?”
* “It’s a merge commit”
* “Things don’t always go so smoothly”
* “I am so conflicted!”
* “Cleaning up (merged) branches”
* “Deleting unmerged branches”
* “A typical workflow”

### Chapter 3

**¿Estás listo para investigar un poco, Sherlock?** A medida que continúe trabajando en Git, creará branches, realizará commits y fusionará(merge) su trabajo nuevamente en las ramas de integración. Cada commit representa un paso adelante, y el historial de commits representa cómo llegó allí. De vez en cuando, es posible que desee mirar hacia atrás para ver cómo llegó a donde está, o tal vez si dos ramas se han separado una de la otra. Comenzaremos este capítulo mostrándote cómo Git puede ayudarte a visualizar tu historial de commits.

Ver tu historial de commits es una cosa, pero Git también puede ayudarte a ver cómo cambió tu repositorio. Recuerde que los commits representan cambios y las ramas representan una serie de cambios. ¿Cómo sabe qué ha cambiado, entre commits, entre ramas o incluso entre su directorio de trabajo, el índice y la base de datos de objetos? Ese es el otro tema de este capítulo.

Juntos, podremos hacer un trabajo de detective de Git realmente interesante. ¡Vamos, subamos de nivel esas habilidades de investigación!

* “Brigitte’s on a mission”
* “Commits aren’t enough”
* “Mirror, mirror on the wall: who is the prettiest log of all?”
* “How does git log work?”
* “Making git log do all the work”
* “What diff-erence does it make?”
* “Visualizing file differences”
* “Visualizing file differences: one file at a time”
* “Visualizing file differences: one hunk at a time”
* “Making diffs easier on the eyes”
* “Diffing staged changes”
* “Diffing branches”
* “Diffing commits”
* “What does the diff for a new file look like?”

### Chapter 4

***Todos cometemos errores, ¿verdad?*** Los seres humanos han estado cometiendo errores desde tiempos inmemoriales y, durante mucho tiempo, cometer errores era bastante caro (con las tarjetas perforadas y las máquinas de escribir, teníamos que rehacerlo todo). La razón era simple: no teníamos un sistema de control de versiones. ¡Pero ahora lo hacemos! Git te brinda amplias oportunidades para deshacer tus errores, fácilmente y sin dolor. Ya sea que haya agregado accidentalmente un archivo al índice, haya cometido un error tipográfico en un mensaje de confirmación o haya realizado un commit mal formada, Git le brinda muchas palancas para tirar y botones para presionar para que nadie sepa nunca sobre ese pequeño, ejem, "resbalón".

Después de este capítulo, si te tropiezas, no importará qué tipo de error hayas cometido, sabrás exactamente qué hacer. Entonces, cometamos algunos errores y aprendamos a solucionarlos.

* “Planning an engagement party”
* “An error in judgment”
* “Undoing changes to the working directory”
* “Undoing changes in the index”
* “Deleting files from Git repositories”
* “Committing to delete”
* “Renaming (or moving) files”
* “Editing commit messages”
* “Renaming branches”
* “Making alternative plans”
* “The role of HEAD”
* “Referencing commits using HEAD”
* “Traversing merge commits”
* “Undoing commits”
* “Removing commits with reset”
* “The three types of reset”
* “Another way to undo commits”
* “Reverting commits”
* “Aaaaand that’s a wrap!”

### Chapter 5

**Trabajar solo puede volverse aburrido rápidamente**. Hasta ahora, en este libro, hemos aprendido mucho sobre cómo funciona(merge) Git y cómo trabajar con los repositorios de Git. Los repositorios que usamos son los que inicializamos localmente usando el comando **`git init`**. A pesar de eso, logramos hacer muchas cosas: creamos ramas, las fusionamos(merge) y usamos utilidades de Git como **`git log`** y **`git diff`** Comandos para ver cómo evolucionó nuestro repositorio con el tiempo. Pero la mayoría de los proyectos no son así. A menudo trabajamos en equipos o con amigos o colegas. Git ofrece un modelo de colaboración muy potente, uno en el que todos podemos compartir nuestro trabajo utilizando un único repositorio. Todo comienza haciendo que nuestro repositorio esté "disponible públicamente", lo que hace que el historial de confirmaciones del proyecto sea un historial "compartido". En un repositorio público podemos hacer todo lo que hemos aprendido hasta ahora, tal como lo hemos hecho siempre (con algunas excepciones). Podemos crear ramas y confirmaciones y agregarlas al historial de confirmaciones, al igual que otros; todos pueden ver y agregar a ese historial. Así es como colaboramos con Git.

**Pero antes de comenzar a colaborar**, pasemos un tiempo juntos para comprender cómo funcionan los repositorios públicos y cómo comenzar a usarlos. ¡Vamos equipo!

* “Another way to a Git repository: cloning”
* “Ready, set, clone!”
* “What happens when you clone?”
* “Git is distributed”
* “Pushing changes”
* “Knowing where to push: remotes”
* “Public versus private commits (continued)”
* “Standard operating procedure: branches”
* “Merging branches: option 1 (local merges)”
* “Pushing local branches”
* “Merging branches: option 2 (pull requests)”
* “Creating pull requests”
* “Pull requests or merge requests?”
* “Merging a pull request”
* “What’s next?”

### Chapter 6

**¿Listo para traer al equipo?** Git es una herramienta fantástica para la colaboración, y se nos ocurrió una idea brillante para enseñarte todo sobre ella: ¡te emparejarás con otra persona en este capítulo! Construirá sobre lo que aprendió en el último capítulo. Sabes que trabajar con un sistema distribuido como Git involucra muchas partes móviles. Entonces, ¿qué nos ofrece Git para hacer esto más fácil y qué debe tener en cuenta a medida que colabora con otros? ¿Existen flujos de trabajo que puedan facilitar el trabajo conjunto? Prepárate para averiguarlo.

Listo. Establecer. ¡Clon!

* “Working in parallel”
* “Working in parallel...in Gitland”
* “Collaborating, Git style”
* “The setup for two collaborators on GitHub”
* “Falling behind the remote”
* “Catching up with the remote (git pull)”
* “Introducing the middlemen, aka remote tracking branches”
* “Reason 1 for remote tracking branches: knowing where to push”
* “Pushing to the remote: summary”
* “Fetching remote tracking branches”
* “Reason 2 for remote tracking branches: getting (all) updates from the remote”
* “Collaborating with others”
* “Collaborating with others: summary”
* “Reason 3 for remote tracking branches: knowing you need to push”
* “Reason 4 for remote tracking branches: getting ready to push”
* “git pull is git fetch + git merge!”
* “Use git fetch + git merge. Avoid git pull.”
* “The ideal scenario”
* “A typical workflow: getting started”
* “A typical workflow: getting ready to merge”
* “A typical workflow: merge locally, or issue pull requests?”
* “A typical workflow visualized”
* “Cleaning up remote branches”

### Chapter 7

**La verdad es que su proyecto y su historial de confirmaciones van a crecer con el tiempo**. De vez en cuando, deberá buscar en sus archivos un fragmento de texto en particular. O tal vez quiera ver quién cambió un archivo, cuándo se cambió y la confirmación que lo cambió. Git puede ayudarte con todo eso.

Y luego está tu historial de commits. Cada commit representa un cambio. Git le permite buscar no solo cada instancia de un fragmento de texto en su proyecto, sino también cuándo se agregó (o eliminó). Puede ayudarte a buscar tus mensajes de commit. Para colmo, a veces desea encontrar el commit que introdujo un error o un error tipográfico. Git ofrece una función especial que le permite concentrarse rápidamente en ese commit.

¿Qué estamos esperando? Vamos a buscar algunos repositorios de Git, ¿de acuerdo?

* “Taking things to the next level”
* “A walk through the commit history”
* “Using git blame”
* “git blame using Git repository managers”
* “Searching Git repositories”
* “Searching Git repositories with grep”
* “git grep options”
* “The git grep flags combo”
* “Where git blame falls short”
* “git log’s “pickaxe” capability (-S)”
* “git log -S versus blame”
* “Using the “patch” flag with git log”
* “git log’s other “pickaxe” flag (-G)”
* “Searching commit messages”
* “Checking out commits”
* “Detached HEAD state”
* “The moral of the detached HEAD state”
* “Searching for commits using git bisect”
* “Using git bisect”
* “Finishing git bisect”

### Chapter 8

**Hasta ahora, en este libro, ha aprendido a usar Git**. Pero también puedes doblar a Git a tu voluntad. Ahí es donde la capacidad de configurar Git juega un papel vital. Ya ha visto cómo configurar Git en capítulos anteriores; en este capítulo exploraremos mucho más de lo que puede configurar para hacer su vida más fácil. La configuración también puede ayudarlo a definir accesos directos: ¡se acabaron los comandos Git de largo aliento!

Hay mucho más que puede hacer para facilitar su interacción con Git. Le mostraremos cómo puede decirle a Git que ignore ciertos tipos de archivos para que no los commite accidentalmente. Le daremos nuestras formas recomendadas de escribir mensajes de commit y le diremos cómo nos gusta nombrar nuestras branches. Y para colmo, incluso exploraremos cómo una interfaz gráfica de usuario para Git puede desempeñar un papel importante en su flujo de trabajo. #letsgo #cantwait

* “Configuring Git”
* “The global .gitconfig file”
* “Project-specific Git configuration”
* “Listing your Git configuration”
* “Git aliases, aka your personal Git shortcuts”
* “Tweaking the behavior of Git aliases”
* “Telling Git to ignore certain files and folders”
* “The effects of a .gitignore file”
* “Managing the .gitignore file”
* “A sample .gitignore file”
* “Commit early, commit often”
* “Write meaningful commit messages”
* “The anatomy of a good commit message”
* “The anatomy of a good commit message: headers”
* “The anatomy of a good commit message: bodies”
* “Fussy much?”
* “Create helpful branch names”
* “Integrate a graphical user interface into your workflow”

### Appendix A

Hemos cubierto mucho terreno y ya casi ha terminado con este libro. Te extrañaremos, pero antes de dejarte ir, no nos sentiríamos bien al enviarte al mundo sin un poco más de preparación. Git ofrece una gran cantidad de funciones, y no podríamos incluirlas todas en un solo libro. Guardamos algunas partes realmente jugosas para este apéndice.

* “#1 Tags (remember me forever)”
* “#2 Cherry-pick (copying commits)”
* “#3 Stashes (pseudo-commits)”
* “#4 reflog (reference log)”
* “#5 rebase (another way to merge)”




