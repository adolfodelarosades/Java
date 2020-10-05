# 03 Objectos y Clases

Los objetos son los bloques de construcción fundamentales de una aplicación orientada a objetos. Tal como aprendió en el Capítulo 1 que la abstracción implica producir un modelo del mundo real, verá en este capítulo, que los objetos son "miniabstracciones" de los diversos elementos del mundo real que componen dicho modelo.

En este capítulo, aprenderá

* Las ventajas de un enfoque orientado a nuevos objetos para el desarrollo de software en comparación con el enfoque "tradicional" sin OO
* Cómo utilizar la clase para especificar los datos y el comportamiento de un objeto
* Cómo crear objetos en tiempo de ejecución
* Cómo declarar **reference variables** para referirse a objetos simbólicamente dentro de un programa
* Cómo los objetos siguen el rastro de otro en la memoria

## Software en su forma más simple

En su forma más simple, cada aplicación de software consta de dos componentes principales: datos y funciones que operan (es decir, ingresan, emiten, calculan, almacenan, recuperan, imprimen, etc.) esos datos. (Vea la Figura 3-1.)

![03-01](images/03-01.png)

La forma anterior a OO de diseñar software se conocía como descomposición funcional (de arriba hacia abajo). Comparemos el enfoque de descomposición funcional del diseño de software con el enfoque OO.

### Descomposición funcional

Con la descomposición funcional, comenzamos con una declaración de la función general que se esperaba que realizara un sistema, por ejemplo, "Registro de estudiantes". Luego dividimos esa función en subfunciones:

* “Agregue un nuevo curso al catálogo de cursos” 
* “Permita que un estudiante se inscriba en un curso”
* “Imprimir el horario de clases de un estudiante”

Etcétera.

A continuación, descomponemos esas funciones en subfunciones más pequeñas. Por ejemplo, podríamos
descomponer "Permitir que el alumno se inscriba en un curso" en 

* "Mostrar lista de cursos disponibles"
* "Permitir que el estudiante seleccione un curso"
* "Verificar que el alumno cumple con todos los requisitos previos"

etc. Seguimos descomponiendo funciones en piezas lógicas cada vez más pequeñas hasta que no pudimos subdividirlas más, como se ilustra en la Figura 3-2.

![03-02](images/03-02.png)

Luego asignamos las funciones de nivel más bajo a diferentes programadores para codificar y realizar **pruebas unitarias** (es decir, probar de forma aislada). Finalmente, ensamblamos estas funciones de forma modular de abajo hacia arriba, probando los resultados de cada etapa sucesiva en el proceso de integración, hasta tener una aplicación completa construida, como se ilustra en la Figura 3-3.

![03-03](images/03-03.png)

Con el enfoque de descomposición funcional para el desarrollo de software, nuestro enfoque principal
estaba en las funciones que debía realizar una aplicación; los ***datos*** fueron una ocurrencia tardía. Es decir,

* Los datos se pasaron de una función a la siguiente, como un automóvil que se está fabricando
a través de un proceso de línea de montaje en una planta automotriz.
* La estructura de datos debe ser entendida en muchos lugares (es decir, por muchas funciones) a lo largo de una aplicación.
* Si la estructura de datos de una aplicación tuvo que cambiar después de que se implementó la aplicación, a menudo surgieron importantes "efectos dominó" a lo largo de la aplicación. Uno de los ejemplos más dramáticos de un efecto dominó debido a un cambio en la estructura de datos fue la crisis del año 2000, en la que un cambio aparentemente simple en los formatos de fecha, de un año de dos a cuatro dígitos, causó un pánico mundial. Se gastaron miles de millones de dólares para tratar de encontrar y reparar lo que se esperaba que fueran efectos en cadena desastrosos antes de que el reloj marcara la medianoche del 1 de enero de 2000.
* A pesar de nuestros mejores esfuerzos para no realizar una aplicación minuciosamente antes de implementarla, los errores siempre logran infiltrarse sin ser detectados. Si los errores de integridad de los datos surgieron como resultado de una lógica defectuosa después de que una aplicación se había integrado por completo, a menudo era muy difícil identificar con precisión dónde, es decir, en qué función(es) específica(s), podría haber ocurrido el error, porque los datos se habían pasado de una función a otra tantas veces.

### El enfoque Orientado a Objetos

Como verá en los próximos capítulos, el enfoque OO para el desarrollo de software soluciona la gran mayoría de estas deficiencias.

* Con el desarrollo de software OO, nos enfocamos en diseñar la ***estructura de datos*** de la aplicación en primer lugar y en segundo lugar en sus funciones.
* Los datos se ***encapsulan*** dentro de los objetos, por lo que la estructura de los datos debe entenderse únicamente por el objeto al que pertenecen los datos.
* Si la estructura de datos de un objeto tiene que cambiar después de que se haya implementado la aplicación, virtualmente ***no hay efectos en cadena***; sólo debe cambiar la lógica interna del objeto afectado.
* ***Cada objeto es responsable de asegurar la integridad de sus propios datos***. Por lo tanto, si surgen errores de categoría dentro de los datos de un objeto dado, podemos suponer que fue el objeto ***mismo*** el que permitió que esto sucediera y, por lo tanto, podemos enfocarnos en la lógica funcional interna de ese objeto para aislar el "error".

### ¿Qué es un objeto?

Antes de hablar de objetos de software, hablemos de objetos del mundo real en general. Según el diccionario colegiado de Merriam-Webster, un objeto es

*(1) algo material que puede ser percibido por los sentidos; (2) algo mental o físico hacia el cual se dirige el pensamiento, sentimiento o acción.*

La primera parte de esta definición se refiere a los objetos tal como los pensamos habitualmente: como "cosas" físicas que podemos ver y tocar, y que ocupan espacio. Debido a que pretendemos utilizar el estudio de caso del Sistema de registro de estudiantes (SRS) como base para aprender sobre objetos a lo largo de este libro, pensemos en algunos ejemplos de **objetos físicos** que tienen sentido en el contexto general de un entorno académico, a saber

* Los ***estudiantes*** que asisten a clases
* Los ***profesores*** que atendieron a cada alumno
* Las ***aulas*** en las que se realizan las reuniones de clase 
* El ***equipo de audiovisuales*** en estas aulas
* Los ***edificios*** en los que están ubicadas las aulas 
* Los ***libros*** de texto que usan los estudiantes

Etcétera. 

Por supuesto, si bien todos estos tipos de objetos se encuentran comúnmente en un campus universitario típico, no todos son relevantes para inscribir a los estudiantes en los cursos, ni todos son necesariamente señalados por el estudio de caso de SRS, pero no nos preocuparemos sobre eso por el momento. En la Parte 2 de este libro, aprenderá una técnica para utilizar una especificación de requisitos como base para identificar qué tipos de objetos son relevantes para una abstracción particular.

Ahora, centrémonos en la segunda mitad de la definición, particularmente en la frase ***"algo mental. . . hacia el cual se dirige el pensamiento, sentimiento o acción"***. Hay una gran cantidad de **objetos conceptuales** que juegan un papel importante en un entorno académico; algunos de estos son

* Los ***cursos*** a los que asisten los estudiantes
* Los ***departamentos*** para los que trabaja el profesorado 
* Los ***grados*** que reciben los estudiantes

y, por supuesto, muchos otros. Aunque no podamos verlos, tocarlos, saborearlos, olerlos ni oírlos, los objetos conceptuales son tan importantes como los objetos físicos en una abstracción general.

Desde la perspectiva del software, un **objeto** (software) es una construcción/módulo de software que agrupa el **estado(datos)** y el **comportamiento(funciones)** que, en conjunto, representan una abstracción de un objeto del mundo real (físico o conceptual). Esto se ilustra conceptualmente en la Figura 3-4.

![03-04](images/03-04.png)

Exploremos los dos lados de los objetos, su estado y comportamiento, por separado, con más profundidad.

### Estado/Datos/Atributos

Si deseamos registrar información sobre un estudiante, ¿qué datos podríamos requerir? Algunos ejemplos pueden ser

* El nombre del estudiante
* Su número de identificación de estudiante
* La fecha de nacimiento del estudiante
* Su dirección
* El campo principal de estudio designado por el estudiante
* Su promedio de calificaciones acumulativas (es decir, el promedio de calificaciones del estudiante ***GPA***)
* El asesor de la facultad del alumno
* Una lista de los cursos que el estudiante está inscrito actualmente en el semestre (es decir, la carga de **cursos actual del estudiante***)
* Un historial de todos los cursos que el estudiante ha realizado hasta la fecha, el semestre/año en el que se tomó cada uno y la calificación que obtuvo para cada uno (es decir, el ***expediente académico del estudiante***)

y así. Ahora, ¿qué tal un curso académico? Quizás deseamos grabar

* El número de curso (p. Ej., "ART101")
* El nombre del curso (p. Ej., "Introducción al tejido de cestas")
* Una lista de todos los cursos que debe haber sido completado con éxito por un estudiante antes de registrarse para este curso (es decir, los ***requisitos*** previos del curso)
* El número de créditos que vale el curso
* Todos los profesores que han sido aprobados para enseñar este curso

y así. En la nomenclatura de objetos, los elementos de datos que se utilizan para describir un objeto se denominan **atributos del objeto**.

Se dice que los valores de los atributos de un objeto, cuando se toman colectivamente, definen el **estado** o condición del objeto. Por ejemplo, si quisiéramos determinar si un estudiante es "elegible para graduarse" (un **estado**), podríamos buscar una combinación de lo siguiente:

* La transcripción del estudiante (***valor de atributo***)
* La lista de los estudiantes actualmente inscritos (como ***valor de atributo***)

para determinar si se espera que el estudiante haya cumplido con los requisitos del curso para su campo de estudio principal elegido (un tercer valor de atributo) al final del año académico actual. Un atributo dado puede ser simple, por ejemplo, "GPA", que puede representarse como un número de punto flotante simple (quizás un duoble en Java), o complejo, por ejemplo, "transcripción", que representa una colección bastante extensa de información sin una simple representación.

<hr>
Los programadores nuevos en el paradigma de objetos a menudo preguntan: “¿Por qué no representar una transcripción como una cadena? Una cadena larga, sin duda, pero ¿una cadena de todos modos? Aprenderá en capítulos sucesivos que hay una manera mucho más elegante de representar la noción de la transcripción de un estudiante en términos orientados a objetos.
<hr>

### Comportamiento/Operaciones/ Métodos

Ahora, revisemos los mismos dos tipos de objetos, un estudiante y un curso, y hablemos sobre los comportamientos respectivos de estos objetos.

Los comportamientos de un estudiante (¡relevantes para asuntos académicos, en cualquier caso!) Pueden incluir

* Inscribirse en un curso
* Dejar un curso
* Designación de un campo de estudio importante
* Seleccionar un consejero de la facultad
* Díganos su GPA
* Informarnos si o si ha tomado un curso en particular y, en caso afirmativo, cuándo se tomó el curso, qué profesor lo impartió y qué calificación recibió

Es un poco más difícil pensar que un objeto conceptual inanimado, como un curso, tenga comportamientos, pero si tuviéramos que imaginar un curso como algo vivo, podemos imaginar que los comportamientos de un curso pueden incluir

* Permitir que un estudiante se registre
* Determinar si el estudiante ya está registrado
* Decirle a cuántos estudiantes se han inscrito desde lejos, o al contrario, cuántos asientos quedan antes de que el curso esté lleno.
 Informarnos cuáles son sus cursos de prerrequisito
* Contarle muchos créditos que el curso vale la pena
* Decirnos qué profesor está asignado a enseñar el curso este semestre

y así.

Cuando hablamos de objetos de software específicamente, definimos el comportamiento de un objeto, también conocido como sus **operaciones**, tanto las cosas que hace un objeto para ***acceder*** a sus valores de atributo (datos) como las cosas que hace un objeto para ***modificar/mantener*** sus valores de atributo (datos).

Si nos tomamos un momento para reflexionar sobre los comportamientos que esperamos de un estudiante como se enumeran anteriormente, vemos que cada operación involucra uno o más de los atributos del estudiante; por ejemplo:

* Decirle su GPA implica ***acceder**** al valor del atributo "GPA" del estudiante
* Elegir un campo principal de estudio implica ***modificar*** el valor del "campo principal
de estudio "atributo
* Inscribirse en un curso implica ***modificar*** el valor del atributo de "carga de curso" del estudiante

Dado que recientemente aprendió que el conjunto colectivo de valores de atributo para un objeto define su estado, ahora puede ver que las operaciones son capaces de ***cambiar el estado de un objeto***. Supongamos que definimos el estado de un estudiante que aún no ha seleccionado un campo de estudio principal como estudiante "no declarado". Pedirle a un objeto de estudiante que realice su método de “elegir un campo de estudio principal” hará que el objeto actualice el valor de su atributo de “campo de estudio principal” para reflejar el campo principal recién seleccionado. Esto, entonces, cambia el estado del estudiante de "no declarado" a "declarado".

Otra forma más de pensar en las operaciones de un objeto son los ***servicios*** que se pueden solicitar al objeto en nombre de la aplicación. Por ejemplo, un servicio que podríamos pedirle a un objeto de curso que realice es proporcionarnos una lista de todos los estudiantes que están actualmente registrados para el curso (es decir, una ***lista de estudiantes***).

Cuando realmente nos dedicamos a programar los comportamientos de un objeto en un lenguaje como Java, nos referimos a la representación del lenguaje de programación de una operación como un **método**, mientras que, estrictamente hablando, el término "operación" se usa típicamente para referirse a un comportamiento conceptualmente.

## ¿Qué es una Clase?

Una **clase** es una abstracción que describe las características comunes de todos los objetos en un grupo de objetos similares. Por ejemplo, se podría crear una clase llamada "Estudiante" para describir todos los objetos de estudiante reconocidos por el SRS.

Una clase define

* La ***estructura de datos*** (es decir, los nombres y tipos de ***atributos***) de cada objeto que pertenece a esa clase.
* Las operaciones/***métodos*** que se deben realizar por medio de estos objetos: específicamente, cuáles son estas operaciones, cómo se llama formalmente a un objeto para realizarlas y qué acciones detrás de escena debe realizar un objeto para llevarlas a cabo.

Por ejemplo, la clase de Estudiante podría diseñarse para tener los nueve atributos enumerados en la Tabla 3-1.

**Tabla 3-1.** Atributos propuestos de la Clase Student
Atributo    | Tipo
------------|------------------------
name        | String
studentId   | String
birthDate   | Date 
address     | String 
major       | String 
gpa         | double 
advisor     | ??? 
courseLoad  | ??? 
transcript  | ???

Tenga en cuenta que muchos de los atributos de Student se pueden representar mediante tipos simples de Java predefinidos (p. Ej., `String`, `double` y `Date`), pero algunos de los atributos (`advisor`, `courseLoad` y `transcript`) son demasiado complejos para que los tipos de Java integrados encargarse de. Aprenderá a abordar estos atributos un poco más adelante en el libro.

En términos de operaciones, la clase `Student` podría definir cinco métodos cuyos nombres son los siguientes:

* `registerForCourse`
* `dropCourse`
* `chooseMajor`
* `changeAdvisor`
* `printTranscript`

Aprenderá a declarar métodos formalmente en Java en el Capítulo 4.

Tenga en cuenta que un objeto solo puede hacer aquellas cosas para las que los métodos han sido definidos por la clase del objeto. En ese sentido, un objeto es como un electrodoméstico: puede hacer cualquier cosa para la que fue diseñado (un reproductor de DVD proporciona botones para reproducir, pausar, detener y buscar una escena de película en particular) y nada más (no se puede preguntar un DVD para tostar un bagel, ¡al menos no con muchas posibilidades de éxito!). Por lo tanto, un aspecto importante del diseño exitoso de un objeto es asegurarse de anticipar todos los comportamientos que necesitará realizar para llevar a cabo su "misión" dentro del sistema. Aprenderá a determinar formalmente cuál debe ser la misión, la estructura de datos y los comportamientos de un objeto, en función de los requisitos generales de la aplicación que debe admitir, en la Parte 2 del libro.

El término **característica** se usa informalmente para referirse colectivamente tanto a los atributos como a los métodos de una clase. Es decir, se dice que una definición de clase que incluye nueve declaraciones de atributos y cinco declaraciones de métodos tiene 14 características.

<hr>
El término específico de Java para la noción de característica es **miembro**. Sin embargo, el término "característica", tal como lo usaremos de manera informal a lo largo del libro, y el significado ***preciso*** de "miembro" en el sentido de Java no son exactamente lo mismo. Aplazaremos una discusión en profundidad de qué es un miembro de Java específicamente hasta el Capítulo 13.
<hr>
     
### Una Nota sobre las Convenciones de Nomenclatura

Todos los lenguajes de programación orientados a objetos (OOPL), incluido Java, mantienen las siguientes convenciones de nomenclatura:

* Al nombrar clases, ***comenzamos con una letra mayúscula***, pero usamos mayúsculas y minúsculas para el nombre general: `Student`, `Course`, `Professor`, etc. Cuando el nombre de una clase se indicaría idealmente como una frase de varias palabras, como "catálogo de cursos", comenzamos cada palabra con una letra mayúscula y concatenamos las palabras sin usar espacios, guiones o guiones bajos para separarlas, por ejemplo, `CourseCatalog`. Este estilo se conoce como **Pascal casing**.

* La convención para ***los nombres de los atributos y métodos comienza con una letra minúscula***, pero para poner en mayúscula la primera letra de las palabras subsiguientes del nombre. Los nombres de atributos típicos pueden ser, por tanto, `name`, `studentId` o `courseLoad`, mientras que los nombres de métodos típicos pueden ser `registerForCourse` e `printTranscript`. Este estilo se conoce como **camel casing**.

### Declarar una Clase, estilo Java

Una vez que hemos determinado qué estructura de datos y comportamientos comunes deseamos impartir a un conjunto de objetos similares, debemos declararlos formalmente como atributos y métodos en el contexto de una clase Java. Por ejemplo, programaríamos la estructura de datos de la clase del `Student` como se presenta en la Tabla 3-1 de la siguiente manera:


// Las declaraciones de atributos suelen aparecer primero en una 

```java
public class Student {
   // Las declaraciones de atributos suelen aparecer primero en una declaración de clase ... 
   String name;
   String studentId;
   Date birthDate;
   String address;
   String major;
   double gpa;
   // type? advisor – ¡declararemos este atributo en serio más adelante!
   // type? courseLoad - ídem
   // type? transcript - ídem
   // ... seguido de declaraciones de método (detalles omitidos - usted
   // aprende a programar métodos en Java en el Capítulo 4.)
}
```

Al igual que con todas las definiciones de clases de Java que ha visto hasta ahora en el libro, esta definición de clase residiría en un archivo fuente llamado `ClassName.java` (`Student.java`, para ser específico) y se compilaría posteriormente en forma de código de bytes como un archivo llamado `Student.class`.

<hr>
Tenga en cuenta que, para que se compile el código anterior, debemos insertar la declaración

`import java.util.Date;`

antes de la declaración

`public class Student { ... }`

Analizaremos las directivas de importación en el Capítulo 6.
<hr>

Tenga en cuenta que nuestra clase de `Student` no está obligada a declarar un método `main`. A diferencia de las clases mostradas anteriormente en el libro, que sirvieron para encapsular el método principal de un programa

```java
public class Simple {
   public static void main(String[] args) {
      System.out.println("I love Java!!!"); 
   }
}
```

la clase `Student` tiene un propósito diferente: es decir, estamos definiendo cuál es la estructura de datos y los comportamientos de los objetos de los estudiantes deben ser.

### Instantiation

Una definición de clase se puede considerar como una plantilla para crear objetos de software, un "patrón" utilizado para

* Asignar una cantidad prescrita de memoria dentro de la JVM para almacenar los ***atributos*** de un nuevo objeto.
* Asociar un determinado conjunto de ***conductas*** con ese objeto.

El término **instanciación** se utiliza para hacer referencia al proceso mediante el cual se crea un objeto en la memoria en tiempo de ejecución según una definición de clase. A partir de una sola definición de clase, por ejemplo, `Student`, podemos crear muchos objetos con estructuras de datos y comportamientos idénticos, de la misma manera que usamos un solo cortador de galletas para hacer muchas galletas de la misma forma. Entonces, otra forma de referirse a **un objeto es como una instancia de una clase** en particular, por ejemplo, "Un objeto `Student` es una instancia de la clase `Student`". (Hablaremos sobre el proceso físico de instanciar objetos tal como ocurre en Java con un poco más de detalle más adelante en este capítulo).

Por tanto, las clases se pueden diferenciar de los objetos de la siguiente manera:

* Una ***clase*** define las características — atributos, métodos — que debe poseer todo objeto que pertenece a la clase; por tanto, se puede pensar que una clase sirve como ***una plantilla de objetos***, como se ilustra en la Figura 3-5.

![03-05](images/03-05.png)

* Un ***objeto***, por otro lado, es una instancia única de una ***plantilla completa*** para la cual se han proporcionado valores de atributo y sobre el cual se pueden ejecutar métodos, como se ilustra en la Figura 3-6.

![03-06](images/03-06.png)

### Encapsulamiento

La **encapsulación** es un término formal que se refiere al mecanismo que agrupa el estado y el comportamiento de un objeto en una sola unidad lógica. Todo lo que necesitamos saber sobre un estudiante dado está, en teoría, contenido dentro de los límites de un objeto `Student`, ya sea

* Directamente, como atributo de un objetivo.
* Indirectamente, un método que puede responder a una pregunta o hacer una determinación sobre el estado del objeto.

<hr>
La encapsulación no es exclusiva de los lenguajes OO, pero en algunos sentidos la perfeccionan. 

Pero solo con los lenguajes de programación OO es la noción de encapsular datos y comportamiento en una construcción de una sola clase, para representar una abstracción de una entidad del mundo real, verdaderamente adoptada.
<hr>

### Tipos Definidos por el Usuario y Variables de Referencia

En un lenguaje de programación que no es OO como C, la declaración

`int x;`

es una **declaración** de que la variable `x` es un `int`(eger), uno de varios tipos de datos primitivos definidos para ser parte del lenguaje C. ¿Qué significa esto realmente? Esto significa que

* `x` es un nombre simbólico que hemos inventado para guardar un valor `int`(eger) almacenado en algún lugar de la memoria de la computadora. Sin embargo, no nos importa dónde se almacena este valor, porque

* Siempre que queramos operar en este valor entero en particular en nuestro programa, lo remitimos a través de su nombre simbólico `x`, por ejemplo:

`if (x > 17) x = x + 5;`

* Además, la "cosa" que hemos llamado `x` comprende cómo responder a un número de operaciones diferentes, como suma (`+`), resta (`-`), multiplicación (`*`), división (`/`), comparaciones lógicas (`>`, `<`, `=`), etc. según lo definido por el tipo `int`.

En un lenguaje OO como Java, podemos definir una clase como `Student`, y luego declarar una variable como de tipo `Student`, de la siguiente manera:

`Student y;`

¿Qué significa esto realmente? Esto significa que

* Su nombre simbólico que hemos inventado para referirse a un objeto de `Student` (es decir, una instancia de la clase `Student`) que está almacenado en algún lugar de la memoria de la computadora. Sin embargo, no nos importa dónde se almacena este objeto, porque
* Siempre que queramos operar en este objeto particular en nuestro programa, es preferible utilizar su nombre simbólico y, por ejemplo:

```java
if (y.isOnAcademicProbation()) System.out.println ("Uh oh ...");
```

• Además, la "cosa" que hemos llamado y comprende cómo responder a una serie de solicitudes de servicio diferentes (cómo registrarse en un curso, abandonar un curso, etc.) que han sido definidas por la clase `Student`.

Tenga en cuenta los paralelismos entre `y` como `Student` y `x` como `int` en los ejemplos anteriores. Así como se dice que `int` es un ***tipo predefinido*** en Java (y otros lenguajes), se dice que la clase `Student` es un tipo definido por el usuario. Y, como y en el ejemplo anterior es una variable que se refiere a una instancia (objeto) de la clase `Student`, y se conoce como **variable de referencia**.

Por el contrario, las variables declaradas como uno de los ocho tipos primitivos en Java (`int`, `double`, `float`, `byte`, `short`, `long`, `char` y `boolean`) ***no son*** variables de referencia, porque en Java, los tipos primitivos **no son tipos de referencia**; es decir, no se refieren a ***objetos***.

```java
// x NO es una variable de referencia, porque en Java,
// un int NO es un objeto.
int x;

// yesNo NO es una variable de referencia, porque en Java, 
// un booleano NO es un objeto.
boolean yesNo;
```

Varios lenguajes OO difieren en su tratamiento de tipos simples. En algunos lenguajes OO (por ejemplo, Smalltalk), todos los tipos, incluidos los tipos "simples" como `int` y `char`, son tipos de referencia, mientras que en otros lenguajes (por ejemplo, Java y C ++), no lo son.

<hr>
El hecho de que Java contenga una combinación de tipos de referencia y tipos de no referencia afecta la forma en que manipulamos las variables en determinadas circunstancias, como cuando colocamos valores primitivos en colecciones, un tema que exploraremos en el Capítulo 6. Analizaré en el Capítulo 6 y nuevamente en el Apéndice G, las mejoras realizadas en el lenguaje Java a partir de la versión 5.0 reducen un poco el impacto de esta diferencia.
<hr>

#### Convenciones de Nomenclatura para Variables de Referencia

Los nombres de las variables de referencia siguen la misma convención que los nombres de método y atributo, es decir, usan camel casing. Algunas declaraciones de variables de referencia de muestra son las siguientes:

```java
Course prerequisiteOfThisCourse;
Professor facultyAdvisor;
Student s;
Student student;
```

El último de estos, `Student student;`, puede tomar un tiempo para acostumbrarse si es nuevo en los lenguajes de programación que distinguen entre mayúsculas y minúsculas. Sin embargo, se considera una buena práctica de programación crear un patrón de nombres de variables de referencia después del nombre de la clase a la que pertenecen si solo hay una de esas variables dentro del alcance en un cuerpo de código en particular. Debido a que el nombre de la clase comienza con una "S" mayúscula y el nombre de la variable de referencia comienza con una "s" minúscula, el `Student` y `student` son ***símbolos completamente diferentes*** en lo que respecta al compilador.

### Instanciación de Objetos: Una Mirada más Cercana

Los diferentes lenguajes de OO difieren en términos de cuándo se crea una instancia (creación) de un objeto. En Java, cuando declaramos que una variable es de un tipo definido por el usuario, como en

`Student y;`

***aún no hemos creado un objeto en la memoria***. Más bien, simplemente hemos declarado una variable de referencia de tipo `Student` llamada `y`. Esta variable de referencia tiene el ***potencial*** de hacer referencia a un objeto `Student`, ***pero todavía no se refiere a uno***; más bien, al igual que con las variables de varios tipos simples, el valor de `y` no está definido en lo que respecta al compilador ***hasta que le asignamos explícitamente un valor***.

Si queremos crear una instancia de un nuevo objeto `Student` para que haga referencia a él, tenemos que dar el paso distintivo de usar una palabra clave especial de Java, `new`, para asignar un nuevo objeto `Student` dentro de la memoria de la JVM en tiempo de ejecución. Asociamos el nuevo objeto con la variable de referencia y mediante una instrucción de asignación, como sigue:

`y = new Student();`

<hr>
No se preocupe por los paréntesis al final de la declaración anterior. Hablaré de su importancia en el Capítulo 4, cuando analicemos la noción de **constructores**.
<hr>

Piense en el objeto recién creado como un globo de helio, como se muestra en la Figura 3-7, y una variable de referencia como la mano que sostiene una cuerda atada al globo para que podamos acceder al objeto cuando queramos.
 
![03-07](images/03-07.png)

Debido a que a veces se dice informalmente que una variable de referencia "se aferra" a un objeto, a menudo usamos el término informal **handle** (identificador), como en la expresión "La variable de referencia `y` mantiene un handle en un objeto `Student`".

<hr>
Si está familiarizado con el concepto de punteros de lenguajes como C y C ++, una referencia es similar a un puntero, en el sentido de que se refiere detrás de escena a la ubicación/dirección de memoria donde se almacena un objeto en particular. Sin embargo, las referencias de Java difieren de los punteros en que las referencias no se pueden manipular aritméticamente de la forma en que lo hacen los punteros.
<hr>

También podríamos crear un nuevo objeto sin asignarlo inmediatamente a una variable de referencia, como en la siguiente línea de código:

`new Student();`

pero tal objeto sería como un globo de helio sin una cuerda: de hecho existiría, pero nunca podríamos acceder a este objeto en nuestro programa. En esencia, "se alejaría flotando" de nosotros en la memoria inmediatamente después de haber sido "inflado".

Tenga en cuenta que podemos combinar los dos pasos (declarar una variable de referencia y, de hecho, instaurar un objeto para que esa variable se refiera) en una sola línea de código:

`Student y = new Student();`

Otra forma de inicializar la variable de referencia `y` es usar una instrucción de asignación para "entregar" `y` una referencia a un objeto ya existente: es decir, un objeto ("globo de helio") que ya está siendo referenciado por una variable de referencia diferente `x`. Veamos un ejemplo:

```java
// Declaramos una variable de referencia e instanciamos nuestro primer objeto Student. 
Student x = new Student();

// Declaramos una segunda variable de referencia, pero "NO" la  instanciamos 
// un segundo objeto Student.
Student y;

// Asignamos y una referencia al MISMO objeto al que x se refiere 
// (x también continúa refiriéndose a él). Nosotros ahora, en esencia,
// tiene dos "cadenas" atadas al mismo "globo".
y = x;
```

El resultado conceptual de la declaración de asignación anterior se ilustra en la Figura 3-8: dos "cuerdas", sostenidas por dos "manos" diferentes, atadas al mismo "globo", es decir, dos variables de referencia diferentes que se refieren al mismo objeto en la memoria.

![03-08](images/03-08.png)

Por tanto, vemos que ***múltiples*** variables de referencia pueden referirse simultáneamente al mismo objeto. Sin embargo, cualquier variable de referencia solo puede retener/hacer referencia ***a un objeto*** a la vez. Por lo tanto, si una variable de referencia ya se aferra a un objeto, debe soltar ese objeto para hacer referencia a un objeto diferente. Si llega un momento en el que se han liberado todas las asas de un objeto en particular, ese objeto ya no es accesible para nuestro programa, como un globo de helio que se ha soltado.

Ampliemos nuestro ejemplo anterior para ilustrar estos conceptos (observe el código resaltado que se ha agregado):

```java
// Declaramos una variable de referencia e instanciamos nuestro primer objeto Student x = new Student();

// Declaramos una segunda variable de referencia, pero no instanciamos un 
// segundo objeto.
Student y;

// Asignamos y a una referencia al MISMO objeto al que x se refiere 
// (x también continúa refiriéndose a él).
y = x;

// Declaramos una TERCERA variable de referencia e instanciamos un SEGUNDO 
// objeto Student.
Student z = new Student();
```

En este momento, ahora tenemos dos referencias al ***primer*** objeto de `Student`, `x` e `y`, y una referencia, `z`, al ***segundo*** objeto `Student`, como se ilustra en la Figura 3-9.

![03-09](images/03-09.png)

Ampliemos nuestro ejemplo una vez más (observe el código que se ha agregado):

```java
// Declaramos una variable de referencia e instanciamos nuestro primer objeto Student x = new Student();

// Declaramos una segunda variable de referencia, pero no instanciamos un 
// segundo objeto.
Student y;

// Asignamos y a una referencia al MISMO objeto al que x se refiere 
// (x también continúa refiriéndose a él).
y = x;

// Declaramos una TERCERA variable de referencia e instanciamos un SEGUNDO 
// objeto Student.
Student z = new Student();

// Reasignamos y para referirnos al mismo objeto al que se refiere z;
// y por lo tanto, suelta el primer objeto Student y agarra el segundo. 
y = z;
```

Debido a que ahora le pedimos a `y` que se refiera al mismo objeto al que se refiere `z`, es decir, el ***segundo*** objeto `Student`, y debe liberar su identificador en el ***primer*** objeto `Student`. Esto se ilustra en la Figura 3-10. (Sin embargo, tenga en cuenta que `x` todavía se aferra al primer objeto `Student`).

![03-10](images/03-10.png)

Ahora completaremos nuestro ejemplo con el código que hemos agregado:

```java
// Declaramos una variable de referencia e instanciamos nuestro primer objeto Student x = new Student();

// Declaramos una segunda variable de referencia, pero no instanciamos un 
// segundo objeto.
Student y;

// Asignamos y a una referencia al MISMO objeto al que x se refiere 
// (x también continúa refiriéndose a él).
y = x;

// Declaramos una TERCERA variable de referencia e instanciamos un SEGUNDO 
// objeto Student.
Student z = new Student();

// Reasignamos y para referirnos al mismo objeto al que se refiere z;
// y por lo tanto, suelta el primer objeto Student y agarra el segundo. 
y = z;

// Reasignamos x para hacer referencia al mismo objeto al que se refiere z. 
// x, por lo tanto, suelta el primer objeto Student y se agarra 
// al segundo también.
x = z;
```

Debido a que ahora le pedimos a `x` que se refiera al mismo objeto al que se refiere `z`, es decir, el segundo objeto `Student`, `x` debe liberar su identificador en el primer objeto de estudiante. Dado que ya no mantenemos ninguna referencia al primer objeto `Student` (`x`, `y`, `z` ahora se refieren al segundo), el primer objeto `Student` ahora se pierde en el programa, como se ilustra en la Figura 3-11. .

![03-11](images/03-11.png)

Otra forma de hacer que una variable de referencia libere su identificador en un objeto es establecer la variable de referencia en el valor `null`, que como discutimos en el Capítulo 2 es la palabra clave de Java que se usa para representar un objeto inexistente. Continuando con nuestro ejemplo anterior

* Establecer `x` a `null` obtiene `x` para liberar su handle (identificador) en el segundo objeto `Student`, como se ilustra en la Figura 3-12.

```java
x = null;
```

![03-12](images/03-12.png)

* Establecer `y` a `null` hace que `y` libere su handle (identificador) en el segundo objeto `Student`, como se ilustra en la Figura 3-13.

```java
x = null;
y = null;
```

![03-13](images/03-13.png)

* Lo mismo ocurre con z, como se ilustra en la Figura 3-14.

```java
x = null;
y = null;
z = null;
```

¡Ahora, ambos objetos `Student` se han perdido en nuestro programa!

![03-14](images/03-14.png)

### Garbage Collection - Recolección de basura
Resulta que si se liberan todos los identificadores de un objeto, podría parecer que la memoria que ocupa el objeto dentro de la JVM se desperdiciaría permanentemente. En un lenguaje como C++, esto puede suceder si los programadores no se preocupan explícitamente de recuperar la memoria de un objeto que ya no es necesario antes de que se eliminen todos sus identificadores. No hacerlo es una fuente crónica de problemas en los programas C++ y se conoce comúnmente como pérdida de memoria.

<hr>
En C ++, esto se logra mediante la siguiente declaración:
`x.delete ();`
pero tal declaración es innecesaria en Java, por razones que vamos a discutir.
<hr>

Con Java, por otro lado, la JVM realiza periódicamente la recolección de basura, un proceso que automáticamente recupera la memoria de los objetos “perdidos” mientras se ejecuta una aplicación. Así es como funciona el recolector de basura de Java:

*  Si quedan referencias activas a un objeto, se convierte en un candidato para la recolección de basura.
* Sin embargo, el recolector de basura ***no recicla inmediatamente*** el objeto; más bien, la recolección de basura ocurre cuando la JVM determina que la aplicación se está quedando sin memoria libre, o cuando la JVM está inactiva.
* Por lo tanto, durante un período de tiempo, el objeto "huérfano" seguirá existiendo en la memoria, simplemente no tendremos handles(identificadores)/variables de referencia con las que acceder.

<hr>
Tenga en cuenta que hay una manera de solicitar explícitamente que la recolección de basura ocurra en Java a través de la siguiente declaración:

```java
Runtime.getRuntime().gc();
```

Incluso entonces, sin embargo, el ***momento preciso*** en el que ocurre la recolección de basura está fuera del control del programador, así como cuáles y cuántos de los objetos elegibles se recolectarán.
<hr>

La inclusión de la recolección de basura en Java prácticamente ha eliminado las pérdidas de memoria del tipo que surgió en C++. Tenga en cuenta que aún es posible que la JVM se quede sin memoria, sin embargo, si mantenemos identificadores en demasiados objetos activos simultáneamente. Por tanto, un programador de Java no puede ser totalmente ajeno a la gestión de la memoria; la gestión de la memoria es menos propensa a errores en Java que en C/C ++.

## Objects As Attributes - Objetos como atributos

Cuando hablé por primera vez de los atributos y métodos asociados con la clase `Student`, indiqué que algunos de los atributos podrían estar representados por tipos predefinidos proporcionados por el lenguaje Java, mientras que los tipos de algunos otros (`advisor`, `courseLoad`, y `transcript`) fueron temporalmente dejado sin especificar. Ahora, hagamos un buen uso de lo que ha aprendido sobre los tipos definidos por el usuario con respecto a uno de estos atributos: el atributo de `advisor` (asesor) de la clase `Student`.

En lugar de declarar el atributo `advisor` como simplemente `String` que representa el nombre del asesor, declararemos que es del tipo definido por el usuario, es decir, tipo `Professor` (Profesor), otra clase que hemos inventado. Este tipo de atributo se refleja en la Tabla 3-2.

**Tabla 3-2.** Atributos propuestos de la Clase `Student`
Atributo    | Tipo
------------|------------------------
name        | String
studentId   | String
birthDate   | Date 
address     | String 
major       | String 
gpa         | double 
**advisor     | Professor**
courseLoad  | ??? 
transcript  | ???


Esto también se refleja en nuestra declaración de clase `Student`:

```java
public class Student {
   // Las declaraciones de atributos suelen aparecer primero ...
   String name;
   String studentId;
   Date birthDate;
   String address;
   String major;
   double gpa;
   // Una clase es un tipo definido por el usuario, por lo que podemos declarar  
   // atributos de ese tipo.
   Professor advisor;
   // type? courseLoad -declararemos este atributo más tarde.
   // type? transcript – declararemos este atributo más tarde.
   // ... seguido de declaraciones de método (detalles omitidos por ahora). 
}
```

Al haber declarado que el atributo `advisor` es de tipo `Professor`, es decir, al hacer que el atributo `advisor` sirva como una ***variable de referencia***, acabamos de habilitar un objeto `Student` para mantener un control sobre el objeto `Professor` real que representa al profesor que está asesorando al estudiante.

La clase `Professor`, a su vez, podría definirse para tener los atributos enumerados en la Tabla 3-3.

**Tabla 3-2.** Atributos de la Clase `Professor`
Atributo    | Tipo
------------|------------------------
name        | String
employeeId  | String
birthDate   | Date 
address     | String 
worksFor    | String (o Department)
gpa         | double 
**advisee   | Student**
teachingAssignments  | ??? 

Una vez más, al haber declarado que el atributo `advisee`(aconsejado) es de tipo `Student`, es decir, al hacer que el atributo `advisee` sea una variable de referencia, acabamos de darle a un objeto `Professor` una forma de retener/referirse al objeto `Student` real que representa el estudiante a quien el profesor está asesorando.

Los métodos de la clase de `Professor` pueden ser los siguientes:

* `transferToDepartment`
* `adviseStudent`
* `agreeToTeachCourse`
* `assignGrades`

Etcétera.

Al igual que hicimos para la clase `Student` anteriormente en este capítulo, renderizaremos este diseño de clase `Professor` en código Java de la siguiente manera:

```java
public class Professor { 
   // Attributes.
   String name;
   String employeeId;
   Date birthDate;
   String address;
   String worksFor;
   Student advisee;
   double gpa;
   // type? teachingAssignments – declararemos este atributo más tarde.
   // ... seguido de declaraciones de método (detalles omitidos por ahora) 
}
```

Esta definición de clase residiría en un archivo fuente llamado `Professor.java`, y luego se compilaría en forma de código de bytes como un archivo llamado `Professor.class`.

<hr>
Tenga en cuenta que, como se mencionó anteriormente para la clase `Student`, necesitaríamos insertar la declaración 

`import java.util.Date;`

antes de la declaración

`public class Professor { ... }`

para que el código se compile correctamente. Hablaremos sobre el tipo de fecha de Java en el Capítulo 13.
<hr>

Los siguientes son algunos puntos notables sobre la clase de `Professor`:

* Es probable que un profesor asesore a varios estudiantes simultáneamente, por lo que tener un atributo como `StudentAdvisee` que solo puede hacer referencia a un ***único*** objeto `Student` no es muy útil. Analizaremos las técnicas para manejar esto en el Capítulo 6, cuando analicemos las **colecciones**, que también veremos como útiles para definir el atributo `teachAssignments` de `Professor`, y los atributos `courseLoad` y `transcript` de `Student`.

* El atributo `worksFo` representa el departamento al que se asigna un profesor. Podemos elegir representar esto como una cadena simple que represente el nombre del departamento, por ejemplo, "MATH", o como una variable de referencia que mantiene un identificador en un objeto Department, específicamente, el objeto `Department` que representa el "mundo real". ”Departamento de Matemáticas. Por supuesto, hacerlo requeriría definir los atributos y métodos para una nueva clase llamada `Department`.

Como discutiremos más adelante en la Parte 2 de este libro, la decisión de si necesitamos o no inventar un nuevo tipo/clase definida por el usuario para representar un concepto/abstracción particular del mundo real no siempre es clara.


### Un truco de compilación: “Stubbing Out” Classes - Clases de "Taponamiento"

Si quisiéramos programar las clases `Student` y `Professor` en Java como se mostró anteriormente, ninguna de las dos podría compilarse de forma aislada; es decir, si simplemente escribimos el código para la clase `Student`:

```java
//Student.java

public class Student {
   // Las declaraciones de atributos suelen aparecer primero ...
   String name;
   String studentId;
   Date birthDate;
   String address;
   String major;
   double gpa;
   // Una clase es un tipo definido por el usuario, por lo que podemos declarar  
   // atributos de ese tipo.
   Professor advisor;
   // etc.
}
```

:fire:
sin haber escrito todavía el código para la clase de `Professor` (`Professor.java`), obtendríamos un error de compilación en `Student` de la siguiente manera:

```sh
Student.java: cannot find symbol 
symbol : class Professor 
location : class Student 
Professor advisor;
^
```

porque todavía no hemos definido "`Professor`" como un tipo para el compilador de Java.

Podríamos esperar hasta que hayamos programado las clases de `Student` y `Professor` antes intentando compilar cualquiera de ellos, pero ¿y si tuviéramos que introducir una tercera clase en la mezcla?

```java
public class Student {
    String name;
    Professor advisor;
    Department major;
    // etc. 
}

public class Professor {
    String name;
    Student advisee;
    Department worksFor;
    // etc. 
}

public class Department {
    String name; 
    Professor chairman; 
    // etc.
}
```

o una cuarta clase, o una quinta? ¿Debemos programarlos **todos** antes de compilar cualquiera de ellos? 

Afortunadamente, podemos utilizar la técnica de **"eliminar"** una clase para solucionar temporalmente problemas relacionados con la compilación de una clase X que se refiere a una clase Y, que aún no hemos programado. Volviendo a nuestra clase de estudiantes como se escribió originalmente

```java
//Student.java

public class Student {
   // Las declaraciones de atributos suelen aparecer primero ...
   String name;
   // etc.
   Professor advisor;
   // etc.
}
```

podemos codificar temporalmente una clase `Professor` "básica" de la siguiente manera:

```java
//Professor.java

// Una clase "stub": tenga en cuenta que el cuerpo consta de un par de llaves vacías. 
public class Professor { }
```

Por trivial que pueda ser esta definición de clase `Professor`, el compilador Java la considera una definición de clase legítima que, cuando se compila, producirá un archivo de código de bytes `Professor.class`.

Cuando ahora intentemos compilar nuestro archivo `Student.java`, el compilador de hecho considerará que “Professor” es un símbolo válido, específicamente, el nombre de un tipo definido por el usuario, y `Student` también lo compilará correctamente.

<hr>
Recuerde que podemos compilar los archivos `Student.java` y `Professor.java` ("stub") simultáneamente con un solo comando

`javac * .java`

Es decir, `Professor.java` no necesita compilarse primero por separado.
<hr>

### Composición

Siempre que creamos una clase, como `Student` o `Professor`, en la que uno o más de los atributos son en sí mismos referencias a otros objetos, estamos empleando una técnica OO conocida como **composición**. El número de niveles en los que los objetos pueden agruparse conceptualmente entre sí es infinito, por lo que la composición nos permite modelar conceptos muy sofisticados del mundo real. Resulta que la mayoría de las clases "interesantes" emplean composición.

Con la composición, puede parecer conceptualmente como si estuviéramos anidando objetos físicamente uno dentro del otro, como se muestra en la Figura 3-15.

![03-15](images/03-15.png)

El anidamiento de objetos real (es decir, declarar una clase dentro de otra) es posible en muchos lenguajes de programación OO, y de hecho a veces tiene sentido, es decir, si un objeto A no necesita tener vida propia desde el punto de vista de una aplicación OO, y existe solo con el propósito de servir al objeto B.

* Piense en su cerebro, por ejemplo, como un objeto que existe solamente dentro del contexto de su cuerpo (otro objeto).

* Como ejemplo de un objeto relevante para el SRS, consideremos el libro de calificación utilizado para realizar un seguimiento del desempeño de los estudiantes en un curso en particular. Si tuviéramos que definir una clase de `GradeBook` y luego crear objetos de `GradeBook` como atributos (uno por objeto de curso), entonces podría ser razonable que cada objeto `GradeBook` exista completamente dentro del contexto de su objeto de curso asociado. Ningún otro objeto necesitaría comunicarse directamente con el `GradeBook`; Si un objeto `Student` desea preguntarle a un objeto `Course` qué calificación ha obtenido el `Student`, el objeto `Course` puede consultar internamente su objeto `GradeBook` incrustado y simplemente devolverle una calificación en letra al `Student`.

<hr>
De hecho, ilustraremos la noción de un libro de calificaciones cuando analicemos las **clases internas - inner classes** en el capítulo 13.
<hr>

Sin embargo, a menudo nos encontramos con la situación, como con las clases de ejemplo de `Student` y `Professor`, en la que un objeto A necesita referirse a un objeto B, el objeto B necesita referirse nuevamente al objeto A, y ***ambos*** objetos deben poder responder a solicitudes de forma independiente entre sí, tal como las realiza la aplicación en su conjunto. En tal caso, ¡los handles vienen al rescate!

En realidad, ***no*** almacenamos objetos completos como atributos dentro de otros objetos; más bien, almacenamos ***referencias*** a objetos. Cuando un atributo de un objeto A se define en términos de una referencia de objeto B, los dos objetos existen por separado en la memoria y simplemente tienen una forma conveniente de encontrarse el uno al otro siempre que sea necesario para interactuar. Piense en usted mismo como un objeto y su número de teléfono celular como su referencia. Otras personas ("objetos") pueden comunicarse con usted a través de su número de teléfono celular para hablar con usted cuando lo necesiten, aunque no sepan dónde se encuentra físicamente; y a la inversa, si tienes sus números de celular, puedes llamarlos cuando quieras.

La asignación de memoria mediante handles puede parecerse a la Figura 3-16 conceptualmente.


![03-16](images/03-16.png)


