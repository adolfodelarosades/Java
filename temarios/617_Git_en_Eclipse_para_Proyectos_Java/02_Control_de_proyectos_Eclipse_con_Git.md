# 2. Control de proyectos Eclipse con Git 21:43

<img src="images/02-01.png">

Después de haber visto la instalación del plugin en Eclipse para poder trabajar con Git vamos ahora a ver cómo podemos utilizarlo para operar con nuestros proyectos en el entorno de desarrollo.

<img src="images/02-02.png">

Para ello lo primero que vamos a tener que hacer es una vez creado el proyecto o importar un proyecto que ya tengamos pues ponerlo bajo control de Git, es decir asociarlo al repositorio que creamos anteriormente después de haber hecho la configuración en Eclipse. 

Una vez que ya se ha creado el proyecto o importado botón derecho, elegimos *Team - Share Project* y a partir de ahí ya como vamos a ver podremos asociarlo, primero al repositorio local y de ahí pues al repositorio remoto de GitHub, para poder compartirlo públicamente.

<img src="images/02-03.png">

Una vez que ya lo tengamos asociados ya está bajo control de Git y ya podemos realizar las diferentes operaciones como:


* `Commit`: actualización de los cambios que se han realizando en el proyecto sobre el repositorio local.
* `Push`: si queremos transferir esos cambio del repositorio local al repositorio remoto hacemos lo que se conoce como un `push`.
* `Pull`: luego lo contrario es decir si tenemos un proyecto y queremos importar los cambios que hayan hecho otro miembro del equipo en el repositorio remoto pues haremos lo que se conoce como un `pull`.

Vamos a hacer todas estas tareas con un ejemplo, en Eclipse crearíamos un proyecto o importariamos alguno que ya tengamos, en mi caso ya tengo varios proyectos que aún no estan bajo el control de Git.

<img src="images/02-04.png">

Vamos a dar botón derecho sobre el proyecto *Team -Shared Project* 

<img src="images/02-05.png">

Nos aparece lo siguiente.

<img src="images/02-06.png">

Tenemos la opción de crear un repositorio pero nosotros ya lo tenemos creado, también tenemos la posibilidad de crear el repositorio dentro del mismo workspace cosas que no es muy recomendable. 

En Repository indicamos nuestro repositorio local.

<img src="images/02-07.png">

Damos en Finish. 

Al hacer esto si vemos el proyecto ahora sobre los archivos, paquetes y carpetas aparecen con un signo de interrogación.

<img src="images/02-08.png">

Esto indica que todavía no se ha hecho ninguna operación con Git, ya esta asociado con Git pero no hemos realizado ninguna operación con el, no hemos realizado ningura versión del proyecto.

Una cosa importante tambien es que nuestro proyecto que se encontraba en la carpeta del Workspace ya no esta en dicha carpeta.

<img src="images/02-22.png">

El proyecto se ha pasado a la carpeta del repositorio. Si vamos a la carpeta del Repositorio Local tenemos.

<img src="images/02-19.png">

El proyecto se ha movido del Workspace al repositorio.

Lo que vamos a hacer ahora es realizar nuestro primer Commit sobre el proyecto, volvemos a ponernos sobre el proyecto y damos botón derecho, *Team - Commit*. 

<img src="images/02-09.png">

Como se puede observar gracias a que el proyecto lo hemos asociado con Git ya se muchas más opciones que las que teniamos antes de asociarlo, entre ellas `Commit` al seleccionarlo nos aparece la vista `Git Staging`.

<img src="images/02-10.png">

Donde se nos pide un mensage para nuestro Commit, tenemos también una sección llamada `Unstaged Changed(5)` que indica los archivos que han tenido cambios, realmente nosotros solo hemos metido el archivo `Saludo.java` todos los demás son archivos que genera el proyecto vamos a subirlos todos, por lo que vamos a dar click en el doble más en verde que tenemos.

<img src="images/02-11.png">

Al hacer esto los archivos pasan de la sección `Unstaged Changed(5)` a la sección `Staged Changed(5)` y además de esto se activan dos botones `Commit` y `Commit and Push`. `Commit` lo que hara es subir los archivos al repositorio local mientras que 
`Commit and Push` lo subira al local y al remoto es el que vamos a pulsar.

<img src="images/02-12.png">

Presionamos en `Preview` y aparece.

<img src="images/02-13.png">

<img src="images/02-14.png">

Metemos nuestras credenciales.

<img src="images/02-15.png">

Nos indica que confirmemos el Push.

<img src="images/02-16.png">

Nos indica que el Push se ha realizado, si vemos la vista `Git Staging`.

<img src="images/02-17.png">

Ya no tenemos ningún archivo modificado en nuestro Workspace con respecto a lo que tenemos en el servidor Local o remoto.

Ademas los signos de interrogación han desaparecido de los archivos, paquetes y carpetas de nuestro proyecto.

<img src="images/02-18.png">

Apareciendo ahora un simbolo de BD amarillo que indica que esta sicronizado con el repositorio.

Si vamos a la carpeta del Repositorio Local tenemos.

<img src="images/02-19.png">

Ya se ha incluido la carpeta del proyecto que hemos incluido en el repositorio local.

Y si vamos al repositorio remoto.

<img src="images/02-20.png">

<img src="images/02-21.png">

Podemos ver que también se ha incluido el proyecto dentro del repositorio remoto.

### Haciendo cambios en el Proyecto

Si modificamos nuestro código esto se reflejara en el Package Explorer

<img src="images/02-23.png">

<img src="images/02-24.png">

En los archivos modificados aparece el simbolo `>` antes del nombre del archivo con el cual podemos saber que sobre ese archivo se han subido modificaciones que no se han subido a los repositorios.

Podemos ver los cambios hechos en el archivo antes de subirlo al repositorio, para lo cual sobre el archivo presionamos botón derecho *Team - Show Local History*

<img src="images/02-25.png">

Se nos va a mostrar una lista de las diferentes versione que hemos realizado del archivo la primera que sale es la últim que hemos creado.

<img src="images/02-26.png">

Podriamos seleccionar las dos últimas versiones dar botón derecho y seleccionar `Compare with Each Other`

<img src="images/02-27.png">

Nos va a aparecer una nueva ventana donde salen las dos versiones y muestra claramente los cambios que existen entre una y otra versión.

<img src="images/02-28.png">

Tenemos unos botones que nos van a permitir mover los cambios de una ventana a otra según lo que desee hacer.

<img src="images/02-29.png">

<img src="images/02-30.png">

Se activan unos u otros botones dependiendo en que ventana y línea nos posicionemos. Por ejemplo para descartar los cambios hechos nos posicionamos en la ventana derecha en la línea que se ha modificado vamos a presionar el botón `Copy Currenct Change from Rigth to Left`.

<img src="images/02-31.png">

Se pasa lo de la derecha a la izquierda, que es una forma de descartar el cambio y salvamos el archivo para retornar a la versión original. Vamos a volver a poner el cambio. 


Otra forma de ver las modificaciones hechas es directamente en el editor del archivo, esta es la versión normal del editor.

<img src="images/02-32.png">

Si nos colocamos en el archivo y damos botón derecho seleccionamos la opción *Team - Show revision Information* 

<img src="images/02-33.png">

Ahora el editor aparece de esta manera.

<img src="images/02-34.png">

De esta forma podemos ver las líneas modificadas.

<img src="images/02-35.png">

Volvemos a comparar las últimas dos versiones.

<img src="images/02-36.png">

Suponiendo que ya estamos conformes vamos a hacer un Commit solo al repositorio Local.

###  Commit al Repositorio Local.

Vamos a pensar que estamos conformes con los cambios realizados y queremos hacer un Commit al repositorio Local

<img src="images/02-37.png">

Nos ponemos sobre el proyecto botón derecho *Team - Commit*.

<img src="images/02-38.png">

Se nos abre la vista `Git Staging` mostrando el archivo modificado en este caso `Saludo` pero resalmente aparecen dos archivos el `Saludo.java` y `Saludo.class` que es el archivo compilado y observese que ya aparecen directamente en la zona `Staged Change` esto es por que ya pertenecen a Git y solo se han modificado. Vamos a insertar un comentario para el commit.

<img src="images/02-39.png">

En este caso solo vamos a presionar sobre el botón `Commit`.

<img src="images/02-40.png">

Como se hizo solo un Commit solo se sincronizo con el Repositorio Local pero no con el Remoto.

###  Push al Repositorio Remoto.

<img src="images/02-41.png">

Vamos a realizar a hacer el Push como se muestra en la imágen.

<img src="images/02-42.png">

Nos pide que confirmemos el repositorio remoto, damos en Next.

<img src="images/02-43.png">

Nos pide unas especificaciones para el la Ref del push.

<img src="images/02-44.png">

En ambos combos ponemos `master` y presionamos el botón `Add Spec`.

<img src="images/02-45.png">

Vamos a marcar los check `Force Update` y `Save specifications in origin configuration`

<img src="images/02-46.png">

Y presionamos `Finish`.

<img src="images/02-47.png">

Nos informa que el Push se ha realizado.

<img src="images/02-48.png">

<img src="images/02-49.png">

Como podemos comprobar ahora si los cambios han sido subidos al repositorio remoto.

###  Ver los diferentes Commits desde Eclipse.

También podemos ver algo similar desde Eclipse si sobre el proyecto damos *Team - Show in History*  

<img src="images/02-50.png">

Se nos presenta la vista `History` con los commits que llevemos realizados.

<img src="images/02-51.png">

<img src="images/02-52.png">

Si nos colocamos en alguno de ellos nos indica que archivos se subieron en cada commit, incluso si damos doble click sobre el se abre la versión del archivo en ese commit.

<img src="images/02-53.png">

<img src="images/02-54.png">

### Descargarse el Proyecto desde el repositorio Remoto.

Vamos a realizar la tarea contraria es decir suponiendo que somos un usuario diferente nos vamos a descargar el Proyecto desde el repositior a nuestro IDE. Para hacer esto vamos a cambiarnos de Workspace y poder simular esta acción.

<img src="images/02-55.png">

Tenemos un Workspace totalmente vacío, vamos configurarnos nuestro propio repositorio Local, abrimos la vista `Git Repositories`

<img src="images/02-56.png">

Como estamos en un nuevo Workspace no tenemos ningún repositorio, lo vamos a crear, primero que nada voy a crear una nueva carpeta dentro de donde tengo mis repositorios donde tendre el repositorio "virtual" para este Workspace.

<img src="images/02-57.png">


Pulsando en `Create a new local Git repository`.

<img src="images/02-58.png">

Seleccionamos la ruta donde se creará el repositorio y aceptamos.

El repositorio se crea en dicha carpeta.

<img src="images/02-59.png">

<img src="images/02-60.png">

Ahora si vamos a Importar el Proyecto desde el Repositorio remoto de Git Hub.


Seleccionamos *Import - Git - Project from Git*.

<img src="images/02-61.png">

Siguiente.

<img src="images/02-62.png">

Vamos a seleccionar `Clone URI` siguiente.

Tenemos que ingresar la URI y demñas datos para conectarnos con el servidor remoto.

<img src="images/02-63.png">


En este caso el usuario y la contraseña no son necesarios por que puede que estemos descargando el proyecto desde un repositorio que no sea de nuestra propiedad por lo que no tendríamos por que conocer esos datos. Siguiente.

<img src="images/02-64.png">

Nos indica la rama desde la cual se va a traer los proyectos en este caso `master` que es la única que existe.Siguiente.

<img src="images/02-65.png">

En esta pantalla nos pide que configuremos el destino Local que no es el que aparece lo vamos a cambiar.

<img src="images/02-66.png">

Ya tenemos la carpeta correcta donde va a descargar el proyecto. Damos Siguiente.

<img src="images/02-67.png">

Damos Siguiente.

<img src="images/02-68.png">

Aquí nos indica todos los proyectos existentes en el repositorio que queramos importar en este caso solo es uno el cual importaremos al presionar `Finish`.

<img src="images/02-69.png">

Como podemos apreciar ya nos ha importado nuestro proyecto a nuestro Workspace.

Si veo la carpeta de este repositorio local tenemos.

<img src="images/02-70.png">

A quedado algo rara vamos a continuar a ver si no hay problemas.

La aplicación se ejecuta correctamente. Vamos a añadir un cambio.


<img src="images/02-71.png">

Vamos a subir este cambio al repositorio Remoto.

<img src="images/02-72.png">

Presionamos `Commit and Push`.

<img src="images/02-73.png">

<img src="images/02-74.png">

<img src="images/02-75.png">

Con esto el Desarrollador 2 ha hecho un cambio y lo ha subido al repositorio remoto.

<img src="images/02-76.png">

<img src="images/02-77.png">

<img src="images/02-78.png">

Desde GitHub puedo ver lo que se ha realizado en cada Commit y quien lo ha realizado.

### Realizar un Pull

Que pasa si el Desarrollador 1 quiere descargarse los cambios realizados por el Desarrollador 2. Volvamos a nuestro Workspace inicial.

En este caso estamos hablando de una operación de tipo `Pull` que consiste en traernos los ultimos cambios es decir los ultimos commits que se han hecho sobre el repositorio remoto y que no los tenemos en nuestro repositorio local. Nos traemos el contenido del repositorio Remoto y hacemos una combinación con los valores del proyecto existente. Los cambios que se han hecho en el archivo se transladaran al archivo actual del workspace, que por el momento no los tiene.

<img src="images/02-79.png">


¿Cómo se hace el Pull?

<img src="images/02-81.png">

<img src="images/02-82.png">

<img src="images/02-83.png">

<img src="images/02-84.png">

<img src="images/02-85.png">

<img src="images/02-86.png">

Tuve que volver a marcar la relación por que no me la había almacenado cuando hice el Push. Finalmente se ha actualizado el archivo descargando lo que existia en el el repositorio remoto.

<img src="images/02-87.png">

Si quiero ver las configuraciones de Push y Fech puedo entrar a las siguientes opciones.

<img src="images/02-88.png">

<img src="images/02-89.png">

<img src="images/02-90.png">

<img src="images/02-91.png">

Estas configuraciones solo se hacen una vez y apartir de allí ya sabe como y adonde hacer los Push y los Pull.

<img src="images/02-92.png">

Aquí ya tenemos el historial de los 3 commits hechos hasta el momento.

Con esto tenemos controlado con Git todas las versiones de nuestro proyecto y podemos compartir entre los diferentes miembros del equipo  de una forma mucho más comoda que copiar ficheros o pasarlos por USB o por ZIP.


