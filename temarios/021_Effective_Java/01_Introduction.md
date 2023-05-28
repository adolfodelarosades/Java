# Capítulo 1 Introducción
ESTE libro está diseñado para ayudarlo a hacer un uso eficaz del lenguaje de programación Java y sus bibliotecas fundamentales: ,java.lang y java.util, java.ioy subpaquetes como java.util.concurrenty java.util.function. Otras bibliotecas se discuten de vez en cuando.

Este libro consta de noventa artículos, cada uno de los cuales transmite una regla. Las reglas capturan prácticas generalmente consideradas beneficiosas por los mejores y más experimentados programadores. Los artículos están agrupados libremente en once capítulos, cada uno de los cuales cubre un aspecto amplio del diseño de software. El libro no está destinado a ser leído de cabo a rabo: cada elemento se sostiene por sí solo, más o menos. Los elementos tienen muchas referencias cruzadas para que pueda trazar fácilmente su propio curso a través del libro.

Se agregaron muchas características nuevas a la plataforma desde que se publicó la última edición de este libro. La mayoría de los elementos de este libro utilizan estas funciones de alguna manera. Esta tabla le muestra adónde ir para la cobertura principal de las funciones clave:

Característica

Elementos

Liberar

lambdas

Artículos 42 – 44

Java 8

Corrientes

Artículos 45 – 48

Java 8

Opcionales

artículo 55

Java 8

Métodos predeterminados en las interfaces

artículo 21

Java 8

try-con-recursos

Ítem ​​9

Java 7

@SafeVarargs

artículo 32

Java 7

Módulos

artículo 15

Java 9

La mayoría de los elementos se ilustran con ejemplos de programas. Una característica clave de este libro es que contiene ejemplos de código que ilustran muchos patrones de diseño y modismos. En su caso, se hacen referencias cruzadas al trabajo de referencia estándar en esta área [ Gamma95 ].

Muchos elementos contienen uno o más ejemplos de programas que ilustran alguna práctica que debe evitarse. Dichos ejemplos, a veces conocidos como antipatrones, están claramente etiquetados con un comentario como // Never do this!. En cada caso, el ítem explica por qué el ejemplo es malo y sugiere un enfoque alternativo.

Este libro no es para principiantes: asume que ya te sientes cómodo con Java. Si no es así, considere uno de los muchos buenos textos introductorios, como Java Precisely [ Sestoft16 ] de Peter Sestoft. Si bien Java Efectivo está diseñado para ser accesible a cualquier persona con un conocimiento práctico del lenguaje, debería proporcionar elementos de reflexión incluso para los programadores avanzados.

La mayoría de las reglas de este libro se derivan de unos pocos principios fundamentales. La claridad y la sencillez son de suma importancia. El usuario de un componente nunca debe sorprenderse por su comportamiento. Los componentes deben ser lo más pequeños posible pero no más pequeños. (Como se usa en este libro, el término componente se refiere a cualquier elemento de software reutilizable, desde un método individual hasta un marco complejo que consta de varios paquetes). El código debe reutilizarse en lugar de copiarse. Las dependencias entre los componentes deben mantenerse al mínimo. Los errores deben detectarse lo antes posible después de que se cometen, idealmente en tiempo de compilación.

Si bien las reglas de este libro no se aplican el 100 por ciento del tiempo, sí caracterizan las mejores prácticas de programación en la gran mayoría de los casos. No debe seguir estas reglas servilmente, sino violarlas solo ocasionalmente y por una buena razón. Aprender el arte de la programación, como la mayoría de las otras disciplinas, consiste en aprender primero las reglas y luego aprender cuándo romperlas.

En su mayor parte, este libro no trata sobre el rendimiento. Se trata de escribir programas que sean claros, correctos, utilizables, robustos, flexibles y mantenibles. Si puede hacer eso, generalmente es una cuestión relativamente simple obtener el rendimiento que necesita ( Ítem 67 ). Algunos elementos abordan problemas de rendimiento y algunos de estos elementos proporcionan cifras de rendimiento. Estos números, que se introducen con la frase "En mi máquina", deben considerarse aproximados en el mejor de los casos.

Por si sirve de algo, mi máquina es un Intel Core i7-4770K de cuatro núcleos de 3,5 GHz de fabricación casera con 16 gigabytes de RAM DDR3-1866 CL9, que ejecuta la versión Zulu 9.0.0.15 de OpenJDK de Azul, sobre Microsoft Windows 7 Professional SP1 (64- poco).

Cuando se analizan las características del lenguaje de programación Java y sus bibliotecas, a veces es necesario referirse a versiones específicas. Por conveniencia, este libro usa apodos en lugar de nombres oficiales de publicación. Esta tabla muestra la asignación entre nombres de versión y apodos:

Nombre de lanzamiento oficial

Apodo

JDK 1.0. X

Java 1.0

JDK 1.1. X

java 1.1

Plataforma Java 2, edición estándar, v1.2

Java 2

Plataforma Java 2, edición estándar, v1.3

Java 3

Plataforma Java 2, edición estándar, v1.4

Java 4

Plataforma Java 2, edición estándar, v5.0

Java 5

Plataforma Java, edición estándar 6

Java 6

Plataforma Java, edición estándar 7

Java 7

Plataforma Java, edición estándar 8

Java 8

Plataforma Java, edición estándar 9

Java 9

Los ejemplos son razonablemente completos, pero favorecen la legibilidad sobre la exhaustividad. Usan libremente clases de paquetes java.utily java.io. Para compilar ejemplos, es posible que deba agregar una o más declaraciones de importación u otro modelo similar. El sitio web del libro, http://joshbloch.com/effectivejava, contiene una versión ampliada de cada ejemplo, que puede compilar y ejecutar.

En su mayor parte, este libro utiliza términos técnicos tal como están definidos en The Java Language Specification, Java SE 8 Edition [ JLS ]. Algunos términos merecen una mención especial. El lenguaje admite cuatro tipos de tipos: interfaces (incluidas las anotaciones ), clases (incluidas las enumeraciones ), matrices y primitivas . Los tres primeros se conocen como tipos de referencia . Las instancias de clase y las matrices son objetos ; los valores primitivos no lo son. Los miembros de una clase consisten en sus campos , métodos , clases miembro yinterfaces de miembros. La firma de un método consta de su nombre y los tipos de sus parámetros formales; la firma no incluye el tipo de devolución del método.

Este libro usa algunos términos de manera diferente a la especificación del lenguaje Java . A diferencia de la especificación del lenguaje Java , este libro utiliza la herencia como sinónimo de subclases . En lugar de usar el término herencia para interfaces, este librosimplemente establece que una clase implementa una interfaz o que una interfaz se extiende a otra. Para describir el nivel de acceso que se aplica cuando no se especifica ninguno, este libro utiliza el paquete privado tradicional en lugar del acceso al paquete técnicamente correcto [JLS, 6.6.1].

Este libro utiliza algunos términos técnicos que no están definidos en la especificación del lenguaje Java . El término API exportada , o simplemente API , se refiere a las clases, interfaces, constructores, miembros y formularios serializados mediante los cuales un programador accede a una clase, interfaz o paquete. (El término API , que es la abreviatura de interfaz de programación de aplicaciones , se usa con preferencia al término interfaz , que de otro modo sería preferible , para evitar confusiones con la construcción del lenguaje de ese nombre). Un programador que escribe un programa que usa una API se conoce como un usuario de la API. Una clase cuya implementación utiliza una API es un cliente de la API.

Las clases, las interfaces, los constructores, los miembros y los formularios serializados se conocen colectivamente como elementos API . Una API exportada consta de los elementos de la API a los que se puede acceder fuera del paquete que define la API. Estos son los elementos de la API que cualquier cliente puede usar y el autor de la API se compromete a admitir. No por casualidad, también son los elementos para los que la utilidad Javadoc genera documentación en su modo de funcionamiento predeterminado. En términos generales, la API exportada de un paquete consiste en los miembros y constructores públicos y protegidos de cada clase pública o interfaz en el paquete.

En Java 9, se agregó un sistema de módulos a la plataforma. Si una biblioteca hace uso del sistema de módulos, su API exportada es la unión de las API exportadas de todos los paquetes exportados por la declaración del módulo de la biblioteca.
