# `Map<K,V>`

<img src="images/01-36.png">

El tercer gran conjunto de Colecciones es `Map<K,V>` se trata de la primera que no hereda de
`Collection` maneja pares clave-valor, para cada clave hay un solo valor, cada clave puede existir una sola vez en el `Map` no puede estar repetida, podríamos tener una clave nula una sola clave nula y múltiples valores nulos eso si, hay otro lenguaje de programación dónde se le conoce como diccionario, al igual que las colecciones anteriores por recordarlo en este punto, como no permite almacenar tipos primitivos tendríamos que usar siempre los tipos envoltorio en su lugar, en lugar de `int` usar `Integer` etc.

<img src="images/01-37.png">

Existe una clase que aparece en alguna ocasión en la documentación que es `Map.Entry<K,V>` que es la clase que nos permite consultar de una manera conjunta el par clave-valor y de hecho hay un método `entrySet()` en la interfaz `Map` que nos devolverías un conjunto, un set de elementos de este tipo, de tipo `Map.Entry`.

<img src="images/01-38.png">

Las operaciones más comunes con `Map<K,V>` son:

* La de insertar una clave y valor mediante el método `put(key, value)`.
* Obtener un valor en base a la clave con el método `get(key)`.
* Consultar si una determinada clave o un valor están contenidos dentro del `Map` con `containsKey(key)` o `containsValue(value)`.
* Eliminar un par clave-valor en base a la clave con el método `remove(key)`

<img src="images/01-39.png">

Y veremos que para recorrerlo tenemos dos opciones a través de un forEach dónde obtendríamos mediante el método `entryKey` todas las claves en un `Set` recorreriamos ese `Set` y para cada uno podríamos obtener con el método `get` los distintos valores o podríamos utilizar el método `foreach` y usando Lambda con un Biconsumer que vamos a ver que sería una expresión muy sencilla, podríamos obtener tanto las claves como los distintos valores.

<img src="images/01-40.png">

vamos a comprobar como hay en la implementación es no suena un montón de hecho tienen los mismos nombres prácticamente que en el caso de sed tenemos HashMap que serían más rápido que no nos dice nada sobre el orden en que mantiene el orden de inserción qué es linkedhashmap y el que ordena según las claves que sería prima la visita en qué habitación es como decimos se parecen un montón a las Peset tanto en HashMap linkedhashmap que ordena según inserción y prima que mantiene las claves en en orden natural vale veámoslo los distintos ejemplos que tenemos de más por ejemplo si quisiéramos almacenar una serie de productos en base a su referencia los podríamos tener por por aquí vale podríamos guardar aquí un ordenador portátil uno compacto no auriculares gamer con monitor de 27 pulgadas insertaremos Comput una referencia de que ya existe una clave que ya existe lo único que se hace sustituir este nuevo valor por el valor que había antes hija que aquí este monitor sería un poco más caro que el anterior y si les comentara esa línea y ejecutará no pues se insertaría este este valor se puede insertar un valor si solo si la clave no está insertada y si no está lo que hace devolvernos el valor antiguo y en otro caso no te volvería nudo vale que lo podíamos hacer también mediante estar mediante esta operación con containskey y barrio hemos visto también que podríamos comprobar si se contiene un determinado una determinada clave un determinado valor vale y también tenemos el método GET or default que nos devolvería para una determinada clave que nosotros





<img src="images/01-41.png">
<img src="images/01-42.png">
<img src="images/01-43.png">

