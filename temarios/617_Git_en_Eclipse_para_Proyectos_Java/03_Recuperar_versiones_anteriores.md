# 3. Recuperar versiones anteriores 4:17

<img src = "images/03-01.png">

En esta lección vamos a ver como recuperar versiones anteriores de archivos que han sido almacenados en un repositorio Git desde Eclipse. 

<img src = "images/03-02.png">

La idea es poder restaurar algún archivo desde un Commit anterior, a través de Eclipse vamos a poder comparar los archivos del proyecto actual con los Commits anteriores, ver las diferencias que hay y si queremos poder restaurar los cambios realizados a la nueva versión. Como ya hemos visto podemos dar en.

<img src = "images/03-03.png">

<img src = "images/03-04.png">

Podemos ver todos los commits realizados, si nos interesaria ver como era el estado de nuestro unico archivo en el Commit inicial nos posicionamos en el y con el botón derecho seleccionamos `Open in Commit Viewer`

<img src = "images/03-05.png">

Se abre una ventana con todos los archivos que se subieron en ese Commit y podemos pulsar sobre el que nos interese.

<img src = "images/03-06.png">

En este caso vamos a pulsar doble click sobre `Saludo.java`

<img src = "images/03-07.png">

Se abre el archivo en el estado que esta en ese Commit Inicial simplemente para visualizarlo, también podríamos copiar cosas de el al archivo actual pero existe una opción más práctica.

Vamos a hacer una compariva entre el Archivo actual y el de el Commit Inicial. En este caso nos vamos a posicionar sobre el archivo botón derecho *Compare With - Commit*

<img src = "images/03-08.png">

Nos sale la lista de los Commits.

<img src = "images/03-09.png">

Elegimos contra cual queremos comparar, vamos a seleccionar el Commit Inicial.

<img src = "images/03-10.png">

Nos sale una ventana donde compara ambos archivos como lo hacia cuando haciamos la comparación Local que vimos en la sección 2. Vamos a restaurar el archivo actual como lo teniamos en la versión inicial pulsando en el botón `copy currence Chance from rigth to Left` y nos queda lo siguiente.

<img src = "images/03-11.png">

Salvamos los cambios.

<img src = "images/03-12.png">

Ya no hay diferencias.

Finalmente vamos a realizar un Commit and Push para almacenar los ultimos cambios.

<img src = "images/03-13.png">

<img src = "images/03-14.png">

<img src = "images/03-15.png">

<img src = "images/03-16.png">

<img src = "images/03-17.png">

Y ya tenemos los cambios en el repositorio remoto.

<img src = "images/03-18.png">

<img src = "images/03-19.png">

<img src = "images/03-20.png">




