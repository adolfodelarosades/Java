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

Nos pide un password, hemos puesto **`1234`**.

y listo.

Si revisamos el contenido de la carpeta **`/Users/adulfodelarosa/.ssh`** tenemos:

<img width="914" alt="image" src="https://user-images.githubusercontent.com/23094588/212545691-810fe7e2-4975-43d7-b9ee-544b1f41ea35.png">

Tenemos los archivos para la clave privada y para la clave pública. Podemos ver el contenido de la clave pública con el comando **`cat`**.

<img width="904" alt="image" src="https://user-images.githubusercontent.com/23094588/212545818-e982f13f-8a08-4715-9bff-9dae23e1d9d4.png">

o abriendo el archivo con algún editor.

<img width="759" alt="image" src="https://user-images.githubusercontent.com/23094588/212545938-e24d133d-32e7-4b2b-9a1b-6f8ce395ef07.png">


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

Como nosotros vamos a trabajar mediante SSH vamos a ver como se generan estas credenciales en nuestra cuenta de GitHub.














## Publicar cambios 04:38
## Clonar repositorios 04:28
## Bajar cambios 03:21
