# UNIDAD 1: PROGRAMACIÓN ORIENTADA A OBJETOS [PARTE 1]

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

1. Introducción a la programación orientada a objetos.

   1.1 Tipos de lenguajes de programación
   
   1.2 Características de los lenguajes de programación
   
   1.3 Compiladores e intérpretes
   
   1.4 El proceso de programa
   
   1.5 Clasificación de los lenguajes de programación
   
      * 1.5.1 Clasificación según el nivel
      
      * 1.5.2 Clasificación según su propósito y utilidad
      
      * 1.5.3 Según su generación
      
   1.6 Tendencias actuales
   
   1.7 Java
   
   1.8 HTML y otros lenguajes de marcado.
   
2. Clases

   2.1 Definición y buenas prácticas
   
   2.2 Compilar una clase
   
   2.3 Elementos de una clase
   
      * 2.3.1 Package statement
      
      * 2.3.2 Imports
      
      * 2.3.3 Comments
      
   2.4 Clases especiales
   
      * 2.4.1 Interface
      
      * 2.4.2 Clases abstractas
      
   2.5 Herencia
   
   2.6 Modificadores de acceso
   
      * 2.6.1 Public
      
      * 2.6.2 Protected
      
      * 2.6.3 Private
      
      * 2.6.4 Default
      
3. Creación de una clase

   3.1 Declaración de una clase

   3.2 Estructuras de control

      * 3.2.1 If else

      * 3.2.3 Do-while

      * 3.2.4 For loop
   
      * 3.2.5 Switch

   3.3 Definición de una clase

      * 3.3.1 Variables

      * 3.3.2 Parámetros de método

      * 3.3.3 Variables de instancia

      * 3.3.4 Variables de clase

   3.4 Tipos de datos

      * 3.4.1 Tipos de datos: primitivos

      * 3.4.2 Tipos de datos: objetos

      * 3.4.3 Constructor

      * 3.4.4 Métodos

   3.5 Clases ejecutables y clases no ejecutables
   
      * 3.5.1 Método main

   3.6 Ejecutar un programa Java por comandos del sistema

   3.7 Ejemplos


## Introducción

<img src="images/c1/1-1-mapa-conceptual.png">

Los lenguajes de programación son elementos indispensables en los sistemas informáticos para la construcción de software, que son las piezas que indican al sistema lo que debe realizar.  

Los programas y las sentencias que componen los programas informáticos se definen con una serie de símbolos y siguiendo unas reglas que constituyen la gramática de cada lenguaje de programación.  

Existen distintos tipos de lenguajes de programación y, cada uno de ellos, puede ser más adecuados que otros para determinadas funcionalidades.  

La programación permite encadenar y dotar de lógica a un conjunto de instrucciones destinadas a utilizar los recursos de una máquina, proporcionados frecuentemente por el sistema operativo.  

Un programa es un conjunto lógico de instrucciones cuya sintaxis atiende a un lenguaje de programación. Un lenguaje de programación, por tanto, es una notación formal para describir algoritmos o funciones que serán ejecutadas por un ordenador.

A lo largo de esta unidad aprenderemos los aspectos más destacados de la programación orientada a objetos, como crear clases, los tipos de datos, el uso de los objetos, la interacción entre los elementos y cuáles son las peculiaridades de Java que diferencian este lenguaje de otros. 

## 1. Introducción a la Programación Orientada a Objetos.

<img src="images/c1/1-2-lenguajes.png">

Los lenguajes de programación son, en cierto modo, análogos a los lenguajes naturales, es decir, a los que utiliza el ser humano para comunicarse. Por un lado, todo lenguaje de programación tiene un conjunto de símbolos permitidos, que sería el equivalente al léxico humano, por otro lado, debe contar con una sintaxis que especifica el modo correcto en que se pueden combinar los distintos símbolos para generar estructuras más complejas y, finalmente, todo lenguaje tiene una parte semántica, que aporta significado (en un contexto determinado) a cada símbolo y combinación de símbolos.  

#### Recuerda

```
Un lenguaje de programación es un conjunto de símbolos y de reglas para combinar dichos símbolos. 
Los lenguajes de programación se utilizan para definir algoritmos en un sistema informático. 
```

Cada día, el mundo de la programación va cambiando: nuevas técnicas y enfoques aparecen para resolver los más grandes retos, tanto empresariales como académicos. Debido a esto, debemos conocer el enfoque más usado en los lenguajes de programación, que es lo que llamamos programación orientada a objetos. Con esto contaremos con las técnicas necesarias para programar correctamente sin necesidad de depender de un lenguaje específico, gracias a que estas técnicas son independientes del lenguaje.

La programación es el proceso por el cual enseñamos al ordenador un conjunto de órdenes que debe ejecutar para lograr un propósito específico, es decir, es la forma en la cual podemos comunicarnos con los sistemas informáticos de modo que obedezcan las instrucciones que le indiquemos.   

A los lenguajes que utilizamos para comunicarnos con cada ordenador se les denomina lenguaje de programación y el conjunto de instrucciones finitas que sirven para cumplir un objetivo es conocido como algoritmo. De esta manera podemos enseñarle cómo solucionar problemas complejos de realizar manualmente solamente dándole las tareas específicas para que pueda resolverlas.   

Por ejemplo, en una empresa, donde la cantidad de trabajadores va en aumento, tendrán diversos problemas, tales como el pago de sus respectivos salarios en una fecha específica. Para este problema podemos enseñar al ordenador que realice el pago a los trabajadores indicando el monto, la fecha de pago y el número de cuenta de los trabajadores.

La programación es sumamente poderosa debido a que un sistema informático en la actualidad puede procesar millones de instrucciones por segundo. Esto aporta una gran rapidez a las tareas que se van a ejecutar y realiza una gran cantidad de cálculos. Sumado a esto, debemos tener en cuenta que la capacidad para almacenar datos es gigantesca, no solamente en los servidores y ordenadores tradicionales, sino que cada vez más también en dispositivos móviles. Por todo esto, la programación es actualmente una de las carreras más demandadas y esto aumentará en los próximos años.          

#### Recuerda

```
La programación es la forma en la cual definimos un conjunto de órdenes que un ordenador va a ejecutar 
para lograr un propósito específico. 
```

Algunos conceptos importantes para conocer son los siguientes:

* **Algoritmo**:
   
   Conjunto finito de sentencias simples que son ejecutadas secuencialmente por el ordenador para resolver un problema. En algunos casos a un algoritmo o conjunto de ellos se le conoce como programa.
   
* **Lenguaje de Programación**:

   Es un lenguaje que comprende un conjunto de reglas e instrucciones especiales que son interpretadas por el receptor, en este caso, un ordenador. Estos lenguajes son los que nos permiten escribir algoritmos.
   
* **Código Fuente**:

   Hace referencia al conjunto de líneas de instrucciones en un lenguaje de programación específico que conforman un programa.
   
#### Enlace de interes

El siguiente enlace podrás aprender un poco más sobre los algoritmos, su utilidad, tipos y características: 

[Algoritmo en Informática](https://concepto.de/algoritmo-en-informatica/)

Dentro del desarrollo de software existen diversos tipos de paradigmas que nos ayudan a enfrentarnos a los problemas cotidianos de programación. Antes de definir la programación orientada a objetos definamos, ¿qué es un paradigma? **Un paradigma es un conjunto de métodos que nos sirven como un modelo valido** (dentro un periodo de tiempo o contexto en particular) dentro de la programación.   

Esta variabilidad de los paradigmas se debe principalmente al aumento acelerado en la complejidad de los programas desarrollados y cada uno de estos puede usarse según los tipos de problemas a los que tienen que enfrentarse.  

Normalmente, los lenguajes de programación nos enmarcan en un paradigma con el cual trabajar, ya que proporcionan diversos tipos de herramientas que se utilizan con dicho paradigma.       

<img src="images/c1/1-3-lenguajes-2.png">

Uno de los paradigmas predecesores a la programación orientada a objetos fue la programación funcional. Este paradigma fue implementado en lenguajes como Lisp, SAP o Scala. Su principal enfoque dicta que la solución de los problemas se tiene que describir usando funciones, definiendo una función como un subprograma con un conjunto de entradas y con una única salida.

Aunque este paradigma es utilizado en la mayoría de las ocasiones para lenguajes y entornos académicos, existen algunos lenguajes con diferentes propósitos que implementan dicho enfoque. Alguno de estos son Javascript o PERL que, aunque no son puramente funcionales, cuentan con muchas de sus herramientas a disposición del programador.

#### ¿Sabías que...?

```
Javascript fue el lenguaje más utilizado en el año 2018. Este informe fue ofrecido por Github, importante 
empresa en el control de versiones de código fuente en línea. 
```

Como se mencionó anteriormente, debido a la complejidad de los problemas en el ámbito profesional, se produjo la aparición de nuevos paradigmas, entre ellos la programación orientada a objetos.   

La programación orientada a objetos es un paradigma de programación que, como su nombre indica, modela los datos utilizados en el programa como objetos (similares a los del plano físico), incorporándoles características tales como propiedades y comportamientos. A estas propiedades usualmente en programación orientada a objetos se les conoce como atributos y para definir comportamientos del objeto se utilizan métodos.     

#### Artículo de interés

```
En el siguiente artículo podrás aprender las  ventajas  del  uso  de  una  metodología  de  diseño orientada 
a objetos para desarrollar aplicaciones web. 
```

[Construyendo aplicaciones web con una metodología de diseño orientada a objetos](https://revistas.unab.edu.co/index.php/rcc/article/view/1116/1087)

<img src="images/c1/1-4-clases.png">

Para entender mejor estos conceptos vamos a describir el objeto coche. Un coche tiene como atributos color, tamaño, cantidad de pasajeros, modelo, etc., y su comportamiento se puede definir con métodos como encender, apagar, acelerar, etc.  

Como vimos anteriormente, la programación orientada a objetos utiliza el concepto de objeto como unidad principal para resolver los problemas y a través de ellos se definen sus atributos y métodos. Sin embargo, otro concepto de fundamental de la programación orientada a objetos (POO) es la clase.  

Podemos definir una clase como el modelo de objeto del cual partimos para la creación de los objetos. Dicho de otra forma, un objeto es solo un valor particular de una clase. Para entender mejor el concepto de clase veamos el siguiente grafico utilizando el anterior ejemplo de coche.  

Es así como la clase coche puede tener una instancia como, por ejemplo, un vehículo Nissan con sus respectivos atributos y propiedades declarados en la clase (tales como cantidad de pasajeros, color, etc.) y definidos en el objeto con valores específicos (tales como cinco pasajeros, rojo, etc.).   

#### ¿Sabías que...?

```
La definición de “instancia” se puede usar del mismo modo que la+ de “objeto” ya que ambos hacen referencia 
a un estado especifico de una clase en un momento determinado. 
```

Por otro lado, los lenguajes de programación orientada a objetos definen un conjunto de principios para la codificación. Estos principios son:       

* **Encapsulación**:

   La encapsulación es el mecanismo que nos permite ocultar el estado y el comportamiento de un objeto. Esto permite restringir el acceso hacia nuestros objetos y mantener un alto grado de integridad de los datos.
   
   Una correcta encapsulación nos aporta seguridad en el momento de reutilizar los métodos, ya que solo podremos utilizar los atributos y métodos permitidos.

* **Abstracción**:

   La abstracción es un concepto que nos permite reducir la complejidad en el uso de objetos, puesto que nos permitirá usar alguno de sus atributos o métodos sin la necesidad de conocer en detalle el proceso interno que tiene este método. Con esto nos aseguramos de que cada uno de los objetos conozca solamente los datos necesarios para comunicarse con otros objetos y no toda su implementación.
   
* **Polimorfismo**:

   El polimorfismo, como su nombre indica, nos permitirá agregar múltiples comportamientos hacia un mismo elemento, por ejemplo, un mismo método de una clase puede tener diferentes tipos de resultados dependiendo de la implementación que esté utilizando.
   
   Este mismo ejemplo es aplicable a nivel de clases o atributos. De esta forma podemos reutilizar el código y no repetir las mismas líneas para cada implementación.

* **Herencia**

   La herencia es uno de los conceptos más importantes dentro de la programación orientada a objetos y es la que nos permite utilizar en una clase “hija” los métodos o atributos de una clase “padre”.
   
   En la herencia tenemos los siguientes conceptos:

   * Superclase o clase padre, es aquella clase que tiene los atributos y métodos que van a ser heredados por la otra clase (subclase).
   
   * Subclase o clase hijo, es aquella clase que va a “heredar” los atributos o métodos de su respectiva superclase. En otras palabras, podrá usar dichas características sin ser la misma clase.
   
   
#### Ejemplo Práctico

Quieres realizar dos operaciones bancarias, la primera de ellas es depositar dinero en tu cuenta corriente y la segunda una transferencia bancaria. ¿Qué tipo de lenguaje se utilizan para estas operaciones?

En el primer caso, el proceso para depositar dinero a tu cuenta corriente, existirá un método que recibirá como datos de entrada el número de cuenta y el monto a depositar, y finalmente como resultado nos indicará si la operación fue realizada correctamente. Un método bien encapsulado nos retornará la información necesaria y nos dejará ingresar solo los datos necesarios.

Un método que no ha sido encapsulado correctamente nos permitirá, por ejemplo, modificar las tasas de comisión que aplica el banco por el depósito, mostrar la contraseña de cuenta de un usuario, etc.

En el segundo de los casos, cuando intentemos realizar una transferencia interbancaria, un proceso del banco A recibirá el número de cuenta del cliente junto con la cantidad de dinero y lo derivará al proceso del banco destino B, en donde se realizará el depósito del monto.

En este caso, el banco A solo espera una respuesta de confirmación para continuar con su proceso y no conoce que procedimientos realiza el banco B para realizar el depósito, ya que solo conoce sus entradas y salidas. Este es un ejemplo clásico de abstracción a nivel de métodos.

### 1.1 Tipos de lenguajes de programación

Los primeros lenguajes de programación se consideraron lenguajes de bajo nivel o lenguajes a nivel de máquina, ya que estos lenguajes dependían de la arquitectura concreta de cada sistema informático.  

Posteriormente surgieron, los más abundantes y utilizados hoy en día, los lenguajes de programación de alto nivel. Su denominación hace referencia a que éstos son más abstractos, más próximos al lenguaje natural y, por tanto, más sencillos de utilizar por un programador.  

Los lenguajes de alto nivel no dependen de forma directa de la arquitectura o características físicas del sistema informático que ejecutará el programa que en dicho lenguaje haya sido desarrollado. De este modo, una vez que se ha especificado un algoritmo sencillo o un complejo programa compuesto por miles de algoritmos, es realmente sencillo trasladar o portar ese programa a otra máquina completamente diferente. 

Gracias a los lenguajes de programación de alto nivel los programadores, hoy en día, pueden desempeñar su labor de forma cómoda, sencilla y potente. Las grandes ventajas de utilizar lenguajes de alto nivel se resumen en: 

1. El programador no necesita conocer exhaustivamente como funciona un ordenador internamente, ya que el lenguaje de programación le permite especificar instrucciones que posteriormente se traducirán a un código inteligible por el sistema. 

2. El programador no necesita traducir el programa para ser utilizado en otros sistemas, ya que si existe una versión del lenguaje de programación para el nuevo sistema, el proceso de cambio no es crítico. 

3. La variedad de lenguajes y la estandarización existente permite que se pueda seleccionar el lenguaje más adecuado para cada tipo de programa que se vaya a desarrollar.   

4. Los tiempos para desarrollar un programa se reducen, ya que la potencia de los lenguajes de alto nivel radica en que, al utilizar un lenguaje más abstracto que el que entiende la máquina, al fin de cuentas, se reduce a combinaciones de ceros y unos, por lo que es sencillo y con pocas líneas de código se ordena al sistema que realice acciones muy complejas. 

5. Al ser lenguajes cada vez más próximos al lenguaje natural e, incluso, parecidos al idioma inglés, el aprendizaje de los mismos es bastante sencillo. 

## 1.2 Características de los Lenguajes de Programación

* Instrucciones

   Se introducen en el sistema informático mediante cadenas de texto y que indican órdenes que deben ser ejecutadas por el sistema.
   
* Variables

   Permite la creación y nombrado de variables 

* Operaciones y funciones

   Incluye multitud de instrucciones ya definidas en el propio lenguaje como son operaciones y funciones que simplifican la especificación en un algoritmo de operaciones aritméticas básicas como la suma o la resta y otras funciones algebraicas o trigonométricas más complejas. De igual modo incluyen funciones para efectuar comparaciones lógicas, manejar estructuras simples de datos, como un número real, pero también complejas, para la operación con vectores, matrices, etc. 

* Comentarios

   Los lenguajes de programación también suelen permitir, para facilitar la labor de desarrollo de programas, pero sobre todo, para facilitar la labor posterior de mejora y mantenimiento de los sistemas, introducir comentarios combinados con el propio código. El objeto de estos comentarios no es que sean entendidos por la máquina, ya que el sistema no se ocupará de ellos, sino que sirvan de referencia para otros programadores.

Tal y como se ha comentado, los primeros lenguajes de programación, permitían que el código programado fuese comprendido y, por tanto, procesado por el sistema informático, de forma directa. Pero los lenguajes de alto nivel requieren de un paso intermedio donde el código que se ha escrito (código fuente), sea traducido a un código comprensible por la máquina (código objeto).  

Las características específicas del proceso de traducción, devendrán en que el traductor en cuestión, sea un compilador o un intérprete.

#### Enlace de interés

```
En el siguiente enlace puedes aprender un poco más sobre las características de los lenguajes de programación. 
```

[Enlace](https://sites.google.com/site/juanrodriguez16441710pb/unidad-2---introduccion-a-la-programacion/2-1-caracteristicas-del-lenguaje-de-programacion)

## 1.3 Compiladores e intérpretes

<img src="images/c1/1-5-compiladores.png">

Un  compilador parte de un código que se ha escrito en un lenguaje de alto nivel, que se denomina código fuente o programa fuente y lo convierte, mediante el proceso de traducción, en código objeto, que se encuentra en lenguaje máquina.  

Este resultado, denominado código objeto, ya es comprensible por el ordenador donde ha sido compilado. Un programa que ha sido compilado puede andar por si solo en cualquier otro sistema de características análogas al sistema donde se ha compilado.  

Sin embargo, un intérprete realiza un proceso de traducción distinto, ya que en vez de generar un código objeto que pueda ser almacenado en algún tipo de memoria o soporte de almacenamiento masivo para su ejecución recurrente en el futuro, el intérprete debe analizar el código fuente todas y cada una de las veces que se desea ejecutar el programa.  

Por ese motivo, todo sistema informático, donde se quiera correr un programa que se ha desarrollado, requiere contar con un intérprete que lo permita, ya que el proceso de traducción y el de ejecución se realizan simultáneamente y, por supuesto, requiere contar con el código fuente.

La  ventaja de utilizar intérpretes es que, aunque es necesario repetir el proceso de traducción tantas veces como se ejecute el programa, al contar con el código fuente, que por estar escrito en un lenguaje de alto nivel es independiente de la máquina siempre y cuando se cuente con el intérprete adecuado, el programa podrá ser ejecutado en sistemas heterogéneos, con independencia de la arquitectura y/o del sistema operativo.  

La desventaja es que se hace imprescindible para cada ordenador donde se vaya a ejecutar, el disponer de un intérprete adecuado que, por un lado, tenga capacidad para interpretar el lenguaje de alto nivel en que ha sido programado y, al mismo tiempo, sea compatible con la plataforma donde se desea ejecutar el código.  

Los compiladores, por tanto, aportan la ventaja de producir archivos compilados que pueden ser distribuidos fácilmente.

<img src="images/c1/1-6-java.png">

De  cualquier modo, desde un punto de vista técnico, la principal diferencia entre intérpretes y compiladores radica en la velocidad. Los compiladores, en el proceso de traducción para convertir código fuente en código objeto, tienen una visión global de todo el programa, lo que les permite optimizar al máximo posible las instrucciones generadas en el resultado, es decir, en el código objeto. Sin embargo, un intérprete, al ejecutar instrucción tras instrucción a partir del código que está analizando, no puede realizar esta optimización, motivo por el cual la velocidad de ejecución de un programa compilado puede ser 5, 10 o 20 veces más rápida que un programa equivalente que sea interpretado.  

## 1.4 El proceso de programa

El  proceso completo de la programación sigue el siguiente esquema:  

* Programa fuente 
* Compilador/Intérprete 
* Enlazador de librerías 
* Programa ejecutable en binario 
* Almacenamiento en disco 
* Ejecución en CPU

Los elementos necesarios para este proceso son:

* Compilador
   Es un tipo específico de traductor que analiza la sintaxis del código que se ha programado en un lenguaje de alto nivel y lo traduce a un código objeto en disposición de ejecutarse.

* Montador de enlaces
   Como su nombre indica, se encarga de unir las distintas piezas de código objeto y genera con ello el programa completo, que se llama módulo de carga
   
* Cargador
   Es el encargado de llevar a la memoria el módulo de carga para que pueda ser ejecutado por el sistema informático.
   
* Librerías
   Son una facilidad que ofrecen ciertos lenguajes de programación y que evita la creación y repetición de código de una forma innecesaria y, sobre todo, improductiva. El código que pueda ser similar a diversos programas, se crea una única vez y se almacena de forma independiente. Este conjunto de módulos de código son las librerías. Estas librerías pueden ser creadas por el propio programador en base a sus necesidades o, aquellas librerías que responden a funcionalidades muy básicas, suelen estar incorporadas en el propio paquete de lenguaje de programación o, incluso, ser de dominio público. Las librerías se suelen compilar, por cuestiones de comodidad y optimización, de forma separada del código fuente que se ha creado. Esas porciones de código objeto son las que el linker se encarga de unir en una sola, válida para ser almacenada y/o ejecutada. Por ello, que entre la etapa de compilado y la de ejecución, al menos, hay una etapa intermedia.
   
## 1.5 Clasificación de los lenguajes de programación

<img src="images/c1/1-7-codigo.png">

La clasificación de los lenguajes de programación puede obedecer a diversos criterios.

### 1.5.1 Clasificación según el nivel

Es  el primer criterio de clasificación y el históricamente más reconocido, aunque desde un punto de vista práctico no es el criterio más relevante actualmente.  

El nivel de un lenguaje de programación está relacionado con la proximidad que el lenguaje guarda con la herramienta de expresión del ser humano que es el lenguaje natural.  

En los lenguajes de bajo nivel, las órdenes dadas al sistema informático se encuentran muy próximas al lenguaje máquina y, se basan en la combinación de una base binaria compuesta por ceros y por unos. Al fin y al cabo, en la informática tal y como la conocemos, todo se instancia en ceros y unos: circuitos electrónicos, puertas lógicas, condiciones de cierto y falso, etc.   

Lenguajes de bajo nivel son:

* Lenguaje máquina

   Es el lenguaje que directamente entiende el sistema. Es de gran complejidad realizar desarrollos directamente en lenguaje máquina y, por tanto, solo se utiliza para porciones concretas de código, donde acceder directamente a los recursos del sistema genera ventajas en la fiabilidad o velocidad del programa desarrollado. El lenguaje máquina se reduce al conjunto de instrucciones que entiende la CPU del sistema informático, motivo por el cual, cada lenguaje máquina es dependiente del sistema. En lenguaje máquina, el programador también se responsabiliza de controlar las referencias a las localizaciones en memoria de los datos.
   
* Lenguaje ensamblador

   Es una ayuda al programador que necesita programar en lenguaje máquina, donde las instrucciones de la CPU y direcciones de memoria se han sustituido por símbolos para facilitar la labor de escritura del código por los programadores. 
   
Los  lenguajes de medio nivel en ocasiones, se incluyen dentro de los lenguajes de alto nivel. Los lenguajes de medio nivel permiten acceder directamente a los recursos del sistema, pero, a pesar de ello, el código desarrollado puede ser portado a otras plataformas como ocurre con los lenguajes de alto nivel. Permiten programar con una elevada abstracción del sistema, pero si es necesario, también posibilitan el acceso directo a recursos de la máquina. El conocido lenguaje C se considera un lenguaje de medio nivel.

#### Recuerda

```
Los lenguajes de alto nivel, también se llaman declarativos, porque se basan en introducir órdenes 
a los sistemas informáticos. Mediante los lenguajes declarativos, los programadores pueden definir 
el flujo lógico que se desea que siga el procesamiento del sistema 
```

Dentro de los lenguajes de programación de alto nivel existen dos subclasificaciones importantes:       

* Lenguajes imperativos

   Estos también se denominan lenguajes procedurales, ya que se basan en la definición de procedimientos. En estos lenguajes es muy importante la utilización de variables, que son identificativos que se dan a posiciones de memoria, que permiten el almacenamiento de valores y realizar operaciones de diverso tipo con los datos almacenados.

* Lenguajes funcionales

   Permiten un paradigma distinto de programación. La principal diferencia con los lenguajes declarativos es que en ellos no se utilizan las variables para almacenar valores. Esta diferencia se suple mediante la concatenación de distintas funciones, donde cada una de ellas puede devolver uno o varios resultados que, a su vez, pueden ser tomados por otra función para obtener un nuevo resultado. 
   
### 1.5.2 Clasificación según su propósito y utilidad

<img src="images/c1/1-8-lips.png">

A  diferencia de los lenguajes utilizados por el ser humanos, que son válidos para todo tipo de situaciones, contextos o modos de uso, los lenguajes de programación, como cualquier lenguaje artificial, tienen ciertas limitaciones. Por este motivo, lenguajes de programación que son perfectamente válidos para realizar una tarea determinada, pueden no serlo tanto para realizar otra diferente o, cuando menos, no ser la opción más adecuada. A saber:       

* Uso cientifico
   Desde los orígenes de la informática contemporánea, uno de los campos de aplicación ha sido la ciencia. Por ello, muchos lenguajes de programación, incluso algunos de los más históricos, fueron desarrollados específicamente para ser explotados en entornos científicos, donde la necesidad de realizar cálculos matemáticos y procesar datos, era muy elevada. Un lenguaje por excelencia para este propósito es el FORTRAN, siendo la versión FORTRAN77 la más conocida y utilizada durante muchos años en centros de cálculo, universidades, laboratorios, etc.

* Gestión empresarial
   Otro de los campos tradicionales de aplicación de los beneficios de la informática ha sido la empresa, especialmente necesitada de sistemas robustos para el procesamiento de datos. El lenguaje más reconocido en este ámbito desde hace décadas y, sobre el cual, todavía hoy, se encuentran en explotación muchos sistemas de importantes empresas es el COBOL, que ha demostrado ser una gran herramienta para la gestión de archivos, bases de datos, consulta de información, etc.

* Inteligencia artificial
   La inteligencia artificial es una disciplina de investigación muy importante en las ciencias de la computación. Unido ello, a la dificultad que plantean los conceptos involucrados, ha provocado que se hayan desarrollado lenguajes específicos para el desarrollo de aplicaciones en este campo como son el LISP y el PROLOG, con el objeto de acercar el modo de programar a los esquemas de pensamiento donde son utilizados como herramienta.

* Sistemas de control y otros desarrollos complejos
   Para la creación de desarrollos software complejos, como pueden ser aquellos orientados a servir como sistemas de control en aviónica, centrales nucleares, etc. o, incluso, para el desarrollo de componentes de sistemas informáticos como son los sistemas operativos, el lenguaje C ha dominado en los últimos años, especialmente por la potencia y capacidades que proporciona a los desarrolladores.
   
### 1.5.3 Según su generación

Los  lenguajes de programación han ido evolucionando desde los inicios de la ciencia informática, desde la primera a la quinta generación. Aunque la clasificación por generaciones es más común y aceptada para el hardware, bien es verdad que los lenguajes de programación cuentan con una clasificación similar. De cualquier modo, es importante recalcar que la clasificación por generaciones en hardware y lenguajes de programación no está relacionada ni es equivalente:       

* Lenguajes de primera generación
   Los lenguajes de primera generación son los lenguajes máquina, es decir, donde el único modo de indicar órdenes a un sistema informático se basaba en utilizar el lenguaje de más bajo nivel, el lenguaje que el sistema podía comprender sin traductores.
   
* Lenguajes de segunda generación
   La segunda generación de lenguajes de programación, que nace entre 1949 y 1952, se basa en las primeras facilidades y simplificaciones que surgen en la tediosa tarea de comunicarse con un sistema informático en lenguaje máquina. El ejemplo más característico de estas mejoras es el ensamblador.

* Lenguajes de tercera generación
   La tercera generación es la primera que se abre a los lenguajes de alto nivel, más concretamente a los lenguajes imperativos como son los conocidos FORTRAN, COBOL, PASCAL y los menos conocidos como Ada o Lisp. Lenguajes, por otra parte, que continúan siendo perfectamente válidos para el aprendizaje de las técnicas de programación, como, en muchos casos, para un uso profesional y empresarial de los mismos. Mención especial en esta generación para el BASIC, lenguaje que, aunque de escasa potencia, fue ideado para facilitar el acceso y aprendizaje de los fundamentos de la programación a individuos sin conocimiento de algoritmia ni tecnología, incluso a los niños. El inicio de esta generación se marca en 1954.
   
* Lenguajes de cuarta generación
   La cuarta generación, de dilatada vida y éxito comercial. Los lenguajes pertenecientes a esta generación se conocen por las iniciales 4GL. Los primeros exponentes de esta generación surgen a inicios de los años 60. Dentro de la cuarta generación se incluyen los lenguajes funcionales, lenguajes que se basan en programación lógica, los novedosos en su momento lenguajes orientados a objetos como el JAVA. Finalmente, la última categoría dentro de esta generación son los lenguajes visuales, que son completos entornos de desarrollo, donde la labor del programador se simplifica mucho y la productividad se eleva, ya que los tiempos de desarrollo se acortan gracias a las ayudas a la programación, la simplicidad de los lenguajes, las librerías construidas que ahorran tiempo de desarrollo y evitan la creación de código repetitivo, etc.
   
#### Artículo de interes

```
En el siguiente artículo podrás profundizar en la historia de la informática. 
```

[Enlace](http://museo.inf.upv.es/wp-content/uploads/2016/12/Un%20viaje%20a%20la%20historia%20de%20la%20inform%C3%A1tica.pdf)

## 1.6 Tendencias actuales

.NET  Framework es el modelo de programación de la plataforma .NET de Microsoft para crear, implementar y ejecutar aplicaciones web. Administra gran parte de los detalles de infraestructura, permitiendo a los desarrolladores centrarse en escribir el código de la lógica empresarial o de negocio para sus aplicaciones. Se reduce de esta manera drásticamente el tiempo de desarrollo de aplicaciones. 

.NET Framework, desde su creación, permite o ha permitido programar, incluso mezclando distintos lenguajes en una misma aplicación, en los siguientes lenguajes: APL, Fortran, Perl, C++, Haskel, Python, C#, Java, RPG, COBOL, JavaScript, Scheme, Component Pascal, Mercuri, Mondrian, Small Talk, Currículo, Obreron, Standard ML, Eiffel, Oz, Pascal, Visual Basic, etc.  De  entre toda esta lista de lenguajes, cabe destacar el C# pues es la contraposición que Microsoft hace a Java y su apuesta como lenguaje de programación destacado para la plataforma.        

<img src="images/c1/1-9-net.png">

De  entre toda esta lista de lenguajes, cabe destacar el C# pues es la contraposición que Microsoft hace a Java y su apuesta como lenguaje de programación destacado para la plataforma.  

Esta capacidad de multilenguaje de .NET Framework permite a los desarrolladores utilizar el lenguaje de programación que es más apropiado para una tarea dada y combinar lenguajes en una sola aplicación. Además, el tiempo de aprendizaje del programador para este entorno se reduce drásticamente pues podrán seguir programando en la mayoría de los casos en el lenguaje al que estaban habituados.  


#### Enlace de interes

```
En el siguiente enlace puedes aprender un poco más sobre qué es .Net Framework
```

[Enlace](https://www.islabit.com/64829/microsoft-net-framework-pc.html)


## 1.7 Java

<img src="images/c1/1-10-java.png">

Java, el lenguaje de programación sobre el que profundizaremos a lo largo de este curso, es el lenguaje más difundido actualmente. Tiene unas características muy particulares que lo sitúan a mitad de camino entre un lenguaje compilado y uno interpretado.  

Java fue desarrollado por una empresa de informática llamada Sun Microsystems que fue adquirida posteriormente por el fabricante de bases de datos Oracle.  

El objetivo de Java es que los programas desarrollados en este lenguaje puedan ejecutarse sin necesidad de cambios en distintas máquinas, arquitecturas y dispositivos, algo que, como se ha comentado, es una de las principales problemáticas de los lenguajes compilados. Esto se debe a que Java, además de ser un lenguaje de programación, incluye un elemento llamado máquina virtual, que permite introducir una etapa intermedia entre el código fuente y el código objeto, con lo que se consigue que el programa construido pueda ser portado en el mismo instante en que se ejecuta.       

Java , como lenguaje, se inspira en la sintaxis de C++, pero su funcionamiento es similar al de Smalltalk.  

Un programa en Java generalmente es compilado en un lenguaje intermedio llamado bytecode, que no llega a ser código objeto, para posteriormente ser interpretado por la máquina virtual.  

La máquina virtual, como se ha adelantado, es un elemento intermedio que abstrae la máquina donde se ejecuta el programa del lenguaje. Con ello, se consiguen los beneficios de los lenguajes de programación interpretados, ya que con un único código fuente, se puede ejecutar el programa en cualquier sistema.  

Aunque este es el proceso de traducción más común en Java y el que lo distingue de cualquier otro lenguaje, no quiere decir, que un programa en Java no pueda ser compilado en un sentido tradicional.       

<img src="images/c1/1-11-video.png">

[Video](https://www.youtube.com/watch?v=cJEzUxkYurk)

## 1.8 HTML y otros lenguajes de marca

En  términos estrictos, los lenguajes de marcado, siendo HTML el más conocido, no son lenguajes de programación, ya que no cuentan con varias de las características que definen a un lenguaje de programación.  

El lenguaje HTML nace paralelamente al servicio world wide web (WWW) para responder a la necesidad generada a partir de la creciente cantidad de información de los servidores conectados a Internet. Era necesario desarrollar un sistema que permitiese a los usuarios de Internet acceder a información residente en un servidor sin necesidad de conocer el archivo que la contenía. Además, el sistema utilizado habría de ser universal, es decir, no dependiente de la plataforma y lo más simple posible para garantizar su compatibilidad. Finalmente, tenía que ser posible enlazar diferentes páginas mediante tecnología de hipertexto.  


#### Enlace de interes

```
En el siguiente enlace puedes aprender un poco más del origen del lenguaje HTML.
```

[Enlace](https://uniwebsidad.com/libros/xhtml/capitulo-1/breve-historia-de-html)

Así  nace el HTML, que no es más que un archivo de texto que contiene una serie de etiquetas o marcas que dan formato a la información que se almacena entre ellas. La función del navegador es la de recorrer el documento interpretando las etiquetas y dando la apariencia indicada por estas a la información contenida en medio. Así, cuando se encuentra un texto entre las etiquetas `<TITLE>` y `</TITLE>`, el navegador lo extrae y sabe que tiene que introducirlo en su barra de títulos.    

De este modo, un documento HTML estará exclusivamente formado por etiquetas y la información acotada entre ellas. El comienzo de un bloque de información acotado comienza siempre mediante la correspondiente etiqueta entre los caracteres `"<"` y `">"`, mientras que el fin del mismo viene indicado por el mismo nombre de la etiqueta entre los caracteres `"</"` y `">"`

La  estructura básica de un documento HTML consiste en un bloque principal y dos secundarios. El bloque principal viene acotado entre las etiquetas `<HTML>` y `</HTML>`, que marcan el comienzo y fin del documento. Dentro de este bloque principal se ubican los bloques secundarios de cabecera `<HEAD>` y `</HEAD>` cuerpo  `<BODY> </BODY>`. En la cabecera se incluye el título del documento, así como información de ayuda para los buscadores, los llamados meta-datos. Finalmente, en el cuerpo de la página es donde se define el grueso del documento. Aquí en función de lo que se desee hacer, se pueden utilizar un gran número de etiquetas.  

El XML no es un lenguaje en si sino un metalenguaje, es decir, un lenguaje para definir lenguajes. Su versión 1.0 apareció como recomendación del World Wide Web Consortium en 1998. Está basado en el SGML (Standard Generalized Markup Language o Lenguaje basado en Etiquetas Generalizado) y es una particularización o simplificación suya.      

#### Artículo de interés

```
En el siguiente artículo puedes aprender un poco más de XML y cómo se utiliza para estructurar información. 
```

[Enlace](http://www.villate.org/publications/Villate_manual_5.pdf)

Mediante  XML no simplemente damos formato a una serie de datos a presentar, que es lo que básicamente se realiza con HTML, sino que se define la propia naturaleza de la información contenida en el documento. Se puede pensar en HTML como en un subconjunto de XML. Podemos definir un lenguaje de marcado, como es HTML, a nuestro gusto mediante XML. Sin embargo, no sería correcto creer que el último sustituirá al primero puesto que XML soluciona el problema de presentación en función de la plataforma pero la presentación se seguirá realizando en HTML mientras que la actualización de contenidos puede llevarse a cabo por transferencias XML sin necesidad de rescribir los archivos de presentación HTML correspondientes.   

XML no nace con el fin de ser un simple lenguaje de marcado, sino que su misión fundamental es la de servir de estándar para el intercambio de datos entre aplicaciones.  

#### Para saber más

```
Puedes consultar la última versión de HTML en el siguiente enlace:
```

[Enlace](https://www.w3.org/TR/html53/)


<img src="images/c1/1-12-crucigrama.png">

<img src="images/c1/1-13-crucigrama.png">

## 2. Clases

Las  clases son una parte fundamental en la programación actualmente. Todo el diseño de un sistema se modela utilizando clases, por lo que es muy importante entender la creación de una clase, estructurar los datos y conocer el proceso que utiliza Java para manejar las clases.  

Una clase es un modelo en donde se especifican los atributos y métodos que van a tener los objetos. Es esta clase la que nos va a permitir crear objetos con los cuales podremos trabajar.         

### 2.1 Definición y buenas prácticas

Antes de entrar a ver una clase programada en Java, entendamos primero la necesidad de crear clases cuando tenemos que resolver un problema.  

Muchas veces es necesario abstraer cierta información e identificar cuáles van a ser las características necesarias que intervengan en el problema a solucionar.   

Otro aspecto importante cuando se modela una clase es entender cuál es el fin u objetivo que va a llevar a cabo la clase y su relación con los demás. Esto es muy importante, ya que con esto definimos un alcance especifico y no sobrecargamos una clase con métodos que no corresponden a su función.      

#### Artículo de interes

```
En el siguiente artículo puedes aprender un poco más acerca del concepto de clases. 
```

[Enlace](https://www.fdi.ucm.es/profesor/jpavon/poo/1.1.Objetos%20y%20Clases.pdf)

#### Ejemplo practico

Eres el dueño de una fábrica de zapatos y deseas automatizar la venta de estos poniendo una tienda por internet.   

En el momento de modelar la clase cliente en el sistema, solo tendrás en cuenta atributos tales como nombres, apellidos, número de tarjeta de crédito, etc. Sin embargo, muchos de ellos quedarán a un lado como el peso, altura, etc. ya que no son necesarios para la resolución del problema empresarial, que es la venta de zapatos. Así que en el momento de modelar las clases debemos tomar en cuenta solamente los atributos necesarios para su resolución.     

### 2.2 Compilar una clase

<img src="images/c1/1-14-jvm.png">

Java  fue creado con el propósito de escribir código solo una vez y que funcione en donde sea (Write Once Run Anywhere). Esto significa que independientemente del sistema operativo en que nos encontremos, nuestra aplicación Java debería funcionar en todos ellos de la misma forma y sin ningún problema.   

Para esto Java creo JVM (Java Virtual Machine). Esta herramienta es la que ejecuta las clases Java y sirve como una capa intermedia entre el sistema operativo y las clases. Sin embargo, las clases Java que vamos a escribir no pueden ser directamente ejecutadas por el JVM. Antes de eso es necesario compilar nuestras clases. Lo que hace este proceso es transformar nuestro código en lenguaje Java hacia otro tipo de código llamado “bytecode”. Es con este código con el que el JVM puede trabajar. Por lo que nuestras clases, que inicialmente tienen la extensión .java, cambiaran a .class, que significa que nuestra clase ha sido compilada exitosamente.        

<img src="images/c1/1-15-video.png">

[Video](https://www.youtube.com/watch?v=Lj97ujkeUXc&feature=emb_logo)

A  continuación vamos a analizar la sintaxis de Java para crear una clase. Primero tenemos que crear un archivo de texto con extensión .java y nombrarlo con el nombre de la clase que vas a escribir, por ejemplo, persona.java. Dentro de este archivo vamos a analizar la estructura y elementos que debe tener un archivo `.java`.  

### 2.3 Elementos de una clase

Todas  las clases Java son parte de un paquete. Un paquete es solamente la estructura de carpetas en donde se encuentra nuestra clase, iniciando desde la raíz del proyecto. Esto nos ayudará como una forma de agrupar nuestras clases relacionadas. Una clase puede ser explícitamente definida en un paquete nombrado, es decir, que ha sido creado por nosotros con un nombre.  

En caso contrario, si esta clase no pertenece a un paquete específicamente, entonces estará en el paquete default, el cual no tiene un nombre propio.  

En los siguientes apartados veremos los aspectos más importantes de los elementos de una clase en Java.  

#### Enlace de interés

```
En el siguiente enlace profundizarás en los elementos de una clase en Java
```

[Enlace](http://portafoliofundamentos.blogspot.com/2012/12/52-elementos-de-una-clase.html)


### 2.3.1 Package statement

La  sentencia package es usada para definir explícitamente en qué paquete se encuentra la clase. Si una clase incluye una sentencia package, esta debería ser la primera sentencia en la definición de una clase. Aquí vemos un ejemplo de esta sentencia:       

<img src="images/c1/1-16-package.png">

Como podemos ver, la primera sentencia es el package. De esta sentencia podemos deducir que la clase Java se encuentra en la carpeta “java”, dentro de la carpeta “curso”.      

La sentencia package no puede aparecer dentro de una declaración o después de la clase. Al intentarlo, ocurrirá un error en el proceso de compilado.       

<img src="images/c1/1-17-class.png">

Esto también fallará debido a que la sentencia package se encuentra dentro de la definición de la clase.      

#### Enlace de interés

```
Existe un estándar para nombrar a los paquetes en Java, definido por Oracle. Puedes revisar el siguiente enlace para conocer más al respecto.  
```

[Enlace](https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html)

### 2.3.2 Imports

En  muchos casos una clase puede depender de otra clase. Por ejemplo, la clase Persona, puede tener como atributo a la clase Profesión. Debido a esto, las clases tienen que importar otras clases. De esta forma dentro de una clase podemos usar objetos de otras clases. Para lograr esto usamos la sentencia “import”. Cuando estas clases se encuentran en el mismo paquete, no será necesario utilizar esta sentencia. Pero en el caso que la otra clase se encuentre en un paquete diferente, tenemos que usar la sentencia “import” como se muestra a continuación.       

<img src="images/c1/1-18-imports.png">

Como podemos ver en el ejemplo, se tiene que indicar el paquete donde se encuentra la clase Profesión y al final añadir el nombre de la clase que deseamos importar. Con esto ya podemos utilizar esta clase dentro de Persona. En una clase Java podemos importar tantas clases como necesitemos añadiendo múltiples veces la sentencia “import”. Recordemos también que el orden o ubicación donde las sentencias “import” tienen que ir es después de la sentencia “package” y antes de la definición de la clase.    

<img src="images/c1/1-19-imports.png">

En este ejemplo podemos ver que la sentencia “import” se encuentra al inicio de la clase, por lo tanto, esta clase no compilará.     

### 2.3.3 Comments

Los comentarios también forman parte de la estructura de una clase Java. Son de mucha importancia, ya que nos ayudan a describir los métodos y atributos para que así cualquier persona pueda entenderlos.   

Los comentarios pueden aparecer en múltiples lugares en una clase. Un comentario puede aparecer antes y después de la sentencia “package”, antes y después de la definición de la clase, también incluso dentro de las definiciones de los métodos. Los comentarios pueden escribirse de dos formas, multilíneas o al final de una línea.  

Aquí mostramos un ejemplo de un comentario de múltiples líneas. Fijémonos que un comentario de este tipo debe iniciar con los caracteres /* y finalizar con */.     

<img src="images/c1/1-20-comments.png">

Los comentarios de múltiples líneas también pueden contener caracteres especiales:    

<img src="images/c1/1-21-comments.png">

En algunas ocasiones nos encontraremos con comentarios donde al inicio de cada línea se encuentra un asterisco. Esto no es algo obligatorio para los comentarios multilíneas, solo se utilizan por un tema estético. Mostramos a continuación un ejemplo de lo anteriormente mencionado.     

<img src="images/c1/1-22-comments.png">

Ahora veremos el segundo tipo de comentarios, los cuales son los comentarios al final de la línea. Como su nombre indica, estos comentarios deben estar ubicados al final de una sentencia o incluso en una línea vacía. El texto entre // y el final de la línea es la parte del comentario, el cual utilizaremos para realizar una breve descripción. A continuación, un ejemplo:        

<img src="images/c1/1-23-comments.png">

Recordemos que se había mencionado que la primera sentencia dentro de una clase debe ser la sentencia “package”. Sin embargo, la única excepción a esta regla son los comentarios, ya que estos pueden ir incluso antes de la sentencia “package”. En el siguiente ejemplo podemos ver este caso:        

<img src="images/c1/1-24-comments.png">

Como podemos ver, las primeras líneas de código son comentarios multilíneas, donde se describen al autor y el propósito de dicha clase. 

Por último, tenemos la definición de una clase, pero este tema será explicado más adelante.   

#### Para saber más...

```
Javadoc es una herramienta que nos ofrece Java para generar una documentación de un programa automáticamente 
utilizando los comentarios con un formato especifico 
```

A continuación verás un resumen de los elementos de una clase que hemos estudiado:    

<img src="images/c1/1-25-resumen.png">

<img src="images/c1/1-25-resumen-2.png">

<img src="images/c1/1-25-resumen-3.png">

<img src="images/c1/1-25-resumen-4.png">

### 2.4 Clases especiales

Existen algunos tipos de clases con propiedades específicas que nos brindan un nuevo comportamiento diferente al planteado inicialmente.        

### 2.4.1 Interface

Una “interface” es un tipo especial de clase que, a diferencia de una clase convencional, se utiliza para definir un contrato para que otras clases lo implementen. Es decir, sirve como una guía que solamente declara métodos para que otras clases lo implementen.  

Podemos ver una analogía con un contrato de trabajo, en donde el contrato especifica el comportamiento que debe tener el profesional en una empresa, y el profesional se alinea a estos comportamientos. El profesional debe enfrentarse a diversas situaciones en el trabajo que no están contemplados en el contrato, pero debe mantener un comportamiento acorde a este. De la misma forma, una clase debe tener los mismos métodos que ha declarado la clase e implementarlos de acuerdo con el contexto.    

<img src="images/c1/1-26-interface.png">

En este ejemplo hemos definido una interface para controles de televisión y radio, entonces en esta interface hemos declarado métodos comunes entre ambos tipos de controles, sin embargo, no tienen una implementación. Fijémonos que no tiene las llaves donde se define el contenido del método.     

Ahora, para crear la clase para representar un control de televisión, podemos hacerlo de la siguiente forma:    

<img src="images/c1/1-26-interface-2.png">

En este ejemplo podemos ver la palabra reservada “implements”, la cual nos permite adherir a nuestra clase una “interface”. De esta forma obligamos a la clase a tener los métodos de la interface Control e implementarlo. En caso de que deseemos crear otros tipos de controles podemos hacerlo fácilmente utilizando la interface.     

La estructura para crear una “interface” como ya vimos en el ejemplo anterior es simple, solo es necesario utilizar la palabra reservada “interface” y de esta forma adquirirá las siguientes características:  

* No podrás definir el contenido de un método dentro de una “interface” (esta regla tiene sus excepciones). 
* Una “interface” no podrá contener variables dentro de ella. 
* Con una “interface” no se puede crear un objeto, solo sirve para definir un contrato. 

#### Enlace de interés

```
En el siguiente enlace podrás aprender un poco más acerca de las interfaces en Java. 
```

[Enlace](http://www.mundojava.net/interfaces.html?Pg=java_inicial_4_5.html)

### 2.4.2 Clases abstractas

Una clase abstracta es similar a una “interface” porque sirve como base para que a partir de ella se creen clases concretas. Estas clases pueden contener o no métodos abstractos. Los métodos abstractos son métodos que no tienen una implementación. De esta forma podemos definir la implementación en la clase que va a heredar sus métodos.  

Algunas características de estas clases son:  

1. Una clase puede tener todos sus métodos y atributos normales. Sin embargo, por ser abstracta, no podrán crearse objetos a partir de ella. 

2. Los métodos abstractos que tenga la clase los tendrán que implementar las clases que hereden de ella. 

3.  A diferencia de una “interface”, la clase abstracta si puede contener variables.  

Veamos un ejemplo de una clase abstracta:

<img src="images/c1/1-27-abstract.png">

En este ejemplo podemos fijarnos que para definir una clase abstracta es necesario poner la palabra reservada “abstract” al inicio de la declaración de la clase.   

Después podemos ver en la línea 2 un método “abstract” que, por lo tanto, no cuenta con un cuerpo definido. Finalmente, en la línea 3, nos encontramos con un método normal llamado “enviar”. Este método si cuenta con una implementación, ya que tiene las llaves {} que definen el cuerpo.     

### 2.5 Herencia

La herencia, como ya habíamos visto anteriormente, es un concepto muy importante porque nos permite reutilizar métodos y atributos de otras clases. En Java para utilizar la herencia tenemos que utilizar la palabra reservada “extends”.  

Veremos un ejemplo para comprender la necesidad de la herencia. En este caso hemos modelado las clases “Vendedor” y “Cliente”:     

<img src="images/c1/1-28-herencia.png">

Podemos darnos cuenta de que tenemos algunos atributos repetidos tales como “nombre” y “apellidos”. Incluso también métodos como “descansar”. Sin embargo, gracias a la herencia, podemos rediseñar estas clases creando una clase nueva llamada “Persona” que contempla las características que comparten ambas clases:    

<img src="images/c1/1-28-herencia-2.png">

Y las otras clases podrán heredar estos atributos y métodos de esta forma:   

<img src="images/c1/1-28-herencia-3.png">

Y para la clase Cliente:   

<img src="images/c1/1-28-herencia-4.png">

Con la palabra reservada “extends” seguido de la clase padre “Persona”, las clases “Vendedor” y “Cliente” pueden heredar los atributos del padre.   

#### Enlace de interés

```
En el siguiente enlace encontrarás más información sobre el concepto de interface y herencia múltiple en java:  
```

[Enlace](https://www.aprenderaprogramar.com/index.php?option=com_content&view=article&id=669:concepto-de-interface-y-herencia-multiple-en-java-implements-ejemplos-y-diagramas-de-clases-cu00696b&catid=68&Itemid=188)

### 2.6 Modificadores de acceso

Los modificadores de acceso es un concepto utilizado no solamente para las clases, también se usan para los atributos y métodos. Los modificares de acceso son los encargados de restringir el uso algún miembro de la clase (un miembro de una clase es una forma de indicar un atributo o método) entre clases.   

Estos modificadores de acceso son una forma en la cual aplicamos el encapsulamiento, que ya comentamos que es uno de los pilares de la programación orientada a objetos.       

Para entender este concepto, pensemos en el siguiente ejemplo. Estamos modelando las clases “CuentaBanco”, la cual tiene los datos de cuenta de un cliente y Transferencia, que será la clase encargada de realizar las operaciones de transferir dinero entre cuentas. En este caso, podemos darnos cuenta de que la clase Transferencia necesita algunos datos de la clase “CuentaBanco”, tales como el número de cuenta, el tipo de cuenta, etc. Sin embargo, otros datos -tales como contraseña- no deben ser accesibles por todos los objetos.  

En los siguientes apartados veremos los modificadores de acceso que Java nos provee.   

#### Enlace de interés

```
En el siguiente enlace puedes leer un poco más sobre los modificadores de acceso en Java:   
```

[Enlace](https://javadesdecero.es/poo/modificadores-de-acceso/)

### 2.6.1 Public

Este  es el modificador menos restrictivo. Las clases o interfaces definidos usando el modificador de acceso “public” son accesibles a través de todos los paquetes, desde clases derivadas hasta clases que no tiene relación.  

Atributos o métodos con este modificador podrán ser accesibles por cualquier otra clase, incluso si no tienen una relación de herencia. Con esto podemos modificar el valor de una variable o invocar dicho método.  

Aquí vemos un ejemplo de un atributo con el modificador de acceso “public”:  

<img src="images/c1/1-29-public.png">

### 2.6.2 Protected

Los  miembros de una clase definida usando el modificador “protected” son accesibles para:  

* Clases e interfaces definidas en el mismo paquete 
* Todas las clases derivadas (es decir, que son clases hijas), incluso si están definidas en diferentes paquetes.  

En este caso veremos un método con este modificador:    

<img src="images/c1/1-30-protected.png">

### 2.6.3 Private

Es  el modificador de acceso más restrictivo, debido a que los miembros definidos con este modificador solo serán accesibles dentro de la clase. Sin importar si otra clase se encuentra en el mismo paquete o se ha extendido de esta clase, los miembros privados no podrán ser accedidos.  

Este modificador de acceso se utiliza comúnmente en el momento de declarar los atributos de una clase, y en caso de que otra clase desee acceder a su valor, se crean métodos por donde podrán consultar o cambiar su valor.  

Aquí podemos ver un ejemplo de un atributo con el modificador de acceso “private”: 

<img src="images/c1/1-31-private.png">

### 2.6.4 Default

Cuando  los miembros de una clase no definen ninguno de los modificadores de acceso previamente mencionados, entonces por defecto tendrán este modificador. Normalmente se le denomina modificador default o “package”. Las restricciones que va a tener un miembro cuando tiene este modificador serán la de solo ser accesibles por otras clases que se encuentren definidas en un mismo paquete.  

Podemos ver a continuación un ejemplo de una clase con default como modificador:  

<img src="images/c1/1-32-default.png">

<img src="images/c1/1-33-evaluacion.png">

<img src="images/c1/1-33-evaluacion-2.png">

## 3. Creación de una clase

<img src="images/c1/1-34-clase.png">

La creación de clases resulta fundamental para cualquier lenguaje de programación. Además, en los siguientes apartados veremos cómo se crean estructuras de control que nos permitirán determinar el orden de las acciones que se deben ejecutar.        
### 3.1 Declaración de una clase

La declaración de una clase marca el inicio del contenido de esta. La palabra reservada para declarar una clase es class, seguida del nombre de la clase que deseamos crear. Veamos un ejemplo: 

<img src="images/c1/1-34-clase-2.png">

Como podemos ver, la declaración de una clase es realmente simple. Las llaves que se encuentran después del nombre marcan el contenido de la clase. Es en este espacio delimitado por las llaves {} donde se encontrarán definidos los atributos y los métodos. 

La  declaración de una clase se compone principalmente de las siguientes partes:  

* Modificadores de acceso 
* Nombre de la clase Nombre de la clase padre, si es que hereda de otra clase. 
* Implementaciones de interfaces, si es que implementa interfaces (más adelante explicaremos este tema) 
* Cuerpo de la clase. 

### 3.2 Estructuras de control

Los conceptos que veremos a continuación son conceptos que se aplican para la mayoría de los lenguajes. Aunque en nuestro caso seguiremos la sintaxis del lenguaje de Java. De cualquier modo, reiteramos que, para otros lenguajes, los cambios son mínimos.  

Un programa normalmente no está limitado a una secuencia lineal de instrucciones. Durante este proceso podrían existir bifurcaciones, códigos repetitivos (bucles) o tomar decisiones. Para este propósito los lenguajes de programación proveen estructuras de control para poder especificar qué es lo que debe hacer nuestro programa, cuándo y en qué condiciones hacerlo.  

Por ello, debemos conocer el concepto de bloque de código. Un bloque de código es un grupo de sentencias las cuales están separadas por punto y coma (;), pero agrupadas por llaves {}. Veamos cómo es la estructura de este concepto:

```java
{ operacion1(); operacion2(); operacion3(); } 
```

La mayoría de las estructuras de control que vamos a ver en este apartado tienen la misma estructura que la del ejemplo anterior. Una sentencia puede ser una simple sentencia (un método u operación) con un punto y coma al final, o un conjunto de ellas. En caso de que nosotros tengamos una sola instrucción, no será necesario encerrarla con llaves {}.   

Sin embargo, sí que es algo que se recomienda usar aunque no sea obligatorio. En otros casos, cuando tengamos múltiples instrucciones, es obligatorio el uso de llaves.  

A continuación veremos la primera estructura de control.   

#### Artículo de interés

```
En el siguiente artículo tienes resumidos los principales aspectos de las estructuras de control en Java.   
```

[Enlace](https://es.slideshare.net/quesada_diego/flujos-de-control-en-java-presentation)


#### 3.2.1 If else

La palabra reservada If es usada para ejecutar una sentencia o un bloque de ellas si una condición se ha cumplido. La forma simple de esta estructura es la siguiente:  

```java
if (condicion) { operación; }  
```

Donde “condición” es una expresión que puede ser evaluada y devolver un valor de verdadero o falso. Si la condición es verdadera, entonces la sentencia “operación” será ejecutada. En caso contrario, no se ejecutará la sentencia “operación” y el flujo del programa continuará después de la llave de cierre }.     

A continuamos veremos un ejemplo más realista. Para este ejemplo, supongamos que necesitamos mostrar en la salida del programa el mensaje “saldo excedido” cuando nuestra variable “saldo” tome el valor de 100. Esto se puede programar de la siguiente forma: 

<img src="images/c1/1-35-if.png">

**Nota**: hay que tener en cuenta que el operador “==” es utilizado como función para comparar los valores que se encuentran en cada lado. En caso de que sean iguales, la función devolverá “verdadero”. En caso contrario, devolverá falso.  

En este ejemplo podemos ver que, si nuestra variable toma el valor de 100, las sentencias que se encuentren entre llaves serán ejecutadas, en caso contrario, no se ejecutará ninguna sentencia dentro de las llaves del If. En  el ejemplo anterior podemos añadir más líneas de operaciones dentro de las llaves, como, por ejemplo: 

<img src="images/c1/1-35-if-2.png">

De esta forma hemos cambiado el ejemplo añadiendo una nueva sentencia. Con esto, cada vez que la variable “valor” sea igual a 100, imprimirá el texto en pantalla de “Saldo excedido” y después ejecutara la siguiente línea, en la cual toma la variable “saldo” y le asigna el valor de 0 (suponemos que la variable valor es de tipo entero).  

Esta es la forma más simple del If, pero a esta estructura podemos añadirle la siguiente palabra reservada “else”. Con esta palabra reservada podemos indicar al flujo de programa que, en caso cumpla con la condición, ejecute las sentencias dentro de las llaves del If. Pero en caso de que no cumpla, se ejecutarán las sentencias que están dentro de las llaves del “else”. Veamos qué pasaría con nuestro ejemplo si añadimos esta nueva palabra reservada: 

<img src="images/c1/1-35-if-3.png">

En este ejemplo, se añadió la estructura “else”. De esta forma, en caso de que no cumpla la condición de “saldo == 100”, entonces ejecutará las sentencias que se encuentran dentro de las llaves del “else”. 

Por último, tenemos una estructura más, la cual se forma de la unión del “if” y el “else”. Veamos cómo quedaría nuestro ejemplo añadiendo este operador: 

<img src="images/c1/1-35-if-4.png">

Las líneas nuevas son las 4 y 5. Con esto, ahora, el flujo del programa quedaría de la siguiente forma. En caso de que la variable “saldo” tome el valor de 100, se ejecutarán las sentencias dentro de las llaves del “if”, por lo que imprimirá el texto “Saldo excedido” y asignará a la variable saldo el valor de 0. En caso de que tome el valor de 110, imprimirá el texto “Saldo inválido” y por último, en caso de que la variable saldo no tome el valor de 100 ni de 110, entonces imprimirá el valor “Saldo correcto”.  

Ahora veremos algunas estructuras de control que se engloban dentro del grupo de iteradores, los cuales nos sirven para ejecutar sentencias múltiples veces.  

#### 3.2.2 While

Su formato es el siguiente:  

```java
while (condición) { 
   operación(); 
}  
```

Su función es simplemente repetir el conjunto de sentencias dentro de las llaves del while mientras la condición retorne como resultado “verdadero”. Esto significa que primero evaluará la condición y si es verdadera ejecutará las sentencias dentro de las llaves. Al llegar a la última sentencia nuevamente evaluará la condición y así seguirá sucesivamente hasta que la condición sea falsa.         

Pongamos un  ejemplo, vamos a crear un programa que imprima los valores desde x a 1: 

<img src="images/c1/1-36-while.png">

1. En la línea 1 se declara una variable de tipo entero llamada “x” con valor 10. 

2. En la línea 3 comienza la estructura “while”. Esta condicional se puede leer “mientras x sea mayor a cero” ejecutará las sentencias dentro de las llaves {}. 

3. En la línea 4 imprime el valor de “x” y en la línea 5 restamos 1 al valor de “x” y lo asignamos a la variable “x”.  

De esta forma tenemos el resultado siguiente:

<img src="images/c1/1-36-while-2.png">

Entonces, en el flujo de programa, primero “x” tomara el valor de 10. Dado que 10 es mayor que 0, ejecutará las sentencias, por lo que imprimirá el valor de x y restará 1 a su valor. Entonces x toma el valor de 9 y debido a que es una estructura “while”, al llegar al final de la llave de cierre, volvemos a subir a la línea 3 y se evaluará de nuevo la condición. Dado que de nuevo 9 es mayor que 0, de esta forma irán ejecutándose las líneas de forma iterativa hasta que llegue x al valor de -1 y entonces la condición será falsa y ya no entrará más en las sentencias del “while”. 

#### 3.2.3 Do-While

El  formato es el siguiente:  

```java
do { operación(); } while(condición);  
```

De la misma forma que la estructura “while”, esta estructura ejecutará las sentencias repetidamente mientras que la condición sea verdadera.  

A diferencia de la sentencia “while”, primero se ejecutarán las sentencias y después se preguntará por la condición. Esto significa que al menos una vez se ejecutará la sentencia, a diferencia del “while”, que puede ejecutar cero o más veces las sentencias.    

Realizaremos  nuevamente el ejemplo anterior, pero con la estructura “do-while”: 

<img src="images/c1/1-37-do.png">

Entonces las sentencias de las líneas 3 a 5 serán ejecutadas hasta llegar a la línea 6. Es ahí en donde se evaluará la condición x > 1 y en caso de que sea verdad, nuevamente se ejecutará la línea 4 hasta llegar a la condición. De esta forma tendremos el mismo resultado en nuestra pantalla que con el anterior código. 

#### Enlace de interés

```
En la siguiente página puedes profundizar en las diferencias entre while y do-while:    
```

[Enlace](https://parasitovirtual.wordpress.com/2010/10/20/estructura-de-control-while-y-do-while-en-java/)


#### 3.2.4 For loop

El  formato para la estructura “for” es el siguiente:  

```java
for (inicialización; condición; incrementar) { operación(); }  
```

Esta es una de las estructuras iterativas con mayor utilidad, debido a que nos permitirá repetir un conjunto de sentencias, mientras que la “condición” retorne el valor “verdadero”. Pero, además de esto, la estructura “for”  permite agregar una sentencia para declarar variables en la parte donde dice “inicialización” y además otra sentencia llamada “incrementar”.        
Veamos  cómo trabaja esta estructura:

* Inicialización
   Es utilizada para inicializar alguna variable con un valor de inicio. Normalmente como una variable para contar (a este tipo de variables que aumentan su valor en una unidad en cada iteración se le conoce simplemente como contador). Esta es ejecutada solo una vez en su primera iteración en el inicio del flujo.
   
* Tras la inicialización
   Después de la inicialización, continúa con la “condición”, por lo que si esta condición retorna el valor “verdadero”, continuará la iteración. En caso contrario, se saltará las sentencias a ejecutar “operación”.

* Condición verdadera
   En caso de que sea verdadera la “condición”, se procederá a ejecutar las sentencias entre llaves. En este caso la sentencia “operación”. Recordemos que igual que en las demás estructuras, cada vez que solo sea una sentencia la que queremos ejecutar en la iteración no será necesario encerrarla entre llaves {}.

* Ejecución de la sentencia
   Finalmente, se ejecutará la sentencia “incrementar”, y nuevamente pasará al paso 2, hasta que la condición retorne falso.
   
Ahora utilizaremos la estructura “for” para realizar el ejemplo anterior:   

<img src="images/c1/1-38-for.png">

Como nos podemos dar cuenta, esta estructura nos permite realizar las mismas operaciones que las anteriores estructuras, pero lo hacemos con menos líneas. Normalmente esta estructura se usa cuando queremos realizar una cantidad de iteraciones definida.  

Con esto ya tenemos las estructuras iterativas más conocidas. Ahora pasaremos a la última estructura de control.  

#### 3.2.5 Switch

Esta estructura tiene una función parecida al “if else”. Su objetivo es la de ejecutar sentencias dependiendo del valor de una variable. La estructura nos permite manejar múltiples valores que puede tomar la variable. Veamos su formato: 

```java
switch(variable){case a: sentencias();break; case b:sentencias();break ...}  
```

En esta estructura deberemos tener una variable la cual vamos a evaluar. Esta variable se debe encontrar en el paréntesis después del switch y, dentro de las llaves, debemos poner cada caso que deseamos procesar.     

A continuación, veamos el ejemplo siguiente: 

<img src="images/c1/1-39-switch.png">

En este ejemplo podemos darnos cuenta de que cada valor que deseamos evaluar se encontrará después de la palabra “case”. En ese momento el flujo del programa tomará la variable “a” y comparará el valor de esa variable con cada valor de los “case”. En caso de que uno de ellos coincida, ejecutará las sentencias que se encuentran entre los dos puntos “:” del “case” y antes del “;break;”.  

Cada uno de los “break” le indica al programa que cuando llegue a esa sentencia, saldrá del switch y continuará su flujo. En caso de que ninguno de los valores coincida con los “case”, entrará a la línea del “default” y ejecutará las respectivas sentencias.  

Para nuestro ejemplo la salida del sistema será: 

<img src="images/c1/1-39-switch-2.png">

Este resultado se debe a que la variable “a” se inicializó con el valor “10”.  

Con esto ya conocemos las estructuras más simples del lenguaje Java.  

### 3.3 Definición de una clase

Veamos ahora el contenido de una clase. Como se había mencionado antes, una clase está compuesta de atributos y comportamientos. En una clase java estos atributos son representados con variables, y el comportamiento con métodos. De esta forma podemos ver a una clase como un molde con el cual creamos objetos con valores definidos.      

#### 3.3.1 Variables

Las variables, también llamadas atributos, son las que nos van a permitir almacenar los datos de un objeto. La estructura para declarar una variable de una clase es la siguiente:  

```java
<tipo de="" dato=""> <nombre de="" la="" variable="">  
```

Por ejemplo 
String nombre;  

En este ejemplo nos percatamos de lo siguiente:  

1. El tipo de dato string es utilizado cuando deseamos guardar texto en una variable.  

2.  En la parte del nombre, debemos tener en cuenta algunas reglas. Todos los nombres deben iniciar con una letra, guion bajo (`_`) o símbolo de dólar (`$`). Con esto deducimos que no podemos usar ningún número para iniciar el nombre. 

3. Después del primer carácter, cualquier tipo de letra o digito es aceptado, exceptuando caracteres especiales como espacios, etc. 

4. Los nombres pueden tener cualquier longitud. 

5. Las palabras reservadas tampoco pueden ser usadas como nombres de una variable. 

Recordemos que este tipo de variables almacenan información para un objeto. Existen otros tipos de variables, llamadas variables de clase, las cuales nos permitirán guardar valores y compartirlas con todas las instancias de las clases.  

Veamos ahora cuales son los ámbitos de una variable. Es decir, donde podemos declarar las variables y cuál es su ciclo de vida:     


**Variables  locales.**  

Las variables locales son definidas dentro de un método. Éstas podrían ser definidas dentro de estructuras del control, tales como un “if-else”, estructuras iterativas o “switch”.  

Habitualmente usamos variables locales para almacenar resultados intermedios de un cálculo. Comparado con los otros tres ámbitos de las variables, este ambiente es el de más corto tiempo de vida.       

Veamos el siguiente código para comprobar el uso de la variable local “avg”:

<img src="images/c1/1-40-variables.png">

En la anterior clase, podemos ver la variable “avg” siendo declarada dentro del método “obtenerPromedio”. Esta variable es utilizada para almacenar temporalmente el resultado del promedio de las variables “nota1” y “nota2”. Después, en el método “setPromedio”, podemos ver que se utiliza la misma variable “avg”, pero al ser una variable declarada en el método “obtenerPromedio”, solo podrá usarse dentro del método. Esto quiere decir que la variable “avg” es inaccesible fuera del método “obtenerPromedio”. Por lo tanto, al intentar compilar la clase se indicará que existe un error. 

Esta vez modificaremos el método “obtenerPromedio” del ejemplo anterior como se muestra a continuación:  

<img src="images/c1/1-40-variables-2.png">

Aquí podemos ver que ahora la variable se ha declarado dentro del “if”. Por lo tanto, también se ha creado como una variable local y solo podrá ser utilizada dentro de las llaves {} del “if”. De la misma forma se aplica para las demás estructuras de control. 

Analicemos  el código siguiente:  

<img src="images/c1/1-40-variables-3.png">

Este código no compilará, debido a que en la línea 2 se intenta leer el valor de la variable “b” para asignarlo a “a”. Sin embargo, esta variable “b” es declarada después de la línea 2, por tanto, en el momento que se ejecuta la línea 2, la variable b no existe. Por lo que ocurrirá un error en la compilación. Si cambiamos la línea 2 por la línea 3, entonces este ejemplo sí que compilará correctamente.  

Como podemos ver, las variables locales están determinadas por la estructura en donde se encuentren declaradas. Puede ser en un “if”, en su ámbito más corto o, como máximo, limitadas por el ámbito de un método. Sus límites estarán definidos por las llaves de la estructura {}.  

#### 3.3.2 Parámetros de método

Las variables que provienen de la firma del método (la firma está compuesta del nombre del método y los parámetros de entrada), son llamados parámetros de método.  

Ellos son accesibles solo en el método donde están definidos. En el siguiente ejemplo, un parámetro de método “val”, es definido para el método.  “realizarPrueba”.  

<img src="images/c1/1-332.png">

En el ejemplo podemos ver que el parámetro “val” solo es accesible dentro del método “realizarPrueba”. Este no puede ser accedido desde otro método. Por lo tanto, el código no compilara, porque se intenta usar el parámetro “val” desde el método “obtenerPrueba”.  

De esto podemos deducir que el ámbito de un parámetro puede ser igual de grande o más aun que una variable local, pero nunca más pequeño.   

#### 3.3.3 Variables de Instancia

Como habíamos mencionado en apartados anteriores, una instancia es una forma alternativa de referirse a un objeto. Por lo tanto, una variable de instancia está disponible dentro de la vida de un objeto. Una variable de instancia es declarada dentro de una clase, fuera de todos los métodos. Esta variable es accesible para todos los métodos de una clase.

Normalmente se declara este tipo de variable al inicio de la definición de una clase. Veamos el siguiente ejemplo:  

<img src="images/c1/1-333.png">

Como podemos ver, las variables “prueba” y “prueba2” son variables de instancia y podemos utilizarlas en cualquier parte de nuestra clase.   

#### 3.3.4 Variables de Clase

Una variable de clase es definida utilizando la palabra reservada “static”. Por este motivo, también son llamadas variables estáticas. Una variable estática es compartida entre todos los objetos. Es decir, los objetos no almacenan una copia separada de este tipo de variables como ocurre con los otros tipos de variables. Recordemos que las variables de instancia son las que pertenecen a cada uno de los objetos, por lo que cada objeto puede tener distintos valores para las mismas variables. Esta es la principal diferencia con las variables estáticas.   

Debido a que estas variables le pertenecen a la clase y no a una instancia, estas variables pueden ser accedidas sin la necesidad de tener una variable.  

Veamos un ejemplo de esto:   

<img src="images/c1/1-334.png">

En este ejemplo podemos ver como declarar una variable estática, simplemente agregando la palabra reservada “static” antes del tipo de variable.  

Ahora veamos cómo podemos utilizar esta variable.

<img src="images/c1/1-334-2.png">

Con este ejemplo podemos ver que no importa si cambiamos el valor de la variable mensaje en un objeto. Este cambio afectará a todos los objetos, porque la variable estática le pertenece a una clase y no a un objeto específico. Lo que significa que podemos acceder a la misma variable por las formas siguiente:  

<img src="images/c1/1-334-3.png">

### 3.4. Tipos de Datos

Las variables son las herramientas que nos permitirán almacenar datos específicos. Pueden ser números, texto, caracteres, boolean (true y false), etc. Por lo que tenemos que conocer cuáles son los tipos de datos que podemos manejar. En Java existen dos tipos de datos, los tipos de datos primitivos y los objetos. Veamos cada uno de ellos.      

<img src="images/c1/1-34.png">

[Video](https://www.youtube.com/watch?v=OS1F6VNA6hs&feature=emb_logo)

#### 3.4.1 Tipos de datos: primitivos

Los  datos primitivos son los datos más simples que existen en Java. Estos datos ya están predefinidos y no podemos crear más tipos como estos. Java define ocho tipos de datos primitivos:

* char 
* byte 
* short 
* int
* long 
* float 
* double 
* boolean         

#### Recuerda

```
Los nombres de los tipos primitivos son descriptivos de los valores que ellos pueden almacenar. 
```

Veamos la siguiente tabla para entender mejor cada uno de estos tipos de datos:    

<img src="images/c1/1-341.png">

Podemos ver que los tipos de variables “byte”, “short”, “int”, “long”, “float”, y “double” son tipos de datos numéricos. Algunos de ellos soportan decimales y el de mayor extensión es el double. Después tenemos el “char”, que nos permite almacenar caracteres tales como ‘c’ y, finalmente, tenemos el “boolean”, que nos permite almacenar dos tipos de valores: “true” o “false”.  

<img src="images/c1/1-341-2.png">

[Video](https://www.youtube.com/watch?time_continue=3&v=bq6nJRJq27A&feature=emb_logo)

Veamos el siguiente código donde podemos ver un ejemplo de cómo declarar cada uno de los tipos de datos.   

<img src="images/c1/1-341-3.png">

De esta forma ya conocemos los tipos de datos primitivos.

#### Para saber más...

Cada vez que nosotros indicamos un valor directamente en el código, como por ejemplo 123, true o ‘b’, estamos declarando valores literales. Muchas veces cuando escribimos valores numéricos literales y necesitamos definir de qué tipo de dato especifico son, entonces tenemos que escribir al final del valor el primer carácter del tipo de dato. Por ejemplo, si queremos definir un valor literal de tipo double escribimos 123d. Esto solo funcionara para los tipos de datos float, double y long. 

#### 3.4.2 Tipos de datos: objetos

Los objetos son los tipos de datos que se componen por tipos primitivos u otros tipos de objetos. Como ya sabemos, nosotros podemos crear objetos para solucionar nuestros problemas definiendo clases.  

Java nos provee de algunas clases que son similares a los tipos primitivos, pero que tienen las cualidades de un objeto. Estos son llamados wrapper classes. Por lo tanto, para cada uno de los tipos de datos primitivos tenemos su respectivo wrapper class. Veamos la siguiente tabla:    

<img src="images/c1/1-342-1.png">

Como podemos ver, en la mayoría de los casos solamente cambia el primer carácter del nombre del tipo primitivo. 

Los wrapper classes trabajan de la misma forma que un tipo de dato primitivo, por lo que el ejemplo anterior podemos escribirlo con los wrapper classes.     

<img src="images/c1/1-342-2.png">

Todas estas clases nos proporcionan métodos muy poderosos que no nos son ofrecidos por los tipos de datos primitivos, por lo que se recomienda utilizar los wrapper classes en la mayoría de los casos. 

#### 3.4.3 Constructor

El constructor es un tipo especial de método. Su principal característica es que se ejecuta una sola vez al crearse el objeto. Su finalidad principal es la de inicializar las variables que contiene el objeto. Una clase puede definir muchos tipos de constructores variando la cantidad de variables de entrada. 

Otra característica que diferencia los constructores de otros métodos es que no tienen un valor de retorno al finalizar la función, y además el nombre de este método siempre será el nombre de la clase.  

Por último, un constructor será creado por defecto en caso de que no se haya definido explícitamente en la clase. Aquí vamos a ver un ejemplo de una clase Producto:   

<img src="images/c1/1-343-1.png">

En el ejemplo podemos ver el constructor de la clase Producto. Este recibe como parámetro una variable de tipo “String” llamado “nombre”. Dentro del constructor asignamos el valor del nombre que viene como parámetro hacia la variable nombre de la clase. Además asignamos a la variable “stock” el valor 15. 

El constructor es invocado utilizando el operador “new” y por ahí se enviarán los parámetros. De esta forma creamos una instancia de la clase. Veamos un ejemplo de esto:      

<img src="images/c1/1-343-2.png">

#### 3.4.4 Métodos

Un  método o función es una forma en la cual podemos escribir un comportamiento de un objeto. Estos métodos nos permiten modificar los valores de las variables de la clase realizando cálculos o procesos que sean propios de la clase. La declaración de un método se realiza mediante el siguiente formato:  

**`<tipo de dato a retornar> <nombre del método> (<variables de entrada>)`**   

Los métodos pueden tener o no muchos parámetros, y devolver o no un resultado. En la programación tradicional se utilizaba el término función para denominar a los métodos que retornan un valor y procedimientos para los métodos que no retornan valor.

<img src="images/c1/1-344-1.png">

En este ejemplo observamos lo siguiente:  

* En la primera palabra de la línea 1 se define cual es el tipo de valor que va a retornar el método. 
* En la línea 1 podemos ver las variables que son los parámetros de entrada del método. En este caso valorA y valorB. 
* En la línea 2 estamos declarando una nueva variable de tipo Integer y le asignamos el valor cero. 
* En la línea 3 estamos utilizando la operación de suma entre los parámetros y almacenamos el resultado en la variable valorC declarada en la línea 2. 
* En la línea 4 estamos utilizando la palabra reservada “return” que se utiliza para definir el valor que va a retornar el método. En este caso es el valor de la variable valorC.  

El contenido de una clase se encuentra entre llaves {} después del nombre de la clase. Aquí veremos un ejemplo del cual partiremos para entender mejor la estructura de los atributos y métodos. 

<img src="images/c1/1-344-2.png">

**Líneas 1-4 del código**

En las primeras líneas “String nombre;” y “String apellidos” declaramos variables (atributos) que nos permitirán almacenar el nombre y los apellidos del Cliente. La palabra “String” se utiliza para indicar que esa variable va a contener texto. 

**Líneas 6-8 del código**

En otra sección del código vemos lo siguiente: “void comprar(String nombreProducto){}”. Este es un método que como vemos se llama “comprar” y recibe de parámetro nombreProducto de tipo String. 

**Líneas 4-6 del código**

Por último, veamos las líneas de la 4 a la 6. Este es un tipo especial de método llamado constructor, que se ejecutará al momento de crearse un objeto. Al igual que un método recibe parámetros, sin embargo, no tiene un valor de retorno. En este caso vemos que el constructor recibe el parámetro y asigna el valor hacia la variable nombre de la clase. 

### 3.5 Clases ejecutables y clases no ejecutables

Recordemos que una clase Java ha de ser compilada necesariamente para que la JVM la procese y sea ejecutada. Las clases que hemos estado viendo no retornaran o mostraran un valor, ya que solamente estamos declarando clases, pero no métodos para ser ejecutados. Por lo tanto, vamos a ver cómo crear clases ejecutables.  

Una clase ejecutable tiene un método que es el punto de entrada para que la JVM pueda ejecutarla. Este método en particular tiene el nombre de método “main”. Entonces, cualquier otra clase que no tenga este método especial será una clase no ejecutable.  

Normalmente, una aplicación consiste en un conjunto de clases e interfaces que son definidas en múltiples clases Java en diferentes archivos .java. De todos estos archivos, un programador elige una de estas clases para que sea una clase ejecutable. Es aquí donde se deben definir todos los pasos para que la JVM inicialice y levante la aplicación. Por ejemplo, en una aplicación de escritorio, la clase ejecutable puede contener los métodos necesarios para mostrar una interfaz de usuario o abrir una conexión a base de datos.     

#### 3.5.1 Método main

Para que una clase sea ejecutable en Java, se tiene que crear el método main con una firma (nombre y parámetros del método), que vamos a detallar a continuación:     

<img src="images/c1/1-351-1.png">

Por  tanto, las reglas que debe cumplir el método main son:  

* El método debe ser marcado como un método public. 
* El método debe ser marcado como un método static. 
* El nombre del método debe ser main. 
* El tipo de retorno de este método debe ser void. 
* El método debe aceptar como parámetro un array de String. 

Ahora que tenemos nuestro método main, la JVM ejecutará dicho método y en el ejemplo visto anteriormente se tendría la siguiente salida:     

<img src="images/c1/1-351-2.png">

Este resultado es lo que mostrará como output de la ejecución de la clase debido a que en la línea 3 se está invocando al método System.out.println, que sirve para mostrar las variables, que tiene como parámetros -en este caso- el string “Hello”. 

### 3.6 Ejecutar un programa Java por comandos del sistema

La mayoría de los programadores trabaja con algún Integrated Development Environment (IDE). Se trata de una herramienta que nos permite desarrollar programas y ejecutarlos fácilmente. La mayoría de ellos incluso revisan la sintaxis antes de compilar las clases. Por lo tanto, para cualquier proyecto es necesario que los programadores usemos este tipo de aplicativos. Sin embargo, en nuestro caso, por motivos de aprendizaje, debemos entender cómo es que se ejecuta una clase Java sin la necesidad de un IDE, usando solamente los comandos del sistema.   

Recomendamos, por tanto, el uso de un editor de texto simple como un “bloc de notas” en Windows.        

#### Recuerda

````
Necesitas tener instalado Java para ejecutar las clases.
````

Veamos paso por paso la creación de una clase ejecutable a partir de un ejemplo realizado en Windows:      

1. Necesitamos abrir el “Símbolo del Sistema” para ejecutar los comandos de Java. Para esto, presionamos Windows + R y se nos abrirá la siguiente ventana en una esquina de la pantalla:

<img src="images/c1/1-36-1.png">

2. Dentro de este cuadro de “Ejecutar”, debemos escribir “cmd” como esta en la imagen, y presionar el botón “Aceptar”. Al hacer esto, nos debe aparecer el símbolo del sistema como se muestra a continuación:

<img src="images/c1/1-36-2.png">

3. En esta pantalla nos saldrá una ruta y un cursor. Tendremos que ubicarnos en la carpeta donde se encuentra nuestra clase que, en nuestro caso, la tenemos en el escritorio. Por lo tanto, nos ubicamos en la carpeta del escritorio.

<img src="images/c1/1-36-3.png">

4. Con esto ya podemos crear nuestra clase .java. Abrimos un editor de texto como el bloc de notas y copiamos dentro del archivo el contenido del ejemplo de la clase Hello.java.

<img src="images/c1/1-36-4.png">

5. Y, finalmente, lo guardamos en el escritorio con el nombre de Hello.java. A partir de aquí, utilizaremos los comandos que tiene Java para compilar y ejecutar clases. Primero compilamos la clase con el comando “javac Hello.java”. Con esto Java creará un nuevo archivo llamado Hello.class. Después de esto ejecutamos el comando “java Hello” y podemos ver que en el “Símbolo del Sistema” se mostrará el texto “Hello”.

De esta forma, hemos creado nuestra primera clase Java y ademas la hemos ejecutado. Tras estos pasos que hemos visto podríamos ir añadiendo más lineas de código o modificando el ejemplo anterior para aprender como funciona un programa Java.      
### 3.7 Ejemplos

A continuación vamos a ver unos ejemplos para analizar como modelar una clase. Es conveniente leer los enunciados con calma e intentar resolverlos antes de ver la solución.  

Para validar si estamos haciéndolo bien y si nuestra respuesta es correcta, solo tenemos que compilar la clase y en caso de que exista un error, el compilador de Java indicara la línea del error.      

**Ejemplo 1**

Tenemos una pequeña clínica veterinaria que modelar. Por lo que tenemos que crear una clase Gato (esta clase debe contar con atributos tales como color, edad y nombre del dueño). Además de esto necesitamos un método para dar de alta a los gatos.

*Solución*

Esta es una forma en que podemos solucionar el problema (ya que no nos indican que tipo de modificador de acceso debe tener la clase) entonces utilizamos el default y para el método lo definimos como public. 
 
<img src="images/c1/1-37-1.png">

**Ejemplo 2**

Crearemos un pequeño sistema para vender entradas, por lo que tendremos que modelar una clase Entrada, que tendrá el nombre del cliente, un evento de tipo Evento, y un código de tipo texto. Por otra parte, tenemos la clase Evento. Esta clase tendrá un código de tipo texto, una fecha y hora, y un nombre. Debemos tener en cuenta que todos los atributos de las clases deben ser públicos.

*Solución*

Para este problema nos piden crear dos clases. Una de ellas es la clase Entrada. Esta clase tiene como atributo la clase Evento, por lo que necesitamos primero crear la clase Evento, cuya definición es bastante fácil. Después de crear y compilarlo, tenemos que crear la clase Entrada. 

<img src="images/c1/1-37-2.png">

**Ejemplo 3**

Vamos a crear un proceso que gestione las transacciones de transferencias entre cuentas de diferentes bancos. Para ello tenemos que modelar la clase Cuenta, que contendrá el saldo del cliente, su número de cuenta y el nombre del cliente. Además necesitaremos una clase Transferencia, que cuente con dos atributos (una cuenta de origen y una cuenta de destino, ambas de tipo Cuenta). Para estas clases necesitamos todos los atributos con un acceso private.

*Solución*

De la misma forma que el problema anterior, tenemos primero que definir la clase Cuenta, ya que si intentamos crear la clase Transferencia primero, nos surgirá un error ya que no existe la clase Cuenta. 

<img src="images/c1/1-37-3.png">

**Ejemplo 4**

Estamos realizando una pequeña tienda virtual para vender nuestros productos. Cada producto tiene un nombre, un precio, una descripción y un descuento. Además, debe contar con un proceso para poder aumentar su stock de tipo entero, donde el nuevo valor debe ser un parámetro. Finalmente tendremos un carrito de compras que tenga la cantidad de productos en el carrito y un método para añadir un nuevo producto al carrito.

*Solución*

Para este problema primero creamos la clase Producto, debido a que la clase Carrito depende de esta clase. En este ejemplo podemos ver como un objeto Producto es un parámetro del método. 

<img src="images/c1/1-37-4.png">

<img src="images/c1/1-40-1.png">

<img src="images/c1/1-40-2.png">

### BIBLIOGRAFÍA

* Cadenhead, R., Lemay, L. (2008). Java 6. Madrid. Ediciones ANAYA Multimedia.
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill.
* H. M. Deitel y P. J. Deitel, Cómo Programar en C/C++ y Java. (Cuarta edición). Ed. Pearson Educación, 2004.
* B. Eckel. Piensa en Java (2ª edición). Prentice Hall. 2002.
* H.M. Deitel, P.J. Deitel. Cómo programar en Java (5ª edición). Pearson Prentice-Hall. 2004.
* Java. Desarrollo web. Recuperado de: https://desarrolloweb.com/directorio/programacion/java/
* Java EE. Arquitectura Java. Recuperado de: https://www.arquitecturajava.com
* Mapa mental referente a la POO y sus Pilares Fundamentales. UNET. Recuperado de: https://compu2poo.wordpress.com/
* La web del programador. Recuperado de: https://www.lawebdelprogramador.com

