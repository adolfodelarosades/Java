# 07 Trabajo con Repositorios • 5 clases • 25m

* Repositorios remotos 09:21
* Repositorios remotos con GitHub 03:22
* Publicar cambios 04:38
* Clonar repositorios 04:28
* Bajar cambios 03:21

## Repositorios remotos 09:21

Hasta ahora todo lo que hemos trabajado con el Git ha sido en Local, no tenemos ningún repositorio remoto, lo que es un problema en sí mismo ya que si se nos daña el ordenador perdemos todo el trabajo. Tampoco tenemos forma de compartir el trabajo con otros miembros del equipo.

Para eso existe el concepto de **Servidores Remotos**. A diferencia de **Subversion** donde tenemos un servidor donde esta todo el contenido, todo el proyecto con todos sus historicos, sus etiquetas, etc. 

En Git todo el mundo tiene una copia de todo, pero claro necesitamos compartirlo. Para compartirlo lo más típico es tener **GitHub**, **GitLab** que suele ser más típico en empresas, pero realmente no es necesario tener un servidor montado, lo vamos a demostrar.

### Crear Servidor "Remoto" en el mismo ordenador

Vamos a crear un repositorio en el mismo ordenador pero quien dice en el mismo ordenador podría decir en una carpeta compartida en la Red.

La forma más sencilla de crear un repositirio que no sea un **GitHub** o **GitLab**, es decir localmente  es usando la línea de comandos.

Lo primero que vamos a hacer es abrir la consola en la carpeta personal.

Me voy a ir a la carpeta donde tengo el proyecto **`cursoegit`** es decir **`Documents/PROYECTOS/Eclipse/755_Git_con_Eclipse`**.

![image](https://user-images.githubusercontent.com/23094588/212536983-70af131a-d60e-4cea-8216-9870294a6f67.png)

Ahora lo que vamos a hacer es un clone  sin la copia de trabajo de nuestro proyecto, esto lo hacemos con la instrucción:

```sh
git clone --bare cursoegit
```

<img width="1252" alt="image" src="https://user-images.githubusercontent.com/23094588/212535641-3851eb13-b2b3-472a-9e2a-55e32dd854b6.png">

Por un lado tengo mi carpeta de trabajo **`cursoegit`** con el contenido del proyecto y por otro lado tengo la carpeta del repositorio **`cursoegit.git`** con todo lo que corresponde a las carpetas de un repositorio Git.

<img width="1262" alt="image" src="https://user-images.githubusercontent.com/23094588/212535724-9befc692-eb49-41d7-aaa5-2ac0933b2a01.png">

Recordemos que dentro de la carpeta **`cursoegit`** tenemos nuestro repositorio representado con la carpeta **.git** y podemos ver su contenido.

<img width="1265" alt="image" src="https://user-images.githubusercontent.com/23094588/212535892-dff66a5c-3a7e-47f8-b437-69b8c1eaab52.png">

Realmente lo que hemos hecho con el comando **`git clone --bare cursoegit`** es copiar el contenido de la carpeta **.git** a la carpeta **`cursoegit.git`**.

Vamos a mover la carpeta **`cursoegit.git`** dentro de la carpeta **`Repositorios-GIT`**, que es donde vamos a colocar realmente nuestro Servidor "remoto" simulado.

Por lo que nuestras carpetas quedan así.

Carpeta del repositorio remoto.

<img width="740" alt="image" src="https://user-images.githubusercontent.com/23094588/212537135-4a8d88ac-48ff-4e26-9ec5-c79da782f69b.png">

Carpeta de trabajo localmente.

<img width="1298" alt="image" src="https://user-images.githubusercontent.com/23094588/212537165-e71742c6-5c95-4f2a-9798-c37049240dee.png">

### Enlazar Repositorio Remoto.

Vamos a Eclipse en la pestaña **Git Repositorie** y **remotes**.

<img width="589" alt="image" src="https://user-images.githubusercontent.com/23094588/212537293-79f5383c-86ad-4b13-bbf9-2979d741f6a2.png">

Damos ***click derecho > Create remote***.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212537326-3d7ba8a6-fde9-43c3-91dd-73724307e9a1.png">

Nos muestra una ventana para configurar el Servidor Remoto.

<img width="600" alt="image" src="https://user-images.githubusercontent.com/23094588/212537371-5c31747d-aa7a-4f81-82d8-6cad4e73ebf7.png">

Por defecto el Servidor Remoto principal se llama **`origin`** es una convención que existe, le podemos dar el nombre que queramos pero por defecto se llama **`origin`**. 

Tenemos dos opciones **Configure push** y **Configure fetch**, **push** nos permite subir nuestros cambios al servidor y **fetch** descargar del servidor todos los cambios existentes a nuestro local.

Lo que nosotros vamos a hacer es configurar el **fetch** seleccionamos la opción **Configure fetch**.

<img width="596" alt="image" src="https://user-images.githubusercontent.com/23094588/212537612-a86c925d-ed3d-45a9-b320-81dacfa48759.png">

Presionamos el botón **Create**.

<img width="639" alt="image" src="https://user-images.githubusercontent.com/23094588/212537636-c33f149d-c9ed-4dd8-bcfa-e9b4eb1e7fdb.png">

Nos muestra las referencias, vamos a indicar el URI donde tenemos el servidor remoto, pulsamos el botón **Change...**.

<img width="593" alt="image" src="https://user-images.githubusercontent.com/23094588/212537719-53e02217-d094-4193-ba49-1b4e63870e41.png">

Con el botón **Local Folder...** vamos a indicar la ruta del repositorio remoto.

<img width="1048" alt="image" src="https://user-images.githubusercontent.com/23094588/212537767-d8764d2a-7234-40ed-9d7a-92bcf3fc9dbf.png">

<img width="594" alt="image" src="https://user-images.githubusercontent.com/23094588/212537780-eca1ab0d-583f-4bb8-a54c-287f7c18dc59.png">

Pulsamos el botón **Finish**.

<img width="638" alt="image" src="https://user-images.githubusercontent.com/23094588/212537815-42ff3a2f-0913-47f0-bd37-344395d76c5d.png">

En la parte de los mapeos **Ref mappings** que tiene la cadena **`+refs/heads/*:refs/remotes/origin/*`** lo que le esta diciendo es que en nuestro local todos los **heads** que es la posición más avanzada me lo mapeas en el servidor con el **origin**. Vamos a presionar el botón **Save and Fetch**.

<img width="609" alt="image" src="https://user-images.githubusercontent.com/23094588/212538036-5b876cd8-3e73-4a1c-a8fa-ebceae0756da.png">

Nos muestra todo lo que se actualizara, preionamos en **Close**. Si vemos en **Git Repositories** como se ve **Remotes** tenemos:

<img width="1172" alt="image" src="https://user-images.githubusercontent.com/23094588/212538168-355158f9-821d-4b40-8abd-52ccf5810174.png">

Y si abrimos el **History** tenemos:

<img width="748" alt="image" src="https://user-images.githubusercontent.com/23094588/212538226-f30858f2-ef6f-4dff-8083-7c3a10dcfcb9.png">

Como podemos apreciar ademas de tener las etiquetas **`master`** y **`HEAD`** ahora nos aparece una tercer etiqueta llamada **`origin/master`**.

<img width="368" alt="image" src="https://user-images.githubusercontent.com/23094588/212538420-04bb7559-0933-431b-83be-197116d37612.png">

Lo que nos esta diciendo esta nueva etiqueta es donde esta posicionado actualmente nuestro servidor, en este momento todo esta en la misma posición **`master`** **`origin/master`** y **`HEAD`**.

Vamos a realizar un cambio para alterar esto, en el archivo **`caracteristicas_1.txt`** vamos a añadir un contenido y lo vamos a commitear.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212538664-71b1f3d7-6164-4ea4-9243-d3418e0cf258.png">

Vamos a presionar el botón **Commit** como hemos estado haciendo hasta ahora.

Si abrimos el **History** vemos que algo ha pasado, tanto **`master`** como **`HEAD`** avanzarón al nuevo commit, pero **`origin/master`** se ha quedado un commit por atrás. es decir que nuestro repositorio remoto no contiene este ultimo cambio.

<img width="747" alt="image" src="https://user-images.githubusercontent.com/23094588/212538777-d7233d35-b8ad-4199-ba07-d2c29b9fd948.png">

En teoría si vamos a la pestaña **Git Staging** se me debería mostrar así
 
![image](https://user-images.githubusercontent.com/23094588/212539101-c96a4039-73d9-42cf-bde3-863b3c6af6b5.png)

Pero realmente a mi se me ve así:

<img width="588" alt="image" src="https://user-images.githubusercontent.com/23094588/212539128-ced4d8cb-7755-4148-b6a0-12052d621501.png">

Lo que indica **master ↑1** indica que la **master** esta una posición por delante que **`origin/master`**. como ya hemos podido apreciar en el **history**.

Para subir el cambio en **`origin/master`** vamos a usar la opción **click derecho en el nombre del proyecto > Team > Push origi**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212541440-2031e098-1c9a-4d40-b974-8aa087c55f55.png">

Nos presenta una ventana

<img width="716" alt="image" src="https://user-images.githubusercontent.com/23094588/212541604-44798e0b-d099-4061-b7c6-25cd197dc5ea.png">

Al presionar el botón **Push** nos muestra el resultado de lo que ha hecho.

<img width="663" alt="image" src="https://user-images.githubusercontent.com/23094588/212541714-d8382aa2-edc8-4436-995e-b37f0319bd5e.png">

Subir el commit al repositorio remoto.

Si abrimos nuevamente el **History** vamos a ver como nuestro repositorio remoto se ha actualizado ya que **`master`** **`origin/master`** y **`HEAD`** estan a la misma altura. 

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212541799-2adfb72b-8b84-4fba-a789-6a62581d1042.png">

Para realizar la subida de este commit al Servidor remoto lo hemos hecho en dos pasos, primero el commit y después el push, pero pudimos haberlo realizado en un solo paso, vamos a modificar nuevamente el archivo **`caracteristicas_1.txt`** y vamos acommitearlo solo que en este caso vamos a presionar el botón **Commit and Push**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542018-a94799b9-d822-4293-b5d3-176c361603df.png">

Nos informa del resultado.

<img width="671" alt="image" src="https://user-images.githubusercontent.com/23094588/212542097-00ffb171-c351-4247-bf24-16c414dbe388.png">

Y en el **History** avanzarón todas las etiquetas **`master`** **`origin/master`** y **`HEAD`**. Hemos realizado el commit y push en un mismo paso. Tanto nuestro repositorio Local como el "Remoto" estan en el mismo commit.


## Repositorios remotos con GitHub 03:22

Ya que vimos como trabajar con un "repositorio remoto local", vamos a ver como trabajar con un verdadero repositorio remoto en **GitHub**. Pero previo a esto necesitamos hacer unos pasos previos.

### Generar SSH Key

Las claves **SSH** se componen de una **parte pública** y de otra **parte privada**. La **parte privada** no se le debe proporcionar a nadie y tenerla bien guardada. La **parte pública** es la que le damos a quien quiera tener comunicación con nosotros, permite comprobar que nosotros somos quien decimos ser.

Para generar las claves SSH tenemos la siguiente información oficial [Generación de una nueva clave SSH y adición al agente SSH](https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Generalmente las claves SSH deben guardarse en una carpeta llamada **`~/.ssh`**, la he buscado en mi mac pero no la encuentro, por lo que la voy a crear con el comando:

```sh
mkdir ~/.ssh; chmod 700 ~/.ssh
```

Se ha creado en la ruta **`/Users/adulfodelarosa/.ssh`**

<img width="1206" alt="image" src="https://user-images.githubusercontent.com/23094588/212545109-83e69b2e-e923-4397-91bb-5e582684a4f0.png">

Si tenemos duda donde creo dicha carpeta la podemos bucar con el explorador de archivos pulsando **`Shift-Cmd-G`**.

<img width="1454" alt="image" src="https://user-images.githubusercontent.com/23094588/212545185-cfec8b9e-fb95-493c-96dd-a2dde120a6bb.png">

Ahora si vamos a proceder a crear las claves SSH.

Básicamente los pasos son los siguientes:

![image](https://user-images.githubusercontent.com/23094588/212544519-71a91dbb-09b2-4780-b1da-9c83ca38d3bf.png)


Por lo tanto en nuestra consola pulsamos.

<img width="1094" alt="image" src="https://user-images.githubusercontent.com/23094588/212545488-5a982db2-1cb5-449e-99fe-1b920e765ef9.png">

Primero pulsamos el comando **`ssh-keygen -t ed25519 -C "adolfodelarosadesarrollo@gmail.com"`**.

Una vez hecho esto nos pide el nombre del archivo, lo hemos puesto con todo y ruta para que lo cree donde nosotros queremos, **`/Users/adulfodelarosa/.ssh/id_ssh_github`**.

Nos pide un password, hemos puesto **`1234`** y listo.

Si revisamos el contenido de la carpeta **`/Users/adulfodelarosa/.ssh`** tenemos:

<img width="914" alt="image" src="https://user-images.githubusercontent.com/23094588/212545691-810fe7e2-4975-43d7-b9ee-544b1f41ea35.png">

Tenemos los archivos para la clave privada y para la clave pública. Podemos ver el contenido de la clave pública con el comando **`cat`**.

<img width="904" alt="image" src="https://user-images.githubusercontent.com/23094588/212545818-e982f13f-8a08-4715-9bff-9dae23e1d9d4.png">

o abriendo el archivo con algún editor.

<img width="759" alt="image" src="https://user-images.githubusercontent.com/23094588/212545938-e24d133d-32e7-4b2b-9a1b-6f8ce395ef07.png">

El contenido de la clave privada no lo muestro por que como hemos dicho esto no se le debe pasar a nadie por que podría hacerse pasar por mí.

### Añadir clave pública SSH en GitHub

Vamos a ir a nuestra cuenta de GitHub.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542463-b19b0f7c-6aba-48bf-b586-53dc3107723e.png">

Vamos a entrar al **settings** de nuestra cuenta en GitHub.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212543891-36f7f3d2-3ec7-4450-88e8-1e83010e0aba.png">

Vamos a pulsar en **SSH and GPG keys**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212543950-4d195077-9068-4e53-9730-39ba53892229.png">

Vamos a pulsar en el botón **New SSH key**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212543995-a4fc792b-d629-4dc8-b1a8-d56b0212c040.png">

Aquí lo que nos pide es que ingresemos nuestra clave pública, como ya la hemos generado la copiamos y la pegamos en el recuadro **Key**, añadimos un título.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212546258-21e8f702-97d8-4504-8c3d-32730d8cefef.png">

Presionamos en el botón **Add SSH key**.

Me pide que confirme mi password por seguridad.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212546325-091a7752-3622-4faf-9621-e96b858f5b01.png">

Una vez ingresado el password ya me muestra la **Authentication Keys** dentro de la sección **SSH keys**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212546378-85ff2042-4d28-4ed7-893a-c1020cff29f6.png">


### Crear repositorio Remoto

Entramos en **Repositories**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542513-a069bf13-f7b0-41e7-b165-c906e378afdc.png">

Vamos a presionar el botón verde **New**.

Nos va a pedir cierta información para poder crear el repositorio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542572-32ef77fb-1f7d-44a6-8178-ffe37b9f5241.png">

Nos pide un nombre, descripción, indicar si el repositorio va a ser **Public** o **Private** si queremos añadir un archivo **`README`**, si queremos añadir un archivo **`.gitignore`** y finalmente el tipo de licencia.

En nuestro caso solo vamos a indicar el nombre del repositorio **`755_Git_con_Eclipse`**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542885-90f6f53c-69b7-4f68-a7ff-83943957bb08.png">

Presionamos el botón **Create repository**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212542959-c1c14316-0b65-48ad-aa54-1ffbbbd6afa2.png">

Nos indica tanto la ruta para **HTTPS** **`https://github.com/adolfodelarosades/755_Git_con_Eclipse.git`** 

Como para **SSH** **`git@github.com:adolfodelarosades/755_Git_con_Eclipse.git`**

### Configurar Eclipse para usar SSH

Para indicarle a Eclipse la ubicación de las claves SSH en nuestra máquina tenemos que entrar a las **Preferencias de Eclipse** y buscamos **SSH**.
Las claves SSH no pertenecen a Git, es algo generico que podemos usar en Eclipse.

<img width="883" alt="image" src="https://user-images.githubusercontent.com/23094588/212562710-3e769e75-415f-4a49-bc5c-c3880b24d367.png">

Actualmente nos muestra unas **Primaries Keys** pero debemos añadir la que nosotros hemos creado para GitHub presionando el botón **Add Private Keys...** para buscar la clave privada.

<img width="1415" alt="image" src="https://user-images.githubusercontent.com/23094588/212562911-a70edb1c-5f6a-4856-adc9-f2e72f1c5786.png">

Una vez seleccionada nos queda así:

<img width="881" alt="image" src="https://user-images.githubusercontent.com/23094588/212562970-efdb8806-bc72-4ebe-80e9-d6a68759572b.png">

Presionamos el botón **Apply and Close**.


### Configurar Servidor Remoto en nuestro proyecto Eclipse.

Vamos a copiar el URI para **SSH** **`git@github.com:adolfodelarosades/755_Git_con_Eclipse.git`** del Repositorio creado en GitHub y vamos a la pestaña **Git Repositories**, en **Remotes**.

<img width="589" alt="image" src="https://user-images.githubusercontent.com/23094588/212547148-c8a07e52-5764-4d1a-b0ab-47f83d168dcb.png">

y vamos a pulsar ***click derecho > Create remote***

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212547391-a1155c6a-35b7-4fb4-b48c-05757d6cc392.png">

Nos aparece la ventana 

<img width="594" alt="image" src="https://user-images.githubusercontent.com/23094588/212547417-dbdfc30c-ee0b-45b9-b3e0-fbd96330d3f3.png">

Lo vamos a llamar **`GitHub`** y vamos a usar la opción por defecto **Configure push** ya que nuestro Repositorio Remoton GitHub no tiene nada, al contrario de que cuando hicimos el Repositorio Remoto Local donde si lo habíamos inicializado con el repositorio de nuestro Local. 

<img width="602" alt="image" src="https://user-images.githubusercontent.com/23094588/212563425-c9650b3d-0f46-44f2-91d5-d6be95c25643.png">

Presionamos el botón **Create**.

<img width="616" alt="image" src="https://user-images.githubusercontent.com/23094588/212547942-0b464b72-abd3-4b3a-aae9-d9f69b0e801c.png">

Nos pide la URI del repositorio Remoto vamos a pulsar el botón **Change...**

<img width="733" alt="image" src="https://user-images.githubusercontent.com/23094588/212548132-f54eff6e-b642-407d-bb9b-f0565bf4c1b5.png">

Como habíamos copiado la dirección para el SSH se ha llenado automáticamente, presionamos **Finish**.

<img width="619" alt="image" src="https://user-images.githubusercontent.com/23094588/212548210-81244361-05e1-40e5-bc2c-3853a006a584.png">

Y ahora presionamos **Save and Push**.

Me sale la siguiente ventana.

<img width="387" alt="image" src="https://user-images.githubusercontent.com/23094588/212548315-1320033d-bd3c-45f7-94af-15a34c5a9300.png">

Donde me indica que no se ha podido conectar, acepto la condición y doy **OK** y aparece

<img width="375" alt="image" src="https://user-images.githubusercontent.com/23094588/212548431-1df46d12-603b-4c6b-87de-4d9738d7418d.png">

<img width="405" alt="image" src="https://user-images.githubusercontent.com/23094588/212548512-75be5040-b691-42df-af73-c5c996cc41e2.png">


Finalmente sale la ventana donde me pide el **password** que usamos cuando creamos las claves que si recordamos es **`1234`**

<img width="544" alt="image" src="https://user-images.githubusercontent.com/23094588/212563646-a9fb3365-e64d-40e8-a9a1-7ebb5c95a569.png">

<img width="543" alt="image" src="https://user-images.githubusercontent.com/23094588/212563669-7226f59e-8243-4d71-accf-db5bfbcb55b9.png">


**NOTA**: Repeti varias veces este proceso pero no lograba subir el proyecto. Cambien el nombre del repositorio a **GitHub2** y posteriormente hice check en las siguientes 2 ventanas que aparecian y finalmente me aparecio.

<img width="662" alt="image" src="https://user-images.githubusercontent.com/23094588/212564100-9acd070d-238e-441d-ab13-e4d06db2bfab.png">

Si abrimos la pestaña **Git Repositories** y **Remotes** vemos el nuevo repositorio remoto **GitHub2**.

<img width="1176" alt="image" src="https://user-images.githubusercontent.com/23094588/212564128-4c8197fd-e17c-49ba-aa72-49eef4de1e98.png">

Y si consultamos nuestro repositorio en GitHub tenemos el repositorio con todo el contenido de nuestro proyecto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212564187-fc323f45-2292-441e-bd1c-99b3f5b95874.png">


## Publicar cambios 04:38

Vamos a ver como subir los nuevos cambios que realicemos en nuestro Servidor Remoto, vamos a añadir cambios en el archivo **`anadir.txt`** y vamos a dar un commit normal.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212859322-bee6dc83-6752-42c0-adda-664e79e2f729.png">

Si vemos el **History** vemos como ha avanzado **master** y **HEAD** por delante de **origin/master**.

<img width="1475" alt="image" src="https://user-images.githubusercontent.com/23094588/212859661-26ce74f7-3dd1-41fa-b6cd-6294ce7b3604.png">

De hecho ya nos aparece **`master ↑1`** que nos indica que estamos un commit por delante con respecto a **origin/master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212860352-ee25aab6-6a1a-4d35-9686-c8410bcdec84.png">

Vamos a subir el cambio en el Servidor Remoto o más bien en **los Servidores Remotos** que tenemos dos. Vamos a dar **click derecho en el nombre del proyecto > Team > Push to origin**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212861719-3057321b-8156-4923-aab3-3510592c563d.png">

Al presionarlo nos indica que se ha realizado.

<img width="667" alt="image" src="https://user-images.githubusercontent.com/23094588/212862132-1fa4db77-9b34-4708-90ae-9120ebe38164.png">

Pero observemos **Message Details** observamos que solo aparece la ubicación del Repositorio Remoto Local, pero no aparece el de GitHub.

Si vemos el **History** vemos que **origin/master** avanza a la misma altura de **master** y **HEAD**.

<img width="1174" alt="image" src="https://user-images.githubusercontent.com/23094588/212862387-8f9b024d-df29-4c50-8b33-b2a40d5ff2fb.png">

Si revisamos el Servidor Remoto no vemos el cambio realizado, realmente no se ha subido el cambio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212862787-510eca60-bda8-41f2-8c6c-f69e40933ba0.png">

Esto ha pasado por que realmente no tenemos configurado bien nuestro Repositorio Remoto.

### Configuración del Repositorio Remoto.

<img width="1173" alt="image" src="https://user-images.githubusercontent.com/23094588/212863980-ff3a57ab-7df2-484b-89db-8a0394e69fa0.png">

Vemos que **GitHub2** tiene dos partes la del Fetch y la del Push.

<img width="1174" alt="image" src="https://user-images.githubusercontent.com/23094588/212864290-5166e8d9-4a6a-4e04-ac45-b82ef4b0e6eb.png">

Vamos a seleccionar **Config Fetch...**. Nos a parece la ventana para la configuracción del Fetch y efectivamente vemos que no esta configurada.

<img width="639" alt="image" src="https://user-images.githubusercontent.com/23094588/212864468-fab38e88-7a25-4167-b1f8-88f9fd5f66d6.png">

Lo que tenemos que añadir son los mapeos entre las ramas del Local y el Remoto, presionamos en el botón **Advanced...**

<img width="746" alt="image" src="https://user-images.githubusercontent.com/23094588/212865412-57d80a38-40ee-470c-bf73-c261b81728c2.png">

Aquí es donde debemos hacer los mapeos, presionamos en el primer combo para seleccionar **Source ref** y se llena **Destination ref**, le decimos que a que equivale el **master** de Local en el Servidor Remoto.

<img width="743" alt="image" src="https://user-images.githubusercontent.com/23094588/212865762-92e3b9cd-2836-4282-8e32-c4749084b3c3.png">

Presionamos el botón **Add Spec**.

<img width="747" alt="image" src="https://user-images.githubusercontent.com/23094588/212866196-aa316241-38ca-472c-adf5-f52d992d6dd1.png">

Presionamos en el botón **Finish**.

<img width="640" alt="image" src="https://user-images.githubusercontent.com/23094588/212866665-bf492f57-e546-413b-99ca-72c10877934d.png">

Presionamos en el botón **Save and Fetch**. Nos sale la siguiente ventana.

<img width="612" alt="image" src="https://user-images.githubusercontent.com/23094588/212866859-9c9d5cb7-060a-4046-8b10-1cc9d7db2e40.png">

Ahora vamos a configurar el Push. Vamos a seleccionar **Config Push...**. 

<img width="1173" alt="image" src="https://user-images.githubusercontent.com/23094588/212867238-4dd605f0-2099-4f4f-b3b6-bb9ae17a322d.png">

Nos a parece la ventana para la configuracción del Push y efectivamente vemos que no esta configurada.

<img width="621" alt="image" src="https://user-images.githubusercontent.com/23094588/212867360-f981acd7-24a1-4cff-8ada-4adff7777eed.png">

Lo que tenemos que añadir son los mapeos entre las ramas del Local y el Remoto, presionamos en el botón **Advanced...**

<img width="744" alt="image" src="https://user-images.githubusercontent.com/23094588/212867744-8ba6f975-8cf3-452b-832e-7b6afb7cac89.png">

Aquí es donde debemos hacer los mapeos, presionamos en el primer combo para seleccionar **Source ref** y se llena **Destination ref**, le decimos que a que equivale el **master** de Local en el Servidor Remoto.

<img width="740" alt="image" src="https://user-images.githubusercontent.com/23094588/212867998-8b363372-9bde-4276-9b6e-fb5e4995a2cf.png">

Presionamos el botón **Add Spec**.

<img width="745" alt="image" src="https://user-images.githubusercontent.com/23094588/212868120-38a1f6c8-af63-4c80-ba01-6e96d58aca28.png">

Presionamos en el botón **Finish**.

<img width="619" alt="image" src="https://user-images.githubusercontent.com/23094588/212868619-49f9c327-6241-4846-8128-c9a65983c0e2.png">

Presionamos en el botón **Save and Fetch**. Nos sale la siguiente ventana donde se nos indica que se ha realizado el PUSH.

<img width="663" alt="image" src="https://user-images.githubusercontent.com/23094588/212868837-63826fda-5035-4e06-a920-0938f68547da.png">

Si volvemos a el repositorio remoto veremos que ya esta subido el cambio.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212869166-044472b7-a880-44f7-b382-a66efbd5b4f9.png">

### Otros ejemplos

Vamos a realizar otro ejercicio para apreciar que pasa una vez que ya tenemos bien configurados los mapeos del Fetch y Push en el Servidor Remoto.

Vamos a añadir cambios en el archivo **`anadir.txt`** y vamos a dar un commit normal.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212870077-2cc8a2df-df11-42f8-a809-45769d88abab.png">

Si vemos el **History** vemos como ha avanzado **master** y **HEAD** por delante de **origin/master**.

<img width="1171" alt="image" src="https://user-images.githubusercontent.com/23094588/212870379-d6108449-5e97-4649-a2d6-001e7fe5c4c1.png">

De hecho ya nos aparece **`master ↑1`** que nos indica que estamos un commit por delante con respecto a **origin/master**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212870585-7e147883-4946-417e-b037-8f900ab68dc7.png">

Vamos a subir el cambio en el Servidor Remoto o más bien en **los Servidores Remotos** que tenemos dos. Vamos a dar **click derecho en el nombre del proyecto > Team > Push to origin**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212870939-d20c0228-5ea3-4b9b-a595-e966e40e2095.png">

Al presionarlo nos indica que se ha realizado. Pero observemos **Message Details** observamos que solo aparece la ubicación del Repositorio Remoto Local, pero no aparece el de GitHub.

<img width="658" alt="image" src="https://user-images.githubusercontent.com/23094588/212871168-5d2fdc93-0cba-4443-a323-e8dbbaddcc63.png">

Vamos a revisar el Repositorio Remoto.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212871349-8cadf84a-e310-44c7-bc94-930a236d91dc.png">

No estan los cambios vamos a **click derecho en el nombre del proyecto > Team > Push branch 'master'...**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212871729-201a06ba-8ad8-4ccc-a38e-90fe3696f93c.png">

Y podemos ver que por default se sube al Servidor Remoto Local, para forzar a que sea al Servidor Remoto GitHub podemos seleccionarlo en el combo.

<img width="684" alt="image" src="https://user-images.githubusercontent.com/23094588/212872405-65b43c60-65cf-4387-8ae8-e98e38ac6307.png">

Cambiamos el repositorio

<img width="689" alt="image" src="https://user-images.githubusercontent.com/23094588/212872551-1ad88e3e-4298-469e-87ec-867ddecb220a.png">

Presionamos **Push**. Nos muestra la ventana que nos indica que el Push se ha realizado.

<img width="663" alt="image" src="https://user-images.githubusercontent.com/23094588/212872761-68bc66be-41b7-4cad-90d4-95dbfcb6d928.png">

Vamos a ver el repositorio Remoto GitHub.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212873089-36955d3e-0061-4c7f-a85d-590eee7b366e.png">

Ahora si que se ha subido el cambio.


Vamos a hacer un tercer ejemplo donde hagamos el Commit and Push en un solo paso para ver que pasa, volvemos a hacer cambios en **`anadir.txt`**

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212874456-e3d021f5-5fe4-4360-92ca-eb5a6af95a5e.png">

Nos indica que se ha hecho el Push en el Servidor Remoto GitHub.

<img width="665" alt="image" src="https://user-images.githubusercontent.com/23094588/212874792-280f83eb-4d70-4be7-bae8-7ed73d89a210.png">


Vamos a revisar GitHub, el cambio esta subido.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212874888-8b0e3504-c20b-4b4e-9f34-9e176b6af547.png">

¿Pero que ha pasado con el Repositorio Remoto Local? Si vemos el **History** tendremos la respuesta.

<img width="1173" alt="image" src="https://user-images.githubusercontent.com/23094588/212875381-46857342-a37a-40f3-b389-d236fa845392.png">

Realmente ya tenemos dos etiquetas para los Servidores Remotos **origin/master** y **GitHub2/master** actualmete **GitHub2/master** esta alineado pero no **origin/master**, vamos a alinearlo con **click derecho en el nombre del proyecto > Team > Push branch 'master'...**

<img width="690" alt="image" src="https://user-images.githubusercontent.com/23094588/212875952-a7a2dc9d-56c5-4fc2-9a7a-da1aac30bb95.png">

Como podemos ver la rama por default ahora es la de **GitHub2** por eso se subio el cambio cuando hicimos el **Commit and Push**, ahora vamos a hacer el **Push** a la rama **origin/master**.

<img width="688" alt="image" src="https://user-images.githubusercontent.com/23094588/212876360-0ac9ca62-f619-48dc-948a-3369a9651309.png">

Presionamos el **Push** y nos indica que se ha subido el cambio en el Repositorio Local.

<img width="656" alt="image" src="https://user-images.githubusercontent.com/23094588/212876501-60e51830-d153-498f-8c12-78d26fe38f64.png">

Si vemos el **History** todas las ramas estan a la misma altura.

<img width="1171" alt="image" src="https://user-images.githubusercontent.com/23094588/212877050-c94de84a-eb78-450a-902f-08512a3ab3ef.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212876847-3b02ccd4-42b5-4453-8a6f-2fa7cbc8cefb.png">

En resumen como tenemos dos ramas hay que hacer el Push en ambas ramas para que esten actualizadas, no es común tener dos servidores remotos como en este ejemplo.


## Clonar repositorios 04:28

En esta lección vamos a ver como descargarnos un proyecto desde GitHub. Pensemos que entramos a trabajar en una nueva empresa y que debemos montarnos todo el entorno de trabajo para poder trabajar con el, como nuevos vamos a partir de un proyecto Eclipse totalmente vacío. Mi proyecto actual esta en esta carpeta.

Vamos a crear una nueva carpeta llamada **`755_Git_con_Eclipse_Clone`** y la vamos a abrir desde Eclipse.

<img width="1008" alt="image" src="https://user-images.githubusercontent.com/23094588/212882433-d41ec989-f302-4ee1-877d-98436fa156bf.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212882282-f418ddd6-4646-40a0-8f74-d7e673ff6034.png">

Para importar el proyecto desde GitHub vamos a ir al proyecto dentro de GitHub

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212882755-dfd80a03-e50e-4739-ab7d-c1e8cac82791.png">

Donde vamos a copiar la URL: **`git@github.com:adolfodelarosades/755_Git_con_Eclipse.git`**

En Eclipse vamos a presionar la opción **Import project...**

<img width="378" alt="image" src="https://user-images.githubusercontent.com/23094588/212883253-e261bdbc-90e9-4433-b37d-81a14d842ad2.png">

Nos aparece la ventana siguiente donde debemos ir a **Git** y seleccionar la opción **Project from Git**.

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212883739-82faac5c-941c-40f4-8f98-2d8debacd53f.png">

Presionamos **Next** y seleccionamos **Clone URI**.

<img width="599" alt="image" src="https://user-images.githubusercontent.com/23094588/212883917-95600bff-e6f5-4621-a0da-ee1cf72a312d.png">

Presionamos **Next**. La información se rellena por haber copiardo la URL desde GitHub en el portapapeles.

<img width="596" alt="image" src="https://user-images.githubusercontent.com/23094588/212884113-28f26d88-5ca9-4185-bf12-f9e0789f2c32.png">

Presionamos **Next**. Y nos manda el siguiente error.

<img width="629" alt="image" src="https://user-images.githubusercontent.com/23094588/212884498-7cdd53ea-c7ce-4fc5-81d7-d3dadbd033e6.png">

Parece que existen problemas con la clave pública o la primaria.

<img width="614" alt="image" src="https://user-images.githubusercontent.com/23094588/212884957-e965baa3-db05-4cc4-a559-c5aac24cf799.png">

Damos a **Cancel**.

Vamos a revisar las propiedades de SSH en Eclipse.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212885363-b3ce19d6-5a1d-4aab-8f2c-b0d196bcd11f.png">

Como podemos ver se ha perdido la clave privada de GitHub, vamos a añadirla nuevamente.

<img width="867" alt="image" src="https://user-images.githubusercontent.com/23094588/212885611-b0c6f0bd-145a-403f-8c8a-71e64a6f740b.png">

Ahora si repetimos todo lo que habíamos hecho anteriormente hasta que nos marco el error tenemos:

<img width="602" alt="image" src="https://user-images.githubusercontent.com/23094588/212885931-5e8ce1a0-76a6-4bd4-8676-35940f2b131d.png">

Nos muestra toda las ramas que podemos descargar en este caso solo tenemos **master** porque cuando lo publicamos solo publicamos esta rama.

Al presionar **Next**, nos pide que le indiquemos donde ubicara el repositorio en nuestro ordenador.

<img width="599" alt="image" src="https://user-images.githubusercontent.com/23094588/212887362-5032e03b-b42e-4455-8cbf-a354f258009a.png">

Vamos a dejar el mismo que aparece y presionamos **Next**. Aquí vamos a seleccionar la opción **Import as general project**. En otros casos se usan las otras opciones por ejemplo para proyectos de Eclipse cuando se sube toda la información del proyecto de Eclipse. Como aquí solo es texto se usa esa opción.

<img width="602" alt="image" src="https://user-images.githubusercontent.com/23094588/212887558-ad406f3c-9ed9-4634-82c2-4c815e4cfbf2.png">

Presionamos **Next**.

<img width="605" alt="image" src="https://user-images.githubusercontent.com/23094588/212888257-70106a36-8596-407c-b005-ad8458569ac7.png">

Como ya existe un proyecto con ese nombre vamos a cambiarlo por:

<img width="606" alt="image" src="https://user-images.githubusercontent.com/23094588/212888782-7954c34c-53b1-4652-bc37-9e5afaa45790.png">


Como con esta forma no pude siempre me marcaba el error de que existia ya el repositorio.

### Otra Forma de hacerlo

Primero verificar que existen la clave privada en SSH.

<img width="883" alt="image" src="https://user-images.githubusercontent.com/23094588/212893487-fcb25f93-1545-40b8-b47c-9169f23b1cf6.png">

Segundo abrimos la vista **GIT Repositories** y vemos que tenemos la opción **Clone Git Repository**.

<img width="1136" alt="image" src="https://user-images.githubusercontent.com/23094588/212893731-95b36e2d-85ac-49a4-aea9-d15dc83f562e.png">

Al presionar  **Clone Git Repository**

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/212894022-2ecee9e0-29a2-4556-9327-0f5aa50da7eb.png">

Presionamos **Next**.

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212894112-b154d6a7-3741-4f62-8b99-1e3eca95e8b3.png">

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212894158-7a306eec-9902-4d0d-a717-b95a6b7d96a1.png">

Me indica que el repositorio ya tiene contenido.

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212894308-51198f98-9ff1-4358-bb86-eaaf86912ce3.png">

Voy aponer otro nombre.

<img width="595" alt="image" src="https://user-images.githubusercontent.com/23094588/212894435-baf1d8c6-e198-497e-8003-480e1a878511.png">

Y presionar **Finish**.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212894659-f44c7188-92ad-4f54-af5f-ba3714558f86.png">

Aun no vemos los archivos pero vemos que ya esta configurado el Repositorio Remoto.

<img width="1136" alt="image" src="https://user-images.githubusercontent.com/23094588/212895186-dab25a60-3741-4b0a-802f-ad221d1cf2f2.png">

Aun que la configuración no esta del todo bien  en el Fetch como en el Push.

<img width="636" alt="image" src="https://user-images.githubusercontent.com/23094588/212895374-e678d22e-4b7d-4a6d-b6b9-3758a78b2589.png">


<img width="615" alt="image" src="https://user-images.githubusercontent.com/23094588/212895483-2d9bb249-424f-4b97-bf49-e1d9f7797ce5.png">


Vamos a intentar hacer un Fetch para ver si descarga del repositorio los archivos.

<img width="1140" alt="image" src="https://user-images.githubusercontent.com/23094588/212895820-b6b6a009-50ea-4803-8d95-16ffa8c68baf.png">

Nos indica que no hay nada que descargar.

<img width="611" alt="image" src="https://user-images.githubusercontent.com/23094588/212895914-39fcd7f9-c5cf-4ea3-8186-f50ab61f2769.png">

Vamos a dar en **Confuration...**

<img width="641" alt="image" src="https://user-images.githubusercontent.com/23094588/212896014-dd6f64bb-a683-45ed-b0d3-a6647452d133.png">

Vamos a presionar **Advanced...**

<img width="753" alt="image" src="https://user-images.githubusercontent.com/23094588/212896166-72e4fc72-16c2-424c-954d-9a0372db5e1a.png">


Presionamos **Add Spec**

<img width="749" alt="image" src="https://user-images.githubusercontent.com/23094588/212896297-8cc204bb-a024-4227-9259-054bf38bb9fb.png">

Nos dice que apunta a lo mismo lo voy a **Cancelar**


Si vemos el contenido del Repositorio que creamos si que tiene contenido.

<img width="1196" alt="image" src="https://user-images.githubusercontent.com/23094588/212896726-85a9128f-18bd-4497-882a-5cfae931444d.png">

Los archivos los vemos abajo pero no es exactamente lo que queremos.

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212897257-b5540b76-a95b-4ded-8b3e-314900f5179e.png">

### Otro intento

Vamos a crear una nueva carpeta llamada **`755_Git_con_Eclipse_Clone`** y la vamos a abrir desde Eclipse.

<img width="1008" alt="image" src="https://user-images.githubusercontent.com/23094588/212882433-d41ec989-f302-4ee1-877d-98436fa156bf.png">

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212882282-f418ddd6-4646-40a0-8f74-d7e673ff6034.png">

Para importar el proyecto desde GitHub vamos a ir al proyecto dentro de GitHub

<img width="1512" alt="image" src="https://user-images.githubusercontent.com/23094588/212882755-dfd80a03-e50e-4739-ab7d-c1e8cac82791.png">

Donde vamos a copiar la URL: **`git@github.com:adolfodelarosades/755_Git_con_Eclipse.git`**

En Eclipse vamos a presionar la opción **Import project...**

<img width="378" alt="image" src="https://user-images.githubusercontent.com/23094588/212883253-e261bdbc-90e9-4433-b37d-81a14d842ad2.png">

Nos aparece la ventana siguiente donde debemos ir a **Git** y seleccionar la opción **Project from Git**.

<img width="598" alt="image" src="https://user-images.githubusercontent.com/23094588/212883739-82faac5c-941c-40f4-8f98-2d8debacd53f.png">





## Bajar cambios 03:21
