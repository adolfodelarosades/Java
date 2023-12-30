# Capítulo 3. Lambdas en profundidad
En esta sección, veremos las cosas con un poco más de detalle y hablaremos sobre algunos temas relacionados, como:

Interfaces funcionales
Referencias de métodos y constructores.
Alcance y variables efectivamente finales
Transparencia de excepción
Las diferencias entre lambdas y cierres.
Como hemos hablado sobre cómo las lambdas no son solo azúcar sintáctico, veremos el código de bytes que producen las lambdas.
Interfaces funcionales
Java trata lambdas como una instancia de un tipo de interfaz. Formaliza esto en algo que llama interfaces funcionales . Una interfaz funcional es solo una interfaz con un único método. Java llama al método "método funcional", pero a menudo se utiliza el nombre "método abstracto único" o SAM.

Todas las interfaces de método único existentes como Runnabley Callableen el JDK ahora son interfaces funcionales y las lambdas se pueden usar en cualquier lugar donde se use una interfaz de método abstracto único. De hecho, son las interfaces funcionales las que permiten lo que se llama escritura de destino ; Proporcionan suficiente información para que el compilador infiera argumentos y tipos de retorno.

@Interfaz funcional
Oracle ha introducido una nueva anotación @FunctionalInterfacepara marcar una interfaz como tal. Básicamente es para comunicar la intención, pero también permite al compilador realizar algunas comprobaciones adicionales.

Por ejemplo, esta interfaz compila:

interfaz pública FunctionalInterfaceExample {
 
    // compila bien
 
}
pero cuando indicas que debería ser una interfaz funcional agregando la nueva anotación,

@FunctionalInterface // <- error aquí
 
    interfaz pública FunctionalInterfaceExample {
 
      // no compila
 
}
el compilador generará un error. Nos dice "El ejemplo no es una interfaz funcional" ya que "no se encontró ningún método abstracto". A menudo, el IDE también dará una pista, IntelliJ dirá algo como "no se encontró ningún método de destino". Está insinuando que dejamos de lado el método funcional. Un "método abstracto único" necesita un método único abstract.

Entonces, ¿qué pasa si intentamos agregar un segundo método a la interfaz?

@FunctionalInterface
 
interfaz pública FunctionalInterfaceExample {
 
    void apply();
    anular ilegal(); // <- error aquí
 
}
El compilador volverá a generar un error, esta vez con un mensaje como "se encontraron múltiples métodos abstractos no primordiales". Las interfaces funcionales solo pueden tener un método.

Extensión
¿Qué pasa con el caso de una interfaz que extiende otra interfaz?

Creemos una nueva interfaz funcional llamada Ay otra llamada Bque se extiende A. La   Binterfaz sigue siendo una interfaz funcional. Hereda el applymétodo de los padres como era de esperar:

@FunctionalInterface
 
interfaz A {
 
    abstract void apply();
}
 

la interfaz B extiende A {
 
}
Si desea aclarar esto, también puede anular el método funcional del padre:

@FunctionalInterface
 
interfaz A {
 
    abstract void apply();
}
 

interfaz B extiende A {
 
    @Override
 
    abstract void apply();
}
Podemos verificar que funciona como una interfaz funcional si la usamos como lambda. Implementaremos un método para mostrar que se puede asignar una lambda a un tipo de A y un tipo de B a continuación. La implementación simplemente imprime "A"o "B".

@FunctionalInterface
 
interfaz pública A {
 
    void apply();
}
 

interfaz pública B extiende A {
 
    @Override
 
    void apply();
}
 

public static void main(String... args) {
 
   A a = () -> System.out.println("A");
   B b = () -> System.out.println("B");
}
Sin embargo , no puede agregar un nuevo abstractmétodo a la interfaz de extensión (B), ya que el tipo resultante tendría dos abstractmétodos y el IDE nos advertiría y el compilador generaría un error.

@FunctionalInterface
 
interfaz pública A {
 
    void apply();
}
 

interfaz pública B extiende A {
 
    void ilegal(); // <- no puedo hacer esto
 
}
 

public static void main(String... args) {
 
    A a = () -> System.out.println("A");
    B b = () -> System.out.println("B"); // <- error
 
}
En ambos casos, puedes anular los métodos Objectsin causar problemas. También puede agregar métodos predeterminados (también nuevos a partir de Java 8). Como probablemente era de esperar, no tiene sentido intentar marcar una clase abstracta como una interfaz funcional.

Otras mejoras de la interfaz
A las interfaces generalmente se les han agregado algunas características nuevas, que incluyen:

Métodos predeterminados (métodos de extensión virtual)
Métodos de interfaz estática
Y un montón de nuevas interfaces funcionales en el java.util.functionpaquete; cosas como FunctionyPredicate
Resumen
En esta sección hemos hablado de cómo cualquier interfaz con un único método es ahora una "interfaz funcional" y que el método único a menudo se denomina "método funcional" o SAM (por método abstracto único).

Observamos la nueva anotación y vimos un par de ejemplos de cómo las interfaces JDK existentes se adaptan a la anotación Runnabley Callablese han adaptado a ella.

También introdujimos la idea de tipificación de destino , que es cómo el compilador puede usar la firma de un método funcional para ayudar a determinar qué lambdas se pueden usar y dónde. Le echamos un vistazo a esto un poco, ya que hablaremos de ello más adelante en la sección de inferencia de tipos.

Discutimos algunos ejemplos de interfaces funcionales, cómo el compilador y el IDE pueden ayudarnos cuando cometemos errores y tuvimos una idea de los tipos de errores que podemos encontrar. Cosas como agregar más de un método a una interfaz funcional. También vimos las excepciones a esta regla, es decir, cuando anulamos métodos Objecto implementamos métodos predeterminados.

Echamos un vistazo rápido a la herencia de la interfaz y cómo eso afecta las cosas y mencionamos algunas de las otras mejoras de la interfaz que cubriremos más adelante.

Un punto importante a destacar aquí es la idea de que en cualquier lugar donde se use una interfaz funcional, ahora se puede usar una lambda. Lambdas se pueden utilizar en lugar de implementaciones anónimas de la interfaz funcional. Usar una lambda en lugar de la clase anónima puede parecer azúcar sintáctico, pero en realidad son bastante diferentes. Consulte la sección Funciones versus clases para obtener más detalles.
