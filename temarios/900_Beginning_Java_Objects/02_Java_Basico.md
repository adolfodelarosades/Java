# 02 Java Básico

Java está orientado a objetos en su esencia. ***Casi todo*** en Java es un objeto:

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

```sh

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




