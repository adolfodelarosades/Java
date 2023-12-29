# Learning Java Lambdas

By Toby Weston

![image](https://github.com/adolfodelarosades/Java/assets/23094588/c7efaeab-186f-4084-9170-98abe38c8e7a)

* **TIME TO COMPLETE**: 2h 16m

* **TOPICS**: Java Lambdas

* **PUBLISHED BY**: Packt Publishing

* **PUBLICATION DATE**: March 2017

* **PRINT LENGTH**: 114 pages

### Sobre este libro

* Profundice en una de las adiciones más importantes al Java moderno
* Domine Java lambdas y comprenda completamente las functions, classes y scope.
* Mejore sus habilidades de programación, lo que le permitirá escribir código más limpio y dinámico.

### Para quien es este libro

Aprender Java Lambdas es para desarrolladores que buscan actualizar sus habilidades en Java y familiarizarse con una de las nuevas características más importantes de Java. Este libro no es para principiantes absolutos y será más adecuado para profesionales que ya se sienten cómodos con la codificación Java. Debe tener conocimientos básicos de Java antes de leer este libro.

### Lo que vas a aprender

* Qué es una lambda y en qué se diferencia de otras funciones de Java
* Cómo utilizar lambdas de forma eficaz en tus propios proyectos
* El uso de referencias de métodos y alcance avanzado.
* La diferencia entre lambdas y closures.
* Las diferencias en el código de bytes que se producen al usar lambdas

### En detalle

En este breve libro, analizamos en profundidad las lambdas en Java y sus funciones de soporte. El libro cubre temas esenciales, como interfaces funcionales e inferencia de tipos, y las diferencias clave entre lambdas y closures. Aprenderá los antecedentes de la programación funcional y las lambdas, antes de pasar a comprender la sintaxis básica de las lambdas y lo que diferencia estas funciones anónimas de las clases anónimas estándar. Por último, aprenderá cómo invocar lambdas y observar el código de bytes generado.

Después de leer este libro, comprenderá las lambdas en profundidad, sus antecedentes, sintaxis, detalles de implementación y cómo y cuándo usarlos. También tendrá un conocimiento claro de la diferencia entre funciones y clases, y por qué eso es relevante para las lambdas. Este conocimiento le permitirá apreciar las mejoras en la inferencia de tipos que impulsan muchas de las nuevas características del Java moderno y aumentará su comprensión de las referencias de métodos y el alcance.

### Estilo y enfoque

¿Este libro es una inmersión profunda en una de las nuevas características principales del lenguaje Java Lambdas. Los cubre con gran detalle, asegurándose de que comprenda completamente cómo funcionan las lambdas y cómo se pueden utilizar en sus propios programas.

## Table of Contents

* Learning Java Lambdas

* Credits

* About the Author

* www.PacktPub.com

   * Why subscribe?

* Customer Feedback

* Preface

   * What this book covers
   
   * What you need for this book
   
   * Who this book is for
   
   * Conventions
   
   * Reader feedback
   
   * Customer support
   
      * Downloading the color images of this book
      
      * Errata
      
      * Piracy
      
      * Questions

1. Introduction

* The road to modern Java
   * Modern Java features
2. Lambdas Introduction
* λs in functional programming
   1930s and the lambda calculus
   1950s and LISP
   What is a lambda
* Functions vs classes
   Lambdas in modern Java
   Some theoretical differences
   Functions vs classes
   Some concrete differences
      Capture semantics
      Shadowed variables
   Summary
* λ basic syntax
   Syntax breakdown
   Summary
3. Lambdas in Depth
Functional interfaces
@FunctionalInterface
Extension
Other interface improvements
Summary
Type inference improvements
Java type inference
Target-typing for lambdas
Type parameters in method calls
Type parameters in chained method calls
Method references
Example
Method reference types
Constructor reference
Static method reference
Instance method reference of particular object (in this case, a closure)
Instance method reference of a arbitrary object whose instance is supplied later (lambda)
Summary
Scoping
Effectively final
Circumventing final
Exception handling
Using a callback
Dealing with exceptions when writing lambdas
As a caller (dealing with exceptions when calling lambdas)
Lambdas vs closures
Basic differences
Other differences
Summary
Bytecode recap
Descriptors
Converting a method signature
Code examples
Example 1
Example 2
Example 3
Example 4
Example 4 (with method reference)
Example 5
Summary
A. Bytecode
WaitFor
Example 1
Example 2
Example 3
Example 4
Example 4 (with Method Reference)
Example 5
