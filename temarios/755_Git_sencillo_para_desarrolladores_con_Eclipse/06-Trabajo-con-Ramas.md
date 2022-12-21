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

Podemos marcar cualquier commit para ver su información.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208859718-278637d6-d6d7-4568-9286-917383bf692d.png">

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208859808-9c4056f1-0aae-4348-ada3-1e127a2859df.png">

## Mergeo de ramas 01:50

En la lección anterior trabajamos sobre una nueva característica de nuestro proyecto para lo cual creamos una nueva rama, ahora lo que queremos es incorporar todos eso cambios en nuestra rama principal **master** a este proceso se le conoce como **Merge o Mergeo**.

Para realizar el **Merge** lo primero que tenemos que hacer es cambiar a la rama **master** de la siguiente manera.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208860868-f2ac0d3c-0b16-4037-afa9-235145496456.png">

Observemos lo siguiente, en el explorador ya nos indica que estamos en la rama **master**. Observemos que aquí no aparece el nuevo archivo **caracteristica_1.txt**

<img width="292" alt="image" src="https://user-images.githubusercontent.com/23094588/208861216-0aace34a-4426-4443-9970-0ec6b2fd17d4.png">


Y en el **History** observamos como **HEAD** se a colocado a la altura de **master** para indicar que es la posición donde estamos ubicados actualmente.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208861356-059c7503-dbd9-489d-b676-190ea04364ee.png">

Una vez colocados en la rama donde queremos colocar los cambios vamos a realizar el **Merge** dando **click derecho en el nombre del proyecto > Team > Merge**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208862228-35582cd6-3aaf-4e55-9d12-6405efcbe02c.png">

Nos pide que le indiquemos con que rama vamos a realizar el Mergeo, vamos a marcar **caracteristica_1**, dejamos todas las opciones por defecto.

<img width="592" alt="image" src="https://user-images.githubusercontent.com/23094588/208862746-751232b0-1143-45ef-95dc-b5c348a540f0.png">

Presionamos el botón **Merge**. Nos muestra cual ha sido el resultado del Mergeo, nos indica que ha sido un **Fast-forward**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208862966-c403c9fc-4284-43dc-9703-c139e227cb71.png">

Y ya esta, observemos varias cosas, estamos colocados en la rama **master** y ya tenemos integrado el archivo **caracteristica_1.txt**, por otro lado en el **History** tenemos a la misma altura a **caracteristica_1**, **master** y **HEAD**. Antes teniamos a **master** uno por detrás, ahora ya estan todos a la misma altura.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208863607-79bfba43-56db-40fa-b1d4-42ecd0575778.png">

Con todo lo que hemos logrado es realizar una nueva funcionalidad en nuestra propia rama y cuando la terminamos incorporamos todos los cambios dentro de nuestra rama principal **master**. Para ver las ramas actuales podemos entrar en **Git Repositorie > Branches > Local**.

<img width="1221" alt="image" src="https://user-images.githubusercontent.com/23094588/208870290-1db09295-5a36-475c-8ab9-c87060f83aac.png">

## Borrar ramas 01:17

Cuando trabajamos con ramas puede llegar el momento en que podemos llegar a tener muchas ramas.

Podemos obtar por conservar todas las ramas por si nos interesa saber que fuimos haciendo en cada nueva funcionalidad y poder volver a ellas o podemos optar a borrarla una vez que ya hemos incorporado los cambios a la rama principal. En este caso vamos a eliminar la rama **caracteristica_1** pulsando botón derecho en ella y seleccionar **Delete Branch**.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208871082-ab254934-f30b-482b-9e92-53ad12d4d6a6.png">

Con esto la rama se elimino.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208871288-c58166fa-d6dd-4b7d-9c62-f1d92fa2af8e.png">

Si revisamos el **History** ya no queda rastro de la que alguna vez tuvimos la rama **caracteristica_1**. Con esto no seriamos capaces de saber que en ese sitio existio una rama, da la impresión de que hicimos commits continuos sobre la rama **master**. No queda ninguna referencia salvo el comentario.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208871482-6ceddd11-b31b-4c84-a8c2-2188959aa542.png">


## Varias ramas 06:18
## Fastforward 07:03
## Rebase 04:50
## Modificar commit 02:30
## Peligro de las ramas 03:38
