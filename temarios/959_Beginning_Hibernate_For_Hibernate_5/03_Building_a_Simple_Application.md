# Chapter 3: Building a Simple Application

* A Simple Application
* A First Attempt
* Writing Data
* Reading Data
* Updating Data
* Persistence Contexts
* Removing Data
* A Note on Transactions
* Writing Our Sample Application
* Summary

En este capítulo, vamos a crear el shell de una aplicación, lo que nos permitirá demostrar una serie de conceptos comunes para los sistemas que usan Hibernate. Cubriremos lo siguiente:

* Diseño de modelos de objetos, incluidas las relaciones entre objetos.
* Operaciones que visualizan y modifican datos persistentes (inserciones, lecturas, actualizaciones y eliminaciones).

Por lo general, usaríamos una capa de servicio para encapsular algunas operaciones y, de hecho, agregaremos una capa de servicio a medida que avancemos, pero en este punto queremos ver más sobre cómo interactuar con Hibernate. El objetivo aquí es no perder el tiempo con una aplicación de muestra que es "una para tirar". Definitivamente no podremos tener una base de código completa e ideal, pero será un modelo de cómo se podría usar Hibernate en el mundo real.

Por supuesto, tal declaración tiene una advertencia: diferentes aplicaciones y arquitectos tienen diferentes enfoques. Esta es solo una forma de crear una aplicación de este tipo; otros tomarán diferentes enfoques que son tan válidos como este.

Además, nuestro modelo será progresivo, por lo que su calidad en su génesis no será muy alta. Vamos a presentar varios conceptos nuevos a medida que avanzamos; y tendremos muchas oportunidades para volver al código escrito previamente y mejorarlo.

## A Simple Application

Lo que estamos tratando de crear es una aplicación que permita la clasificación de pares en varias áreas de habilidades.

El concepto es algo así: John piensa que Tracy es bastante buena en Java, por lo que en una escala del 1 al 10, le daría a Tracy un 7. Sam piensa que Tracy es decente, pero no genial; le daría a Tracy un 5. Con estas dos clasificaciones, uno podría suponer que Tracy obtuvo un 6 en Java. Siendo realistas, con un conjunto de muestras tan pequeño, no sería capaz de evaluar si esta clasificación fue precisa o no, pero después de 20 clasificaciones de este tipo, tendría la oportunidad de una evaluación por pares verdaderamente legítima.

Entonces, lo que queremos es una forma de que un observador ofrezca una clasificación para una habilidad dada para una persona específica. También nos gustaría una forma de determinar la clasificación real de cada persona, así como una forma de averiguar quién fue clasificado como "el mejor" para una habilidad determinada.

Si observa estos párrafos con miras al diseño de aplicaciones, verá que tenemos cuatro tipos diferentes de entidades (objetos para administrar en una base de datos) y algunos servicios.

Nuestras entidades son estas: People - Personas (que son observadores y sujetos, por lo tanto, dos tipos de entidades que se ven exactamente iguales), Skills - habilidades y Rankings - clasificaciones.

Nuestras relaciones son algo así:

Un sujeto, una People, tiene cero, una o muchas habilidades. Cada una de las Skills de una persona tiene cero, uno o muchos Rankings.

Un Ranking tiene una puntuación (“en una escala del 1 al 10”) y un observador (una Persona que envía un ranking en particular).

### Un primer intento

Nuestro proyecto nos permitirá escribir, leer y actualizar clasificaciones para diferentes temas, así como decirnos quién tiene el puntaje promedio más alto para una habilidad determinada.

No hará estas cosas de manera muy eficiente al principio, pero en el camino cumpliremos nuestro deseo de prácticas de desarrollo (algo) ágiles, y aprenderemos un poco sobre cómo leer y escribir datos con Hibernate.

Como de costumbre, utilizaremos el desarrollo basado en pruebas. Escribamos algunas pruebas y luego tratemos de hacerlas pasar. Nuestros primeros bits de código serán muy primitivos, probando solo nuestro modelo de datos, pero eventualmente estaremos probando servicios.

Nuestro modelo de datos se muestra en la Figura 3-1. Como puedes ver, tiene tres tipos de objetos y tres relaciones: Persona se relaciona con Ranking de dos maneras (como sujeto y observador), y cada Ranking tiene una Habilidad asociada.

## A First Attempt
## Writing Data
## Reading Data
## Updating Data
## Persistence Contexts
## Removing Data
## A Note on Transactions
## Writing Our Sample Application
## Summary
