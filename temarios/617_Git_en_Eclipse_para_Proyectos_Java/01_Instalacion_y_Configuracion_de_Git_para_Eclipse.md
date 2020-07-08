# 1. Instalación y Configuración de Git para Eclipse 13:55

<img src="images/01-01.png">

Vamos a ver trabajar con Git para trabajar con proyectos, compartirlos con los miembros del equipo y llevar un contro de versiones del mismo. Lo primero que veremos es como utilizar dentro de Eclipse tanto Git como GitHub y es que aun que son herramientas que se pueden utilizar en la línea de comandos lo habital es integrarlo dentro de los IDEs. 

## GIT

<img src="images/01-02.png">

En primer lugar vamos a ver lo que es Git, Git es una herramienta de control de versiones para trabajar en equipo y a través de el podemos almacenar y compartir proyectos entre los miembros del equipo de forma distribuida, permite gestionar diferentes versiones del proyecto, mientras un miembro del equipo puede estar desarrollando parte del proyecto y subirlo a un repositorio otro miembro del equipo puede descargarse dicho proyecto a añadir sus ambios volverlo a subir etc., cada uno puede estar trabajando con su repositorio local y después sincronizarlo con el repositorio remoto.

Para poder trabajar con Git dentro de Eclipse existe el Plugin EGit que en la versiones más recientes ya viene instalado por defecto. Egit nos permite integrar Git dentro de Eclipse y poder relizar las tareas habituales de una forma comoda y sencilla.

## GitHub

<img src="images/01-03.png">

Deciamos también que ademas de que cada miembro del equipo puede tener su propio repositorio local donde puede tener las diferentes versiones de sus proyectos existe GitHub que es un repositorio remoto donde se pueden subir proyectos y compartirlos públicamente, se sincroniza con los repositorios locales de cada usuario. También podemos integrarlo con EGit de manera que todas estas tareas de subida y descarga de proyectos desde el repositorio remoto se puedan hacer sin recurrir a la línea de comandos. 

### Crear cuenta en GitHub

Para poder utilizar GitHub lo primero que tenemos que hacer es crear una cuenta en Git Hub.

http://github.com/

<img src="images/01-04.png">

Entramos a la página de GitHub y para crear una cuenta nos pide:

* username
* email
* password

<img src="images/01-05.png">

Así de sencillo una vez ingresados los datos se nos mandaría un email para verificar la cuenta y listo.

Una vez creada la cuenta nos autenticariamos y entramos a GitHub.

<img src="images/01-06.png">

GitHub se organiza en repositorios remotos que suran subidos en nuestro caso desde nuestro entorno de trabajo Eclipse. 

### Crear un nuevo Repositorio

Lo que vamos a hacer es crear nuestro nuevo repositorio para lo cual nos pide un nombre, descripción e indicar si lo queremos crear publico o privado.

<img src="images/01-07.png">

Una vez que presionamos el botón de Crear el Repositorio nos muestra una pantalla con diferetes instrucciones de compo poder usar este repositorio remoto.

<img src="images/01-08.png">

Como en nuestro caso lo vamos a usar desde Eclipse lo más relevante para nosotros es la dirección:

https://github.com/adolfodelarosades/JavaSE.git

Que como veremos más adelante nos servir para poder configurar desde Eclipse el uso de GitHub.

Hasta ahora ya hemos creado nuestra cuenta en GitHub y creado un nuevo repositorio ahora vamos a Eclipse.

### Configurar Eclipse para usar Git y GitHub

#### Instalar EGit

En Eclipse lo primero que tendríamos que hacer es instalar el Plugin EGit, pero como hemos mencionado antes en las últimas versiones de Eclipse ya viene instalado por default pero si no fuera el caso hay que instalarlo. 

Nos vamos al Eclipse Markplace y buscamos Egit.

<img src="images/01-09.png">

Como observamos ya esta instalado EGit, sino lo instalariamos con las opciones por default y tendríamos que reinicar Eclipse.

#### Proporcionar datos de Identificación de Git






