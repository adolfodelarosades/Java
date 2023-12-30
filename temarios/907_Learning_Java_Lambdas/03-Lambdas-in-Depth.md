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

Clase::método
o, un ejemplo más concreto:

Cadena::valorDe
La parte que precede a los dos puntos es la referencia de destino y después, el nombre del método. Entonces, en este caso, nos dirigimos a la Stringclase y buscamos un método llamado valueOf; Nos referimos al staticmétodo de String.

valor de cadena estática pública de (objeto obj) {...}
Los dos puntos dobles se llaman delimitador . Cuando lo usamos, no invocamos el método, solo hacemos referencia a él. Así que recuerda no agregar corchetes al final.

Cadena::valorDe(); // <-- error
No puede invocar referencias de métodos directamente, solo se pueden usar en lugar de una lambda. Entonces, en cualquier lugar donde se use una lambda, puede usar una referencia de método.

Ejemplo
Esta declaración por sí sola no se compilará.

público estático vacío principal (cadena... argumentos) {
    Cadena::valorDe;
}
Esto se debe a que la referencia del método no se puede transformar en una lambda ya que no hay contexto para que el compilador infiera qué tipo de lambda crear.

Sabemos que esta referencia equivale a

(x) -> Cadena.valorDe(x)
pero el compilador aún no lo sabe. Aunque puede decir algunas cosas. Sabe que, como lambda, el valor de retorno debe ser de tipo Stringporque todos los métodos llamados valueOfdevuelven Stringuna cadena. Pero no tiene idea de qué argumento ofrecer. Necesitamos darle un poco de ayuda y darle más contexto.

Crearemos una interfaz funcional llamada Conversionque toma un número entero y devuelve una cadena. Este será el tipo de destino de nuestra lambda.

@Interfaz funcional
Conversión de interfaz {
    Conversión de cadena (número entero);
}
A continuación, necesitamos crear un escenario en el que usemos esto como lambda. Entonces creamos un pequeño método para tomar una interfaz funcional y aplicarle un número entero.

conversión de cadena estática pública (número entero, función de conversión) {
    función de retorno.convert(número);
}
Ahora, aquí está la cuestión. Acabamos de darle al compilador suficiente información para transformar una referencia de método en la lambda equivalente.

Cuando llamamos a convertun método, podemos hacerlo pasando una lambda.

convert(100, (número) -> String.valueOf(número));
Y podemos reemplazar la lambda con una referencia al valueOfmétodo. El compilador ahora sabe que necesitamos una lambda que devuelva una cadena y tome un número entero. Ahora sabe que el valueOfmétodo "se ajusta" y puede sustituir el argumento del número entero.

convertir(100, Cadena::valorDe);
Otra forma de darle al compilador la información que necesita es simplemente asignar la referencia a un tipo.

Conversión b = (número) -> String.valueOf(número);
y como referencia del método

Conversión a = String::valueOf;
las "formas" encajan, por lo que se pueden asignar.

Curiosamente, podemos asignar la misma lambda a cualquier interfaz que requiera la misma "forma". Por ejemplo, si tenemos otra interfaz funcional con la misma "forma",

Aquí, Exampledevuelve a Stringy toma an Objectpara que tenga la misma forma de firma que valueOf.

Ejemplo de interfaz {
    String theNameIsUnimportant(Objeto objeto);
}
aún podemos asignarle la referencia del método (o lambda).

Ejemplo a = Cadena::valorDe;
Tipos de referencia de métodos
Hay cuatro tipos de referencia de método:

Referencias de constructores
Referencias de métodos estáticos
Y dos tipos de referencias a métodos de instancia.
Los dos últimos son un poco confusos. La primera es una referencia de método de un objeto particular y la segunda es una referencia de método de un objeto arbitrario pero de un tipo particular. La diferencia está en cómo desea utilizar el método y si tiene la instancia con anticipación o no.

Entonces, en primer lugar, echemos un vistazo a las referencias del constructor.

Referencia del constructor
La sintaxis básica se ve así:

Cadena::nueva
Un tipo de destino seguido de dos puntos y luego la newpalabra clave. Creará una lambda que llamará al constructor de argumento cero de la Stringclase.

Es equivalente a esta lambda

() -> nueva cadena()
Recuerde que las referencias a métodos nunca tienen paréntesis; no están invocando métodos, solo hacen referencia a uno. Este ejemplo hace referencia al constructor de la Stringclase pero no crea una instancia de una cadena.

Echemos un vistazo a cómo podríamos usar realmente una referencia de constructor.

Si creamos una lista de objetos, es posible que queramos completar esa lista, digamos diez elementos. Entonces podríamos crear un bucle y agregar un nuevo objeto diez veces.

uso público vacío() {
    Lista<Objeto> lista = nueva ArrayList<>();
    para (int i = 0; i < 10; i++) {
        lista.add(nuevo objeto());
  }
}
pero si queremos poder reutilizar esa función de inicialización, podríamos extraer el código a un nuevo método llamado initialisey luego usar una fábrica para crear el objeto.

uso público vacío() {
    Lista<Objeto> lista = nueva ArrayList<>();
    inicializar(lista, ...);
}

inicialización de vacío privado (Lista <Objeto> lista, Fábrica <Objeto> fábrica) {
    para (int i = 0; i < 10; i++) {
        lista.add(factory.create());
    }
 }
La Factoryclase es solo una interfaz funcional con un método llamado createque devuelve algún objeto. Luego podemos agregar el objeto que creó a la lista. Debido a que es una interfaz funcional, podemos usar una lambda para implementar la fábrica para inicializar la lista:

uso público vacío() {
    Lista<Objeto> lista = nueva ArrayList<>();
    inicializar(lista, () -> nuevo Objeto());
}
O podríamos intercambiar una referencia de constructor.

uso público vacío() {
    Lista<Objeto> lista = nueva ArrayList<>();
    inicializar(lista, Objeto::nuevo);
}
Hay un par de cosas más que podríamos hacer aquí. Si agregamos algunos genéricos al initialisemétodo podemos reutilizarlo al inicializar listas de cualquier tipo. Por ejemplo, podemos regresar y cambiar el tipo de lista Stringy usar una referencia de constructor para inicializarla.

uso público vacío() {
    Lista<Cadena> lista = nueva ArrayList<>();
    inicializar(lista, Cadena::nueva);
}

privado <T> void inicializar (Lista<T> lista, Fábrica<T> fábrica) {
    para (int i = 0; i < 10; i++) {
        lista.add(factory.create());
    }
}
Hemos visto cómo funciona para constructores sin argumentos, pero ¿qué pasa en el caso en que las clases tienen constructores con múltiples argumentos?

Cuando hay varios constructores, se utiliza la misma sintaxis, pero el compilador determina qué constructor sería el mejor. Lo hace basándose en el tipo de destino e infiriendo interfaces funcionales que puede utilizar para crear ese tipo.

Tomemos el ejemplo de una Personclase, se ve así y puedes ver que el constructor toma varios argumentos.

clase Persona {
    Persona pública (cadena de nombre, cadena de apellido, fecha local)    
    cumpleaños, sexo, cadena de dirección de correo electrónico, int edad) {
      //...
    }
}
Volviendo a nuestro ejemplo anterior y observando el initialisemétodo de propósito general, podríamos usar una lambda como esta:

inicializar(personas, () -> nueva Persona(nombre, apellido, fecha de nacimiento,
                                    sexo, correo electrónico, edad));
pero para poder usar una referencia de constructor, necesitaríamos una lambda con argumentos variables y se vería así:

(a, b, c, d, e, f) -> nueva Persona (a, b, c, d, e, f);
pero esto no se traduce directamente en una referencia de constructor. Si intentáramos usar

Persona::nueva
no se compilará porque no sabe nada sobre los parámetros. Si intenta compilarlo, el error dice que ha creado una referencia de constructor no válida que no se puede aplicar a los tipos dados; no encontró argumentos.

En cambio, tenemos que introducir alguna dirección indirecta para darle al compilador suficiente información para encontrar un constructor apropiado. Podemos crear algo que pueda usarse como una interfaz funcional y que tenga los tipos correctos para insertarse en el constructor apropiado.

Creemos una nueva interfaz funcional llamada PersonFactory.

@Interfaz funcional
interfaz PersonFactory {
    Persona crear (cadena nombre, cadena apellido, fecha local 
    cumpleaños, sexo, cadena de dirección de correo electrónico, int edad);
}
Aquí, los argumentos de PersonFactorycoinciden con el constructor disponible en Person. Mágicamente, esto significa que podemos volver atrás y usarlo con una referencia de constructor de Person.

ejemplo de vacío público() {
    Lista<Persona> lista = nueva ArrayList<>();
    PersonFactory fábrica = Persona::nueva;
    //...
}
Observe que estoy usando la referencia del constructor de Person. Lo que hay que tener en cuenta aquí es que se puede asignar una referencia de constructor a una interfaz funcional de destino aunque todavía no conozcamos los argumentos.

Puede parecer un poco extraño que el tipo de referencia del método sea PersonFactoryy no Person. Esta información adicional sobre el tipo de destino ayuda al compilador a saber que debe pasar PersonFactorypara crear un archivo Person. Con esta sugerencia adicional, el compilador puede crear una lambda basada en la interfaz de fábrica que luego creará un archivo Person.

Al escribirlo a mano, el compilador generaría esto.

ejemplo de vacío público() {
    PersonFactory fábrica = (a, b, c, d, e, f) -> nueva Persona (a, b,   
    c, d, e, f);
}
que podría usarse más adelante así:

ejemplo de vacío público() {
    PersonFactory fábrica = (a, b, c, d, e, f) -> nueva Persona (a, b,  
    c, d, e, f);
    Persona persona = factory.create(nombre, apellido, fecha de nacimiento,
                                sexo, correo electrónico, edad);
}
Afortunadamente, el compilador puede hacer esto por nosotros una vez que hayamos introducido la dirección indirecta.

Entiende cuál es el tipo de destino a usar PersonFactoryy comprende que su abstractmétodo único se puede usar en lugar de un constructor. Es como un proceso de dos pasos, en primer lugar, determinar que el abstractmétodo tiene la misma lista de argumentos que un constructor y que devuelve el tipo correcto, luego aplicarlo con la nueva sintaxis de dos puntos y dos puntos.

Para finalizar el ejemplo, necesitamos modificar nuestro initialisemétodo para agregar la información de tipo (reemplazar los genéricos), agregar parámetros para representar los detalles de la persona y, de hecho, invocar la fábrica.

inicialización de vacío privado (lista Lista <Persona>, fábrica PersonFactory, 
                       Nombre de cadena, Apellido de cadena,                           
                       LocalDate cumpleaños, Sexo género,
                       Cadena de dirección de correo electrónico, int edad) {
                         para (int i = 0; i < 10; i++) {
                           list.add(factory.create(nombre,  
                           apellido, fecha de nacimiento, sexo,        
                           dirección de correo electrónico, edad));
                         }
                       }
y luego podemos usarlo así:

ejemplo de vacío público() {
    Lista<Persona> lista = nueva ArrayList<>();
    PersonFactory fábrica = Persona::nueva;
    inicializar (personas, fábrica, a, b, c, d, e, f);
}
o en línea, así:

ejemplo de vacío público() {
    Lista<Persona> lista = nueva ArrayList<>();
    inicializar(personas, Persona::nuevo, a, b, c, d, e, f);
}
Referencia del método estático
Una referencia de método puede apuntar directamente a un método estático. Por ejemplo,

Cadena::valorDe
Esta vez, el lado izquierdo se refiere al tipo donde valueOfse puede encontrar un método estático, en este caso. Es equivalente a esta lambda

x -> Cadena.valorDe(x))
Un ejemplo más extendido sería cuando ordenamos una colección usando una referencia a un método estático en la clase Comparators.

Collections.sort(Arrays.asList(5, 12, 4), Comparadores::ascendente);

// equivalente a
Collections.sort(Arrays.asList(5, 12, 4), (a, b) -> Comparators.ascending(a, b));
donde, el método estático ascendingpodría definirse así:

Comparadores públicos de clases estáticas {
    Entero estático público ascendente (entero primero, entero segundo)   
    {
        devolver primero.compareTo(segundo);
     }
}
Referencia del método de instancia de un objeto particular (en este caso, un cierre)
A continuación se muestra un ejemplo de una referencia de método de instancia de una instancia específica:

x::aCadena
Es xun caso específico al que queremos llegar. Su equivalente lambda se ve así:

() -> x.toString()
La capacidad de hacer referencia al método de una instancia específica también nos brinda una manera conveniente de convertir entre diferentes tipos de interfaces funcionales. Por ejemplo:

Invocable<String> c = () -> "Hola";
El método funcional de Callable es call. Cuando se invoque, la lambda regresará "Hello".

Si tenemos otra interfaz funcional, Factorypodemos convertirla Callableusando una referencia de método.

Fábrica<Cadena> f = c::call;
Podríamos haber recreado la lambda, pero este truco es una forma útil de reutilizar lambda predefinida. Asígnalos a variables y reutilízalos para evitar duplicaciones.

Aquí hay un ejemplo de su uso:

ejemplo de vacío público() {
    Cadena x = "hola";
    función(x::toString);
}
Este es un ejemplo en el que la referencia del método utiliza un cierre. Crea una lambda que llamará al toStringmétodo en la instancia x.

La firma e implementación de la función anterior se ve así:

Función de cadena estática pública (proveedor <cadena> proveedor) {
    devolver proveedor.get();
}
La Supplier interfaz es una interfaz funcional que se ve así:

@Interfaz funcional
interfaz pública Proveedor<T> {
  T obtener();
}
Cuando se usa en nuestra función, proporciona un valor de cadena (a través de la llamada a get) y la única manera de hacerlo es si el valor se le ha proporcionado en la construcción. Es equivalente a:

ejemplo de vacío público() {
  Cadena x = "";
  función(() -> x.toString());
}
Observe aquí que la lambda no tiene argumentos (usa el símbolo de "hamburguesa"). Esto muestra que el valor de xno está disponible en el alcance local de lambda y, por lo tanto, solo puede estar disponible desde fuera de su alcance. Es un cierre porque debe cerrarse x(capturará ) x .

Si está interesado en ver el equivalente de clase anónimo y escrito a mano, se verá así. Observe nuevamente cómo xse debe pasar:

ejemplo de vacío público() {
    Cadena x = "";
    function(nuevo Proveedor<String>() {
        @Anular
        cadena pública obtener() {
            devolver x.toString(); // <- se cierra sobre 'x'
        }
    });
}
Los tres son equivalentes. Compare esto con la variación lambda de una referencia de método de instancia donde no tiene su argumento pasado explícitamente desde un ámbito externo.

Referencia del método de instancia de un objeto arbitrario cuya instancia se proporciona más adelante (lambda)
El último caso es para una referencia de método que apunta a un objeto arbitrario al que se hace referencia por su tipo:

Objeto::toString
Entonces, en este caso, aunque parece que el lado izquierdo apunta a una clase (como la staticreferencia del método), en realidad apunta a una instancia. El toStringmétodo es un método de instancia Object, no un staticmétodo. La razón por la que es posible que no utilice la sintaxis del método de instancia normal es porque es posible que aún no tenga una instancia a la que hacer referencia.

Entonces, antes, cuando llamamos xdos puntos dos puntos toString, conocemos el valor de x. Hay algunas situaciones en las que no tienes un valor de xy en estos casos, aún puedes pasar una referencia al método pero proporcionar un valor más adelante usando esta sintaxis.

Por ejemplo, el equivalente lambda no tiene un valor enlazado para x.

(x) -> x.toString()
La diferencia entre los dos tipos de referencia de métodos de instancia es básicamente académica. A veces, necesitará pasar algo, otras veces, el uso de lambda se lo proporcionará.

El ejemplo es similar a la referencia del método habitual; solo llama al toStringmétodo de una cadena esta vez, la cadena se suministra a la función que utiliza lambda y no se pasa desde un ámbito externo.

ejemplo lambda vacío público() {
    función("valor", Cadena::toString);
}
Parece que la Stringparte hace referencia a una clase, pero en realidad hace referencia a una instancia. Es confuso, lo sé, pero para ver las cosas más claramente, necesitamos ver la función que utiliza lambda. Se parece a esto.

Función de cadena estática pública (valor de cadena, función <cadena, cadena>) {
    función de retorno.aplicar (valor);
}
Entonces, el valor de la cadena se pasa directamente a la función, se vería así como una lambda completamente calificada.

ejemplo lambda vacío público() {
    función("valor", x -> x.toString());
}
qué atajo puede tener Java para que se vea String::toString; dice "proporcionar la instancia del objeto" en tiempo de ejecución.

Si lo expandes completamente a una interfaz anónima, se ve así. El xparámetro se pone a disposición y no se cierra. Por lo tanto, es una lambda en lugar de un cierre.

ejemplo lambda vacío público() {
    función("valor", nueva Función<Cadena, Cadena>() {
      @Anular
      // toma el argumento como parámetro, no necesita cerrar 
      encima de eso
      aplicar cadena pública (cadena x) {
        devolver x.toString();
      }
    });
}
Resumen
Oracle describe los cuatro tipos de referencia de métodos ( http://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html ) de la siguiente manera:

Amable

Ejemplo

Referencia a un método estático

ContainingClass::staticMethodName

Referencia a un método de instancia de un objeto particular.

ContainingObject::instanceMethodName

Referencia a un método de instancia de un objeto arbitrario de un tipo particular

ContainingType::methodName

Referencia a un constructor.

ClassName::new

Pero las descripciones de los métodos de instancia son simplemente confusas. ¿Qué diablos es un método de instancia de un objeto arbitrario de un tipo particular? ¿ No son todos los objetos de un tipo particular? ¿Por qué es importante que el objeto sea arbitrario ?

Prefiero pensar en el primero como un método de instancia de un objeto específico conocido de antemano y en el segundo como un método de instancia de un objeto arbitrario que se proporcionará más adelante. Curiosamente, esto significa que el primero es un cierre y el segundo es una lambda . Uno está atado y el otro desatado . La distinción entre una referencia de método que cierra algo (un cierre) y otra que no (una lambda) puede ser un poco académica, pero al menos es una definición más formal que la inútil descripción de Oracle.

Amable

Sintaxis

Ejemplo

Referencia a un método estático

Class::staticMethodName

String::valueOf

Referencia a un método de instancia de un objeto específico.

object::instanceMethodName

x::toString

Referencia a un método de instancia de un objeto arbitrario proporcionado más adelante

Class::instanceMethodName

String::toString

Referencia a un constructor.

ClassName::new

String::new

o como lambdas equivalentes:

Amable

Sintaxis

como lambda

Referencia a un método estático

Class::staticMethodName

(s) -> String.valueOf(s)

Referencia a un método de instancia de un objeto específico.

object::instanceMethodName

() -> "hello".toString()

Referencia a un método de instancia de un objeto arbitrario proporcionado más adelante

Class::instanceMethodName

(s) -> s.toString()

Referencia a un constructor.

ClassName::new

() -> new String()

Tenga en cuenta que la sintaxis de una staticreferencia de método es muy similar a una referencia a un método de instancia de una clase. El compilador determina cuál usar revisando cada método estático aplicable y cada método de instancia aplicable. Si encontrara una coincidencia para ambos, el resultado sería un error de compilación.

Puedes pensar en todo como una transformación de una referencia de método a una lambda. El compilador proporciona la función de transformación que toma una referencia de método y un tipo de destino y puede derivar una lambda.
