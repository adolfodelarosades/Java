# Capítulo 2. Ramificación: *Múltiples Trenes de Pensamiento*

<img width="658" alt="image" src="https://user-images.githubusercontent.com/23094588/209586986-6bd25aea-9406-4444-b3ba-2c9c94771562.png">

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

## “Todo comenzó con un correo electrónico”

Norm estaba completamente inmerso: sus dedos volaban frenéticamente por todo el teclado, el código aparecía a un ritmo vertiginoso en su pantalla y todo funcionaba. Se sentía como Neo en Matrix: él era el sistema, y el sistema era solo una extensión de él. Estaba tan cerca de terminar un cambio complejo en el código base que casi podía saborearlo.

<img width="806" alt="image" src="https://user-images.githubusercontent.com/23094588/209587042-993f5c33-2a40-4026-b03c-d711faaced7a.png">

Norm sabía que aún no había terminado. Pero committed su código de todos modos y comenzó a abordar el error. Al final de un largo día, cuando supo que había solucionado ese error de una vez por todas, se committed su trabajo. Así es como se veía su commit history ahora:

<img width="787" alt="image" src="https://user-images.githubusercontent.com/23094588/209587111-cb6a4fdc-4a2b-461b-8769-aaadf23fd18a.png">

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587126-371910c0-5851-4e64-81e0-31ffe34f17f6.png">

Piensa en el historial de commits. A ver si puedes averiguar en qué se equivocó Norm. Anota tus notas aquí:

PIENSO QUE SUBIO SU TRABAJO A MEDIAS, NO ES TAN ADECUADO.

<hr>

 **----------> Respuestas en “Exercise Solution”.**
 
 ### Pero las cosas no terminaron de funcionar...
 
 <img width="701" alt="image" src="https://user-images.githubusercontent.com/23094588/209587268-37771f90-f95d-4bc9-8eb3-8943853b74a0.png">

**¿Entonces qué pasó?**

Norm no tuvo en cuenta el hecho de que los commits de Git se basan en commits anteriores. Cuando Norm hizo commit para corregir el error, fue después de haber hecho commit en su trabajo parcialmente terminado. ¡Esto significaba que el commit de corrección de errores se derivó de un commit que incluía trabajo incompleto!

<img width="674" alt="image" src="https://user-images.githubusercontent.com/23094588/209587339-5ff880b3-24a2-4eed-ab07-4a8d4494000e.png">

**¿Qué harías si fueras Norm?**

¿Cuáles eran las opciones de Norm aquí? Bueno, podría haber tomado notas minuciosamente de todos los cambios que hizo en todos sus archivos y luego deshacer todos los cambios. Luego podría corregir el error, confirmar la solución y volver atrás y volver a aplicar todo su trabajo anterior, con la esperanza de no perderse nada. Parece doloroso, ¿verdad?

En este punto, probablemente te estés preguntando si Git vendrá y salvará el día. ¡Va a! Git te permite "cambiar de pista" usando una función llamada **branches**. Las ramas le permiten mantener sus cambios completamente independientes entre sí.

<hr>

**NOTA**

Git permite que múltiples desarrolladores contribuyan al mismo proyecto, también usando ramas. Pero ese es un tema para otro capítulo.

<hr>

Una forma de pensar en su commit history es visualizar sus commits como brotes en la rama de un árbol. Cuando trabajas en cualquier rama, los commits son secuenciales y aparecen uno tras otro.

<img width="938" alt="image" src="https://user-images.githubusercontent.com/23094588/209587505-e5cef634-4cd9-4597-8c9d-c9d03f013e3d.png">

Sin embargo, las ramas de los árboles pueden bifurcarse y crecer en paralelo. Lo mismo pueden hacer las ramas de Git. Lo que esto significa es que puedes trabajar en diferentes cosas simultáneamente sin incluir accidentalmente cosas que no tenías la intención (como hizo Norm).

<img width="739" alt="image" src="https://user-images.githubusercontent.com/23094588/209587545-2ac79d7f-7552-4460-96d8-deb773276cd6.png">

Un commit representa un punto en el tiempo y una rama representa una serie de commits. Recuerde que una serie de commits es también el historial de commits. Entonces, las ramas son diferentes historiales de commits, ¡todos en el mismo repositorio! En cualquier momento, puede optar por crear una nueva rama, cambiar entre ramas, descartar una rama (es decir, decidir abandonar todo el trabajo que le ha dedicado) e incluso fusionar ramas.

## “Actualización del menú del restaurante”

Hablando de tomar decisiones, felicitaciones por su nuevo trabajo: administrar el menú en **'80s Diner**, donde las deliciosas recetas se encuentran con la nostalgia.

Su función es preparar platos emocionantes y nutritivos para la temporada de otoño. Sin embargo, debe obtener la aprobación del chef y el equipo de cocina para asegurarse de que realmente puedan preparar sus deliciosos brebajes.

Ya está familiarizado con el uso de Git y repositorios de Git, por lo que se encarga de llevar el sistema de publicación de menús a la era moderna. (Sí, no se llaman a sí mismos el Diner de los 80 sin ningún motivo). Primero decide tomar su menú existente y ponerlo en un repositorio de Git antes de comenzar con cualquier trabajo nuevo.

<img width="748" alt="image" src="https://user-images.githubusercontent.com/23094588/209587636-8c1d5a5d-fb6b-4348-84c9-1f343ca07599.png">

### Lo primero es lo primero

Llevemos el Diner de los 80 al siglo XXI. Comenzaremos colocando su menú existente en un repositorio de Git. Esto nos dará la oportunidad de practicar algunas de nuestras habilidades de Git recientemente adquiridas.

1. Cree un nuevo directorio llamado **`80s-diner`** dentro del paraguas **`headfirst-git-samples`** y cambie a él usando el comando **`cd`**. Continúe e inicialice un nuevo repositorio de Git usando **`git init`**.

   <hr>

   **NOTA**

   Asegúrese de seguir las instrucciones aquí. Vas a necesitar esta configuración para el resto del capítulo.

   <hr>
   
   <img width="912" alt="image" src="https://user-images.githubusercontent.com/23094588/209587739-51e33abe-de39-426e-8355-2cf8437c5a0a.png">

2. Copie el archivo **`menu.md`** que descargó en la carpeta **`80s-diner`** recién creada.

   <img width="900" alt="image" src="https://user-images.githubusercontent.com/23094588/209587779-b9943ba9-6a32-4b87-9fd2-11bafc156a3f.png">

3. Luego, agregue el archivo al índice y commitealo al repositorio **`80s-diner`** usando el mensaje de commit **"`add the main menu`(agregar el menú principal)"**.
   
   <img width="892" alt="image" src="https://user-images.githubusercontent.com/23094588/209587846-db854142-3289-4552-9f82-c16a5b64287a.png">

4. Finalmente, asegurémonos que todo está bien con **`git status`**.

   <img width="920" alt="image" src="https://user-images.githubusercontent.com/23094588/209587893-c9af9daa-942f-4217-8180-a8eccb1d752b.png">

<img width="698" alt="image" src="https://user-images.githubusercontent.com/23094588/209587922-6d37b4d2-1fe4-4231-8eab-213d00ac119c.png">

### ¡Muy astuto!

Cuando hicimos nuestros ejercicios **`git status`** en el Capítulo 1 , le pedimos que ignorara los detalles de las ramas, porque no estábamos listos para hablar de ramas en ese momento.

Resulta que cuando inicializa un nuevo repositorio de Git y realiza su primera commit, ¡ya está trabajando con ramas! Git por defecto usa una rama llamada **`master`**, lo que explica por qué **`git status`** informó que estabas en esa rama.

Hasta ahora, en el repositorio **`80s-diner`** recién creado, solo tiene un commit. Siempre que no cree otra rama, cada commit posterior que realice estará en esta rama.

Simplemente lo diremos aquí: *vas a usar mucho las ramas cuando trabajes con Git*. Aunque inicialmente puede parecer más problemático de lo que es vale, pronto verá que crear, administrar y eventualmente integrar su trabajo entre ramas es sencillo en Git. Sin mencionar que te da mucha libertad mientras trabajas.

<hr>

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588025-c3688e8d-61ea-4865-832a-046a059f49d7.png">

No hay nada especial sobre la rama por defecto o el nombre **`master`**. Esta rama no es diferente de cualquier rama que pueda crear. Puede cambiarle el nombre si lo desea y, de hecho, muchos equipos lo hacen. Si volviera atrás y leyera las sugerencias **`git init`** proporcionadas en la página anterior, notará que Git le brinda no solo una forma de cambiar el nombre de **`master`** a otra cosa, sino que también le dice cómo establecer de forma permanente el nombre de la rama en la configuración predeterminada para cualquier repositorio que pueda crear en el futuro.

Sin embargo, Git aún tiene como valor predeterminado **`master`**, y para evitar confusiones, continuaremos usando el nombre **`master`** de la rama predeterminada a lo largo de este libro.

<hr>

## “Opciones... ¡Tantas opciones!”

<img width="810" alt="image" src="https://user-images.githubusercontent.com/23094588/209588226-9971656c-1d3f-42c9-806f-b877ab5a8e8b.png">

Administrar branches en Git usa otro comando, apropiadamente llamado **`branch`**. Puede usar el comando **`branch`** para crear una nueva rama, enumerar todas las ramas en su repositorio e incluso eliminar ramas. Y, como todo lo que has hecho hasta ahora, todo esto sucede en la terminal dentro de tu directorio de trabajo.

Comencemos por crear una nueva rama. Puede usar el comando **`branch`**, dándole el nombre de la rama que desea crear como argumento.

<img width="952" alt="image" src="https://user-images.githubusercontent.com/23094588/209588274-4c866592-60d1-4ac6-955b-ba7fa196a844.png">

Git no informa sobre el éxito o el fracaso, pero puede enumerar todas sus ramas usando el mismo comando **`branch`**, excepto que no tiene argumentos.

<img width="961" alt="image" src="https://user-images.githubusercontent.com/23094588/209588305-4b4ffdff-08f6-4eb4-92bf-8f1188d219e3.png">

El resultado del comando **`git branch`** es una lista de todas las ramas en el repositorio actual. Git amablemente coloca un asterisco al lado de la rama que estamos usando actualmente.

Crear una nueva branch no significa que pueda comenzar a usarla de inmediato. Tienes que cambiar a élla primero.

<hr>

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588029-ec1d2f5b-0d40-4f2b-8775-37ea47551cba.png">

El comando Git **`branch`**, sin argumentos, es como el comando **`git status`**, en el sentido de que es un comando "safe(seguro)". Simplemente enumera todas las ramas en su repositorio sin cambiar nada. Puede ejecutarlo tantas veces como lo considere necesario.

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Puedo tener espacios en blanco en el nombre de mi branch?**

**R**: No. Si desea un nombre de rama de varias palabras, use guiones o guiones bajos. Si intenta poner un espacio en el nombre de su branch, Git informará un **`"is not a valid name"`** error. ¡Sin embargo, se permiten las barras diagonales (**`/`**)!

Hablaremos más sobre los nombres de las branches al final de este libro, así que esté atento.

**P: ¿Qué sucede si intento crear una branch con un nombre que ya existe?**

**R**: Al igual que con un nombre de rama no válido, Git generará un error y le indicará que ya existe una rama con ese nombre. Es bueno adquirir el hábito de ejecutar **`git branch`** para ver una lista de todas las ramas en su repositorio antes de crear una nueva.

**P: ¿Cuántas branch puedo tener en mi repositorio de Git?**

**R**: ¡Tantos como quieras! Pero como veremos pronto, por lo general usará una rama para trabajar en un cambio pequeño y aislado, luego lo combinará(merge) en una rama de "integración" cuando haya terminado, y luego eliminará la rama. Nos sumergiremos en las ramas de integración y la eliminación de ramas pronto. Esto le ayuda a mantener un buen repositorio ordenado.

<hr>

## "Cambio de pistas"

Ahora sabe cómo crear branch, pero también acaba de aprender que crear una nueva branch no significa que pueda comenzar a usarla. Para cambiar a otra rama, usará otro comando de Git, acertadamente llamado **`switch`**, que toma un argumento, a saber, el nombre de la rama a la que desea cambiar:

<img width="1006" alt="image" src="https://user-images.githubusercontent.com/23094588/209588568-9400d5c5-c0e0-49d2-9cf8-8812510347e3.png">

Puede usar **`git branch`** para enumerar todas las branches nuevamente:

<img width="940" alt="image" src="https://user-images.githubusercontent.com/23094588/209588613-170252c3-eddd-4bca-9b73-9586663ca4a9.png">

<hr>

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/209588629-0f84426f-e964-4ff0-b83d-c716a634cfac.png">

**`git switch` es un comando relativamente nuevo.**

*Si obtiene un error como **`"switch is not a git command"`**, asegúrese de verificar la versión de Git que ha instalado con **`git version`**. Necesitas tener una versión superior a **`2.23.0`***.

*Las versiones anteriores de Git usaban el comando **`git checkout`** para cambiar de rama. Si bien eso aún funciona, preferimos mostrarle la forma más reciente (y ahora correcta) de hacer las cosas*.

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Qué sucede si escribo mal el nombre de la branch?**

**R**: No te preocupes. Git simplemente reportará un error como **“`fatal: invalid reference`”**. Preferimos copiar y pegar el nombre que deseamos usar desde la salida del comando **`git branch`**. ¡Se acabaron los errores tipográficos!

<hr>

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588029-ec1d2f5b-0d40-4f2b-8775-37ea47551cba.png">

Si te gusta realizar hazañas notables en la línea de comandos, entonces te alegrará saber que el comando **`git switch`** te permite crear una nueva rama y cambiar a ella de una sola vez. Puede invocar el comando **`git switch`** con el indicador **`-c`**(o **`--create`**), dándole el nombre de la rama que desea crear, así:

```sh
git switch -c my-first-branch
```

Esto le pedirá a Git que cree la rama llamada **`my-first-branch`** y cambie a ella de inmediato. Sin embargo, dado que esta es su primera incursión en Git, continuaremos usando el comando **`git branch`** para crear nuevas ramas durante el resto de este libro.

### De vuelta en el restaurante de los 80

Te sientes bien. El menú de '80s Diner ahora se administra en un repositorio de Git. Y tiene una nueva solicitud: la gerencia planea introducir un menú especial de otoño, y su tarea es inventar algunos espeluznantes especiales con temas de Halloween. Te encargas de ver películas de terror de los años 80 para entrar en el estado de ánimo adecuado, y entras al trabajo rebosante de ideas para recetas.

Seamos diligentes y creemos una rama para que pueda iterar sobre las ideas del menú. Comenzaremos en la terminal:

<img width="954" alt="image" src="https://user-images.githubusercontent.com/23094588/209588922-b932e007-5eef-4113-942d-ae2170a344a6.png">

A continuación, cree una nueva rama llamada **`add-fall-menu`** y cambie a ella.

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/209588953-e54a3301-c054-4a7f-922d-0b6b4ce8f452.png">

Ya sabes que hacer. Aquí está su lista de verificación:

<img width="994" alt="image" src="https://user-images.githubusercontent.com/23094588/209589000-2aa5c909-760e-48d4-9cf7-f279bddb7783.png">

## "¡Devuelvelo!"

<img width="669" alt="image" src="https://user-images.githubusercontent.com/23094588/209589028-c7e87a49-871e-4dfa-8ff3-a42867252324.png">

¡UH oh! Le mostraste al personal de cocina tu menú de otoño recién creado, pero no están encantados con el tibio título del nuevo menú. Necesitan que sea un poco más emocionante, por lo que le piden que cambie el encabezado de "Fall Menu" a "The Graveyard Shift".

También podríamos hacer ese cambio. Regrese a su editor de texto y cambie la primera línea del archivo **`fall-menu.md`** de "Fall Menu" a "The Graveyard Shift". Asegúrese de guardar el archivo antes de continuar.

Comenzaremos comprobando nuestro estado de Git. Como editamos el archivo **`fall-menu.md`**, debería aparecer como "modified".

<img width="987" alt="image" src="https://user-images.githubusercontent.com/23094588/209589141-15c6c007-b1ea-4471-9239-d80e66112f77.png">

<img width="651" alt="image" src="https://user-images.githubusercontent.com/23094588/209589155-dc2792f0-7605-462a-9d15-ba12060ec8bf.png">

Eso se ve bien, así que sigamos adelante y commitemoslo. Comenzaremos agregando el archivo al índice y luego commitearlo. Usemos el mensaje "update heading(actualizar encabezado)":

<img width="965" alt="image" src="https://user-images.githubusercontent.com/23094588/209589203-c8c8a990-0015-49a4-8636-d231d8597ae0.png">

### Imanes de código

<img width="254" alt="image" src="https://user-images.githubusercontent.com/23094588/209589235-288c51cd-1de4-4a80-b519-d590b934dc1f.png">

¡Oh querido! Para ayudar a nuestros compañeros desarrolladores, hemos diseñado cuidadosamente todos los comandos necesarios para enumerar todas las ramas en su repositorio (existente), crear una nueva rama, cambiar a ella y verificar que todo esté bien. ¡Pobre de mí! Los imanes cayeron al suelo. Es tu trabajo volver a armarlos. Ten cuidado; se mezclaron algunos imanes adicionales y algunos se usaron más de una vez.

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/209589271-aa020bd4-0f40-45ed-aec4-758b68f23ab1.png">

**----------> Respuestas en “Code Magnets Solution”.**

<img width="601" alt="image" src="https://user-images.githubusercontent.com/23094588/209589310-e065fbd7-01d8-4ddf-b72e-fafdfd392ebd.png">

**¡Gran pregunta!** Puede que no lo parezca en este momento, pero las branches le ofrecen mucha flexibilidad a medida que comienza a trabajar con múltiples requisitos.

En este momento, tienes dos ramas: **`master`** y **`add-fall-menu`**. Inicializaste el repositorio, lo que te colocó en la rama **`master`**. Agregó y commiteo el menú existente en la rama **`master`**.

Cuando obtuviste los requisitos para el menú de otoño, elegiste hacer todo ese trabajo en una rama separada: a saber, la rama **`add-fall-menu`**.

Estas dos ramas representan dos requisitos completamente separados. Recuerde, las ramas le permiten aislar partes del trabajo entre sí. Si mañana la gerencia viniera y te pidiera que trabajes en algo que no tiene ninguna relación (¡y seguramente lo harán!), simplemente creas una nueva rama **`master`** y te pones a trabajar. Todo el trabajo que hizo en la rama **`add-fall-menu`** permanece intacto hasta que tenga la oportunidad de volver a él.

La buena noticia aquí es que trabajar en una branch no es nuevo para usted: ¡ha estado trabajando con branches todo el tiempo! Además de tener que crear y cambiar ramas, su flujo de trabajo sigue siendo el mismo: agrega o edita archivos, los agrega al índice y luego los commitea.

## “Visualización de branches”

Entonces, ¿qué sucede cuando haces un commit en una rama? Quizás ayude recapitular lo que hemos hecho hasta ahora, *después de* inicializar un repositorio en la carpeta **`80s-diner`**:

* Agregamos el archivo **`menu.md`** y lo commiteamos. Recuerde que este commit está en el valor predeterminado, es decir, la rama **`master`**.
* Luego creamos la rama **`add-fall-menu`**.
* Introdujimos el archivo **`fall-menu.md`** y lo commiteamos.
* Tuvimos que corregir el encabezado, así que hicimos un cambio en el archivo **`fall-menu.md`** e hicimos un segundo commit.

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/209847759-4a73e802-439c-4d53-b2eb-597b64ca89a3.png">

Como puede ver, hicimos algunos trabajos en la branch **`master`** y ahora tenemos trabajo en la branch **`add-fall-menu`**.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848106-d0b45bd3-1e48-4f6e-b009-90722df38d7a.png">

¿Qué cambiaría en la visualización si permanecieras en la rama **`add-fall-menu`** y tuvieras que hacer otro commit?

**----------> Respuestas en “Sharpen your pencil Solution”.**

<hr>


## "Ramas, confirmaciones y los archivos contenidos dentro"

Sabemos que los commits en una rama están **"sequenced(secuenciadas)"**, es decir, son como los brotes en la rama de un árbol: uno viene después del siguiente. ¿Qué significa eso para los archivos que conoce cada commit? Recuerde que los repositorios de Git están predeterminados en la rama **`master`**. Entonces, nuestro primer commit, que introdujo el archivo **`menu.md`**, estaba en la branch **`master`**.

<img width="1097" alt="image" src="https://user-images.githubusercontent.com/23094588/209849057-3bf23431-9530-4dc1-9e12-f75c1c81daed.png">

En este punto, teníamos un commit en la rama **`master`**. Cuando creamos la rama **`add-fall-menu`**, Git usó este commit como punto de partida para la nueva rama. En otras palabras, tanto la branch **`master`** como la branch **`add-fall-menu`** comparten este commit.

<img width="1101" alt="image" src="https://user-images.githubusercontent.com/23094588/209849424-ad0bbbe5-5bc4-4ba7-92b1-cc2ea0403b11.png">

Hasta ahora, solo hemos commiteado el archivo **`menu.md`**. Dado que tanto la rama **`master`** como la rama **`add-fall-menu`** apuntan al mismo commit, ambos conocen el mismo archivo **`menu.md`**.

Luego introdujimos el archivo **`all-menu.md`** en la rama **`add-fall-menu`** y lo commiteamos.

<img width="1141" alt="image" src="https://user-images.githubusercontent.com/23094588/209849934-13a41d27-c86e-4f5b-b5b9-919a10a8819f.png">

Dado que la rama **`add-fall-menu`** comenzó con el commit que incluía el archivo **`menu.md`** y luego introdujo el archivo **`fall-menu.md`**, ahora tiene ambos archivos. Pero la rama **`master`** solo tiene el commit con el archivo **`menu.md`**, por lo que la rama **`master`** solo tiene el archivo **`menu.md`**.

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850337-09d538e2-5da1-41ee-bf3f-9c0fafb09a59.png">

BE Git

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850368-57d82652-76aa-43cb-b2eb-27a73c6f6e70.png">

**Dedique un poco de tiempo a comprender cómo cambia Git su directorio de trabajo cuando cambia de rama.**

Comience con su terminal: asegúrese de estar en el directorio **`80s-diner`** y utilíce **`git branch`** para asegurarse de que está en la branch **`add-fall-menu`**.

<img width="733" alt="image" src="https://user-images.githubusercontent.com/23094588/209850722-1dc8b39b-9dd3-4102-9a66-55b8291d3b7b.png">

Finalmente, vea si puede explicar lo que está viendo aquí.

<hr>

**NOTA**

La explicación va aquí.

<hr>

**----------> Respuestas en “BE Git Solution”.**

### Conversación de cubículo

<img width="781" alt="image" src="https://user-images.githubusercontent.com/23094588/209851034-593b8c7d-3cb3-44f4-b1af-db4c2119d005.png">

**Maddie**: Sé que estás esperando la aprobación final del menú de otoño, pero tengo algo más que necesito que te encargues por mí.

**Ginebra**: Espera, ¿es este un nuevo menú?

**Maddie**: Sí. Hemos decidido hacer un menú especial para las noches de los jueves. El tema son las películas de los 80, por lo que se mantiene en la marca, y lo llamamos... espérelo... ¡Throwback Thursdays!

**Guinevere**: Está bien... pero todavía estamos en medio de terminar el menú de otoño.

**Armando**: Está bien, Ginebra. Crearé un nuevo archivo en nuestro repositorio, trabajaré en el nuevo menú y lo commitare.

**Ginebra**: ¡Vaya! Esperar. Si se commitea ahora, lo hará en la rama **`add-fall-menu`**. Queremos mantener estos cambios independientes entre sí. Aquí, déjame mostrarte lo que sucederá si haces un commit ahora mismo:

<img width="959" alt="image" src="https://user-images.githubusercontent.com/23094588/209851456-03103778-2ce9-48c6-9405-8984c284d665.png">

**Armando**: Entonces usaré el comando **`branch`** para crear una nueva rama. Ese debería ser el truco, ¿verdad?

**Guinevere**: Bueno, queremos asegurarnos de no incluir ninguno de los cambios en el menú de otoño. Actualmente estamos en la branch **`add-fall-menu`**. Si creas una nueva rama, se basará en la rama **`add-fall-menu`**. Queremos que la nueva rama se base en la rama **`master`**.

<img width="982" alt="image" src="https://user-images.githubusercontent.com/23094588/209851953-0da467e7-172f-4ab5-9e01-4e1ec0a9302f.png">

**Armando**: ¡Ay! ESTÁ BIEN. Entonces, primero, cambio a la rama **`master`**, luego uso el comando **branch** para crear una nueva rama. De esa manera, mantenemos los cambios en el menú de otoño completamente independientes de los cambios en el menú del jueves. ¡Entendido!

## “Trabajando en paralelo”

Veamos qué se necesita para empezar a trabajar en el menú de Throwback Thursdays. Asegúrese de que estás en el directorio **`80s-diner`** y que los informes están bien con **`git status`**.

<img width="994" alt="image" src="https://user-images.githubusercontent.com/23094588/209852477-53118c05-d9c5-4186-b572-a62c25d0a937.png">

Si no está en la branch **`master`**, su primer acción es cambiar a la branch **`master`**. Esto asegura que la nueva rama se basará en la rama **`master`**. Luego podemos crear nuestra nueva branch y agregar el nuevo menú **Throwback Thursday**. Llamemos a nuestra nueva branch **`add-thurs-menu`**.

<img width="941" alt="image" src="https://user-images.githubusercontent.com/23094588/209852747-4741e77d-d55e-4db2-b081-b10271e02743.png">

Los siguientes pasos son todos suyos. Cree un nuevo archivo llamado **`thursdays-menu.md`** en el directorio **`80s-diner`** con el menú como se muestra a la derecha, agréguelo al index y commitelo con el mensaje **"`add thursdays menu`"**. ¡Asegúrate de comprobar con **`git status`** cuando hayas terminado!

<img width="484" alt="image" src="https://user-images.githubusercontent.com/23094588/209853095-3bb71bdf-f56f-4a50-af31-4c9183f72edc.png">



## “¿Qué es una rama, realmente?”
## "¿Cambiar de sucursal o cambiar de directorio?"
## "¡Tráelo dentro!"
## "Lea el manual #&$!@ (edición de git branch)"
## "Algunas fusiones son de avance rápido"
## "No funciona del todo de la otra manera"
## "Un poco más de configuración de Git"
## "¡Esperar! ¿Te moviste?"
## "Es una confirmación de fusión"
## “Las cosas no siempre van tan bien”
## "¡Estoy tan en conflicto!"
## "Limpieza de sucursales (fusionadas)"
## "Eliminar ramas no fusionadas"
## "Un flujo de trabajo típico"

EXCERSICE - Tenis

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

SERIOUS CODING - Gorra

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588029-ec1d2f5b-0d40-4f2b-8775-37ea47551cba.png">

WATCH IT!

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/209588631-39069271-94a0-46f5-8f77-601389e0f170.png">


SHARPEN YOUR PENCIL - Lapiz

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">


