# 4. Expresiones lambda e interfaces funcionales 21m

   * 14 Interfaces funcionales 8:01 
   * 15 Predicate, consumer, function y supplier 13:22 
   * Contenido adicional 2
   
# 14 Interfaces funcionales 8:01 

[Interfaces funcionales](pdfs/14_Interfaces_funcionales.pdf)

## Resumen del Profesor

### 14.1 Interfaces

Una interfaz es un *contrato* que compromete a la clase que lo implementa a dar cuerpo a una serie de métodos abstractos. Además, se pueden utilizar como referencias a la hora de crear objetos (que implementen esa interfaz, claro está):

```java
List<String> lista = new ArrayList<>();
```

Desde Java SE 8, las interfaces pueden incluir la implementación de algunos métodos, en particular, los métodos anotados con `default` y `static`.

```java
public interface Interfaz {

   public void metodo();

   default public void metodoPorDefecto() {
      System.out.println("Este es uno de los nuevos métodos por defecto");
   }

   public static void metodoEstatico() {
      System.out.println("Método estático en un interfaz");
   }

}
```

### 14.2 Interfaces funcionales

Una interfaz funcional será una interfaz que solamente tenga la definición de un método abstracto. Estrictamente hablando, puede tener varios métodos abstractos, siempre que todos menos uno sobrescriban a un método público de la clase `Object`. Además, pueden tener uno o varios métodos por defecto o estáticos.

Normalmente, son interfaces que implementamos mediante una clase anónima. Muchos de los interfaces que conocemos, como por ejemplo `Comparator`, son interfaces funcionales:

```java
Collections.sort(lista, new Comparator<String>() {

   //Ordenamos la cadena por su longitud
   @Override
   public int compare(String str1, String str2) {
      return str1.length()-str2.length();
   }

});
```

Java SE 8 incorpora también la anotación `@FunctionalInterface` que permite al compilador comprobar si una interfaz cumple con las características de ser funcional o no (Eclipse nos proporciona dicha funcionalidad *en directo*, a la par de escribir el código).

Las interfaces funcionales y las expresiones lambda están áltamente ligadas, de forma que allá donde se espere una instancia de una clase que implemente una interfaz funcional, podremos utilizar una expresión lambda.

```java
Collections.sort(lista, (str1, str2)-> str1.length()-str2.length());
```

## Transcripción

<img src="images/14-01.png">
<img src="images/14-02.png">
<img src="images/14-03.png">
<img src="images/14-04.png">
<img src="images/14-05.png">
<img src="images/14-06.png">

# 15 Predicate, consumer, function y supplier 13:22 

[Predicate, consumer, function y supplier](pdfs/15_Uso_de_interfaces_como_Predicate_Consumer_Function_y_Supplier.pdf)

## Resumen del Profesor

### 15.1 `Predicate<T>`

El método abstracto es:

```java
boolean test(T t);
```

Comprueba si se cumple o no una condición. Se utiliza mucho junto a expresiones lambada a la hora de filtrar:

```java
//...
    .filter((p) -> p.getEdad() >= 35l)
```

Se pueden componer predicados más complejos con sus métodos `and`, `or` y `negate`.

### 15.2 `Consumer<T>`
  
El método abstracto es:

```java
void accept(T t);
```

Sirve para consumir objetos. Uno de los ejemplos más claros es imprimir.

```java
//...
    .forEach(System.out::println)
```

Adicionalmente, tiene el método `andThen`, que permite componer consumidores, para encadenar una secuencia de operaciones.

### 15.3 `Function<T, R>`

El método abstracto es:

```java
R apply(T t);
```

Sirve para aplicar una transformación a un objeto. El ejemplo más claro es el mapeo de objetos en otros.

```java
//...
    .map((p) -> p.getNombre())
```

Adicionalmente, tiene otros métodos:

* `andThen`, que permite componer funciones.
* `compose`, que compone dos funciones, a la inversa de la anterior.
* `identity`, una función que siempre devuelve el argumento que recibe

### 15.4 `Supplier<T>`
  
El método abstracto es:

```java
T get();
```

Sirve para devolver un valor.

Tiene algunos interfaces *especializados* para tipos básicos:

* `IntSupplier`
* `LongSupplier`
* `DoubleSupplier`
* `BooleanSupplier`

## Transcripción

<img src="images/15-01.png">
<img src="images/15-02.png">
<img src="images/15-03.png">
<img src="images/15-04.png">
<img src="images/15-05.png">
<img src="images/15-06.png">
<img src="images/15-07.png">
<img src="images/15-08.png">
<img src="images/15-09.png">
<img src="images/15-10.png">
<img src="images/15-11.png">
<img src="images/15-12.png">
<img src="images/15-13.png">

## Contenido adicional 2   

[Interfaces funcionales](pdfs/14_Interfaces_funcionales.pdf)

[Predicate, consumer, function y supplier](pdfs/15_Uso_de_interfaces_como_Predicate_Consumer_Function_y_Supplier.pdf)
