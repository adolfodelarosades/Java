# Prefacio

¡Bienvenido a la tercera edición de **Beginner Java Objects (BJO)!** Desde que se publicó la primera edición de BJO en noviembre de 2000 y la segunda edición en 2005, me han encantado los muchos correos electrónicos y críticas positivas que he recibido de lectores que consideraron que mi libro era un "buen comienzo" perfecto. en Java y programación orientada a objetos (OO) . Muchos libros de Java para principiantes se sumergen en una discusión del lenguaje en sí sin fundamentar adecuadamente a los lectores sobre cómo "pensar" y estructurar una aplicación desde cero para aprovechar al máximo los principios orientados a objetos; Estoy encantado de que haya elegido BJO para comenzar su viaje a Java.

Mi libro se basa en principios atemporales que son independientes de la versión del lenguaje, lo que significa que no es necesario revisarlo cada vez que se lanza una nueva versión de Java. Lo que sí cambia, a veces aparentemente en un abrir y cerrar de ojos, son las tecnologías de terceros que se utilizan junto con el lenguaje central de Java, por lo que hemos reemplazado el material que detallaba las tecnologías obsoletas con un solo capítulo (Capítulo 15 ) que explica conceptualmente cómo avanzar en la creación de una aplicación que logre una separación adecuada entre el modelo, la capa de datos y la capa de presentación.

También hemos incluido una mención de algunas de las mejoras significativas del lenguaje Java a partir de las versiones 8 a 17 (la versión más reciente saldrá al momento de escribir la tercera edición).

Como siempre, agradezco los comentarios de los lectores y espero saber de usted en jacquie.barker@gmail.com.

Atentamente,

jaquie

# Introducción

Este es un libro, ante todo, sobre objetos de software: qué son, por qué son tan "mágicos" y, sin embargo, tan sencillos, y cómo se estructura una aplicación de software para usar los objetos de manera adecuada.

Este es también un libro sobre Java: no es un libro de "todo lo que hay que saber sobre Java", sino más bien una introducción suave pero completa al lenguaje, con énfasis especial en cómo hacer la transición de un modelo de objeto a un modelo de trabajo. Aplicación Java: algo que pocos libros, si es que hay alguno, ofrecen.

Objetivos de este libro
Mis objetivos al escribir este libro (y, con suerte, los suyos al comprarlo) son
Hacer que se sienta cómodo con la terminología y los conceptos fundamentales orientados a objetos (OO).

Brindarle experiencia práctica con el modelado de objetos , es decir, con el desarrollo de un "modelo" orientado a objetos que se puede utilizar como base para construir posteriormente un sistema de software orientado a objetos.

Ilustre los conceptos básicos de cómo un modelo de objetos de este tipo se traduce en una aplicación de software en funcionamiento, una aplicación Java, para ser específicos, aunque las técnicas que aprenderá para el modelado de objetos se aplican igualmente bien a cualquier lenguaje OO.

Ayudarlo a convertirse en un programador de Java competente en el camino.

Si ya tiene experiencia con el lenguaje Java (pero no con los fundamentos de los objetos), es fundamental para su uso exitoso del lenguaje que aprenda sobre sus raíces orientadas a objetos. Por otro lado, si es un principiante en Java, este libro lo ayudará a "comenzar". De cualquier manera, este libro es una "lectura obligada" para cualquier persona que desee dominar un lenguaje de programación orientado a objetos como Java.

Igual de importante, este libro no pretende
Conviértase en un profesional de la noche a la mañana en el modelado de objetos: como todas las habilidades avanzadas, sentirse totalmente cómodo con el modelado de objetos requiere dos cosas: ¡una buena base teórica y mucha práctica! Le doy la base en este libro, incluida una introducción al Lenguaje de modelado unificado (UML) , el estándar de la industria para representar un "modelo" orientado a objetos de una aplicación de software. (UML se adoptó por primera vez como un estándar para el modelado de sistemas de software orientados a objetos en 1997 y sigue siendo relevante hoy en día). proyectos a lo largo del tiempo.

Mi libro le brindará las habilidades y, con suerte, la confianza para comenzar a aplicar técnicas de objetos en un entorno profesional, que es donde tendrá lugar su verdadero aprendizaje, especialmente si tiene un mentor con experiencia en OO que lo guíe a través de su primer " proyecto de fuerza industrial”.

Enséñele "todo" lo que necesitará saber sobre Java: Java es un lenguaje muy rico, que consta de cientos de clases principales y literalmente miles de operaciones que se pueden realizar con y por estas clases. Además, Oracle Corporation lanza nuevas versiones del lenguaje Java cada año, pero la buena noticia es que las características clave de Java necesarias para representar un problema de software de una manera adecuada orientada a objetos no han cambiado a lo largo de los años. Si Java proporciona una docena de formas alternativas de hacer algo en particular, explico una o dos formas que considero que se adaptan mejor al problema en cuestión, para darle una idea de cómo se hacen las cosas. No obstante, definitivamente verá suficiente lenguaje Java en este libro para prepararse para un papel como programador profesional de Java.

Armado con la base que obtiene de este libro, estará preparado para apreciar un tratamiento más completo de Java como el que ofrece una de las muchas otras referencias de Java que están actualmente en el mercado o una revisión más profunda del modelado de objetos. técnicas de una referencia detallada de UML. Haremos recomendaciones para tales libros en el Capítulo 15 .

¿Por qué es tan importante comprender los objetos para ser un programador OO exitoso?
Una y otra vez me encuentro con desarrolladores de software —en mi lugar de trabajo, en las oficinas de los clientes, en conferencias profesionales, en campus universitarios— que han intentado dominar un lenguaje de programación orientado a objetos (OOPL) como Java tomando un curso de Java . , leer un libro sobre Java o instalar y usar un entorno de desarrollo integrado (IDE) de Java como Eclipse , IntelliJ IDEA , NetBeans o BlueJ . Sin embargo, hay algo fundamental que falta en prácticamente todos estos enfoques: una comprensión básica de lo que son los objetos y, lo que es más importante, el conocimiento de cómo estructurar una aplicación de software desde cero para aprovechar al máximo los objetos..

Imagine que le han pedido que construya una casa y que conoce los conceptos básicos de la construcción de viviendas. De hecho, usted es un constructor de viviendas de renombre mundial cuyos servicios tienen una gran demanda. Ha construido casas de todos los estilos arquitectónicos posibles, utilizando todo tipo de material de construcción conocido: ladrillo, madera, piedra, metal, etc. Entonces, cuando su cliente le dice que quiere que use un nuevo tipo de material de construcción , que te proporcionarán, estarás feliz de complacerte.


El día en que debe comenzar la construcción, un camión se detiene en el sitio de construcción y descarga una gran pila de bloques azules en forma de estrella de aspecto extraño con agujeros en el medio. ¡Estás totalmente desconcertado! Has construido innumerables casas con materiales más familiares, pero no tienes ni idea de cómo armar una casa con estrellas azules.


Rascándose la cabeza, saca un martillo y algunos clavos e intenta unir las estrellas azules como si estuviera trabajando con madera, pero las estrellas no encajan muy bien. A continuación, intenta rellenar los huecos con el mismo mortero que usaría para adherir ladrillos entre sí, pero el mortero no se adhiere muy bien a estas estrellas azules. Sin embargo, debido a que está trabajando con limitaciones de costos y de cronograma para construir esta casa para su cliente (y porque le da mucha vergüenza admitir que usted, como constructor de casas experto, no sabe cómo trabajar con estos materiales modernos ), presionas. Eventualmente, terminas con algo que se parece (al menos en la superficie) a una casa.


Su cliente viene a inspeccionar el trabajo y está terriblemente decepcionado. Una de las razones por las que seleccionaron las estrellas azules como material de construcción fue que son extremadamente eficientes energéticamente; pero, debido a que usó clavos y mortero para ensamblar las estrellas, han perdido gran parte de su capacidad inherente para aislar el hogar.

Para compensar, su cliente le pide que reemplace todas las ventanas de la casa con ventanas de vidrio térmico de triple panel para que permitan que escape menos calor. ¡Estás entrando en pánico en este punto! Cambiar las ventanas requerirá que literalmente rompas las paredes, destruyendo la casa.

Cuando le dices esto a tu cliente, ¡se vuelven locos ! Otra razón por la que seleccionaron las estrellas azules como material de construcción fue por su modularidad y, por lo tanto, la facilidad para adaptarse a los cambios de diseño; pero, debido a la forma ineficaz con la que ensamblaste estas estrellas, también perdieron esta flexibilidad.


Esta es, lamentablemente, la forma en que muchos programadores terminan construyendo una aplicación OO cuando no tienen la capacitación adecuada en las propiedades fundamentales de los componentes básicos de dicha aplicación, es decir, los objetos de software. Peor aún, la gran mayoría de los aspirantes a programadores OO ignoran felizmente la necesidad de comprender los objetos para poder programar en un lenguaje OO. Así que empiezan a programar con un lenguaje como Java y terminan con un resultado que dista mucho de ser el ideal: una aplicación que carece de flexibilidad cuando se produce una inevitable "corrección a mitad de camino" en respuesta a los requisitos cambiantes después de que se haya implementado la aplicación.

¿Para quién está escrito este libro?
¡Cualquiera que quiera aprovechar al máximo un lenguaje de programación orientado a objetos como Java! ha sido escrito para
Cualquiera que aún no haya abordado Java, pero quiera empezar con el pie derecho con el lenguaje.

Cualquiera que haya comprado un libro sobre Java y lo haya leído fielmente, que comprenda los "bits y bytes" del lenguaje, pero que no sepa muy bien cómo estructurar una aplicación para aprovechar al máximo las funciones orientadas a objetos de Java .

Cualquiera que haya creado una aplicación Java, pero se sintió decepcionado con lo difícil que fue mantenerla o modificarla cuando se presentaron nuevos requisitos más adelante en el ciclo de vida de la aplicación.

Cualquiera que haya aprendido previamente algo sobre el modelado de objetos, pero que no sepa cómo hacer la transición de un modelo de objetos a un código real en vivo (Java u otro)

¡La conclusión es que cualquiera que realmente quiera dominar un lenguaje OO como Java debe convertirse PRIMERO en un experto en objetos!

Para obtener el mayor valor de este libro, debe tener algo de experiencia en programación en su haber; prácticamente cualquier idioma servirá. Debe comprender conceptos de programación simples como
Tipos de datos simples (entero, punto flotante, etc.)

Variables y su alcance (incluida la noción de datos globales)

Control de flujo (declaraciones " if ... then ... else ", bucles for /do/while, etc.)

Qué son las matrices y cómo usarlas

La noción de función/subrutina/procedimiento de software: cómo pasar datos y obtener resultados

Pero no es necesario que haya tenido una exposición previa a Java. Y tampoco es necesario que haya estado nunca expuesto a objetos, ¡al menos en el sentido del software! Como aprenderá en el Capítulo 2 , los seres humanos naturalmente ven el mundo entero desde la perspectiva de los objetos.

Incluso si ya ha desarrollado una aplicación Java completa, ciertamente no es demasiado tarde para leer este libro si todavía se siente confuso cuando se trata de los aspectos de la estructuración de una aplicación; en última instancia, hace que alguien sea un mejor programador de Java al conocer los "por qué" de la orientación a objetos en lugar de simplemente la mecánica del lenguaje. Lo más probable es que vea algunos hitos familiares (en forma de ejemplos de código Java) en este libro, pero es de esperar que obtenga muchos conocimientos nuevos a medida que aprende la lógica de por qué hacemos muchas de las cosas que hacemos cuando programamos en Java ( o cualquier otro lenguaje de programación OO para el caso).

Debido a que este libro tiene sus raíces en los cursos que enseño a nivel universitario, es ideal para usarlo como libro de texto para una universidad de un semestre de duración o un curso de secundaria de colocación avanzada en modelado de objetos o programación Java.

¿Qué sucede si está interesado en el modelado de objetos, pero no necesariamente en la programación Java?
¿Mi libro seguirá siendo de valor para usted? ¡Definitivamente! Incluso si no planea hacer una carrera de programación (como es el caso de muchos de mis estudiantes de modelado de objetos), he descubierto que estar expuesto a ejemplos de código escritos en un lenguaje OO como Java realmente ayuda a consolidar los conceptos de objetos. Por lo tanto, lo alentamos a leer las Partes 1 y 3, incluso si nunca tiene la intención de colocar las manos en el teclado para programar en Java después.

Cómo está organizado este libro
El libro está estructurado en torno a tres temas principales, como sigue.

Parte 1: El ABC de los objetos
Antes de sumergirme en los procedimientos del modelado de objetos y los detalles de la programación OO en Java, es importante que todos hablemos el mismo idioma con respecto a los objetos. La Parte 1, que consta de los Capítulos 1 a 7 , comienza lentamente, definiendo los conceptos básicos que subyacen a todos los enfoques de desarrollo de software, OO o de otro tipo. Pero los capítulos aumentan rápidamente a una discusión de conceptos de objetos avanzados para que, al final de la Parte 1, seas "experto en objetos".

Parte 2: Modelado de objetos 101
En la Parte 2, los Capítulos 8 a 12 del libro, me concentro en los principios subyacentes de cómo y, lo que es más importante, por qué hacemos las cosas que hacemos cuando desarrollamos un modelo de objeto de una aplicación, principios que son comunes a todos los objetos. técnicas de modelado. Es importante estar versado en UML, por lo que le enseño los conceptos básicos de UML y lo uso para todos los ejemplos de modelado concretos en mi libro. Utilizando las técnicas de modelado presentadas en estos capítulos, desarrollaremos un modelo de objeto "modelo" para un Sistema de registro de estudiantes (SRS) , cuya especificación de requisitos se presenta al final de esta introducción.

Parte 3: Traducir un objeto "Blueprint" en código Java
En la Parte 3 del libro, Capítulos 13 a 15 , ilustro cómo representar el modelo de objetos SRS que hemos desarrollado en la Parte 2 en una aplicación Java completamente funcional, para que sirva como capa modelo en una aplicación de tres niveles, y también hablaremos conceptualmente sobre cómo se pueden aprovechar las tecnologías de terceros para proporcionar una interfaz de usuario (conocida como capa o nivel de presentación ) y persistencia de datos (conocida como capa o nivel de datos ). El código fuente de SRS está disponible para su descarga desde GitHub ( github.com/Apress/Beginning-Java-Objects-3e ), y le recomiendo que descargue y experimente con este código cuando llegue a ese capítulo.

La especificación de requisitos para el SRS está escrita en el estilo narrativo con el que a menudo se expresan los requisitos del sistema de software. Puede sentirse seguro de que podría construir una aplicación hoy para resolver este problema, pero al final de mi libro, debería sentirse mucho más seguro de su capacidad para construirla como una aplicación orientada a objetos . En el Apéndice se presentan tres estudios de casos adicionales, para un Sistema de Seguimiento de Recetas (PTS) , un Sistema de Reserva de Salas de Conferencias y un Sistema de Reservas de Aerolíneas , respectivamente; estos sirven como base para muchos de los ejercicios presentados al final de cada capítulo.

Se han proporcionado sugerencias en el capítulo final sobre cómo podría desear continuar su proceso de descubrimiento orientado a objetos después de terminar mi libro. En ese capítulo, le proporciono una lista de libros recomendados que lo llevarán al siguiente nivel de competencia, dependiendo de cuál sea su intención de aplicar lo que ha aprendido en mi libro.

Convenciones
Para ayudarlo a aprovechar al máximo el texto y realizar un seguimiento de lo que sucede, hemos utilizado una serie de convenciones a lo largo del libro.

Por ejemplo:

Las notas se muestran de esta manera y reflejan información de fondo importante.

En cuanto a los estilos en el texto:
Cuando introducimos palabras importantes, las ponemos en negrita para resaltarlas.

Mostramos los nombres de los archivos, las URL y el código dentro del texto de la siguiente manera: objectstart.com .

Ponemos en negrita las líneas de código dentro de los pasajes de código largos si queremos llamar su atención sobre esas líneas en particular:
// La negrita se usa para llamar la atención sobre código nuevo o significativo:
Estudiante s = nuevo Estudiante();
// mientras que el código sin negrita es un código que es menos importante en el
// contexto actual, o ha sido visto antes.
entero x = 3;
Usamos la fuente de código en cursiva frente a la fuente de código regular para representar el pseudocódigo :
// Este es código real:
para (int i = 0; i <= 10; i++) {
    // ¡Esto es pseudocódigo!
    calcular la calificación para el i-ésimo estudiante
}
¿En qué versión de Java se basa este libro?
Como se mencionó anteriormente, Oracle Corporation continúa lanzando nuevas versiones del lenguaje Java de manera regular. La buena noticia es que, debido a que en mi libro me enfoco solo en la sintaxis del lenguaje Java central (características del lenguaje que se han mantenido estables desde el inicio de Java), este libro no es específico de la versión. Las técnicas y conceptos que aprenderá al leer mi libro le serán igualmente útiles cuando aparezcan nuevas versiones de Java. Dicho esto, todos los ejemplos de código en BJO son compatibles con las versiones de Java 8 a 17. (En términos generales, las nuevas versiones del lenguaje Java son compatibles con versiones posteriores, lo que significa que el código escrito para una versión anterior del lenguaje se compilará correctamente en una versión más nueva.)

Un pensamiento final antes de comenzar
Mucho del material de mi libro, particularmente al comienzo de la Parte 1, puede parecer demasiado simplista para los programadores experimentados. Esto se debe a que gran parte de la tecnología de objetos se basa en principios básicos de ingeniería de software que han estado en práctica durante muchos años y, en muchos casos, simplemente se han vuelto a empaquetar de forma ligeramente diferente. De hecho, hay algunos trucos nuevos que hacen que los lenguajes OO sean extremadamente poderosos y que eran virtualmente imposibles de lograr con lenguajes que no son OO: herencia y polimorfismo, por ejemplo, sobre los cuales aprenderá más en los Capítulos 5 y 7 , respectivamente. (Estas técnicas se pueden simular a mano en un lenguaje que no sea OO, al igual que los programadores podrían programar su propio sistema de administración de bases de datos (DBMS)desde cero en lugar de usar un producto comercial como Oracle o SQL Server, pero ¿quién querría hacerlo ?)

El mayor desafío para los programadores experimentados para dominar los objetos es reorientar la forma en que piensan sobre el problema que automatizarán:
Los ingenieros/programadores de software que han desarrollado aplicaciones utilizando métodos no orientados a objetos a menudo tienen que “desaprender” ciertos enfoques utilizados en los métodos tradicionales de análisis y diseño de software.

Paradójicamente, a las personas que recién comienzan como programadores (o como modeladores OO) a veces les resulta más fácil aprender el enfoque OO para el desarrollo de software como su único enfoque.

Afortunadamente, la forma en que necesitamos pensar sobre los objetos cuando desarrollamos software resulta ser la forma natural en que las personas piensan sobre el mundo en general. Entonces, aprender a "pensar" objetos, y programarlos en Java, ¡es tan fácil como (Parte) 1, (Parte) 2, (Parte) 3!

El código fuente de este libro se puede encontrar en https://​github.​com/​Apress/​Beginning-Java-Objects-3rd-ed .

Estudio de caso del sistema de registro de estudiantes (SRS)
ESPECIFICACIÓN DE REQUISITOS DEL SISTEMA DE REGISTRO DE ESTUDIANTES (SRS)
Se nos ha pedido que desarrollemos un Sistema de Registro de Estudiantes (SRS) automatizado. Este sistema permitirá que los estudiantes se registren en línea para los cursos cada semestre, así como el seguimiento del progreso de un estudiante hacia la finalización de su título.

Cuando un estudiante se inscribe por primera vez en la universidad, usa el SRS para establecer un plan de estudio sobre qué cursos planea tomar para satisfacer un programa de grado en particular y elegir un asesor de la facultad. La SRS verificará si el plan de estudios propuesto cumple o no con los requisitos de la carrera que el estudiante busca. Una vez establecido un plan de estudios, durante el período de inscripción anterior a cada semestre, los estudiantes pueden consultar el horario de clases en línea y elegir las clases a las que desean asistir, indicando la sección preferida (día de la semana y hora de día) si la clase es ofrecida por más de un profesor.

Suponiendo que (a) se cumplan los requisitos previos para los cursos solicitados, (b) los cursos cumplan con uno de los requisitos del plan de estudio del estudiante y (c) haya espacio disponible en cada una de las clases ), el estudiante está inscrito en la(s) clase(s).

Si (a) y (b) se cumplen, pero (c) no, el estudiante se coloca en una lista de espera por orden de llegada. Si una clase/sección para la que estaba previamente en la lista de espera vuelve a estar disponible (ya sea porque otro estudiante abandonó la clase o porque se incrementó la capacidad de asientos para la clase), el estudiante se inscribe automáticamente en la clase en la lista de espera y se le envía un mensaje de correo electrónico. a tal efecto se envía al estudiante. Es su responsabilidad abandonar la clase si ya no la desea; de lo contrario, se les facturará el curso.

Cualquier código fuente u otro material complementario al que haga referencia el autor en este libro está disponible para los lectores en GitHub a través de la página del producto del libro, ubicada en https://github.com/Apress/Beginning-Java-Objects-3e.

Table of Contents
Part I: The ABCs of Objects
Chapter 1:​ Abstraction and Modeling
Simplification Through Abstraction
Generalization Through Abstraction
Organizing Abstractions into Classification Hierarchies
Abstraction as the Basis for Software Development
Reuse of Abstractions
Inherent Challenges
What Does It Take to Be a Successful Object Modeler?​
Summary
Chapter 2:​ Some Java Basics
Java Is Architecture Neutral
Anatomy of a Simple Java Program
Comments
The Class Declaration
The main Method
Setting Up a Simple Java Development Environment
The Mechanics of Java
Compiling Java Source Code into Bytecode
Executing Bytecode
Primitive Types
Variables
Variable Naming Conventions
Variable Initialization
The String Type
Case Sensitivity
Java Expressions
Arithmetic Operators
Relational and Logical Operators
Evaluating Expressions and Operator Precedence
The Type of an Expression
Automatic Type Conversions and Explicit Casting
Loops and Other Flow Control Structures
if Statements
switch Statements
for Statements
while Statements
Jump Statements
Block-Structured Languages and the Scope of a Variable
Printing to the Console Window
print vs.​ println
Escape Sequences
Elements of Java Style
Proper Use of Indentation
Use Comments Wisely
Placement of Braces
Descriptive Variable Names
Summary
Chapter 3:​ Objects and Classes
Software at Its Simplest
Functional Decomposition
The Object-Oriented Approach
What Is an Object?​
State/​Data/​Attributes
Behavior/​Operations/​Methods
What Is a Class?​
A Note Regarding Naming Conventions
Declaring a Class, Java Style
Instantiation
Encapsulation
User-Defined Types and Reference Variables
Naming Conventions for Reference Variables
Instantiating Objects:​ A Closer Look
Garbage Collection
Objects As Attributes
A Compilation “Trick”:​ “Stubbing Out” Classes
Composition
The Advantages of References As Attributes
Three Distinguishing Features of an Object-Oriented Programming Language
Summary
Chapter 4:​ Object Interactions
Events Drive Object Collaboration
Declaring Methods
Method Headers
Method Naming Conventions
Passing Arguments to Methods
Method Return Types
An Analogy
Method Bodies
Features May Be Declared in Any Order
return Statements
Methods Implement Business Rules
Objects As the Context for Method Invocation
Java Expressions, Revisited
Capturing the Value Returned by a Method
Method Signatures
Choosing Descriptive Method Names
Method Overloading
Message Passing Between Objects
Delegation
Obtaining Handles on Objects
Objects As Clients and Suppliers
Information Hiding/​Accessibility
Public Accessibility
Private Accessibility
Publicizing Services
Method Headers, Revisited
Accessing the Features of a Class from Within Its Own Methods
Accessing Private Features from Client Code
Declaring Accessor Methods
Recommended “Get”/​“Set” Method Headers
IDE-Generated Get/​Set Methods
The “Persistence” of Attribute Values
Using Accessor Methods from Client Code
The Power of Encapsulation Plus Information Hiding
Preventing Unauthorized Access to Encapsulated Data
Helping Ensure Data Integrity
Limiting “Ripple Effects” When Private Features Change
Using Accessor Methods from Within a Class’s Own Methods
Exceptions to the Public/​Private Rule
Constructors
Default Constructors
Writing Our Own Explicit Constructors
Passing Arguments to Constructors
Replacing the Default Parameterless Constructor
More Elaborate Constructors
Overloading Constructors
An Important Caveat Regarding the Default Constructor
Using the “this” Keyword to Facilitate Constructor Reuse
Software at Its Simplest, Revisited
Summary
Chapter 5:​ Relationships Between Objects
Associations and Links
Multiplicity
Multiplicity and Links
Aggregation and Composition
Inheritance
Responding to Shifting Requirements with a New Abstraction
(Inappropriate) Approach #1:​ Modify the Student Class
(Inappropriate) Approach #2:​ “Clone” the Student Class to Create a GraduateStudent Class
The Proper Approach (#3):​ Taking Advantage of Inheritance
The “is a” Nature of Inheritance
The Benefits of Inheritance
Class Hierarchies
The Object Class
Is Inheritance Really a Relationship?​
Avoiding “Ripple Effects” in a Class Hierarchy
Rules for Deriving Classes:​ The “Do’s”
Overriding
Reusing Superclass Behaviors:​ The “super” Keyword
Rules for Deriving Classes:​ The “Don’ts”
Private Features and Inheritance
Inheritance and Constructors
A Few Words About Multiple Inheritance
Three Distinguishing Features of an OOPL, Revisited
Summary
Chapter 6:​ Collections of Objects
What Are Collections?​
Collections Are Defined by Classes and Must Be Instantiated
Collections Organize References to Other Objects
Collections Are Encapsulated
Three Generic Types of Collection
Ordered Lists
Dictionaries
Sets
Arrays As Simple Collections
Declaring and Instantiating Arrays
Accessing Individual Array Elements
Initializing Array Contents
Manipulating Arrays of Objects
A More Sophisticated Type of Collection:​ The ArrayList Class
Using the ArrayList Class:​ An Example
Import Directives and Packages
The Namespace of a Class
User-Defined Packages and the Default Package
Generics
ArrayList Features
Iterating Through ArrayLists
Copying the Contents of an ArrayList into an Array
The HashMap Collection Class
The TreeMap Class
The Same Object Can Be Simultaneously Referenced by Multiple Collections
Inventing Our Own Collection Types
Approach #1:​ Designing a New Collection Class from Scratch
Approach #2:​ Extending a Predefined Collection Class (MyIntCollection)
Approach #3:​ Encapsulating a Standard Collection (MyIntCollection2​)
Trade-Offs of Approach #2 vs.​ Approach #3
Collections As Method Return Types
Collections of Derived Types
Revisiting Our Student Class Design
The courseLoad Attribute of Student
The transcript Attribute of Student
The transcript Attribute, Take 2
Our Completed Student Data Structure
Summary
Chapter 7:​ Some Final Object Concepts
Polymorphism
Polymorphism Simplifies Code Maintenance
Three Distinguishing Features of an Object-Oriented Programming Language
The Benefits of User-Defined Types
The Benefits of Inheritance
The Benefits of Polymorphism
Abstract Classes
Implementing Abstract Methods
Abstract Classes and Instantiation
Declaring Reference Variables of Abstract Types
An Interesting Twist on Polymorphism
Interfaces
Implementing Interfaces
Another Form of the “Is A” Relationship
Interfaces and Casting
Implementing Multiple Interfaces
Interfaces and Casting, Revisited
Interfaces and Instantiation
Interfaces and Polymorphism
The Importance of Interfaces
Static Features
Static Variables
A Design Improvement:​ Burying Implementation Details
Static Methods
Restrictions on Static Methods
Utility Classes
The final Keyword
Custom Utility Classes
Summary
Part II: Object Modeling 101
Chapter 8:​ The Object Modeling Process in a Nutshell
The “Big Picture” Goal of Object Modeling
Modeling Methodology =​ Process + Notation + Tool
My Recommended Object Modeling Process, in a Nutshell
Thoughts Regarding Object Modeling Software Tools
A Reminder
Summary
Chapter 9:​ Formalizing Requirements Through Use Cases
What Are Use Cases?​
Functional vs.​ Technical Requirements
Involving the Users
Actors
Identifying Actors and Determining Their Roles
Diagramming a System and Its Actors
Specifying Use Cases
Matching Up Use Cases with Actors
To Diagram or Not to Diagram?​
Summary
Chapter 10:​ Modeling the Static/​Data Aspects of the System
Identifying Appropriate Classes
Noun Phrase Analysis
Refining the Candidate Class List
Revisiting the Use Cases
Producing a Data Dictionary
Determining Associations Between Classes
Association Matrices
Identifying Attributes
UML Notation:​ Modeling the Static Aspects of an Abstraction
Classes, Attributes, and Operations
Relationships Between Classes
Reflecting Multiplicity
Object/​Instance Diagrams
Associations As Attributes
Information “Flows” Along an Association “Pipeline”
“Mixing and Matching” Relationship Notations
Association Classes
Our “Completed” Student Registration System Class Diagram
Metadata
Summary
Chapter 11:​ Modeling the Dynamic/​Behavioral Aspects of the System
How Behavior Affects State
Events
Scenarios
Scenario #1 for the “Register for a Course” Use Case
Scenario #2 for the “Register for a Course” Use Case
Sequence Diagrams
Determining Objects and External Actors for Scenario #1
Preparing the Sequence Diagram
Using Sequence Diagrams to Determine Methods
Communication Diagrams
Revised SRS Class Diagram
Summary
Chapter 12:​ Wrapping Up Our Modeling Efforts
Testing the Model
Revisiting Requirements
Reusing Models:​ A Word About Design Patterns
Summary
Part III: Translating an Object Blueprint into Java Code
Chapter 13:​ A Few More Java Details
Java-Specific Terminology
Java Archive (jar) Files
Creating Jar Files
Inspecting the Contents of a Jar File
Using the Bytecode Contained Within a Jar File
Extracting Contents from Jar Files
“Jarring” Entire Directory Hierarchies
Javadoc Comments
The Object Nature of Strings
Operations on Strings
Strings Are Immutable
The StringBuffer Class
The StringTokenizer Class
Instantiating Strings and the String Literal Pool
Testing the Equality of Strings
Message Chains
Object Self-Referencing with “this”
Java Exception Handling
The Mechanics of Exception Handling
Catching Exceptions
Interpreting Exception Stack Traces
The Exception Class Hierarchy
Catching the Generic Exception Type
Compiler Enforcement of Exception Handling
Taking Advantage of the Exception That We’ve Caught
Nesting of Try/​Catch Blocks
User-Defined Exception Types
Throwing Multiple Types of Exception
Enum(eration)s
Providing Input to Command-Line-Driven Programs
Accepting Command-Line Arguments:​ The args Array
Introducing Custom Command-Line Flags to Control a Program’s Behavior
Accepting Keyboard Input:​ The Scanner Class
Using Wrapper Classes for Input Conversion
Features of the Object Class
Determining the Class That an Object Belongs To
Testing the Equality of Objects
Overriding the equals Method
Overriding the toString Method
Static Initializers
Variable Initialization, Revisited
Variable Arguments (varargs)
Summary
Chapter 14:​ Transforming the Model into Java Code
Suggestions for Getting the Maximum Value from This Chapter
The SRS Class Diagram Revisited
The Person Class (Specifying Abstract Classes)
The Student Class (Reuse Through Inheritance, Extending Abstract Classes, Delegation)
The Professor Class (Bidirectionality​ of Relationships)
The Course Class (Reflexive Relationships, Unidirectional Relationships)
The Section Class (Representing Association Classes, Public Static Final Attributes, Enums)
Delegation Revisited
The ScheduleOfClasse​s Class
The TranscriptEntry Association Class (Static Methods)
The Transcript Class
The SRS Driver Program
Summary
Chapter 15:​ Building a Three-Tier User Driven Application
A Three-Tier Architecture
What Does the Controller Do?​
Building a Persistence/​Data Tier
Building a Web-Based Presentation Layer
Example Controller Logic
The Importance of Model–Data Layer–View Separation
Summary
Further Reading
Appendix A:​ Alternative Case Studies
Index

Sobre el Autor
Jacquie Barker
es ingeniero de software profesional, autor y ex miembro adjunto de la facultad tanto en la Universidad George Mason en Fairfax, VA, como en la Universidad George Washington en Washington, DC. Con más de 30 años de experiencia como desarrolladora de software y administradora de proyectos, Jacquie ha dedicado los últimos 15 años a la tecnología de objetos y es competente como modeladora de objetos y programadora Java certificada por Sun Microsystems.

Jacquie obtuvo una licenciatura en ingeniería informática con los más altos honores del Case Institute of Technology/Case Western Reserve University en Cleveland, Ohio, y una maestría en ciencias informáticas, con énfasis en ingeniería de sistemas de software, de la Universidad de California, Los Angeles. Posteriormente, realizó estudios de posgrado en tecnología de la información en la Universidad George Mason en Fairfax, VA. La fórmula ganadora de Jacquie para enseñar los fundamentos de los objetos continúa recibiendo elogios de lectores de todo el mundo, y Muchas universidades han adoptado Begining Java Objects: From Concepts to Code como un libro de texto clave en sus planes de estudio básicos de TI.

A nivel personal, las pasiones de Jacquie incluyen a su esposo, Steve, y sus tres gatos, Walter, Rocky y Tanner; sirviendo como fundador y director ejecutivo de Pets Bring Joy, una organización de rescate de animales sin fines de lucro 501(c)(3) (visite pbj.org); y su reciente lanzamiento de un servicio de consultoría de TI pro bono para organizaciones sin fines de lucro de nueva creación (visite probonoit.org). Se puede contactar a Jacquie en jacquie.barker@gmail.com.

 
Acerca del revisor técnico
Manuel Jordán

es un desarrollador e investigador autodidacta que disfruta aprendiendo nuevas tecnologías para sus propios experimentos sobre la creación de nuevas integraciones entre ellas.
Manuel ganó el Premio Springy 2010 — Campeón de la Comunidad y Campeón de Primavera 2013. En su poco tiempo libre, lee la Biblia y compone música con su bajo y guitarra.

Manuel considera que la educación y capacitación constante es muy valiosa para cualquier desarrollador, lo mismo ocurre con la refactorización y las pruebas. Manuel puede ofrecer estos servicios para su empresa con su experiencia en Java y Spring.

Puede comunicarse con él principalmente a través de su cuenta de Twitter @dr_pompeii.
