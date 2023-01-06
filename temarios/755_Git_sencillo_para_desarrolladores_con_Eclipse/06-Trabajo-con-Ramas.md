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

Nos pide un nombre para la rama. Además y muy importante nos pide que le indiquemos de que rama queremos partir **`Source: master`**, en este caso solo podemos partir de **Master** ya que no tenemos más ramas por ahora.

<img width="591" alt="image" src="https://user-images.githubusercontent.com/23094588/208853986-0d2df803-f2b1-4beb-aab3-f08c3875ae15.png">

La llamaremos **`caracteristica_1`** y el check que esta marcado **`Check out new branch`** lo que nos indica es que cree la rama y a la vez nos cambiemos a ella, por ahora eso es lo que vamos a poner.

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/208854991-94aef580-c270-452d-ab23-c4eb3722e767.png">

Presionamos **Finish**, podemos observar que nos ha cambiado a la rama recien creada **`caracteristica_1`**.

<img width="291" alt="image" src="https://user-images.githubusercontent.com/23094588/208855237-12b0462f-e016-4d5d-a469-9f1c83cae140.png">

Vamos a crear un nuevo archivo llamado **`caracteristica_1.txt`**

<img width="1392" alt="image" src="https://user-images.githubusercontent.com/23094588/208855886-57ff2657-5233-4f72-8b01-36c5649f87dd.png">

Vamos a commitearlo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208856235-82d0cdd9-a468-488a-ab11-9f2f113de04c.png">

### Mostrar la History

Ya hemos realizado un commit en la rama **`caracteristica_1`**, para apreciar esto tenemos la vista **Hiostory** que vamos a abrir con **click derecho en el nombre del proyecto > Team > Show in History**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208857098-310a31b8-ce4d-4db7-b31f-00ee88770923.png">

Graficamente nos muestra los cambios que hemos realizado hasta hoy y con color verde tenemos las dos ramas creadas hasta el momento **master** y **caracteristica_1** la cual esta un commit por delante. Además junto a **caracteristica_1** tenemos **HEAD** que nos indica donde estamos actualmente. 

<img width="1220" alt="image" src="https://user-images.githubusercontent.com/23094588/208857264-df6c4ae3-222b-4da1-be51-416c2c136159.png">

Tenemos que tener marcado el botón **Show All Branch and Tags** para ver toda esta información.

![image](https://user-images.githubusercontent.com/23094588/210998528-2c90a052-d157-4a1e-ab11-5bca2fffab34.png)

Como esta marcando el último commit que hicimos en la parte de abajo nos informa los datos del commit **commit, Author, Committer, Parent, Child, Branches y Message** y en este caso el fichero que se ha modificado en dicho commit, si se hubieran modificado más aparecerían aquí también. 

Podemos marcar cualquier commit para ver su información.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208859718-278637d6-d6d7-4568-9286-917383bf692d.png">

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208859808-9c4056f1-0aae-4348-ada3-1e127a2859df.png">

## Mergeo de ramas 01:50

En la lección anterior trabajamos sobre una nueva característica de nuestro proyecto para lo cual creamos una nueva rama, ahora lo que queremos es incorporar todos eso cambios en nuestra rama principal **master** a este proceso se le conoce como **Merge o Mergeo**.

Para realizar el **Merge** lo primero que tenemos que hacer es cambiar a la rama **master**, la cual es la rama donde queremos integrar los cambios, para cambiarnos damos **click derecho en el nombre del proyecto > Team > Switch To > master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208860868-f2ac0d3c-0b16-4037-afa9-235145496456.png">

Observemos lo siguiente, en el explorador ya nos indica que estamos en la rama **master**. ***Observemos que aquí no aparece el nuevo archivo*** **caracteristica_1.txt**

<img width="292" alt="image" src="https://user-images.githubusercontent.com/23094588/208861216-0aace34a-4426-4443-9970-0ec6b2fd17d4.png">

Y en el **History** observamos como **HEAD** se a colocado a la altura de **master** para indicar que es la posición donde estamos ubicados actualmente.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208861356-059c7503-dbd9-489d-b676-190ea04364ee.png">

Una vez colocados en la rama donde queremos colocar los cambios vamos a realizar el **Merge** dando **click derecho en el nombre del proyecto > Team > Merge**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208862228-35582cd6-3aaf-4e55-9d12-6405efcbe02c.png">

Nos pide que le indiquemos con que rama vamos a realizar el Mergeo, vamos a marcar **caracteristica_1**, dejamos todas las opciones por defecto.

<img width="592" alt="image" src="https://user-images.githubusercontent.com/23094588/208862746-751232b0-1143-45ef-95dc-b5c348a540f0.png">

Presionamos el botón **Merge**. Nos muestra cual ha sido el resultado del Mergeo, nos indica que ha sido un **Fast-forward**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208862966-c403c9fc-4284-43dc-9703-c139e227cb71.png">

Y ya esta, observemos varias cosas, estamos colocados en la rama **master** y ya tenemos integrado el archivo **caracteristica_1.txt**, por otro lado en el **History** tenemos a la misma altura a **caracteristica_1**, **master** y **HEAD**. Antes teniamos a **master** un coomit por detrás, ahora ya estan todos a la misma altura.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208863607-79bfba43-56db-40fa-b1d4-42ecd0575778.png">

Con todo esto lo que hemos logrado es realizar una nueva funcionalidad en nuestra propia rama y cuando la terminamos incorporamos todos los cambios dentro de nuestra rama principal **master**. 

## Borrar ramas 01:17

Cuando trabajamos con ramas puede llegar el momento en que podemos llegar a tener muchas ramas.

Para ver las ramas actuales podemos entrar en **Git Repositorie > Branches > Local**.

<img width="1221" alt="image" src="https://user-images.githubusercontent.com/23094588/208870290-1db09295-5a36-475c-8ab9-c87060f83aac.png">

Podemos optar por conservar todas las ramas, por si nos interesa saber que fuimos haciendo en cada nueva funcionalidad y poder volver a ellas o podemos optar a borrarla una vez que ya hemos incorporado los cambios a la rama principal. 

En este caso vamos a eliminar la rama **caracteristica_1** pulsando botón derecho en ella y seleccionar **Delete Branch**.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/208871082-ab254934-f30b-482b-9e92-53ad12d4d6a6.png">

Con esto la rama se elimino.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208871288-c58166fa-d6dd-4b7d-9c62-f1d92fa2af8e.png">

Si revisamos el **History** ya no queda rastro de que alguna vez tuvimos la rama **caracteristica_1**. Con esto no seriamos capaces de saber que en ese sitio existio una rama, da la impresión de que hicimos commits continuos sobre la rama **master**. No queda ninguna referencia salvo el comentario.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208871482-6ceddd11-b31b-4c84-a8c2-2188959aa542.png">

## Varias ramas 06:18

Una vez que hemos visto como trabajar con una rama adicional, vamos a ver como se trabaja con varias ramas a la vez, para ello vamos a crear una nueva rama con **click derecho en el nombre del proyecto > Branches > New Branch...** llamada **`rama_1`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208882883-a28cbae4-3013-4e74-ade3-ed6b2ef88ea1.png">

<img width="591" alt="image" src="https://user-images.githubusercontent.com/23094588/208883089-5a4d614d-6039-4468-91c9-64a742834751.png">

Podemos ver en el **History** que ya tenemos la nueva rama **`rama_1`** y si vemos en el nombre de proyecto observamos que ya estamos colocados en ella.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208883158-38ef312d-d461-4994-9f00-490f4e6050e9.png">

Vamos a crear una segunda rama llamada **`rama_2`**.

<img width="593" alt="image" src="https://user-images.githubusercontent.com/23094588/208883638-855e39d8-5a66-44a0-92c6-c72f202e8866.png">

**Aquí debemos tener cuidado por que debemos partir de master y no de rama_1 que es la rama en la que estamos** vamos a cambiarla seleccionandola con el botón **Select...**

<img width="593" alt="image" src="https://user-images.githubusercontent.com/23094588/208884000-65700c27-c7ae-4d60-ae60-ee97928d7889.png">

Presionamos en **Finish**.

Ya tenemos creadas las dos ramas nuevas y actualmente estamos colocados en **`rama_2`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208884160-d02b133e-8f06-4002-8d94-f3a602800022.png">

En el **History** vemos que las ramas **master**, **rama_1**, **rama_2** y **HEAD** esta a la misma altura, ya que hemos creado las dos nuevas ramas pero no hemos realizado ningún commit en ellas.

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/23094588/208884710-eb78d7e5-36bc-498d-8d7b-11fd112c1977.png">

La primera tarea que vamos a hacer es en la **rama_1** sobre el archivo **fichero_1.txt** y realizamos el commit.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208885804-5cc9b54e-8c9b-4dd9-b0ce-37b887c0288e.png">

Si vamos a **History** vemos el commit que hemos realizado.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/208886060-147054b4-d539-4f3f-8ade-ba2348c964f1.png">

Aquí vemos claramente que la **rama_1** junto con **HEAD** se ha ido por delante de **master** y **rama_2**.

Ahora lo que vamos a hacer es irnos a la **rama_2** y vamos a ver el contenido del archivo **fichero_1.txt**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208888365-89d2bf88-641e-4640-939f-a4a48c176f9e.png">

Observamos que los cambios que habíamos realizado en **fichero_1.txt** han desaparecido. Además de que 
**HEAD** se ha movido junto a **master** y **rama_2**.

Vamos a cambiar un archivo diferente **caracteristica_1.txt** para evitar problemas de conflictos y lo vamos a commitear.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208889126-a7df40b9-da18-464c-974d-2d8a37a1cf0b.png">

Si vamos a **History** vemos las diferentes ramas.

<img width="1228" alt="image" src="https://user-images.githubusercontent.com/23094588/208889415-008a1d1b-90ff-4981-b668-5fb1d346c7f2.png">

Lo que nos dice que a partir de la rama **master** hemos creado la **rama_1** y le hemos hecho un commit y tambien vemos que a partir de la rama **master** hemos creado la **rama_2** hemos hecho un commit y que es la rama donde estamos actualmente.

Hemos hecho dos nuevas funcionalidades en paralelo, ahora lo que vamos a hacer es integrarlas en nuestra rama principal **master**, para lo cual vamos a cambiarnos a la rama **master** con **click derecho en el nombre del proyecto > Team > Switch To > master**.

Observemos que el cambio hecho tanto en el **fichero_1.txt** como en **caracteristica_1.txt** han desaparecido y ahora **HEAD** esta a la altura de **master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208891044-54bc88c6-e836-4868-9ae4-992b74f951fc.png">

Entonces vamos a empezar con el Mergeo dando **click derecho en el nombre del proyecto > Team > Merge**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208891665-cedc569d-5b02-416e-952f-d2fe39de7a69.png">

Vamos a comenzar por mergear la rama **rama_2**.

<img width="593" alt="image" src="https://user-images.githubusercontent.com/23094588/208891849-1c79add9-8569-4387-811d-fe68785e93bc.png">

Nos indica que es un **Fast-Forward**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208891902-03e94131-f1f0-481d-a15d-cda6432f3661.png">

En **History** podemos apreciar que **master** y **HEAD** se han colocado a la altura de **rama_2**, simplemente avanzarón su posición.

Ahora vamos a mergear la rama **rama_1** dando **click derecho en el nombre del proyecto > Team > Merge** y seleccionando la rama **rama_1**.

<img width="593" alt="image" src="https://user-images.githubusercontent.com/23094588/208892652-289b37db-e628-442e-a8ca-6288e3db69f2.png">

Aquí vemos que no genera un **Fast-Forward**, sino un **Merged**.

![image](https://user-images.githubusercontent.com/23094588/211008322-baea395d-638f-4fff-ad07-7553e76c9673.png)

En **History** nuestro dibujo a cambiado. **Observe como se creo un nuevo commit(Merge commit) al cual automáticamente se le ha puesto el nombre `Merge branch 'rama1'`, y tanto `master` como `HEAD`se han posicionado a esta altura**.

Vemos que **master** ya no esta a la altura del commit **`Cambios de caracteristica 1`** donde se encontraba originalmente por que ha ído avanzando con cada mergeo.

<img width="1225" alt="image" src="https://user-images.githubusercontent.com/23094588/208892806-4446e719-3040-4530-91fb-923aeafe5734.png">

En resumen tanto **rama_1** como **rama_2** las ha incorporado a **master**. La **rama_1** la pinta realmente como una rama que salio de **master**, pero la **rama_2** la pinta como si fuera un commit secuencial sobre **master**, es decir si borraramos **rama_2** no sabriamos que en ese punto existio una rama. Eso es lo que se conoce como un **FastForward** que se detalla en la seguiente sección.

De esta manera hemos visto como trabajar paralelamente en dos tareas y posteriormente integrarlas a nuestra rama principal **master**.

## Fastforward 07:03

Vamos a ver lo que es el **FastForward**(avance rápido). Cuando mergea, un **FastForward** es el mejor de los escenarios, ya que técnicamente no es una fusión en absoluto. **Es simplemente que una rama "se pone al día" con otra**.

Vamos a ver un ejemplo. Vamos a crear una nueva ramo con **click derecho en el nombre del proyecto > Team > Switch To > New Branch**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211052094-675a9185-8623-402a-aee2-f3e45febe058.png">

Vamos a ponerle de nombre a la rama **fastforward**

<img width="599" alt="image" src="https://user-images.githubusercontent.com/23094588/211052581-10a8d991-5d53-48c4-8ea6-d89fdbba7c4c.png">

Nos cambia a la nueva rama **fastforward**, vamos a editar el archivo **caracteristica_1** para añadir el siguiente texto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211053225-c689d113-60b7-4616-8cc2-a1f5e70a5751.png">

Vamos a hacer commit de este cambio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211053851-08c30aaf-f3d9-49d6-b397-e5da963b892f.png">

Si vemos el **History** tenemos el nuevo commit en la rama **fastforward** el cual esta por delante de la rama **master** y como estamos posicionados en la rama **fastforward** nuestro **HEAD** aparece junto a ella.

Ahora lo que queremos es Mergear la rama **fastforward** con rama **master** por lo que nos debemos cambiar a **master** pulsando **click derecho en el nombre del proyecto > Team > Switch to > master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211055370-ea9c848b-b89a-4e3f-8fed-0ee4d4097cc7.png">

<img width="1220" alt="image" src="https://user-images.githubusercontent.com/23094588/211054147-959734a2-c89f-4d88-93b1-759b8ad50456.png">

Observe como al cam desaparece la rama 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211055682-435ff436-354c-48ca-ae55-bb0f50043e8c.png">








## Rebase 04:50
## Modificar commit 02:30
## Peligro de las ramas 03:38
