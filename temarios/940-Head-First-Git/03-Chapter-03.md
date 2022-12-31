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

## Los Commits no son suficientes
## “Espejo, espejo en la pared: ¿quién es el log más bonito de todos?”
## ¿Cómo funciona el registro de git `git log`?
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



