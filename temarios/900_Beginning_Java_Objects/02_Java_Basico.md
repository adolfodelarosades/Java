# 02 Java Básico

<span style="background-color: #FFE34F;">Java está orientado a objetos en su esencia. ***Casi todo*** en Java es un objeto</span>:

* Todos los datos, con la excepción de unos pocos tipos primitivos, se encuentran registrados como objetos.
* Todos los bloques de construcción de GUI (ventanas, botones, campos de entrada de texto, barras de desplazamiento, listas, menús, etc.) son objetos.
* Todas las funciones están asociadas con objetos y son conocidas como **métodos**.
* Incluso la función principal utilizada para lanzar la aplicación(en Java, se llama el método **main**) no está independiente, sino que está agrupada dentro de una **clase**.

Debido a esto, Java se presta particularmente bien para escribir aplicaciones que mantienen el paradigma OO. Sin embargo, como señalé en la introducción de este libro, el mero uso de dicho lenguaje orientado a objetos no garantiza que las aplicaciones que usted produzca sean fieles a este paradigma. Debe tener conocimientos sobre cómo diseñar una aplicación desde cero para hacer el mejor uso de los objetos y sobre cómo aplicar el lenguaje correctamente.

## Anatomia de un Sencillo Programa Java

![02-08](images/02-08.png)

En la figura se muestra una clase java de las más sencillas, la cuenta con los siguientes elementos:

## Comentarios

Los comentarios comienzan con `//`

```java
// This simple program illustrates some basic Java syntax.
```

Java soporta tres diferentes estilos de comentarios: 

* traditional
* end-of-line
* Java documentation comments.

### Traditional Comments

Los comentarios tradicionales de Java derivan del lenguaje C y comienzan con una barra inclinada seguida de un asterisco (`/*`) y terminan con un asterisco seguido de una barra inclinada (`*/`). Todo lo que se incluye entre estos delimitadores se trata como un comentario y, por lo tanto, el compilador de Java lo ignora, sin importar cuántas líneas abarque el comentario.

```java
/* Este es un comentario tradicional (Estilo C). */

/* Este es un comentario tradicional de varias líneas. Esta es una forma práctica de comentar temporalmente 
   secciones enteras de código sin tener que eliminarlas.
   Desde el momento en que el compilador encuentra el primer "slash asterisk" anterior, no le importa lo que 
   escriba aquí; incluso líneas de código legítimas,como se muestra a continuación, se tratan como líneas de 
   comentarios hasta que el  compilador se encuentre la primera combinación de "asterisk slash".

x = y + z;
a = b / c;
j = s + c + f; 
*/

/* A menudo utilizamos asteriscos iniciales desde la segunda y hasta la penúltima línea
 * de un comentario tradicional simplemente por razones estéticas, para que el comentario 
 * sea más visual distinto; pero, estos asteriscos adicionales son estrictamente cosméticos, 
 * solo los "slash asterisk" inicial y "asterisk slash" final tiene algún significado para el 
 * compilador.* /
```

Tenga en cuenta que no podemos **anidar** comentarios de bloque, es decir, lo siguiente no se compilará:

:fire:
```java
/ * Esto inicia un comentario ...
x = 3;
/ * ¡Ups! Intentamos anidar un SEGUNDO comentario por error antes de terminar el PRIMER!
Esto nos va a causar problemas de compilación, porque el compilador IGNORARÁ el comienzo 
de este segundo comentario interno; después de todo, ¡ya estamos EN un comentario! - y tan 
pronto como intentemos terminar este SEGUNDO comentario interno, el compilador pensará que 
hemos terminado el PRIMER comentario externo en su lugar ... * /
z = 2;
// El compilador se "quejará" en la siguiente línea.
* /
```

Cuando el compilador alcanza lo que pretendíamos que fuera la terminación * / del comentario "externo" en la última línea del ejemplo de código anterior, se informarán los siguientes dos errores de compilación:

```java
illegal start of expression
 */
 ^
```
y 
```java
';' expected 
   */
     ^
```

### End-of-Line Comments - Comentarios de fin de línea

El segundo tipo de comentario de Java se deriva de C++ y se conoce como comentario de fin de línea. Usamos una barra doble (`//`) para anotar el comienzo de un comentario que termina automáticamente cuando se llega al final de la línea, como se muestra aquí:

x = y + z; 
// Aquí hay un BLOQUE de comentarios secuenciales de fin de línea.
// Esto sirve como una alternativa al uso de comentarios tradicionales // (/ * ... * /) y es preferido por muchos programadores de Java.
m = n * p;
```java
x = y + z; // el texto del comentario continúa hasta el final de la línea ==> a = b / c;
// Aquí hay un BLOQUE de comentarios secuenciales de fin de línea.
// Esto sirve como una alternativa al uso de comentarios tradicionales 
// (/ * ... * /) y es preferido por muchos programadores de Java.

m = n * p;
```

### Java Documentation Comments - Comentarios de la documentación de Java

El tercer y último tipo de comentario de Java, los comentarios de documentación de Java (también conocidos como comentarios de Javadoc), se pueden analizar a partir de archivos de código fuente mediante un programa de utilidad de línea de comandos especial javadoc (que viene de serie con el SDK de Java) y se pueden utilizar para generar automáticamente documentación HTML para una aplicación.
Aplazaremos una mirada en profundidad a los comentarios de Javadoc hasta el Capítulo 13.

## Declaración de la Clase

Para declarar una clase usamos la sintaxís:

```java
public class ClassName { 
   ...
}
```

por ejemplo:

```java
public class SimpleProgram { 
   ...
}
```

donde las llaves `{...}` encierran el cuerpo de la clase que incluye la lógica principal del programa junto con otros bloques de construcción opcionales de una clase.

Las palabras `public` y `class` son dos de las palabras clave de Java, es decir, palabras reservadas para uso específico dentro del lenguaje Java, mientras que `SimpleProgram` es un nombre inventado.

### El método `main`

Dentro de la declaración de la clase `SimpleProgram`, encontramos el punto de partida para el programa, llamado método `main`. El método `main` sirve como punto de entrada para un programa Java. Cuando ejecutamos un programa Java la JVM llama al método `main` para iniciar nuestra aplicación.

Con aplicaciones triviales como el ejemplo de `SimpleProgram`, toda la lógica del programa se puede contener dentro de este único método principal. Para aplicaciones más complejas, el método `main` posiblemente no puede contener toda la lógica para todo el sistema. 

La primera línea de la clase `SimpleProgram` es:

```java
public static void main(String[] args) {
```
define lo que se conoce como el **encabezado del método** del método `main`, y ***debe aparecer exactamente como se muestra*** (con una excepción menor que explicaré en el Capítulo 13 que tiene que ver con la recepción opcional de argumentos desde la línea de comandos).

El cuerpo del método de nuestro método `main`, encerrado entre llaves `{...}`, consta de una sola sentencia: 

```java
System.out.println("Hello!");
```

Note el uso de un punto y coma (;) al final de la sentencia. . Las llaves `{...}`, a su vez, delimitan bloques de código.

Otras cosas que normalmente hacemos dentro del método principal de un programa más elaborado incluyen declarar variables, crear objetos y llamar a otros métodos.

Ahora que hemos visto la anatomía de un programa Java simple, analicemos cómo se compila y ejecuta dicho programa.

#### Compilar el archivo fuente de código Java a Bytecode

Para compilar el código fuente de Java desde la línea de comandos, usamos el comando `cd`, según sea necesario, para navegar al directorio de trabajo donde reside nuestro código fuente. Luego escribimos el siguiente comando:

```sh
javac sourcecode_filename
```

Por ejemplo:

```sh
javac SimpleProgram.java
```

para compilarlo

Si hubiera más de un archivo de código fuente .java en el mismo directorio, podríamos enumere los nombres de los archivos a compilar, separados por espacios:

```sh
javac Foo.java Bar.java Another.java
```

o utilice el carácter comodín (`*`), por ejemplo: 

```sh
javac *.java
```

para compilar varios archivos al mismo tiempo.

Si todo va bien, es decir, si no surgen errores del compilador, aparecerá un archivo de código de bytes con el nombre de `SimpleProgram.class` en el mismo directorio donde reside el archivo de código fuente `SimpleProgram.java`. Si surgen errores del compilador, por otro lado, por supuesto, debemos corregir nuestro código fuente e intentar recompilarlo.

#### Ejecutar Bytecode

Una vez que un programa se ha compilado con éxito, ejecutamos la versión del código de bytes mediante el comando

```sh
java bytecode_filename 
```
tenga en cuenta que OMITIMOS el sufijo .class por ejemplo:

```sh
java SimpleProgram
```

Tenga en cuenta que es importante omitir el sufijo `.class` del nombre del archivo de código de bytes (que en este caso se llama `SimpleProgram.class`).

De forma predeterminada, la JVM buscará en su directorio de trabajo predeterminado junto con el directorio "home" donde se ha instalado el lenguaje Java en su sistema para dichos archivos de código de bytes. Si la JVM encuentra el archivo de código de bytes especificado, ejecuta su método `main` y su programa está funcionando.

Si por alguna razón el código de bytes que está intentando ejecutar no se encuentra en ninguna de estas dos ubicaciones predeterminadas, debe informar a la JVM de directorios adicionales en los que buscar. Puede hacerlo especificando una lista de directorios (separados por punto y coma [;] en Windows, o por dos puntos [:] en Solaris y Linux) después de la marca `-cp` en el comando java de la siguiente manera:

```sh
java –cp list_of_directory_names_to_be_searched bytecode_filename
```

Por ejemplo, en DOS / Windows:

```sh
java –cp C:\home\javastuff;D:\reference\workingdir;S:\foo\bar\files SimpleProgram
```

o en Solaris/Linux:

```sh
java –cp /barkerj/work:/java/examples/ex1 SimpleProgram
```

Todo lo anterior es para ejecutarlo desde la línea de comandos.

### Una mirada entre bastidores a la JVM

Echemos un vistazo más en profundidad a lo que realmente sucede detrás de escena cuando escribimos el comando

```sh
java SimpleProgram
```

para ejecutar nuestro programa.

• El comando Java hace que se inicie la JVM.
• La JVM busca el archivo de código de bytes que hemos nombrado en el comando (`SimpleProgram.class` en este caso), buscando en los directorios enumerados por el indicador `–cp`, si se proporciona, o en el directorio de trabajo predeterminado si no se usa `–cp`.
• Suponiendo que la JVM de hecho encuentra el archivo de código de bytes apropiado, carga el código de bytes en su memoria (conceptualmente, el código de bytes sirve como un "complemento" para la JVM).
• A continuación, el JVM busca el código de bytes que acaba de cargar para la presencia del encabezado del método `main`. Si se encuentra este método, la JVM lo ejecuta y nuestro programa se ejecuta.

#### Ejecutandolo desde Eclipse

![02-08-01](images/02-08-01.png)

## Tipos Primitivos

Se dice que Java es un lenguaje de programación fuertemente tipado, en el sentido de que cuando se declara una variable, también se debe declarar su tipo. Entre otras cosas, declarar el tipo de una variable le dice al compilador cuánta memoria asignar para la variable en tiempo de ejecución, y también restringe el contexto(s) en el que esa variable se puede usar posteriormente en nuestro programa.

El lenguaje **Java define ocho tipos primitivos** (los ocho nombres de estos tipos son palabras clave de Java), de la siguiente manera.

**Cuatro tipos de datos numéricos enteros**: 

* `byte`:  entero sin signo de 8 bits
* `short`: entero de 16 bits con signo
* `int`:   entero de 32 bits con signo
* `long`:  entero de 64 bits con signo

**Dos tipos numéricos de coma flotante**:

• `float`: punto flotante de precisión única de 32 bits
• `double`: punto flotante de doble precisión de 64 bits 

Más dos tipos primitivos adicionales:

* `char`: Un carácter único, almacenado con codificación Unicode de 16 bits (en lugar de codificación ASCII de 8 bits), que permite a Java manejar una amplia gama de juegos de caracteres internacionales.
* `boolean`: una variable que solo puede asumir uno de dos valores: `true` o `false` (ambos valores son palabras reservadas en Java). Las variables booleanas se utilizan a menudo como indicadores para señalar si algún código debe ejecutarse condicionalmente o no, como en el siguiente fragmento de código:

```java
boolean error = false; // Inicializa la bandera.
// ...
// Más adelante en el programa (pseudocódigo): si (surge alguna situación de error) {
// Establezca el indicador en verdadero para indicar que se ha producido un error.
error = true;
}
// ...
// Más adelante en el programa:
// Prueba el valor de la bandera. si (error == true) {
// Pseudocódigo.
tomar acción correctiva ...
```

## Variables

Antes de que se pueda utilizar una variable en un programa Java, el tipo y el nombre de la variable deben **declararse**, por ejemplo:

```java
int count;
```

La asignación de un valor a una variable se logra mediante el **operador de asignación** `=`. Una sentencia de asignación consta de un nombre de variable (previamente declarado) a la izquierda del `=` y una expresión que evalúa el tipo apropiado a la derecha del `=`. Por ejemplo:

```java
...
int count = 1;
total = total + 4.0; // Aquí, asumimos que el total se declaró como una 
                     // variable double anterior en el programa.
price = cost + (a + b)/length; // Una vez más asumimos que todas las variables fueron 
                               // declaradas correctamente anteriormente en el programa.
```

Se puede proporcionar un valor inicial cuando se declara una variable por primera vez:

```java
int count = 3;
```

o se puede declarar una variable en una sentencia, luego se le puede asignar un valor en una sentencia separada más adelante en el programa:

```java
double total;
// código intermedio ... detalles omitidos
total = total + 4.0;
```

Se puede asignar un valor a una variable booleana usando los literales `true` o `false`:

```java
boolean finished; 
// ...
finished = true;
```
Se puede asignar un valor literal a una variable de tipo `char` encerrando el valor (un solo carácter Unicode) entre comillas simples:

```java
char c = 'A';
```

El uso de comillas dobles (`"..."`) está reservado para asignar valores literales a las variables de tipo `String`. **Lo siguiente no se compilaría en Java**:

```java
char c = "A"; // Debemos usar comillas simples al asignar valores a variables char.
```

### Convenciones de Nombres de Variables

Al discutir los nombres de las variables de Java, hay dos aspectos a considerar:

* Primero, ¿el compilador Java considera válido un nombre en particular?
* En segundo lugar, ¿se adhiere un nombre válido en particular a la convención de nombres que ha sido adoptada por la comunidad de programación OO en todos los lenguajes?

Los nombres de variables válidos en Java **deben comenzar con un carácter alfabético**, **un guion bajo  o un signo de dólar** (cuyo uso no se recomienda, ya que el compilador lo usa al generar código) y pueden contener cualquiera de estos caracteres más dígitos numéricos. **No se permiten otros caracteres en los nombres de las variables**.

Los siguientes son todos nombres de variables válidos en Java:

```java
int simple; // comienza con un carácter alfabético
int _under; // comienza con guion bajo
int more$money_is_2much; // puede contener signos de dólar y/o guiones bajos, y/o
                         // dígitos y/o caracteres alfabéticos
```

mientras estos no son válidos:

```java
int 1bad;         // carácter inicial inapropiado
int number#sign;  // contiene un carácter no válido
int foo-bar;      // contiene un carácter no válido
int plus+sign;    // contiene un carácter no válido
int x@y;          // contiene un carácter no válido
int dot.notation; // contiene un carácter no válido
```

Dicho esto, la convención que se observa en toda la comunidad de programación OO es formar nombres de variables utilizando principalmente caracteres alfabéticos, evitando el uso de guiones bajos y, además, adherirse a un estilo conocido como **camel casing** o **camelCase**. Con el formato camelCase, la primera letra del nombre de una variable está en ***minúsculas***, la primera letra de cada palabra concatenada subsiguiente en el nombre de la variable está en ***mayúsculas*** y el resto de los caracteres en minúsculas. Todos los siguientes nombres de variables son válidos y convencionales:


```java
int grade;
double averageGrade;
String myPetRat;
boolean weAreFinished;
```

Recuerde que, como se mencionó anteriormente, **las palabras clave de Java no se pueden usar como nombres de variables**. Lo siguiente no se compilará, porque `public` es una palabra clave de Java:

:fire:
```java
int public;
```

De hecho, el compilador generaría los siguientes dos mensajes de error:

```sh
not a statement
int public;
^

';' expected 
int public;
    ^
```

## Inicialización de Variable

En Java, a las variables no se les asigna necesariamente un valor inicial cuando se declaran, **pero a todas las variables se les debe asignar un valor antes de usar el valor de la variable en una sentencia de asignación**. Por ejemplo, en el siguiente fragmento de código, se declaran dos variables int(eger); un valor inicial se asigna explícitamente a la variable `foo`, pero no a la variable `bar`. Un intento posterior de sumar los valores de las dos variables da como resultado **un error del compilador**:

:fire:
```java
int foo;
int bar;
// Nosotras estamos inicializando explícitamente foo, pero no bar. 
foo = 3;
foo = foo + bar; // Esta línea no se compilará.
```

El siguiente error del compilador surgiría en la última línea de código:

```sh
variable bar might not have been initialized 
foo = foo + bar;
            ^
            
The local variable bar may not have been initialized (ECLIPSE)           
```

Para corregir este error, necesitaríamos asignar un valor explícito a `bar`, así como a `foo`, antes
de usarlos en la expresión de suma:

```java
int foo;
int bar;
foo = 3;
// Ahora estamos inicializando AMBAS variables explícitamente. 
bar = 7;
foo = foo + bar; // Esta línea ahora se compilará correctamente.
```

<hr>
En el Capítulo 13, aprenderá que las reglas de inicialización automática son algo diferentes cuando se trata del "funcionamiento interno" de los objetos.
<hr>

## El tipo `String`

Veremos otro tipo de Java importante en este capítulo: el tipo `String`. Un `String` representa una secuencia de cero o más caracteres Unicode.

**El símbolo `String` comienza con una "S" mayúscula, mientras que los nombres de los tipos primitivos se expresan en minúsculas: `int`, `float`, `boolean`, etc.** Esta diferencia de uso de mayúsculas es deliberada y obligatoria; **`string` (minúscula) no funciona como un tipo** :

```java
string s = "foo"; // Esto no se compilará.
```

Aquí está el mensaje de error:

```sh
cannot find symbol
symbol:  string

string cannot be resolved to a type (ECLIPSE)
```

(Explicaré la importancia de la capitalización de `String` como tipo a su debido tiempo).

Hay varias formas de crear e inicializar una variable `String`. La más fácil y más cómoda 
es declarar una variable de tipo `String` y asignar un valor a la variable utilizando un **string literal** literal de cadena. Un literal de cadena es cualquier texto entre comillas dobles, incluso si consta de un solo carácter:

```java
String name = "Steve";    // Tenga en cuenta el uso de comillas dobles, independientemente de la
String shortString = "A"; // longitud, cuando estamos asignando un valor literal
                          // a una variable String.
```

Dos enfoques comúnmente utilizados para inicializar una variable `String` con un placeholder temporal son los siguientes:

* Asignar una cadena vacía, representada por dos comillas dobles consecutivas:
   
   `String s = "";`

* Asignar el valor `null`, que es una palabra clave Java que se usa para indicar que a un `String` aún no se le ha asignado un valor "real" (como aprenderá más adelante en el libro, usaremos la palabra clave nula de la misma manera para referencias de objetos en general):
   
   `String s = null;`

El operador de signo más (`+`) se usa normalmente para la suma aritmética, pero cuando se usa junto con `Strings`, **representa la concatenación de cadenas**. Se puede concatenar cualquier número de valores de cadena con el operador `+`, como ilustra el siguiente fragmento de código:

```java
String x = "foo";
String y = "bar";
String z = x + y + "!"; // z asume el valor "foobar!" 
                        //(los valores de x y y no se afectan)
                  
```

Aprenderá sobre algunas de las muchas otras operaciones que se pueden realizar con o sobre `Strings`, junto con información sobre su naturaleza OO, en el Capítulo 13.

## Case Sensitivity

Java es un lenguaje **case-sensitive** que distingue entre mayúsculas y minúsculas. Es decir, el uso de mayúsculas frente a minúsculas en Java es deliberado y obligatorio, por ejemplo:

* Los nombres de las variables que se escriben de la misma manera pero que difieren en su uso de caso representan diferentes variables:

```java
// Estas son dos variables DIFERENTES en lo que respecta al compilador de Java
int x; // lowercase - minúsculas
int X; // uppercase - mayúsculas
```

• Todas las palabras clave se representan en minúsculas: `public`, `class`, `int`, `boolean` y en adelante. **No sea “creativo” al ponerlas en mayúsculas**, ya que el compilador objetará violentamente, a menudo con mensajes de **error de compilación** ininteligibles, como en el siguiente ejemplo, donde la palabra reservada `for` es mayúsculas incorrectamente:

:fire:
```java
// La palabra reservada 'for' debe estar en minúsculas. 
For (int i = 0; i < 3; i++) {
```
que a su vez produce el siguiente error de compilador aparentemente extraño:

```sh
'.class' expected
For (int i = 0; i < 3; i++) {
         ^
         
ECLIPSE
Multiple markers at this line
	- i cannot be resolved to a variable
	- i cannot be resolved to a variable
	- Syntax error, insert ")" to complete MethodInvocation
	- Syntax error, insert ";" to complete Statement
	- Syntax error on token "<", invalid AssignmentOperator
	- Syntax error on token ")", ; expected
	- The method For(Class<Integer>) is undefined for the type 
	 SimpleProgram
	- Syntax error, insert ". class" to complete Expression
	- i cannot be resolved to a variable
```

## Java Expressions

Java es un **lenguaje orientado a expresiones**. Una expresión simple en Java es:

* Una constante: `7`, `false`
* Una literal `char`(acter) encerrado entre apostrofes: `'A'`, `'3'`
* Una literal `String` encerrada entre comillas: `"foo"`, `"Java"`
* El nombre de cualquier variable declarada correctamente: `myString`, `x`
* Cualquiera de los dos tipos de expresión anteriores que se combinan con uno de los operadores binarios de Java (discutidos en detalle más adelante en este capítulo): `x + 2`
* Cualquiera de los tipos de expresión anteriores que hayan sido modificados por uno de los operadores (discutidos en detalle más adelante en este capítulo): `i++`
* Cualquiera de los tipos de expresión anteriores entre paréntesis: `(x + 2)`

Además de algunos tipos más de expresión que tienen que ver con objetos sobre los que aprenderá más adelante en el libro.

Las expresiones de complejidad arbitraria se pueden ensamblar a partir de los diferentes tipos de expresiones simples anidando paréntesis, por ejemplo: `((((4 / x) + y) * 7) + z)`.

### Operadores aritméticos

El lenguaje Java proporciona una serie de operadores aritméticos básicos, como se muestra en la Tabla 2-1.

**Tabla 2-1.** Operadores Artméticos

Operador | Descripción
---------|------------
`+`      | Suma
`-`      | Resta
`*`      | Multiplicación
`/`      | División
`%`      | Resto (el resto cuando el operando a la izquierda del operador% se divide por el operando a la derecha; por ejemplo, 10% 3 = 1, porque 3 entra en 10 tres veces, dejando un resto de 1)

Los operadores `+` y `-` también se pueden utilizar como operadores unarios para indicar números positivos o negativos: `-3.7`, `+42`.

Además del operador de asignación simple, `=`, hay varios operadores de asignación compuestos especializados, que combinan la asignación de variables con una operación aritmética, como se muestra en la Tabla 2-2.

**Tabla2-2.** Operadores de Asignación Compuestos 

Operador | Descripción
---------|------------
`+=`     | `a += b` es equivalente `a = a + b`.
`-=`     | `a -= b` es equivalente `a = a - b`.
`*=`     | `a *= b` es equivalente `a = a * b`.
`/=`     | `a /= b` es equivalente `a = a / b`.
`%=`     | `a %= b` es equivalente `a = a % b`.

Los dos últimos operadores aritméticos que veremos son los operadores de **incremento unario** (`++`) y decremento (`--`), que se utilizan para aumentar o disminuir el valor de una variable `int` en 1 o de punto flotante (`float`, `double`) valor por 1.0. Se les conoce como operadores unarios porque se aplican a una sola variable, mientras que los operadores binarios combinan los valores de dos expresiones como se discutió anteriormente.

Los operadores unarios de incremento y decremento también se pueden aplicar a variables `char` para avanzar o retroceder una posición de carácter en la secuencia de clasificación Unicode. Por ejemplo, en el siguiente fragmento de código, el valor de la variable `c` se incrementará de `'e'` a `'f'`:

```java
char c = 'e';
c ++; // c se incrementará de 'e' a 'f'.
```

Los operadores de incremento y decremento se pueden utilizar de forma **prefijo** o **sufijo**. Si el operador se coloca antes de la variable en la que está operando (modo de prefijo), **el incremento o decremento de esa variable se realiza antes de que el valor actualizado de la variable se use** en cualquier asignación realizada a través de esa declaración. Por ejemplo, considere el siguiente fragmento de código, que utiliza el operador de incremento de prefijo (`++`). Supongamos que `a` y `b` se han declarado previamente como variables `int` en nuestro programa:

```java
a = 1;
b = ++a;
```

Después de que se hayan ejecutado las líneas de código anteriores, el valor de la variable `a` será `2`, al igual que el valor de la variable `b`. Esto se debe a que, en la segunda línea de código, el incremento de la variable `a` (de 1 a 2) ocurre antes de que el valor de `a` se asigne a la variable `b`. Por tanto, la única línea de código

```java
b = ++a;
```

es lógicamente equivalente a las siguientes dos líneas de código:

```java
a = a + 1; // Incrementa el valor de a primero ...
b = a;     // ... ENTONCES usa su valor.
```

Por otro lado, si el operador de incremento/decremento se coloca después de la variable en la que está operando (modo postfijo), el incremento o decremento ocurre después de que el valor original de la variable se use en cualquier asignación realizada a través de esa declaración. Veamos el mismo fragmento de código con el operador de incremento escrito en forma de sufijo:

```java
a = 1;
b = a++;
```

Después de que se hayan ejecutado las líneas de código anteriores, el valor de la variable `b` será `1`, mientras que el valor de la variable `a` será `2`. Esto se debe a que, en la segunda línea de código, el incremento de la variable `a` (de 1 a 2) ocurre después de que el valor de `a` se asigna a la variable `b`. Por tanto, la única línea de código

```java
b = a++;
```

es lógicamente equivalente a las siguientes dos líneas de código: 

```java
b = a; // Usa el valor de a primero ...
a = a + 1; // ... ENTONCES incrementa su valor.
```

Aquí hay un ejemplo un poco más complejo; lea el comentario adjunto para asegurarse de que puede ver cómo a `x` se le asignará el valor `10`:

```java
int y = 2;
int z = 4;
int x = y++ * ++z; // x se le asignará el valor 10, porque z será
                   // incrementado de 4 a 5 ANTES de que su valor se use en la
                   // expresión de multiplicación, mientras que y permanecerá en 2 hasta                      // DESPUÉS de que su valor se use en la expresión de multiplicación.
```

Como verá en un momento, los operadores de incremento y decremento se utilizan comúnmente junto con los bucles.

### Operadores relacionales y lógicos

Una expresión lógica compara dos expresiones (simples o complejas) `exp1` y `exp2` de una manera específica, resolviéndose con un valor `boolean` `true` o `false`.

Para crear expresiones lógicas, Java proporciona los operadores relacionales que se muestran en la Tabla 2-3. 

**Tabla2-3.** Operadores Relacionales
Operador       | Descripción
---------------|------------
`exp1 == exp2` | `true` si `exp1` es igual a `exp2` (note el uso de doble signo igual para la equivalencia)
`exp1 > exp2`  | `true` si `exp1` es mayor que `exp2`
`exp1 >= exp2` | `true` si `exp1` es mayor o igual que `exp2`
`exp1 < exp2`  | `true` si `exp1` es menor que `exp2`
`exp1 <= exp2` | `true` si `exp1` es menor o igual que `exp2`
`exp1 != exp2` | `true` si `exp1` no es igual a `exp2`
`!exp`         | `true` si `exp` es `false` y `false` si `exp` es `true`

 
Además de los operadores relacionales, Java proporciona operadores lógicos que se pueden utilizar para combinar / modificar expresiones lógicas. Los operadores lógicos más utilizados se enumeran en la Tabla 2-4.

**Table2-4.** Operadores Logicos

Operador       | Descripción
---------------|------------
`exp1 && exp2` | `and` lógico; la expresión compuesta es `true` solo si `exp1` y `exp2` son `true`
`exp1 ll exp2` | `or` lógico; la expresión compuesta es `true` si `exp1` o `exp2` es `true`
`!exp`         | `not` lógico; alterna el valor de una expresión lógica de `true` a `false` y viceversa


A continuación, se muestra un ejemplo que utiliza el operador lógico `"and"` para programar la expresión lógica compuesta "si x es mayor que 2.0 e y no es igual a 4.0":

```java
if ((x > 2.0) && (y != 4.0)) { ... }
```

Las expresiones lógicas se utilizan más comúnmente con estructuras de control de flujo, que se describen más adelante en este capítulo.

### Evaluación de Expresiones y Precedencia de Operadores

Como se mencionó anteriormente en el capítulo, las expresiones de complejidad arbitraria se pueden construir colocando en capas paréntesis anidados, por ejemplo, `(((8 * (y + z)) + y) * x)`. El compilador generalmente evalúa tales expresiones desde el paréntesis más interno al más externo, de izquierda a derecha. Suponiendo que `x`, `y` y `z` se declaran e inicializan como se muestra aquí:

```java
int x = 1; 
int y = 2; 
int z = 3;
```

luego la expresión en el lado derecho de la siguiente declaración de asignación

```java
int answer = ((8 * (y + z)) + y) * x;
```

se evaluaría pieza por pieza de la siguiente manera:

```java
                               ((8 * (y + z)) + y) * x
                                  ((8 * 5) + y) * x
                                     (40 + y) * x
                                        42 * x
                                          42
```					  

En ausencia de paréntesis, ciertos operadores tienen prioridad sobre otros en términos de cuándo se aplicarán al evaluar una expresión. Por ejemplo, la multiplicación o la división se realiza antes que la suma o la resta. La precedencia del operador se puede alterar explícitamente mediante el uso de paréntesis; las operaciones realizadas entre paréntesis tienen prioridad sobre las operaciones fuera de paréntesis. Considere el siguiente fragmento de código:

```java
int j = 2 + 3 * 4; // j se le asignará el valor 14
int k = (2 + 3) * 4; // k se le asignará el valor 20
```

En la primera línea de código, que no usa paréntesis, la operación de multiplicación tiene prioridad sobre la operación de suma, por lo que la expresión general se evalúa con el valor `2 + 12 = 14;` es como si hubiéramos escrito explícitamente `2 + (3 * 4)` sin tener que hacerlo.

En la segunda línea de código, los paréntesis se colocan explícitamente alrededor de la operación `2 + 3` para que la operación de suma se realice primero y la suma resultante luego se multiplique por `4` para un valor de expresión general de `5 * 4 = 20`.

Volviendo a un ejemplo anterior

```java
if ((x > 2.0) && (y != 4.0)) { ... }
```
tenga en cuenta que los operadores `>` y `!=` tienen prioridad sobre el operador `&&`, de modo que podríamos eliminar los paréntesis anidados de la siguiente manera:

```java
if (x > 2.0 && y != 4.0) { ... }
```

Sin embargo, los paréntesis adicionales ciertamente no hacen daño y, de hecho, se puede argumentar que aclaran la intención de la expresión.

### El tipo de una Expresión

El tipo de una expresión es el tipo Java del valor al que la expresión finalmente evalúa.  Por ejemplo, dado el fragmento de código

```java
double x = 3.0;
double y = 2.0;
if ((x > 2.0) && (y != 4.0)) { ... }
```

la expresión `(x > 2.0) && (y != 4.0)` se evalúa como verdadera y, por lo tanto, la expresión `(x > 2.0) && (y != 4.0)` se dice que es una expresión de tipo booleano. Y, en el siguiente fragmento de código

```java
int x = 1;
int y = 2;
int z = 3;
int answer = ((8 * (y + z)) + y) * x;
```

la expresión `((8 * (y + z)) + y) * x` se evalúa en 42, y de ahí la expresión `((8 * (y + z)) + y) * x` se dice que es una expresión de tipo `int`(eger).

### Conversiones de Tipo Automáticas y Casting Explicito

Java admite la **conversión automática de tipos**. Esto significa que si intentamos asignar un valor a una variable 

```java
// Pseudocode.
x = expression;
```

y la expresión en el lado derecho de la declaración de asignación se evalúa como un tipo diferente al tipo con el que se declaró la variable en el lado izquierdo de la declaración de asignación, Java convertirá automáticamente el valor de la expresión de la derecha para que coincida con el tipo de x, **pero solo si no se perderá precisión al hacerlo**. Esto se comprende mejor mirando un ejemplo:

:fire:
```java
int x;
double y;
y = 2.7;
x = y; // Estamos tratando de asignar un valor doble a una variable int.
```

En el fragmento de código anterior, intentamos asignar el valor `double` de `y`, `2.7`, a `x`, que se declara como un `int`. Si esta asignación tuviera lugar, la parte fraccionaria de `y` se truncaría y `x` terminaría con un valor entero de `2`. Esto representa una pérdida de precisión, también conocida como **conversión de restricción - narrowing conversion**.

Un compilador C o C ++ permitirá esta asignación, truncando silenciosamente el valor. Sin embargo, en lugar de asumir que esto es lo que pretendemos hacer, el compilador de Java generará un error en la última línea de código de la siguiente manera:


```sh
possible loss of precision
found: double
required: int

ECLIPSE
Type mismatch: cannot convert from double to int
```

Para indicarle al compilador de Java que estamos dispuestos a aceptar la pérdida de precisión, debemos realizar una **conversión explícita - explicit cast**, es decir, debemos preceder a la expresión cuyo valor se convertirá con el tipo de destino, entre paréntesis:

```java
// Pseudocode.
x = (type) expression;
```

En otras palabras, tendríamos que reescribir la última línea del ejemplo anterior de la siguiente manera para que el compilador de Java permita la asignación de un valor de punto flotante más preciso a una variable entera menos precisa:

```java
int x;
double y;
y = 2.7;
x = (int) y; // Esto se compilará ahora, porque tenemos explícitamente
	     // informó al compilador que QUEREMOS que se produzca una 
	     // conversión de reducción (narrowing conversion).
```

int x;
Por supuesto, si tuviéramos que invertir la dirección de la asignación, asignando el valor `int` de la variable `x` a la variable `double y`, el compilador de Java no tendría ningún problema con la asignación:

```java
int x;
double y;
x = 2;
y = x; // Asignar un valor int menos preciso a una variable doble que sea capaz de
       // manejando más precisión - esto está bien como está.
```


En este caso particular, estamos asignando un valor de menor precisión, `2`, a una variable capaz de manejar mayor precisión; `y` terminará con el valor de `2.0`. Esto se conoce como **conversión de ampliación - widening conversion**. Estas conversiones se realizan automáticamente en Java y no es necesario convertirlas explícitamente.


Tenga en cuenta que existe una idiosincrasia con respecto a la asignación de valores constantes a variables de tipo `float` en Java; la siguiente declaración no se compilará:

:fire:
```java
float y = 3.5; // Esto no compila!
```

```sh
ECLIPSE
Type mismatch: cannot convert from double to 
 float
```

porque Java trata automáticamente un valor constante numérico con un componente fraccionario como `3.5` como un valor `double` de mayor presición, por lo que el compilador verá esto como una *conversión de restricción* y se negará a realizar la asignación. Para **forzar** tal asignación, debemos convertir explícitamente la constante de punto flotante (floating-point) en un `float`:

```java
float y = (float) 3.5; // Esto compilará, gracias por el cast.
```

o, alternativamente, podemos forzar la constante en el lado derecho de la instrucción de asignación para que sea vista por el compilador de Java como un flotante usando el sufijo F, como se muestra aquí:
flotar y = 3.5F; // Bien, porque estamos indicando que la constante debe // tratarse como un flotante, no como un doble.
Otra opción más es simplemente declarar variables dobles en lugar de variables flotantes siempre que deseemos representar valores numéricos de coma flotante en un programa.
Normalmente usaremos dobles en lugar de flotantes siempre que necesitemos declarar variables de punto flotante en nuestra aplicación SRS en la Parte 3 del libro, solo para evitar estos problemas de conversión de tipos.
Las expresiones de tipo char se pueden convertir a cualquier otro tipo numérico, como se ilustra en el siguiente ejemplo:
char c = 'a';
// Asignar un valor de carácter a una variable numérica transfiere su // valor numérico ASCII equivalente.
int x = c;
flotar y = c;
doble z = c;
System.out.println (x); System.out.println (y); System.out.println (z);
Aquí está el resultado:
97 97,0 97,0
El único tipo de Java que no se puede convertir, ni implícita ni explícitamente, en otro tipo es el tipo booleano.
Verás otras aplicaciones de transmisión, que involucran objetos, más adelante en el libro.
Lazos y otras estructuras de control de flujo
Muy raramente un programa se ejecutará secuencialmente, línea por línea, de principio a fin. En cambio, la ruta de ejecución a través de la lógica de un programa a menudo será condicional.
• Puede ser necesario que el programa se ejecute en un cierto bloque de código si se cumple alguna condición, o en un bloque de código diferente si no se cumple la condición.
• Un programa puede tener que ejecutar repetidamente un bloque particular de código un número fijo de veces, o hasta que se logre un resultado particular.
    
                                        El lenguaje Java proporciona varios tipos diferentes de bucles y otras estructuras de control de flujo para solucionar estas situaciones.
si declaraciones
La instrucción if es una instrucción de rama condicional básica que ejecuta una o más líneas de código si se satisface una condición, representada como una expresión lógica. Alternativamente, se pueden ejecutar una o más líneas de código si la condición no se satisface colocando ese código después de la palabra clave else. El uso de una cláusula else con una instrucción if es opcional.
La sintaxis básica de la instrucción if es la siguiente:
// Pseudocódigo.
if (expresión-lógica) {
    ejecutar cualquier código contenido dentro de estas llaves
si la expresión lógica se evalúa como verdadera
}
O agregando una cláusula else opcional:
// Pseudocódigo.
if (expresión-lógica) {
    ejecutar cualquier código contenido dentro de estas llaves
si la expresión lógica se evalúa como verdadera
}
else {
    ejecutar cualquier código que esté contenido dentro de estas llaves si
expresión-lógica se evalúa como falsa
}
Si solo una instrucción ejecutable sigue a la palabra clave if u (opcional) else, la
Las llaves se pueden omitir, como se muestra aquí:
// Pseudocódigo.
if (expresión-lógica) declaración única para ejecutar si expresión-lógica es verdadera; else declaración única para ejecutar si la expresión lógica es falsa;
Por ejemplo:
si (x> 3) y = x; si no z = x;
Pero, en general, se considera una buena práctica usar siempre aparatos ortopédicos de la siguiente manera:
si (x> 3) {y = x;
}
else {
z = x; }
Una sola variable booleana, como una forma simple de expresión booleana, puede servir como expresión / condición lógica de una instrucción if. Por ejemplo, es perfectamente aceptable escribir lo siguiente:

```java

```


```java

```

```java

```

