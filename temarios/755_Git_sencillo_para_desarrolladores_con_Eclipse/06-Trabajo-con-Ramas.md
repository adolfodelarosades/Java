# 06 Trabajo con Ramas • 8 clases • 33m

* Crear ramas 05:18
* Mergeo de ramas 01:50
* Borrar ramas 01:17
* Varias ramas 06:18
* Fast Forward Commit y Merge Commit 07:03
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

## Fast Forward Commit y Merge Commit 07:03

### Fast Forward Commit

Vamos a ver lo que es el **FastForward**(avance rápido). Cuando mergea, un **FastForward** es el mejor de los escenarios, ya que técnicamente no es una fusión en absoluto. **Es simplemente una rama que "se pone al día" con otra**.

Vamos a ver un ejemplo. Vamos a crear una nueva ramo con **click derecho en el nombre del proyecto > Team > Switch To > New Branch**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211052094-675a9185-8623-402a-aee2-f3e45febe058.png">

Vamos a ponerle de nombre a la rama **fastforward**

<img width="599" alt="image" src="https://user-images.githubusercontent.com/23094588/211052581-10a8d991-5d53-48c4-8ea6-d89fdbba7c4c.png">

Nos cambia a la nueva rama **fastforward**, vamos a editar el archivo **caracteristica_1** para añadir el siguiente texto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211053225-c689d113-60b7-4616-8cc2-a1f5e70a5751.png">

Vamos a hacer commit de este cambio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211053851-08c30aaf-f3d9-49d6-b397-e5da963b892f.png">

Si vemos el **History** tenemos el nuevo commit en la rama **fastforward** el cual esta por delante de la rama **master** y como estamos posicionados en la rama **fastforward** nuestro **HEAD** aparece junto a ella.

<img width="1220" alt="image" src="https://user-images.githubusercontent.com/23094588/211054147-959734a2-c89f-4d88-93b1-759b8ad50456.png">

Ahora lo que queremos es Mergear la rama **fastforward** con rama **master** por lo que nos debemos cambiar a **master** pulsando **click derecho en el nombre del proyecto > Team > Switch to > master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211055370-ea9c848b-b89a-4e3f-8fed-0ee4d4097cc7.png">

Observe como al cambiarnos a la rama **master** en el **History** desaparece la rama **fastforward**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211055682-435ff436-354c-48ca-ae55-bb0f50043e8c.png">

**History** tiene varias vistas dependiendo de la rama en que estemos y sobre todo como este presionado el botón **Show Branches and Tags**. Aquí nos dice *que solo se muestran los commits a partir de **HEAD** y sus parents*.

<img width="286" alt="image" src="https://user-images.githubusercontent.com/23094588/211056955-63986092-1f8a-4e6c-b4d1-ad92e3fb9c16.png">

Si lo pulsamos vamos a ver como cambia, ahora dice *que se muestran todas las ramas que coinciden con los filtros configurados*, en pocas palabras, todas las ramas. 

<img width="292" alt="image" src="https://user-images.githubusercontent.com/23094588/211058699-7cba4edd-cb61-4ed0-8297-5bfd7b1ced7f.png">

Y sobre todo los cambios los vemos en la vista de **History**. Al pulsar el botón **Show Branches and Tags** ya vemos que estamos actualmente en la rama **master** la cual tiene al lado **HEAD** que indica nuestra posición actual, y por delante ya vemos el commit realizado en la rama **fastforward**.

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/23094588/211057231-75522cc6-e216-438b-86ed-02e21a6471ef.png">

Ademas tenemos al lado otro botón que muestra el mensaje **`Show first parent only`**(*mostrar solo el primer padre*). 

<img width="170" alt="image" src="https://user-images.githubusercontent.com/23094588/211060177-6e5c539c-1eda-4a7a-9412-e26094806972.png">

Presisamente el commit en el que estamos posicionados tiene dos commits padres. El primero de ellos es el de la **rama_2** y el segundo es el de la **rama_1** ya que los mergeos los hicimos en ese orden.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211062558-850ecb06-6127-4cf4-81d1-6a30c32f4820.png">

Así que si pulsamos el botón **`Show first parent only`** deja de mostrar el archivo cambiado **`fichero1.txt`** que fue cambiado en la **rama_1**, es decir el padre 2.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211062835-755b703d-98ea-4245-839d-36f81f768b46.png">

Pero observe que en la información que muestra sobre el commit sigue mostrando la referencia a ambos parents.

Vamos a dejarlo como estaba inicialmente(mostrando todos los parents).

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211063119-8cbfaf59-85d6-4576-af6f-c6252b430368.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211060113-9b4049c4-9b7d-4c9d-942a-c20165013cc3.png">

Una vez visto esto del **History**, vamos a realizar el mergeo que para eso nos hemos cambiado a la rama **master**, pulsamos **click derecho en el nombre del proyecto > Team > Merge**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211057980-a8d0df5c-215a-4f79-8a7a-6f7b296661b5.png">

Y vamos a indicar la rama que queremos Mergear que es **fastforward**, observe como ya vamos teniendo varias ramas en nuestro **Local**, de las cuales vamos a marcar **fastforward**.

<img width="597" alt="image" src="https://user-images.githubusercontent.com/23094588/211058353-a161bc94-5a73-4eab-ae06-27e792f4097a.png">

Observe como abajo de donde marcamos la rama tenemos varias opciones que hasta el momento no les habíamos puesto ninguna ateción. Estan agrupadas en dos secciones **`Merge options`** y **`Fast Forward options`**, vamos a centrarnos por ahora en **`Fast Forward options`**, cuya primera opción marcada por default es **`if a fast-forward, only update the branch poiter`**(si es un fast-forward, solo actualice el apuntador de la rama). Vamos a usar esta opción para crear el mergeo por lo que simplemente pulsamos en el botón **Merge**.

Nos aparece información indicando que se ha realizado un **Fast-forward**.

<img width="635" alt="image" src="https://user-images.githubusercontent.com/23094588/211067944-a81a378a-a736-4931-a4ff-675766832757.png">

Y si observamos en el **History** lo único que ha sucedido al realizar un **Fast Forward** es que la rama **master** junto con **HEAD** se han movido para apuntar al commit realizado en la rama **fastforward**, es decir ahora **master**, **fastforward** y **HEAD** apuntan al mismo commit.   

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/23094588/211068261-ab47d855-4b00-4466-a19a-c9a8d9e95904.png">

Por eso al inicio de esta lección deciamos que **Un Fast Forward es simplemente una rama que "se pone al día" con otra** y esto lo hace simplemente moviendo el apuntador a la rama con la cual se esta mergeando.

### Merge Commit

Vamos a ver ahora lo que es el **Merge Commit**(Commit de fusión). Vamos a crear otra rama con **click derecho en el nombre del proyecto > Team > Switch To > New Branch**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211071624-557aa15b-a8c3-4bdc-a1ab-e9c470f8a0b3.png">

Vamos a ponerle de nombre a la rama **merge-commit**.

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/211071839-38856ba3-9dd7-4a4e-9cb1-d7a49d932e79.png">

Vamos a añadir un texto en el archivo **`caracteristicas_1.txt`** y lo vamos a commitear.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211072147-f18e73cc-9dc9-4ec2-9423-b66bfd1f4ed5.png">

Si vemos el **History** después de commitear el archivo tenemos:

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/23094588/211072289-7c2fdfa4-1674-42c0-8bf7-bacfb21507bc.png">

Se ha creado el commit en la rama **merge-commit** y estamos actualmente en el como lo indica **HEAD**.

Vamos a Mergear la rama **merge-commit** en la rama **master** por lo cual nos debemos cambiar a la rama **master** con **click derecho en el nombre del proyecto > Team > Switch to > master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211072554-76b84172-649e-41ba-9846-2cd7ea665191.png">

En el **History** observamos que ya estamos en **master** como lo indica **HEAD**.

<img width="1224" alt="image" src="https://user-images.githubusercontent.com/23094588/211073253-977a5e99-7e29-414d-9330-0acc5ffb5662.png">

Vamos a Mergear con **click derecho en el nombre del proyecto > Team > Merge**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211083201-01baf8c0-8d7e-4f51-ba7f-630e3ed0d503.png">

Vamos a seleccionar la rama **merge-commit** y además vamos a seleccionar la segunda opción dentro de **`Fast forward options`**, la que dice **`if a fast-forward, create a merge commit`**(si es un fast-forward, crea un merge commit).

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/211083391-1e5faef2-35b6-4d1f-86c2-d00ae018eacb.png">

Pulsamos el botón **Merge** y como resultado obtenemos un **Merged**.

<img width="623" alt="image" src="https://user-images.githubusercontent.com/23094588/211084250-f87a0ff3-550f-4f5f-bca7-ca6d4b2c6194.png">

Si observamos que pinta en el **History** tenemos:

<img width="381" alt="image" src="https://user-images.githubusercontent.com/23094588/211084524-6fe6e7ed-cc80-42c6-a894-d354b1f65a9e.png">

Vamos a ver la difernecia de haber cambiado la opción por default **`if a fast-forward, only update the branch poiter`**(si es un fast-forward, solo actualice el apuntador de la rama) por **`if a fast-forward, create a merge commit`**(si es un fast-forward, crea un merge commit). El mismo nombre lo dice, Git creo automáticamente un commit, para ser más exactos creo un **merge commit**, al cual le asigno el mensaje **`Merge branch 'merge-commit'`**.

Hasta este momento nosotros eramos los responsables de crear los commits y asignarles un nombre, pero al seleccionar que hiciera un **merge commit** Git lo hizo automáticamente.

A difernecia del **Fast Forward** donde simplemente el apuntador de **master** avanzaba a la altura de la rama **`fastforward`**, en el **Merge Commit** se crea un nuevo commit por delante del creado en la rama **`master-commit`** y hasta allí avanza la rama **master** quedando por delante de la rama fusionada, no a la misma altura como pasaba con el **Fast Forward**. Además de esto se conserva la rama **`master-commit`** como una rama separada de la **master**.

Con **Fast Forward** simulamos que no ha habido rama en cambio con un **Merge Commit** dejamos constancia de que existio una rama.

Ya dependerá de lo que queramos dejar como constancia en el historial de nuestro repositorio, en este último caso de cierta manera complica un poco el flujo, no era del todo necesario obligar a crear un **Merge Commit**.

Si la política de la empresa es crear una rama para cada nueva funcionalidad y luego reintegramos esa funcionalidad a la rama principal, y nadie ha hecho ningún cambio adicional sobre esa rama principal, podríamos ahorrarnos tener una rama de más deliveradamente, mejor dejarlo como sino hubiera echo rama y nadie se entera, esto sería un **Fast Forward**. 

Pero de lo contrario si queremos dejar constancia de que para cada funcionalidad ha existido una rama la forma es usando deliveradamente un **Merge Commit** en lugar del **Fast Forward**.

Existe un tercer caso donde no queda de otra más que hacer el **Merge Commit** esto pasa cuando trabajamos en tareas paralelas como las que hicimos en las ramas **`rama_1`** y **`rama_2`**. 

<img width="385" alt="image" src="https://user-images.githubusercontent.com/23094588/211091851-e1b45242-3ded-4fc4-86a7-4b16d3053f2a.png">

Si recordamos cuando mergemos estas dos ramas siempre usamos la opción por default. Primero mergueamos la **`rama_2`** y se creo un **Fast Forward** y cuando megueamos la **`rama_1`** ***con la opción por default*** se creo un **Merge Commit** por que en este caso ya se habían realizado tareas en paralelo diferentes a las realizadas en la **`rama_1`** y en ese caso si o si se crea el **Merge Commit**.

### Eliminar Ramas Obsoletas

Por cierto como hemos visto ya tenemos en este momento varias ramas, hasta 5 sino me equivoco, vamos a proceder a borrar las ramas **`rama_1`** y **`rama_2`**. Para ver las ramas actuales podemos entrar en **Git Repositorie > Branches > Local**.

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/23094588/211093365-d07668c7-fc42-4b2b-baf1-aa441c5e2344.png">

Vamos a **colocarnos sobre la rama que queremos eliminar > click derecho > Delete branch**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/211093587-73a776aa-bc6e-4e18-9b69-b6260580e7c1.png">

Repetimos el proceso para ambas ramas y ya no las tenemos en **Local**

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/23094588/211093825-aea3100d-87ff-4967-b1de-ef7aa7d743e1.png">

Si vemos como se veía el **History** antes de borrarlas tenemos:

<img width="385" alt="image" src="https://user-images.githubusercontent.com/23094588/211091851-e1b45242-3ded-4fc4-86a7-4b16d3053f2a.png">

y después de borrarlas tenemos:

<img width="377" alt="image" src="https://user-images.githubusercontent.com/23094588/211094592-d1d04200-49f1-40a8-89d5-e8bc628f917f.png">


Si observamos hemos perdido un Commit el del mensaje **`CAMBIO DE RAMA 1`**

Cosa que realmente no me esperaba por que teniamos un **Merge Commit**. 

Realmente no se ve por que temos pulsado el botón **Show first parent only(mostrar solo el primer padre)**, el cual solo pinta el primer padre por lo que se se ve así:

<img width="1220" alt="image" src="https://user-images.githubusercontent.com/23094588/211096139-e4c690da-15a3-4dfa-add8-7870c9475b7d.png">

Si presionamos nuevamente el botón **Show first parent only(mostrar solo el primer padre)**, observaremos el árbol del **History** como esperabamos.

<img width="1221" alt="image" src="https://user-images.githubusercontent.com/23094588/211096547-3f315a49-2423-478d-995e-7664f3ea2db1.png">

Ya no aparecen las ramas **`rama_1`** y **`rama_2`**, pero si vemos todos los commits que se hicierón en su momento, además queda constacía de que existio una rama, aunque sino fueramos porque nosotros hemos hecho todo el flujo no sabríamos cual era el nombre de dicha rama(Shhhh **`rama_1`**!!!).

## Rebase 04:50

El **Rebase** es el concepto contrario al **Merge Commit** ya sea cuando forzamos una rama aunque pudieramos realizar un **FastForward** o cuando no queda más remedio que crear la rama.

El **Rebase** en estos casos lo que va a hacer es NO crear la rama(aun que no quedará más remedio que crear la rama) y simplemente lo que hara es integrar el commit directamente en la rama **`master`**, esto se parecería a un un **FastForward**, sin serlo.  

Vamos a ver un ejemplo.

Vamos a crear una nueva rama con **click derecho en el nombre del proyecto > Team > Switch To > New Branch**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212171573-e0cb7682-436f-4174-8aa1-ce1ab26294e0.png">

Llamada **`rebase_1`**

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/212171747-e97f9a58-d2bd-475e-977f-a62b2735cbb5.png">

En esta nueva rama vamos a añadir un nuevo archivo **`rebase_1.txt`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212172207-93518269-3229-4766-b1f0-a2221a34f478.png">

Y vamos a commitear el archivo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212478726-eaadd0b0-6aa6-4b13-a3cf-e4142acd66df.png">

Vamos a crear una segunda rama con **click derecho en el nombre del proyecto > Team > Switch To > New Branch**. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212478850-aa661edf-8a68-4752-b610-a577888bd6f5.png">

Debemos tener cuidado al crear esta segunda rama ya que actualmente estamos posicionados en la rama **`rebase_1`** 

<img width="600" alt="image" src="https://user-images.githubusercontent.com/23094588/212479032-2469192b-d7dc-4fc6-b5d0-fb272e462601.png">

y deberíamos partir de la rama **`master`** poe lo que debemos seleccionarla con el botón **Select...**

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212479193-319545f8-b3f0-42bf-8c03-4ccdf5d871c7.png">

<img width="601" alt="image" src="https://user-images.githubusercontent.com/23094588/212479254-4ccfb32d-e6e6-4c93-9820-13a1118a86f7.png">

Una vez cambiada presionamos el botón **Finish**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212479346-d89c1f42-2f61-404f-978d-afc7b8092210.png">

Ya estamos posicionados en la rama **`rebase_2`**, vamos a crear el archivo **`rebase_2.txt`** 

<img width="594" alt="image" src="https://user-images.githubusercontent.com/23094588/212479484-4d6bc28a-9aba-44d6-a22b-7394e3c91f64.png">

Vamos a añadir contenido en el archivo **`rebase_2.txt`** y lo vamos a commitear.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212479622-60195a46-bb2c-4840-b92f-2b084b2f70c6.png">

Vamos a cambiarnos a la rama **`master`** con **click derecho en el nombre del proyecto > Team > Switch To > master**. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212479742-ce5e031a-b2a1-419a-b507-29d6d79a1e16.png">

Si vemos el **History** tenemos lo siguiente:

<img width="1471" alt="image" src="https://user-images.githubusercontent.com/23094588/212479889-e7d5ea3f-5a45-4793-b3c4-555657da0b8e.png">

Ahora vamos a proceder a realizar los mergeos, empezaremos con la rama **`rebase_2`**. Vamos a dar **click derecho en el nombre del proyecto > Team > Merge...**. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212480049-5e45951c-b42a-48a7-b286-f4ecdbbf63b0.png">

Seleccionamos la rama **`rebase_2`**

<img width="599" alt="image" src="https://user-images.githubusercontent.com/23094588/212480098-cc23e721-2820-4fef-b864-a8c74141ec23.png">

Aceptamos la opción por default, como lo hemos realizado hasta ahora.

<img width="627" alt="image" src="https://user-images.githubusercontent.com/23094588/212480206-6b2fc94f-8d78-492d-99c6-4bffcba571f9.png">

Vemos como va quedando el **History**, simplemente se realizo un **FastForward**.

<img width="397" alt="image" src="https://user-images.githubusercontent.com/23094588/212480254-9da34be7-95af-449e-b06d-2b29bd2d8cdd.png">

Ahora pensemos un poco, si ahora simplemente mergeamos la rama **`rebase_1`** lo que vamos a tener al final de hacerlo será un **Merge Commit** con lo que se va a crear una rama si o si, por que se ha trabajado en dos actividades en paralelo. Esto ya lo hemos visto con ejemplos anteriores.

Como queremos evitar la creación de la nueva rama vamos a utilizar el **Rebase** para merger la rama **`rebase_1`**. Vamos a dar **click derecho en el nombre del proyecto > Team > Rebase...**. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212480781-ce97a67a-7a15-4942-9f52-761ed6f00906.png">

Debemos indicar que rama deseamos mergear, en este caso la rama **`rebase_1`**.

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/212480987-5ecca76f-d371-4a3a-97d8-813026b73912.png">

Si vemos el **History**, observamos que en el commit correspondiente al **`rebase_1`** no se creo ninguna rama, simplemente se integro en la rama **`master`**.

<img width="368" alt="image" src="https://user-images.githubusercontent.com/23094588/212481299-1d187cc6-576d-438a-8d9a-95dacf3142c8.png">

Lo que confunde un poco es ver como sale una especie de rama del **`rebase_2`**, pero los cambios de esta rama ya se habían integrado previamente, como podemos ver en el contenido actual de la rama **`master`**.

<img width="1396" alt="image" src="https://user-images.githubusercontent.com/23094588/212482089-979644e8-80c0-413c-b9b5-1d49d2905511.png">

Tenemos a ambos archivos **`rebase_1.txt`** y **`rebase_2.txt`** en la rama **`master`**.

### Resumen

Resuniendo el **Rebase** lo que hace es evitar crear ramas, básicamente en el mergeo de la rama **`rebase_1`** no queda constancia de la creación de una rama. Pero que es lo que pasa, si Git necesita hacer una rama por que no ha podido realizar un **FastForward**, yo creo mejor que quede constancia de la rama por que sino luego no vas a saber lo que ha pasado, yo creo que el funcionamiento normal es decir un **Merge commit** es más claro que un **Rebase**, pero existen ambas posibilidades. El **Rebase** es lo contrario que el **Merge commit**, ingresa el commit directamente en **`master`** sin constancia de que haya existido una rama, hasta ahora tenemos constancia por que tenemos la etiqueta de la rama **`rebase_1`** pero en cuanto la eliminemos ya no hay constancia de nada.


## Modificar commit 02:30

En esta sección vamos a ver lo que es el **Amend de un Commit**, es decir añadir cosas a un commit que ya hayas hecho, lo típico de cuando se nos olvida meter algo en un commit. 

Vamos a ver un ejemplo.

Vamos a crear un nuevo fichero **`anadir.txt`**.

<img width="601" alt="image" src="https://user-images.githubusercontent.com/23094588/212492360-2e6cdaff-d33a-4966-9e4e-a4902e424129.png">

Vamos a agregar contenido al archivo y a commitearlo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212492465-e87fa203-7f53-4bd7-8ed5-9456f64590fc.png">

Si vemos en el **History** tenemos.

<img width="1171" alt="image" src="https://user-images.githubusercontent.com/23094588/212492569-bf07ac81-6f6a-4c6f-aaba-bfe3e3882bca.png">

Vemos nuestro nuevo commit.

Pero de repente recordamos que ademas de crear el nuevo archivo **`anadir.txt`** teniamos que hacer un cambio en el archivo **`caracteristica_1.txt`**.

<img width="1057" alt="image" src="https://user-images.githubusercontent.com/23094588/212492791-daa3297c-639b-4e87-80ee-4ca327933bbd.png">

Y este cambio debía ser parte del commit donde subimos el archivo  **`anadir.txt`**, si realizamos un commit normal tendríamos dos commits en lugar de solo uno.

Por lo cual vamos a realizar un **Amend** en el commit, lo cual se hace como sigue. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212492908-611a1661-0a6e-46da-a3f3-1b4bc6b6ed3a.png">

Tenemos el botón **Amend (Edit Previous Commit)** que al presionarnos nos aparece el mensaje que habáimos dado al commit previo.

<img width="1173" alt="image" src="https://user-images.githubusercontent.com/23094588/212493015-d42f14d2-d5a4-4d79-8d9b-5714a600f390.png">

Ya simplemente presionamos el botón **Commit**.

Si vemos el **History** apreciamos que ambos cambios han quedado en el mismo commit **`Añadir contenido`**, aunque realmente lo hicimos con dos commits.

<img width="1175" alt="image" src="https://user-images.githubusercontent.com/23094588/212493168-7050b404-6c0f-4acc-8a7e-951121773f89.png">

Esto es el **Amend de un Commit**, ojo con esto por que se puede hacer mientras estes trabajando en local, en cuanto este cambio se suba a un servidor eso ya empieza a hacer problematico, por que ese cambio el primer cambio lo pudo haber cogido algún otro elemento de los usuarios del repositorio. Mientras que si solo esta trabajando en local todo queda en casa.


## Peligro de las ramas 03:38
