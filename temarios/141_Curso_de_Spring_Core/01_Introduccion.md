# 1. Introducción  60m

* Presentación 4:31 
* Introducción a Spring 14:25 
* Instalación del entorno de trabajo 13:55 
* Estructura de una aplicación empresarial y patrones de diseño 12:55 
* Inversión de control e inyección de dependencias 15:09 
* Contenido adicional  5

# 01 Presentación 4:31

[PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 02 Introducción a Spring 14:25

[PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)

## Resumen Profesor

### Proyectos que conforman Spring

A día de hoy, Spring se considera algo más que un framework, ya que incluye una gran cantidad de proyectos que abarcan ámbitos diferentes. En este enlace, puedes encontrar un listado completo:

https://spring.io/projects

### Novedades de Spring 5

En este enlace podrás encontrar todas las novedades incluidas en las últimas versiones de Spring.

https://github.com/spring-projects/spring-framework/wiki/What's-New-in-Spring-Framework-5.x

### Transcripción

# 03 Instalación del entorno de trabajo 13:55

[PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)

## Resumen Profesor

### Requisitos

Para poder trabajar con Spring, necesitamos que nuestro ordenador disponga de una instalación de JDK 8. Puedes encontrar la información en https://www.oracle.com/technetwork/java/javase/downloads/index.html.

### Spring Tool Suite

Nuestro IDE será Spring Tool Suite, que está basado en Eclipse, e incluye muchas facilidades para trabajar con la familia de proyectos de Spring. Se puede instalar como un plugin sobre una instalación de eclipse, pero si vas a comenzar desde cero, te recomendamos descargar el *bundle* disponible en https://spring.io/tools/sts.

### Instalación vía ubuntu-make

Ubuntu Make es una herramienta de línea de comandos que permite descargar e instalar la última versión de varios entornos de desarrollo. También se encarga de instalar las dependencias necesarias, así como de crear los lanzadores (accesos directos). Básicamente, se trata de un comando para poner tu sistema a punto para desarrollar.

Entre otras herramientas, *Ubuntu make* permite la instalación de *Spring Tool Suite*. Para ello, debemos seguir los siguientes pasos:

### Instalar Ubuntu Make

Añadimos el repositorio PPA a nuestro sistema

```sh
$ sudo add-apt-repository ppa:lyzardking/ubuntu-make
$ sudo apt-get update
```

Instalamos ubuntu make

```sh
$ sudo apt-get install ubuntu-make
```

Ya podemos usarlo para instalar Spring Tool Suite

```sh
$ umake ide spring-tools-suite
```

## Transcripción

# 04 Estructura de una aplicación empresarial y patrones de diseño 12:55

[PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 05 Inversión de control e inyección de dependencias 15:09 

[PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional  5

* [PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)
* [PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)
* [PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)
* [PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)
* [PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)
