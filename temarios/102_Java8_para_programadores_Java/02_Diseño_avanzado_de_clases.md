# 2. Diseño avanzado de clases 43m

   * Clases y métodos abstractos 9:13 
   * Código que usa final 7:22 
   * Clases internas, locales y anónimas 19:25 
   * Uso de enumeraciones 7:18 
   * Contenido adicional  4
   
## Clases y métodos abstractos 9:13 

[Clases y métodos abstractos](pdfs/07_Clases_y_métodos_abstractos.pdf)

### 7.1 `Abstract`

Es una palabra reservada, que puede usarse a nivel de método o de clase. Sirve para indicar la obligación de implementar un método o de extender una clase completa.

### 7.2 A nivel de clase

Son clases que no se pueden instanciar. Puede tener métodos con implementación y atributos, y también métodos abstractos.

```java
public abstract class ObjectoGrafico implements Transformable {

    protected int x, y;

    public void moverA(int nuevaX, int nuevaY) {
        this.x = nuevaX;
        this.y = nuevaY;
    }

    abstract public void dibujar();

    abstract public void cambiarTamanio(int factorAumento);

}
```

### 7.3 A nivel de método

Los métodos definidos como `abstract` deben estar en una clase abstracta. Definen la firma del método, pero sin implementación. Sus subclases se comprometen a implementarlo. Si no lo hacen, también deben ser abstractas. Pueden convivir con métodos normales.

### 7.4 Clases abstractas que implementan interfaces

Una clase que implementa una interfaz tiene obligación de implementar todos sus métodos. Sin embargo, una clase `abstract` puede dejar métodos sin implementación, obligando a quienes la extiendan a hacerlo.

```java
public interface Transformable {

    public void rotar();
    public void voltearHorizontal();
    public void voltearVertical();
}

public abstract class ObjectoGrafico implements Transformable {

    protected int x, y;

    public void moverA(int nuevaX, int nuevaY) {
        this.x = nuevaX;
        this.y = nuevaY;
    }

    abstract public void dibujar();

    abstract public void cambiarTamanio(int factorAumento);

}
```

## Código que usa final 7:22 

[Código que usa final](pdfs/08_Código_que_usa_final.pdf)

### 8.1 Modificador final

Se puede utilizar en diferentes contextos:

* Clases `final`
* Métodos `final`
* Variables `final`

En todos los casos, indica que de una u otra forma, el ámbito sobre el que aplica no podrá ser modificado.

### 8.2 Clases `final`

### 8.2 Clases final
Son clases que **no se pueden extender**. En una jerarquía de herencia, son el último *nodo*. Se pueden instanciar y tratar con normalidad.

### 8.3 Métodos `final`

Se definen en clases susceptibles de ser extendidas. Nos permiten indicar que un método no se va a poder sobrescribir. En la clase extendida habrá que usar, obligatoriamente, la implementación de la clase base.

### 8.4 Variables `final`
Basicamente indican que aquella variable a la que afectan no se puede modificar. Podemos diferenciar entre:

* Tipos primitivos: serán valores inmodificables, constantes. Suele usarse junto con `static`.

* Objetos: si declaramos una **referencia** como `final`, estamos diciendo que esa referencia no podrá asignarse a otro objeto. Sin embargo sí que podemos modificar el estado del objeto con sus propios métodos. Lo mismo sucedería en el caso de arrays.

## Clases internas, locales y anónimas 19:25 

[Clases internas, locales y anónimas](pdfs/09_Clases_internas_locales_y_anónimas.pdf)

### 9.1 Clases dentro de otras clases

Java permite definir clases dentro de otras clases. A estas clases se le llaman anidadas. Pueden ser de dos tipos, estáticas o no estáticas. No se trata de composición de clases, sino anidamiento. En algunos casos, pueden acceder a los atributos de la clase que le envuelve.

Las razones para su uso son varias:

* Agrupamiento lógico de clases que se utilizan en un solo lugar. Por tanto hay mayor cohesión.
* Aumento de la encapsulación.
* Código más legible y fácil de mantener.

### 9.2 Clases internas

Se llaman así a las clases anidadas no estáticas. Solo pueden existir en el marco de una instancia de la clase externa. Pueden acceder a sus miembros (de la clase externa).

Si definimos una variable miembro en la clase interna, con el mismo nombre otra de la clase externa, la interna oculta a la externa. A esto se le llama *shadowing*

### 9.3 Clases locales

Son clases que se definen dentro de un bloque, normalmente el cuerpo de un método. Sirven para afinar aun más la cohesión del código.

### 9.4 Clases anónimas

Permiten definir e instanciar una clase a la vez. Son como clases locales sin nombre. Sirven para ser usadas una vez.

Las podemos definir a partir de otra clase o de una interfaz. Podemos crearlas en el cuerpo de un método, de una clase, o como argumento de un método.

## Uso de enumeraciones 7:18 

[Uso de enumeraciones](pdfs/10_Uso_de_enumeraciones.pdf)

### 10.1 Tipos enumerados

Son un tipo de dato especial. Indica que una variable tendrá como valor uno de entre un conjunto cerrado, como por ejemplo Direccion (Norte, Sur, Este, Oeste).

```java
public enum Direccion {
   NORTE, SUR, ESTE, OESTE
}
```

En Java, los tipos enumerados son más potentes que en otros lenguajes. Para Java son un tipo de clase, que pueden incluir métodos y otros atributos. De hecho, el compilador añade métodos especiales (`values`), que incluso nos permite recorrer todas las instancias. Podemos pensar en que tenemos un conjunto cerrado de instancias de una clase.

## Contenido adicional  4   

[Clases y métodos abstractos](pdfs/07_Clases_y_métodos_abstractos.pdf)

[Código que usa final](pdfs/08_Código_que_usa_final.pdf)

[Clases internas, locales y anónimas](pdfs/09_Clases_internas_locales_y_anónimas.pdf)

[Uso de enumeraciones](pdfs/10_Uso_de_enumeraciones.pdf)
