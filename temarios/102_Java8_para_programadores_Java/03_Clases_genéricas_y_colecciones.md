# 3. Clases genéricas y colecciones 37m
   * 11 Creación de una clase genérica 10:22 
   * 12 Creación y uso de list, set y map 18:19 
   * 13 Interfaces Comparable y Comparator 9:07 
   * Contenido adicional 3
   
# 11 Creación de una clase genérica 10:22 

[Creación de una clase genérica](pdfs/11_Creación_de_una_clase_genérica.pdf)

## Resumen del Profesor

### 11.1 Clases genéricas

Java permite desde sus orígenes usar clases genéricas, utilizando referencias de tipo `Object`. Sin embargo, estas pueden producir problemas en tiempo de ejecución.

```java
public class Box {
   private Object object;

   public void set(Object object) {
      this.object = object;
   }

   public Object get() {
      return object;
   }
}
```

Desde Java SE 5, podemos crear clases cuyo tipo se indica en tiempo de compilación

```java
public class Box<T> {
   private T object;

   public void set(T object) {
      this.object = object;
   }

   public T get() {
      return object;
   }
}
```

Podemos utilizar más de un tipo diferente a la vez:

```java
public class Par<T, S> {
   private T obj1;
   private S obj2;

   //Resto de la clase

}
```

### 11.1.1 Nomenclatura con los tipos

* E (element, elemento)
* K (key, clave)
* N (number, número)
* T (type, tipo)
* V (value, valor)
* S, U, V, … (2º, 3º, 4º, … tipo)

### 11.2 Instanciación y operador diamond

Hasta Java SE 6, para instanciar un objeto genérico, tenemos que indicar los tipos dos veces.

```java
Par<String, String> pareja2 = new Par<String, String>("Hola", "Mundo");
```

Desde Java SE 7, tenemos el operador `<>` diamond:

```java
Par<String, String> pareja2 = new Par<>("Hola", "Mundo");
```

### 11.3 Clases genéricas con tipos cerrados

Podemos acotar el tipo parametrizado, para que sea uno en particular o sus derivados:

```java
public class NumericBox<T extends Number> {

   private T object;

   //resto de la clase
}
```

Se puede indicar más de un tipo. Uno de ellos (y solo uno) se corresponderá con una clase; el resto deben ser interfaces. La clase a *extender* debe ser la primera de la lista:

```java
public class A {
   //resto de la clase
}

public interface B {
   //resto de la interfaz
}

public class StrangeBox <T extends A & B> {

   //resto de la clase
}
```

### 11.4 Genéricos con tipos comodín

Los tipos comodín nos permiten *relajar* el tipo concreto de una clase genérica a un subtipo. Son muy útiles en el caso de trabajar con colecciones (las trataremos en los próximos capitulos).

```java
public static double sumOfList(List<? extends Number> list) {
   double s = 0.0;
   for (Number n : list)
      s += n.doubleValue();
   return s;
}
```

## Transcripción

<img src="images/11-01.png">
<img src="images/11-02.png">
<img src="images/11-03.png">
<img src="images/11-04.png">
<img src="images/11-05.png">
<img src="images/11-06.png">
<img src="images/11-07.png">
<img src="images/11-08.png">
<img src="images/11-09.png">
<img src="images/11-10.png">
<img src="images/11-11.png">

# 12 Creación y uso de list, set y map 18:19 

[Creación y uso de list, set y map](pdfs/12_Creación_y_uso_de_List_Set_y_Map.pdf)

## Resumen del Profesor

### 12.1 API de colecciones

Desde Java SE 2 se ofrece el tratamiento de colecciones. Actualmente tiene

* Interfaces: tipos de datos
* Implementaciones: concreciones de los diferentes interfaces.
* Algoritmos: para realizar operaciones como ordenación, búsqueda, ...

Actualmente, todas las colecciones están definidas como genéricas.

### 12.2 Tipos de colecciones

Java propone diferentes tipos de colecciones, a través de varias interfaces. Nosotros trabajaremos en esta lección con 3:

* `List`: Se trata de una estructura lineal, con posibilidad de orden y de repetidos.
* `Set`: es una colección que no soporta duplicados, y con posibilidad de orden.
* `Map`: es una estructura de tipo clave, valor, con posibilidad de orden de los elementos (por la clave)

### 12.3 Intefaz `List`

Los elementos tienen siempre una posición, y permite duplicados. También permite búsqueda e iteraciones. Las implementaciones más conocidas son `ArrayList` y `LinkedList`. Si no sabemos cual escoger, utilizaremos siempre `ArrayList`.

Para construir una instacia, desde Java SE 7 podemos usar el operador *diamond*:

```java
List<String> cars = new ArrayList<>();
```

### 12.4 Interfaz `Set`

Se trata de una colección que no puede contener repetidos. Java propone tres implementaciones: `HashSet`, `TreeSet` y `LinkedHastSet`:

* `HashSet` es la más eficiente, pero no nos asegura nada sobre el orden.
* `TreeSet` utiliza un árbol Red-Black, y ordena según el valor.
* `LinkedHashSet` es un `HashSet` ordenado por orden de inserción.

### 12.5 Interfaz `Map`

No es un subtipo de `Collection` (`List` y `Set` sí que lo son). Cada elemento tiene estructura clave, valor. La clave sirve para acceder directamente al valor. Las implementaciones son `HashMap`, `TreeMap` y `LinkedHashMap`. Las consideraciones son análogas a Set.

## Transcripción

<img src="images/12-01.png">
<img src="images/12-02.png">
<img src="images/12-03.png">
<img src="images/12-04.png">
<img src="images/12-05.png">
<img src="images/12-06.png">
<img src="images/12-07.png">
<img src="images/12-08.png">
<img src="images/12-09.png">
<img src="images/12-10.png">
<img src="images/12-11.png">
<img src="images/12-12.png">
<img src="images/12-13.png">
<img src="images/12-14.png">

# 13 Interfaces Comparable y Comparator 9:07 

[Interfaces Comparable y Comparator](pdfs/13_Interfaces_Comparable_y_Comparator.pdf)

## Resumen del Profesor

### 13.1 Introducción

Muchas operaciones entre objetos nos obligan a compararlos: buscar, ordenar, … Si bien los tipos primitivos y algunas clases ya implementan su orden (natural, lexicográfico), para nuestras clases (modelo) tenemos que especificar el orden con el que las vamos a tratar.

### 13.2 `Comparable`

`Comparable` es un interfaz propuesto por Java, y su definición es sencilla:

```java
public interface Compararable<T> {
     public int compareTo(T o);
}
```

Recibe un objeto del mismo tipo que la clase que lo implementa. El valor de retorno del método `compareTo` será:

* 0 si ambos objetos son iguales,
* un valor negativo si el objeto es menor,
* y uno positivo si es mayor.

**Nos sirve para indicar el orden principal de una clase.**

### 13.3 `Comparator`

`Comparator` también es un interfaz propuesto por Java, y su definición también es sencilla:

```java
public interface Comparator<T> {
     public int compare(T o1, T o2);
}
```

Recibe dos argumentos, y su valor de retorno es análogo al de comparable.

`Comparator` nos servirá para indicar un orden diferente al orden natural definido con `Comparable` (no es necesario haber definido un orden con `Comparable` para poder utilizar `Comparator`, aunque sí es recomendable).

## Transcripción

<img src="images/13-01.png">
<img src="images/13-02.png">
<img src="images/13-03.png">
<img src="images/13-04.png">
<img src="images/13-05.png">
<img src="images/13-06.png">

## Contenido adicional 3   

[Creación de una clase genérica](pdfs/11_Creación_de_una_clase_genérica.pdf)

[Creación y uso de list, set y map](pdfs/12_Creación_y_uso_de_List_Set_y_Map.pdf)

[Interfaces Comparable y Comparator](pdfs/13_Interfaces_Comparable_y_Comparator.pdf)
