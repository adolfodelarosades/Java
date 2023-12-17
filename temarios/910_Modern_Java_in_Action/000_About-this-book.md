# Sobre este libro
En pocas palabras, las nuevas características de Java 8 junto con los cambios (menos obvios) en Java 9 son el cambio más grande en Java en el mundo desde hace 21 años que se lanzó Java 1.0. No se ha eliminado nada, por lo que todo el código Java existente continúa funcionando, pero el las nuevas funciones proporcionan nuevos modismos y patrones de diseño potentes para ayudarle a escribir código más claro y conciso. Al principio podrías pensar (como ocurre con todas las funciones nuevas): "¿Por qué están cambiando mi lenguaje nuevamente?" Pero luego, después de un poco de práctica, llega la revelación de que acaba de utilizar las funciones para escribir código más corto y claro en la mitad del tiempo que esperaba, y se da cuenta nunca más podrás volver al “antiguo Java”.

La segunda edición de este libro, ***Modern Java in Action: Lambdas, Streams, Functional and Reactive Programming***, está escrita para ayudarle a superar esa joroba inicial de "suena bien en principio, pero todo es un poco nuevo y desconocido" y en codificar como un nativo.

"Tal vez", se podría pensar, "pero las lambdas, la programación funcional, ¿no son ese el tipo de cosas que usan sandalias barbudas?" ¿De qué hablan los académicos en sus torres de marfil? Podrían serlo, pero Java 8 ha incorporado el equilibrio justo de ideas en Java para obtener muchas de sus ventajas de una manera que sea comprensible para los programadores comunes de Java. Y este libro cuenta la historia desde el punto de vista del programador común, con un ocasional "cómo surgió esto" para ponerlo en perspectiva.

"Lambdas, ¡eso me suena a griego!" Sí, lo hace, pero es una gran idea que le permite escribir programas Java concisos. Algunos de ustedes están familiarizados con los controladores de eventos y las devoluciones de llamadas, donde registran un objeto que contiene un método que se utilizará cuando algún evento sucede. Lambdas hace que este tipo de idea sea mucho más utilizable en Java. En pocas palabras, lambdas y sus amigos, método referencias, brindan la capacidad de pasar código o métodos de manera concisa como argumentos para ejecutarse en medio de una acción demás. Verás en este libro cómo esta idea ocurre con más frecuencia de lo que piensas: desde simplemente parametrizar una clasificación método con código para hacer la comparación con la expresión de consultas complejas sobre colecciones de datos utilizando la nueva API Streams.

"Streams... ¿qué son?" Son una gran incorporación nueva a Java 8. Se comportan como colecciones pero tienen varias ventajas que permiten nuevos estilos de programación. Primero, si alguna vez ha programado utilizando un lenguaje de consulta de bases de datos como SQL, reconocerá que permite escribir consultas en unas pocas líneas que ocuparían muchas líneas en Java. Los streams de Java 8 admiten este conciso estilo de programación de consultas de bases de datos, ¡pero con sintaxis Java y sin necesidad de saber nada sobre bases de datos! En segundo lugar, los streams son diseñados para que no todos sus datos necesiten estar en la memoria (o incluso computarse) a la vez. Por lo tanto, puede procesar secuencias que son demasiado grande para caber en la memoria de su computadora. Pero Java 8 puede optimizar las operaciones en flujos de una manera que Java no puede hacer con las colecciones, por ejemplo. Por ejemplo, puede agrupar varias operaciones en el mismo flujo para que los datos se recorran solo una vez en lugar de ser costoso, atravesándolo varias veces. Aún mejor, Java puede paralelizar automáticamente las operaciones de flujo (a diferencia de las colecciones).

"Y programación de estilo funcional, ¿qué es eso?" Es otro estilo de programación, al igual que la programación orientada a objetos, pero centrado en el uso de funciones como valores, tal como mencionamos anteriormente cuando hablamos de lambdas.

Lo bueno de Java 8 es que incorpora muchas de las mejores ideas de la programación funcional en ela conocida sintaxis Java. Las excelentes opciones de diseño le permiten ver la programación de estilo funcional en Java 8 como un conjunto adicional de patrones de diseño y modismos que le permitirán escribir código más claro y conciso en menos tiempo. Piense en ello como si tuviera una gama más amplia de armas en su arsenal de programación.

Oh, sí, además de estas características que se basan en grandes adiciones conceptuales a Java, también explicamos muchas otras funciones útiles. Funciones y actualizaciones de Java 8, como métodos predeterminados, la nueva clase **`Optional`**, **`CompletableFuture`** y la nueva API de Date y Time.

Y están las adiciones de Java 9: ​​un nuevo sistema de módulos, soporte para programación reactiva a través de Flow API y varias otras mejoras.

Pero bueno, esto es una descripción general y es hora de que te dejemos leer el libro.

## Cómo está organizado este libro: una hoja de ruta(roadmap)

***Modern Java in Action*** se divide en seis partes: “Fundamentos”, “Procesamiento de datos de estilo funcional con secuencias”, “Programación eficaz con streams y lambdas”, “Java cotidiano”, “Simultaneidad de Java mejorada” y “Programación funcional y evolución futura de Java”. Mientras Le recomendamos encarecidamente que lea primero los capítulos de las dos primeras partes (y en orden porque muchos de los conceptos presentados (basado en capítulos anteriores), las cuatro partes restantes pueden leerse razonablemente de forma independiente. La mayoría de los capítulos incluyen varios cuestionarios para ayudarle a trabajar en el material.

La primera parte del libro proporciona los fundamentos que le ayudarán a empezar con las nuevas ideas de Java introducidas en Java 8. Al final de esta primera parte, comprenderá completamente qué son las expresiones lambda y podrá escribir código que es lo suficientemente conciso y flexible para adaptarse fácilmente a los requisitos cambiantes.

* En el **Capítulo 1**, resumimos los principales cambios en Java (expresiones lambda, referencias de métodos, streams y métodos predeterminados) y configuramos el Escena para el libro.

* En el **Capítulo 2**, aprenderá sobre la parametrización del comportamiento, un patrón de desarrollo de software en el que Java 8 depende en gran medida y es el motivación para expresiones lambda.
  
* El **Capítulo 3** ofrece una explicación completa, con ejemplos de código y pruebas en cada paso, de los conceptos de expresiones lambda y métodos de referencia.

La segunda parte de este libro es una exploración profunda de la nueva API Streams, que le permite escribir código potente que procesa una colección de datos de forma declarativa. Al final de esta segunda parte, comprenderá completamente qué transmite son y cómo puedes usarlos en tu código base para procesar una colección de datos de manera concisa y eficiente.

* El **Capítulo 4** presenta el concepto de stream y explica cómo se compara con una colección.

* El **Capítulo 5** investiga en detalle las operaciones de stream disponibles para expresar consultas sofisticadas de procesamiento de datos. Verás muchos patrones como filtering, slicing, finding, matching, mapping y reducing.

* El **Capítulo 6** cubre los collectors, una característica de Streams API que le permite expresar consultas de procesamiento de datos aún más complejas.

* En el **Capítulo 7**, aprenderá cómo los streams pueden ejecutarse automáticamente en paralelo y aprovechar sus arquitecturas multinúcleo. Además, aprenderá sobre varios errores que se deben evitar al utilizar transmisiones paralelas de manera correcta y efectiva.

La tercera parte de este libro explora varios temas de Java 8 y Java 9 que le harán más eficaz en el uso de Java y mejorará su código base con modismos modernos. Debido a que está orientado hacia ideas de programación más avanzadas que hemos organizado, Nada más adelante en el libro depende de las técnicas aquí descritas.

* El **Capítulo 8** es un capítulo nuevo para la segunda edición y explora Collection API Enhancements de Java 8 y Java 9. Cubre el uso fábricas de colecciones y aprender nuevos patrones idiomáticos para trabajar con colecciones List y Set junto con patrones idiomáticos que involucra Map.

* El **Capítulo 9** explora cómo puede mejorar su código existente utilizando nuevas características de Java 8 y algunas recetas. Además, explora aspectos vitales Técnicas de desarrollo de software como patrones de diseño, refactorización, pruebas y depuración.

* El **Capítulo 10** también es nuevo para la segunda edición. Explora la idea de basar una API en un lenguaje de dominio específico - domain-specific language (DSL). Esto no es solo una forma poderosa de diseñar API, pero que se está volviendo cada vez más popular y ya está apareciendo en el mercado. Clases de Java como **`Comparators`**, **`Stream`** y **`Collectors`**.

La cuarta parte de este libro explora varias características nuevas en Java 8 y Java 9 centradas en hacerlo más fácil y más confiable para codificar sus proyectos. Comenzamos con dos API introducidas en Java 8.

* El **Capítulo 11** cubre la clase **`java.util.Optional`**, que le permite diseñar mejores API y reducir las excepciones de puntero **`null`**.

* El **Capítulo 12** explora la API de Date y Time, que mejora en gran medida las API anteriores propensas a errores para trabajar con fechas y horas.

* En el **Capítulo 13**, aprenderá qué son los métodos default, cómo puede usarlos para desarrollar API de manera compatible, algunos patrones de uso prácticos, y reglas para utilizar los métodos predeterminados de forma eficaz.

* El **Capítulo 14** es nuevo en esta segunda edición y explora el Java Module System, una mejora importante en Java 9 que permite sistemas enormes, ser modularizado de una manera documentada y ejecutable, en lugar de ser "simplemente una colección desordenada de paquetes".

La quinta parte de este libro explora las formas más avanzadas de estructurar programas concurrentes en Java, más allá de las ideas de procesamiento paralelo fácil de usar para transmisiones presentadas en los capítulos 6 y 7. Capítulo 15 es nuevo en esta segunda edición y cubre la idea general de las API asincrónicas, incluidas las ideas de Futures y Protocolo de publicación-suscripción detrás de la programación reactiva y encapsulado en la API de flujo de Java 9.

* El **Capítulo 16** explora **`CompletableFuture`**, que le permite expresar cálculos asincrónicos complejos de forma declarativa, en paralelo al diseño de la API Streams.

* El **Capítulo 17** es nuevamente nuevo en esta segunda edición y explora la API Java 9 Flow en detalle, enfocándose en la programación reactiva práctica.

En la sexta y última parte de este libro, retrocedemos un poco con un tutorial de introducción a la escritura de estilo funcional eficaz. Programas en Java, junto con una comparación de las características de Java 8 con las de Scala.

* El **Capítulo 18** ofrece un tutorial completo sobre programación funcional, presenta parte de su terminología y explica cómo escribir programas de estilo funcional, programas en Java.

* El **Capítulo 19** cubre técnicas de programación funcional más avanzadas, incluidas funciones de orden superior, cubre estructuras de datos persistentes, listas diferidas y coincidencia de patrones. Puede ver este capítulo como una combinación de técnicas prácticas para aplicar en su código base como así como información académica que te convertirá en un programador con más conocimientos.

* El Capítulo 20 sigue analizando cómo se comparan las características de Java 8 con las características del lenguaje Scala, un lenguaje que, como Java, se implementa encima de la JVM y que ha evolucionado rápidamente para amenazar algunos aspectos del nicho de Java en el ecosistema del lenguaje de programación.

* En el capítulo 21, revisamos el viaje de aprendizaje sobre Java 8 y el suave impulso hacia la programación de estilo funcional. Además, nosotros especular sobre qué futuras mejoras y grandes características nuevas pueden haber en el proceso de Java más allá de Java 8, Java 9 y el pequeño Adiciones en Java 10.

Finalmente, hay cuatro apéndices, que cubren una serie de otros temas relacionados con Java 8. El Apéndice A resume las características menores del lenguaje Java 8 que no discutimos en el libro. El Apéndice B ofrece una descripción general de otras adiciones principales a la biblioteca Java que pueden resultarle útiles. Apéndice C es una continuación de la parte 2 y analiza los usos avanzados de los streams. Apéndice D explora cómo el compilador de Java implementa expresiones lambda detrás de escena.

### Sobre el código

Todo el código fuente en listados o en texto está en un fixed-width font like this para separarlo del texto normal. Muchas de las listas están acompañadas de anotaciones de código que resaltan conceptos importantes.

El código fuente de todos los ejemplos funcionales del libro y las instrucciones para ejecutarlos están disponibles en un repositorio de GitHub y como descarga a través del sitio web del libro. Ambos enlaces al código fuente se pueden encontrar en www.manning.com/books/modern-java-in-action.

### Foro de libros

La compra de Modern Java in Action incluye acceso gratuito a un foro web privado dirigido por Manning Publications donde puede hacer comentarios sobre el libro. pregunta tecnico preguntas y recibir ayuda de los autores y de otros usuarios. Para acceder al foro, vaya a https://forums.manning.com/forums/modern-java-in-action. También puede obtener más información sobre los foros de Manning y las reglas de conducta en https://forums.manning.com/forums/about.

El compromiso de Manning con nuestros lectores es proporcionar un lugar donde se establezca un diálogo significativo entre lectores individuales y entre lectores y autores pueden tener lugar. No es un compromiso de ningún monto específico de participación por parte del autores, cuya contribución al foro sigue siendo voluntaria (y no remunerada). Le sugerimos que intente preguntarles a los autores algunas preguntas desafiantes. ¡Preguntas para que no se desvíen sus intereses! Se podrá acceder al foro y a los archivos de debates anteriores desde la página web del editor sitio web mientras el libro esté impreso.
