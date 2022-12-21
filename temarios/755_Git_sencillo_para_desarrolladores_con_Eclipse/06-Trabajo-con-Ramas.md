# 06 Trabajo con Ramas • 8 clases • 33m

* Crear ramas 05:18
* Mergeo de ramas 01:50
* Borrar ramas 01:17
* Varias ramas 06:18
* Fastforward 07:03
* Rebase 04:50
* Modificar commit 02:30
* Peligro de las ramas 03:38

## Crear ramas 05:18

Si hay algo en lo que destaca Git es en la gestión de las ramas, con la ventaja añadida de que puedo trabajar de forma desconectada ya que tenemos localmente todo el repositorio.

Por defecto nosotros trabajamos en la rama llamada **Master** que es la única creada hasta ahora. Generarlmente el contenido de la rama **Master** que es nuestra rama principal es lo que se suele liberar a Producción.

<img width="203" alt="image" src="https://user-images.githubusercontent.com/23094588/208852837-86b91415-a259-4ff1-9e75-fb2068f82f51.png">

Normalmente cuando trabajamos en una nueva funcionalidad y comenzamos ha hacerla y después de una jornada la tenemos a medias y se nos ocurre subirla en **Master** posiblemente esto pueda causar problemas a otros usuarios que esten trabajando con el proyecto y que son ajenos a esa nueva funcionalidad. Lo que realmente deberíamos hacer cuando trabajamos en una nueva funcionalidad es crear una nueva rama y allí desarrollar todo lo referente a esa nueva funcionalidad. Y si por alguna razón tenemos que corregir una incidencia podemos cambiarnos de rama y resolverla. 

La manera de crear ramas se hace de la siguiente manera, **dando click derecho en el nombre del proyecto > Team > Switch To > New Branch...**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208853811-9e8657db-01fb-4044-b495-66a00f3c24e9.png">

Nos pide un nombre para la rama.

<img width="591" alt="image" src="https://user-images.githubusercontent.com/23094588/208853986-0d2df803-f2b1-4beb-aab3-f08c3875ae15.png">

Nos pide que le indiquemos de que rama queremos partir **`Source: master`**, en este caso solo podemos partir de **Master** ya que no tenemos más ramas por ahora, nos pide el nombre de la rama, la llamaremos **`caracteristica_1`** y el check que esta marcado **`Check out new branch`** lo que nos indica que cree la rama y a la vez nos cambiemos a ella, por ahora eso es lo que vamos a poner.

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/208854991-94aef580-c270-452d-ab23-c4eb3722e767.png">

Presionamos **Finish**, podemos observar que nos ha cambiado a la rama recien creada **`caracteristica_1`**.

<img width="291" alt="image" src="https://user-images.githubusercontent.com/23094588/208855237-12b0462f-e016-4d5d-a469-9f1c83cae140.png">

Vamos a crear un nuevo archivo llamado **`caracteristica_1.txt`**

<img width="1392" alt="image" src="https://user-images.githubusercontent.com/23094588/208855886-57ff2657-5233-4f72-8b01-36c5649f87dd.png">

Vamos a commitearlo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208856235-82d0cdd9-a468-488a-ab11-9f2f113de04c.png">

### Mostrar la History

Ya hemos realizado un commit en la rama **`caracteristica_1`**, para apreciar esto tenemos la vista **Hiostory** que vamos a abrir.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208857098-310a31b8-ce4d-4db7-b31f-00ee88770923.png">

<img width="1220" alt="image" src="https://user-images.githubusercontent.com/23094588/208857264-df6c4ae3-222b-4da1-be51-416c2c136159.png">

Graficamente nos muestra los cambios que hemos realizado hasta hoy y con color verde tenemos las dos ramas creadas hasta el momento **master** y **caracteristica_1** la cual esta un commit por delante. Además junto a **caracteristica_1** tenemos **HEAD** que nos indica donde estamos actualmente. 

Como esta marcando el último commit que hicimos en la parte de abajo nos informa los datos del commit **commit, Author, Committer, Parent, Branches** y el fichero que se ha modificado en dicho commit. 



## Mergeo de ramas 01:50
## Borrar ramas 01:17
## Varias ramas 06:18
## Fastforward 07:03
## Rebase 04:50
## Modificar commit 02:30
## Peligro de las ramas 03:38
