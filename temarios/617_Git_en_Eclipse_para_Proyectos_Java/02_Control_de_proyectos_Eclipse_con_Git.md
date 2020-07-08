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














