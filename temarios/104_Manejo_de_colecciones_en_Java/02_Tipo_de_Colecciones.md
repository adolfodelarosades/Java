# 02 Tipo de Colecciones y ejemplo de uso

<img src="images/01-09.png">

Vamos a pasar al punto más largo de este taller en el que vamos a conocer los diferentes tipos de colecciones a través de los interfaces y de sus implementaciones.

<img src="images/01-10.png">

En la diapositiva tenemos el Diagrama de Clases, no esta completo, lo que pasa que añadir más interfaces o implementaciones la verdad es que lo hubiera enmarañado más que aclarado. Tenemos la jerarquía de interfases y clases que podemos encontrar en el paquete `java.util` como parte de las colecciones. Lo que está en *un tono verdoso son interfaces*, lo que está en *un tono salmón son clases abstractas* que no podemos instanciar y las *clases que si podemos utilizar las implementaciones existentes con un fondo blanco*. Las *líneas continuas denotan extensión entre interfaces o entre clases* y *las líneas punteadas denotan la implementación de una determinada interface*, es decir clases que implementan una determida interfaz.

Iremos visitando las diferentes interfaces, clases y clase concretas que tiene este este diagrama, lo iremos viendo poco a poco.

Podemos ver que hay dos grandes tipos están todas las que heredan de *Iterable* y posteriormente de *Collection* y luego tenemos las que heredan de *Map* **se diferencian fundamentalmente en que unas seran colecciones que puedan guardar elementos como tal *todos del mismo tipo* y la otra podrán guardar *pares de una clave asociada a un valor***.

## `Iterable<E>`

https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html

<img src="images/01-11.png">

Comencemos por la raíz por **`Iterable<E>`** podemos ver que `Iterable` no remite al concepto de *iterador* *un iterador un patrón de diseño que nos permite recorrer una sucesión o colección de elementos*. 

En las primeras versiones de los iteradores lo que se permitía siempre era recorrer esa colección de elemento a partir de Java 8 se incorpora también la opción de eliminar siempre y cuando la colección subyacente lo permita, veremos que tendremos por ejemplo las colecciones que son no modificables que son inmutables y qué si tratáramos de utilizar este método `remove` tendríamos una excepción.

El hecho de que se pueda heredar de `Iterable` es lo que permite que usemos los métodos *forEach* o el bucle *forEach* que tenemos en la diapositiva, podríamos tener por la vía que fuese un iterable y podríamos iterar o lo podríamos recorrer con este bucle que es bastante usual.

## Ejemplo de `Iterable<E>`

*`IterableApp`*

```java
package net.openwebinars.colecciones.iterable;

import java.util.Arrays;

/**
 *  Ejemplo de uso de la interfaz Iterable
 *  @author Luis Miguel López Magaña
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

#### Ejecutar la Aplicación.

<img src="images/01-70.png">

Estamos recorriendo dos veces un iterable con `for each` y con del método `forEach(...)`. El `Iterable` en este caso lo recuperamos con el método `obtenerIterable()` pero en otras aplicaciones se puede recuperar de la forma que sea. 

**Un ejemplo de uso de `Iterable` por ejemplo lo encontrarán aquellos que visiten los cursos de Spring en la parte de Spring Data JPA, por ejemplo los interfaces más sencillos del repositorio de Spring Data JPA por ejemplo trabajan con iterable** y hasta que no llegamos a alguna implementación un poco más concreta no le vemos la aplicación a los `Iterable` tenemos la posibilidad en lugar de trabajar con iterable con otras colecciones. Un `Iterable` es cómodo en el sentido de que podemos recorrer los objetos sobre el.

## `Collection<E>`

https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Collection.html

<img src="images/01-12.png">

De `Iterable` heredamos la interfaz `Collection` que va a hacer el padre de tres de las colecciones(interfaces) con las cuales vamos a trabajar `Set<E>`, `List<E>` y `Queue<E>`.

`Collection` extiende `Iterable` heredando toda su funcionalidad con lo cual podríamos seguir recorriendo los elementos, también eliminarlos.

El resto de interfaces salvo `Map` heredan de `Collection` con lo cual nos da un conjunto de métodos comunes que son transversales a casi todas las colecciones.

Y si bien es cierto que no tenemos ninguna implementación directa de la interfaz `Collection` la podemos utilizar en ocaciones como el tipo de dato que puede recibir un método a la hlora de hacer determinadas operaciones.

<img src="images/01-13.png">

Las  operaciones que nos da de paraguas para el resto de colecciones serían:

* Tamaño: `size` y `isEmpty` Verificar el tamaño, si está vacío.
* Comprobación: `contains` si se contiene un elemento.
* Añadir y eliminar elementos: `add` y `remove`
* Iterar: `iterator` Iterar sobre el.
* Operaciones sobre un conjunto de datos.
   * Ver si se contienen los datos de otra colección: `containsAll`
   * Añadir un conjunto de datos: `addAll`
   * Eliminar un conjunto de datos: `removeAll`
   * Elimininar si se cumple una determinada colección: `removeif`
   * Comprobar si una colección tiene un conjunto de otra: `retainAll`
   * Limpiar por completo la colección: `clean`
* Transformarlo en un array: `toArray`
* Transformación en Streams: `stream`, `parallelStream`

Pueden consultar la documentación de la interfaz `Collection` para ver una descripción más concreta de todos estos métodos.

https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Collection.html

## `Set<E>`

https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Set.html

<img src="images/01-14.png">

**`Set`** es un un tipo de colección muy concreto que **no permite elementos duplicados** es decir que si nosotros añadimos un elemento por segunda vez no va a suceder nada simplemente que no lo va a añadir, no se permite tener elemento repetidos, ya que es una abstracción del concepto matemático de conjunto, otra segunda cosa que llama la atención es que **no permite el acceso posicionales**, es decir no podemos acceder al tercer elemento de este conjunto, porque de alguna manera **representa una especie de saco** donde estan todos esos elementos, es verdad también hace una mejora con respecto a colecciones y es que mejora la implementación de los métodos `equals` y `hashcode` con respecto a `Collection<E>` y a la hora de comparar dos instancias son iguales si contienen los mismos elementos.

<img src="images/01-15.png">

Vamos a ver que tenemos diferentes tipos que podemos utilizar con una serie de subinterfaces en las cuales no nos vamos a meter si no que ya ya nos iríamos a conocer las implementaciones concretas, que en el fondo son tres:

* `HashSet<E>` que de las tres implementaciones es la más rápida, no permite manejar nada con respecto al orden de los elementos.
* `LinkedHashSet<E>` sería una implementación que heredaría de `HashSet<E>`, es un poco más lenta pero tiene la ventaja que nos va a permitir recuperar los elementos de este Set en el orden de inserción.
* `TreeSet<E>` por último tendríamos `TreeSet` de las 3 implementaciones en la más lenta y que sí que nos podría aportar el orden de los elementos según su valor.

### `HashSet<E>`

<img src="images/01-16.png">

`HashSet` lo que hace es almacenar los valores de esta colección en una **tabla hash** qué es eso de una tabla hash, es una tabla que nos permite guardar elementos a través de una función hash que en teoría es una función que recoge el elemento que nosotros queremos insertar y que nos devuelve un valor aplicandole a a ese elemento a través de esta función hash, nos devuelve un valor que debería ser **univoco único**, es decir que no se podría repetir, esto que tiene sin entrar demasiado en abundar en el concepto de estas función hash del hashing, esto que nos proporciona, bueno pues nos proporciona que la mayoría de las operaciones, sobre todo la operaciones de acceso, son en un tiempo constante, hablaremos a lo largo de este taller un poco de eficiencia algorítmica, incluso haremos uso de algún tipo de notación para representarlos no nos meteremos nada excesivamente complejo, cuando decimos que la eficiencia sería por ejemplo de la búsqueda de un elemento en un tiempo constante, quiere decir que daría igual aproximadamente el tener una una colección de 10 elementos, que una de 10.000, que el tiempo de búsqueda sería aproximadamente el mismo,
es decir que no va a variar el tiempo de búsqueda con el número de elementos que contenga esa colección.

<img src="images/01-17.png">

Lo que deciamos antes sobre los `HashSet` no podemos predecir nada sobre el orden de los elementos, es decir puede que los insertemos en un orden y que se nos devuelvan en un orden distinto una vez y otra vez y otra vez cada que lo quisiéramos recuperar, si es verdad que nos da el mejor rendimiento de todas las implementaciones de `Set` proporcionando un tiempo constante en las operaciones básicas, permite insertar valores nulos, como no se permiten valores repetidos lo podríamos insertar una sola vez, no es sincronizada es decir que no sería recomendable si la quisiéramos utilizar para hacer inserciones y consultas en un contexto múltihilo, a la hora de construirla se mejoraría mucho el rendimiento si establecemos una capacidad inicial lo más ajustada posible. 

### `LinkedHashSet<E>`

<img src="images/01-18.png">

Podemos ver también la siguiente implementación qué es `LinkedHashSet<E>`con respecto al anterior lo que haría sería almacenar los valores en una tabla hash con una lista doblemente enlazada, lo cual nos va a permitir además de tener la opción anterior del hashing, el poder conservar el orden de inserción y podríamos recuperar los elementos en ese orden, por lo cual al menos si necesitáramos un cierto orden y mantener el orden de inserción lo podríamos hacer, el rendimiento es algo peor que `HashSet<E>` pero algo mejor que el de `TreeSet<E>`.

### `TreeSet<E>`

<img src="images/01-19.png">

`TreeSet<E>` tiene como implementación interna para almacenar los valorés un árbol *red-black* un árbol rojo-negro, se trata de una estructura de datos especial que surgió en los años 70s, en un árbol binario de búsqueda y qué tiene una serie de características especiales en las cuales no vamos a entrar aquí, en las cuales los nodos se van coloreando de una determinada manera y que nos permite mantener los elementos en orden, con una eficiencia bastante razonable por lo cual si quisiéramos tener elementos no repetido y en el orden según el valor podríamos utilizar este `TreeSet<E>`

<img src="images/01-20.png">

la cuestión sería como es natural que para para que los elementos tuvieran ordenados según su orden natural pues las clases que insertemos el tipo de dato tiene que implementar comparable y de esta manera bueno pues podría mantener el orden como decía esta notación o qué se utiliza en algorítmica vale para medir bueno fue debido a su estructura de árbol la operación es por ejemplo la búsqueda estarían dejamos acostada en no logaritmo de N decir que no no va directamente no es directamente proporcional el Prendimiento al al número de elementos sino que estaría un poco un poco por debajo al ser en en este tipo de bueno pues vamos a conocer vamos a ver en acción alguna odelo ejemplo vale de ser el primero sería cassette hemos visto que la implementación más sencilla que tenemos cuando nosotros consultamos en la documentación dejase vemos que tenemos diferente constructores el más sencillo de ellos el constructor al cual no no le pasamos ninguna argumento y que no bueno no crea un set un hámster con 16 elementos y un factor de carga de 075 factor de carga lo que representa una especie de porcentaje a partir del cual el se va a ir creciendo conforme nosotros lee le añadamos elementos cómo te sientes el conjugar bien estos dos elementos nos va a permitir es que la función dejasen que utiliza por dentro pues sea lo más concreta posible y por tanto que el rendimiento de nuestro hámster sé a lo mejor aquí podemos apreciar como decía antes el uso de genéricos es decir que hasta la versión 14 de estaba no por lo que teníamos es que todas las colecciones lo que hacían eran almacenar noche y como cualquier objeto almacenar cualquier cosa sin embargo con el uso de



<img src="images/01-21.png">
<img src="images/01-22.png">
<img src="images/01-23.png">
<img src="images/01-24.png">
<img src="images/01-25.png">
<img src="images/01-26.png">
<img src="images/01-27.png">
<img src="images/01-28.png">
<img src="images/01-29.png">
<img src="images/01-30.png">
<img src="images/01-31.png">
<img src="images/01-32.png">
<img src="images/01-33.png">
<img src="images/01-34.png">
<img src="images/01-35.png">
<img src="images/01-36.png">
<img src="images/01-37.png">
<img src="images/01-38.png">
<img src="images/01-39.png">
<img src="images/01-40.png">
<img src="images/01-41.png">
<img src="images/01-42.png">
<img src="images/01-43.png">


