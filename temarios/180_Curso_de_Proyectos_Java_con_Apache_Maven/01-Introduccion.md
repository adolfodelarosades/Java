# INTRODUCCIÓN 28M

* Presentación 4M
* Introducción a Apache Maven 8M
* Instalación y configuración 8M
* Conceptos básicos de Apache Maven 7M

## Presentación 4M

<img width="953" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/89f11843-a92d-41ff-9399-d9df715ee157">

<img width="894" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5167b9d0-51fa-462d-a6a2-e2512990f26c">

<img width="950" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c412ead4-62c0-4e05-b1b1-47079388aa2f">

<img width="952" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/99a15928-1168-4c40-878d-04c51a564a07">


## Introducción a Apache Maven 8M

* Estructura de un proyecto
* Sistema de plugins
* Mecanismo de dependencias
* Integración con IDEs: IntelliJ IDEA, Eclipse, Visual Studio Code…
* Mantenimiento y documentación

<img width="955" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/529b6377-ef2b-462d-a8a6-d5ae031f35d5">

<img width="949" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/036bb798-9c76-4e1f-bfb4-9ae10c546981">

<img width="952" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/a9567d33-2003-4d76-96f8-fadf0a7a7e79">

<img width="953" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/aff44761-99fe-44f3-8bfe-1debc7f55408">

<img width="951" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/712334cc-2e06-472e-91c8-b006a053dddd">

<img width="956" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/2b2a4fe3-b88c-4e3e-bb31-3a721d046165">

<img width="949" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/296f4ba4-0171-495b-904b-e0d4a9d3d64c">

<img width="950" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/0afeaa27-ea84-4451-8f41-e348f9ef868a">


## Instalación y configuración Apache Maven 8M

### Descarga

Descargar el archivo comprimido:

http://maven.apache.org/download.cgi

http://maven.apache.org/install.html

### Instalación Windows

Descomprimir el archivo y mover la carpeta dentro del sistema en la ruta de archivos de programa.

Añadir la ruta de la carpeta bin a la variable Path del sistema.

Ejemplo de la ruta:

**`C:\Program Files\apache-maven\apache-maven-3.8.1\bin`**

Para que todo funcione correctamente debe estar Java en el Path y creada la variable
de entorno JAVA_HOME.

### Instalación Linux

Descomprimir el archivo en la carpeta deseada, por ejemplo en el directorio opt.

Añadir la ruta a la carpeta bin al path del sistema:

**`export PATH=/opt/apache-maven-3.8.1/bin:$PATH`**

### Comprobar instalación

**`mvn -v`**

**`mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false`**

<img width="958" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/9b909356-73d8-4ffb-bec0-d022c50d1ae1">

<img width="952" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/55b4d754-2b56-4db7-8519-986a81636f07">

<img width="955" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/816ff4fa-4c73-459c-9979-8bf4ac8fb124">

<img width="950" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e3d554e0-bc10-4e99-85a7-ec16ae1b96ac">

<img width="950" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7c208d0d-9e96-4ec6-96c5-ff05ab796c5d">

<img width="951" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e1a63dfa-d931-40d2-94d6-3167feb60980">

<img width="953" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/5034f6f8-a460-43f5-af9d-58d8010bfdd0">

<img width="951" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/c8dd0804-37b6-4f41-aaef-fd9e0d95583d">


## Conceptos básicos de Apache Maven 7M
