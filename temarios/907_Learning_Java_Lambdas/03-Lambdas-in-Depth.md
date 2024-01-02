# Capítulo 3. Lambdas en profundidad

En esta sección, veremos las cosas con un poco más de detalle y hablaremos sobre algunos temas relacionados, como:

* Interfaces funcionales
* Referencias de métodos y constructores.
* Alcance y variables efectivamente finales
* Transparencia de excepción
* Las diferencias entre lambdas y closures.
* Como hemos hablado sobre cómo las lambdas no son solo azúcar sintáctico, veremos el código de bytes que producen las lambdas.

## Interfaces funcionales

Java trata lambdas como una instancia de un tipo de interfaz. Formaliza esto en algo que llama interfaces funcionales. ***Una interfaz funcional es solo una interfaz con un único método***. Java llama al método ***"método funcional"***, pero a menudo se utiliza el nombre ***"método abstracto único" o SAM***.

Todas las interfaces de método único existentes como **`Runnable`** y **`Callable`** en el JDK ahora son interfaces funcionales y las lambdas se pueden usar en cualquier lugar donde se use una interfaz de método abstracto único. De hecho, son las interfaces funcionales las que permiten lo que se llama ***target typing - escritura de destino***; Proporcionan suficiente información para que el compilador infiera argumentos y tipos de retorno.

### @FunctionalInterface

Oracle ha introducido una nueva anotación **`@FunctionalInterface`** para marcar una interfaz como tal. Básicamente es para comunicar la intención, pero también permite al compilador realizar algunas comprobaciones adicionales.

Por ejemplo, esta interfaz compila:

```java
public interface FunctionalInterfaceExample {
    // compiles ok
}
```

pero cuando indicas que debería ser una interfaz funcional agregando la nueva anotación,

```java
@FunctionalInterface // <- error here
    public interface FunctionalInterfaceExample {
      // doesn't compile
}
```

el compilador generará un error. Nos dice "Example is not a functional interface" ya que "no abstract method was found". A menudo, el IDE también dará una pista, IntelliJ dirá algo como "no target method was found". Está insinuando que dejamos de lado el método funcional. Un "single abstract method - método abstracto único" necesita un método único **`abstract`**.

Entonces, ¿qué pasa si intentamos agregar un segundo método a la interfaz?

```java
@FunctionalInterface
public interface FunctionalInterfaceExample {
    void apply();
    void illegal(); // <- error here
}
```

El compilador volverá a generar un error, esta vez con un mensaje como "multiple, non-overriding abstract methods were found". Las interfaces funcionales solo pueden tener un método.

### Extensión

¿Qué pasa con el caso de una interfaz que extiende otra interfaz?

Creemos una nueva interfaz funcional llamada **`A`** y otra llamada **`B`** que se extiende **`A`**. La interfaz **`B`** sigue siendo una interfaz funcional. Hereda el método **`apply`** de los padres como era de esperar:

```java
@FunctionalInterface
interface A {
    abstract void apply();
}

interface B extends A {
}
```
 
Si desea aclarar esto, también puede sobreescribir el método funcional del padre:

```java
@FunctionalInterface
interface A {
    abstract void apply();
}

interface B extends A {
    @Override
    abstract void apply();
}
```

Podemos verificar que funciona como una interfaz funcional si la usamos como lambda. Implementaremos un método para mostrar que se puede asignar una lambda a un tipo de A y un tipo de B a continuación. La implementación simplemente imprime "`A`" o "`B`".

```java
@FunctionalInterface
public interface A {
    void apply();
}

public interface B extends A {
    @Override
    void apply();
}

public static void main(String... args) {
   A a = () -> System.out.println("A");
   B b = () -> System.out.println("B");
}
```

Sin embargo, no puede agregar un nuevo método **`abstract`** a la interfaz de extensión (B), ya que el tipo resultante tendría dos métodos **`abstract`** y el IDE nos advertiría y el compilador generaría un error.

```java
@FunctionalInterface
public interface A {
    void apply();
}

public interface B extends A {
    void illegal();     // <- can't do this
}

public static void main(String... args) {
    A a = () -> System.out.println("A");
    B b = () -> System.out.println("B");    // <- error
}
```

En ambos casos, puedes anular los métodos **`Object`** sin causar problemas. También puede agregar métodos predeterminados (también nuevos a partir de Java 8). Como probablemente era de esperar, no tiene sentido intentar marcar una clase abstracta como una interfaz funcional.

### Otras mejoras de la interfaz

A las interfaces generalmente se les han agregado algunas características nuevas, que incluyen:

* Métodos predeterminados (métodos de extensión virtual)
* Métodos de interfaz estática
* Y un montón de nuevas interfaces funcionales en el paquete **`java.util.function`**; cosas como **`Function`** y **`Predicate`**

### Resumen

En esta sección hemos hablado de cómo cualquier interfaz con un único método es ahora una "interfaz funcional" y que el método único a menudo se denomina "método funcional" o SAM (por single abstract method).

Observamos la nueva anotación y vimos un par de ejemplos de cómo las interfaces JDK existentes se adaptan a la anotación **`Runnable`** y **`Callable`** se han adaptado a ella.

También introdujimos la idea de tipificación de destino, que es cómo el compilador puede usar la firma de un método funcional para ayudar a determinar qué lambdas se pueden usar y dónde. Le echamos un vistazo a esto un poco, ya que hablaremos de ello más adelante en la sección de inferencia de tipos.

Discutimos algunos ejemplos de interfaces funcionales, cómo el compilador y el IDE pueden ayudarnos cuando cometemos errores y tuvimos una idea de los tipos de errores que podemos encontrar. Cosas como agregar más de un método a una interfaz funcional. También vimos las excepciones a esta regla, es decir, cuando anulamos métodos **`Object`** implementamos métodos predeterminados.

Echamos un vistazo rápido a la herencia de la interfaz y cómo eso afecta las cosas y mencionamos algunas de las otras mejoras de la interfaz que cubriremos más adelante.

Un punto importante a destacar aquí es la idea de que en cualquier lugar donde se use una interfaz funcional, ahora se puede usar una lambda. Lambdas se pueden utilizar en lugar de implementaciones anónimas de la interfaz funcional. Usar una lambda en lugar de la clase anónima puede parecer azúcar sintáctico, pero en realidad son bastante diferentes. Consulte la sección Funciones versus clases para obtener más detalles.

## Mejoras en la inferencia de tipos

Ha habido varias mejoras en la inferencia de tipos en Java moderno. Para poder admitir lambdas, se ha mejorado la forma en que el compilador infiere las cosas para utilizar ampliamente la ***target typing - escritura de destino***. Esta y otras mejoras con respecto a la inferencia de Java 7 se gestionaron bajo la Open **JDK Enhancement Proposal (JEP)** 101.

Antes de entrar en eso, recapitulemos los conceptos básicos.

***La inferencia de tipos se refiere a la capacidad de un lenguaje de programación de deducir automáticamente el tipo de una expresión.***

Los lenguajes tipados estáticamente conocen los tipos de cosas en tiempo de compilación. Los lenguajes escritos dinámicamente conocen los tipos en tiempo de ejecución. Un lenguaje de tipo estático puede usar inferencia de tipos y eliminar información de tipos en el código fuente y usar el compilador para descubrir qué falta.

<img width="612" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/581e22da-cd0f-4098-bfe1-c693275f6db5">

Entonces, esto significa que la inferencia de tipos puede ser utilizada por lenguajes de tipado estático (como Scala) para "parecer" lenguajes dinámicos (como JavaScript). Al menos a nivel de código fuente.

Aquí hay un ejemplo de una línea de código en Scala:

```scala
val name = "Henry"
```
No es necesario decirle explícitamente al compilador que el valor es una cadena. Se da cuenta. Podrías escribirlo explícitamente así,

```scala
val name : String = "Henry"
```

pero no es necesario.

Además, Scala también intenta determinar cuándo ha terminado una declaración o expresión basándose en su ***árbol de sintaxis abstracta - abstract syntax tree ( AST )***. Muy a menudo, ni siquiera es necesario agregar un punto y coma final. 

### Inferencia de tipos de Java

La inferencia de tipos es un tema bastante amplio, Java no admite el tipo de inferencia. Acabo de hablar de, al menos, cosas como eliminar las anotaciones de tipo para las variables. Tenemos que mantener eso en:

```java
String name = "Henry"; // <- we can't drop the String like Scala
```

Entonces Java no admite la inferencia de tipos en el sentido más amplio. No puede adivinar todo como algunos lenguajes. La inferencia de tipos para Java generalmente se refiere a la forma en que el compilador puede calcular tipos para genéricos. Java 7 mejoró esto cuando introdujo el operador diamante (**`<>`**), pero todavía existen muchas limitaciones en lo que Java puede entender.

El compilador de Java se creó con borrado de tipos; elimina activamente la información de tipo durante la compilación. Debido al borrado de tipos, **`List<String>`** se vuelve **`List<Object>`** después de la compilación.

Por razones históricas, cuando se introdujeron los genéricos en Java 5, los desarrolladores no pudieron revertir fácilmente la decisión de utilizar el borrado. Java se quedó con la necesidad de entender qué tipos sustituir por un tipo genérico determinado, pero no tenía información sobre cómo hacerlo porque todo había sido borrado. La inferencia de tipos fue la solución.

Todos los valores genéricos son realmente de tipo **`Object`** detrás de escena, pero al utilizar la inferencia de tipos, el compilador puede verificar que todos los usos del código fuente sean consistentes con lo que cree que debería ser el genérico. En tiempo de ejecución, todo se transmitirá como instancias de **`Object`** casting apropiado detrás de escena. La inferencia de tipos simplemente permite al compilador verificar que las conversiones sean válidas con anticipación.

Entonces, la inferencia de tipos consiste en adivinar los tipos; el soporte de Java para las inferencias de tipos debía mejorarse de varias maneras con Java 8:

1. Escritura de objetivos para lambdas.

y el uso de tipificación de objetivos generalizada para:

1. Agregue soporte para la inferencia de tipos de parámetros en llamadas a métodos.
2. Agregue soporte para la inferencia de tipos de parámetros en llamadas encadenadas.

Echemos un vistazo a los problemas actuales y cómo los aborda el Java moderno.

### Target-typing para lambdas

Las mejoras generales a la inferencia de tipos en Java moderno significan que las lambdas pueden inferir sus parámetros de tipo; entonces en lugar de usar:

```java
(Integer x, Integer y) -> x + y;
```

puedes eliminar la anotación de tipo **`Integer`** y usar lo siguiente en su lugar:

```java
(x, y) -> x + y;
```

Esto se debe a que la interfaz funcional describe los tipos y le brinda al compilador toda la información que necesita.

Por ejemplo, si tomamos una interfaz funcional de ejemplo.

```java
@FunctionalInterface
interface Calculation {
    Integer apply(Integer x, Integer y);
}
```

Cuando se utiliza una lambda en lugar de la interfaz, lo primero que hace el compilador es determinar el tipo de destino de la lambda. Entonces, si creamos un método **`calculate`** que toma la interfaz y dos números enteros.

```java
static Integer calculate(Calculation operation, Integer x, Integer y) { 
    return operation.apply(x, y);
}
```

y luego crea dos lambdas; una función de suma y resta

```java
Calculation addition = (x, y) -> x + y;
Calculation subtraction = (x, y) -> x - y;
```

y usarlos así:

```java
calculate(addition, 2, 2);
calculate(subtraction, 5, calculate(addition, 3, 2));
```

El compilador entiende que la suma y resta lambdas tienen un tipo de destino de Cálculo (es la única "forma" que se ajustará a la firma del método de calcular). Luego puede usar la firma del método para inferir los tipos de parámetros de lambda. Sólo hay un método en la interfaz, por lo que no hay ambigüedad, los tipos de argumentos son obviamente **`Integer`**.

Vamos a ver muchos ejemplos de target typing - tipificación de destino, así que por ahora solo tenga en cuenta que el mecanismo que utiliza Java para lograr gran parte de la bondad lambda se basa en mejoras en la inferencia de tipos y esta idea de un tipo de destino.

#### Escriba parámetros en llamadas a métodos

Había algunas situaciones antes de Java 8 en las que el compilador no podía inferir tipos. Uno de ellos fue al llamar a métodos con parámetros de tipo genérico como argumentos.

Por ejemplo, la clase **`Collections`** tiene un método generado para producir una lista vacía. Se parece a esto:

```java
public static final <T> List<T> emptyList() { ... }
```

En Java 7 esto compila:

```java
List<String> names = Collections.emptyList(); // compiles in Java 7
```

ya que el compilador de Java 7 puede determinar que el genérico necesario para el método **`emptyList`** es de tipo **`String`**. Sin embargo, lo que tiene problemas es si el resultado de un método genérico se pasa como parámetro a otra llamada a otro método.

Entonces, si tuviéramos un método para procesar una lista que se vea así:

```java
static void processNames(List<String> names) {
    System.out.println("hello " + name);
}
```

y luego llámalo con el método de lista vacía.

```java
processNames(Collections.emptyList()); // doesn't compile in Java 7
```

no se compilará porque el tipo genérico del parámetro se ha borrado **`Object`**. Realmente se parece a esto.

```java
processNames(Collections.<Object>emptyList names);
```

Esto no coincide con el método **`processList`**.

```java
processNames(Collections.<String>emptyList names);
```

Por lo tanto, no se compilará hasta que le demos una pista adicional usando un "ype witness - testigo de tipo" explícito.

```java
processNames(Collections.<String>emptyList());   // compiles in Java 7
```

Ahora el compilador sabe lo suficiente sobre qué tipo genérico se pasa al método.

Las mejoras en Java 8 incluyen un mejor soporte para esto, por lo que, en términos generales, donde hubiera necesitado un testigo de tipo, ya no lo necesita.

¡Nuestro ejemplo de llamar a **`processNames`** ahora compila!

```java
processNames(Collections.emptyList());           // compiles in Java 8
```

#### Escriba parámetros en llamadas a métodos encadenados

Otro problema común con la inferencia de tipos es cuando los métodos están encadenados. Supongamos que tenemos una clase **`List`**:

```java
static class List<E> {

    static <T> List<T> emptyList() {
        return new List<T>();
    }

    List<E> add(E e) {
        // add element
        return this;
    }
}
```

y queremos encadenar una llamada para agregar un elemento al método creando una lista vacía. El borrado de tipos vuelve a asomar la cabeza; el tipo se borra y, por lo tanto, no se puede conocer mediante el siguiente método de la cadena. No compila.

```java
List<String> list = List.emptyList().add(":(");
```

Esto debía solucionarse en Java 8, pero desafortunadamente se eliminó. Entonces, al menos por ahora, aún necesitarás ofrecer explícitamente un tipo al compilador; Aún necesitarás un type witness - testigo tipo.

```java
List<String> list = List.<String>emptyList().add(":(");
```

## Referencias de métodos
AQUIIIIIII
Mencioné anteriormente que las referencias a métodos son como atajos a lambdas. Son una forma compacta y conveniente de señalar un método y permitir que ese método se use en cualquier lugar donde se usaría una lambda.

Cuando crea una lambda, crea una función anónima y proporciona el cuerpo del método. Cuando utiliza una referencia de método como lambda, en realidad apunta a un método con nombre que ya existe; ya tiene cuerpo.

Puede considerarlos como la transformación de un método normal en una interfaz funcional.

La sintaxis básica se ve así:

```java
Class::method
```

o, un ejemplo más concreto:

```java
String::valueOf
```

La parte que precede a los dos puntos es la referencia de destino y después, el nombre del método. Entonces, en este caso, nos dirigimos a la Stringclase y buscamos un método llamado valueOf; Nos referimos al staticmétodo de String.

```java
public static String valueOf(Object obj) { ... }
```

Los dos puntos dobles se llaman delimitador . Cuando lo usamos, no invocamos el método, solo hacemos referencia a él. Así que recuerda no agregar corchetes al final.

```java
String::valueOf(); // <-- error
```

No puede invocar referencias de métodos directamente, solo se pueden usar en lugar de una lambda. Entonces, en cualquier lugar donde se use una lambda, puede usar una referencia de método.

### Ejemplo

Esta declaración por sí sola no se compilará.

```java
public static void main(String... args) {
    String::valueOf;
}
```

Esto se debe a que la referencia del método no se puede transformar en una lambda ya que no hay contexto para que el compilador infiera qué tipo de lambda crear.

Sabemos que esta referencia equivale a

```java
(x) -> String.valueOf(x)
```

pero el compilador aún no lo sabe. Aunque puede decir algunas cosas. Sabe que, como lambda, el valor de retorno debe ser de tipo Stringporque todos los métodos llamados valueOfdevuelven Stringuna cadena. Pero no tiene idea de qué argumento ofrecer. Necesitamos darle un poco de ayuda y darle más contexto.

Crearemos una interfaz funcional llamada Conversionque toma un número entero y devuelve una cadena. Este será el tipo de destino de nuestra lambda.

```java
@FunctionalInterface
interface Conversion {
    String convert(Integer number);
}
```

A continuación, necesitamos crear un escenario en el que usemos esto como lambda. Entonces creamos un pequeño método para tomar una interfaz funcional y aplicarle un número entero.

```java
public static String convert(Integer number, Conversion function) {
    return function.convert(number);
}
```

Ahora, aquí está la cuestión. Acabamos de darle al compilador suficiente información para transformar una referencia de método en la lambda equivalente.

Cuando llamamos a convertun método, podemos hacerlo pasando una lambda.

```java
convert(100, (number) -> String.valueOf(number));
```

Y podemos reemplazar la lambda con una referencia al valueOfmétodo. El compilador ahora sabe que necesitamos una lambda que devuelva una cadena y tome un número entero. Ahora sabe que el valueOfmétodo "se ajusta" y puede sustituir el argumento del número entero.

```java
convert(100, String::valueOf);
```

Otra forma de darle al compilador la información que necesita es simplemente asignar la referencia a un tipo.

```java
Conversion b = (number) -> String.valueOf(number);
```

y como referencia del método

```java
Conversion a = String::valueOf;
```

las "formas" encajan, por lo que se pueden asignar.

Curiosamente, podemos asignar la misma lambda a cualquier interfaz que requiera la misma "forma". Por ejemplo, si tenemos otra interfaz funcional con la misma "forma",

Aquí, Exampledevuelve a Stringy toma an Objectpara que tenga la misma forma de firma que valueOf.

```java
interface Example {
    String theNameIsUnimportant(Object object);
}
```

aún podemos asignarle la referencia del método (o lambda).

```java
Example a = String::valueOf;
```

### Tipos de referencia de métodos

Hay cuatro tipos de referencia de método:

* Referencias de constructores
* Referencias de métodos estáticos
* Y dos tipos de referencias a métodos de instancia.

Los dos últimos son un poco confusos. La primera es una referencia de método de un objeto particular y la segunda es una referencia de método de un objeto arbitrario pero de un tipo particular. La diferencia está en cómo desea utilizar el método y si tiene la instancia con anticipación o no.

Entonces, en primer lugar, echemos un vistazo a las referencias del constructor.

### Constructor reference - Referencia del constructor

La sintaxis básica se ve así:

```java
String::new
```

Un tipo de destino seguido de dos puntos y luego la newpalabra clave. Creará una lambda que llamará al constructor de argumento cero de la Stringclase.

Es equivalente a esta lambda

```java
() -> new String()
```

Recuerde que las referencias a métodos nunca tienen paréntesis; no están invocando métodos, solo hacen referencia a uno. Este ejemplo hace referencia al constructor de la Stringclase pero no crea una instancia de una cadena.

Echemos un vistazo a cómo podríamos usar realmente una referencia de constructor.

Si creamos una lista de objetos, es posible que queramos completar esa lista, digamos diez elementos. Entonces podríamos crear un bucle y agregar un nuevo objeto diez veces.

```java
public void usage() {
    List<Object> list = new ArrayList<>();
    for (int i = 0; i < 10; i++) {
        list.add(new Object());
  }
}
```

pero si queremos poder reutilizar esa función de inicialización, podríamos extraer el código a un nuevo método llamado initialisey luego usar una fábrica para crear el objeto.

```java
public void usage() {
    List<Object> list = new ArrayList<>();
    initialise(list, ...);
}

private void initialise(List<Object> list, Factory<Object> factory){
    for (int i = 0; i < 10; i++) {
        list.add(factory.create());
    }
 }
```

La Factoryclase es solo una interfaz funcional con un método llamado createque devuelve algún objeto. Luego podemos agregar el objeto que creó a la lista. Debido a que es una interfaz funcional, podemos usar una lambda para implementar la fábrica para inicializar la lista:

```java
public void usage() {
    List<Object> list = new ArrayList<>();
    initialise(list, () -> new Object());
}
```

O podríamos intercambiar una referencia de constructor.

```java
public void usage() {
    List<Object> list = new ArrayList<>();
    initialise(list, Object::new);
}
```

Hay un par de cosas más que podríamos hacer aquí. Si agregamos algunos genéricos al initialisemétodo podemos reutilizarlo al inicializar listas de cualquier tipo. Por ejemplo, podemos regresar y cambiar el tipo de lista Stringy usar una referencia de constructor para inicializarla.

```java
public void usage() {
    List<String> list = new ArrayList<>();
    initialise(list, String::new);
}

private <T> void initialise(List<T> list, Factory<T> factory) {
    for (int i = 0; i < 10; i++) {
        list.add(factory.create());
    }
}
```

Hemos visto cómo funciona para constructores sin argumentos, pero ¿qué pasa en el caso en que las clases tienen constructores con múltiples argumentos?

Cuando hay varios constructores, se utiliza la misma sintaxis, pero el compilador determina qué constructor sería el mejor. Lo hace basándose en el tipo de destino e infiriendo interfaces funcionales que puede utilizar para crear ese tipo.

Tomemos el ejemplo de una Personclase, se ve así y puedes ver que el constructor toma varios argumentos.

```java
class Person {
    public Person(String forename, String surname, LocalDate    
    birthday, Sex gender, String emailAddress, int age) {
      // ...
    }
}
```

Volviendo a nuestro ejemplo anterior y observando el initialisemétodo de propósito general, podríamos usar una lambda como esta:

```java
initialise(people, () -> new Person(forename, surname, birthday, gender, email, age));
```

pero para poder usar una referencia de constructor, necesitaríamos una lambda con argumentos variables y se vería así:

```java
(a, b, c, d, e, f) -> new Person(a, b, c, d, e, f);
```

pero esto no se traduce directamente en una referencia de constructor. Si intentáramos usar

```java
Person::new
```

no se compilará porque no sabe nada sobre los parámetros. Si intenta compilarlo, el error dice que ha creado una referencia de constructor no válida que no se puede aplicar a los tipos dados; no encontró argumentos.

En cambio, tenemos que introducir alguna dirección indirecta para darle al compilador suficiente información para encontrar un constructor apropiado. Podemos crear algo que pueda usarse como una interfaz funcional y que tenga los tipos correctos para insertarse en el constructor apropiado.

Creemos una nueva interfaz funcional llamada PersonFactory.

```java
@FunctionalInterface
interface PersonFactory {
    Person create(String forename, String surname, LocalDate 
    birthday, Sex gender, String emailAddress, int age);
}
```

Aquí, los argumentos de PersonFactorycoinciden con el constructor disponible en Person. Mágicamente, esto significa que podemos volver atrás y usarlo con una referencia de constructor de Person.

```java
public void example() {
    List<Person> list = new ArrayList<>();
    PersonFactory factory = Person::new;
    // ...
}
```

Observe que estoy usando la referencia del constructor de Person. Lo que hay que tener en cuenta aquí es que se puede asignar una referencia de constructor a una interfaz funcional de destino aunque todavía no conozcamos los argumentos.

Puede parecer un poco extraño que el tipo de referencia del método sea PersonFactoryy no Person. Esta información adicional sobre el tipo de destino ayuda al compilador a saber que debe pasar PersonFactorypara crear un archivo Person. Con esta sugerencia adicional, el compilador puede crear una lambda basada en la interfaz de fábrica que luego creará un archivo Person.

Al escribirlo a mano, el compilador generaría esto.

```java
public void example() {
    PersonFactory factory = (a, b, c, d, e, f) -> new Person(a, b,   
    c, d, e, f);
}
```

que podría usarse más adelante así:

```java
public void example() {
    PersonFactory factory = (a, b, c, d, e, f) -> new Person(a, b,  
    c, d, e, f);
    Person person = factory.create(forename, surname, birthday,
                                gender, email, age);
}
```

Afortunadamente, el compilador puede hacer esto por nosotros una vez que hayamos introducido la dirección indirecta.

Entiende cuál es el tipo de destino a usar PersonFactoryy comprende que su abstractmétodo único se puede usar en lugar de un constructor. Es como un proceso de dos pasos, en primer lugar, determinar que el abstractmétodo tiene la misma lista de argumentos que un constructor y que devuelve el tipo correcto, luego aplicarlo con la nueva sintaxis de dos puntos y dos puntos.

Para finalizar el ejemplo, necesitamos modificar nuestro initialisemétodo para agregar la información de tipo (reemplazar los genéricos), agregar parámetros para representar los detalles de la persona y, de hecho, invocar la fábrica.

```java
private void initialise(List<Person> list, PersonFactory factory, 
                       String forename, String surname,                           
                       LocalDate birthday, Sex gender,
                       String emailAddress, int age) {
                         for (int i = 0; i < 10; i++) {
                           list.add(factory.create(forename,  
                           surname, birthday, gender,        
                           emailAddress, age));
                         }
                       }
```

y luego podemos usarlo así:

```java
public void example() {
    List<Person> list = new ArrayList<>();
    PersonFactory factory = Person::new;
    initialise(people, factory, a, b, c, d, e, f);
}
```

o en línea, así:

```java
public void example() {
    List<Person> list = new ArrayList<>();
    initialise(people, Person::new, a, b, c, d, e, f);
}
```

### Static method reference - Referencia del método estático

Una referencia de método puede apuntar directamente a un método estático. Por ejemplo,

```java
String::valueOf
```

Esta vez, el lado izquierdo se refiere al tipo donde valueOfse puede encontrar un método estático, en este caso. Es equivalente a esta lambda

```java
x -> String.valueOf(x))
```

Un ejemplo más extendido sería cuando ordenamos una colección usando una referencia a un método estático en la clase Comparators.

```java
Collections.sort(Arrays.asList(5, 12, 4), Comparators::ascending);

// equivalent to
Collections.sort(Arrays.asList(5, 12, 4), (a, b) -> Comparators.ascending(a, b));
```

donde, el método estático ascendingpodría definirse así:

```java
public static class Comparators {
    public static Integer ascending(Integer first, Integer second)   
    {
        return first.compareTo(second);
     }
}
```

### Instance method reference of particular object (in this case, a closure) - Referencia del método de instancia de un objeto particular (en este caso, un cierre)

A continuación se muestra un ejemplo de una referencia de método de instancia de una instancia específica:

```java
x::toString
```

Es xun caso específico al que queremos llegar. Su equivalente lambda se ve así:

```java
() -> x.toString()
```

La capacidad de hacer referencia al método de una instancia específica también nos brinda una manera conveniente de convertir entre diferentes tipos de interfaces funcionales. Por ejemplo:

```java
Callable<String> c = () -> "Hello";
```

El método funcional de Callable es call. Cuando se invoque, la lambda regresará "Hello".

Si tenemos otra interfaz funcional, Factorypodemos convertirla Callableusando una referencia de método.

```java
Factory<String> f = c::call;
```

Podríamos haber recreado la lambda, pero este truco es una forma útil de reutilizar lambda predefinida. Asígnalos a variables y reutilízalos para evitar duplicaciones.

Aquí hay un ejemplo de su uso:

```java
public void example() {
    String x = "hello";
    function(x::toString);
}
```

Este es un ejemplo en el que la referencia del método utiliza un cierre. Crea una lambda que llamará al toStringmétodo en la instancia x.

La firma e implementación de la función anterior se ve así:

```java
public static String function(Supplier<String> supplier) {
    return supplier.get();
}
```

La Supplier interfaz es una interfaz funcional que se ve así:

```java
@FunctionalInterface
public interface Supplier<T> {
  T get();
}
```

Cuando se usa en nuestra función, proporciona un valor de cadena (a través de la llamada a get) y la única manera de hacerlo es si el valor se le ha proporcionado en la construcción. Es equivalente a:

```java
public void example() {
  String x = "";
  function(() -> x.toString());
}
```

Observe aquí que la lambda no tiene argumentos (usa el símbolo de "hamburguesa"). Esto muestra que el valor de xno está disponible en el alcance local de lambda y, por lo tanto, solo puede estar disponible desde fuera de su alcance. Es un cierre porque debe cerrarse x(capturará ) x .

Si está interesado en ver el equivalente de clase anónimo y escrito a mano, se verá así. Observe nuevamente cómo xse debe pasar:

```java
public void example() {
    String x = "";
    function(new Supplier<String>() {
        @Override
        public String get() {
            return x.toString(); // <- closes over 'x'
        }
    });
}
```

Los tres son equivalentes. Compare esto con la variación lambda de una referencia de método de instancia donde no tiene su argumento pasado explícitamente desde un ámbito externo.

### Instance method reference of a arbitrary object whose instance is supplied later (lambda) - Referencia del método de instancia de un objeto arbitrario cuya instancia se proporciona más adelante (lambda)

El último caso es para una referencia de método que apunta a un objeto arbitrario al que se hace referencia por su tipo:

```java
Object::toString
```

Entonces, en este caso, aunque parece que el lado izquierdo apunta a una clase (como la staticreferencia del método), en realidad apunta a una instancia. El toStringmétodo es un método de instancia Object, no un staticmétodo. La razón por la que es posible que no utilice la sintaxis del método de instancia normal es porque es posible que aún no tenga una instancia a la que hacer referencia.

Entonces, antes, cuando llamamos xdos puntos dos puntos toString, conocemos el valor de x. Hay algunas situaciones en las que no tienes un valor de xy en estos casos, aún puedes pasar una referencia al método pero proporcionar un valor más adelante usando esta sintaxis.

Por ejemplo, el equivalente lambda no tiene un valor enlazado para x.

```java
(x) -> x.toString()
```

La diferencia entre los dos tipos de referencia de métodos de instancia es básicamente académica. A veces, necesitará pasar algo, otras veces, el uso de lambda se lo proporcionará.

El ejemplo es similar a la referencia del método habitual; solo llama al toStringmétodo de una cadena esta vez, la cadena se suministra a la función que utiliza lambda y no se pasa desde un ámbito externo.

```java
public void lambdaExample() {
    function("value", String::toString);
}
```

Parece que la Stringparte hace referencia a una clase, pero en realidad hace referencia a una instancia. Es confuso, lo sé, pero para ver las cosas más claramente, necesitamos ver la función que utiliza lambda. Se parece a esto.

```java
public static String function(String value, Function<String, String> function) {
    return function.apply(value);
}
```

Entonces, el valor de la cadena se pasa directamente a la función, se vería así como una lambda completamente calificada.

```java
public void lambdaExample() {
    function("value", x -> x.toString());
}
```

qué atajo puede tener Java para que se vea String::toString; dice "proporcionar la instancia del objeto" en tiempo de ejecución.

Si lo expandes completamente a una interfaz anónima, se ve así. El xparámetro se pone a disposición y no se cierra. Por lo tanto, es una lambda en lugar de un cierre.

```java
public void lambdaExample() {
    function("value", new Function<String, String>() {
      @Override
      // takes the argument as a parameter, doesn't need to close 
      over it
      public String apply(String x) {
        return x.toString();
      }
    });
}
```

### Resumen

Oracle describe los cuatro tipos de referencia de métodos ( http://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html ) de la siguiente manera:

<img width="1082" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/9c23f22d-24c2-4a92-98ba-907bc407e8ed">

Pero las descripciones de los métodos de instancia son simplemente confusas. ¿Qué diablos es un método de instancia de un objeto arbitrario de un tipo particular? ¿ No son todos los objetos de un tipo particular? ¿Por qué es importante que el objeto sea arbitrario ?

Prefiero pensar en el primero como un método de instancia de un objeto específico conocido de antemano y en el segundo como un método de instancia de un objeto arbitrario que se proporcionará más adelante. Curiosamente, esto significa que el primero es un cierre y el segundo es una lambda . Uno está atado y el otro desatado . La distinción entre una referencia de método que cierra algo (un cierre) y otra que no (una lambda) puede ser un poco académica, pero al menos es una definición más formal que la inútil descripción de Oracle.

<img width="847" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/424857d7-1432-4927-8120-2360c7956402">

o como lambdas equivalentes:

<img width="858" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/7aa4cf36-47bd-4115-9ba6-f8f447cf0a7a">

Tenga en cuenta que la sintaxis de una staticreferencia de método es muy similar a una referencia a un método de instancia de una clase. El compilador determina cuál usar revisando cada método estático aplicable y cada método de instancia aplicable. Si encontrara una coincidencia para ambos, el resultado sería un error de compilación.

Puedes pensar en todo como una transformación de una referencia de método a una lambda. El compilador proporciona la función de transformación que toma una referencia de método y un tipo de destino y puede derivar una lambda.

## Scoping

La buena noticia con las lambdas es que no introducen ningún alcance nuevo. El uso de variables dentro de una lambda se referirá a las variables que residen en el entorno circundante.

Esto es lo que se llama **lexical scoping - alcance léxico**. Significa que las lambdas no introducen ningún nuevo nivel de alcance; Puede acceder directamente a campos, métodos y variables desde el ámbito adjunto. También es el caso de las palabras clave **`this`** y **`super`**. Por lo tanto, no tenemos que preocuparnos por la loca sintaxis de clases anidadas para resolver el alcance.

Echemos un vistazo a un ejemplo. Tenemos una clase de ejemplo aquí, con una variable miembro **`i`** establecida en el valor de **`5`**.

```java
public static class Example {
    int i = 5;

    public Integer example() {
        Supplier<Integer> function = () -> i * 2;
        return function.get();
    }
}
```

En el método **`example`**, una lambda usa una variable llamada **`i`** y la multiplica por dos.

Debido a que las lambdas tienen un alcance léxico, **`i`** simplemente se refieren a la variable de las clases adjuntas. Su valor en tiempo de ejecución será **`5`**. El uso de esto lleva al punto; esto dentro de una lambda es lo mismo que sin ella.

```java
public static class Example {
    int i = 5;
    public Integer example() {
        Supplier<Integer> function = () -> this.i * 2;
        return function.get();
    }
}
```

En el método **`anotherExample`** siguiente, se utiliza un parámetro de método que también se llama **`i`**. Las reglas habituales de sombreado(*shadowing*) entran en vigor aquí y **`i`** se referirán al parámetro del método y no a la variable miembro de la clase. La variable de método *oculta* la variable de clase. Su valor será lo que se pase al método.

```java
public static class Example {
    int i = 5;

    public Integer anotherExample(int i) {
        Supplier<Integer> function = () -> i * 2;
        return function.get();
    }
}
```

Si desea hacer referencia a la variable de clase **`i`** y no al parámetro **`i`** dentro del cuerpo, puede hacer que la variable sea explícita con esto. Por ejemplo, **`Supplier<Integer> function = () -> i * 2;`**.

El siguiente ejemplo tiene una variable de ámbito local definida dentro del método **`yetAnotherExample`**. Recuerde que las lambdas usan su alcance adjunto como propio, por lo que en este caso, **`i`** dentro de la lambda se refiere a la variable del método; **`i`** será **`15`** y no **`5`**.

```java
public static class Example {
    int i = 5;

    public Integer yetAnotherExample() {
        int i = 15;
        Supplier<Integer> function = () -> i * 2;
        return function.get();
    }
}
```

Si desea ver esto usted mismo, puede utilizar un método como el siguiente para imprimir los valores:

```java
public static void main(String... args) {
    Example scoping = new Example();
    System.out.println("class scope        = " +    
    scoping.example());
    System.out.println("method param scope = " +  
    scoping.anotherExample(10));
    System.out.println("method scope       = " +   
    scoping.yetAnotherExample());
}
```

La salida se vería así:

```sh
class scope        = 10
method param scope = 20
method scope       = 30
```

Entonces, el primer método imprime **`10`**; 5 de la variable de clase multiplicada por dos. El segundo método imprime **`20`** cuando el valor del parámetro era 10 y se multiplicó por dos y el método final imprime **`30`** cuando la variable del método local se configuró en 15 y nuevamente se multiplicó por dos.

El alcance léxico significa ceder al entorno circundante. Cada ejemplo tenía un entorno o alcance diferente. Viste una variable definida como miembro de una clase, un parámetro de método y localmente desde dentro de un método. En todos los casos, lambda se comportó de manera consistente y hizo referencia a la variable desde estos ámbitos adjuntos.

El alcance de Lambda debería ser intuitivo si ya está familiarizado con el alcance básico de Java; realmente no hay nada nuevo aquí.

### Effectively final - Efectivamente final

En Java 7, cualquier variable pasada a una instancia de clase anónima debería ser final.

Esto se debe a que el compilador en realidad copia todo el contexto o entorno que necesita en la instancia de la clase anónima. Si esos valores cambiaran, podrían ocurrir efectos secundarios inesperados. Entonces Java insiste en que la variable sea final para garantizar que no cambie y que la clase interna pueda operar con ellas de forma segura. Por seguridad me refiero a sin condiciones de carrera ni problemas de visibilidad entre hilos.

Echemos un vistazo a un ejemplo. Para empezar, usaremos Java 7 y crearemos un método llamado **`filter`** que toma una lista de personas y un predicado. Crearemos una lista temporal para contener las coincidencias que encontremos y luego enumeraremos cada elemento probando para ver si el predicado es verdadero para cada persona. Si la prueba es positiva, los agregaremos a la lista temporal antes de devolver todas las coincidencias.

```java
// java 7
private List<Person> filter(List<Person> people, Predicate<Person> predicate) {
    ArrayList<Person> matches = new ArrayList<>();
    for (Person person : people)
        if (predicate.test(person))
            matches.add(person);
    return matches;
}
```

Luego crearemos un método que utilice esto para encontrar todas las personas en una lista que sean elegibles para la jubilación. Establecemos una variable de edad de jubilación y luego llamamos al método **`filter`** con una lista arbitraria de personas y una nueva instancia anónima de una interfaz **`Predicate`**.

Implementaremos esto para que sea verdadero si la edad de una persona es mayor o igual a la variable de edad de jubilación.

```java
public void findRetirees() {
     int retirementAge = 55;
     List<Person> retirees = filter(allPeople, new 
     Predicate<Person>   
     () {
         @Override
         public boolean test(Person person) {
             return person.getAge() >= retirementAge; // <-- 
             compilation error
         }
     });
 }
```

Si intenta compilar esto, obtendrá un error del compilador al acceder a la variable. Esto se debe a que la variable no es definitiva. Necesitaríamos agregar **`final`** para compilarlo.

```java
final int retirementAge = 55;
```

<hr>

**NOTA**

Pasar el entorno a una clase interna anónima como esta es un ejemplo de closure. El medio ambiente es aquello sobre lo que "closes" un closure; tiene que capturar las variables que necesita para hacer su trabajo. El compilador de Java logra esto usando el truco de copiar en lugar de intentar administrar múltiples cambios en la misma variable. En el contexto de los closures, esto se llama ***variable capture - captura de variables***. 

Java 8 introdujo la idea de "effectively final - efectivamente final", lo que significa que si el compilador puede determinar que una variable en particular nunca cambia, se puede usar donde alguna vez se hubiera usado una variable final. Lo interpreta como "efectivamente" definitivo.

En nuestro ejemplo, si cambiamos a Java 8 y eliminamos la palabra clave **`final`**. Las cosas todavía se compilan. No es necesario hacer que la variable sea final. Java sabe que la variable no cambia, por lo que la hace efectivamente final.

```java
int retirementAge = 55;
```

Por supuesto, aún se compila si lo hicieras **`final`**.

Pero ¿qué tal si intentamos modificar la variable después de haberla inicializado?

```java
int retirementAge = 55;
// ...
retirementAge = 65;
```

El compilador detecta el cambio y ya no puede tratar la variable como effectively final. Recibimos el error de compilación original pidiéndonos que lo hagamos definitivo. Por el contrario, si agregar la palabra clave **`final`** a una declaración de variable no causa un error del compilador, entonces la variable es efectivamente final.

He estado demostrando el punto aquí con ejemplos de clases anónimas porque la idea de effectively final no es algo específico de lambdas. Por supuesto, es aplicable a lambdas. Puede convertir esta clase anónima anterior en una lambda y nada cambia. Todavía no es necesario que la variable sea final.

### Circumventing final - Eludiendo la final

Aún puede sortear la red de seguridad pasando objetos o matrices finales y luego cambiar sus partes internas en su lambda.

Por ejemplo, tomando nuestra lista de personas, digamos que queremos sumar todas sus edades. Podríamos crear un método para realizar un bucle y sumar así:

```java
private static int sumAllAges(List<Person> people) {
    int sum = 0;
    for (Person person : people) {
        sum += person.getAge();
    }
    return sum;
}
```

donde el recuento de la suma se mantiene a medida que se enumera la lista. Como alternativa, podríamos intentar abstraer el comportamiento del bucle y pasar una función para aplicarla a cada elemento. Como esto:

```java
public final static Integer forEach(List<Person> people, Function<Integer, Integer> function) {
  Integer result = null;
  for (Person t : people) {
    result = function.apply(t.getAge());
  }
  return result;
}
```

y para lograr el comportamiento de suma, todo lo que tendríamos que hacer es crear una función que pueda sumar. Podrías hacer esto usando una clase anónima como esta:

```java
private static void badExample() {
    Function<Integer, Integer> sum = new Function<Integer, Integer>   
   () {
        private Integer sum = 0;

        @Override
        public Integer apply(Integer amount) {
            sum += amount;
            return sum;
        }
   };
}
```

Donde el método de funciones toma un número entero y devuelve un número entero. En la implementación, la variable de suma es una variable miembro de la clase y muta cada vez que se aplica la función. Este tipo de mutación es generalmente de mala educación cuando se trata de programación funcional.

Sin embargo, podemos pasar esto a nuestro método **`forEach`** de esta manera:

```java
forEach(allPeople, sum);
```

y obtendríamos la suma de las edades de todas las personas. Esto funciona porque usamos la misma instancia de la función, por lo que la variable **`sum`** se reutiliza y muta durante cada iteración.

La mala noticia es que no podemos convertir esto en lambda directamente; no hay ningún equivalente a una variable miembro con lambdas, por lo que no hay ningún otro lugar para colocar la variable **`sum`** que no sea fuera de la lambda.

```java
double sum = 0;
forEach(allPeople, x -> {
    return sum += x;
});
```

pero esto resalta que la variable no es efectivamente final (ha cambiado en el cuerpo de la lambda) y por lo tanto debe ser final.

Pero si lo hacemos definitivo

```java
final double sum = 0;
forEach(allPeople, x -> {
    return sum += x;
});
```

¡Ya no podemos modificarlo en el cuerpo! Es la situación del huevo y la gallina.

El truco para solucionar esto es utilizar un objeto o una matriz; Su referencia puede seguir siendo final pero sus partes internas pueden modificarse.

```java
int[] sum = {0};
forEach(allPeople, x -> sum[0] += x);
```

De hecho, la referencia de la matriz es final  aquí, pero podemos modificar el contenido de la matriz sin reasignar la referencia. Sin embargo, esto generalmente es de mala educación, ya que abre la puerta a todos los problemas de seguridad de los que hablamos anteriormente. Lo menciono con fines ilustrativos, pero no recomiendo que hagas este tipo de cosas con frecuencia. Generalmente es mejor no crear funciones con efectos secundarios y puedes evitar los problemas por completo si utilizas un enfoque más funcional. Una forma más idiomática de hacer este tipo de suma es usar lo que se llama ***fold-plegar*** o en la lengua vernácula de Java ***reduce-reducir***.

## Exception handling - Manejo de excepciones

No hay una sintaxis nueva para el manejo de excepciones en lambdas. Las excepciones lanzadas en una lambda se propagan a la persona que llama, tal como se esperaría de una llamada a un método normal. No hay nada especial en llamar a lambdas o manejar sus excepciones.

Sin embargo, hay algunas sutilezas que debes tener en cuenta. En primer lugar, como autor de una lambda, es posible que no sepa qué excepciones se podrían generar, si corresponde, y en segundo lugar, como autor de una lambda, es posible que no sepa en qué contexto se ejecutará su lambda.

Cuando crea una lambda, normalmente cede la responsabilidad de cómo se ejecutará esa lambda al método al que se la pasa. Por lo que usted sabe, su lambda puede ejecutarse en paralelo o en algún momento en el futuro, por lo que es posible que cualquier excepción que lance no se maneje como cabría esperar. No puede confiar en el manejo de excepciones como una forma de controlar el flujo de su programa.

Para demostrar esto, escribamos un código para llamar a dos cosas, una tras otra. Lo usaremos **`Runnable`** como un tipo lambda conveniente.

```java
public static void runInSequence(Runnable first, Runnable second) {
    first.run();
    second.run();
}
```

Si la primera llamada a ejecutar arrojara una excepción, el método terminaría y nunca se llamaría al segundo método. La persona que llama debe encargarse de la excepción. Si utilizamos este método para transferir dinero entre dos cuentas bancarias, podríamos escribir dos lambdas. Uno para la acción de débito y otro para la de crédito.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> a.debit(amount);
    Runnable credit = () -> b.credit(amount);
 }
```

Entonces podríamos llamar a nuestro método **`runInSequence`** así:

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> a.debit(amount);
    Runnable credit = () -> b.credit(amount);
    runInSequence(debit, credit);
 }
```

cualquier excepción podría detectarse y solucionarse utilizando un **`try`**/**`catch`** como este:

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> a.debit(amount);
    Runnable credit = () -> b.credit(amount);
    try {
        runInSequence(debit, credit);
    } catch (Exception e) {
        // check account balances and rollback
    }
  }
```

Aquí está la cosa. Como autor de lambdas, potencialmente no tengo idea de cómo se implementa **`runInSequence`**. Es muy posible que se implemente para ejecutarse de forma asincrónica de esta manera:

```java
public static void runInSequence(Runnable first, Runnable second) {
    new Thread(() -> {
        first.run();
        second.run();
    }).start();
}
```

En cuyo caso, cualquier excepción en la primera llamada terminaría el hilo, la excepción desaparecería en el controlador de excepciones predeterminado y nuestro código de cliente original no tendría la oportunidad de lidiar con la excepción.

### Usando un callback

Por cierto, una forma de solucionar el problema específico de generar una excepción en un hilo diferente al de la persona que llama se puede solucionar con una función de devolución de llamada. En primer lugar, te defenderías de las excepciones en el método **`runInSequence`**:

```java
public static void runInSequence(Runnable first, Runnable second) {
    new Thread(() -> {
        try {
            first.run();
            second.run();
        } catch (Exception e) {
            // ...
        }
    }).start();
}
```

Luego introduzca un controlador de excepciones al que se pueda llamar en caso de una excepción:

```java
public static void runInSequence(Runnable first, Runnable second,
        Consumer<Throwable> exceptionHandler) {
    new Thread(() -> {
        try {
            first.run();
            second.run();
        } catch (Exception e) {
            exceptionHandler.accept(e);
        }
    }).start();
}
```

El consumidor es una interfaz funcional (nueva en Java 8) que en este caso toma la excepción como argumento de su método **`accept`**.

Cuando conectamos esto al cliente, podemos pasar una función lambda de devolución de llamada para manejar cualquier excepción.

```java
public void nonBlockingTransfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> a.debit(amount);
    Runnable credit = () -> b.credit(amount);
    runInSequence(debit, credit, (exception) -> {
      /* check account balances and rollback */
    });
}
```

Este es un buen ejemplo de ejecución diferida y también tiene sus propias debilidades. El método del controlador de excepciones puede (o no) ejecutarse en algún momento posterior. El proceso **`nonBlockingTransfer`** habrá finalizado y las propias cuentas bancarias pueden estar en algún otro estado cuando se active. No puede confiar en que se llame al controlador de excepciones cuando sea conveniente para usted; Hemos abierto toda una lata de gusanos de concurrencia.

### Tratar con excepciones al escribir lambdas

Veamos cómo manejar las excepciones desde la perspectiva de un autor de lambda, alguien que escribe lambda. Después de esto, veremos cómo lidiar con las excepciones al llamar a lambdas.

Veámoslo como si quisiéramos implementar el método **`transfer`** usando lambdas pero esta vez quisiéramos reutilizar una biblioteca existente que proporciona el método **`runInSequence`**.

Antes de comenzar, echemos un vistazo a la clase **`BankAccount`**. Notarás que esta vez, los métodos **`debit`** y **`credit`** arrojan una excepción marcada; **`InsufficientFundsException`**.

```java
class BankAccount {
    public void debit(int amount) throws InsufficientFundsException    
    {
        // ...
     }

     public void credit(int amount) throws 
     InsufficientFundsException   
     {
         // ...
      }
}

class InsufficientFundsException extends Exception { }
```

Recreemos el método **`transfer`**. Intentaremos crear las lambdas de débito y crédito y pasarlas al método **`runInSequence`**. Recuerde que el método **`runInSequence`** fue escrito por algún autor de la biblioteca y no podemos ver ni modificar su implementación.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> a.debit(amount);   <- compiler error
    Runnable credit = () -> b.credit(amount); <- compiler error
    runInSequence(debit, credit);
 }
```

Tanto el débito como el crédito arrojan una excepción marcada, por lo que esta vez puede ver un error del compilador. No hay diferencia si agregamos esto a la firma del método; la excepción ocurriría dentro de la lambda. ¿Recuerda que dije que las excepciones en lambdas se propagan a la persona que llama? En nuestro caso, este será el método **`runInSequence`** y no el punto en el que definimos la lambda. Los dos no se comunican entre sí sobre la posibilidad de que se plantee una excepción.

```java
// still doesn't compile
public void transfer(BankAccount a, BankAccount b, Integer amount)
       throws InsufficientFundsException {
    Runnable debit = () -> a.debit(amount);
    Runnable credit = () -> b.credit(amount);
    runInSequence(debit, credit);
}
```

Entonces, si no podemos forzar que una excepción marcada sea *transparente* entre lambda y la persona que llama, una opción es envolver la excepción marcada como una excepción de tiempo de ejecución como esta:

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> {
        try {
            a.debit(amount);
        } catch (InsufficientFundsException e) {
            throw new RuntimeException(e);
        }
   };
   Runnable credit = () -> {
       try {
           b.credit(amount);
       } catch (InsufficientFundsException e) {
           throw new RuntimeException(e);
       }
   };
   runInSequence(debit, credit);
 }
```

Eso nos saca del error de compilación pero aún no es la historia completa. Es muy detallado y todavía tenemos que detectar y solucionar lo que ahora es una excepción de tiempo de ejecución en torno a la llamada a **`runInSequence`**.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount){
    Runnable debit = () -> { ... };
    };
    Runnable credit = () -> { ... };
    try {
        runInSequence(debit, credit);
    } catch (RuntimeException e) {
        // check balances and rollback
    }
}
```

Sin embargo, todavía hay uno o dos inconvenientes; Estamos lanzando y cogiendo un **`RuntimeException`** que quizás esté un poco flojo. Realmente no sabemos qué otras excepciones, si las hay, podrían generarse en el método **`runInSequence`**. Quizás sea mejor ser más explícito. Creemos un nuevo subtipo de **`RuntimeException`** y usémoslo en su lugar.

```java
class InsufficientFundsRuntimeException extends RuntimeException {
    public   
    InsufficientFundsRuntimeException(InsufficientFundsException   
    cause) {
        super(cause);
    }
}
```

Después de haber modificado la lambda original para generar la nueva excepción, podemos restringir la captura para que se ocupe únicamente de las excepciones que conocemos; es decir, el **`InsufficientFundsRuntimeException`**.

Ahora podemos implementar algún tipo de funcionalidad de verificación y reversión de saldo, con la confianza de que entendemos todos los escenarios que pueden causarlo.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = () -> {
        try {
            a.debit(amount);
        } catch (InsufficientFundsException e) {
            throw new InsufficientFundsRuntimeException(e);
        }
   };
   Runnable credit = () -> {
       try {
           b.credit(amount);
       } catch (InsufficientFundsException e) {
           throw new InsufficientFundsRuntimeException(e);
       }
   };
   try {
       runInSequence(debit, credit);
   } catch (InsufficientFundsRuntimeException e) {
       // check balances and rollback
   }
 }
```

El problema con todo esto es que el código tiene más texto estándar para el manejo de excepciones que lógica empresarial real. Se supone que las lambdas hacen que las cosas sean menos detalladas, pero esto está lleno de ruido. Podemos mejorar las cosas si generalizamos el ajuste de las excepciones marcadas a equivalentes en tiempo de ejecución. Podríamos crear una interfaz funcional que capture un tipo de excepción en la firma usando genéricos.

Llamémoslo **`Callable`** y su método único; **`call`**. No confunda esto con la clase del mismo nombre en el JDK; Estamos creando una nueva clase para ilustrar el manejo de excepciones.

```java
@FunctionalInterface
interface Callable<E extends Exception> {
    void call() throws E;
}
```

Cambiaremos la implementación anterior de transferencia y crearemos lambdas para que coincidan con la "forma" de la nueva interfaz funcional. He dejado el tipo por un momento.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    ??? debit = () -> a.debit(amount);
    ??? credit = () -> b.credit(amount);
 }
```

Recuerde de la sección de inferencia de tipos que Java podría ver esto como un tipo de **`Callable`** ya que no tiene parámetros como **`Callable`**, tiene el mismo tipo de retorno (ninguno) y arroja una excepción del mismo tipo que la interfaz. Solo necesitamos darle una pista al compilador, para que podamos asignar esto a una instancia de **`Callable`**.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Callable<InsufficientFundsException> debit = () ->   
    a.debit(amount);
    Callable<InsufficientFundsException> credit = () -> 
    b.credit(amount);
 }
```

Crear lambdas de esta manera no causa un error de compilación ya que la interfaz funcional declara que podría generarse. No es necesario que nos advierta en el momento en que creamos la lambda, ya que la firma del método funcional provocará un error en el compilador si es necesario cuando realmente intentemos llamarlo. Como un método normal.

Sin embargo , si intentamos pasarlos al método **`runInSequence`**, obtendremos un error del compilador.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Callable<InsufficientFundsException> debit = () -> 
    a.debit(amount);
    Callable<InsufficientFundsException> credit = () -> 
    b.credit(amount);
    runInSequence(debit, credit); <- doesn't compile
 }
```

Las lambdas son del tipo incorrecto. Todavía necesitamos una lambda de tipo **`Runnable`**. Tendremos que escribir un método que pueda convertir de a **`Callable`** a **`Runnable`**. Al mismo tiempo, ajustaremos la excepción marcada a una de tiempo de ejecución. Algo como esto:

```java
public static Runnable unchecked(Callable<InsufficientFundsException> function) {
    return () -> {
        try {
            function.call();
        } catch (InsufficientFundsException e) {
            throw new InsufficientFundsRuntimeException(e);
        }
    };
}
```

Todo lo que queda por hacer es conectarlo a nuestras lambdas:

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = unchecked(() -> a.debit(amount));
    Runnable credit = unchecked(() -> b.credit(amount));
    runInSequence(debit, credit);
 }
```

Una vez que volvemos a implementar el manejo de excepciones, volvemos a un cuerpo de método más conciso y hemos tratado las posibles excepciones de la misma manera que antes.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    Runnable debit = unchecked(() -> a.debit(amount));
    Runnable credit = unchecked(() -> b.credit(amount));
    try {
         runInSequence(debit, credit);
    } catch (InsufficientFundsRuntimeException e) {
        // check balances and rollback
    }
 }
```

La desventaja es que ésta no es una solución totalmente generalizada; Todavía tendríamos que crear variaciones del método no marcado para diferentes funciones. También acabamos de ocultar la sintaxis detallada. La verbosidad sigue ahí, acaba de ser movida. Sí, podemos reutilizarlo, pero si el manejo de excepciones fuera transparente o no hubiéramos verificado las excepciones, no necesitaríamos esconder el problema bajo la alfombra tanto.

Vale la pena señalar que probablemente terminaríamos haciendo algo similar si estuviéramos en Java 7 y usáramos clases anónimas en lugar de lambdas. Muchas de estas cosas todavía se pueden hacer antes de Java 8 y terminarás creando métodos auxiliares para dejar la verbosidad a un lado.

Ciertamente, las lambdas ofrecen representaciones más concisas para pequeñas piezas anónimas de funcionalidad, pero debido al modelo de excepción verificado de Java, manejar excepciones en lambdas a menudo causará los mismos problemas de detalle que teníamos antes.

### As a caller (tratando con excepciones al llamar a lambdas)

Hemos visto cosas desde la perspectiva de escribir lambdas, ahora echemos un vistazo a las llamadas lambdas.

Imaginemos que ahora estamos escribiendo la library que ofrece el método **`runInSequence`**. Esta vez tenemos más control y no estamos limitados a usarlo **`Runnable`** como tipo lambda. Debido a que no queremos obligar a nuestros clientes a pasar por obstáculos relacionados con excepciones en sus lambdas (o envolverlas como excepciones de tiempo de ejecución), proporcionaremos una interfaz funcional que declara que se puede generar una excepción marcada.

Lo llamaremos **`FinancialTransfer`** con un método **`transfer`**:

```java
@FunctionalInterface
interface FinancialTransfer {
    void transfer() throws InsufficientFundsException;
}
```

Estamos diciendo que cada vez que ocurre una transacción bancaria, existe la posibilidad de que no haya fondos suficientes disponibles. Luego, cuando implementamos nuestro método **`runInSequence`**, aceptamos lambdas de este tipo.

```java
public static void runInSequence(FinancialTransfer first,
        FinancialTransfer second) throws InsufficientFundsException      
{
    first.transfer();
    second.transfer();
 }
```

Esto significa que cuando los clientes usan el método, no están obligados a lidiar con excepciones dentro de sus lambdas. Por ejemplo, escribir un método como este.

```java
// example client usage
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    FinancialTransfer debit = () -> a.debit(amount);
    FinancialTransfer credit = () -> b.credit(amount);
 }
```

Esta vez no hay ningún error del compilador al crear las lambdas. No es necesario incluir las excepciones de **`BankAccount`** los métodos como excepciones de tiempo de ejecución; la interfaz funcional ya ha declarado la excepción. Sin embargo, **`runInSequence`** ahora arrojaría una excepción marcada, por lo que es explícito que el cliente tiene que lidiar con la posibilidad y verá un error del compilador.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    FinancialTransfer debit = () -> a.debit(amount);
    FinancialTransfer credit = () -> b.credit(amount);
    runInSequence(debit, credit);  <- compiler error
 }
```

Entonces necesitamos envolver la llamada en un **`try`**/**`catch`** para que el compilador esté contento:

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    FinancialTransfer debit = () -> a.debit(amount);
    FinancialTransfer credit = () -> b.credit(amount);
    try {
        runInSequence(debit, credit);  <- compiler error
    } catch (InsufficientFundsException e) {
        // whatever
    }
 }
```

El resultado final es algo parecido a lo que vimos anteriormente pero sin la necesidad del método no verificado. Como desarrollador de bibliotecas, hemos facilitado a los clientes la integración con nuestro código.

Pero ¿qué tal si probamos algo más exótico? Hagamos que el método **`runInSequence`** sea asincrónico nuevamente. No es necesario lanzar la excepción desde la firma del método, ya que no se propagaría a la persona que llama si se lanzara desde un hilo diferente. Entonces, esta versión del método **`runInSequence`** no incluye la cláusula 
**`throws`** y el método **`transfer`** ya no está obligado a lidiar con ella. Sin embargo, las llamadas a **`.transfer`** seguirán generando una excepción.

```java
public static void runInSequence(Runnable first, Runnable second) {
    new Thread(() -> {
        first.transfer();   <- compiler error
        second.transfer();  <- compiler error
    }).start();
}

public void transfer(BankAccount a, BankAccount b, Integer amount) {
    FinancialTransfer debit = () -> a.debit(amount);
    FinancialTransfer credit = () -> b.credit(amount);
    runInSequence(debit, credit);  <- compiler error
 }
```

Con los errores del compilador todavía en el método **`runInSequence`**, necesitamos otra forma de manejar la excepción. Una técnica consiste en pasar una función que se llamará en caso de una excepción. Podemos usar esta lambda para conectar el código que se ejecuta de forma asincrónica con la persona que llama.

Para empezar, volveremos a agregar el bloque **`catch`** y pasaremos una interfaz funcional para usar como controlador de excepciones. Usaré la interfaz **`Consumer`** aquí, es nueva en Java 8 y forma parte del paquete **`java.util.function`**. Luego llamamos al método de interfaz en el bloque **`catch`** y le pasamos la causa.

```java
public void runInSequence(FinancialTransfer first,     
       FinancialTransfer second,
       Consumer<InsufficientFundsException> exceptionHandler) {
    new Thread(() -> {
        try {
            first.transfer();
            second.transfer();
        } catch (InsufficientFundsException e) {
            exceptionHandler.accept(e);
        }
    }).start();
}
```

Para llamarlo, necesitamos actualizar el método **`transfer`** para pasar una lambda para la devolución de llamada. El parámetro, excepción a continuación, será lo que se pase al método **`accept`** en **`runInSequence`**. Será una instancia **`InsufficientFundsException`** y el cliente podrá manejarlo como quiera.

```java
public void transfer(BankAccount a, BankAccount b, Integer amount) {
    FinancialTransfer debit = () -> a.debit(amount);
    FinancialTransfer credit = () -> b.credit(amount);
    Consumer<InsufficientFundsException> handler = (exception) -> {
        /* check account balances and rollback */
   };
   runInSequenceNonBlocking(debit, credit, handler);
}
```

Ahí estamos. Le hemos proporcionado al cliente de nuestra library un mecanismo de manejo de excepciones alternativo en lugar de obligarlo a detectar excepciones.

Hemos internalizado el manejo de excepciones en el código de la library. Es un buen ejemplo de ejecución diferida; Si hubiera una excepción, el cliente no necesariamente sabe cuándo se invocaría su controlador de excepciones. Por ejemplo, mientras ejecutamos otro hilo, es posible que las cuentas bancarias mismas hayan sido alteradas en el momento en que se ejecuta. Nuevamente resalta que usar excepciones para controlar el flujo de su programa es un enfoque defectuoso. No puede confiar en que se llame al controlador de excepciones cuando sea conveniente para usted.

## Lambdas vs closures

Los términos ***closure*** y ***lambda*** a menudo se usan indistintamente pero en realidad son distintos. En esta sección veremos las diferencias para que puedas tener claro cuál es cuál.

A continuación se muestra una tabla que muestra las fechas de lanzamiento de cada versión principal de Java. Java 5.0 apareció en 2004 e incluyó los primeros cambios importantes en el lenguaje, incluidos aspectos como compatibilidad con genéricos:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/2cd931a1-4502-4c7e-8a71-528db546ba1f)

Entre 2008 y 2010 se trabajó mucho para introducir closures en Java. Debía pasar a Java 7 pero no llegó a tiempo. En cambio, evolucionó hacia el soporte lambda en Java 8. Desafortunadamente, en esa época, la gente usaba el término "closure" y "lambdas" indistintamente, por lo que desde entonces ha sido un poco confuso para la comunidad Java. De hecho, todavía hay una página de proyecto en el sitio OpenJDK para closures y otra para lambdas .

Desde la perspectiva del proyecto OpenJDK, realmente deberían haber usado "lambda" de manera consistente desde el principio. De hecho, OpenJDK se equivocó tanto que ignoraron el hecho de que Java ha tenido soporte de closure desde la versión 1.1.

Estoy siendo un poco pedante aquí ya que, aunque existen diferencias técnicas entre closures y lambdas, los objetivos de los dos proyectos eran lograr lo mismo, incluso si usaron la terminología de manera inconsistente.

Entonces, ¿cuál es la diferencia entre lambdas y closures? Básicamente, un closure es un tipo de lambda, pero una lambda no es necesariamente un closure.

### Diferencias básicas

Al igual que una lambda, un closure es efectivamente un bloque anónimo de funcionalidad, pero existen algunas distinciones importantes. Un closure depende de valores externos (no solo de sus argumentos), mientras que una lambda depende solo de sus argumentos. Se dice que un closure "cierra sobre" el entorno que requiere.

Por ejemplo, lo siguiente:

```java
(server) -> server.isRunning();
```

es una lambda, pero esto

```java
() -> server.isRunning();
```

es un closure.

Ambos devuelven un valor booleano que indica si algún servidor está activo, pero uno usa su argumento y el otro debe obtener la variable de otro lugar. Ambos son lambdas; en el sentido general, ambos son bloques anónimos de funcionalidad y, en el sentido del lenguaje Java, ambos utilizan la nueva sintaxis lambda.

El primer ejemplo se refiere a una variable del servidor pasada a la lambda como argumento, mientras que el segundo ejemplo (el closure) obtiene la variable del servidor de otro lugar; ese es el medio ambiente. Para obtener la instancia de la variable, lambda tiene que "close over" el entorno o capturar el valor del servidor. Hemos visto esto en acción cuando hablamos de **`effectively final`**.

Ampliemos el ejemplo para ver las cosas más claramente. En primer lugar, crearemos un método en una clase estática para realizar una encuesta ingenua y esperar. Verificará una interfaz funcional en cada encuesta para ver si se ha cumplido alguna condición.

```java
class WaitFor {
    static <T> void waitFor(T input, Predicate<T> predicate)
            throws InterruptedException {
        while (!predicate.test(input))
            Thread.sleep(250);
    }
}
```

Usamos **`Predicate `**(otra interfaz nueva de **`java.util`**) como nuestra interfaz funcional y la probamos, haciendo una pausa por un momento si no se cumple la condición. Podemos llamar a este método con una lambda simple que verifica si algún servidor HTTP se está ejecutando.

```java
void lambda() throws InterruptedException {
    waitFor(new HttpServer(), (server) -> !server.isRunning());
}
```

El parámetro del servidor lo proporciona nuestro método **`waitFor`** y será la instancia de **`HttpServer`** que acabamos de definir. Es una lambda ya que el compilador no necesita capturar la variable del servidor ya que la proporcionamos manualmente en tiempo de ejecución.

<hr>

**NOTA**

Por cierto, podríamos haber podido utilizar una referencia de método...  waitFor(new HttpServer(), HttpServer::isRunning);                                                   

<hr>

Ahora, si volvemos a implementar esto como closure, se vería así. En primer lugar, tenemos que agregar otro método **`waitFor`**.

```java
static void waitFor(Condition condition) throws InterruptedException {
    while (!condition.isSatisfied())
        Thread.sleep(250);
}
```

Esta vez, con una firma más sencilla. Pasamos una interfaz funcional que no requiere parámetros. La interfaz **`Condition`** tiene un método simple **`isSatisfied`** sin argumentos, lo que implica que debemos proporcionar cualquier valor que pueda necesitar una implementación. Ya está insinuando que su uso puede resultar en closures.

Usándolo, escribiríamos algo como esto:

```java
void closure() throws InterruptedException {
    Server server = new HttpServer();
    waitFor(() -> !server.isRunning());
}
```

La instancia del servidor no se pasa aquí como parámetro a lambda, sino que se accede a ella desde el ámbito adjunto. Hemos definido la variable y lambda la usa directamente. Esta variable debe ser capturada o copiada por el compilador. La lambda "closes over - cierra" la variable del servidor.

Esta expresión "closes over - cerrar" proviene de la idea de que una expresión lambda con enlaces abiertos (o variables libres) ha sido cerrada (o enlazada) por el entorno o alcance léxico. El resultado es una ***closed expression-expresión cerrada***. No hay variables independientes. Para ser más precisos, los closures se cierran sobre ***valores***, no sobre ***variables***.

Hemos visto el uso de un closure para proporcionar un bloque anónimo de funcionalidad y la diferencia entre una lambda equivalente, pero todavía hay más distinciones útiles que podemos hacer.

### Otras diferencias

Una función anónima es una función literal sin nombre, mientras que un closure es una instancia de una función. Por definición, una lambda no tiene variables de instancia; no es una instancia. Sus variables se proporcionan como argumentos. Sin embargo, un closure tiene variables de instancia que se proporcionan cuando se crea la instancia.

Teniendo esto en cuenta, una lambda generalmente será más eficiente que un closure, ya que solo necesita evaluarse una vez. Una vez que tengas la función, podrás reutilizarla. Cuando un closure se cierra sobre algo que no está en su entorno local, debe evaluarse cada vez que se llama. Una instancia debe actualizarse cada vez que se utiliza.

Todas las cuestiones que analizamos en la sección functions vs classes también son relevantes aquí. Puede haber consideraciones de memoria al usar closures sobre lambdas.

### Resumen

Hemos hablado mucho aquí, así que resumamos brevemente las diferencias.

Lambdas son simplemente funciones anónimas, similares a los métodos estáticos en Java. Al igual que los métodos estáticos, no pueden hacer referencia a variables fuera de su alcance excepto sus argumentos. Un tipo especial de lambda, llamado closure, puede capturar variables fuera de su alcance (o cerrarlas) para que puedan usar variables externas o sus argumentos. Entonces, la regla simple es que si una lambda usa una variable fuera de su alcance, también es un closure.

Los closures pueden verse como instancias de funciones. Lo cual es un concepto un tanto extraño para los desarrolladores de Java.

Un gran ejemplo es la clase anónima convencional que pasaríamos si no tuviéramos la nueva sintaxis lambda. Estos pueden "cerrar" variables y, por lo tanto, son en sí mismos closures. Hemos tenido soporte de closure en Java desde 1.1.

Echale un vistazo a éste ejemplo. El compilador debe cerrar la variable del servidor para utilizarla en la instancia anónima de la interfaz **`Condition`**. Esta es a la vez una instancia de clase anónima y un closure.

```java
@since Java 1.1!
void anonymousClassClosure() {
    Server server = new HttpServer();
    waitFor(new Condition() {
        @Override
        public Boolean isSatisfied() {
            return !server.isRunning();
        }
    });
}
```

Las lambda no siempre son closures, pero los closures siempre son lambdas.

En esta sección exploraremos cómo la salida del compilador difiere cuando compila clases anónimas y cuando compila lambdas. Primero, recordaremos el código de bytes de Java y cómo leerlo. Luego veremos tanto las clases anónimas como las lambdas cuando capturan variables y cuando no. Compararemos closures anteriores a Java 8 con lambdas y exploraremos cómo las lambdas no son solo azúcar sintáctico sino que producen códigos de bytes muy diferentes a los enfoques tradicionales.


## Bytecode recap

Para empezar, recapitulemos lo que sabemos sobre el código de bytes.

Pasar del código fuente al código ejecutable por máquina. El compilador de Java produce código de bytes. Esto es interpretado por la JVM o recompilado por el compilador Just-in-time.

Cuando se interpreta, el código de bytes se convierte en código de máquina sobre la marcha y se ejecuta. Esto sucede cada vez que se encuentra el código de bytes excepto la JVM.

Cuando se compila Just-in-time, la JVM lo compila directamente en código de máquina la primera vez que lo encuentra y luego lo ejecuta.

Ambas cosas suceden en tiempo de ejecución, pero la compilación justo a tiempo ofrece muchas optimizaciones.

Entonces, el código de bytes de Java es la representación intermedia entre el código fuente y el código de máquina.

<hr>

**NOTA**

Como breve comentario: el compilador JIT de Java ha disfrutado de una gran reputación a lo largo de los años. Pero volviendo al punto de partida de nuestra introducción, fue John McCarthy quien escribió por primera vez sobre la compilación JIT allá por 1960. Así que es interesante pensar que no es sólo el soporte lambda el que fue influenciado por LISP. ( Aycock 2003, 2. Técnicas de compilación JIT, 2.1 Génesis, p. 98 ). 

<hr>

El código de bytes es el conjunto de instrucciones de la JVM. Como sugiere su nombre, el código de bytes consta de instrucciones de un solo byte (llamadas códigos de operación) junto con bytes asociados para los parámetros. Por lo tanto, hay posibles 256 códigos de operación disponibles, aunque en realidad sólo se utilizan unos 200.

La JVM utiliza un modelo de cálculo basado en pila, si queremos incrementar un número, tenemos que hacerlo usando la pila. Todas las instrucciones o códigos de operación funcionan contra la pila.

Entonces, por ejemplo, 5 + 1 se convierte en 5 1 + donde 5 se empuja a la pila,

![image](https://github.com/adolfodelarosades/Java/assets/23094588/7f5c51c3-78d6-4546-8c64-58a2900a4068)

1 es empujado entonces...

![image](https://github.com/adolfodelarosades/Java/assets/23094588/4365caad-ba55-4c21-bd48-5d68aed81814)

el operador **`+`** se aplica. Además, abriría los dos cuadros superiores, sumaría los números y colocaría el resultado nuevamente en la pila. El resultado sería así.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9c146f8c-f077-48cc-b9a9-6d3f9b4ce863)

Cada código de operación funciona con la pila de esta manera, por lo que podemos traducir nuestro ejemplo a una secuencia de códigos de bytes de Java:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/30d916ea-8ce2-4cd5-9432-18e74ada3a9f)

El código **`push 5`** de operación se convierte en **`iconst_5`**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/a908bc24-23b0-4a8d-a6e6-e734410329ef)

El código **`push 1`** de operación se convierte en **`iconst_1`**:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/579b3d98-b522-413e-af27-80ded781ac80)

y **`add`** se convierte **`iadd`**.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/2c6916d1-f8dc-4c84-8751-709367d72140)

El código de operación **`iconst_x`** y el código de operación **`iadd`** son ejemplos de códigos de operación. Los códigos de operación a menudo tienen prefijos y/o suficientes para indicar los tipos en los que funcionan; **`i`** en estos ejemplos se refiere a un número entero, **`x`** es un sufijo específico del código de operación.

Podemos agrupar los códigos de operación en las siguientes categorías:

![image](https://github.com/adolfodelarosades/Java/assets/23094588/ef578609-6997-46b0-989d-87a17b4e0d7e)

Instrucciones relacionadas con la manipulación de pilas, como **`aload`** y **`istore`**.

Para controlar el flujo del programa con cosas como if y while, usamos códigos de operación como **`goto`** y if iguales.

La creación de objetos y los métodos de acceso utilizan códigos como **`new`** y **`invokespecial`**. Estaremos particularmente interesados ​​en este grupo cuando observemos los diferentes códigos de operación utilizados para invocar lambdas.

El último grupo trata sobre aritmética, lógica y conversión de tipos e incluye códigos como **`iadd`**, comparación flotante larga ( **`fcmpl`**) y entero a byte (**`i2b`**).

## Descriptors - Descriptores

Los códigos de operación a menudo usan parámetros, estos parecen un poco crípticos en el código de bytes, ya que generalmente se hace referencia a ellos a través de tablas de búsqueda. Internamente, Java utiliza lo que se llama descriptores para describir estos parámetros.

Describen tipos y firmas utilizando una gramática específica que verá en todo el código de bytes. A menudo verás la misma gramática utilizada en el compilador o en la salida de depuración, por lo que es útil recapitularla aquí.

A continuación se muestra un ejemplo de un descriptor de firma de método.

```sh
Example$1."<init>":(Lcom/foo/Example;Lcom/foo/Server;)V
```

Describe el constructor de una clase llamada **`$1`**, que sabemos que es el nombre de la JVM para la primera instancia de clase anónima dentro de otra clase. En este caso **`Example`**. Entonces tenemos un constructor de una clase anónima que toma dos parámetros, una instancia de la clase externa **`com.foo.Example`** y una instancia de **`com.foo.Server`**.

Al ser constructor, el método no devuelve nada. El símbolo **`V`** representa el vacío.

Eche un vistazo al desglose de la sintaxis del descriptor a continuación. Si ve una **`Z`** mayúscula en un descriptor, se refiere a un booleano, una **`B`** mayúscula a un byte, etc.

![image](https://github.com/adolfodelarosades/Java/assets/23094588/9ea824fa-5085-40de-87ee-8c52bc12648f)


Un par de ellos para mencionar:

* Las clases se describen con **`L`** mayúsculas seguidas del nombre de clase completo, seguido de un punto y coma. El nombre de la clase está separado con barras en lugar de puntos.

* Y las matrices se describen utilizando un corchete de apertura seguido de un tipo de la lista. Sin corchete de cierre.

## Convertir la firma de un método

Tomemos la siguiente firma del método y convirtámosla en un descriptor de método:

```java
long f (int n, String s, int[] array);
```

El método devuelve a **`long`**, por lo que describimos el hecho de que es un método entre paréntesis y que devuelve a **`long`** con **`J`** mayúsculas .

```java
()J
```

El primer argumento es de tipo **`int`**, por lo que usamos **`I`** mayúsculas .

```java
(I)J
```

El siguiente argumento es un objeto, por lo que lo usamos **`L`** para describirlo, calificamos completamente el nombre y lo cerramos con un punto y coma.

```java
(ILString;)J
```

El último argumento es una matriz de números enteros, por lo que colocamos la sintaxis de la matriz seguida del tipo **`int`**:

```java
(ILString;[I)J
```

y terminamos. Un descriptor de método JVM.
