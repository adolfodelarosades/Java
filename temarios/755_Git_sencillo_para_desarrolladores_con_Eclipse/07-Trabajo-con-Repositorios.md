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

Vamos a mover a mover la carpeta **`cursoegit.git`** dentro de la carpeta **`Repositorios-GIT`**, que es donde vamos a colocar realmente nuestro Servidor "remoto" simulado.








## Repositorios remotos con GitHub 03:22
## Publicar cambios 04:38
## Clonar repositorios 04:28
## Bajar cambios 03:21
