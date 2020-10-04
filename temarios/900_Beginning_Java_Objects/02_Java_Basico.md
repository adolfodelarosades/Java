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

:fire:
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
b = a;     // Usa el valor de a primero ...
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

o, alternativamente, podemos forzar la constante en el lado derecho de la instrucción de asignación para que sea vista por el compilador de Java como un `float` usando el sufijo `F`, como se muestra aquí:

```java
float y = 3.5F; // OK, porque estamos indicando que la constante debe 
                // tratarse como un flotante, no como un doble.
```

Otra opción más es simplemente declarar variables `double` en lugar de variables `float` siempre que deseemos representar valores numéricos de coma flotante en un programa.

<hr>
Normalmente usaremos `doubles` en lugar de `floats` siempre que necesitemos declarar variables de punto flotante en nuestra aplicación SRS en la Parte 3 del libro, solo para evitar estos problemas de conversión de tipos.
<hr>

Las expresiones de tipo `char` se pueden convertir a cualquier otro tipo numérico, como se ilustra en el siguiente ejemplo:

```java
char c = 'a';

// Asignar un valor de carácter a una variable numérica transfiere su
// valor numérico ASCII equivalente.
int x = c;
float y = c;
double z = c;
System.out.println(x); 
System.out.println(y); 
System.out.println(z);
```

La salida será

```sh
97 
97.0 
97.0
```

**El único tipo de Java que no se puede convertir (castear), ni implícita ni explícitamente, en otro tipo es el tipo `boolean`.**

Verás otras aplicaciones de casting, que involucran objetos, más adelante en el libro.

## Loops y Otras Estructuras de Flujo de Control

Muy raramente un programa se ejecutará secuencialmente, línea por línea, de principio a fin. En cambio, la ruta de ejecución a través de la lógica de un programa a menudo será condicional.

* Puede ser necesario que el programa se ejecute en un cierto bloque de código si se cumple alguna condición, o en un bloque de código diferente si no se cumple la condición.
* Un programa puede tener que ejecutar repetidamente un bloque particular de código un número fijo de veces, o hasta que se logre un resultado particular.
    
El lenguaje Java proporciona varios tipos diferentes de bucles y otras estructuras de control de flujo para solucionar estas situaciones.

### `if` Statements

La instrucción `if` es una instrucción de rama condicional básica que ejecuta una o más líneas de código si se satisface una condición, representada como una expresión lógica. Alternativamente, se pueden ejecutar una o más líneas de código si la condición **no** se satisface colocando ese código después de la palabra clave `else`. El uso de una cláusula `else` con una instrucción `if` es opcional.

La sintaxis básica de la instrucción `if` es la siguiente:

```java
// Pseudocode.
if (logical-expression) {
    ejecutar cualquier código contenido dentro de estas llaves
    si la expresión lógica se evalúa como verdadera
}
```

O agregando una cláusula `else` opcional:

```java
// Pseudocode.
if (logical-expression) {
    ejecutar cualquier código contenido dentro de estas llaves
    si la expresión lógica se evalúa como verdadera
}
else {
    ejecutar cualquier código que esté contenido dentro de estas llaves si
    expresión-lógica se evalúa como falsa
}
```

Si solo una instrucción ejecutable sigue a la palabra clave `if` u (opcional) `else`, las llaves se pueden omitir, como se muestra aquí:

```java
// Pseudocode.
if (logical-expression) declaración única para ejecutar si expresión-lógica es verdadera;
else declaración única para ejecutar si la expresión lógica es falsa;
```
Por ejemplo:

```java
if (x > 3) y = x; 
else z = x;
```

Pero, en general, se considera una buena práctica usar siempre llaves de la siguiente manera:

```java
if (x > 3) { 
   y = x;
}
else {
   z = x; 
}
```

Una sola variable `boolean`, como una forma simple de expresión booleana, puede servir como expresión/condición lógica de una instrucción `if`. Por ejemplo, es perfectamente aceptable escribir lo siguiente:

```java
// Utilice la variable boolean "finished" como una bandera que se establecerá a true  
// cuando se completa alguna operación en particular.
boolean finished;

// Inicializarla a false. 
finished = false;
// Los detalles del código que interviene, en el que la bandera puede o no establecerse en 
// true, se han omitido ...
// Prueba la bandera.
if (finished) { // equivalente a:  if (finished == true) {
   System.out.println("¡Hemos terminado! :O)"); 
}
```

El operador `!` ("not") se puede usar para negar una expresión lógica, de modo que el bloque de código asociado con una instrucción `if` se ejecuta cuando la expresión se evalúa como falsa en su lugar:

```java
if (!finished) { // equivale a:  if (finished == false)
   System.out.println("Nosotros NO hemos terminado ... :op"); 
}
```

Al probar la igualdad de dos expresiones, recuerde que debemos usar dos signos iguales consecutivos, no solo uno:

```java
if (x == 3) { // Note el uso del doble signo de igual (==) para probar la igualdad.
y = x; }
```

<hr>
Un error común que cometen los programadores principiantes de Java, particularmente aquellos que han programado previamente en C o C ++, es intentar usar un solo signo igual para probar la igualdad, como en este ejemplo:

:fire:
```java
// Note el uso incorrecto del signo simple de igualdad. 
if (x = 3) {
   y = x; 
}
```

```sh
ECLIPSE
Type mismatch: cannot convert from int to boolean
```

En Java, una prueba `if` debe basarse en una expresión lógica válida; `x = 3` no es una expresión lógica, sino más bien una expresión de asignación. De hecho, **la declaración if anterior ni siquiera se compilará en Java**, mientras que se compilaría en los lenguajes de programación C y C ++, porque en esos lenguajes, si las pruebas se basan en la evaluación de expresiones al valor entero 0 (interpretado como falso ) o distinto de cero (interpretado como verdadero).
<hr>

Es posible anidar construcciones `if-else` para probar más de una condición. Si está anidado, una instrucción `if` interna (más opcional `else`) se coloca dentro de la parte `else` de un `if` externo. La sintaxis básica para una construcción `if-else` anidada de dos niveles se muestra aquí:
  
```java
if (logical-expression-1) { 
   ejecuta este código
}
else {
   if (logical-expression-2) { 
      ejecuta este código alterno
   }
   else {
        ejecuta este código si ninguna de las expresiones de arriba se evalua a true
   } 
}
```

No hay límite para la cantidad de construcciones `if-else` anidadas que se pueden usar, aunque si se anidan demasiado profundamente, el código puede resultar difícil de entender y, por lo tanto, de mantener para un lector humano.

La instrucción `if` anidada que se muestra en el ejemplo anterior se puede escribir alternativamente sin utilizar la anidación de la siguiente manera:

```java
if (logical-expression-1) { 
   ejecuta este código
}
else if (logical-expression-2) {
   ejecuta este código alterno
}
else {
   ejecuta este código si ninguna de las expresiones de arriba se evalua a true
}
```

Tenga en cuenta que las dos formas son lógicamente equivalentes.

### `switch` Statements

Una instrucción `switch` es similar a una construcción `if-else` en que permite la ejecución condicional de una o más líneas de código. Sin embargo, en lugar de evaluar una expresión lógica como lo hace una construcción `if-else`, una instrucción `switch` compara el valor de una expresión `int` o `char` con los valores definidos por una o más etiquetas de caso. Si se encuentra una coincidencia, se ejecuta el código que sigue a la etiqueta de caso coincidente. Se puede incluir una etiqueta `default` opcional para definir el código que se ejecutará si la expresión `int` o `char` no coincide con ninguna de las etiquetas de caso.

La sintaxis general de una sentencia `switch` es la siguiente:

```java
switch (int-or-char-expression) { 
   case value1:
      una o más líneas de código para ejecutar si el valor de la expresión coincide con  value1
      break; 
   case value2:
      una o más líneas de código para ejecutar si el valor de la expresión coincide con  value2
      break;
   // más etiquetas de case, según sea necesario ...
   case valueN:
      una o más líneas de código para ejecutar si el valor de la expresión coincide con  valueN 
      break;
   default:
      código predeterminado para ejecutar si ninguno de los casos coincide
}
```

Por ejemplo:

```java
// x se supone que se ha declarado previamente como int. 
switch (x) {
   case 1: 
      // se ejecuta si x es igual a 1 
      System.out.println("Uno ..."); 
      break;
   case 2: 
      // se ejecuta si x es igual a 2 
      System.out.println("Dos ..."); 
      break;
   default: 
      // se ejecuta si x tiene un valor diferente de 1 ó 2 
      System.out.println("Ni uno ni dos ...");
}
```

Tenga en cuenta lo siguiente:

* La expresión entre paréntesis que sigue a la palabra clave `switch` debe ser una expresión que evalúe un valor `char` o `int`.
* Los valores que siguen a las etiquetas `case` deben ser valores constantes (un número entero "hardwired" constante o literal de carácter).
* Dos puntos (:), no puntos y coma (;), terminan las etiquetas `case` y `default`.
* Las sentencias que siguen a una etiqueta `case` dada no deben estar entre llaves. Ellas constituyen una lista de sentencias en lugar de un bloque de código.

A diferencia de una instrucción `if`, una instrucción `switch` no se termina automáticamente cuando se encuentra una coincidencia y se ejecuta el código que sigue a la etiqueta `case` coincidente. Para salir de una instrucción `switch`, se debe utilizar una instrucción `break`. Si no se incluye una declaración de interrupción después de una etiqueta `case` determinada, la ejecución "pasará" al siguiente `case` o etiqueta `default`. Este comportamiento se puede utilizar para nuestra ventaja: cuando se va a ejecutar la misma lógica para más de una etiqueta de caso, se pueden apilar dos o más etiquetas `case` una tras otra, como se muestra aquí:


```java
// x se supone que ha sido previamente declarado como int
switch (x) {
   case 1:
      código a ejecutar si x es igual a 1
   case 2:
      código a ejecutar si x es igual a 1 OR 2 
   case 3:
      código a ejecutar si x es igual a 1, 2, OR 3
      break;
   case 4:
       código a ejecutar si x es igual a 4
}
```

### `for` Statements

Una instrucción `for` es una construcción de programación que se utiliza para ejecutar una o más instrucciones un cierto número de veces. La sintaxis general de la instrucción `for` es la siguiente:


```java
for (initializer; condition; iterator) {
   código para ejecutar mientras la condición se evalúa como verdadera
}
```

Una instrucción `for` define tres elementos que están separados por punto y coma y entre paréntesis después de la palabra clave `for`: el **inicializador**, la **condición** y el **iterador**. El ***inicializador*** se utiliza para proporcionar un valor inicial para una **variable de control de bucle**. *La variable puede declararse como parte del inicializador, o puede declararse antes en el código, antes de la instrucción `for`*, por ejemplo:

```java
// La variable de control de bucle 'i' se declara dentro de la instrucción for:
for (int i = 0; condition; iterator) {
    código para ejecutar mientras la condición se evalúa como verdadera
}
// Tenga en cuenta que i ya no es reconocida por el compilador cuando el bucle 'for' termina, 
// porque se declaró efectivamente dentro del bucle 'for'; hablaremos sobre el 
// alcance de una variable más adelante en este capítulo .
```

versus

```java
// La variable de control de bucle 'i' se declara antes del inicio del bucle 'for':
int i;
for (i = 0; condition; iterator) {
   código para ejecutar mientras la condición se evalúa como verdadera
}
```

La ***condición*** es una expresión lógica que normalmente involucra la variable de control de bucle:

```java
for (int i = 0; i < 5; iterator) {
   código para ejecutar siempre que el valor de i sea menor que 5
}
```

El ***iterador*** normalmente incrementa o decrementa la variable de control de bucle:

```java
for (int i = 0; i < 5; i++) {
   código para ejecutar siempre que el valor de i sea menor que 5
}
```

Nuevamente, observe el uso de un punto y coma (;) después del inicializador y la condición, pero no después del iterador.

A continuación, se muestra un desglose de cómo funciona un bucle `for`:

1. Cuando la ejecución del programa alcanza la declaración, el inicializador se ejecuta primero (y sólo una vez).
2. La condición es evaluada.Si la condición evalúada es verdadera, se ejecuta el bloque de código que sigue al paréntesis.
3. Una vez finalizado el bloque de código, se ejecuta la iteración.
4. Luego se evalúa la condición. Si la condición sigue siendo cierta, el bloque de código es una vez más ejecutado, seguido se ejecuta la sentencia del iterador.

Este proceso se repite hasta que la condición se vuelve falsa, momento en el que termina el ciclo `for`. A continuación, se muestra un ejemplo simple que utiliza sentencias `for` anidadas para generar una tabla de multiplicar simple. Las variables de control de bucle, `j` y `k`, se declaran dentro de sus respectivas sentencias `for`. Siempre que se cumplan las condiciones de las instrucciones `for` respectivas, se ejecuta el bloque de código que sigue a la instrucción `for`. El operador `++` se utiliza para incrementar los valores de `j` y `k` cada vez que se ejecuta el bloque de código respectivo.


```java
public class ForDemo {
   public static void main(String[] args) {
      // Calcular una tabla de multiplicar simple. 
      for (int j = 1; j <= 4; j++) {
         for (int k = 1; k <= 4; k++) {
            System.out.println(j + " * " + k + " = " + (j * k));
         } 
      }
   } 
}
```

Aquí la salida:

```sh
1 * 1 = 1 
1 * 2 = 2 
1 * 3 = 3 
1 * 4 = 4 
2 * 1 = 2 
2 * 2 = 4 
2 * 3 = 6 
2 * 4 = 8 
3 * 1 = 3 
3 * 2 = 6 
3 * 3 = 9 
3 * 4 = 12 
4 * 1 = 4 
4 * 2 = 8 
4 * 3 = 12 
4 * 4 = 16
```

Al igual que con otras estructuras de control de flujo, si solo se especifica una declaración después de la condición `for`, se pueden omitir las llaves:

```java
for (int i = 0; i < 3; i++) sum = sum + i;
```

pero se considera una buena práctica de programación utilizar llaves:

```java
for (int i = 0; i < 3; i++) { 
   sum = sum + i;
}
```

### `while` Statements

Una instrucción `while` tiene una función similar a una instrucción `for`, ya que ambas se utilizan para ejecutar repetidamente un bloque de código asociado. Sin embargo, si no es práctico predecir el número de veces que se ejecutará el bloque de código cuando comience el ciclo, una instrucción `while` es la opción preferida, porque una instrucción `while` continúa ejecutándose siempre que se cumpla una condición específica.

La sintaxis general de la instrucción `while` es la siguiente:

```java
while (condition) {
   código para ejecutar repetidamente mientras la condición continúa evaluándose como verdadera
}
```

La condición puede ser una expresión lógica simple o compleja que se evalúa como un valor verdadero o falso, por ejemplo:

```java
int x = 1; 
int y = 1;
while ((x < 20) || (y < 10)) {
   con suerte haremos algo dentro de este cuerpo de bucle que incremente el valor de
   x e y, para evitar un bucle infinito.
}
```

Cuando la ejecución del programa alcanza una instrucción `while`, la condición se evalúa primero. Si la condición es verdadera, se ejecuta el bloque de código que sigue a la condición. Cuando el bloque de código finaliza, la condición se evalúa nuevamente y, si sigue siendo verdadera, el proceso se repite hasta que la condición se evalúa como falsa, momento en el que termina el ciclo `while`.

A continuación, se muestra un ejemplo simple que ilustra el uso de un ciclo `while` para imprimir valores enteros consecutivos de 0 a 3. Una variable booleana denominada `finished` se establece inicialmente en falso. La variable `finished` se usa como bandera: mientras `finished` sea falsa, el bloque de código que sigue al ciclo  `while` continuará ejecutándose. Cuando el valor de `i` llega a 4, el indicador de `finished` se establecerá en verdadero, momento en el que terminará el ciclo  `while`.


```java
public class WhileDemo {
   public static void main(String[] args) {
      boolean finished = false; 
      int i = 0;
      while (!finished) {
         System.out.println(i);
         i++;
         if (i == 4) finished = true; // alternar la bandera para terminar el ciclo
       } 
   }
}
```

Aquí esta la salida:

```sh
0
1
2
3
```

Al igual que con las otras estructuras de control de flujo, si solo se especifica una declaración después de la condición, las llaves se pueden omitir:

```java
while (x < 20) x = x * 2;
```

pero se considera una buena práctica de programación utilizar llaves:

```java
while (x < 20) { 
   x = x * 2;
}
```

## Jump Statements

El lenguaje Java define dos **sentencias de salto** que se utilizan para redirigir la ejecución del programa a otra sentencia en otra parte del código. Los dos tipos de sentencias de salto son las sentencias `break` y `continue`.

Ya ha visto declaraciones de interrupción en acción anteriormente en este capítulo, cuando se usaron junto con sentencias `switch`. También se puede usar una instrucción `break` para terminar abruptamente un bucle `for` o `while`. Cuando se encuentra una instrucción `break` durante la ejecución del ciclo, el ciclo termina inmediatamente y la ejecución del programa se transfiere a la línea de código que sigue inmediatamente al ciclo, como en el siguiente ejemplo:

```java
// Comenzamos con la intención de incrementar x de 1 a 4 ... 
for (int x = 1; x <= 4; x++) {
   // ... pero cuando x alcanza el valor 3, terminamos prematuramente este 
   // ciclo con una sentencia break.
   if (x == 3) break;
   System.out.println(x);
}
System.out.println("Ciclo finalizado");
````

La salida producida por este código es:

```sh
1
2
Ciclo finalizado
```

Una instrucción `continue`, por otro lado, se usa para salir de la iteración actual de un bucle sin terminar la ejecución general del bucle. Es decir, una instrucción `continue` transfiere la ejecución del programa de nuevo al principio del ciclo sin terminar la iteración particular que ya está en progreso; el contador de bucle se incrementa, en el caso de un bucle `for`, y la ejecución continúa.

Veamos el mismo ejemplo que antes, pero reemplazaremos la instrucción `break` con una instrucción `continue`:

// Empezamos con la intención de incrementar x de 1 a 4 ...

```java
// Empezamos con la intención de incrementar x de 1 a 4 ...
for (int x = 1; x <= 4; x++) {
   // ... pero cuando x alcanza el valor 3, terminamos prematuramente 
   // esta iteración del ciclo (solo) con una instrucción continue.
   if (x == 3) continue;
   System.out.println(x); 
}
System.out.println("Ciclo finalizado");
```

La salida producida por este código es:

```sh
1
2
4
Ciclo finalizado
```

## Lenguajes Estructurados en Bloques y el Alcance(Scope) de una Variable

Java (como C y C ++) es un lenguaje estructurado en bloques. Como se mencionó anteriormente en el capítulo, un "bloque" de código es una serie de cero o más líneas de código encerradas entre llaves `{...}`.

Los bloques se pueden anidar unos dentro de otros a cualquier profundidad arbitraria, como se ilustra en el siguiente ejemplo de código:

```java
public class SimpleProgram {
   // Estamos dentro del bloque "class" (un nivel de profundidad). 
   public static void main(String[] args) {
      // Estamos dentro del bloque "main method" (dos niveles de profundidad). 
      int x = 3;
      int y = 4;
      int z = 5;

      if (x > 2) {
         // Ahora estamos un nivel más profundo (nivel 3), en un bloque "if". 
	 if (y > 3) {
            // Estamos un nivel más profundo aún (nivel 4), en un 
	    // bloque "if" anidado.
            // (¡Podriamos seguir y seguir!)
         } // Acabamos de terminar el bloque de nivel 4.
           // (Podríamos tener código adicional aquí, en el nivel 3.) 
      } // ¡El nivel 3 ha terminado!
        // (Podríamos tener código adicional aquí, en el nivel 2.)
   } // ¡Eso es todo para el nivel 2!
     // (Podríamos tener código adicional aquí, en el nivel 1.)
} // Adios, amigos! El nivel 1 (el bloque "class") acaba de finalizar.
```

Las variables se pueden declarar en cualquier bloque dentro de un programa. El **alcance - scope** de una variable es la parte del código en la que se puede hacer referencia a la variable por su nombre, específicamente, desde el punto donde el nombre de la variable se declara por primera vez hasta la llave de cierre (derecha) del bloque de código en el que se declaró. Se dice que una variable está **dentro del alcance** siempre que el compilador reconozca su nombre. *Una vez que la ejecución del programa sale de un bloque de código, las variables que se declararon dentro de ese bloque quedan fuera del alcance y serán inaccesibles para el programa*; el compilador olvida efectivamente que la variable alguna vez fue declarada.

Como ejemplo de las consecuencias del alcance de variable, veamos un programa simple llamado `ScopeExample`. Este programa hace uso de tres bloques de código anidados: uno para el cuerpo de la clase, uno para el cuerpo del método principal y otro como parte de una instrucción `if` dentro del cuerpo del método principal. A su vez, declaramos dos variables: `x`, en el bloque de código principal (en el nivel 2), e `y`, en el bloque `if` (nivel 3).

:fire:
```java
public class ScopeExample { // Inicio del del bloque de nivel 1.
   public static void main(String[] args) { // Inicio del bloque de nivel 2.
      double x = 2.0; // Declara "x" en el bloque de nivel 2.
      if (x < 5.0) { // Inicio del del bloque de nivel 3.
         double y = 1.0; // Declara "y" dentro del bloque de nivel 3. 
	 System.out.println("El valor de x = " + x); // x, declararada en el nivel 2, esta
                                                      // todavía en el ámbito del nivel 3. 
      } // La variable "y" queda fuera de alcance cuando finaliza el bloque "if" (nivel 3) termina.
      
        // "y" ha salido del alcance y el compilador ya no lo reconoce.
       // Si intentamos hacer referencia a "y" en una declaración posterior, el compilador
       // genera un error. "x", por otro lado, permanece en el alcance hasta que 
      // finaliza el método main (nivel 2).
      
      System.out.println("El valor de x = " + x); //  Esto se compilará.
      System.out.println("El valor de y = " + y); //  Esto NO se compilará.
   } // La variable "x" sale del alcance cuando finaliza el bloque del método main (nivel 2).
}
```
  
En el ejemplo anterior, la variable `y` sale del alcance tan pronto como finaliza el bloque `if`. Si intentamos acceder a `y` más adelante en el programa, como hacemos en la línea en negrita del código anterior, el compilador generará el siguiente mensaje de error:
    
```sh
cannot resolve symbol
symbol : variable y
System.out.println("The value of y = " + y);
                                         ^
```

Tenga en cuenta que una variable determinada es accesible para cualquier bloque de código interno ***anidado*** que siga a su declaración. Por ejemplo, en el programa `ScopeExample` anterior, la variable `x`, declarada en el nivel del bloque de método `main` (nivel 2), es accesible dentro del bloque de código de instrucción `if` (nivel 3).

## Printing to the Screen

La mayoría de las aplicaciones comunican información a los usuarios mostrando mensajes a través de la GUI de una aplicación. Sin embargo, en ocasiones también es útil poder mostrar mensajes de texto simples en la ventana de la línea de comandos desde la que estamos ejecutando un programa como *una forma rápida y sucia* de verificar que un programa está funcionando correctamente. Hasta que analicemos cómo crear una GUI de Java en los capítulos 16 y 17, esta será la forma principal de comunicación de nuestro programa con el mundo exterior.

Para imprimir mensajes de texto en la pantalla, usamos la siguiente sintaxis:

```java
System.out.println(expression to be printed);
```

El método `System.out.println` puede aceptar expresiones muy complejas y hace todo lo posible para convertirlas en un solo valor de cadena, que luego se muestra en la pantalla. Aquí están algunos ejemplos:

```java
System.out.println("Hi!"); 	// Imprimiendo una cadena literal/constante.

String s = "Hi!"; 
System.out.println(s);		// Imprimiendo el valor de una variable String.

String t = "foo";
String u = "bar"; 
System.out.println(t + u + "!");// Usando el operador de concatenación de cadenas (+) 
				// para imprimir "foobar!".

int x = 3;
int y = 4; 
System.out.println(x);		// Imprime la representación String del
				// valor entero 3 en la pantalla.
System.out.println(x + y);	// Calcula la suma de x e y, luego imprime la 
				// Representación de cadena del valor entero 7 
				// en la pantalla.
```

Tenga en cuenta que en la última línea de código, el signo más (+) se interpreta como el operador de suma, no como el operador de concatenación de cadenas, porque separa dos variables que se declaran ambas de tipo `int`. Entonces, la suma de `3 + 4` se calcula como `7`, que luego se imprime. En el siguiente ejemplo, sin embargo, obtenemos un comportamiento diferente (y posiblemente no deseado):

```java
System.out.println("La suma de x más y es: " + x + y);
```

La línea anterior de código hace que se imprima lo siguiente:

```sh
La suma de x más y es: 34
```

¿Por qué es esto? Recuerde que evaluamos expresiones de izquierda a derecha, por lo que, dado que el primero de los dos signos más separa un literal de cadena y un `int`

```java
System.out.println("La suma de x más y es: " + x + y);
```

el primer signo más se interpreta como un operador de concatenación de cadenas, produciendo el valor intermedio de cadena "La suma de x más y es: 3". El segundo signo más separa este valor de cadena intermedio de un `int`, por lo que el segundo signo más también se interpreta como un operador de concatenación de cadenas, el valor de cadena final `"La suma de x más y es: 34"`, que se imprime en la ventana de comandos.

Para imprimir la suma correcta de `x` e `y`, debemos forzar que el segundo signo más se interprete como un operador de suma entera encerrando la expresión de suma entre paréntesis anidados:

```java
System.out.println("La suma de x más y es: " + (x + y));
```

Los paréntesis anidados hacen que la expresión más interna se evalúe primero, calculando así la suma de `x + y` correctamente. Por lo tanto, esta declaración `println` muestra el mensaje correcto en la pantalla:

```sh
La suma de x más y es: 7
```

Al escribir código que involucra expresiones complejas, es una buena idea usar paréntesis libremente para dejar claras sus intenciones al compilador. Los paréntesis adicionales, cuando se usan correctamente, ¡nunca hacen daño!

### print vs. println

Cuando llamamos al método `System.out.println`, se imprimirá cualquier expresión entre paréntesis, seguida de un terminador de línea (dependiente de la plataforma). El siguiente fragmento de código

```java
System.out.println("Primer línea."); 
System.out.println("Segunda línea."); 
System.out.println("Tercer línea.");
```

Produce tres líneas separadas en la salida:

```sh
Primer línea.
Segunda línea.
Tercer línea.
```

En contraste la sentencia:

```java
System.out.print(expresión a ser impresa);
```

hace que cualquier expresión que esté entre paréntesis se imprima sin un terminador de línea final. El uso de `print` en combinación con `println` nos permite generar una sola línea de salida a través de una serie de declaraciones de Java, como se muestra en el siguiente ejemplo:

```java
System.out.print("J");  // Usando print aquí
System.out.print("AV"); // Usando print aquí
System.out.println("A!!!"); // Note el uso de println en la última sentencia
```

Este fragmento de código produce una sola línea de salida:

```sh
JAVA!!!
```

Cuando una sola sentencia `print` se vuelve demasiado larga para caber en una sola línea, como en este ejemplo:

