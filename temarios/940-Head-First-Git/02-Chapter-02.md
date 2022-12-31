# Capítulo 2. Ramificación: *Múltiples Trenes de Pensamiento*

<img width="658" alt="image" src="https://user-images.githubusercontent.com/23094588/209586986-6bd25aea-9406-4444-b3ba-2c9c94771562.png">

**Puede caminar y mascar chicle al mismo tiempo**. Los veteranos de Git le dirán, mientras se reclinan en sus sillas de jardín (sorbiendo su té verde hecho a mano), que una de las mayores ventajas de Git es la facilidad con la que puede crear ramas. Tal vez le hayan asignado una nueva función y, mientras trabaja en ella, su gerente le pide que corrija un error en producción. O tal vez acaba de dar los últimos toques a su último cambio, pero se le ha ocurrido la inspiración y acaba de pensar en una forma mejor de implementarlo. Las ramas le permiten trabajar en múltiples piezas de trabajo completamente desconectadas en la misma base de código al mismo tiempo, independientemente unas de otras. ¡Veamos cómo!

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

Norm sabía que aún no había terminado. Pero committeo su código de todos modos y comenzó a abordar el error. Al final de un largo día, cuando supo que había solucionado ese error de una vez por todas, committeo su trabajo. Así es como se veía su commit history ahora:

<img width="787" alt="image" src="https://user-images.githubusercontent.com/23094588/209587111-cb6a4fdc-4a2b-461b-8769-aaadf23fd18a.png">

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587126-371910c0-5851-4e64-81e0-31ffe34f17f6.png">

Piensa en el historial de commits. A ver si puedes averiguar en qué se equivocó Norm. Anota tus notas aquí:

**PIENSO QUE SUBIO SU TRABAJO A MEDIAS, NO ES TAN ADECUADO**.

 **----------> Respuestas en “Exercise Solution”.**
 
 ### Pero las cosas no terminaron de funcionar...
 
 <img width="701" alt="image" src="https://user-images.githubusercontent.com/23094588/209587268-37771f90-f95d-4bc9-8eb3-8943853b74a0.png">

**¿Entonces qué pasó?**

Norm no tuvo en cuenta el hecho de que los commits de Git se basan en commits anteriores. Cuando Norm hizo commit para corregir el error, fue después de haber hecho commit en su trabajo parcialmente terminado. ¡Esto significaba que el commit de corrección de errores se derivó de un commit que incluía trabajo incompleto!

<img width="674" alt="image" src="https://user-images.githubusercontent.com/23094588/209587339-5ff880b3-24a2-4eed-ab07-4a8d4494000e.png">

**¿Qué harías si fueras Norm?**

¿Cuáles eran las opciones de Norm aquí? Bueno, podría haber tomado notas minuciosamente de todos los cambios que hizo en todos sus archivos y luego deshacer todos los cambios. Luego podría corregir el error, conmmitear la solución y volver atrás y volver a aplicar todo su trabajo anterior, con la esperanza de no perderse nada. Parece doloroso, ¿verdad?

En este punto, probablemente te estés preguntando si Git vendrá y salvará el día. ¡Vamos! Git te permite "cambiar de pista" usando una función llamada **branches**. Las ramas le permiten mantener sus cambios completamente independientes entre sí.

<hr>

**NOTA**

Git permite que múltiples desarrolladores contribuyan al mismo proyecto, también usando ramas. Pero ese es un tema para otro capítulo.

<hr>

Una forma de pensar en su commit history es visualizar sus commits como brotes en la rama de un árbol. Cuando trabajas en cualquier rama, los commits son secuenciales y aparecen uno tras otro.

<img width="938" alt="image" src="https://user-images.githubusercontent.com/23094588/209587505-e5cef634-4cd9-4597-8c9d-c9d03f013e3d.png">

Sin embargo, las ramas de los árboles pueden bifurcarse y crecer en paralelo. Lo mismo pueden hacer las ramas de Git. Lo que esto significa es que puedes trabajar en diferentes cosas simultáneamente sin incluir accidentalmente cosas que no tenías la intención de incluir(como hizo Norm).

<img width="739" alt="image" src="https://user-images.githubusercontent.com/23094588/209587545-2ac79d7f-7552-4460-96d8-deb773276cd6.png">

**Un commit representa un punto en el tiempo y una rama representa una serie de commits**. Recuerde que una serie de commits es también el **commit history(historial de commits)**. Entonces, ***las ramas son diferentes historiales de commits***, ¡todos en el mismo repositorio! En cualquier momento, puede optar por crear una nueva rama, cambiar entre ramas, descartar una rama (es decir, decidir abandonar todo el trabajo que le ha dedicado) e incluso fusionar ramas.

## “Actualización del menú del restaurante”

Hablando de tomar decisiones, felicitaciones por su nuevo trabajo: administrar el menú en **'80s Diner**, donde las deliciosas recetas se encuentran con la nostalgia.

Su función es preparar platos emocionantes y nutritivos para la temporada de otoño. Sin embargo, debe obtener la aprobación del chef y el equipo de cocina para asegurarse de que realmente puedan preparar sus deliciosos brebajes.

Ya está familiarizado con el uso de Git y repositorios de Git, por lo que se encarga de llevar el sistema de publicación de menús a la era moderna. (Sí, no se llaman a sí mismos el **'80s Diner** sin ningún motivo). Primero decide tomar su menú existente y ponerlo en un repositorio de Git antes de comenzar con cualquier trabajo nuevo.

<img width="748" alt="image" src="https://user-images.githubusercontent.com/23094588/209587636-8c1d5a5d-fb6b-4348-84c9-1f343ca07599.png">

### Lo primero es lo primero

Llevemos el **'80s Diner** al siglo XXI. Comenzaremos colocando su menú existente en un repositorio de Git. Esto nos dará la oportunidad de practicar algunas de nuestras habilidades de Git recientemente adquiridas.

1. Cree un nuevo directorio llamado **`80s-diner`** dentro del paraguas **`my-headfirst-git-samples`** y cambie a él usando el comando **`cd`**. Continúe e inicialice un nuevo repositorio de Git usando **`git init`**.

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

### 💻

1.

   ![image](https://user-images.githubusercontent.com/23094588/209944767-092e69f2-40dd-4a8c-8948-e828647599bb.png)

2.

   <img width="1207" alt="image" src="https://user-images.githubusercontent.com/23094588/209945037-b0780633-d28f-4f46-8fab-53d499db2edf.png">

   ![image](https://user-images.githubusercontent.com/23094588/209945286-ba982899-37ac-412a-af4f-9f4559fe6796.png)

3.

   ![image](https://user-images.githubusercontent.com/23094588/209945594-e0e99a33-95eb-46cd-bdfc-a0e76d62b22e.png)

4.

   ![image](https://user-images.githubusercontent.com/23094588/209945651-b3bc4b1e-b761-440e-8bc4-5a2232f6d3d7.png)

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

Para administrar branches en Git se usa otro comando llamado **`branch`**. Puede usar el comando **`branch`** para crear una nueva rama, enumerar todas las ramas en su repositorio e incluso eliminar ramas. Y, como todo lo que has hecho hasta ahora, todo esto sucede en la terminal dentro de tu directorio de trabajo.

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

**R**: No. Si desea un nombre de rama de varias palabras, use guiones o guiones bajos. Si intenta poner un espacio en el nombre de su branch, Git informará un error **`"is not a valid name"`**. ¡Sin embargo, se permiten las barras diagonales (**`/`**)!

Hablaremos más sobre los nombres de las branches al final de este libro, así que esté atento.

**P: ¿Qué sucede si intento crear una branch con un nombre que ya existe?**

**R**: Al igual que con un nombre de rama no válido, Git generará un error y le indicará que ya existe una rama con ese nombre. Es bueno adquirir el hábito de ejecutar **`git branch`** para ver una lista de todas las ramas en su repositorio antes de crear una nueva.

**P: ¿Cuántas branch puedo tener en mi repositorio de Git?**

**R**: ¡Tantos como quieras! Pero como veremos pronto, por lo general usará una rama para trabajar en un cambio pequeño y aislado, luego la **combinará(merge)* en una **rama de "integración"** cuando haya terminado, y luego eliminará la rama. Nos sumergiremos en las ramas de integración y la eliminación de ramas pronto. Esto le ayuda a mantener un buen repositorio ordenado.

<hr>

## "Cambio de pistas"

Ahora sabe cómo crear branch, pero también acaba de aprender que crear una nueva branch no significa que pueda comenzar a usarla. Para cambiar a otra rama, usará otro comando de Git llamado **`switch`**, que toma un argumento, a saber, el nombre de la rama a la que desea cambiar:

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

Te sientes bien. El menú de '80s Diner ahora se administra en un repositorio de Git. Y tienes una nueva solicitud: la gerencia planea introducir un menú especial de otoño, y su tarea es inventar algunos platos especiales y sobretodo espeluznantes con temas de Halloween. Te encargas de ver películas de terror de los años 80 para entrar en el estado de ánimo adecuado, y entras al trabajo rebosante de ideas para recetas.

Seamos diligentes y creemos una rama para que pueda iterar sobre las ideas del menú. Comenzaremos en la terminal:

<img width="954" alt="image" src="https://user-images.githubusercontent.com/23094588/209588922-b932e007-5eef-4113-942d-ae2170a344a6.png">

A continuación, cree una nueva rama llamada **`add-fall-menu`** y cambie a ella.

<img width="970" alt="image" src="https://user-images.githubusercontent.com/23094588/209588953-e54a3301-c054-4a7f-922d-0b6b4ce8f452.png">

Ya sabes que hacer. Aquí está su lista de verificación:

<img width="994" alt="image" src="https://user-images.githubusercontent.com/23094588/209589000-2aa5c909-760e-48d4-9cf7-f279bddb7783.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209949733-3eb46f86-429f-4d84-beac-2da4f99bd4a2.png)

![image](https://user-images.githubusercontent.com/23094588/209949985-e48ba0f7-b1b4-4cde-b8aa-9e6bb849a578.png)

<img width="1051" alt="image" src="https://user-images.githubusercontent.com/23094588/209950077-20bacf36-c67c-4d04-8fe1-a6d1db1a660b.png">

![image](https://user-images.githubusercontent.com/23094588/209950249-642ae6c8-f8c9-47a7-8537-8ecead9c7b51.png)

![image](https://user-images.githubusercontent.com/23094588/209950309-a224bde7-e63a-4d98-a12b-0d679b0a8bf9.png)


## "¡Devuelvelo!"

<img width="669" alt="image" src="https://user-images.githubusercontent.com/23094588/209589028-c7e87a49-871e-4dfa-8ff3-a42867252324.png">

¡UH oh! Le mostraste al personal de cocina tu menú de otoño recién creado, pero no están encantados con el tibio título del nuevo menú. Necesitan que sea un poco más emocionante, por lo que le piden que cambie el encabezado de "Fall Menu" a "The Graveyard Shift".

También podríamos hacer ese cambio. Regrese a su editor de texto y cambie la primera línea del archivo **`fall-menu.md`** de "Fall Menu" a "The Graveyard Shift". Asegúrese de guardar el archivo antes de continuar.

Comenzaremos comprobando nuestro estado de Git. Como editamos el archivo **`fall-menu.md`**, debería aparecer como "modified".

<img width="987" alt="image" src="https://user-images.githubusercontent.com/23094588/209589141-15c6c007-b1ea-4471-9239-d80e66112f77.png">

<img width="651" alt="image" src="https://user-images.githubusercontent.com/23094588/209589155-dc2792f0-7605-462a-9d15-ba12060ec8bf.png">

Eso se ve bien, así que sigamos adelante y commitemoslo. Comenzaremos agregando el archivo al índice y luego commitearlo. Usemos el mensaje "update heading(actualizar encabezado)":

<img width="965" alt="image" src="https://user-images.githubusercontent.com/23094588/209589203-c8c8a990-0015-49a4-8636-d231d8597ae0.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209950667-bf8a473b-be17-459a-a729-bbc57a455193.png)

![image](https://user-images.githubusercontent.com/23094588/209950957-0cb83bdc-a91e-4b06-95ec-c1dc54f76a8b.png)

![image](https://user-images.githubusercontent.com/23094588/209950999-9c8d0ba0-474b-4e3e-8220-4781d7cb8803.png)


### Imanes de código

<img width="254" alt="image" src="https://user-images.githubusercontent.com/23094588/209589235-288c51cd-1de4-4a80-b519-d590b934dc1f.png">

¡Oh querido! Para ayudar a nuestros compañeros desarrolladores, hemos diseñado cuidadosamente todos los comandos necesarios para enumerar todas las ramas en su repositorio (existente), crear una nueva rama, cambiar a ella y verificar que todo esté bien. ¡Pobre de mí! Los imanes cayeron al suelo. Es tu trabajo volver a armarlos. Ten cuidado; se mezclaron algunos imanes adicionales y algunos se usaron más de una vez.

<img width="1002" alt="image" src="https://user-images.githubusercontent.com/23094588/209589271-aa020bd4-0f40-45ed-aec4-758b68f23ab1.png">

**Mi Solución:**

```sh
git branch
git branch my-new-branch
git switch my-new-branch
git branch
```

**----------> Respuestas en “Code Magnets Solution”.**

<img width="601" alt="image" src="https://user-images.githubusercontent.com/23094588/209589310-e065fbd7-01d8-4ddf-b72e-fafdfd392ebd.png">

**¡Gran pregunta!** Puede que no lo parezca en este momento, pero las branches le ofrecen mucha flexibilidad a medida que comienza a trabajar con múltiples requisitos.

En este momento, tienes dos ramas: **`master`** y **`add-fall-menu`**. Inicializaste el repositorio, lo que te colocó en la rama **`master`**. Agregó y commiteo el menú existente en la rama **`master`**.

Cuando obtuviste los requisitos para el menú de otoño, elegiste hacer todo ese trabajo en una rama separada: a saber, la rama **`add-fall-menu`**.

Estas dos ramas representan dos requisitos completamente separados. Recuerde, las ramas le permiten aislar partes del trabajo entre sí. Si mañana la gerencia viniera y te pidiera que trabajes en algo que no tiene ninguna relación (¡y seguramente lo harán!), simplemente creas una nueva rama desde **`master`** y te pones a trabajar. Todo el trabajo que hizo en la rama **`add-fall-menu`** permanece intacto hasta que tenga la oportunidad de volver a él.

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

SE AÑADIRA OTRO NODO PARA REPRESENTAR AL NUEVO COMMIT.

**----------> Respuestas en “Sharpen your pencil Solution”.**

<hr>


## Branches, commits y los archivos contenidos dentro

Sabemos que los commits en una rama están **"sequenced(secuenciados)"**, es decir, son como los brotes en la rama de un árbol: uno viene después del siguiente. ¿Qué significa eso para los archivos, que conoce cada commit? Recuerde que los repositorios de Git están predeterminados en la rama **`master`**. Entonces, nuestro primer commit, que introdujo el archivo **`menu.md`**, estaba en la branch **`master`**.

<img width="1097" alt="image" src="https://user-images.githubusercontent.com/23094588/209849057-3bf23431-9530-4dc1-9e12-f75c1c81daed.png">

En este punto, teníamos un commit en la rama **`master`**. Cuando creamos la rama **`add-fall-menu`**, Git usó este commit como punto de partida para la nueva rama. En otras palabras, tanto la branch **`master`** como la branch **`add-fall-menu`** comparten este commit.

<img width="1101" alt="image" src="https://user-images.githubusercontent.com/23094588/209849424-ad0bbbe5-5bc4-4ba7-92b1-cc2ea0403b11.png">

Hasta ahora, solo hemos commiteado el archivo **`menu.md`**. Dado que tanto la rama **`master`** como la rama **`add-fall-menu`** apuntan al mismo commit, ambos conocen el mismo archivo **`menu.md`**.

Luego introdujimos el archivo **`all-menu.md`** en la rama **`add-fall-menu`** y lo commiteamos.

<img width="1141" alt="image" src="https://user-images.githubusercontent.com/23094588/209849934-13a41d27-c86e-4f5b-b5b9-919a10a8819f.png">

Dado que la rama **`add-fall-menu`** comenzó con el commit que incluía el archivo **`menu.md`** y luego introdujo el archivo **`fall-menu.md`**, ahora tiene ambos archivos. Pero la rama **`master`** solo tiene el commit con el archivo **`menu.md`**, por lo que la rama **`master`** solo tiene el archivo **`menu.md`**.

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850337-09d538e2-5da1-41ee-bf3f-9c0fafb09a59.png">

**Dedique un poco de tiempo a comprender cómo Git cambia su directorio de trabajo cuando cambia de rama.**

Comience con su terminal: asegúrese de estar en el directorio **`80s-diner`** y utilíce **`git branch`** para asegurarse de que está en la branch **`add-fall-menu`**.

<img width="733" alt="image" src="https://user-images.githubusercontent.com/23094588/209850722-1dc8b39b-9dd3-4102-9a66-55b8291d3b7b.png">

Finalmente, vea si puede explicar lo que está viendo aquí.

### 💻

![image](https://user-images.githubusercontent.com/23094588/209953278-98227a27-d5d0-4f1b-b762-b51940f20211.png)

<hr>

**NOTA**

La explicación va aquí.

EN LA RAMA **`master`** TENEMOS UN SOLO ARCHIVOS **`menu.md`**, EL CUAL FUE EL PRIMER ARCHIVO QUE CREAMOS Y COMMITEAMOS EN DICHA RAMA, UNA VEZ HECHO ESTO CREAMOS LA RAMA **`add-fall-menu`** A PARTIR DE LA RAMA **`master`** POR LO CUAL LA RAMA **`add-fall-menu`** CONOCE Y MANEJA EL ARCHIVOS **`menu.md`**, DESPUÉS SOBRE LA RAMA **`add-fall-menu`** CREAMOS EL ARCHIVO **`fall-menu.md`** EL CUAL COMMITEAMOS, LO MODIFICAMOS Y LO VOLVIMOS A COMMITEAR, COMO TODO ESTO LO HICIMOS EN LA RAMA **`add-fall-menu`**, QUEDA FUERA DEL ALCANCE DE LA RAMA **`master`**, **`master`** NO VE A EL ARCHIVO **`fall-menu.md`**. POR ESO CUANDO CAMBIAMOS DE RAMA, SE MUESTRAN DIFERENTES ARCHIVOS EN EL DIRECTORIO DE TRABAJO.   

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

### 💻

![image](https://user-images.githubusercontent.com/23094588/209955060-21e2602a-efcc-421c-a91a-97d8c6cd4b3f.png)

Observe como en VSC no nos aparece el archivo **`fall-menu.md`** el cual se encuentra en otra rama a la actual.

![image](https://user-images.githubusercontent.com/23094588/209955449-6ed48359-8a8c-4881-b69b-2df15d84bb04.png)

![image](https://user-images.githubusercontent.com/23094588/209955686-f9bdc7f6-20a5-40e2-a736-effdafd9dadb.png)

![image](https://user-images.githubusercontent.com/23094588/209955733-5ad01ef1-0a91-4160-9044-ebe10fa7fedc.png)

<img width="1050" alt="image" src="https://user-images.githubusercontent.com/23094588/209955831-46e9bad4-e90a-4d52-ad0c-2c86307c67d9.png">


<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Antes de continuar, vea si puede visualizar cómo se ve su historial de commits. Fuimos lo suficientemente amables para que comenzaras, pero necesitas terminarlo.

<img width="1022" alt="image" src="https://user-images.githubusercontent.com/23094588/209853417-580f736c-ee63-458e-9de5-bc643ad71dc3.png">

EL DIBUJO DEBERÍA TENER UNA RAMA EN LA PARTE DE ABAJO CON UN COMMIT QUE REPRESENTA LA SUNIDA DEL ARCHIVO **`thursdays-menu.md`**

**----------> Respuestas en “Sharpen your pencil Solution”.**

<hr>

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850368-57d82652-76aa-43cb-b2eb-27a73c6f6e70.png">

Repitamos nuestro ejercicio anterior de visitar todas las branches en nuestro repositorio y enumerar los archivos que están presentes en cada branch, excepto que esta vez tenemos tres branches. Para cada una de las ventanas que se muestran a continuación, anote el resultado de la invocación **`git branch`** y luego enumere todos los archivos en cada rama:

<img width="1165" alt="image" src="https://user-images.githubusercontent.com/23094588/209853943-c2fdb783-c7d5-472d-96bc-3aef8d1d6381.png">

### 💻

1. **`master`**
 
   ![image](https://user-images.githubusercontent.com/23094588/209957613-e5b1e7d6-5093-40e1-a04c-df8a1ad3a966.png)
   
   ![image](https://user-images.githubusercontent.com/23094588/209958473-891b7215-1b7f-4922-ae37-c3a93f0221c4.png)


2. **`add-fall-menu`**

   ![image](https://user-images.githubusercontent.com/23094588/209958713-5aa9bc9a-b33f-4425-8e36-986a93fd9e2a.png)

   ![image](https://user-images.githubusercontent.com/23094588/209958819-b974880a-cf59-4132-9db6-268594112e2d.png)


3. **`add-thurs-menu`**

   ![image](https://user-images.githubusercontent.com/23094588/209958972-33401b08-8b99-4264-96a4-d39d00549553.png)

   ![image](https://user-images.githubusercontent.com/23094588/209959080-a7613f6c-a3fb-4410-a0ab-c99946a359b0.png)

**---------->  Respuestas en “BE Git Solution”.**

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854126-73eb8d40-c36b-40fb-807c-ddfd68d0dc6d.png">

Imagina que hubiera una manera de combinar las tres ramas diferentes en una sola rama. ¿Cómo sería su directorio de trabajo? ¿Cuántos archivos habría como resultado de integrar las tres ramas en una?

SI INTEGRARAMOS LAS 3 RAMAS EN UNA SOLA EXISTIRIAN 3 ARCHIVOS EN ELLA: **`menu.md`**, **`fall-menu.md`** y **`thursdays-menu.md`**

<hr>

## “¿Qué es una rama, realmente?”

Dígalo con nosotros: **una rama es simplemente una referencia a un commit**. Entonces, ¿qué hace que una rama sea una rama? Comencemos con la función de un commit: **un commit es una instantánea del contenido que preparó (es decir, los archivos que agregó al índice)**. Si está trabajando en una tarea en la que ha realizado dos o más commits, entonces los commits se **"encadenan(strung)"**. Es decir, cada commit subsiguiente registra el ID del commit anterior.

<hr>

**NOTA**

Hablamos de esto en el Capítulo 1 .

<hr>

<img width="1118" alt="image" src="https://user-images.githubusercontent.com/23094588/209854685-fa11a411-32a7-47bb-bd2d-e65a677f3724.png">

Imagina que tienes una nota separada para cada rama en tu repositorio. Cada nota tiene el nombre de la rama y el ID del último commit en esa rama. Cuando realizas un commit en una rama, Git primero crea el commit. Luego toma la "nota adhesiva" que representa esa rama, borra el **ID del commit** que estaba en ella y escribe el del nuevo commit:

<img width="1121" alt="image" src="https://user-images.githubusercontent.com/23094588/209855026-e6048cb3-48aa-4e53-98be-518e612dcbe2.png">

Una rama siempre apunta al último commit de esa rama, y cada commit, a su vez, apunta a otro commit(su commit "parent"), y así sucesivamente.

**Una rama es simplemente una referencia a un commit a través de su ID. Esta referencia se actualiza cada vez que realiza otro commit en esa rama.**

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Mire el gráfico de commits hipotético a continuación y complete las notas adhesivas con la información necesaria para asociar un nombre de rama con el ID de commit al que apunta. Tenga en cuenta que puede haber más notas adhesivas de las que realmente necesita.

<img width="1156" alt="image" src="https://user-images.githubusercontent.com/23094588/209855496-45ed5cd7-91bb-47e4-947b-80bbe09dbaee.png">

**MI SOLUCIÓN:**

master - A,      update-icon - C,     fix-header - F

Ahora supongamos que cambiamos a la rama **`fix-header`**, hacemos algunas ediciones y hacemos otro commit, a la que se le asignó la ID "G". ¿Puedes visualizar qué cambiaría en el diagrama de arriba?

**MI SOLUCIÓN:**

En la rama **`fix-header`** se añade un nuevo nodo **G**

<hr>

**NOTA**

Dibuje el historial de commits y la nota adhesiva actualizada aquí.

<hr>

**----------> Respuestas en “Sharpen your pencil Solution”.**

## "¿Cambiar de rama o cambiar de directorio?"

¿Recuerda todos esos ejercicios que le hicimos hacer en los que cambiaba de rama y enumeraba los archivos en su directorio de trabajo? Bueno, todo ese trabajo duro está a punto de dar sus frutos. Estás a punto de entender lo que significa cambiar de rama.

Recuerde, las ramas son solo punteros a commits. Y un commit es simplemente una instantánea de todo lo que agregó al index, junto con algunos metadatos, incluido el mensaje de confirmación que proporcionó cuando creó el commit. En otras palabras, el commit recuerda el estado del index en el momento en que realizó el commit.

Volvamos al gráfico de commits que creaste para el ’80s Diner. Te lo hemos anotado, mostrándote los archivos que encontrarás en cada rama:

<img width="1155" alt="image" src="https://user-images.githubusercontent.com/23094588/209856333-3f865d1f-212c-4b3c-9ddd-f027777509d2.png">

Como puedes ver, cada vez que cambias de rama, estás cambiando potencialmente de commit (a menos que las dos ramas en cuestión apunten al mismo commit). Y un commit registra el estado del index cuando realizó el commit. Lo que significa...

**Cada vez que cambias de rama, Git reescribe tu directorio de trabajo para que luzca como cuando hiciste el commit más reciente en la rama a la que acabas de cambiar.**

<hr>

**NOTA**

Es muy importante entender esto. Así que tómate un descanso, aléjate, piénsalo y luego regresa a este libro.

<hr>

<hr>

**NOTA**

Esto es particularmente importante si tiene archivos abiertos en su editor. Es una buena idea actualizar los archivos en su editor o simplemente volver a abrir el proyecto después de cambiar de rama para ver el último conjunto de archivos.

<hr>

<img width="903" alt="image" src="https://user-images.githubusercontent.com/23094588/209856961-bd69434b-d843-43ea-b643-95a715263d76.png">

**¡Sí!** Piensa en tu película o programa de televisión favorito. Casi cualquier historia deslumbrante tiene una serie de argumentos más pequeños que apoyan el arco principal, y lo que hace que el final sea verdaderamente satisfactorio es que todas las tramas secundarias finalmente atan la narrativa principal con un lazo.

<hr>

**NOTA**

Sí, a menudo también nos han decepcionado. Pero no agonicemos por todas esas horas “Perdidas”.

<hr>

Puede pensar en las ramas que crea para trabajar en una tarea o historia en particular como tramas secundarias que eventualmente deben vincularse con la historia principal. Piense en el trabajo que ha realizado hasta ahora en el '80s Diner: tiene ideas para diferentes menús, pero una vez que todos los involucrados firman, desea que los tres menús estén en la misma rama. Es decir, desea fusionar las tres ramas en una sola.

### Algunas ramas son más iguales que otras

Sabemos que tener menús separados viviendo en branches separadas no es lo que queremos. Eso plantea la pregunta : ¿en qué rama debería vivir todo?

Recuerde que cuando inicializa un nuevo repositorio de Git, siempre comienza con una rama llamada **`master`**. Dado que esta rama se crea de forma predeterminada, ¡siempre está ahí! Muchos equipos simplemente usan la rama **`master`** como la rama que albergará la historia principal de su proyecto.

Esto a menudo se conoce como una **rama de "integración"**, ya que aquí es donde reúne todas las diferentes tareas en las que trabajó en otras ramas.

Elegir **`master`** es a menudo sólo una cuestión de conveniencia. Puede optar por convertir cualquier rama en la rama de integración. Mientras usted y sus colegas estén de acuerdo, todo está bien.

Mientras elige los nombres de las branches, también puede elegir un buen nombre. Una opción popular es **"`main`"** en lugar de **`master`**.

Entonces, ***las ramas de integración son donde las cosas se unen***. ¿Qué significa eso para todo lo demás? Otras ramas a menudo se denominan ramas **"feature(características)"**, esencialmente ramas que sirven para presentar una cosa. Estas ramas servirían para agregar una nueva función, corregir un error o agregar y mejorar la documentación. Esencialmente, son una y están listas: para cada tarea separada, habría una rama de función diferente.

<hr>

<img width="960" alt="image" src="https://user-images.githubusercontent.com/23094588/209588029-ec1d2f5b-0d40-4f2b-8775-37ea47551cba.png">

Las ramas de **"feature(características)"** a menudo se denominan ramas de **"topic(tema)"**. Son esencialmente lo mismo.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Mencionamos que muchos equipos usan nombres como **`main`** en lugar de **`master`** para ramas de integración. ¿Se te ocurre algún otro nombre? Enumere algunos aquí (siéntase libre de usar su motor de búsqueda favorito para obtener algunas ideas):

**MAIN, INITIAL, DEVELOP, PRINCIPAL.**

**----------> Ideas en “Sharpen your pencil Solution”.**

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

Digamos que tiene un montón de imágenes en una carpeta en su computadora y otras en alguna otra carpeta. Además, hay algunos duplicados entre los dos. ¿Puede pensar en algún problema que podría enfrentar si intentara combinar todos los archivos de ambas carpetas?

**SE PUEDEN SOBREESCRIBIR FOTOS QUE TENGAN EL MISMO NOMBRE PERO SU CONTENIDO SEA DIFERENTE.**

<hr>

## "¡Tráelo dentro!"

Las **ramas de integración** juegan un papel fundamental en su repositorio de Git. Recuerde, lo que hace que una rama de integración sea especial es solo una convención; cualquier rama se puede convertir en ***una rama de integración sirve como el lugar donde todo, grande y pequeño, funciones y correcciones de errores, se une**.

Reunir el trabajo que se realizó en ramas separadas se llama ***fusionar(merging)***, y Git tiene un comando específicamente integrado para hacer precisamente eso: **`merge`**. El comando **`git merge`** le permite combinar el trabajo realizado en diferentes ramas.

La fusión en Git generalmente involucra dos ramas: ***la rama en la que se encuentra***(nos referiremos a esto como el **"proposer(proponente)"**) y ***la rama que desea fusionar o "mezclar"***(la llamaremos **"proposee(propuesto)"**) .

Como estamos tan obsesionados con la comida, ¡vamos a duplicarlo! Piensa en hornear un pastel. Puedes empezar a preparar el glaseado ya que el bizcocho tiene que enfriarse al salir del horno. En algún momento, desea "fusionar" los dos juntos. Aquí, el pastel sería el proponente y el glaseado sería el propuesto.

Continuemos con esa analogía (oh, sí, ¡la estamos duplicando!): digamos que tiene dos ramas en su repositorio **`bake-cake`**, y **`prepare-icing`**.

<img width="933" alt="image" src="https://user-images.githubusercontent.com/23094588/209858878-47bbdcfb-0cb8-4ff2-900a-ed8317370f27.png">

Luego, simplemente le decimos a Git que fusione la rama **`prepare-icing`** con la rama **`bake-cake`**, así:

<img width="953" alt="image" src="https://user-images.githubusercontent.com/23094588/209859114-02cf2ea7-b9ad-485d-aebe-7ab127dee52e.png">

¿Suena complejo? No se preocupe, lo haremos con calma, un pequeño paso a la vez.

<hr>

<img width="1156" alt="image" src="https://user-images.githubusercontent.com/23094588/209859334-284bc68e-5061-4e40-a464-a4f8c70f0635.png">

*Las rosas son rojas, las violetas son azules, mantienen* **las feature branches** para lo* **único** *que hacen.*

*Las rosas son tuyas, las violetas son mías, usa* **las ramas de integración** *cuando sea el momento de combinar.*

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Digamos que asististe a la boda de un amigo. Tomaste algunas fotos con tu teléfono y, unos días después, el fotógrafo de la boda te pide que les envíes las fotos que tomaste. Haces una copia de las fotos de la boda en tu teléfono y les envías la copia para que puedan combinarlas con las que tomaron.

Ahora tómese unos minutos para pensar en las siguientes preguntas:

* ¿Quién tiene el conjunto “completo” de imágenes?

<hr>

**NOTA**

Complete sus respuestas aquí. 

**el fotógrafo de la boda**

<hr>

* ¿Alguno de ustedes perdió alguna foto?

<hr>

**NOTA**

Complete sus respuestas aquí.

**No**

<hr>

* ¿Cuál de ustedes es la rama de “integración” en este escenario?

**el fotógrafo de la boda**

<hr>

**NOTA**

Complete sus respuestas aquí.

<hr>

**----------> Respuestas en “Sharpen your pencil Solution”.**

<hr>

<img width="915" alt="image" src="https://user-images.githubusercontent.com/23094588/209860101-33998cb8-89ab-4b01-a305-cbaa04e92e03.png">


## "Lea el manual #&$!@ (git branch edition)"

Git intenta ser muy útil y viene cargado con un manual completo. La buena noticia es que no tiene que recordar todos los matices de cada comando de Git (y hay **muchos** comandos), simplemente puede pedirle a Git que lo ayude. Si usted es el tipo de persona que lee documentación técnica por placer, querrá ejecutar **“`git <command> --help`”**, por ejemplo, **`git branch --help`**. Esta es la enchilada completa: todo lo que necesita saber sobre el comando **`branch`** se enumera aquí, ¡incluidos ejemplos de uso! Esta es una página a la que querrá volver una vez que tenga experiencia práctica con Git.

### 💻

![image](https://user-images.githubusercontent.com/23094588/209977387-213de556-4f47-4307-b865-14a771eb3da3.png)

Use las fechas de arriba y abajo para desplazarse.

![image](https://user-images.githubusercontent.com/23094588/209977464-1f48e3f9-b224-4b41-bf80-5b78e96b29b5.png)


<hr>

**NOTA**

Disculpas por el intermedio, pero esta digresión nos ayudará en unos minutos.

<hr>

<hr>

**NOTA**

También puede usar **"`git help <comando>`"**, que es un alias para **"`git <comando> --help`"**.

<hr>

Si tiene prisa, o simplemente es una persona de CliffsNotes, entonces la versión que desea es **"`git <command> -h`"** así: **`git branch -h`**. Esta es una versión mucho más corta de la página de ayuda. Por supuesto, si algo te llama la atención pero no entiendes qué hace o cómo usarlo, siempre puedes usar la versión más larga (**`--help`**) para obtener más detalles.

### 💻

![image](https://user-images.githubusercontent.com/23094588/209977788-637de87b-bc8b-4f01-9fca-47dab8289021.png)

<hr>

**NOTA**

Aquí está su truco de memoria del día: **"`--help`"** tiene más caracteres que **"`-h`"**, al igual que la página **`--help`** tiene más caracteres y detalles que la página **`-h`**.

<hr>

Git por defecto usa un **"pager(localizador)"** cuando muestra salidas largas, ya sabes, como páginas de ayuda. Un ***pager*** es simplemente un programa que solo muestra una página de texto a la vez. Puede usar las teclas del cursor para navegar hacia arriba y hacia abajo en la página, una línea a la vez. Una vez que haya terminado, presione la letra **"`q`"**, que significa **"quit(salir)"**, y su terminal volverá al prompt.

<img width="944" alt="image" src="https://user-images.githubusercontent.com/23094588/209863240-70e15c07-9b83-4896-b5af-da3c480e2545.png">

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

En el directorio **`80s-diner`**, continúe y ejecute **`git branch --help`** (o **`git help branch`** use cualquiera de los dos), y busque la sección relacionada con el indicador **`-v`** o la bandera **`--verbose`**. **Lea sobre lo que hace**.

A continuación, ejecute **`git branch -v`** y registre aquí el nombre de la rama y el ID de commit más reciente. (Los necesitará para las próximas secciones de este capítulo).

<img width="972" alt="image" src="https://user-images.githubusercontent.com/23094588/209863800-825f9358-d89e-4f67-9313-2f76e491da1d.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209978272-0e4d94d8-3d25-4324-af85-4885087b2bb9.png)

```sh
-v, -vv, --verbose
   
   Cuando esté en el modo lista, muestre sha1 y commit la línea de asunto para cada head, junto con la relación con la rama ascendente(si corresponde). Si se da dos veces, imprima la ruta del el árbol de trabajo vinculado(si lo hay) y el nombre de la rama ascendente también(ver también git remote show <remote>). Tenga en cuenta que el HEAD del árbol de trabajo actual no tendrá su ruta impresa(siempre será su directorio actual).
```

![image](https://user-images.githubusercontent.com/23094588/209978419-a3443230-e3d9-43c3-961a-214cd3a32b3f.png)


**---------->  Respuestas en “Exercise Solution”.**

<hr>

### Oficialización del menú de otoño

<img width="742" alt="image" src="https://user-images.githubusercontent.com/23094588/209864332-583db1cb-89d7-40bd-ad01-a8cc542cf748.png">

De vuelta en el '80s Diner, después de semanas de espera, los chefs aprobaron su propuesta para el menú de otoño. Les encantan los platos nuevos que has creado y se están preparando para la noche del lanzamiento. Parece que ha terminado con su trabajo en esa característica. ¿Y ahora que?

Nos apegaremos a **la convención estándar de usar la rama `master` como la rama de integración**. Eso significa que todo el trabajo debe fusionarse en la rama **`master`**. Así que hagamos eso.

De vuelta en la terminal, cd en el directorio **`80s-diner`**. Primero, un chequeo de cordura para asegurarnos de que estás en un buen lugar: **`git status`**.

<img width="983" alt="image" src="https://user-images.githubusercontent.com/23094588/209864588-6d57026b-3fb9-438b-933d-15fa42c09951.png">

Dado que la rama **`master`** es la rama de integración, debe fusionar la rama **`add-fall-menu`** en la rama **`master`**. Primero tendrá que cambiar a la rama **`master`** y luego fusionar la rama **`add-fall-menu`**.

<img width="984" alt="image" src="https://user-images.githubusercontent.com/23094588/209864833-26677099-d67a-492c-83cc-75a71497a434.png">

Ahora, si tuviera que enumerar todos los archivos que forman parte de la rama **`master`**, verá que la rama **`master`** tiene dos archivos: **`menu.md`** y **`fall-menu.md`**! Es decir, la rama **`master`** refleja el trabajo que se hizo en las dos ramas por separado.

<img width="942" alt="image" src="https://user-images.githubusercontent.com/23094588/209865073-a147809d-8be3-4ada-9eaa-a4b51dcf8979.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209979825-d46bd94e-2ed3-4857-a789-50fd2329c26e.png)

![image](https://user-images.githubusercontent.com/23094588/209979957-f1f3a3c6-748f-4b5c-8d3e-14d1312f381a.png)

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Por qué no fusionamos la branch `master` en la branch `add-fall-menu`?**

**R**: Tienes toda la razón al hacer esa pregunta. Hay dos cuestiones separadas aquí.

Primero, considere la intención: si la rama **`master`** es la rama de integración, entonces todo debería fusionarse en la rama **`master`**.

En segundo lugar, fusionar significa reunir varias líneas de trabajo diferentes, lo que tiene un efecto en el historial de commits de su proyecto. Lo que se fusiona con lo que tiene implicaciones profundas sobre cómo se producirá la fusión y cómo será el resultado final. Sí, eso suena confuso, así que vamos a pasar mucho tiempo en este capítulo hablando exactamente de eso. Más en unas pocas páginas.

**P: Bien, entonces me está diciendo que el trabajo que hicimos en la branch `add-fall-menu` ahora se fusionó con la branch `master`. Entonces, ¿qué pasa con la rama `add-fall-menu`?**

**R**: Por ahora, puedes dejarlo estar. Si recibe otra solicitud para realizar cambios adicionales en el menú de otoño, debe crear una nueva rama basada en **`master`**, realizar sus cambios y, cuando termine, simplemente fusionarse nuevamente en master.

La respuesta a su pregunta radica en la eliminación de ramas, de lo que hablaremos al final de este capítulo.

**P: Tengo un error `merge: not something we can merge`. ¡Ayuda!**

**R**: ¡Asegúrese de obtener el nombre correcto de la branch! Recomendamos encarecidamente enumerar todas sus branches y copiar y pegar el nombre para evitar tales errores.

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

Reforcemos un poco más nuestras habilidades de línea de comandos. Vas a repetir nuestro ejercicio anterior de enumerar los últimos ID de commit en cada rama. Recuerda que puedes usar **`git branch -v`** y ver información de cada una de tus branches. Adelante, hazlo de nuevo:

<img width="958" alt="image" src="https://user-images.githubusercontent.com/23094588/209865963-2e85ec8d-98e3-41ce-8bbe-c0a24ced10aa.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209980340-141bec62-f147-4c75-baa0-0621ef09a561.png)

Compáralas con las que hiciste la última vez. ¿Qué cambió?

**TANTO LA RAMA `master`COMO LA RAMA `add-fall-menu`AHORA APUNTAN AL MISMO COMMIT**

Finalmente, enumere los archivos en cada rama. Comience con la rama **`master`**, luego **`switch`** a la rama **`add-fall-menu`** y finalmente a la rama **`add-thurs-menu`**, usando **`ls`** para enumerar los archivos que ve en cada rama:

<img width="951" alt="image" src="https://user-images.githubusercontent.com/23094588/209866207-f6aee6fb-ee2d-45d3-8554-201daaef0824.png">

### 💻

1. **`master`**
 
   ![image](https://user-images.githubusercontent.com/23094588/209980866-186c4859-11d0-4bde-9a94-e1eecb56804c.png)

   ![image](https://user-images.githubusercontent.com/23094588/209980933-27acf95d-99e2-43a0-b71d-6faed80573c7.png)


2. **`add-fall-menu`**

   ![image](https://user-images.githubusercontent.com/23094588/209981063-e0f48c08-b473-4700-9035-4a91a8dd19f3.png)

   ![image](https://user-images.githubusercontent.com/23094588/209981166-29dac1d4-ac80-40b2-b26e-ed86cd7bb1f9.png)

3. **`add-thurs-menu`**

   ![image](https://user-images.githubusercontent.com/23094588/209981320-bb6bf673-f4f4-4f5b-8486-c0f63e5339e1.png)

   ![image](https://user-images.githubusercontent.com/23094588/209981374-aae3ddc5-acfe-4f15-9e62-cfa326a11737.png)

**---------->  Respuestas en “Exercise Solution”.**

<hr>

## "Algunas merges(fusiones) son fast-forward(de avance rápido)"

Cuando fusiona dos ramas, está combinando el trabajo realizado en las ramas individuales: es decir, está reuniendo dos historiales de commits separados. Es posible que también haya notado el "fast-forward(avance rápido)" que apareció en la salida de su terminal cuando realizó la combinación entre **`master`** y la rama **`add-fall-menu`**. Entonces, ¿qué hizo realmente Git?

Comencemos con el historial de commits, centrándonos solo en **`master`** y **`add-fall-menu`**. Para simplificar, usaremos letras en orden alfabético para representar los ID de commit. Se parece a esto.

<img width="947" alt="image" src="https://user-images.githubusercontent.com/23094588/209866737-d99ae34c-1a89-408c-9a27-be486a4f0c8a.png">

En este escenario, tenemos dos notas adhesivas para representar las dos ramas, cada una de las cuales apunta al último commit en su rama. Lo que hay que notar aquí es que la rama **`add-fall-menu`** se baso en el último commit de la rama **`master`**. La rama **`master`** no ha cambiado (no hay nuevos commits en ella) desde el inicio de la rama **`add-fall-menu`**. En otras palabras, ¡la rama **`add-fall-menu`** tiene todo lo que hace la rama **`master`**! Lo que significa que, para que Git haga que **`master`**(el proponente) se vea como **`add-fall-menu`**, Git simplemente podría mover **`master`** para que apunte al último commit en la rama **`add-fall-menu`**.

Eso es exactamente lo que hace Git. Git vuelve a escribir la nota adhesiva para **`master`** que apunte al mismo commit al que apunta la nota adhesiva de **`add-fall-menu`**. Esto se conoce como **“fast-forward” merge**, donde una rama, en este caso **`master`**, ***simplemente salta hacia adelante(forward)***.

<img width="990" alt="image" src="https://user-images.githubusercontent.com/23094588/209867818-cea95eb6-8935-4dea-ba1b-6303fe2166fb.png">

Cuando mergea, la fast-forward merge(fusión de avance rápido) es el mejor de los escenarios, ya que técnicamente no es una fusión en absoluto. **Es simplemente una rama que "se pone al día" con otra**.

Mire hacia atrás y estudie los **ID de commit** que enumeró en la página anterior. Observe que tanto la rama **`add-fall-menu`** como la rama **`master`** apuntan al mismo commit después de la fusión(merge).

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

¿Puedes pensar en una analogía que pueda explicar una fast-forward merge? Piensa en **“merging(fusionar)”** el color naranja (compuesto por amarillo y rojo) y el color amarillo. ¿Qué significa **“merging(fusionar)”** el amarillo con el naranja?

<hr>

## "No funciona del todo de la otra manera"

<img width="952" alt="image" src="https://user-images.githubusercontent.com/23094588/209868448-ae433521-876a-4a08-adca-587f1e58768b.png">

Pensemos en un hipotético: ¿qué pasaría si, en lugar de fusionarnos con la rama **`add-fall-menu`** en **`master`**, intentáramos fusionarnos **`master`** con la rama **`add-fall-menu`**? Resulta que, si bien esto puede no ser obvio, es absolutamente importante cómo realizamos la fusión.

Primero, un resumen de cómo se vería la configuración. Esta vez, **`add-fall-menu`** es el proponente(proposer) y **`master`** es el propuesto(proposee). Así que comenzaríamos por cambiar a **`add-fall-menu`**, luego fusionaríamos la rama **`master`** en **`add-fall-menu`**.

Así es como se desarrollaría esto:

<img width="932" alt="image" src="https://user-images.githubusercontent.com/23094588/209868885-0a1dda51-914f-4cb5-a037-94a4082dc7ec.png">

Womp Womp. No es exactamente lo que esperabas, ¿eh? Para comprender lo que sucedió aquí, volvamos al historial de commits. Así es como se veía el historial de commits antes de fusionar **`add-fall-menu`** con **`master`**.

<img width="984" alt="image" src="https://user-images.githubusercontent.com/23094588/209869083-d8395aca-1565-46e7-accb-791ebbd801b6.png">

Fusionar(Merging) **`master`** en **`add-fall-menu`** es solo otra forma de  decir "Oye, Git, **`add-fall-menu`** debería ser la combinación de **`add-fall-menu`** y **`master`**". Bueno, **`add-fall-menu`** se basa en **`master`**, lo que significa que ya *tiene* todo lo que **`master`** tiene para ofrecer.

<hr>

**NOTA**

Recuerde, **`master`** no tiene nuevos commits desde que creamos la rama **`add-fall-menu`**.

<hr>


Entonces Git nos dice que **`add-fall-menu`** "Already up to date.(Ya está actualizado)". Es decir, **`add-fall-menu`** ya es la combinación de **`add-fall-menu`** y **`master`**. Para decirlo en términos del historial de commits, nada cambió ya que no había nada que hacer.

Lógicamente, la "dirección" de la combinación siempre da como resultado que dos archivos (**`menu.md`** y **`fall-menu.md`**) estén presentes en el directorio de trabajo. Recuerde: la rama **`add-fall-menu`**, al estar basada en **`master`**, ya tiene el archivo **`menu.md`** porque comenzó con él. Pero el orden de la fusión tiene un gran impacto en su historial de commits, como acabamos de ver. En un caso, **`master`** hizo un fast-forwarded(avance rápido) y avanzo al commit al que apunta **`add-fall-menu`**; en el otro caso, nada cambió, **`master`** se queda apuntando al primer commit.

## "Un poco más de configuración de Git"

Antes de continuar con el resto del capítulo, debemos realizar una actualización de configuración más en Git. Tal vez recuerde que nosotros, en el Capítulo 1 , configuramos nuestro nombre y dirección de correo electrónico, que se registra en cada commit que hacemos. Sin embargo, hay momentos en los que es Git el que necesita realizar un commit(veremos este escenario en las próximas páginas). Pero para hacerlo, Git necesita un mensaje de commit. Hasta ahora, solo ha sido usted quien ha creado commits, y cada vez que lo hizo, proporcionó un mensaje de commit utilizando el indicador **`-m`** proporcionado al comando **`commit`**. Sin embargo, si Git alguna vez necesita crear un commit, Git le presentará un editor de texto para escribir su mensaje de commit. La pregunta es: ¿qué editor debería usar?

Git está configurado para usar un editor predeterminado, que es **Vim**. Si está familiarizado con el uso de **Vim**, no dude en omitir esta página y pasar a la siguiente. Sin embargo, si desea cambiar a un editor con el que está más familiarizado, siga leyendo.

En la introducción de este libro, le recomendamos que instale Visual Studio Code. Si está utilizando Visual Studio Code, encienda su terminal y ejecute este pequeño fragmento de código.

<img width="1130" alt="image" src="https://user-images.githubusercontent.com/23094588/209870781-f3d9c8d4-329d-4cd9-a1e6-a28bf1a911d6.png">

Dado que Git no ofrece confirmación de que algo, cualquier cosa, sucedió, sigamos adelante y confirmemos que nuestra configuración se mantuvo:

<img width="1140" alt="image" src="https://user-images.githubusercontent.com/23094588/209870878-34951e6d-4427-440d-9318-0a7fd193f613.png">

### 💻

![image](https://user-images.githubusercontent.com/23094588/209983768-e592dfa9-d0ef-4be0-b40d-d300da02161c.png)

**NOTA**

Como en un ejercicio futuro vimos que no funciono abrir el editor VSC, he vuelto a poner el editor por default VIM con el siguiente comando.

![image](https://user-images.githubusercontent.com/23094588/210135775-8dd7bf6a-4d17-494e-836f-252998986e0f.png)

el último comando nos abre la configuración de Git en el editor por default, en este caso VIM.

![image](https://user-images.githubusercontent.com/23094588/210135798-a65d6676-a3b7-498a-a5f8-e5ad9a82c7e6.png)

Para salir de el presionamos **ESC + : + q**.


Por supuesto, no tiene que usar Visual Studio Code. Siéntase libre de apegarse al editor de su elección: **Notepad++**, **Emacs**, **Sublime Text**, o lo que sea que le guste. Dado que hay demasiados para enumerarlos aquí, lo alentamos a que inicie su motor de búsqueda favorito y busque **"`how do I set up <insert text editor name here> as my Git editor(cómo configuro <inserte el nombre del editor de texto aquí> como mi editor de Git)`"**. Lo único que debería cambiar es el argumento que proporciona en lugar de **"`code -w`"**.

<hr>

**NOTA**

Bueno, está bien, mentimos: le pedimos que no use el **Bloc de notas**, que es el editor predeterminado que se incluye con Windows. Tiene suficientes pequeñas molestias que es mejor que uses otra cosa.

<hr>

<img width="554" alt="image" src="https://user-images.githubusercontent.com/23094588/209871246-a24262cf-0725-488e-95a6-c596e0a30baf.png">

**¡Gran pregunta!** Los últimos ejercicios le han mostrado lo importante que es poder visualizar el historial de commits para que pueda comprender por qué Git se comporta de la forma en que lo hace.

Todo lo que hemos hecho hasta ahora, incluida la creación de commits y ramas y la fusión de ramas, ha implicado interactuar con el historial de commits. Los nuevos commits se encadenan junto con sus commits padres en la misma rama; las ramas son notas adhesivas que apuntan a commits; y las fusiones sirven para unir dos ramas (dos historias de commits separadas).

**¡En verdad, la iluminación de Git radica en comprender el historial de commits!**

Además, casi todos los temas que tratamos en este libro girarán en torno a este gráfico.

Hay una gran cantidad de herramientas de interfaz gráfica de usuario (GUI) que le permiten trabajar con Git. Hasta ahora, solo hemos usado las herramientas de línea de comandos de Git, pero una vez que haya avanzado lo suficiente en su viaje con Git, también puede comenzar a usar las herramientas de GUI. ¿Y adivina qué? ¡Todos te muestran el mismo gráfico de historial de commits! Estás justo por delante de la clase en ese sentido. ¿No estás contento de haber comprado este libro?

<img width="1003" alt="image" src="https://user-images.githubusercontent.com/23094588/209871707-5c74c313-078c-416b-9383-0df67dd83ac0.png">

### ¡Ya casi es jueves!

El menú de otoño recién bautizado es un éxito. The '80s Diner nunca ha visto tanto tráfico peatonal, y el negocio está en auge. La gerencia quiere capitalizar todo el alboroto iniciando Throwback Thursdays *ahora*.

Hemos decidido utilizar la rama **`master`** como la rama de integración. Ahora que el menú del jueves ha recibido la aprobación, vamos a fusionar la branch **`add-thurs-menu`** en la branch **`master`**. Pero antes de comenzar, recuerde: la rama **`add-thurs-menu`** se creó a partir de la rama **`master`**. Fusionar la rama **`add-fall-menu`** en **`master`** resultó en un **fast-forward**; en otras palabras, **`master`** simplemente avanzó hasta el último commit de **`add-fall-menu`**.

<img width="1179" alt="image" src="https://user-images.githubusercontent.com/23094588/209872318-4654bb3b-812d-443b-aec5-ba755fa15432.png">

Ya deberías estar en la rama **`master`** si dejaste las cosas como estaban después de tu último ejercicio, pero para estar seguro:

<img width="1113" alt="image" src="https://user-images.githubusercontent.com/23094588/209872678-a2fd6839-9417-481f-8cc8-0ed9450f55b7.png">

Estás listo para mergear.

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

Dejando de lado los tecnicismos de la fusión, ¿puede enumerar los archivos que resultarían si fusionara la rama **`add-thurs-menu`** con la rama **`master`**? ¿Cuántos archivos vería en el directorio de trabajo?

DEBERÍAN ESTAR LOS 3 ARCHIVOS CREADOS: **`menu.md`**, **`fall-menu.md`** y **`thursdays-menu.md`**

<hr>

## "¡Espera! ¿Te moviste?"

Puede ser un poco sorprendente que, aunque **`add-thurs-menu`** se basó en la rama **`master`**, la rama **`master`** se ha movido desde entonces a un nuevo commit. **Aquí es donde es importante darse cuenta de que cada vez que ramificas(you branch), en realidad estás creando una rama que apunta a un commit, no a otra rama**. **Las ramas, al ser simples punteros a los commits**, ofrecen una manera fácil de llegar a los commits. Recuerda, **la "base" de la rama es *siempre* un commit**.

<hr>

**NOTA**

A menudo escuchará a otros desarrolladores decir “Go ahead. Branch off master.(Avanzar. Maestro de ramificación.)” Lo que realmente están diciendo es crear una nueva rama que apunte al mismo **commit** al que apunta la rama **`master`** en ese momento.

<hr>

Entonces, ¿qué significa fusionar **`add-thurs-menu`** en la rama **`master`**? La respuesta está, por supuesto, en el historial de commits.

![image](https://user-images.githubusercontent.com/23094588/209987184-02a8005a-ccda-4a44-8dc9-775bd89a6d31.png)

Tenga en cuenta que tanto la rama **`master`** como la rama **`add-thurs-menu`** comparten un ancestro común (en este caso, el commit con ID **"A"**). Cuando fusionamos las dos ramas juntas, estamos intentando combinar el trabajo realizado ***después de*** ese commit.

<hr>

**NOTA**

Queremos combinar los cambios realizados en **B** y **C** con los de **D**.

<hr>

Este escenario en particular es un gran ejemplo de ramas que divergen entre sí después de comenzar en un punto común en el tiempo. Piense en ello como si fueran dos trenes que parten de una estación, siguen sus rutas individuales, recogen pasajeros y luego convergen(fusionan) en otra estación.

![image](https://user-images.githubusercontent.com/23094588/209987814-83ddfb23-76d1-4870-9977-97cee2e6e445.png)


### ¡Ya casi es jueves! (continuado)

Ya está todo configurado y listo para fusionar **`add-thurs-menu`** con **`master`**. Cambiaste a la rama **`master`**, así que sigamos y fusionemos la rama **`add-thurs-menu`** en ella:

![image](https://user-images.githubusercontent.com/23094588/209988410-6e2098cb-47bb-46bb-b3d1-0facf0e26d1c.png)

¿Qué sucedió? Git está tratando de crear un **"merge commit"**(más sobre esto en un minuto). Dado que se trata de un nuevo commit, Git necesita un mensaje de commit. Entonces, Git intentará abrir su editor predeterminado (el mismo que configuramos hace unas páginas) y le pedirá que escriba un mensaje de commit, así:

![image](https://user-images.githubusercontent.com/23094588/209988937-c846dd75-2354-459a-bffa-f062a3d27dfe.png)

<hr>

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/209588631-39069271-94a0-46f5-8f77-601389e0f170.png">

#### Su editor no siempre está visible.

*De vez en cuando, su editor puede estar oculto detrás de otras ventanas en su escritorio, especialmente si tiene muchas aplicaciones abiertas. Si no lo ve, mire a su alrededor, está ahí, se lo prometemos.*

<hr>

Git completa fácilmente un mensaje de commit predeterminado y, por lo general, preferimos mantenerlo así. Eres libre de escribir cualquier mensaje de commit aquí. Cuando haya terminado, guarde y luego **cierre** esa ventana. Su terminal debería informar de una fusión exitosa.

<hr>

**NOTA**

Si lee el texto que presenta Git, sabrá que todo lo que esté precedido por una almohadilla (#) es un comentario y se ignorará.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209989477-bcee279f-c6e2-4656-84c5-15cde8a40ad2.png)

¡Hurra! Otra fusión exitosa. Ahora todo el trabajo que está en la rama **`add-thurs-menu`** se ha fusionado en la rama **`master`**. Una lista rápida de los archivos muestra que este es el caso.

![image](https://user-images.githubusercontent.com/23094588/209989628-62b2877a-7d51-4f07-9e6a-285de803599d.png)

¡Es hora de finalmente disfrutar de una buena comida y bailar toda la noche!

### 💻

![image](https://user-images.githubusercontent.com/23094588/210135069-9db53fa2-30f8-40a5-8f37-e8cd2b0d024c.png)

Aquí hemos tratado de seguir los pasos pero hubo un problema ya que no se abrío el editor de texto en este caso VSC, por lo que si observamos lo que nos dice Git **`No se realiza commit de fusión; usa 'git commit' para completar la fusión.`** para completar el merge ya que como dijimos hubo un problema con el editor.

Vamos ha hacer dicho commit.

![image](https://user-images.githubusercontent.com/23094588/210135285-4dc2f0a7-e4bd-4f96-92c0-03e5d3de7455.png)

Ahora si se ha terminado de hacer el **commit merge** y podemos observar que en la rama **`master`** ya tenemos integrados los 3 archivos.

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿El mensaje de confirmación que proporcioné en VS Code es diferente de los mensajes de confirmación que proporcionamos cuando confirmamos con el indicador "`-m`" ?**

**R**: No. Son exactamente iguales. De hecho, incluso podría haberse fusionado **`add-thurs-menu`** con la rama **`master`** usando algo como: **`git merge add-thurs-menu -m "Merge branch 'add-thurs-menu'"`**. Queríamos mostrarle un escenario en el que Git le pide que proporcione un mensaje de commit utilizando su editor predeterminado.

En cuanto a por qué se comportó de esta manera, bueno, lo veremos en solo un segundo.

**P: Recibí un error al intentar completar esto. ¿Qué hice mal?**

**R**: Si recibió un error como **"`error: Empty commit message`"**, significa que es posible que haya borrado accidentalmente todo el texto en la ventana del editor de combinación y luego la haya cerrado. Esto proporciona un mensaje vacío y Git genera errores. Git le informará qué hacer, pero la forma más fácil es escribir **`git commit`** y presionar Enter en la ventana de la consola. Esto abrirá su editor una vez más. Esta vez, escriba su mensaje, guarde el archivo y luego ciérrelo. Deberías estar listo para irte ahora.

<hr>

![image](https://user-images.githubusercontent.com/23094588/209990407-3dfd7837-d080-4c17-9967-5742b46f82dc.png)

¡UH oh! Por alguna razón, la configuración de su editor de Git no funcionó del todo. Entonces, Git está usando su editor predeterminado, Vim, que es un poco complicado. Esto es lo que debe hacer para salir de Vim. Comience presionando la tecla Escape en su teclado, seguido de esta secuencia de caracteres :**`wq`**.

<hr>

**NOTA**

Una vez que superes esto, asegúrate de regresar algunas páginas y configurar tu editor predeterminado.

<hr>

<hr>

**NOTA**

Es esto o aprender Vim. :)

<hr>

![image](https://user-images.githubusercontent.com/23094588/209990685-f5b5652f-8276-4d11-ae1a-352fd0725345.png)

## Es un merge commit

¡Lo sabemos, estás lleno de preguntas! ¿Es esta fusión diferente de nuestra última fusión? Si es así, ¿por qué? Nunca antes habíamos visto aparecer un editor para solicitar un mensaje de commit, entonces, ¿qué es diferente ahora?

Volvamos a nuestra analogía de mezcla de colores. (Hiciste ese ejercicio de Brain Power, ¿verdad?) Cuando mezclas amarillo con naranja, terminas con naranja. Eso es porque el naranja ya contiene amarillo. Esto, en el mundo de Git, sería análogo a un fast-forward merge. Esto es lo que vimos cuando nos mergeamos **`add-fall-menu`** con **`master`**.

<hr>

**NOTA**

Bueno, técnicamente terminas con un naranja más claro, pero, de nuevo, todas las analogías eventualmente se rompen.

<hr>

Pero, ¿qué pasa si intentas mezclar dos colores primarios como el rojo y el azul? Bueno, obtienes un color completamente **nuevo**: ¡morado!

¿Qué tiene esto que ver con nuestro último ejercicio de fusión? Recuerde que antes de que mergeamos  la rama **`add-thurs-menu`** y **`master`**, **`master`** se había separado **`add-thurs-menu`** porque **`master`** se había movido (fast-forwarded) al commit a la que apuntaba **`add-fall-menu`**. Cuando tratamos de fusionar **`add-thurs-menu`** con **`master`**, Git tiene que reconciliar dos conjuntos diferentes de cambios en uno. Así que Git saca uno rápido: crea un nuevo commit para nosotros que representa el trabajo combinado de ambas ramas. Así es como se ve su historial de commits antes y después de la fusión:

![image](https://user-images.githubusercontent.com/23094588/209991873-3a75e1c3-c46d-47ca-b540-d9d108229d3c.png)

![image](https://user-images.githubusercontent.com/23094588/209992015-442a3a2f-ec57-4bfd-9e0b-150c4cdc12f5.png)

Observe que **`master`** se mueve para apuntar al último commit, identificada por **"E"**. Esto es lo esperado: la nota adhesiva de **`master`** se actualiza para reflejar el nuevo commit en esa rama, mientras **`add-thurs-menu`** permanece fija. Esto se denomina **merge commit** y se compone de todos los cambios que se introdujeron en las dos ramas separadas.

Sin embargo, cada commit que hacemos en Git necesita un mensaje de commit que describa lo que contiene ese commit. Por lo general, hacemos esto explícitamente con el indicador **"`-m`"**. Dado que no proporcionamos a Git un mensaje de commit cuando realizamos la fusión, ¡Git abre nuestro editor para brindarnos un lugar para hacer precisamente eso!

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

Otro hipotético historial de commmits para su placer visual. Para explicar cómo llegamos aquí:

* Comenzamos haciendo el commit **`A`** en la rama **`master`**.
* Luego creamos la rama **`add-chat`** e hicimos otro commit, **`B`**.
* Creamos la rama **`add-emojis`** a partir del commit **`B`** y procedimos a realizar dos commits más en esa rama, **`C`** y **`D`**.
* Luego regresamos con **`switch`** a la rama **`add-chat`**(al commit **`B`**) e hicimos otro commit, **`E`**.

Así es como se ve el gráfico de commits:

![image](https://user-images.githubusercontent.com/23094588/209993183-d0d8c2ec-e859-40cb-88bf-f60839552f39.png)

Ahora, intentaremos fusionar la rama **`add-emojis`** en la rama **`add-chat`**. En otras palabras, la rama **`add-chat`** es el **proponente** y **`add-emojis`** es el **propuesto**. ¿Resultará esto en un **fast-forward merge**, o formará un **merge commit**?

Finalmente, dibuje aquí el gráfico de confirmación resultante.

**MI SOLUCIÓN**

Se va a crear un **merge commit** con un nuevo commit **F**, la rama **`add-chat`** apunta a este commit **F** por ser el **proponente**, **`add-emojis`** se queda en el mismo sitio.

<hr>

**NOTA**

Dibuje el historial de commits actualizado aquí.

<hr>

Pista: ¿Se ha desviado **`add-chat`** de **`add-emojis`**?

**----------> Respuestas en “Exercise Solution”.**

### Los Merge commits son un poco especiales

Un **merge commit** es como cualquier otro commit que haya creado hasta ahora. Registra el trabajo que resultó de unir dos ramas, junto con algunos metadatos. Los metadatos incluyen su nombre y correo electrónico, la hora en que se creó el commit y el mensaje de commit que proporcionó cuando realizamos el mergeo. Además, cada commit(cualquier otro que no sea el primer commit en un repositorio) registra la ID del commit que le precede.

Sin embargo, los **merge commit** tienen ***algunas características interesantes***. Por un lado, recuerda que **no creaste este commit explícitamente; más bien, Git lo hizo cuando fusionó dos ramas que se habían separado una de la otra**.

Por otra parte, **un merge commit tiene dos padres**: el **primer padre** es el último commit en la rama que propone, y el **segundo padre** es el último commit de la rama propuesta que se fusionó. Mirando hacia atrás en el historial de commits de **`80s-diner`**:

![image](https://user-images.githubusercontent.com/23094588/209994638-3f9a6eb9-6b4b-4f01-9783-7297e9730de4.png)

El aspecto más importante de los **merge commit** es el efecto en el historial de commits. Hasta ahora, has visto cómo ***las ramas divergen unas de otras***. Esto es evidente cuando dibujas el historial de commits. Los **merge commit** son la otra cara de la misma moneda: presentan un punto en su historial de commits donde ***las ramas divergentes se unen***.

![image](https://user-images.githubusercontent.com/23094588/209994865-b7ee58c0-b619-47a2-bafd-1b05b9a23676.png)


## Las cosas no siempre van tan bien

Imagina el multiverso: existes en múltiples universos al mismo tiempo, viviendo vidas diferentes. En un universo, podrías ser un humanitario, con la intención de resolver todo el sufrimiento humano. En otro, eres un villano, enfocado con láser en la dominación mundial. Ahora supongamos que estos dos universos chocan entre sí. ¿Lo que pasa? Solo puede haber uno de ustedes, entonces, ¿cuál será? ¿El humanitario o el villano? ¿O podrías ser ambos de alguna manera?

En el repositorio **`’80s Diner`**, hasta ahora no hemos necesitado trabajar con el mismo archivo en varias ramas. Teníamos tres ramas, todas las cuales introdujeron nuevos archivos. Pero, ¿y si las tres ramas trabajaran con el mismo archivo, modificándolo de diferentes maneras? Tal vez editó un archivo en una rama y luego editó exactamente la misma línea en el mismo archivo en otra rama. Es decir, en una rama el archivo se ve diferente al mismo archivo en otra rama.

Considere un repositorio con dos ramas: **`master`** y **`feat-a`**. La rama **`master`** tiene un commit, que introduce el archivo **`notice.md`** (commit **`A`**), que solo tiene una línea de texto. Luego creamos la rama **`feat-a`**, cambiamos a ella, editamos el archivo y hacemos commit **`B`**. Finalmente, volvemos a la rama **`master`**, editamos el archivo *nuevamente* y hacemos un commit final, **`C`**.

![image](https://user-images.githubusercontent.com/23094588/209997170-bd87b845-4521-49ab-8002-74ee693bdeca.png)

**¿Qué sucede cuando fusionamos estas dos ramas?**


## ¡Estoy en conflicto!

![image](https://user-images.githubusercontent.com/23094588/209997284-99319a69-481c-4c15-92ee-5685eb981b13.png)

Los Conflictos(**Merge conflicts**) se producen cuando intentamos reunir commits que afectan a los mismos archivos de diferentes maneras. Esto es similar a nuestros universos alternativos chocando entre sí; cuando eso suceda, ¿cómo reconciliarás tu ser humanitario y el de villano?

Uno de esos escenarios es el que acabamos de describir: tenemos el mismo archivo en dos ramas diferentes, continuamos tratando en la rama **`master`** como la rama de integración y mergeamos la rama **`feat-a`** en la rama **`master`**. ¿Qué pasa?

¡Git levanta las manos en señal de rendición! Git no tiene absolutamente ninguna forma de determinar qué versión mantener, por lo que se **detiene** la fusión a mitad de camino e informa de un Conflicto(**merge conflict**).

![image](https://user-images.githubusercontent.com/23094588/209998927-701bea77-fd7f-4170-903c-42c2af555e21.png)

Si hacemos un Git **`status`** puede parecer aterrador, pero si lo leemos detenidamente, Git está haciendo todo lo posible para ayudarnos. Vamos a ver:

![image](https://user-images.githubusercontent.com/23094588/209999565-52ab9c92-ee7c-40fe-ae31-4f878ab7f390.png)

Git **`merge`** falla de inmediato, pero trata de ser útil al indicarle qué archivos tienen un Conflicto(**merge conflict**).

Git **`status`**, al igual que el comando **`merge`**, también nos dice que Git no pudo completar la combinación de algunos archivos y los enumera. También nos dice que arreglemos los conflictos y luego ejecutemos el comando **`git commit`**.

Puede resultar confuso cuando Git dice **"both modified"**, lo que significa que ambas ramas modificaron el mismo archivo.

Estás en medio del proceso de fusión y Git te pide ayuda.

La forma más fácil de resolver los conflictos(**merge conflicts**) es abrir los archivos que tienen conflictos(**merge conflicts**) en su editor. Si tuviera que abrir **`notice.md`** en su editor de texto, esto es lo que vería:

![image](https://user-images.githubusercontent.com/23094588/210003150-51f3ac5e-6254-4379-8d9c-c8988b3c48ca.png)

**Linus Torvalds, quien creó Git, lo describió como "el estúpido rastreador de contenido(the stupid content tracker)". En otras palabras, Git no pretende ser inteligente. Si no sabe qué hacer, simplemente se detendrá y le entregará el control.**

Se ve bastante retorcido, ¿eh? No se preocupe, lo guiaremos paso a paso. Solo recuerde, hay dos ramas que se están fusionando y cada una está introduciendo su propio cambio en el mismo archivo. Esto es lo que significan esos marcadores de aspecto divertido:

![image](https://user-images.githubusercontent.com/23094588/210003447-545ad05f-e8c2-4981-94a7-f8ac1a69f23b.png)

Ahora que lo sabe, aquí está el mismo archivo completamente descrito con notas:

![image](https://user-images.githubusercontent.com/23094588/210003623-f2c6fc0d-f2f8-407e-b898-d79d0b953a28.png)

Ahora solo es cuestión de editar los archivos que tienen merge conflicts. **Tienes cuatro opciones...**

<img width="1156" alt="image" src="https://user-images.githubusercontent.com/23094588/209859350-656c580f-cd14-4123-b3fc-3b6901fd405f.png">

*Las violetas son azules*

*Las rosas son rojas*

*El compromiso en el que estás*

*Se denomina CABEZA.*

### ¡Estoy en conflicto! (¡Uf! Ya casi llegamos)

Cuando tiene un conflicto(**merge conflict**), tiene **cuatro opciones**. Puede ***elegir los cambios introducidos en la rama **`master`***, ***los cambios en la rama **`feat-a`***, elegir ***ambos*** (en este caso particular) o ***ignorar ambos y escribir algo completamente nuevo***. Recuerde que los marcadores que Git colocó allí son solo para resaltar los conflictos, solo están ahí para ayudarlo.

Una vez que elija, este es el aspecto que debería tener el archivo:

**Sus opciones:**

![image](https://user-images.githubusercontent.com/23094588/210004125-f4ce455c-2c35-4b8b-9070-67625cb1151f.png)

Por supuesto, es posible que no siempre pueda seleccionar ambos cambios, especialmente si el resultado final no es sintácticamente válido. Esto es particularmente cierto para el código fuente, y luego se vería obligado a elegir uno u otro, o simplemente ignorar los cambios en ambos lados y escribir algo completamente nuevo.

Una vez que haga su elección y termine de editar el archivo en su editor de texto, guarde el archivo.

A continuación, simplemente seguimos las instrucciones que **`git status`** nos ofrece. Usamos **`git add`** para agregar el resultado final al **staging area(área de preparación)**, luego continuamos con **`git commit`**.

<hr>

**NOTA**

Vuelva a leer el resultado del **`git status`** que le mostramos hace un par de páginas si necesita refrescar su memoria.

<hr>

![image](https://user-images.githubusercontent.com/23094588/210004794-de6856ab-4149-4965-993c-76d5ada77b42.png)

¡Hurra! ¡Felicitaciones por resolver su primer conflicto(merge conflict)!

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Qué pasa si tengo conflictos en más de un archivo?**

**R**: Como es de esperar, **`git merge`** se detendrá a mitad de camino y enumerará todos los archivos que tienen conflictos. Puede usar su editor para resolver los conflictos, tal como lo hicimos nosotros, y luego usar **`git add`** para todos los archivos que tenían un conflicto(**merge conflict**). Por último, ejecuta **`git commit`**.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

¿Puedes visualizar cómo se vería el historial de commits después de fusionar la rama **`feat-a`** en la rama **`master`**? Te ayudamos a empezar aquí: tu misión es terminar el gráfico.

![image](https://user-images.githubusercontent.com/23094588/210005204-a2419210-5a15-4bb5-b5de-97f796ae97e0.png)

Pista: B y C han divergido el uno del otro.

**----------> Respuestas en “Sharpen your pencil Solution”.**

<hr>

![image](https://user-images.githubusercontent.com/23094588/210005301-7348ca3c-fc58-47f5-8d07-3916bcb16b13.png)

**Suena improbable, ¿verdad?** Resulta que, no tanto. La mayoría de los proyectos comprenden docenas, si no cientos, de archivos. No es raro trabajar en varias tareas al mismo tiempo. Y podría terminar tocando sin darse cuenta el mismo archivo en dos ramas separadas. Cuando llegas a fusionar esas ramas separadas, existe la posibilidad de conflicto.

El otro escenario es cuando varias personas comienzan a usar Git como herramienta de colaboración. Todavía no hemos llegado a hablar de eso, pero involucra a diferentes personas que trabajan en diferentes ramas. Cuando dos personas diferentes, trabajando en dos tareas diferentes en dos ramas diferentes en el mismo repositorio, afectan el mismo archivo, es probable que creen un conflicto al mergear.

Los conflictos(**merge conflict**) ocurren más de lo que piensas, así que siéntete cómodo con ellos. Pero no se preocupe, el siguiente ejercicio lo convertirá en un experto en resolución de conflictos.

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

Vuelva al directorio **`my-headfirst-git-samples`** (o donde sea que haya estado creando repositorios de muestra) y siga:

1. Cree una nueva carpeta llamada **`loving-git`**.

2. Cambie al directorio **`loving-git`** e inicialice un nuevo repositorio de Git.

3. Cree un nuevo archivo llamado **`tribute.md`** (usando un editor de texto) con el siguiente contenido:

![image](https://user-images.githubusercontent.com/23094588/210005778-80eead04-51d4-478e-a99c-aa12cde16d64.png)

4. Agregue el archivo al index y luego commitelo. Utilice el mensaje de commit **"`A`"**.

5. Cree una rama llamada **`improvisation`**, **`switch`** en ella y luego edite el archivo **`tribute.md`** para que se vea así:

![image](https://user-images.githubusercontent.com/23094588/210006006-421fffaa-7bd3-4008-9b22-c03f6e3a2fba.png)

6. Nuevamente, agregue y commite el archivo. Proporcione el mensaje de commmit **"`B`"**.

7. Vuelva a la rama **`master`** nuevamente y edite el archivo para que se vea así:

8. Una vez más, agregue y commite el archivo. Esta vez usa el mensaje de confirmación **"`C`"**.

9. Merge la rama **`improvisation`** en la rama **`master`**. Resuelve cualquier conflicto como mejor te parezca. **Asegúrese de leer qué información proporciona Git cuando abre su editor para proporcionar un mensaje de commit**.

**¿Cómo se ve el historial de commits después de la fusión?**


### 💻

1. y 2.

   ![image](https://user-images.githubusercontent.com/23094588/210137263-51f6848e-61a5-4669-9080-d8ec57de7e03.png)

3. 

   ![image](https://user-images.githubusercontent.com/23094588/210137373-33a51387-3215-456b-997a-c5c1233a9e30.png)

4. 

   ![image](https://user-images.githubusercontent.com/23094588/210137436-dd758efa-45b3-4a21-9b1d-7c3b561037e9.png)

   ![image](https://user-images.githubusercontent.com/23094588/210137449-6a9004dc-3332-4f40-97a2-aff42efed735.png)

5.

  ![image](https://user-images.githubusercontent.com/23094588/210137493-47df8c87-1332-4282-a8d5-97478ae6c5b6.png)

   ![image](https://user-images.githubusercontent.com/23094588/210137542-65fa7dfa-f020-4775-834e-91ac3ea027ca.png)

6.

   ![image](https://user-images.githubusercontent.com/23094588/210137594-7e39f403-b489-42f0-bf6d-d43a5a73a216.png)

7.

   ![image](https://user-images.githubusercontent.com/23094588/210137637-74186085-561f-4a3b-9fa8-d6f16b10bdb8.png)

   ![image](https://user-images.githubusercontent.com/23094588/210139403-4cfb8604-36c6-4430-904c-68b8b3eace43.png)

8.

   ![image](https://user-images.githubusercontent.com/23094588/210137761-4ed3b0ca-1e3f-4b6c-b3a4-53fa51b198dd.png)

9.

   ![image](https://user-images.githubusercontent.com/23094588/210137838-0bfb8c2e-35bd-4b19-a5bc-7243542aee2b.png)

   ![image](https://user-images.githubusercontent.com/23094588/210139535-39455cd2-16cb-4c93-80b5-b42b5f0b4d41.png)

   VSC nos permite abrir un **Merge Editor** para facilitar la edición. Podemos ver lo existente en la rama **`improvisation`** y **`master`** y el resultado con el que nos vamos a quedar.
   
   ![image](https://user-images.githubusercontent.com/23094588/210139562-72478b19-b11d-44bc-b26a-b2e6e8281884.png)
   
   Para resolver este conflicto vamos a seleccionar ambos primero lo que pusimos en la rama **`improvisation`** y luego en la rama **`master`** de la siguiente manera.
   
   
   ![image](https://user-images.githubusercontent.com/23094588/210139739-d697306f-196f-4954-8cd4-00f00601b808.png)
   
   y pulsamos el botón **Accept Merge**.
   
   ![image](https://user-images.githubusercontent.com/23094588/210139776-f2f03285-c2b4-4377-81e7-23036fbac0c3.png)

   si volvemos a la terminal y pulsamos **`git status`** Git nos indicara que los conflictos se han resuelto pero seguimos fusionando, nos falta realizar el commit.
   
   ![image](https://user-images.githubusercontent.com/23094588/210139813-4ba922b5-226e-4ce5-9c9c-56b887b7c933.png)
   
   Vamos a realizar el commit para concluir el merge.
   
   ![image](https://user-images.githubusercontent.com/23094588/210139916-ba87ed14-f7df-43cf-a348-8fcf510f03a1.png)
   
   **(EN EL MENSAJE SIMPLEMENTE TENIA QUE PONER "D" PARA SEGUIR CON LA NOTACIÓN USADA PREVIAMENTE)**.

<hr>

**NOTA**

Dibuje el gráfico de commits aquí.

<img width="1325" alt="image" src="https://user-images.githubusercontent.com/23094588/210139978-1ba62660-8b2e-4e10-9033-16be43cb673a.png">


<hr>

**----------> Respuestas en “Sharpen your pencil Solution”.**


## Limpieza de branches(mergeadas)

![image](https://user-images.githubusercontent.com/23094588/210006686-0d4d04d3-17ba-4209-aca3-170aea8fbff7.png)

Hemos visto cómo se ve un flujo de trabajo de bifurcación típico: recibe una solicitud de una nueva función o un correo electrónico discordante sobre un error que debe corregirse de inmediato. Crea una rama, comienza su trabajo, commitea cuando sea necesario y, cuando esté listo, vuelve a fusionarse con la rama de integración.

Pero después de un tiempo, tiene todas estas ramas creadas en su repositorio de Git, por lo que es hora de una limpieza. Git te permite eliminar ramas, usando el comando **`git branch`**. Lo primero es lo primero: **¡no puedes eliminar la rama en la que te encuentras!** Entonces, si se encuentra en la rama que está a punto de eliminar, debe cambiar a otra rama.

Tome este repositorio hipotético como ejemplo. Tiene dos ramas, **`master`** siendo la rama de integración, y una rama feature, llamada **`feat-home-screen`**. **`feat-home-screen`** se fusionó con **`master`**, por lo que podemos eliminarla de forma segura.

![image](https://user-images.githubusercontent.com/23094588/210007147-0d9704d9-726f-4aa8-ab9a-f9a8e5a88f81.png)

Para eliminar una rama, proporcionamos el indicador **`-d`**(o **`--delete`**) con el comando **`git branch`** junto con el nombre de la rama que deseamos eliminar, así:

![image](https://user-images.githubusercontent.com/23094588/210007463-1d91b058-0077-41a2-93e2-d426ccc3f081.png)

Git responderá con un mensaje de confirmación, como este:

![image](https://user-images.githubusercontent.com/23094588/210007583-c80f8060-bbc1-443d-995e-2c8bce83c53c.png)

Git siempre intenta ser lo más útil posible. Esta vez no solo le dice que eliminó la rama, sino que sigue en el ID del commit, del último commit en esa rama. Esto es muy útil en caso de que borre accidentalmente la rama equivocada. Si de repente se da cuenta de que eliminó la rama incorrecta, puede usar una variación del comando **`git branch`** que le permite proporcionar el ID de commit en el que se debe basar la rama, así: **`git branch <branch-name> <base-commit-id>`**. **Esto le permitirá deshacer una eliminación accidental**.

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

¡Tu turno! Navegue hasta el repositorio **`80s-diner`** en su terminal y haga lo siguiente:

1. Enumere las branches que tiene:

2. Eliminar todas las branches excepto **`master`**. Pero primero, enumere los pasos que debe seguir:

### 💻

![image](https://user-images.githubusercontent.com/23094588/210140391-0817fd2a-8fbb-45ad-90a6-2436abf6c81b.png)

**----------> Respuestas en “Sharpen your pencil”.**

<hr>

<img width="1131" alt="image" src="https://user-images.githubusercontent.com/23094588/209854142-2fe06b71-7804-41e5-9269-2194713417c3.png">

Hemos comparado ramas con notas adhesivas. ¿Qué crees que sucede con estas notas adhesivas cuando eliminas ramas en Git?

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: Parece que puedo eliminar mi rama tan pronto como termine de integrar mi trabajo. ¿Debería esperar un poco más?**

**R**: ¡No! Lo hiciste bien la primera vez. Una vez que fusiona su rama con la rama de integración, no hay razón para mantener esa rama. ¡Avanzar! Bórralo.

**P: Recibí un error al eliminar mi rama.**

**R**: Si recibió un error que se parece a **`error: branch not found`**, entonces escribió mal el nombre de la rama o está tratando de eliminar una rama que ya eliminó. Puede usar **`git branch`** para enumerar todas sus ramas, verificar que la rama existe y asegurarse de obtener el nombre correcto.

**P: ¿Por qué necesito eliminar estas ramas? ¿Por qué no mantenerlos cerca?**

**R**: Las ramas se utilizan para trabajar en una sola cosa, lejos de otras tareas que pueda tener en vuelo. Piense en ellos como recipientes de un solo uso, como una taza de café de un autoservicio: una vez que obtiene su dosis de cafeína, simplemente tira el recipiente.

Finalmente, si no elimina las ramas que ya no necesita, su **`git branch`** lista se vuelve más y más larga con el tiempo y se vuelve más difícil determinar qué ramas están "activas" y cuáles se han fusionado y ya no son necesarias. ¿Y a quién no le gusta un repositorio agradable y limpio?

![image](https://user-images.githubusercontent.com/23094588/210008665-8a820ae1-c36e-4086-87e9-f0db3faec803.png)

**La respuesta a su pregunta se encuentra en el historial de confirmaciones.**

Cuando hablamos de eliminar ramas, hablamos específicamente de eliminar ramas que ya se han fusionado. Suponga que trabajó en una rama feature llamada **`feat-a`**, que acaba de fusionar en la rama **`master`**. Tómese un momento para pensar en cómo se ve su historial de commits después de que termine de fusionarse:

![image](https://user-images.githubusercontent.com/23094588/210062488-06391c5e-a3c5-4704-aace-9c116a903f6c.png)

Cuando eliminas la rama **`feat-a`**, todo lo que hace Git es tirar la nota adhesiva que representa la rama **`feat-a`**. En cuanto al commit **"B"**: tenga en cuenta que el merge commit **"D"** tiene dos padres, **"C"** y **"B"**, y la nota adhesiva de la rama **`master`** apunta al commit **"D"**. Entonces **"B"** se queda porque su historial de commits lo necesita. (Recuerde, actúa como el segundo padre del commit "D").

![image](https://user-images.githubusercontent.com/23094588/210062926-9f475b1d-7cf6-4205-866e-01082ea6bc23.png)

Lo que debe recordar es que siempre que un commit sea **"accesible(reachable)"**, es decir, haya una referencia a el(como una rama) u otro commit que le apunte como padre, permanecerá en su historial de commits. En este caso, la rama **`master`** apunta al commmit **"D"**, y **"D"** apunta a **"B"**. Así que el commit **"B"** se mantiene. También puede extender esta lógica a **"A"**, porque tiene dos commits que hacen referencia a el: **"B"** y **"C"**.

## Eliminar ramas no fusionadas(unmerged branches)

Ahora comprendera el impacto de eliminar ramas. Es decir, si la rama que está eliminando se ha fusionado, ¡entonces su historial de commits no cambia! Solo desaparece la nota adhesiva que representa la rama. Pero, ¿qué sucede si intenta eliminar una rama que aún no se ha fusionado? Veamos otro historial hipotético de commits en el que tenemos dos ramas, **`master`** y **`feat-b`**, pero aún no las hemos fusionado.

![image](https://user-images.githubusercontent.com/23094588/210063502-157a7701-a858-43ec-8f2b-7768c12bfc13.png)

Observe que hay un commit **"B"** en la rama **`feat-b`**. Ahora, si intentáramos eliminar la rama **`feat-b`**, esto es lo que verías:

![image](https://user-images.githubusercontent.com/23094588/210063645-1cfa293c-27ec-4c8a-8031-b74b72bb2695.png)


Git advierte que si eliminara la rama **`feat-b`**, no se podría acceder al commit **"B"**. En otras palabras, no hay nada(una nota adhesiva u otro commit) que le haga referencia. ¡Y por eso se niega!

Ahora existe la posibilidad de que haya creado una rama solo para probar una idea o abordar un problema usando una táctica diferente, y ya no le interesa. Puede proporcionar el comando **`branch`** con el indicador **`-D`** (sí, D mayúscula) para forzar su eliminación.

<hr>

**NOTA**

Git mostrará el ID del último commit de la rama que forzaste a eliminar, para que siempre puedas recuperarlo como te mostramos hace unas páginas.

<hr>

<hr>

<img width="968" alt="image" src="https://user-images.githubusercontent.com/23094588/209588631-39069271-94a0-46f5-8f77-601389e0f170.png">


**Use el indicador `-D` de forzar eliminación con cuidado.**

*A menudo es tentador ejecutar el comando o usar la opción que te ofrece Git, especialmente si estás en medio de algo. Pero es importante prestar atención a lo que Git intenta decirte; en este caso, te dice que perderás el trabajo que hiciste en un o más commits.*

*Entonces, la próxima vez que Git no haga lo que le pides, haz una pausa por un segundo, respira y lee los mensajes de Git cuidadosamente. A continuación, proceda únicamente si está seguro de que sabe exactamente lo que quiere que haga Git.*

<hr>

## Un flujo de trabajo típico

Hasta ahora, hemos creado ramas para trabajar en tareas individuales y las hemos vuelto a fusionar en la rama de integración. Estas son algunas de las prácticas a las que se adhieren muchos desarrolladores cuando ramifican y fusionan:

1. **Por lo general, base sus nuevas ramas en commits de las ramas de integración.**
   Las ramas de integración reflejan el trabajo de todas las ramas. Esto significa que su nueva rama tendrá todo lo que se ha completado hasta el momento, por lo que puede trabajar sabiendo que tiene un buen punto de partida.
   
   ![image](https://user-images.githubusercontent.com/23094588/210064500-5c905497-4a8d-42f6-b56b-4a3cb40a0d4f.png)

2. **Vuelva a fusionar en la rama de integración una vez que haya terminado.**
   Es tentador retrasar la fusión de nuevo en la rama de integración, pero una vez que crea que ha terminado con la tarea en cuestión, entonces fusione. Si se olvida de algo, siempre puede crear otra rama basada en la rama de integración (que ahora reflejará los cambios que fusionó anteriormente).

![image](https://user-images.githubusercontent.com/23094588/210064671-7ca79971-9518-4680-86cb-57f833754203.png)


3. **No reutilices las ramas.**
   Un flujo de trabajo típico implica crear una nueva rama, realizar su trabajo, fusionarla con la rama de integración y luego eliminar la feature branch(rama de características). Una vez más, recuerda que siempre puedes crear una nueva rama si lo necesitas.
   
   ![image](https://user-images.githubusercontent.com/23094588/210064808-99d7f39f-f8cd-4f26-b240-dc661f7ef574.png)

<hr>

**NO HAY PREGUNTAS TONTAS**

**P: ¿Cómo sé cuándo crear una nueva rama y cuándo fusionarla?**

**R**: Por lo general, cree una nueva rama para cualquier nueva "tarea". Supongamos que se le asigna un ticket para agregar una nueva función o corregir un error: esa es su señal para crear una nueva rama. Una vez que su trabajo cumpla con la "definición de hecho" en el ticket, debe fusionar su trabajo en la rama de integración.

**P: No lo entiendo. ¿Por qué no debería reutilizar ramas?**

**R**: Cuando comienza a trabajar en una nueva tarea, siempre desea el conjunto más reciente de cambios en ese proyecto, que siempre se refleja en la rama de integración. Las ramas, por otro lado, pueden volverse "obsoletas".

En segundo lugar, las ramas son baratas en Git. Son simplemente referencias a commmits en el gráfico acíclico dirigido. Úselos, y una vez que haya terminado con la tarea en cuestión, ¡bórrelos!

<hr>

**RESUMEN**

* Las ramas son una de las mejores características de Git. Las ramas le permiten trabajar en múltiples tareas al mismo tiempo.
* Cuando trabajas en Git, siempre estás trabajando en una rama. Cada repositorio comienza con una rama y el nombre predeterminado es **`master`**.
* La rama **`master`** no es especial de ninguna manera. No es diferente a cualquier otra rama que cree. Puede cambiar el nombre o incluso eliminar la rama **`master`**.
* El comando principal para trabajar con ramas es **`git branch`**. Puede usar **`git branch`** para crear, enumerar y eliminar ramas.
* Para crear una rama llamada **`update-profile`**, proporcione el comando **`git branch`** así: **`git branch update-profile`**
* **`git branch`** le permite crear ramas, pero para comenzar a usar la nueva rama, use el comando **`git switch`**. Proporcione el nombre de la rama que desea comenzar a usar, así: **`git switch update-profile`**
* Piense en una rama como una nota adhesiva que contiene el nombre de la rama y el ID de commit del último commit en esa rama.
* Cada vez que realiza un commit en una rama, Git actualiza la nota adhesiva que representa esa rama y le otorga el nuevo ID de commit. Así se “mueve” una rama.
* Dado que las ramas siempre apuntan a commmits, ofrecen una manera fácil de crear otras ramas.
* Cada vez que hace un **`switch`** a una rama, Git reescribe el directorio de trabajo para reflejar el estado capturado en el último commit en esa rama.
* En un flujo de trabajo típico, algunas ramas (por convención) se tratan como ramas de "integración" para recopilar el trabajo realizado en otras ramas.
* Por el contrario, el trabajo diario se realiza en las ramas "feature(características)". Cada feature branch se debe usar para una cosa y solo para una cosa: por ejemplo, para introducir una nueva función o corregir un error.
* Para combinar el trabajo que ha realizado en una rama de integración, combine la feature branch en la rama de integración.
* El tipo de fusión más fácil se denomina "fast-forward merge", en la que una rama simplemente "se pone al día" con otra rama.
* El otro tipo de fusión es cuando fusionas dos ramas que han *divergido* entre sí, en cuyo caso Git creará un merge commit.
* Un merge commit es como cualquier otro commit, excepto que lo crea Git y no tiene uno sino dos padres: el primer padre es el últimao commit en la rama de integración y el segundo padre es el último commit en la feature branch.
* Ocasionalmente, la misma línea en el mismo archivo se ha modificado en las dos ramas que se fusionan, lo que provoca un conflicto(merge conflict). Git depende de ti para resolver el conflicto(merge conflict).
* Puede eliminar una rama usando el comando **`git branch`**, junto con la bandera **`-d`**(o **`--delete`**).
* Si intenta eliminar una rama que aún no se ha fusionado, Git generará un error. Si está absolutamente seguro de que desea eliminar una rama no fusionada, deberá usar el indicador **`-D`** (D mayúscula) con el comando **`git branch`**.
* Una rama siempre se basa en un commit. Si conoce el ID del commit que desea usar como base para una rama, puede proporcionarlo al comando **`git branch`**:

   **`git branch branch-name commit-ID`**

<hr>


### Git branch “crossword puzzle”

<!-- ![image](https://user-images.githubusercontent.com/23094588/210066322-c227439c-86df-4833-93df-078051ea487a.png) -->

Después de todas esas ramificaciones y fusiones, ¿te sientes en conflicto? Tómate un descanso, ramifícate y prueba este crucigrama.

![image](https://user-images.githubusercontent.com/23094588/210066417-ef920c06-cf68-4f04-8957-c9418b65b38f.png)


**Across**

**1** You can see a graph of your branches in your commit ____

**3** _____ Studio Code

**5** These happen if you merge two branches that change the same line in the same file

**8** An ____ branch is where it all comes together

**10** Bring branches together using the git ___ command

**11** The commit you’re on right now

**12** When you need to work on something separately, create one of these

**13** Information recorded in your commit, like the ID and timestamp

**14** A scary word that won’t kill you

**15** Get a taste of nostalgia at the ’80s ____

**Down**

**2** The git ___ command lets you hop from one branch to another

**4** Every branch points to one of these identifiers (2 words)

**6** A type of merge that “jumps ahead” (2 words)

**7** In October, the ’80s Diner will serve you a “Texas ____ Massacre”

**9** Git creator Linus _____

**11** This flag gives you lots of information about commands

**13** Git’s default name for your first branch

**----------> Respuestas en “Git branch “crossword puzzle” Solution”.


<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

**De “Exercise”.**

Piensa en el historial de commits. A ver si puedes averiguar en qué se equivocó Norm. Anota tus notas aquí:

<hr>

**NOTA**

Debido a que Norm realizó un trabajo incompleto antes de trabajar en el error, ¡ahora el código en el último commit incluye todos sus cambios a medias!

<hr>

![image](https://user-images.githubusercontent.com/23094588/210068502-bcb47911-8494-4527-a24b-5e19c6e3808b.png)


**De “Code Magnets”.**

¡Oh querido! Para ayudar a nuestros compañeros desarrolladores, hemos diseñado cuidadosamente todos los comandos necesarios para enumerar todas las ramas en su repositorio (existente), luego crear una nueva rama, cambiar a ella y verificar que todo esté bien. ¡Pobre de mí! Los imanes cayeron al suelo. Es tu trabajo volver a armarlos. Ten cuidado; se mezclaron algunos imanes adicionales y algunos se usaron más de una vez.

![image](https://user-images.githubusercontent.com/23094588/210068665-70c71961-201e-42f9-a4d1-0d4a1733879a.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

¿Qué cambiaría en la visualización si permanecieras en la rama **`add-fall-menu`** y tuvieras que hacer otro commit?

![image](https://user-images.githubusercontent.com/23094588/210068812-9f7c8aaf-32c6-4788-92b4-5f3bb78ee8d8.png)

<hr>

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850368-57d82652-76aa-43cb-b2eb-27a73c6f6e70.png">

**De "BE Git".**

**Dedique un poco de tiempo a comprender cómo cambia Git su directorio de trabajo cuando cambia de rama.**

Comience con su terminal: asegúrese de estar en el directorio **`80s-diner`** y utilíce **`git branch`** para asegurarse de que está en la rama **`add-fall-menu`**.

![image](https://user-images.githubusercontent.com/23094588/210068982-bec24922-acd3-45ee-b193-a5b584a7f9e0.png)

Finalmente, vea si puede explicar lo que está viendo aquí.

<hr>

**NOTA**

El último commit en la rama **`add-fall-menu`** commiteo el archivo **`fall-menu.md`**, pero esta rama comenzó desde la rama **`master`**, que ya tenía el archivo **`menu.md`**. Entonces, **`add-fall-menu`** tiene ambos archivos: **`menu.md`** y **`fall-menu.md`**. Pero la rama **`master`** solo tiene un commit, con el archivo **`menu.md.`**

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">


**De “Sharpen your pencil”.**

Antes de continuar, vea si puede visualizar cómo se ve su historial de commits. Fuimos lo suficientemente amables para que comenzaras, pero necesitas terminarlo.

![image](https://user-images.githubusercontent.com/23094588/210069394-e726af43-1e66-45dd-a50e-7d9fcb5740d4.png)

<hr>

<img width="1070" alt="image" src="https://user-images.githubusercontent.com/23094588/209850368-57d82652-76aa-43cb-b2eb-27a73c6f6e70.png">

Repitamos nuestro ejercicio anterior de visitar todas las ramas en nuestro repositorio y enumerar los archivos que están presentes en cada rama, excepto que esta vez tenemos tres ramas. Para cada una de las ventanas que se muestran a continuación, escriba lo que cree que será el resultado de invocar **`git branch`** y qué archivos se enumerarán en cada rama:

**De “BE Git”.**

![image](https://user-images.githubusercontent.com/23094588/210069721-42da3164-024e-49f0-8596-69d87819ad0d.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

Mire el gráfico de commits hipotético a continuación y complete las notas adhesivas con la información necesaria para asociar un nombre de rama con el ID de commit al que apunta. Tenga en cuenta que puede haber más notas adhesivas de las que realmente necesita.

![image](https://user-images.githubusercontent.com/23094588/210069860-8afed8a4-03d2-49af-8c91-9ef8f3303983.png)

Ahora supongamos que cambiamos a la rama **`fix-header`**, hacemos algunas ediciones y hacemos otro commit, a la que se le asignó el ID **"G"**. ¿Puedes visualizar qué cambios en el diagrama de arriba?

![image](https://user-images.githubusercontent.com/23094588/210070021-eed74971-3623-4fae-a09a-058d2305a3f3.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

Mencionamos que muchos equipos usan nombres como **`main`** en lugar de **`master`** para indicar ramas de integración. ¿Se te ocurre algún otro nombre? Enumere algunos aquí (siéntase libre de usar su motor de búsqueda favorito para obtener algunas ideas):

<hr>

**NOTA**

develop

latest

trunk

<hr>

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

Digamos que asistes a la boda de un amigo. Tomaste algunas fotos con tu teléfono y, unos días después, el fotógrafo de la boda te pide que les envíes las fotos que tomaste. Haces una copia de las fotos de la boda en tu teléfono y les envías la copia para que puedan combinarlas con las que tomaron.

Ahora tómese unos minutos para pensar en las siguientes preguntas:

* ¿Quién tiene el conjunto “completo” de imágenes?

   <hr>
   
   **NOTA**
   
   El fotógrafo tiene el set completo de fotos, ya que tiene su propio set, y tú le enviaste una copia del tuyo.

* ¿Alguno de ustedes perdió alguna foto?

   
   <hr>
   
   **NOTA**
   
   No. Recuerda, le enviaste al fotógrafo una copia de las fotos que tomaste.
   
   <hr>

* ¿Cuál de ustedes es la rama de “integración” en este escenario?

   <hr>
   
   **NOTA**
   
   Ese sería el fotógrafo, ya que está “fusionando” su copia con la tuya.
   
   <hr>
   
<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

En el directorio **`80s-diner`**, continúe y ejecute **`git branch --help`** (o **`git help branch`** use cualquiera de los dos), y busque la sección relacionada con el indicador **`-v`** o **`--verbose`**. **Lea sobre lo que hace**.

A continuación, ejecute **`git branch -v`** y registre aquí el nombre de la rama y el ID de commit más reciente. (Los necesitará para las próximas secciones de este capítulo).

![image](https://user-images.githubusercontent.com/23094588/210070651-36d2ea2f-a5fa-4965-ac59-c429b6d0f469.png)


**De “Exercise”.**

<hr>

<img width="791" alt="image" src="https://user-images.githubusercontent.com/23094588/209587134-ab168c9f-f1c7-4780-9a4a-fc84ef03d078.png">

Flexionemos un poco más nuestras habilidades de línea de comandos. Vas a repetir nuestro ejercicio anterior de enumerar las últimas ID de commit en cada rama. Recuerda que puedes usar **`git branch -v`** y ver información de cada una de tus ramas. Adelante, hazlo de nuevo:

![image](https://user-images.githubusercontent.com/23094588/210070886-0de2b749-2cfb-4052-a46b-3f798b2ac0fd.png)

Compáralas con las que hiciste la última vez. ¿Qué cambió?

<hr>

**NOTA**

Dado que fusionamos **`add-fall-menu`** y **`master`**, apuntan al mismo commit. **`add-thurs-menu`** permanece sin cambios.

<hr>

Finalmente, enumere los archivos en cada rama. Comience con la rama **`master`**, luego **`switch`** a la rama **`add-fall-menu`** y finalmente a la rama **`add-thurs-menu`**, usando **`ls`** para enumerar los archivos que ve en cada rama:

![image](https://user-images.githubusercontent.com/23094588/210071134-55939249-d62d-42b7-b120-a26c1ad2d389.png)

**De “Exercise”.**


Otro hipotético historial de commits para su placer visual. Para explicar cómo llegamos aquí:

* Comenzamos haciendo el commit **A** en la rama **`master`**.
* Luego creamos la rama **`add-chat`** e hicimos otro commit, **B**.
* Creamos la rama **`add-emojis`** en base al commit **B** y procedimos a realizar dos commits más en esa rama, **C** y **D**.
* Luego regresamos a la rama **`add-chat`** con **`switch`** e hicimos otro commit, **E**.

Así es como se ve el gráfico de commits:

![image](https://user-images.githubusercontent.com/23094588/210133954-4ad8caa0-b49d-449e-85c7-83097f26e4e9.png)

Ahora, intentaremos fusionar la rama **`add-emojis`** en la rama **`add-chat`**. En otras palabras, la rama **`add-chat`** es el **proponente** y **`add-emojis`** es el propuesto. ¿Resultará esto en un **fast-forward merge**, o formará un **merge commit**?

<hr>

**NOTA**

Al observar el gráfico de commits, vemos que tanto **`add-chat`** como **`add-emojis`** comparten un commit común (**B**), pero han divergido entre sí (ya que ambas tienen commits desde **B**). Entonces esto resultará en un **merge commit**.

<hr>

Finalmente, dibuje aquí el gráfico de commits resultante.

![image](https://user-images.githubusercontent.com/23094588/210134031-53ce29ac-5d78-49e8-a671-9bc4da29142d.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

¿Puedes visualizar cómo se vería el historial de commits después de fusionar la rama **`feat-a`** en la rama **`master`**? Te ayudamos a empezar aquí: tu misión es terminar el gráfico.

![image](https://user-images.githubusercontent.com/23094588/210134174-48bf1fd1-bb97-4b4a-82bf-5c5df26c7171.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

Vuelva al directorio **`my-headfirst-git-samples`** (o donde sea que haya estado creando repositorios de muestra) y haga:

1. Cree una nueva carpeta llamada **`loving-git`**.
2. Cambie al directorio **`loving-git`** e inicialice un nuevo repositorio de Git.
3. Cree un nuevo archivo llamado **`tribute.md`** (usando un editor de texto) con el siguiente contenido:

![image](https://user-images.githubusercontent.com/23094588/210134276-e5a42eea-e889-4017-90db-7ddaa4e63a9a.png)

4. Agregue el archivo al índice y luego commitelo. Utilice el mensaje de commit **"`A`"**.
5. Cree una rama llamada **`improvisation`**, cambiese a ella con **`switch`** y luego edite el archivo **`tribute.md`** para que se vea así:

![image](https://user-images.githubusercontent.com/23094588/210134336-d16def68-8dce-4938-9a1a-5ab92ebcf5e7.png)

6. Nuevamente, agregue y commite el archivo. Proporcione el mensaje de commmit **"`B`"**.
7. Vuelva a la rama **`master`** nuevamente y edite el archivo para que se vea así:
8. Una vez más, agregue y commite el archivo. Esta vez usa el mensaje de commit **"`C`"**.
9. Mergear la rama **`improvisation`** en la rama **`master`**. Resuelve cualquier conflicto como mejor te parezca. **Asegúrese de leer qué información proporciona Git cuando abre su editor para proporcionar un mensaje de commit**.

**¿Cómo se ve el commit history después de la fusión?**

![image](https://user-images.githubusercontent.com/23094588/210134457-cd5511df-832b-4ea8-af21-c4c464a67f14.png)

<hr>

<img width="1139" alt="image" src="https://user-images.githubusercontent.com/23094588/209848120-e8fe83f6-95f0-4aa4-82e9-eb4f09f0cefc.png">

**De “Sharpen your pencil”.**

¡Tu turno! Navegue hasta el repositorio **`80s-diner`** en su terminal y haga lo siguiente:

1. Enumere las ramas que tiene:

   ![image](https://user-images.githubusercontent.com/23094588/210134485-adb33671-865e-40b0-8597-2e54240947b2.png)

2. Eliminar todas las ramas excepto **`master`**. Pero primero, enumere los pasos que debe seguir:

   <hr>
   
   **NOTA**
   
   ```sh
   git branch -d add-fall-menu

   git branch -d add-thurs-menu
   ```
   
   <hr>
   
<hr>
   
![image](https://user-images.githubusercontent.com/23094588/210134555-7d1ef50e-4272-4f58-a2c0-5df8bae705be.png)

Después de todas esas ramificaciones y fusiones, ¿te sientes en conflicto? Tómate un descanso, ramifícate y prueba este crucigrama.

**De “Git branch “crossword puzzle””.**

![image](https://user-images.githubusercontent.com/23094588/210134577-9b096a4c-81f9-45c9-bb64-e77f1917e633.png)


