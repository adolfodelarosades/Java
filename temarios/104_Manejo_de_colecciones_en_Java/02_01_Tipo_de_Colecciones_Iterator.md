# `Iterable<E>`

https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html

<img src="images/01-11.png">

Comencemos por la raíz por **`Iterable<E>`** podemos ver que `Iterable` no remite al concepto de *iterador* *un iterador un patrón de diseño que nos permite recorrer una sucesión o colección de elementos*. 

En las primeras versiones de los iteradores lo que se permitía siempre era recorrer esa colección de elemento a partir de Java 8 se incorpora también la opción de eliminar siempre y cuando la colección subyacente lo permita, veremos que tendremos por ejemplo las colecciones que son no modificables que son inmutables y qué si tratáramos de utilizar este método `remove` tendríamos una excepción.

El hecho de que se pueda heredar de `Iterable` es lo que permite que usemos los métodos *forEach* o el bucle *forEach* que tenemos en la diapositiva, podríamos tener por la vía que fuese un iterable y podríamos iterar o lo podríamos recorrer con este bucle que es bastante usual.

## :computer: Ejemplo de `Iterable<E>`

*`IterableApp`*

```java
package net.openwebinars.colecciones.iterable;

import java.util.Arrays;

/**
 *  Ejemplo de uso de la interfaz Iterable
 *  
 */
public class IterableApp {

   public static void main(String[] args) {

      // Obtenemos el iterable por la vía que corresponda
      Iterable<String> unIterable = obtenerIterable();

      // Lo podemos recorrer usando un bucle for-each
      for (String s: unIterable) {
         System.out.println(s);
      }
      
      System.out.println("");

      // También con el método forEach
      unIterable.forEach(System.out::println);

    }

    private static Iterable<String> obtenerIterable() {
       return Arrays.asList("Madrid", "Barcelona", "Sevilla");
    }
}
```

Aquí podemos ver un ejemplo de `Iterable` en el que un iterable como en el fondo es digamos que una interfaz raíz, la podríamos obtener por cualquier vía o como hemos podido comprobar en el diagrama de clases no se puede instanciar directamente, tendríamos que proporcionar nosotros una clase que lo implementará, lo cual no tendría mucho sentido, pero si es verdad **hay muchos contextos en los cuales en lugar de devolverse una colección concreta se nos devuelve un iterable** porque en el fondo lo único que se necesita es poder recorrer esta colección (Iterable) de la manera que sea conveniente a través del bucle estilo `for each` o incluso del método `forEach(...)`.

## Ejecutar la Aplicación.

<img src="images/01-70.png">

Estamos recorriendo dos veces un iterable con `for each` y con del método `forEach(...)`. El `Iterable` en este caso lo recuperamos con el método `obtenerIterable()` pero en otras aplicaciones se puede recuperar de la forma que sea. 

**Un ejemplo de uso de `Iterable` por ejemplo lo encontrarán aquellos que visiten los cursos de Spring en la parte de Spring Data JPA, por ejemplo los interfaces más sencillos del repositorio de Spring Data JPA por ejemplo trabajan con iterable** y hasta que no llegamos a alguna implementación un poco más concreta no le vemos la aplicación a los `Iterable` tenemos la posibilidad en lugar de trabajar con iterable con otras colecciones. Un `Iterable` es cómodo en el sentido de que podemos recorrer los objetos sobre el.
