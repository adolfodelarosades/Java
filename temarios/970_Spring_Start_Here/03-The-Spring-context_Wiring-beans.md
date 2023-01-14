# 3 El Spring context: Wiring beans

* 3 The Spring context: Wiring beans
   * 3.1 Implementing relationships among beans defined in the configuration file
      * Wiring the beans using a direct method call between the @Bean methods
      * Wiring the beans using the @Bean annotated method’s parameters
   * 3.2 Using the @Autowired annotation to inject beans
      * Using @Autowired to inject the values through the class fields
      * Using @Autowired to inject the values through the constructor
      * Using dependency injection through the setter
   * 3.3 Dealing with circular dependencies
   * 3.4 Choosing from multiple beans in the Spring context

Este capítulo cubre

Estableciendo relaciones entre frijoles
Usando la inyección de dependencia
Accediendo a los beans desde el contexto de Spring a través de la inyección de dependencia
En el capítulo 2, discutimos el contexto de Spring: el lugar en la memoria de la aplicación donde agregamos las instancias de objetos que queremos que Spring administre. Debido a que Spring usa el principio IoC, como discutimos en el capítulo 1, debemos decirle a Spring qué objetos de nuestra aplicación necesita controlar. Spring necesita controlar algunos de los objetos de nuestra aplicación para aumentarlos con las capacidades que proporciona. En el capítulo 2, aprendió varias formas de agregar instancias de objetos al contexto de Spring. También aprendió que agregamos estas instancias (beans) en el contexto de Spring para que Spring las reconozca.

En este capítulo, discutimos cómo acceder a los beans, que hemos agregado al contexto de Spring. En el capítulo 2, usamos el método getBean() de la instancia de contexto directamente para acceder a los beans. Pero en las aplicaciones, necesitamos referirnos de un bean a otro de manera sencilla, diciéndole a Spring que proporcione una referencia a una instancia desde su contexto donde la necesitamos. De esta forma establecemos relaciones entre los beans (un bean tendrá una referencia a otro para delegar llamadas cuando lo necesite). Como probablemente ya sepa, a menudo en cualquier lenguaje de programación orientado a objetos, un objeto necesita delegar responsabilidades específicas a otros al implementar su comportamiento, por lo que también necesita saber cómo establecer tales relaciones entre objetos cuando usa Spring como marco. .

Aprenderá que tiene más formas de acceder a los objetos que agregó al contexto de Spring y estudiaremos cada uno con ejemplos, imágenes y, por supuesto, fragmentos de código. Al final de este capítulo, tendrá las habilidades necesarias para usar el contexto de Spring y configurar beans y relaciones entre ellos. Esta habilidad es la base del uso de Spring; no encontrará ninguna aplicación de Spring en la que no aplicaría los enfoques que discutimos en este capítulo. Por esta razón, todo lo que se incluye en este libro (y todo lo que aprenderá de cualquier otro libro, artículo o videotutorial) se basa en la comprensión adecuada de los enfoques que analizamos en los capítulos 2 a 5.

En el capítulo 2, aprendió a usar la anotación @Bean para agregar beans en el contexto de Spring. En la sección 3.1, comenzamos implementando una relación entre dos beans que definirá en la clase de configuración usando la anotación @Bean . Aquí discutimos dos formas de establecer las relaciones entre beans:

Vincule los beans llamando directamente a los métodos que los crean (a los que llamaremos cableado ).

Permita que Spring nos proporcione un valor usando un parámetro de método (que llamaremos cableado automático ).

Luego, en la sección 3.2, discutimos un tercer enfoque, que es una técnica respaldada por el principio IoC: inyección de dependencia(DI). Discutiremos cómo usar DI en Spring, aplicando la anotación @Autowiredpara implementar la relación entre dos beans (que también es un ejemplo de cableado automático). Usará estos dos enfoques juntos en proyectos del mundo real.

NOTA Puede pensar que los ejemplos de los capítulos 2 y 3 no se acercan lo suficiente al código de producción. ¡Al final, las aplicaciones reales no manejan loros y personas! Pero quiero comenzar sin problemas con los ejemplos más sencillos y asegurarme de que se concentre en estas sintaxis esenciales, que usará en prácticamente todas las aplicaciones de Spring. De esta manera, me aseguro de que comprenda correctamente cómo funcionan los enfoques discutidos y se concentre solo en ellos. A partir del capítulo 4, el diseño de nuestra clase se acercará más a lo que encontrará en los proyectos del mundo real.

3.1 Implementando relaciones entre beans definidos en el archivo de configuración
EnEn esta sección, aprenderá a implementar la relación entre dos beans definidos en los métodos de anotación de la clase de configuración con la anotación @Bean. A menudo encontrará este enfoque para establecer las relaciones entre beans utilizando la configuración de Spring. En el capítulo 2, discutimos que usamos la anotación @Bean para agregar beans al contexto Spring en los casos en los que no podemos cambiar la clase para la que queremos agregar el bean, por ejemplo, si la clase es parte del JDK. u otra dependencia. Y para establecer relaciones entre estos frijoles, debe aprender los enfoques que discutimos en esta sección. Discutiremos cómo funcionan estos enfoques, le daré los pasos que necesita para implementar las relaciones entre beans y luego aplicaremos estos pasos con proyectos de código pequeños.

Digamos que tenemos dos instancias en el contexto de Spring: un loro y una persona. Crearemos y agregaremos estas instancias al contexto. Queremos que la persona sea dueña del loro. En otras palabras, necesitamos vincular las dos instancias. Este sencillo ejemplo nos ayuda a analizar los dos enfoques para vincular los beans en el contexto de Spring sin agregar una complejidad innecesaria y le permite concentrarse únicamente en las configuraciones de Spring.

Entonces, para cada uno de los dos enfoques (cableado y cableado automático), tenemos dos pasos (figura 3.1):

Agregue la persona y los frijoles loro al contexto de primavera (como aprendió en el capítulo 2).

Establecer una relación entre la persona y el loro.



Figura 3.1 Teniendo dos beans en el contexto Spring, queremos establecer una relación entre ellos. Hacemos esto para que un objeto pueda delegar en el otro la implementación de sus responsabilidades. Puede hacerlo utilizando un enfoque de cableado, lo que implica llamar directamente a los métodos que declaran los beans para establecer el vínculo entre ellos, o mediante el cableado automático. Utiliza las capacidades de inyección de dependencia del marco.

La figura 3.2 presenta la relación "tiene-A" entre la persona y el objeto loro de una manera más técnica que la figura 3.1.



Figura 3.2 Implementando la relación entre los beans. Este es un diagrama simplificado que representa la relación "tiene-A" entre los objetos Person y Parrot . Implementaremos esta relación a través del cableado y el cableado automático.

Antes de profundizar en cualquiera de los enfoques, comencemos con el primer ejemplo de este capítulo ("sq-ch3-ex1") para recordar cómo agregar los beans al contexto de Spring usando métodos anotados con @Bean en la clase de configuración, como discutido en la sección 2.2.1 (paso 1). Agregaremos una instancia de loro y una instancia de persona. Una vez que tenemos este proyecto listo, lo cambiamos para establecer la relación entre las dos instancias (paso 2). En la sección 3.1.1, implementamos el cableado, y en la sección 3.1.2, implementamos el cableado automático para los métodos anotados de @Bean . En el archivo pom.xml del proyecto Maven, agregamos la dependencia para el contexto de Spring tal como lo encuentra en el siguiente fragmento de código:

<dependencia> 
   <groupId>org.springframework</groupId> 
   <artifactId>spring-context</artifactId> 
   <version>5.2.7.RELEASE</version>
</dependencia>
Luego definimos una clase para describir el objeto Parrot y otra para describir la Persona . En el siguiente fragmento de código, encontrará la definición de la clase Parrot :

Loro de clase pública { 
 
  Nombre de cadena privada; 
 
  // Getters y setters 
 
  omitidos @Override 
  public String toString() { 
    return "Parrot: " + nombre; 
  }
}
En el siguiente fragmento de código, encontrará la definición de la clase Person :

public class Persona { 
 
  private String nombre; 
  loro loro privado; 
 
  // captadores y definidores omitidos
}
La siguiente lista le muestra cómo definir los dos beans usando la anotación @Bean en la clase de configuración.

Listado 3.1 Definiendo la Persona y los Parrot beans

@Configuration 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  } 
 
  @Bean 
  public Persona persona() { 
    Persona p = nueva Persona(); 
    p.setName("Ella"); 
    devolver p; 
  }
}
Ahora puede escribir una clase principal , como se presenta en la siguiente lista, y verificar que las dos instancias aún no estén vinculadas entre sí.

Listado 3.2 La definición de la clase Main

public class Main { 
 
  public static void main(String[] args) { 
    var context = new AnnotationConfigApplicationContext 
      (ProjectConfig.class);                      ❶
  
    Persona persona = 
      contexto.getBean(Persona.clase);              ❷
  
    Loro loro = 
      context.getBean(Parrot.class);              ❸
  
    System.out.println( 
      "Nombre de la persona: " + person.getName());      ❹
  
    System.out.println( 
      "Nombre del loro: " + loro.getNombre());      ❺
  
    System.out.println( 
      "Perico de la persona: " + person.getParrot());  ❻
  }}
❶ Crea una instancia del contexto Spring basada en la clase de configuración

❷ Obtiene una referencia al bean Person del contexto Spring

❸ Obtiene una referencia al frijol Parrot del contexto Spring

❹ Imprime el nombre de la persona para probar que el bean Person está en el contexto

❺ Imprime el nombre del loro para demostrar que el frijol loro está en el contexto

❻ Imprime el loro de la persona para demostrar que aún no existe una relación entre las instancias

Al ejecutar esta aplicación, verá una salida de consola similar a la que se presenta en el siguiente fragmento de código:

Nombre de la persona: Ella      ❶ 
Nombre del loro: Koko      ❷
Loro de persona: nulo    ❸
❶ El bean Person está en el contexto Spring.

❷ El frijol loro está en el contexto primaveral.

❸ No se establece la relación entre la persona y el loro.

Lo más importante a observar aquí es que el loro de la persona (tercera línea de salida) es nulo . Sin embargo, tanto la instancia de la persona como la del loro están en el contexto. Esta salida es nula , lo que significa que aún no hay una relación entre las instancias (figura 3.3).



Figura 3.3 Agregamos los dos beans en el contexto para configurar aún más la relación entre ellos.

3.1.1 Conectando los beans usando una llamada de método directo entre los métodos @Bean
EnEn esta sección, establecemos la relación entre las dos instancias de Person y Parrot . La primera forma (cableado) de lograr esto es llamar a un método desde otro en la clase de configuración. Encontrará que esto se usa a menudo porque es un enfoque directo. En el siguiente listado se encuentra el pequeño cambio que tuve que hacer en mi clase de configuración para establecer un vínculo entre la persona y el loro (ver figura 3.4). Para mantener todos los pasos separados y ayudarlo a comprender el código más fácilmente, también separé este cambio en un segundo proyecto: "sq-ch3-ex2".



Figura 3.4 Establecemos la relación entre los beans usando cableado directo. Este enfoque implica llamar directamente al método que devuelve el bean que desea configurar. Debe llamar a este método desde el que define el bean para el que establece la dependencia.

Listado 3.3 Haciendo un enlace entre los beans con una llamada directa al método

@Configuration 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  }

  @Bean 
  public Persona persona() { 
    Persona p = nueva Persona(); 
    p.setName("Ella"); 
    p.setParrot(loro());     ❶ 
    devolver p; 
  }
}
❶ Establecer la referencia del frijol loro al atributo loro de la persona

Al ejecutar la misma aplicación, observará que la salida cambió en la consola. Ahora encuentra (vea el siguiente fragmento) que la segunda línea muestra que Ella (la persona en el contexto de Primavera) es dueña de Koko (el loro en el contexto de Primavera):

Nombre de la persona: Ella
Loro de la persona: Loro: Koko     ❶
❶ Ahora observamos que se ha establecido la relación entre la persona y el loro.

Cada vez que enseño este enfoque en una clase, sé que algunos tienen la pregunta: ¿no significa esto que creamos dos instancias de Parrot (figura 3.5): una instancia que Spring crea y agrega a su contexto y otra cuando la persona() hace la llamada directa al método loro() ? No, en realidad solo tenemos una instancia de loro en esta aplicación en general.



Figura 3.5 Spring crea una instancia de loro cuando llama al primer método anotado de @Bean , loro() . Luego, Spring crea una instancia de persona cuando llama al segundo método anotado de @Bean person() . El segundo método, person() , llama directamente al primer método, parrot() . ¿Significa esto que se crean dos instancias de tipo loro ?

Puede parecer extraño al principio, pero Spring es lo suficientemente inteligente como para comprender que al llamar al método loro() , desea referirse al frijol loro en su contexto. Cuando usamos la anotación @Bean para definir beans en el contexto de Spring, Spring controla cómo se llaman los métodos y puede aplicar la lógica sobre la llamada al método (obtendrá más información sobre cómo Spring intercepta los métodos en el capítulo 6). Por el momento, recuerda que cuando el método person() llame al método parrot() , Spring aplicará la lógica, como se describe a continuación.

Si el frijol loro ya existe en el contexto, en lugar de llamar al método loro() , Spring tomará directamente la instancia de su contexto. Si el frijol loro aún no existe en el contexto, Spring llama al método loro() y devuelve el frijol (figura 3.6).



Figura 3.6 Cuando dos métodos anotados con @Bean se llaman entre sí, Spring sabe que desea crear un enlace entre los beans. Si el bean ya existe en el contexto (3A), Spring devuelve el bean existente sin reenviar la llamada al método @Bean . Si el bean no existe (3B), Spring crea el bean y devuelve su referencia.

En realidad, es bastante fácil probar este comportamiento. Simplemente agregue un constructor sin argumentos a la clase Parrot e imprima un mensaje en la consola desde allí. ¿Cuántas veces se imprimirá el mensaje en la consola? Si el comportamiento es correcto, verá el mensaje solo una vez. Hagamos este experimento. En el siguiente fragmento de código, cambié la clase Parrot para agregar un constructor sin argumentos:

Loro de clase pública { 
 
  Nombre de cadena privada; 
 
  public Parrot() { 
    System.out.println("Loro creado"); 
  } 
 
  // Getters y setters 
 
  omitidos @Override 
  public String toString() { 
    return "Parrot: " + nombre; 
  }
}
Vuelva a ejecutar la aplicación. La salida cambió (vea el siguiente fragmento de código), y ahora también aparece el mensaje "Loro creado". Observará que aparece solo una vez, lo que prueba que Spring administra la creación del bean y solo llama al método loro()una vez:

Parrot creado 
Nombre de la persona: Ella
Loro de la persona: Loro: Koko
3.1.2 Conectando los beans utilizando los parámetros del método anotado @Bean
EnEn esta sección, le mostraré un enfoque alternativo para llamar directamente al método @Bean . En lugar de llamar directamente al método que define el bean al que deseamos referirnos, agregamos un parámetro al método del tipo de objeto correspondiente y confiamos en Spring para que nos proporcione un valor a través de ese parámetro (figura 3.7). Este enfoque es un poco más flexible que el que discutimos en la sección 3.1.1. Con este enfoque, no importa si el bean al que queremos referirnos está definido con un método anotado con @Bean o usando una anotación de estereotipo como @Component(discutido en el capítulo 2). En mi experiencia, sin embargo, he observado que no es necesariamente esta flexibilidad lo que hace que los desarrolladores utilicen este enfoque; es principalmente el gusto de cada desarrollador lo que determina qué enfoque utilizan cuando trabajan con beans. No diría que uno es mejor que el otro, pero encontrará ambos enfoques en escenarios del mundo real, por lo que debe comprenderlos y poder usarlos.

Para demostrar este enfoque en el que usamos un parámetro en lugar de llamar directamente al método @Bean , tomaremos el código que desarrollamos en el proyecto "sq-ch3-ex2" y lo cambiaremos para establecer el vínculo entre las dos instancias en el contexto. . Separaré el nuevo ejemplo en un proyecto llamado "sq-ch3-ex3".



Figura 3.7 Al definir un parámetro para el método, le indicamos a Spring que nos proporcione un bean del tipo de ese parámetro de su contexto. Luego podemos usar el bean proporcionado ( loro ) al crear el segundo ( persona ). De esta manera establecemos la relación tiene-A entre los dos beans.

En el siguiente listado, encontrará la definición de la clase de configuración. Echa un vistazo al método person() . Ahora recibe un parámetro de tipo Parrot y configuro la referencia de ese parámetro al atributo de la persona devuelta. Al llamar al método, Spring sabe que tiene que encontrar un frijol loro en su contexto e inyectar su valor en el parámetro del método person() .

Listado 3.4 Inyectando dependencias de beans usando parámetros de los métodos

@Configuration 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  } 
 
  @Bean 
  public Persona persona(Loro loro) {      ❶ 
    Persona p = nueva Persona(); 
    p.setName("Ella"); 
    p.setParrot(loro); 
    devolver p; 
  }
}
❶ Spring inyecta el frijol loro en este parámetro.

En el párrafo anterior, usé la palabra "inyectar". Me refiero aquí a lo que en adelante llamaremos inyección de dependencia (DI). Como sugiere su nombre, DI es una técnica que implica que el marco establezca un valor en un campo o parámetro específico. En nuestro caso, Spring establece un valor particular en el parámetro del método person() cuando lo llama y resuelve una dependencia de este método. DI es una aplicación del principio IoC, e IoC implica que el marco controla la aplicación en la ejecución. Repito la figura 3.8, que también vio en el capítulo 1 (figura 1.4), aquí como un repaso de nuestra discusión sobre IoC.



Figura 3.8 Una aplicación que no usa el principio IoC controla la ejecución y hace uso de varias dependencias. Una aplicación que utiliza el principio IoC permite que una dependencia controle su ejecución. El DI es un ejemplo de control. El marco (una dependencia) establece un valor en un campo de un objeto de la aplicación.

A menudo usará DI (y no solo en Spring) porque es una forma muy cómoda de administrar las instancias de objetos que se crean y nos ayuda a minimizar el código que escribimos al desarrollar nuestras aplicaciones.

Al ejecutar la aplicación, el resultado en su consola será similar al siguiente fragmento de código. Observas que el loro Koko está efectivamente vinculado a lapersonaElla :

Parrot creado 
Nombre de la persona: Ella
Loro de la persona: Loro: Koko
3.2 Usando la anotación @Autowired para inyectar beans
EnEn esta sección, discutimos otro enfoque utilizado para crear un vínculo entre beans en el contexto de Spring. A menudo encontrará esta técnica, que se refiere a una anotación llamada @Autowired, cuando puede cambiar la clase para la que define el bean (cuando esta clase no es parte de una dependencia). Usando la anotación @Autowired , marcamos la propiedad de un objeto donde queremos que Spring inyecte un valor del contexto, y marcamos esta intención directamente en la clase que define el objeto que necesita la dependencia. Este enfoque hace que sea más fácil ver la relación entre los dos objetos que las alternativas que discutimos en la sección 3.1. Como verá, hay tres formas en las que podemos usar la anotación @Autowired :

Inyectando el valor en el campo de la clase, que sueles encontrar en ejemplos y pruebas de concepto

Inyectar el valor a través de los parámetros del constructor del enfoque de clase que usará con mayor frecuencia en escenarios del mundo real

Inyectar el valor a través del setter, que rara vez usará en código listo para producción

Discutamos esto con más detalle y escribamos un ejemplo para cada uno.

3.2.1 Usando @Autowired para inyectar los valores a través de los campos de clase
EnEn esta sección, comenzamos discutiendo la más simple de las tres posibilidades para usar @Autowired , que también es la que los desarrolladores usan a menudo en los ejemplos: usar la anotación sobre el campo (figura 3.9). Como aprenderá, incluso si este enfoque es muy sencillo, tiene sus pecados, por lo que evitamos usarlo al escribir código de producción. Sin embargo, verá que se usa a menudo en ejemplos, pruebas de concepto y pruebas de escritura, como veremos en el capítulo 15, por lo que necesita saber cómo usar este enfoque.



Figura 3.9 Usando la anotación @Autowired sobre el campo, le indicamos a Spring que proporcione un valor para ese campo a partir de su contexto. Spring crea los dos frijoles, persona y loro , e inyecta el objeto loro en el campo del frijol de tipo Persona .

Desarrollemos un proyecto ("sq-ch3-ex4") en el que anotemos el campo loro de la clase Persona con la anotación @Autowired para decirle a Spring que queremos inyectar un valor allí desde su contexto. Comencemos con las clases que definen nuestros dos objetos: Person y Parrot . Encontrará la definición de la clase Parrot en el siguiente fragmento de código:

@Component 
public class Parrot { 
 
  private String name = "Koko"; 
 
  // Getters y setters 
 
  omitidos @Override 
  public String toString() { 
    return "Parrot: " + nombre; 
  }
}
Usamos la anotación de estereotipo @Component aquí, que aprendiste en el capítulo 2 (sección 2.2.2). Usamos la anotación de estereotipo como una alternativa a la creación del bean usando la clase de configuración. Al anotar una clase con @Component , Spring sabe que tiene que crear una instancia de esa clase y agregarla a su contexto. El siguiente fragmento de código muestra la definición de la clase Person :

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
 
  @Autowired                    ❶ 
  loro loro privado; 
 
  // captadores y definidores omitidos
}
❶ Al anotar el campo con @Autowired, le indicamos a Spring que inyecte un valor apropiado de su contexto.

NOTA He usado anotaciones de estereotipos para agregar los beans en el contexto de Spring para este ejemplo. Podría haber definido los beans usando @Bean , pero la mayoría de las veces, en escenarios del mundo real, encontrará que @Autowired se usa junto con anotaciones de estereotipos, así que concentrémonos en el enfoque que sea más útil para usted.

Para continuar con nuestro ejemplo, definimos una clase de configuración. Llamaré a la clase de configuración ProjectConfig . Sobre esta clase, usaré la anotación @ComponentScanpara decirle a Spring dónde encontrar las clases que he anotado con @Component , como aprendiste en el capítulo 2 (sección 2.2.2). El siguiente fragmento de código muestra la definición de la clase de configuración:

@Configuration 
@ComponentScan(basePackages = "beans") 
clase pública ProjectConfig {
 
}
Luego usaré la clase principal, de la misma manera que lo hice en los ejemplos anteriores de este capítulo, para demostrar que Spring inyectó correctamente la referencia del frijol loro:

public class Main { 
 
  public static void main(String[] args) { 
    var context = new AnnotationConfigApplicationContext 
                        (ProjectConfig.class); 
 
    Persona p = contexto.getBean(Persona.clase); 
 
    System.out.println("Nombre de la persona: " + p.getName()); 
    System.out.println("Loro de la persona: " + p.getParrot()); 
  }
}
Esto imprimirá en la consola de la aplicación algo similar al resultado que se presenta a continuación. La segunda línea de la salida prueba que el loro (en mi caso, llamado Koko) pertenece a la persona bean (llamada Ella):

Nombre de la persona: Ella
Loro de la persona: Loro: Koko
¿Por qué no se desea este enfoque en el código de producción? No está del todo mal usarlo, pero debe asegurarse de que su aplicación sea mantenible y comprobable en el código de producción. Al inyectar el valor directamente en elcampo:

no tiene la opción de hacer que el campo sea definitivo (vea el siguiente fragmento de código), y de esta manera, asegúrese de que nadie pueda cambiar su valor después de la inicialización:

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
  loro loro final privada      
 
  @Autowired    ; ❶
 
}
❶ Esto no compila. No puede definir un campo final sin un valor inicial.

es más difícil administrar el valor usted mismo en la inicialización.

Como aprenderá en el capítulo 15, a veces necesita crear instancias de los objetos y administrar fácilmente las dependencias de las pruebas unitarias.

3.2.2 Usando @Autowired para inyectar los valores a través del constructor
ÉlLa segunda opción que tiene para inyectar valores en los atributos del objeto cuando Spring crea un bean es usar el constructor de la clase que define la instancia (figura 3.10). Este enfoque es el que se usa con más frecuencia en el código de producción y el que recomiendo. Le permite definir los campos como finales, asegurando que nadie pueda cambiar su valor después de que Spring los inicialice. La posibilidad de establecer los valores al llamar al constructor también lo ayuda cuando escribe pruebas unitarias específicas en las que no desea confiar en que Spring realice la inyección de campo por usted (pero más sobre este tema más adelante).



Figura 3.10 Cuando define un parámetro del constructor, Spring proporciona un bean de su contexto como un valor para ese parámetro cuando llama al constructor.

Podemos cambiar rápidamente la implementación del proyecto desde la sección 3.2.1 para usar la inyección de constructor en lugar de la inyección de campo. Solo necesita cambiar la clase de Persona , como se presenta en el siguiente listado. Debe definir un constructor para la clase y anotarlo con @Autowired . Ahora también podemos hacer que el campo de loros sea definitivo. No necesita realizar ningún cambio en su clase de configuración.

Listado 3.5 Inyectando los valores a través del constructor

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
 
  Loro loro final privado;    ❶
  
  @Autowired                       ❷ 
  Persona pública(Loro loro) { 
    this.parrot = loro; 
  } 
 
  // getters y setters omitidos
 
}
❶ Ahora podemos hacer que el campo sea final para garantizar que su valor no se pueda cambiar después de la inicialización.

❷ Usamos la anotación @Autowired sobre el constructor.

Para mantener todos los pasos y cambios, he separado este ejemplo en el proyecto "sq-ch3-ex5". Ya puede iniciar la aplicación y observar que muestra el mismo resultado que en el ejemplo de la sección 3.2.1. Como puede ver en el siguiente fragmento de código, la persona es propietaria del loro, por lo que Spring estableció el vínculo entre las dos instancias.correctamente:

Nombre de la persona: Ella
Loro de la persona: Loro: Koko
NOTA A partir de la versión 4.3 de Spring, cuando solo tiene un constructor en la clase, puede omitir escribir la anotación @Autowired .

3.2.3 Uso de inyección de dependencia a través del setter
Túno encontrará a menudo desarrolladores que apliquen el enfoque de usar el setter para la inyección de dependencia. Este enfoque tiene más desventajas que ventajas: es más difícil de leer, no le permite hacer que el campo sea definitivo y no lo ayuda a hacer que la prueba sea más fácil. Aun así, quería mencionar esta posibilidad. Es posible que lo encuentres en algún momento, y no quiero que te preguntes sobre su existencia en ese momento. Incluso si no es algo que recomiendo, lo he visto usado en un par de aplicaciones antiguas.

En el proyecto "sq-ch3-ex6", encontrará un ejemplo del uso de la inyección setter. Descubrirá que solo necesitaba cambiar la clase Person para implementar esto. En el siguiente fragmento de código, utilicé la anotación @Autowired en el setter:

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
 
  loro loro privado; 
 
  // captadores y 
 
  definidores omitidos @Autowired 
  public void setParrot(Loro loro) { 
    this.loro = loro; 
  }
}
Al ejecutar la aplicación, obtendrá el mismo resultado que los ejemplos discutidos anteriormente deestosección.

3.3 Manejo de dependencias circulares
Escómodo dejar que Spring construya y establezca las dependencias de los objetos de su aplicación. Dejar que Spring haga este trabajo por usted le evita escribir un montón de líneas de código y hace que la aplicación sea más fácil de leer y comprender. Pero Spring también puede confundirse en algunos casos. Un escenario que se encuentra a menudo en la práctica es generar una dependencia circular por error.

Una dependencia circular (figura 3.11) es una situación en la que, para crear un bean (llamémoslo Bean A), Spring necesita inyectar otro bean que aún no existe (Bean B). Pero el Bean B también solicita una dependencia del Bean A. Entonces, para crear el Bean B, Spring necesita primero tener el Bean A. Spring ahora está en un punto muerto. No puede crear Bean A porque necesita Bean B, y no puede crear Bean B porque necesita Bean A.



Figura 3.11 Una dependencia circular. Spring necesita crear un bean de tipo Parrot . Pero debido a que Parrot tiene como dependencia una Persona , Spring necesita primero crear una Persona . Sin embargo, para crear una Persona , Spring ya necesita haber construido un Parrot . La primavera está ahora en un callejón sin salida. No puede crear un Loro porque necesita una Persona , y no puede crear una Persona porque necesita un Loro .

Una dependencia circular es fácil de evitar. Solo necesita asegurarse de no definir objetos cuya creación dependa del otro. Tener dependencias de un objeto a otro como este es un mal diseño de clases. En tal caso, debe volver a escribir su código.

No creo conocer a ningún desarrollador de Spring que no haya creado al menos una vez una dependencia circular en una aplicación. Debe ser consciente de este escenario para que cuando lo encuentre, sepa su causa y lo resuelva rápidamente.

En el proyecto "sq-ch3-ex7", encontrará un ejemplo de dependencia circular. Como se presenta en los siguientes fragmentos de código, hice que la creación de instancias del frijol Parrot dependiera del bean Person y viceversa.

La clase de persona :

@Component 
public class Person { 
 
  private final Parrot loro; 
 
  @Autowired 
  public Person(Loro loro) {     ❶ 
    este.loro = loro; 
  } 
 
  // código omitido
 
}
❶ Para crear la instancia de Persona, Spring necesita tener un frijol Parrot.

La clase de loro :

public class Loro { 
 
  private String name = "Koko"; 
 
  persona final privada persona; 
 
  @Autowired 
  public Parrot(Persona persona) {     ❶ 
    esta.persona = persona; 
  } 
 
  // código omitido
}
❶ Para crear la instancia de Parrot, Spring necesita tener un bean Person.

Ejecutar la aplicación con esa configuración dará lugar a una excepción como la que se presenta en el siguiente fragmento:

Provocado por: org.springframework.beans.factory.BeanCurrentlyInCreationException: error al crear el bean con el nombre 'parrot': el bean solicitado está actualmente en creación: ¿hay una referencia circular irresoluble?
    en org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.beforeSingletonCreation(DefaultSingletonBeanRegistry.java:347)
Con esta excepción, Spring intenta decirle el problema que encontró. El mensaje de excepción es bastante claro: Spring trata con una dependencia circular y las clases que causaron la situación. Cada vez que encuentre una excepción de este tipo, debe ir a las clases especificadas por la excepción y eliminar la circular.dependencia.

3.4 Elegir entre múltiples beans en el contexto de Spring
EnEn esta sección, analizamos el escenario en el que Spring necesita inyectar un valor en un parámetro o campo de clase, pero tiene varios beans del mismo tipo para elegir. Digamos que tiene tres frijoles Parrot en el contexto de primavera. Configura Spring para inyectar un valor de tipo Parrot en un parámetro. ¿Cómo se comportará Spring? ¿Cuál de los beans del mismo tipo elegiría el marco para inyectar en tal escenario?

Dependiendo de su implementación, tiene los siguientes casos:

El identificador del parámetro coincide con el nombre de uno de los beans del contexto (que, recuerde, es el mismo que el nombre del método anotado con @Bean que devuelve su valor). En este caso, Spring elegirá el bean cuyo nombre es el mismo que el parámetro.

El identificador del parámetro no coincide con ninguno de los nombres de bean del contexto. Entonces tienes las siguientes opciones:

Marcaste uno de los beans como primario (como discutimos en el capítulo 2, usando la anotación @Primary ). En este caso, Spring seleccionará el bean principal para la inyección.

Puede seleccionar explícitamente un bean específico usando la anotación @Qualifier, que tratamos en este capítulo.

Si ninguno de los beans es primario y no usa @Qualifier , la aplicación fallará con una excepción, quejándose de que el contexto contiene más beans del mismo tipo y Spring no sabe cuál elegir.

Probemos más en el proyecto "sq-ch3-ex8", un escenario en el que tenemos más de una instancia de un tipo en el contexto de Spring. La siguiente lista muestra una clase de configuración que define dos instancias de Parrot y utiliza la inyección a través de los parámetros del método.

Listado 3.6 Usando inyección de parámetros para más de un bean

@Configuration 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot1() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  } 
 
  @Bean 
  public Loro loro2() { 
    loro p = nuevo loro(); 
    p.setName("Miki"); 
    devolver p; 
  } 
 
  @Bean 
  public Persona persona(Loro loro2) {      ❶ 
    Persona p = nueva Persona(); 
    p.setName("Ella"); 
    p.setLoro(loro2); 
    devolver p; 
  }
}
❶ El nombre del parámetro coincide con el nombre del frijol que representa al loro Miki.

Al ejecutar la aplicación con esta configuración, observaría una salida de la consola similar al siguiente fragmento de código. Observe que Spring vinculó al frijol persona con el loro llamado Miki porque el frijol que representa a este loro tiene el nombre loro2 (figura 3.12):

Parrot creado 
Nombre de la persona: Ella
Loro de la persona: Loro: Miki


Figura 3.12 Una forma de indicarle a Spring que le proporcione una instancia específica de su contexto, cuando el contexto contiene más de una instancia del mismo tipo, es confiar en el nombre de esta instancia. Simplemente nombra el parámetro de la misma manera que la instancia que te gustaría que Spring te proporcione.

En un escenario del mundo real, prefiero evitar confiar en el nombre del parámetro, que otro desarrollador podría refactorizar y cambiar fácilmente por error. Para sentirme más cómodo, suelo elegir un enfoque más visible para expresar mi intención de inyectar un bean específico: usar la anotación @Qualifier . Una vez más, en mi experiencia, encontré desarrolladores discutiendo a favor y en contra del uso de la anotación @Qualifier . Siento que es mejor usarlo en este caso porque define claramente tu intención. Otros desarrolladores creen que agregar esta anotación crea código innecesario (repetitivo).

La siguiente lista proporciona un ejemplo usando la anotación @Qualifier . Observe que en lugar de tener un identificador específico del parámetro, ahora especifico el bean que quiero inyectar usando el atributo de valor de la anotación @Qualifier .

Listado 3.7 Usando la anotación @Qualifier

@Configuration 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot1() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  } 
 
  @Bean 
  public Loro loro2() { 
    loro p = nuevo loro(); 
    p.setName("Miki"); 
    devolver p; 
  } 
 
  @Bean 
  público Persona persona( 
    @Qualifier("parrot2") Loro loro) {     ❶
  
    Persona p = new Persona(); 
    p.setName("Ella"); 
    p.setParrot(loro); 
    devolver p; 
  }
}
❶ Usando la anotación @Qualifier, marca claramente su intención de inyectar un bean específico del contexto.

Al volver a ejecutar la aplicación, la aplicación imprime el mismo resultado en la consola:

Parrot creado 
Nombre de la persona: Ella
Loro de la persona: Loro: Miki
Una situación similar también puede ocurrir cuando se usa la anotación @Autowired . Para mostrarte este caso, creé otro proyecto, "sq-ch3-ex9". En este proyecto, definimos dos beans de tipo Parrot (usando la anotación @Bean ) y una instancia de Person (usando anotaciones estereotipadas). Configuraré Spring para inyectar uno de los dos beans loro en el bean de tipo Person .

Como se presenta en el siguiente fragmento de código, no agregué la anotación @Component a la clase Parrot porque tengo la intención de definir los dos beans de tipo Parrot usando la anotación @Bean en la clase de configuración:

Loro de clase pública { 
 
  Nombre de cadena privada; 
 
  // Getters, setters y toString() omitidos  
}
Definimos un bean de tipo Person utilizando la anotación de estereotipo @Component . Observe el identificador que le di al parámetro del constructor en el siguiente fragmento de código. La razón por la que di el identificador "parrot2" es que este es el nombre que también configuraré para el bean en el contexto que quiero que Spring inyecte en ese parámetro:

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
 
  Loro loro final privado; 
 
  public Person(Loro loro2) { 
    this.loro = loro2; 
  } 
 
  // getters y setters omitidos
 
}
Defino dos beans de tipo Parrot usando la anotación @Bean en la clase de configuración. No olvide que todavía tenemos que agregar @ComponentScan para decirle a Spring dónde encontrar las clases anotadas con anotaciones de estereotipo. En nuestro caso, anotamos la clase Persona con la anotación de estereotipo @Component . El siguiente listado muestra la definición de la clase de configuración.

Listado 3.8 Definiendo los beans de tipo Parrot en la clase de configuración

@Configuration 
@ComponentScan(basePackages = "beans") 
public class ProjectConfig { 
 
  @Bean 
  public Parrot parrot1() { 
    Parrot p = new Parrot(); 
    p.setName("Koko"); 
    devolver p; 
  } 
 
  @Bean     
  public Loro loro2() {       ❶ 
    loro p = nuevo loro(); 
    p.setName("Miki"); 
    devolver p; 
  }
}
❶ Con la configuración actual, el bean llamado loro2 es el que Spring inyecta en el bean Person.

¿Qué sucede si ejecuta un método principal como el que se presenta en el siguiente fragmento de código? ¿Nuestra persona posee qué loro? Debido a que el nombre del parámetro del constructor coincide con uno de los nombres del bean en el contexto de Spring ( loro2 ), Spring inyecta ese bean (figura 3.13), por lo que el nombre del loro que la aplicación imprime en la consola es Miki :

public class Main { 
 
  public static void main(String[] args) { 
    var context = new 
        AnnotationConfigApplicationContext(ProjectConfig.class); 
 
    Persona p = contexto.getBean(Persona.clase); 
 
    System.out.println("Nombre de la persona: " + p.getName()); 
    System.out.println("Loro de la persona: " + p.getParrot()); 
  } 
}


Figura 3.13 Cuando el contexto de Spring contiene varios beans del mismo tipo, Spring seleccionará el bean cuyo nombre coincida con el nombre del parámetro.

Al ejecutar esta aplicación, la consola muestra el siguiente resultado:

Nombre de la persona: Ella
Loro de la persona: Loro: Miki
Como comentamos para el parámetro del método anotado de @Bean , no recomiendo confiar en el nombre de la variable. En cambio, prefiero usar la anotación @Qualifier para expresar claramente mi intención: inyecto un bean específico del contexto. De esta manera, minimizamos la posibilidad de que alguien refactorice el nombre de la variable y, por lo tanto, afecte el funcionamiento de la aplicación. Mire el cambio que hice en la clase Person en el siguiente fragmento de código. Usando la anotación @Qualifier , especifico el nombre del bean que quiero que Spring inyecte desde el contexto, y no confío en el identificador del parámetro del constructor (vea el cambio en el proyecto llamado "sq-ch3-ex10" ):

@Component 
clase pública Persona { 
 
  cadena privada nombre = "Ella"; 
 
  Loro loro final privado; 
 
  public Person(@Qualifier("parrot2") Loro loro) { 
    this.parrot = loro; 
  } 
 
 // getters y setters omitidos
 
}
El comportamiento de la aplicación no cambia y el resultado sigue siendo el mismo. Este enfoque hace que su código esté menos sujeto aerrores.

Resumen
El contexto de Spring es un lugar en la memoria de la aplicación que el marco usa para guardar los objetos que administra. Debe agregar cualquier objeto que deba aumentarse al contexto de Spring con una característica que ofrece el marco.

Al implementar una aplicación, debe hacer referencia de un objeto a otro. De esta forma, un objeto puede delegar acciones a otros objetos al ejecutar sus responsabilidades. Para implementar este comportamiento, debe establecer relaciones entre los beans en el contexto de Spring.

Puede establecer una relación entre dos beans utilizando uno de los tres enfoques:

Refiriéndose directamente al método anotado de @Bean que crea uno de ellos a partir del método que crea el otro. Spring sabe que te refieres al bean en el contexto, y si el bean ya existe, no vuelve a llamar al mismo método para crear otra instancia. En su lugar, devuelve la referencia al bean existente en el contexto.

Definición de un parámetro para el método anotado con @Bean . Cuando Spring observa que el método @Bean tiene un parámetro, busca un bean del tipo de ese parámetro en su contexto y proporciona ese bean como valor para el parámetro.

Usando la anotación @Autowired de tres maneras:

Anote el campo en la clase donde desea indicarle a Spring que inyecte el bean desde el contexto. Encontrará que este enfoque se usa a menudo en ejemplos y pruebas de concepto.

Anote el constructor al que le gustaría que Spring llamara para crear el bean. Spring inyectará otros beans del contexto en los parámetros del constructor. Encontrará que este enfoque es el más utilizado en el código del mundo real.

Anote el setter del atributo donde le gustaría que Spring inyecte el bean desde el contexto. No encontrará que este enfoque se use a menudo en código listo para producción.

Cada vez que permite que Spring proporcione un valor o referencia a través de un atributo de la clase o un método o parámetro de constructor, decimos que Spring usa DI, una técnica respaldada por el principio IoC.

La creación de dos beans que dependen uno del otro genera una dependencia circular. Spring no puede crear los beans con una dependencia circular y la ejecución falla con una excepción. Al configurar sus beans, asegúrese de evitar las dependencias circulares.

Cuando Spring tiene más de un bean del mismo tipo en su contexto, no puede decidir cuál de esos beans debe inyectarse. Puede decirle a Spring cuál es la instancia que necesita inyectar por

usando la anotación @Primary , que marca uno de los beans como predeterminado para la inyección de dependencia, o

nombrando los beans e inyectándolos por nombre usando el @Qualifier anotación.
