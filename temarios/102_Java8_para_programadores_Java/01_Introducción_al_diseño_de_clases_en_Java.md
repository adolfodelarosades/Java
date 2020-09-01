# 1. Introducción al diseño de clases en Java 73m
   
   * 00 Presentación del profesor y curso 7:36 
   * 01 Implementación de la encapsulación 12:31 
   * 02 Implementación de herencia con modificadores de acceso y composición 9:55 
   * 03 Polimorfismo 10:37 
   * 04 Sobreescribir los métodos hashcode, equals y to string de la clase object 14:34 
   * 05 Uso del ámbito static para variables, métodos y clases 9:30 
   * 06 Clases singleton y clases de inmutables 9:09 
   * Contenido adicional 10
   
# 00 Presentación del profesor y curso 7:36

[Presentación](pdfs/Presentación.pdf)

## Resumen del Profesor

Conoce al profesor de Java desde 0, los requisitos y los objetivos del curso.

## Transcripción

<img src="images/00-01.png">
<img src="images/00-02.png">
<img src="images/00-03.png">
<img src="images/00-04.png">
<img src="images/00-05.png">
<img src="images/00-06.png">
<img src="images/00-07.png">
<img src="images/00-08.png">
<img src="images/00-09.png">
<img src="images/00-10.png">
<img src="images/00-11.png">
<img src="images/00-12.png">

# 01 Implementación de la encapsulación 12:31 

[Implementación de la encapsulación](pdfs/01_Implementación_de_la_encapsulación.pdf)

## Resumen del Profesor

### 1.1 Encapsulación

Los objetos conocen solamente su estructura, no la de los demás. El trato entre objetos se realiza a través de los métodos. Normalmente, los atributos de un objeto se deben consultar o editar a través de métodos.

### 1.2 Buenas prácticas.

#### 1.2.1 Para clases

* La mayoría de las clases que se crean son públicas.
* Cada fichero .java tendrá solamente una clase pública, con el mismo nombre del fichero.

#### 1.2.2 Para atributos

* La mayoría de los atributos de una clase serán privados.
* Solamente algunas constantes, o casos muy particulares, tendrán otra modificador de acceso.

#### 1.2.3 Para métodos

* Si una clase tiene atributos, seguramente tenga métodos públicos.
* Los métodos privados son interesantes para cálculos auxiliares o parciales (solo se pueden invocar desde la propia clase).

### 1.3 Tipos de clases

Aunque Java tiene solamente una forma de crear clases, los patrones de diseño nos dicen que podemos encontrar diferentes tipos de clases según su cometido:

* Modelo: representan objetos o hechos de la naturaleza: un coche, un asiento contable, los datos meteorológicos de un día. Suelen tener atributos, getters y setters, equals, hashCode, toString, …

* Servicios: implementan la lógica de negocio. Suelen tener algunos atributos, pero sobre todo métodos públicos y privados.

* Auxiliares: sirven para realizar operaciones auxiliares de cálculo o transformación de datos. Mayoritariamente, sus métodos son estáticos.

* Main: son el punto de entrada de la aplicación. La mayoría de las ocasiones, solo tienen este método, y si tienen más, suelen ser estáticos.

* Test: clases orientadas a realizar pruebas de nuestra aplicación. En Java, suelen ser test unitarios con JUnit.

* ...

## Transcripción

# 02 Implementación de herencia con modificadores de acceso y composición 9:55 

[Herencia](pdfs/02_Herencia.pdf)

## Resumen del Profesor

### 2.1 Herencia de clases

Una clase que extiende a otra hereda sus atributos y sus métodos (no constructores). Puede añadir atributos y métodos nuevos. Se trata de una asociación *es-un*, ya que la clase Hija es-un(a) (sub)tipo de la clase Base. Por ejemplo un `Coche` es-un `Vehiculo`, o un `Leon` es-un `Animal`.

Si usamos `protected` en la clase base, tendremos acceso directo a los atributos. En otro caso, tendremos que acceder vía getters/setters. ¡OJO! Los constructores no se heredan aunque sean públicos.

```java
public class Base {

   private String nombre;
   protected String apellidos;

   //...
}

public class Hija extends Base {

   public void metodo() {
      //this.nombre = "Pepe";  //Imposible acceder. Nos da error
      this.setNombre("Pepe"); //Funciona perfectamente
      this.apellidos = "Perez";
   }

   //...
}
```

### 2.2 Herencia de interfaces

También podemos establecer relaciones jerárquicas entre interfaces. Nos regimos por las mismas reglas que en el caso de las clases.

### 2.3 Asociación de composición

Normalmente, cuando representamos la estructura de un sistema, está formado por muchas clases. En este caso, no solamente importan las clases en sí, sino las asociaciones. Una de ellas es la composición. En UML, se representan de una forma especial.

Diagrama de clases

<img src="images/diagrama01.png">

Dentro de la clase Todo tendremos una referencia a la clase Parte. También es posible que la multiplicidad nos indique que debemos tener una colección (`Provincia` y `Municipio`). Normalmente hay dependencia de existencia entre la parte y el todo.

<img src="images/diagrama02.png">

## Transcripción

# 03 Polimorfismo 10:37 

[Polimorfismo](pdfs/03_Polimorfismo.pdf)

## Resumen del Profesor

### 3.1 Polimorfismo

Java nos permite crear instancias de objetos, pero que estos sean referenciados por alguna de sus clases *ancestro* o alguno de los interfaces que implementa:

```java
Rectangulo r = new Cuadrado();
```

También permite la ocultación o sobreescritura de métodos por parte de las clases derivadas.

¿Qué sucede en caso de el uso de referencias de clase base, pero instanciación de objetos derivados? Java escoge, en tiempo de ejecución, el tipo de objeto. Si ese tipo ha ocultado un método de la superclase, llama a la concreción. En otro caso, llama al método de la clase base.

```java
Cuadrado [lado=5.39897]
Area de un cuadrado
Perimetro de un cuadrado
Area de la figura: 10,797940 | Perímetro de la figura: 21,595881

Rectangulo [base=10.55045, altura=0.6183386]
Area de un rectángulo
Perímetro de un rectángulo
Area de la figura: 6,523750 | Perímetro de la figura: 22,337578
```

Esto también sucede cuando una clase implementa una interfaz que forma parte de una jerarquía de herencia:

```java
ClaseQueImplementaInterfaz c1 = new ClaseQueImplementaInterfaz();
c1.saludar("Hola Mundo");

Hija c2 = new ClaseQueImplementaInterfaz();
c2.saludar("Hola Mundo, otra vez");

Base c3 = new ClaseQueImplementaInterfaz();
c3.saludar("Hola Mundo, por tercera vez");
```

## Transcripción

# 04 Sobreescribir los métodos hashcode, equals y to string de la clase object 14:34 

[Sobreescribir los métodos hashcode, equals y to string de la clase object](pdfs/04_Equals_hashCode_y_toString.pdf)

## Resumen del Profesor

### 4.1 Herencia de `Object`

Todo objeto, de forma directa o indirecta hereda de `Object`. Esta clase tiene una serie de métodos, entre los que destacan:

* `equals`: nos permite indicar cuando dos objetos son iguales

* `hashCode`: nos devuelve un número “único” asociado a una instancia de una clase

* `toString`: nos devuelve una reperesentación del objeto como una cadena de caracteres.

### 4.2 Sobrescritura de `equals`

Con tipos primitivos, hemos usado el operador ==. ¿Qué sucede con los objetos? Primero tenemos que definir cuando dos instancias de un objeto son iguales o diferentes.

El método `equals` nos permite devolver un boolean indicando si un objeto es igual a otro. Nuestro IDE lo autogenera, junto con `hashCode`. La representación actual es muy verbosa y no aprovecha las capacidades de Java 7. La actualización está en desarrollo.

### 4.3 Sobrescritura de `hashCode`

Devuelve un número asociado a la clase. Sirve como posición de memoria en hexadecimal. Por definición, si dos objetos son iguales (equals), su *hash code* también debe serlo. Si sobrescribimos el método equals, también tenemos que sobrescribir hashCode para que se cumpla esa propiedad.

### 4.4 Sobrescritura de toString

Devuelve una representación en `String` del objeto. Por defecto, devuelve el tipo (la clase) y su `hashCode`. Lo podemos sobrescribir para que represente los valores. Dos objetos iguales deben tener la misma representación.

## Transcripción

# 05 Uso del ámbito static para variables, métodos y clases 9:30 

[Uso del ámbito static para variables, métodos y clases](pdfs/05_Uso_de_static.pdf)

## Resumen del Profesor

### 5.1 Atributos de objeto y de clase

Java nos permite crear cuantos objetos queramos de una misma clase. Estos objetos tienen una copia propia de los atributos. Sin embargo, en ocasiones, puede interesarnos tener un atributo común a todos los objetos. Estos son los atributos `static`.

Están asociados a la clase, y compartidos para todas las instancias. Pueden ser manipulados por cualquier objeto, o incluso sin crear una instancia de esa clase.

### 5.2 Métodos estáticos

Se rigen por los mismos principios de los atributos estáticos. Para invocar:

```java
Clase.metodoEstatico(...);
```

Podemos acceder a una variable estática desde un contexto estático o no estático. También podemos crear métodos estáticos como métodos de operaciones auxiliares (recordemos todos los métodos de la clase `java.util.Arrays`).

### 5.3 Constantes

Se pueden definir como `static`.

```java
static final PI = 3.141592653589793;
```

### 5.4 Clases estáticas

Este tipo de clases solamente tienen sentido cuando trabajemos con clases internas (lo haremos en capítulos posteriores). Nos permiten, entre otras cosas, agrupar código, definiendo clases que tendrán solo sentido si están envueltas por otra.

Para crear una instancia de la clase interna, si esta es estática, no necesitamos una instancia de la clase externa:

```java
public class EjemploClaseStatic {

   /**
    * @param args
    */
   public static void main(String[] args) {

      Persona p = new Persona("Pepe");        
      System.out.println(p);

   }

   public static class Persona {
       //...
   }        

   public class OtroEjemplo {

      /**
       * @param args
       */
      public static void main(String[] args) {

         EjemploClaseStatic.Persona p = new EjemploClaseStatic.Persona("Pepe");        
         System.out.println(p);

      }
   }

}
```

## Transcripción

# 06 Clases singleton y clases de inmutables 9:09 

[Clases singleton y clases de inmutables](pdfs/06_Singleton_e_inmutables.pdf)

<img src="images/singleton.png">

## Resumen del Profesor

### 6.1 Singleton

*Singleton* es uno de los patrones de diseño propuesto por *Gang of Four*(GOF), y sirve para poder tener una clase de la cual solamente querremos tener una instancia (manejadores, servicios, …).

Para implementarla, podemos seguir los siguientes pasos:

1. Definir un único constructor, como privado, para evitar instanciaciones innecesarias.
2. Obtener siempre la instancia a través de un método estático.

```java
public class MiServicioSingleton {

   //Una instancia del objeto que va a existir
   private static MiServicioSingleton instance = null;

   //Evitamos así la instanciación directa
   private MiServicioSingleton() {    }

   public static MiServicioSingleton getInstance() {
      if (instance == null)
         instance = new MiServicioSingleton();

         return instance;
   }


}
```

### 6.2 Objetos inmutables

Son objetos cuyo estado no puede ser modificado una vez se haya inicializado. No son constantes ya que estas se definen en tiempo de compilación, y los inmutables en tiempo de ejecución. Un ejemplo de clase inmutable que ya hemos utilizado es `String`.

Algunas recomendaciones para crear objetos inmutables:

1. Definir todas las propiedades como `final private`
2. No añadir métodos *setter*
3. Evitar que existiendan la clase, añadiendole el modificador `final a la definición.

## Transcripción

## Contenido adicional 10   

[Presentación](pdfs/Presentación.pdf)

[Implementación de la encapsulación](pdfs/01_Implementación_de_la_encapsulación.pdf)

[Herencia](pdfs/02_Herencia.pdf)

[Polimorfismo](pdfs/03_Polimorfismo.pdf)

[Sobreescribir los métodos hashcode, equals y to string de la clase object](pdfs/04_Equals_hashCode_y_toString.pdf)

[Uso del ámbito static para variables, métodos y clases](pdfs/05_Uso_de_static.pdf)

[Clases singleton y clases de inmutables](pdfs/06_Singleton_e_inmutables.pdf)
