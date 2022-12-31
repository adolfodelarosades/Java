# Capítulo 3. Mirando alrededor: *investigando su repositorio Git*

<img width="963" alt="image" src="https://user-images.githubusercontent.com/23094588/210149211-123ea548-77b1-45b2-91df-78c5673d1161.png">

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

## Brigitte tiene una misión

<img width="966" alt="image" src="https://user-images.githubusercontent.com/23094588/210149233-7c4a8257-beae-4393-ad9b-f8c9b1865309.png">

Permítanos presentarle a Brigitte. Brigitte, después de unas vacaciones muy necesarias, busca un nuevo trabajo en el mercado. Necesita un currículum y, sabiendo que probablemente pasará por algunas iteraciones, creó un repositorio para trabajar, comenzó a trabajar en un borrador de su currículum y lo commiteo.

Envió el borrador de su currículum a algunos amigos de su trabajo anterior, quienes sugirieron algunos cambios. Brigitte tomó en serio el consejo de sus amigos y, por cada edición sugerida, hizo una nuevo commit. A continuación se muestra su historial de commits. Hemos anotado cada commit con el ID de commit y el mensaje de commit que usó Brigitte cuando realizó el commit. Tenga en cuenta que tiene tres ramas: **`master`**, **`add-skills`**, y **`edit-per-scotty`**.

<img width="825" alt="image" src="https://user-images.githubusercontent.com/23094588/210152491-99bda3d8-733d-4ab8-973b-f2011374ebf3.png">

Vamos a utilizar el repositorio de Brigitte para demostrar algunas de las ideas de este capítulo, así que siéntete libre de marcar esta página en caso de que necesites refrescar tu memoria.

Mientras Brigitte explora sus futuras opciones de empleo, ¿por qué no usa algunas de las habilidades que ha aprendido hasta ahora para explorar otro repositorio que hemos creado para usted? Mire a la página siguiente.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**----------> Respuestas en “Sharpen your pencil Solution”.**

Nuestros amigos de **'80s Diner** se están preparando para presentar su mejor receta de salsa para el **Cilantro Fest** de este año. Todos los restaurantes locales compiten para ganar, y ciertamente es una gran publicidad. Naturalmente, han creado un repositorio de Git para realizar un seguimiento de las variaciones que prueban.

Bueno, logramos obtener ese repositorio y lo usará para todos sus ejercicios en este capítulo. Encontrará el repositorio en los archivos de origen que descargó para este libro, bajo **`chapter03`**, llamado recipes.

Abra una nueva ventana de terminal y asegúrese de estar en el directorio **`recipes`**. Vea si puede responder las siguientes preguntas. Importante: asegúrese de comparar sus respuestas con las nuestras al final del capítulo antes de continuar.

<hr>

**NOTA**

Si te quedas atascado, siéntete libre de mirar hacia adelante.

<hr>

* ¿Cuál es el estado actual del repositorio? Enumere el comando que va a usar y su salida aquí.

   <img width="618" alt="image" src="https://user-images.githubusercontent.com/23094588/210152712-671a7b5e-43be-4f6c-ad76-0dff4de7032e.png">

* ¿Cuántas ramas hay en este repositorio? Listarlos aquí:

   <img width="618" alt="image" src="https://user-images.githubusercontent.com/23094588/210152723-62f0076b-3375-41b3-ace0-3a63ab8ee035.png">

* ¿En qué rama te encuentras actualmente?

### 💻


<img width="798" alt="image" src="https://user-images.githubusercontent.com/23094588/210152736-49f30739-1519-486c-ae9c-011ea25d431e.png">

<hr>


## Los Commits no son suficientes

<img width="864" alt="image" src="https://user-images.githubusercontent.com/23094588/210152755-95f7e2fa-bb5b-4917-bc76-544209611450.png">

Supongamos que Brigitte quiere inspeccionar su historial de commits, ¿cómo debería hacerlo? Verás, enviar tu trabajo a Git regularmente es una buena idea. Los commits, como probablemente recordará, son simplemente instantáneas de los cambios que agrega al **índice** (o al **staging area(área de preparación)**). Cada commit representa el estado de los cambios tal como estaban cuando realizó la commit.

Esto significa que los commits son instantáneas tomadas en un momento determinado. En consecuencia, un commit en sí mismo no nos da mucha información sobre la historia de un proyecto. La historia del proyecto, su evolución a lo largo del tiempo, se incluye en su historial de commits.

Para que Brigitte visualice su historial de commits, Git nos proporciona un comando, llamado **`log`**, que hace precisamente eso. De forma predeterminada, el comando **`git log`** lista todos los commits en la rama actual, con el último commit en la parte superior, seguida de su parent, y así sucesivamente:

<img width="1020" alt="image" src="https://user-images.githubusercontent.com/23094588/210153009-34284416-b395-4325-957c-790b8913963b.png">

Puede recordar del **Capítulo 1** que un commit almacena un montón de metadatos junto con un indicador de los cambios que ha commiteado. Bueno, el papel del comando **`git log`** es detallar todo eso en una lista simple.

<img width="1243" alt="image" src="https://user-images.githubusercontent.com/23094588/210153059-76e8804b-b9ac-48d1-b360-9f9e5d509769.png">

Te garantizamos que el tronco no te quitará el aliento. Es bastante sencillo y bastante detallado. ¡No te preocupes! Veremos varias formas de embellecer la salida para que el registro no solo se vea bien, sino que nos brinde mucha más información sobre el historial de nuestro repositorio.

Una nota final antes de continuar. El comando **`git log`** usa un pager, en caso de que tenga más commits para mostrar para las que hay espacio. Recuerde que puede usar las teclas de flecha hacia arriba y hacia abajo para navegar; cuando haya terminado, simplemente presione la tecla **`q`** (significa "quit(salir)"), que lo devuelve al símbolo del sistema.

<hr>

**NOTA**

También hablamos sobre el pager en el Capítulo 2 .

<hr>

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

**---------> Respuestas en “Exercise Solution”.**

Es hora de dar rienda suelta a sus habilidades use **`git log`** en el repositorio **`recipes`**. Abre tu terminal (o simplemente usa el del último ejercicio). Asegúrate de estar en la rama **`spicy-version`**. Usando el comando **`git log`**, vea si puede responder a las siguientes preguntas para cada una de las tres ramas en el repositorio.

<hr>

**NOTA**

Recuerde presionar la tecla **"q"** para salir del pager de git.

<hr>

* ¿Cuántos commits hay en la rama?

* Enumere los **primeros siete caracteres** de cada ID de commit junto con sus respectivos mensajes de commit en orden cronológico inverso (es decir, el orden en que se le presentan).

<img width="1233" alt="image" src="https://user-images.githubusercontent.com/23094588/210153255-8577451e-ab8d-4df7-9be9-7d67d8b08ddd.png">

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

Revise los ID de commit que registró en el último ejercicio. ¿Qué pasó en este depósito? **Sugerencia**: Comience enumerando todas las ramas en el repositorio, luego revise los commits que registró y vea si hay commits en común entre las ramas. Eso debería darte un buen punto de partida.

### 💻

<hr>

**NOTA**

Utilice este espacio para tomar notas.

<hr>


## “Espejo, espejo en la pared: ¿quién es el log más bonito de todos?”

<img width="1273" alt="image" src="https://user-images.githubusercontent.com/23094588/210153377-f3a486dc-1b7e-4531-a1b1-8481ad3e4ba7.png">

Si bien la salida del comando **`git log`** es exhaustiva, ciertamente deja mucho que desear, especialmente cuando se trata de discernir la historia de nuestro proyecto. Afortunadamente, el comando **`log`** ofrece banderas para mejorar su salida y hacerla más útil. Echemos un vistazo a algunas de estas banderas y su efecto en la salida.

Primero, trunquemos el ID de commit. Recuerde que los ID de commit son únicos y, por lo general, los primeros caracteres son suficientes para identificar un commit. La bandera **`abbrev-commit`** solo muestra suficientes caracteres para identificar un commit de manera única, que suele ser lo que desea:

<img width="1263" alt="image" src="https://user-images.githubusercontent.com/23094588/210153481-8ac33d58-4bc6-4634-957a-386e8d17c8d6.png">

Quizás no te interese ver toda la información sobre el autor y la fecha. ¡No hay problema! El comando **`git log`** te tiene cubierto con la bandera **`pretty`**. Vamos a utilizar una opción de formato integrada llamada **`oneline`**:

<hr>

**NOTA**

Git tiene un puñado de opciones de formato integradas, como **`oneline`** que puede usar, o puede escribir una personalizada. A medida que conozca más a Git, podrá aprender a personalizarlo a su gusto. Por ahora, **`oneline`** es un gran comienzo.

<hr>

<img width="1250" alt="image" src="https://user-images.githubusercontent.com/23094588/210153573-3e298d5c-1b5e-4276-a72e-dc4669d6d581.png">

¡Juntos ahora! Puede combinar muchas de las banderas disponibles en el comando **`git log`**, así que si le gustan los ID de commits más cortos presentados cor la bandera **`abbrev-commit`** pero también quiere la vista sucinta, ¡utilice ambos!

<img width="1267" alt="image" src="https://user-images.githubusercontent.com/23094588/210153627-c1d2a5b2-5e3d-42c9-9ba9-cd962a871aeb.png">

Esta combinación es tan popular que Git te da un atajo: la bandera **`--oneline`**.

<hr>

**NOTA**

Sabemos que es confuso, pero **`--oneline`** es un indicador como **`--abbrev-commit`**. Esto no es lo mismo que la opción de formato **"oneline"** que proporcionamos a la bandera **`pretty`**.

<hr>

<img width="1244" alt="image" src="https://user-images.githubusercontent.com/23094588/210153713-b21cc695-0834-4ca2-b2b4-42aeb15a0a33.png">

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

Vuelve a la salida de **`git log`** sin banderas. Ahora que sabe que puede personalizar su salida, ¿hay alguna información que le gustaría agregar (o no mostrar)? Toma tus notas aquí. Una vez que se sienta más cómodo, descubrirá cómo personalizar **`git log`** para ver exactamente lo que desea.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Intente poner el comando **`git log`** a través de algunos pasos en el repositorio **`recipes`**. Comience con la terminal y asegúrese de estar en la carpeta **`recipes`**.

* **Comience con la rama `different-base`. Use `git log --oneline` y enumere lo que ve aquí:

   <img width="1243" alt="image" src="https://user-images.githubusercontent.com/23094588/210153831-7403558b-3758-4440-91a3-0fc363241b5d.png">

* Lo siguiente es la rama **`spicy-version`**.

   <img width="1243" alt="image" src="https://user-images.githubusercontent.com/23094588/210153842-f3798131-ad9e-47d8-9bfd-c257abf0ce86.png">

* Finalmente, la rama **`master`**.

   <img width="1243" alt="image" src="https://user-images.githubusercontent.com/23094588/210153842-f3798131-ad9e-47d8-9bfd-c257abf0ce86.png">

### 💻


**---------> Respuestas en “Sharpen your pencil Solution”.**

<hr>

<img width="914" alt="image" src="https://user-images.githubusercontent.com/23094588/210153898-b6e7afe8-c57f-4dd8-b242-d53cab4a126c.png">

**¡Correcto!** Cada commit (excluyendo el primer commit en su repositorio) tiene un puntero a sus padres (o, si es un **merge commit**, a sus dos padres). Entonces, ¿qué pasa cuando corres **`git log`**? Bueno, Git mira el último commit que hiciste y muestra detalles sobre ese commit según los indicadores que proporcionaste. Luego sigue el puntero al commit padre y se repite. Haga espuma, enjuague, repita hasta que llegue a un commmit que no tenga padres.

¡Pero Git también sabe cuántas ramas tienes en tu repositorio! Esto implica que Git debería poder encontrar el último commit en cada rama y rastrear el linaje de ese commit simplemente siguiendo el puntero principal.

Veamos cómo podemos hacer eso. Tenemos la sensación de que va a estar muy satisfecho con los resultados.


## ¿Cómo trabaja `git log`?

¿Qué sucede cuando Brigitte mira el registro de su repositorio? Considere un hipotético historial de commits, que se compone de tres ramas: **`master`**, **`feat-a`**, y **`feat-b`**. Supongamos que Brigitte está en la rama **`feat-a`** y ejecuta el comando **`git log`**:

<img width="1067" alt="image" src="https://user-images.githubusercontent.com/23094588/210154143-51f18ec4-8f88-4281-9126-a3b326abe0a4.png">

Dado que Brigitte está en la rama **`feat-a`**, que apunta al commit **"C"**, la salida del comando **`git log`** comienza con **C**. Luego lee y muestra los detalles de ese commit. Ve que **"B"** es el padre de **C**, por lo que hace lo mismo para **"B"**.

Después de mostrar los detalles del commit **"B"**, Git procede a mostrar el commit **"A"**, ya que es el commit parent de **"B"**. Sin embargo, **"A"** es el primer commit realizado en este repositorio y no tiene padre, por lo que se detiene.

<img width="1204" alt="image" src="https://user-images.githubusercontent.com/23094588/210154281-cbfd5589-3ba0-4d77-bb5c-1f64f2c77127.png">


## Hacer que `git log` haga todo el trabajo
## ¿Qué diferencia hace?
## Visualización de diferencias de archivos
## Visualización de diferencias de archivos: un archivo a la vez
## Visualización de diferencias de archivos: un trozo(hunk) a la vez
## Hacer las diferencias más agradables a la vista
## Diferenciando cambios por etapas(staged)
## Diferenciando branches
## Diferenciando commits
## ¿Qué aspecto tiene la `diff` para un nuevo archivo?










EXCERSICE - Tenis

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

SERIOUS CODING - Gorra

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588029-ec1d2f5b-0d40-4f2b-8775-37ea47551cba.png">

WATCH IT!

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/209588631-39069271-94a0-46f5-8f77-601389e0f170.png">


SHARPEN YOUR PENCIL - Lapiz

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

BE Git

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850368-57d82652-76aa-43cb-b2eb-27a73c6f6e70.png">

BRAIN POWER - Cerebro

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

MAKE IT STICK

<img width="1156" alt="image" src="https://user-images.githubusercontent.com/23094588/209859350-656c580f-cd14-4123-b3fc-3b6901fd405f.png">

Code Magnets Solution - Refregerador

![image](https://user-images.githubusercontent.com/23094588/210068520-0236eda7-645b-4d5a-9793-bc61a9ba9aff.png)



