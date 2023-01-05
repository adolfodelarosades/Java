# 05 Uso de Git con Eclipse • 4 clases • 20m

* Añadir contenido 05:35
* Añadir contenido parcialmente 03:52
* Preferencias 04:26
* Stash guardar trabajos a medias 05:40

## Añadir contenido 05:35

Vamos a comerzar abriendo Eclipse en el Workspace correspondiente a este curso **`755_Git_con_Eclipse`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208664501-5ee615ee-af5b-4989-843a-908c100f8aa0.png">

Vamos a crear un nuevo proyecto General (no es un proyecto Java).

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208665689-74dd3289-6f00-4a71-8ad0-7dd4d1ed38fd.png">

Vamos a darle el nombre **`cursoegit`**

<img width="603" alt="image" src="https://user-images.githubusercontent.com/23094588/208665889-e577bccd-d8b7-4627-895a-d8faa0b26c3c.png">

Se crea un nuevo proyecto vacío.

<img width="380" alt="image" src="https://user-images.githubusercontent.com/23094588/208666144-96fcc57a-5589-46df-9d25-d5c06aa9454f.png">

Vamos a crear un nuevo archivo dentro del proyecto **`fichero1.txt`**.

<img width="607" alt="image" src="https://user-images.githubusercontent.com/23094588/208666421-eb4486c3-2890-42be-bea8-1c9ddc77299c.png">

<img width="1177" alt="image" src="https://user-images.githubusercontent.com/23094588/208666539-8a209567-3e68-48af-acb6-a608d790c277.png">

Vamos a meter algo de contenido en este nuevo archivo **`fichero1.txt`**.

<img width="1185" alt="image" src="https://user-images.githubusercontent.com/23094588/208666819-e669db0b-a36e-4720-9cdd-122239903579.png">

Una vez que tenemos el nuevo archivo con su respectivo contenido ahora lo que queremos es meterlo dentro del control de versiones de Git.

Esto lo vamos a hacer con un **click derecho sobre el nombre del proyecto > Team > Share Project...**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208668668-e6abf454-74cb-4b2c-a8bb-4d154c9690cf.png">

Nos presenta la siguiente pantalla.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208669168-a5508358-1e72-43ac-905b-1a2cfce2c63d.png">

Lo vamos a hacer de la manera más sencilla. Vamos a marcar el **check - Use or create repository in parent folder of project**, esta opción le indica que cree el repositorio en la carpeta padre del proyecto.

<img width="774" alt="image" src="https://user-images.githubusercontent.com/23094588/208669741-b26591d7-f00c-4898-9ecd-5f75447995c2.png">

Presionamos el botón **Create Repository**.

<img width="769" alt="image" src="https://user-images.githubusercontent.com/23094588/208669968-fea9b3f2-7b91-4a72-845a-d2236c44523a.png">

Presionamos en **Finish**.

Una vez echo esto vemos que el proyecto se presenta un poco diferente en el IDE.

<img width="381" alt="image" src="https://user-images.githubusercontent.com/23094588/208670211-6274d297-ab35-48ba-93c4-2ab6b0f59343.png">

Una vez echo esto vemos que el proyecto se presenta un poco diferente en el IDE.

Hasta aquí lo que tenemos es un repositorio en LOCAL, si abrimos en el Explorador de Archivos la carpeta del proyecto vemos que se a creado la carpeta **`.git`**. No es lo más recomendable tener la carpeta **`.git`** dentro del mismo proyecto, pero para este primer ejemplo nos vale. 

<img width="553" alt="image" src="https://user-images.githubusercontent.com/23094588/208670609-74770d5d-2585-4ab1-b30b-27b0c9142839.png">

<img width="794" alt="image" src="https://user-images.githubusercontent.com/23094588/208670888-842c451e-66f9-4c67-8546-1ca87f019093.png">


### Vista Git

Vamos a abrir la Vista Git con la opción **Windows > Other... > Git > Git Staging**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208672763-5a93f738-0d0a-4d45-8524-89e01e61bace.png">

<img width="325" alt="image" src="https://user-images.githubusercontent.com/23094588/208672901-0695a841-03e6-4b2c-85c2-40b11c0a0622.png">

Esto nos abre en el IDE la siguiente vista.

<img width="1142" alt="image" src="https://user-images.githubusercontent.com/23094588/208673075-be45b770-74bf-443b-869e-2fe9dcced8a4.png">

Con esta vista ya va a ser posible realizar los commits, en esta vista tenemos básicamente 3 áreas, **Unstaged Changes**, **Staged Changes** y **Commit Message**.

**Unstaged Changes** nos indica los cambios que no estan subidos en el repositorio.

**Staged Changes** a esta zona también se le conoce como Index.

**Commit Message** donde indicaremos un mensaje que acompañara al commit.

En la sección **Unstaged Changes** vemos a **`fichero1.txt`** que es el fichero que añadimos, si damos doble click en el vemos lo siguiente:

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208685908-99191c39-dec6-4e54-826b-b5364608c089.png">

Se nos abre una ventana donde podemos ver los cambios que hemos hecho en el archivo para que nos sirva como referencia para ver lo que podamos subir.

Además de este archivo hay dos más que son añadidos por el IDE al crear el proyecto.

Vamos a marcar nuestro archivo

<img width="1307" alt="image" src="https://user-images.githubusercontent.com/23094588/208686771-0297177a-b65b-4c64-a55e-ad94eec5e54f.png">

y vamos a presionar el signo de más para añadirlo en la zona **Staged Changes**.

<img width="1311" alt="image" src="https://user-images.githubusercontent.com/23094588/208686992-146d4bb4-1802-4615-b788-5d090781b6ec.png">

La zona **Staged Changes** es una zona intermedia que nos permite ir seleccionando los archivos que vamos ir commiteando y cuales no, en este caso de los 3 archivos que tenemos solo hemos por ahora añadido el que nos otros creamos, vamos a añadir los otros 2 archivos para añadirlos en nuestro primer commit.

<img width="1317" alt="image" src="https://user-images.githubusercontent.com/23094588/208692771-559e9aa6-af55-4f6b-96de-aa5c986748e7.png">

En **Commit Message** vamos a poner el siguiente mensaje:

<img width="1322" alt="image" src="https://user-images.githubusercontent.com/23094588/208693081-c217f723-2f17-4a55-bfcd-43a6ef2b26d8.png">

Como por el momento no tenemos un repositorio remoto sino solo un repositorio local vamos a presionar el botón **Commit**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208693672-a4699f95-6485-4b41-88b4-f213a8daeae0.png">

Vemos que ya no tenemos los archivos y el aspecto en el Explorador a cambiado. El iconito naranja indica que ya esta bajo el control de un repositorio de versiones. Nos aparece un archivo **`.DS_Store`** que vamos a hacer como que no estuviera.

Hemos realizado nuestro primer Commit.

## Añadir contenido parcialmente 03:52

Vamos a añadir el archivo **`elquijote.txt`** con un contenido "amplio".

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208716630-cbeec340-779b-4f6e-bb71-c89ff6ff3503.png">

Vamos a commitear el archivo **`elquijote.txt`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208717974-cce0575b-a728-4b1c-98f9-e8a5fcb9b113.png">

Hemos pulsado **`Ignore`** en **`.DS_Store`** para no subir este archivo.

<img width="201" alt="image" src="https://user-images.githubusercontent.com/23094588/208718108-184f15b8-9fc6-4f16-a305-2fcbdf2687c6.png">

Ahora en **`elquijote.txt`** vamos a añadir el siguiente texto en el inicio y en el fin del texto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208718890-6e37e389-234a-463b-9ff2-25d8ec62b836.png">

Si doy doble clicks en el archivo **`elquijote.txt`**.

<img width="1183" alt="image" src="https://user-images.githubusercontent.com/23094588/208719235-e233eed4-5c59-4f8b-a424-0ad64994ca55.png">

Si vemos esta última imagen en el lado izquierdo tenemos el archivo **`elquijote.txt`** modificado y del lado derecho tenemos el **`index: elquijote.txt(editable)`**.

Con Git tenemos la posibilidad de subir cambios con contenido parcial, aquí el cambio superior NO lo vamos a subir y el cambio inferior si lo vamos a subir, para lo cual en el cambio inferior nos colocamos en la línea que indica el cambio y nos aparecen los simbolos **`>`** y **`<`** que nos permiten pasar código de un lado a otro, en este caso vamos a poner el cambio que si queremos subir en el Indice y lo guardamos.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208720926-5aafe59e-2397-4a0c-b81d-230ccbe4a527.png">

Observe como ahora el archivo **`elquijote.txt`** aparece tanto en la zona **Unstaged Changes** como en **Staged Changes** 

Si pulsamos en **`elquijote.txt`** que se encuentra en **Unstaged Changes** tenemos.

<img width="1188" alt="image" src="https://user-images.githubusercontent.com/23094588/208721506-f461b54d-f6c8-4d66-a4d2-4f6d4f2907e6.png">

Y si pulsamos en **`elquijote.txt`** que se encuentra en **Staged Changes** tenemos.

<img width="1191" alt="image" src="https://user-images.githubusercontent.com/23094588/208721741-61e2cf6a-71d9-4739-aa1d-f7a8a124f4d7.png">

Podemos observar los cambios parciales que hemos realizado, vamos a hacer el commit.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208722107-7b2c8242-f987-488c-b378-700938268e34.png">

El que estaba en **Staged Changes** ha desaparecido por que ya se ha commiteado.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208722309-6182c76e-0fe5-46a4-9add-fda2753ba20d.png">

Y lógicamente en **Unstaged Changes** sigue estando lo que no subimos.

<img width="1187" alt="image" src="https://user-images.githubusercontent.com/23094588/208722624-86343e88-7ed6-4b51-9dd0-b142b1ffdf4e.png">

Con esta funcionalidad lo que hemos hecho es subir parcialmente los cambios que realmente nos interesan subir y los que no los podemos desechar con la siguiente opción, pulsando boton derecho y pulsando en **`Replace with HEAD Revision`** que básicamente es como decirle que descarte los cambios.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208723210-29003788-77b7-4572-b68d-2ddb5a76944b.png">

Nos pide que confirmemos que realmente queremos descartar los cambios.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208723295-44d1655e-f624-41ff-a77a-82fb7125b525.png">

Pulsamos en el botón **`Discard Changes`**.

Ya no tenemos el archivo **`elquijote.txt`** en **Unstaged Changes** y por supuesto ya no existe ningún cambio en **`elquijote.txt`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208723889-71af9898-c40e-4061-a403-87ac0f6cf232.png">

Solo tenemos los cambios comiteados.

<img width="1192" alt="image" src="https://user-images.githubusercontent.com/23094588/208724527-24a18623-a29a-443c-9ff6-a05834b95edf.png">

## Preferencias 04:26

En esta lección vamos a ver un poco la configuración de Git. El pluging integrado en Eclipse para trabajar con Git se llama **egit** y ya viene integrado sin necesidad de realizar ninguna instalación.

Para ver la configuración entramos en **Preferences > Team > Git** 

<img width="767" alt="image" src="https://user-images.githubusercontent.com/23094588/208725896-2417b4ff-f10a-4f33-9d1b-c2478b1d3ae7.png">

y dentro de esto hay varias opciones que podemos ver siendo la **Configuration** una de ellas.

<img width="768" alt="image" src="https://user-images.githubusercontent.com/23094588/208726086-82e406ac-4016-42e5-a96a-6740e46c1c19.png">

Esta presentación es un poco de bajo nivel comparada con otras herramientas, nos pone la configuración de Git dentro de Eclipse.

Aquí podemos configurar el **user** tanto el **email** como el **name** que son los que aparecen en los commits.

Otra cosa importante que podemos configuración son las claves SSH en caso de que las usemos en **GitHub** o **GitLab**. 

En el buscador escribimos **ssh** ya que no es parte de Git sino de Eclipse.

<img width="868" alt="image" src="https://user-images.githubusercontent.com/23094588/208727334-6df3a9b9-c5ca-4d73-a619-da2406d0232b.png">

Es aquí donde le tenemos que indicar donde esta el certificado, la clave privada. Si trabajamos en Mac estará en el **`.ssh`** y le indicamos las claves privadas **Private keys** que queremos utilizar, si tenemos una diferente tendríamos que añadirla con el botón **`Add Private Key...`** y con esto el solo cuando necesite una conexión SSH ya nos pedira la contraseña y luego el se la guarda. Ya lo retomaremos cuando hagamos una conexión con los servidores.

El resto de opciones generalmente no se tocan.


## Stash guardar trabajos a medias 05:40

Otra de las características bastante interesantes que tiene Git es el hecho de guardar trabajos que estan a medias.

Supongamos que estoy trabajando en cambios en el archivo **`elquijote.txt`** añadiendo cierto texto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208731773-0141b442-199b-45b7-abc7-68589c79dce7.png">

Y de repente llega nuestro jefe y nos indica que dejemos lo que estamos haciendo por que se ha reportado una incidencia y hay que arreglarla.

Lógicamente el cambio en el cual estamos trabajando actualmente no lo podemos subir.

En condiciones normales que se hace, es cojer el fichero o los ficheros cambiados, los copiamos en una carpeta por allí temporal, dejar todo el código limpio sin nuestros cambios para poder hacer los nuevos cambios que nos han pedido, subirlos y luego ir a la carpeta temporal para recuperar lo que llevabamos y volverlo a poner en nuestro código para proceder con nuestra tarea inicial.

Con Git todo lo anterior lo podemos hacer de una manera más elegante. 

Para iniciar vemos los cambios que tenemos actualmente y que no debemos subir.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208733236-48b65f30-3247-4d05-8074-4b0c3562e5de.png">

Vamos a presionar **click derecho sobre el nombre del proyecto > Team > Stashes > Stash Changes...**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208733517-e7d25c66-60b5-4bda-b801-229f181606e4.png">

Nos pide un nombre para el **Stash**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208733722-ee506cf6-289a-45b3-b17a-239514fd9175.png">

vamos a darle el nombre **`mis cambios no terminados`**

<img width="553" alt="image" src="https://user-images.githubusercontent.com/23094588/208733880-b2512966-6599-489a-b231-64e9acbf7c85.png">

Incluso nos permite añadir archivos que no hayamos subido al control de versiones si marcamos el check **`Include untracked files`** esto nos serviria para ficheros nuevos que en este ejemplo no aplica.

Simplemente presionamos el botón **`Stash`**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208734560-14a22652-2c42-4670-95be-7bdfaba6fe89.png">

Al hacer esto vemos que desaparecen todos los cambios que habíamos realizado. Realmente solo era un cambio en este ejemplo el cual ha desaparecido. Nos ha dejado una versión limpia.

<img width="1189" alt="image" src="https://user-images.githubusercontent.com/23094588/208734867-b7dbc943-9b5f-4b16-aee8-f63e2a12a983.png">

En este escenario que estamos contando deberíamos resolver la incidencia que nos han pedido, por ejemplo pensemos que es añadir un texto en el archivo **`fichero1.txt`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208735503-e1878b62-70df-4224-a9d8-aa4760d80960.png">

Una vez resuelta la incidencia la subimos en la zona **Git Staging**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208735833-88754617-7f04-4a06-8ab1-6124c699a102.png">

Y hacemos el Commit, con esto ya hemos terminado de resolver la incidencia.

Ahora vamos a continuar con nuestro trabajo inicial, tenemos que recuperar el trabajo que teniamos a medias y que guardamos en el **Stashes**.

Vamos a presionar **click derecho sobre el nombre del proyecto > Team > Stashes > 0:mis cambios no terminados**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208736447-f23dbb9b-53d9-45c7-8dc4-96554c5495ba.png">

Nos va a salir una ventana con el mensaje que le pusimos al **Stashe** y la lista de los archivos cambiados que en este caso es uno **elquijote.txt**.

<img width="1187" alt="image" src="https://user-images.githubusercontent.com/23094588/208736845-8acfff59-882b-4dc5-b690-fad4dea39765.png">

Incluso si pulsamos en la pestaña **Diff** nos da las diferencias al estilo Git.

<img width="1183" alt="image" src="https://user-images.githubusercontent.com/23094588/208737127-d5186b32-0121-4b6c-b835-6056391761bc.png">

En la parte superior derecha junto al nombre **`cursoegit`** hay un icono con una flecha verde que nos sirve para indicar que **Apply Stashed**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208737708-0ddf9b0d-ab53-4ce2-94e0-87fc1f458e2d.png">

Y con esto lo que hemos hecho es recuperar nuestros cambios, podemos ver que en la zona de **Unstaged Changes** nos aparece el archivo **elquijote.txt** que es el que habíamos guardado en el **Stashe**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208738169-b8453174-a559-4788-a91f-986507730196.png">

Podemos ver lo que habíamos añadido.

<img width="1183" alt="image" src="https://user-images.githubusercontent.com/23094588/208738609-67ea7ea6-8d69-4c7e-9d84-db13b040b9ed.png">

<img width="1391" alt="image" src="https://user-images.githubusercontent.com/23094588/208738732-1ae5229d-ca55-4583-a425-b8ab66b564ad.png">

Continuamos con nuestro trabajo y lo terminamos.

<img width="1311" alt="image" src="https://user-images.githubusercontent.com/23094588/208738934-8be7d21e-bd24-4b3a-80a7-9ab3f33ab937.png">

Y ahora si ya podemos realizar el commit de este trabajo.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/208739253-d91f337b-38fb-4f70-bbcb-7a46ff5600f7.png">

Hasta aquí ya tenemos todo nuestro proyecto subido en nuestro repositorio local.

<img width="204" alt="image" src="https://user-images.githubusercontent.com/23094588/208739544-598fa232-9b48-4b53-a770-990d82404285.png">

Lo que si que tenemos que tener claro es que el **Stashe** lo seguimos teniendo, para verlo lo que vamos a hacer es abrir la vista **Git Repositorie** y si abrimos **Stashed Commits** vemos que tenemos nuestro **stash: mis cambios no terminados**.

<img width="1312" alt="image" src="https://user-images.githubusercontent.com/23094588/208740108-1d6e92cb-c81b-4de5-b1c9-9d0c2ed6b1e5.png">

Y como ya no lo necesitamos podemos presionar botón derecho sobre el y borrarlo.

<img width="1315" alt="image" src="https://user-images.githubusercontent.com/23094588/208740633-b8003bb6-2619-47fd-b6d4-377e42b4a892.png">

<img width="553" alt="image" src="https://user-images.githubusercontent.com/23094588/208740727-3ad9c7e4-3584-4a21-b88a-d626bbf51a2c.png">

Y si observamos ya no tenemos la zona **Stashed Commits**

<img width="1312" alt="image" src="https://user-images.githubusercontent.com/23094588/208740886-35975746-277a-4ec7-9dee-cbccf7a43453.png">

Esto es lo que tendríamos que hacer para resolver Incidencias HOTFIX mientras trabajamos en otras tareas.
