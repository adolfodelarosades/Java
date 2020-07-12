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

Vamos a comprobar como hay tres implementaciones, nos suena un montón, de hecho tienen los mismos nombres prácticamente que en el caso de `Set`, tenemos `HashMap` que serían el más rápido que no nos dice nada sobre el orden, el que mantiene el orden de inserción qué es `LinkedHashMap` y el que ordena según las claves que sería `TreeMap`.

<img src="images/01-41.png">

Las distintas implementaciones como decimos se parecen un montón a las de `Set` tanto en `HashMap`.

<img src="images/01-42.png">

En `LinkedHashMap` que ordena según inserción.

<img src="images/01-43.png">

Y `TreeMap` que mantiene las claves en en orden natural.


Veámoslo los distintos ejemplos que tenemos de `Map`.

### :computer: Ejemplo de Aplicación `HashMap<E>`

Por ejemplo si quisiéramos almacenar una serie de productos en base a su referencia los podríamos tener por por aquí.


*`Producto`*

```java
package net.openwebinars.colecciones.map.model;

import java.util.Objects;

/**
 * Modelo para los ejemplos con Map<K,V>
 *
 * 
 */
public class Producto implements Comparable<Producto> {

    private String referencia;
    private String nombre;
    private float precio;

    public Producto(String referencia, String nombre, float precio) {
        this.referencia = referencia;
        this.nombre = nombre;
        this.precio = precio;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Producto producto = (Producto) o;
        return Float.compare(producto.precio, precio) == 0 &&
                Objects.equals(referencia, producto.referencia) &&
                Objects.equals(nombre, producto.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(referencia, nombre, precio);
    }

    @Override
    public String toString() {
        return "Producto{" +
                "referencia='" + referencia + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                '}';
    }

    // Ordenamos los productos por precio
    @Override
    public int compareTo(Producto o) {
        return Float.compare(precio, o.getPrecio());
    }
}
```

*`HashMapApp`*

```java
package net.openwebinars.colecciones.map.a.hashmap;

import net.openwebinars.colecciones.map.model.Producto;

import java.util.HashMap;
import java.util.Map;

/**
 * Ejemplo de uso de la implementación HashMap<K,V>
 *
 * 
 */
public class HashMapApp {

    public static void main(String[] args) {

        // HashMap tiene unos constructores muy parecidos a HashSet
        Map<String, Producto> hashMap = new HashMap<>();

        // Insertamos varios productos
        Producto pc = new Producto("PC000123", "Ordenador portátil", 800.0f);
        hashMap.put("PC000123", pc);
        hashMap.put("PC000234", new Producto("PC000234", "Ordenador compacto", 400.0f));
        hashMap.put("COMPGAM012", new Producto("COMPGAM012", "Auriculares gamer", 75.56f));
        hashMap.put("MON274K034", new Producto("MON274K034", "Monitor 27 4K", 325.67f));


        // Si insertamos una referencia que ya existe, simplemente reemplaza el valor
        // hashMap.put("MON274K034", new Producto("MON274K034", "Monitor 27 4K", 450.0f));

        // Se puede insertar un valor sí o solo sí la clave no está insertada,
        // y si lo está, nos devuelve el valor antiguo. En otro caso devuelve nulo
        Producto monitor = hashMap.putIfAbsent("MON274K034", new Producto("MON274K034", "Monitor 27 4K", 450.0f));

        // Se puede comprobar si se contiene alguna clave, o algún valor.
        if (hashMap.containsKey("PC000123"))
            System.out.println("El Map contiene la clave");

        if (hashMap.containsValue(pc))
            System.out.println("El Map contiene el valor");

        // También podemos hacer uso de getOrDefault
        // si queremos obtener el valor asociado
        // a una referencia y, si no existe, un valor por defecto
        System.out.println(hashMap.getOrDefault("MON274K034", monitor));

        // La forma tradicional de recorrerla es mediante un bucle for-each sobre las claves
        for (String key : hashMap.keySet())
            System.out.println(hashMap.get(key));

        System.out.println("\n\n");
        // También podemos recorrer el HashMap con un estilo "más lambda"
        hashMap.forEach((k,v) -> System.out.println(v));

    }
}

```

AQUIIIIII.
Podríamos guardar aquí un ordenador portátil uno compacto no auriculares gamer con monitor de 27 pulgadas insertaremos Comput una referencia de que ya existe una clave que ya existe lo único que se hace sustituir este nuevo valor por el valor que había antes hija que aquí este monitor sería un poco más caro que el anterior y si les comentara esa línea y ejecutará no pues se insertaría este este valor se puede insertar un valor si solo si la clave no está insertada y si no está lo que hace devolvernos el valor antiguo y en otro caso no te volvería nudo vale que lo podíamos hacer también mediante estar mediante esta operación con containskey y barrio hemos visto también que podríamos comprobar si se contiene un determinado una determinada clave un determinado valor vale y también tenemos el método GET or default que nos devolvería para una determinada clave que nosotros









