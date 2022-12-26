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

### Elecciones... ¡tantas opciones!



## “Opciones... ¡Tantas opciones!”
## "Cambio de pistas"
## "¡Devuelvelo!"
## “Visualización de sucursales”
## "Ramas, confirmaciones y los archivos contenidos dentro"
## “Trabajando en paralelo”
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


